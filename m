Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC57602ECE
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Oct 2022 16:51:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsGyH1sNpz3dqj
	for <lists+linux-aspeed@lfdr.de>; Wed, 19 Oct 2022 01:51:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=yangyingliang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsGy911hxz3bjd;
	Wed, 19 Oct 2022 01:50:52 +1100 (AEDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MsGrW3cL0z1P76C;
	Tue, 18 Oct 2022 22:46:03 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 22:50:46 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 18 Oct
 2022 22:50:45 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-aspeed@lists.ozlabs.org>, <linux-fsi@lists.ozlabs.org>
Subject: [PATCH 1/2] fsi: aspeed: fix master device refcount leak
Date: Tue, 18 Oct 2022 22:49:57 +0800
Message-ID: <20221018144958.1972563-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: alistair@popple.id.au, jk@ozlabs.org, yangyingliang@huawei.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

If fsi_master_register() fails, put_device() need be called to decrease
refcount to 0, so that the name allocated in dev_set_name() can be freed
in callback function kobject_cleanup().

Besides, the refcount is hold in fsi_master_aspeed_probe(), it need be put
in fsi_master_aspeed_remove().

Fixes: 606397d67f41 ("fsi: Add ast2600 master driver")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/fsi/fsi-master-aspeed.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 7cec1772820d..a72dbfe2addc 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -624,8 +624,11 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	aspeed_master_init(aspeed);
 
 	rc = fsi_master_register(&aspeed->master);
-	if (rc)
+	if (rc) {
+		put_device(&aspeed->master.dev);
+		aspeed = NULL;
 		goto err_release;
+	}
 
 	/* At this point, fsi_master_register performs the device_initialize(),
 	 * and holds the sole reference on master.dev. This means the device
@@ -651,6 +654,7 @@ static int fsi_master_aspeed_remove(struct platform_device *pdev)
 	fsi_master_unregister(&aspeed->master);
 	clk_disable_unprepare(aspeed->clk);
 
+	put_device(&aspeed->master.dev);
 	return 0;
 }
 
-- 
2.25.1

