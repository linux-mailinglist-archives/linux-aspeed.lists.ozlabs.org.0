Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 096DF602ECD
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Oct 2022 16:51:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsGyD5CNsz3c71
	for <lists+linux-aspeed@lfdr.de>; Wed, 19 Oct 2022 01:51:00 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=yangyingliang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsGy86xWCz3bjW;
	Wed, 19 Oct 2022 01:50:53 +1100 (AEDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MsGxr28HFzHtyD;
	Tue, 18 Oct 2022 22:50:40 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 22:50:46 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 18 Oct
 2022 22:50:46 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-aspeed@lists.ozlabs.org>, <linux-fsi@lists.ozlabs.org>
Subject: [PATCH 2/2] fsi: aspeed: fix node refcount leak
Date: Tue, 18 Oct 2022 22:49:58 +0800
Message-ID: <20221018144958.1972563-2-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221018144958.1972563-1-yangyingliang@huawei.com>
References: <20221018144958.1972563-1-yangyingliang@huawei.com>
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

The node refcount is hold in fsi_master_aspeed_probe(), it need be put in
fsi_master_aspeed_remove() and in error path in fsi_master_aspeed_probe().

Fixes: 606397d67f41 ("fsi: Add ast2600 master driver")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/fsi/fsi-master-aspeed.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index a72dbfe2addc..8160e781dc04 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -625,6 +625,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 
 	rc = fsi_master_register(&aspeed->master);
 	if (rc) {
+		of_node_put(aspeed->master.dev.of_node);
 		put_device(&aspeed->master.dev);
 		aspeed = NULL;
 		goto err_release;
@@ -654,6 +655,7 @@ static int fsi_master_aspeed_remove(struct platform_device *pdev)
 	fsi_master_unregister(&aspeed->master);
 	clk_disable_unprepare(aspeed->clk);
 
+	of_node_put(aspeed->master.dev.of_node);
 	put_device(&aspeed->master.dev);
 	return 0;
 }
-- 
2.25.1

