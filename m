Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C63865573C
	for <lists+linux-aspeed@lfdr.de>; Sat, 24 Dec 2022 02:33:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nf64p1SZQz3bct
	for <lists+linux-aspeed@lfdr.de>; Sat, 24 Dec 2022 12:33:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T4lV5j3D;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T4lV5j3D;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nf64j0Sdyz2x9v
	for <linux-aspeed@lists.ozlabs.org>; Sat, 24 Dec 2022 12:33:09 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AC43FB821B4;
	Sat, 24 Dec 2022 01:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297BBC433EF;
	Sat, 24 Dec 2022 01:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671845583;
	bh=m7RYbdCtdTyobCvML/GmRq/7Oin1VziRpdb1dYoMzFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T4lV5j3D5S5Yqy7X1FiyHhkCXSUyCAw2VqYJVh2SfMVe2EdMrNPnEWVJ2JT1OvRUO
	 s+PUtwimxVzAIoU3ltt7GxFuKJ4BrMO5RZbs43oWcJBKEuRbfb8UC/F0vBIXQkx/uc
	 LujN9Wsza9ttMedyVkuWYw5EBexPItuyNsvYlZJQ0chYEPlXda0DCHDAeWZiDSVK6v
	 AKnStDm2mgDRjyB1uzyzFTMbedCPT3TSkiLhAfpYHgJ5vg44NZiS66xhN7zV+ay5Zw
	 uwnjN2z39ajkG94cfn2T9DcSkXYonnT76ta0r1ena3XnLbGlb25M9gE3gEVV7iUdsR
	 QYxV7P5BR8M7Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 2/6] usb: gadget: aspeed: fix buffer overflow
Date: Fri, 23 Dec 2022 20:32:50 -0500
Message-Id: <20221224013254.393646-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221224013254.393646-1-sashal@kernel.org>
References: <20221224013254.393646-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Henry Tian <tianxiaofeng@bytedance.com>, linux-aspeed@lists.ozlabs.org, Neal Liu <neal_liu@aspeedtech.com>, linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, jakobkoschel@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Henry Tian <tianxiaofeng@bytedance.com>

[ Upstream commit 83045e19feae937c425248824d1dc0fc95583842 ]

In ast_vhub_epn_handle_ack() when the received data length exceeds the
buffer, it does not check the case and just copies to req.buf and cause
a buffer overflow, kernel oops on this case.

This issue could be reproduced on a BMC with an OS that enables the
lan over USB:
1. In OS, enable the usb eth dev, verify it pings the BMC OK;
2. In OS, set the usb dev mtu to 2000. (Default is 1500);
3. In OS, ping the BMC with `-s 2000` argument.

The BMC kernel will get oops with below logs:

    skbuff: skb_over_panic: text:8058e098 len:2048 put:2048 head:84c678a0 data:84c678c2 tail:0x84c680c2 end:0x84c67f00 dev:usb0
    ------------[ cut here ]------------
    kernel BUG at net/core/skbuff.c:113!
    Internal error: Oops - BUG: 0 [#1] ARM
    CPU: 0 PID: 0 Comm: swapper Not tainted 5.15.69-c9fb275-dirty-d1e579a #1
    Hardware name: Generic DT based system
    PC is at skb_panic+0x60/0x6c
    LR is at irq_work_queue+0x6c/0x94

Fix the issue by checking the length and set `-EOVERFLOW`.

Tested: Verify the BMC kernel does not get oops in the above case, and
the usb ethernet gets RX packets errors instead.

Signed-off-by: Lei YU <yulei.sh@bytedance.com>
Signed-off-by: Henry Tian <tianxiaofeng@bytedance.com>
Reviewed-by: Neal Liu <neal_liu@aspeedtech.com>
Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Link: https://lore.kernel.org/r/20221024094853.2877441-1-yulei.sh@bytedance.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/gadget/udc/aspeed-vhub/core.c |  2 +-
 drivers/usb/gadget/udc/aspeed-vhub/epn.c  | 16 ++++++++++++----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
index 902e61be4d64..7ce4dc132da3 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -42,7 +42,7 @@ void ast_vhub_done(struct ast_vhub_ep *ep, struct ast_vhub_req *req,
 
 	list_del_init(&req->queue);
 
-	if (req->req.status == -EINPROGRESS)
+	if ((req->req.status == -EINPROGRESS) ||  (status == -EOVERFLOW))
 		req->req.status = status;
 
 	if (req->req.dma) {
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/epn.c b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
index 931f540a747e..32c381b3ed40 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/epn.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
@@ -89,6 +89,7 @@ static void ast_vhub_epn_handle_ack(struct ast_vhub_ep *ep)
 {
 	struct ast_vhub_req *req;
 	unsigned int len;
+	int status = 0;
 	u32 stat;
 
 	/* Read EP status */
@@ -124,9 +125,15 @@ static void ast_vhub_epn_handle_ack(struct ast_vhub_ep *ep)
 	len = VHUB_EP_DMA_TX_SIZE(stat);
 
 	/* If not using DMA, copy data out if needed */
-	if (!req->req.dma && !ep->epn.is_in && len)
-		memcpy(req->req.buf + req->req.actual, ep->buf, len);
-
+	if (!req->req.dma && !ep->epn.is_in && len) {
+		if (req->req.actual + len > req->req.length) {
+			req->last_desc = 1;
+			status = -EOVERFLOW;
+			goto done;
+		} else {
+			memcpy(req->req.buf + req->req.actual, ep->buf, len);
+		}
+	}
 	/* Adjust size */
 	req->req.actual += len;
 
@@ -134,9 +141,10 @@ static void ast_vhub_epn_handle_ack(struct ast_vhub_ep *ep)
 	if (len < ep->ep.maxpacket)
 		req->last_desc = 1;
 
+done:
 	/* That's it ? complete the request and pick a new one */
 	if (req->last_desc >= 0) {
-		ast_vhub_done(ep, req, 0);
+		ast_vhub_done(ep, req, status);
 		req = list_first_entry_or_null(&ep->queue, struct ast_vhub_req,
 					       queue);
 
-- 
2.35.1

