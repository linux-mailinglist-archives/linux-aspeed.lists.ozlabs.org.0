Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 574397BC628
	for <lists+linux-aspeed@lfdr.de>; Sat,  7 Oct 2023 10:44:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2f4F3Jkfz3dy3
	for <lists+linux-aspeed@lfdr.de>; Sat,  7 Oct 2023 19:44:45 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2f413PwVz3c8x;
	Sat,  7 Oct 2023 19:44:28 +1100 (AEDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4S2dzG24c5zNpCp;
	Sat,  7 Oct 2023 16:40:26 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Sat, 7 Oct
 2023 16:44:20 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	Eddie James <eajames@linux.ibm.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Jammy
 Huang <jammy_huang@aspeedtech.com>
Subject: [PATCH v2] media: aspeed: Drop unnecessary error check for debugfs_create_file()
Date: Sat, 7 Oct 2023 16:43:39 +0800
Message-ID: <20231007084339.3160130-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
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
Cc: ruanjinjie@huawei.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

debugfs_create_file() return ERR_PTR and never return NULL.

When calling debugfs functions, there is no need to ever check the
return value. The function can work or not, but the code logic should
never do something different based on this.

Fixes: 52fed10ad756 ("media: aspeed: add debugfs")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
v2:
- Remove the err check instead of using IS_ERR to replace NULL check.
- Add suggested-by.
- Update the commit title and message.
---
 drivers/media/platform/aspeed/aspeed-video.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index a9c2c69b2ed9..d08aa7f73d4f 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -1970,22 +1970,15 @@ static void aspeed_video_debugfs_remove(struct aspeed_video *video)
 	debugfs_entry = NULL;
 }
 
-static int aspeed_video_debugfs_create(struct aspeed_video *video)
+static void aspeed_video_debugfs_create(struct aspeed_video *video)
 {
 	debugfs_entry = debugfs_create_file(DEVICE_NAME, 0444, NULL,
 					    video,
 					    &aspeed_video_debugfs_fops);
-	if (!debugfs_entry)
-		aspeed_video_debugfs_remove(video);
-
-	return !debugfs_entry ? -EIO : 0;
 }
 #else
 static void aspeed_video_debugfs_remove(struct aspeed_video *video) { }
-static int aspeed_video_debugfs_create(struct aspeed_video *video)
-{
-	return 0;
-}
+static void aspeed_video_debugfs_create(struct aspeed_video *video) { }
 #endif /* CONFIG_DEBUG_FS */
 
 static int aspeed_video_setup_video(struct aspeed_video *video)
@@ -2198,9 +2191,7 @@ static int aspeed_video_probe(struct platform_device *pdev)
 		return rc;
 	}
 
-	rc = aspeed_video_debugfs_create(video);
-	if (rc)
-		dev_err(video->dev, "debugfs create failed\n");
+	aspeed_video_debugfs_create(video);
 
 	return 0;
 }
-- 
2.34.1

