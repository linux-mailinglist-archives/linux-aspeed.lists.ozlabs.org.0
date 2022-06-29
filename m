Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49792579328
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Jul 2022 08:28:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ln86x0x4wz2xkR
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Jul 2022 16:28:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LD2k1fnO;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=mailmesebin00@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LD2k1fnO;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXvGR0k5bz2xXS
	for <linux-aspeed@lists.ozlabs.org>; Wed, 29 Jun 2022 18:07:58 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id jb13so13377142plb.9
        for <linux-aspeed@lists.ozlabs.org>; Wed, 29 Jun 2022 01:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=26ZIBRUEZIPtCeugGBeQrsgT3aaPi/jFrSW3XtqmO4E=;
        b=LD2k1fnO3PEvw5iSj+odGBaj3uUJ/1bZXafHiHJr8dwAQMh7HAro80QefSH/JLvsY/
         9sVfjCsCTwTv1NgQt+NxnMlz9HWC6fsejYqt30mAbe9+ExgjCwO4Kmmak2r5UC6RsJCL
         8KKLQeTQjogfO0ePGfWqS0wNbZHCQq3mmG1tZQTkntPEPx2ch1LPrxVCROG63Rv0w/Xf
         56VD/0HfdhM9EPbPE2o0Qjsrjh4U6qLgIYafgkpLjc5IWUESAZS4q5EPhmJhUoR7Af1I
         5UrMChIu5XMEHhzVLRVqnYjj24lrm6dtT1PU81wYmPPhJ09bYSI1o61PDN2VphUf/6lI
         EQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=26ZIBRUEZIPtCeugGBeQrsgT3aaPi/jFrSW3XtqmO4E=;
        b=ol4zhnR2/fw8VK2Juhb3CJo1q53FDJVAdNr4Hv6KH0dvO/qnghjxX6DgLVOrqosLQz
         F0YDJ36rIhaqdfMaHOZnjiQMF9NED96651zKUusn9THp7TAhah6k7SRTc+QADXKvEcQQ
         eajvYDEUS4yxeUr3zBFsw6uYQqEs5y5pxCyMFjgdsJJykKo1hNhWWzZnc8ES06WXwTV5
         7RlUEXKFTSTsMUk97HBkffQz+tiCcC+92g7XAwumDMGqaE8/DhfiAgUt2hU3UXXjbQGY
         MxLv3REBZYb9UlQ4R+O1rxIMGerlUJr2DogMo/PbIbGC5DXWxrqykZinKZH7Bpnb7Oa/
         905Q==
X-Gm-Message-State: AJIora9audj6ZtTrlsinT4K5RN8TpowWcrrC2AY9sLNWOu5DNTMtjs/V
	4VdOFzxkbVfUdXlbty8MdGU=
X-Google-Smtp-Source: AGRyM1tilyHqgJTXrJU1LG7dIY6Y7oBwOtiPbyUrYr/8vnrGlc6jHnz2pPhlEKAouHlMINKMc7UTTw==
X-Received: by 2002:a17:90b:4b8c:b0:1ec:c7b8:7cb9 with SMTP id lr12-20020a17090b4b8c00b001ecc7b87cb9mr4345566pjb.86.1656490075939;
        Wed, 29 Jun 2022 01:07:55 -0700 (PDT)
Received: from sebin-inspiron.bbrouter ([103.160.233.84])
        by smtp.gmail.com with ESMTPSA id kk2-20020a17090b4a0200b001cd4989febcsm1398292pjb.8.2022.06.29.01.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 01:07:55 -0700 (PDT)
From: SebinSebastian <mailmesebin00@gmail.com>
To: 
Subject: [PATCH -next] usb: gadget: dereference before null check
Date: Wed, 29 Jun 2022 13:37:25 +0530
Message-Id: <20220629080726.107297-1-mailmesebin00@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 19 Jul 2022 16:26:55 +1000
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Neal Liu <neal_liu@aspeedtech.com>, mailmesebin00@gmail.com, skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Fix coverity warning dereferencing before null check. _ep and desc is
dereferenced on all paths until the check for null. Move the
initializations after the check for null.
Coverity issue: 1518209

Signed-off-by: SebinSebastian <mailmesebin00@gmail.com>
---
 drivers/usb/gadget/udc/aspeed_udc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index d75a4e070bf7..96f8193fca15 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -341,10 +341,6 @@ static void ast_udc_stop_activity(struct ast_udc_dev *udc)
 static int ast_udc_ep_enable(struct usb_ep *_ep,
 			     const struct usb_endpoint_descriptor *desc)
 {
-	u16 maxpacket = usb_endpoint_maxp(desc);
-	struct ast_udc_ep *ep = to_ast_ep(_ep);
-	struct ast_udc_dev *udc = ep->udc;
-	u8 epnum = usb_endpoint_num(desc);
 	unsigned long flags;
 	u32 ep_conf = 0;
 	u8 dir_in;
@@ -356,6 +352,11 @@ static int ast_udc_ep_enable(struct usb_ep *_ep,
 		return -EINVAL;
 	}

+	u16 maxpacket = usb_endpoint_maxp(desc);
+	struct ast_udc_ep *ep = to_ast_ep(_ep);
+	struct ast_udc_dev *udc = ep->udc;
+	u8 epnum = usb_endpoint_num(desc);
+
 	if (!udc->driver) {
 		EP_DBG(ep, "bogus device state\n");
 		return -ESHUTDOWN;
--
2.34.1

