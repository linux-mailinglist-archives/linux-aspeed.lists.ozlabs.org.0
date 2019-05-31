Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 548A03171D
	for <lists+linux-aspeed@lfdr.de>; Sat,  1 Jun 2019 00:16:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FzLv1H7vzDqch
	for <lists+linux-aspeed@lfdr.de>; Sat,  1 Jun 2019 08:16:39 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FzLJ5sVXzDqZG
 for <linux-aspeed@lists.ozlabs.org>; Sat,  1 Jun 2019 08:16:08 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 May 2019 15:16:05 -0700
X-ExtLoop1: 1
Received: from maru.jf.intel.com ([10.54.51.75])
 by orsmga001.jf.intel.com with ESMTP; 31 May 2019 15:16:05 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH v3 10/10] media: aspeed: add a workaround to fix a silicon bug
Date: Fri, 31 May 2019 15:15:48 -0700
Message-Id: <20190531221548.14757-11-jae.hyun.yoo@linux.intel.com>
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

AST2500 silicon revision A1 and A2 have a silicon bug which causes
extremly long capturing time on specific resolutions (1680 width).
To fix the bug, this commit adjusts the capturing window register
setting to 1728 if detected width is 1680. The compression window
register setting will be kept as the original width so output
result will be the same.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
v2 -> v3:
 Added more detail comments why the value 1728 is picked.

v1 -> v2:
 New.

 drivers/media/platform/aspeed-video.c | 28 ++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index ba093096a5a7..f899ac3b4a61 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -824,8 +824,29 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
 	struct v4l2_bt_timings *act = &video->active_timings;
 	unsigned int size = act->width * act->height;
 
+	/* Set capture/compression frame sizes */
 	aspeed_video_calc_compressed_size(video, size);
 
+	if (video->active_timings.width == 1680) {
+		/*
+		 * This is a workaround to fix a silicon bug on A1 and A2
+		 * revisions. Since it doesn't break capturing operation of
+		 * other revisions, use it for all revisions without checking
+		 * the revision ID. It picked 1728 which is a very next
+		 * 64-pixels aligned value to 1680 to minimize memory bandwidth
+		 * and to get better access speed from video engine.
+		 */
+		aspeed_video_write(video, VE_CAP_WINDOW,
+				   1728 << 16 | act->height);
+		size += (1728 - 1680) * video->active_timings.height;
+	} else {
+		aspeed_video_write(video, VE_CAP_WINDOW,
+				   act->width << 16 | act->height);
+	}
+	aspeed_video_write(video, VE_COMP_WINDOW,
+			   act->width << 16 | act->height);
+	aspeed_video_write(video, VE_SRC_SCANLINE_OFFSET, act->width * 4);
+
 	/* Don't use direct mode below 1024 x 768 (irqs don't fire) */
 	if (size < DIRECT_FETCH_THRESHOLD) {
 		aspeed_video_write(video, VE_TGS_0,
@@ -842,13 +863,6 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
 		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_DIRECT_FETCH);
 	}
 
-	/* Set capture/compression frame sizes */
-	aspeed_video_write(video, VE_CAP_WINDOW,
-			   act->width << 16 | act->height);
-	aspeed_video_write(video, VE_COMP_WINDOW,
-			   act->width << 16 | act->height);
-	aspeed_video_write(video, VE_SRC_SCANLINE_OFFSET, act->width * 4);
-
 	size *= 4;
 
 	if (size != video->srcs[0].size) {
-- 
2.21.0

