Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF5731719
	for <lists+linux-aspeed@lfdr.de>; Sat,  1 Jun 2019 00:16:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FzLj2sWvzDqZQ
	for <lists+linux-aspeed@lfdr.de>; Sat,  1 Jun 2019 08:16:29 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FzLH4dZrzDqZG
 for <linux-aspeed@lists.ozlabs.org>; Sat,  1 Jun 2019 08:16:07 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 May 2019 15:16:02 -0700
X-ExtLoop1: 1
Received: from maru.jf.intel.com ([10.54.51.75])
 by orsmga001.jf.intel.com with ESMTP; 31 May 2019 15:16:02 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH v3 07/10] media: aspeed: refine interrupt handling logic
Date: Fri, 31 May 2019 15:15:45 -0700
Message-Id: <20190531221548.14757-8-jae.hyun.yoo@linux.intel.com>
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

There are cases that interrupt bits are cleared by a 500ms delayed
work which causes unnecessary irq calls. Also, the current
interrupt handler returns IRQ_HANDLED always but it should return
IRQ_NONE if there is any unhandled interrupt. So this commit
refines the interrupt handling logic to fix these issues.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Eddie James <eajames@linux.ibm.com>
---
v2 -> v3:
 None.

v1 -> v2:
 None.

 drivers/media/platform/aspeed-video.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 1cba582918cc..c0b889141b8f 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -488,6 +488,7 @@ static void aspeed_video_off(struct aspeed_video *video)
 
 	/* Disable interrupts */
 	aspeed_video_write(video, VE_INTERRUPT_CTRL, 0);
+	aspeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff);
 
 	/* Turn off the relevant clocks */
 	clk_disable(video->vclk);
@@ -554,7 +555,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 					    VE_INTERRUPT_MODE_DETECT, 0);
 			aspeed_video_write(video, VE_INTERRUPT_STATUS,
 					   VE_INTERRUPT_MODE_DETECT);
-
+			sts &= ~VE_INTERRUPT_MODE_DETECT;
 			set_bit(VIDEO_MODE_DETECT_DONE, &video->flags);
 			wake_up_interruptible_all(&video->wait);
 		} else {
@@ -599,12 +600,12 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 				    VE_INTERRUPT_COMP_COMPLETE, 0);
 		aspeed_video_write(video, VE_INTERRUPT_STATUS,
 				   VE_INTERRUPT_COMP_COMPLETE);
-
+		sts &= ~VE_INTERRUPT_COMP_COMPLETE;
 		if (test_bit(VIDEO_STREAMING, &video->flags) && buf)
 			aspeed_video_start_frame(video);
 	}
 
-	return IRQ_HANDLED;
+	return sts ? IRQ_NONE : IRQ_HANDLED;
 }
 
 static void aspeed_video_check_and_set_polarity(struct aspeed_video *video)
-- 
2.21.0

