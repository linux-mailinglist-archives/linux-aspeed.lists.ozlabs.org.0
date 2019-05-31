Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5663171A
	for <lists+linux-aspeed@lfdr.de>; Sat,  1 Jun 2019 00:16:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FzLl3H7bzDqcQ
	for <lists+linux-aspeed@lfdr.de>; Sat,  1 Jun 2019 08:16:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (helo) smtp.helo=mga12.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FzLH4SwpzDqZF
 for <linux-aspeed@lists.ozlabs.org>; Sat,  1 Jun 2019 08:16:07 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 May 2019 15:16:00 -0700
X-ExtLoop1: 1
Received: from maru.jf.intel.com ([10.54.51.75])
 by orsmga001.jf.intel.com with ESMTP; 31 May 2019 15:16:00 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH v3 05/10] media: aspeed: reduce noisy log printing outs
Date: Fri, 31 May 2019 15:15:43 -0700
Message-Id: <20190531221548.14757-6-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190531221548.14757-1-jae.hyun.yoo@linux.intel.com>
References: <20190531221548.14757-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Currently, this driver prints out too much log messages when a
mode change happens, video turned off by screen saver and etc.
Actually, all cases are reported to user space properly. Also,
these are not critical errors but recoverable things, so this
commit changes the log level of some noisy printing outs.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Eddie James <eajames@linux.ibm.com>
---
v2 -> v3:
 None.

v1 -> v2:
 None.

 drivers/media/platform/aspeed-video.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index d1b541409544..92abdfc79e76 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -441,7 +441,7 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
 
 	if (!(seq_ctrl & VE_SEQ_CTRL_COMP_BUSY) ||
 	    !(seq_ctrl & VE_SEQ_CTRL_CAP_BUSY)) {
-		dev_err(video->dev, "Engine busy; don't start frame\n");
+		dev_dbg(video->dev, "Engine busy; don't start frame\n");
 		return -EBUSY;
 	}
 
@@ -769,7 +769,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 						      res_check(video),
 						      MODE_DETECT_TIMEOUT);
 		if (!rc) {
-			dev_err(video->dev, "Timed out; first mode detect\n");
+			dev_dbg(video->dev, "Timed out; first mode detect\n");
 			clear_bit(VIDEO_RES_DETECT, &video->flags);
 			return;
 		}
@@ -787,7 +787,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 						      MODE_DETECT_TIMEOUT);
 		clear_bit(VIDEO_RES_DETECT, &video->flags);
 		if (!rc) {
-			dev_err(video->dev, "Timed out; second mode detect\n");
+			dev_dbg(video->dev, "Timed out; second mode detect\n");
 			return;
 		}
 
@@ -821,7 +821,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 	} while (invalid_resolution && (tries++ < INVALID_RESOLUTION_RETRIES));
 
 	if (invalid_resolution) {
-		dev_err(video->dev, "Invalid resolution detected\n");
+		dev_dbg(video->dev, "Invalid resolution detected\n");
 		return;
 	}
 
@@ -1456,7 +1456,7 @@ static void aspeed_video_stop_streaming(struct vb2_queue *q)
 				!test_bit(VIDEO_FRAME_INPRG, &video->flags),
 				STOP_TIMEOUT);
 	if (!rc) {
-		dev_err(video->dev, "Timed out when stopping streaming\n");
+		dev_dbg(video->dev, "Timed out when stopping streaming\n");
 
 		/*
 		 * Need to force stop any DMA and try and get HW into a good
-- 
2.21.0

