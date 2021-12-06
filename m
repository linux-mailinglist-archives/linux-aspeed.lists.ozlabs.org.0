Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A430468E61
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Dec 2021 01:49:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J6lDV0GRMz2yS3
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Dec 2021 11:48:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=jammy_huang@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J6lDQ4Swtz2xXs;
 Mon,  6 Dec 2021 11:48:52 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1B60NNMV022616;
 Mon, 6 Dec 2021 08:23:23 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 6 Dec 2021 08:48:13 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <hverkuil-cisco@xs4all.nl>, <sakari.ailus@linux.intel.com>,
 <gregkh@linuxfoundation.org>, <laurent.pinchart@ideasonboard.com>,
 <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <linux-media@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] media: aspeed: move err-handling together to the bottom
Date: Mon, 6 Dec 2021 08:48:11 +0800
Message-ID: <20211206004811.1118-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1B60NNMV022616
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

refine aspeed_video_setup_video() flow.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
v2:
 - remove change-id in comment
---
 drivers/media/platform/aspeed-video.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index fea5e4d0927e..f5c40d6b4ece 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -1641,11 +1641,8 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
 
 	rc = video->ctrl_handler.error;
 	if (rc) {
-		v4l2_ctrl_handler_free(&video->ctrl_handler);
-		v4l2_device_unregister(v4l2_dev);
-
 		dev_err(video->dev, "Failed to init controls: %d\n", rc);
-		return rc;
+		goto err_ctrl_init;
 	}
 
 	v4l2_dev->ctrl_handler = &video->ctrl_handler;
@@ -1663,11 +1660,8 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
 
 	rc = vb2_queue_init(vbq);
 	if (rc) {
-		v4l2_ctrl_handler_free(&video->ctrl_handler);
-		v4l2_device_unregister(v4l2_dev);
-
 		dev_err(video->dev, "Failed to init vb2 queue\n");
-		return rc;
+		goto err_vb2_init;
 	}
 
 	vdev->queue = vbq;
@@ -1685,15 +1679,19 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
 	video_set_drvdata(vdev, video);
 	rc = video_register_device(vdev, VFL_TYPE_GRABBER, 0);
 	if (rc) {
-		vb2_queue_release(vbq);
-		v4l2_ctrl_handler_free(&video->ctrl_handler);
-		v4l2_device_unregister(v4l2_dev);
-
 		dev_err(video->dev, "Failed to register video device\n");
-		return rc;
+		goto err_video_reg;
 	}
 
 	return 0;
+
+err_video_reg:
+	vb2_queue_release(vbq);
+err_vb2_init:
+err_ctrl_init:
+	v4l2_ctrl_handler_free(&video->ctrl_handler);
+	v4l2_device_unregister(v4l2_dev);
+	return rc;
 }
 
 static int aspeed_video_init(struct aspeed_video *video)
-- 
2.25.1

