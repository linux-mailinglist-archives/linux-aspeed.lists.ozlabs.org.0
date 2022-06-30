Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1459857932F
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Jul 2022 08:29:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ln87F6wyfz3dsB
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Jul 2022 16:29:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R8G4t3pa;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=mailmesebin00@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R8G4t3pa;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYQmj1qRSz3bmr
	for <linux-aspeed@lists.ozlabs.org>; Thu, 30 Jun 2022 14:47:32 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id 136so11914364pfy.10
        for <linux-aspeed@lists.ozlabs.org>; Wed, 29 Jun 2022 21:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d/LwGnwJFIJV7K53c+DsH+tZERwXfagasgIpZ1ZeuBA=;
        b=R8G4t3papCLEX6yaZKnb5i3sFJW9qgNgt+VV2xfw1MckXIuCXSSMkA2UTybf9rQInS
         cZ5/t5147kjTqFuxNknpxtCo9tKkWjoupSin1q1PCjfRwOnH7kdXp9W3r+RJOxac4gMW
         TmhwoIxP4I09sILg67g0diaEoeKGQy8EAZUJUCVsUnMe+XUW0E5XrhYpq8CUVTacBnsF
         u9QaoA9m1UwCX/qHJGNZbOZAUQ67e76OekwdAG1Y6Dii93JeCLXo4+dnjJ2CqIjpCsCu
         DpzUKhFr2neaQFgBrXZKJ6GzvYdH6rxGGf1Ztr7oxaiR/sgzvCSDKFWVlh1tgP2bmXHd
         JSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d/LwGnwJFIJV7K53c+DsH+tZERwXfagasgIpZ1ZeuBA=;
        b=SfsdHxEQfIndRNx0AsNdc5meWkEnCVlj40al3GoWCEhblpcNxovrh3kFSS7Y3DL+C3
         upLYzYf87+FFyBGZrOlqrXH1eEDqxHzTCLpX3DZqmrYwvQr31iKAQiWOUVlvduuW5jWI
         6tfGOPI0yi8gtIW2b6Qb1GxpOjGDYmb4+H2djQVLnnnAbM2IURlN5uTAmqFosqyOUt0/
         zzvq3ajK1GbowAGY8ymC3s+uIRtfHD0T84K2274Wcef1eQDEAuI9kgOa5imEtxKFDTXu
         3pDYzXYSfmpsBlTwFPWCflwgnMEagze3JKPvgUGZpKoAB80ZP2htf6AgikzOTXC1QuZP
         4NrQ==
X-Gm-Message-State: AJIora8U4yC67DQVXZbkKnC7zSO0SXEUxjinZv1wGZuHKFR5Xp29cFZs
	xV4wJ1pInr81fHO6VDSZi2k=
X-Google-Smtp-Source: AGRyM1tsQGgpnsjzd7eEHazroVkuwV6WSmOqUrcHx9dcggU8/XPJ5Ls1MOZs5lzQu983xkCOkPkEqQ==
X-Received: by 2002:a63:8741:0:b0:411:6ef8:18ec with SMTP id i62-20020a638741000000b004116ef818ecmr6217185pge.258.1656564447864;
        Wed, 29 Jun 2022 21:47:27 -0700 (PDT)
Received: from sebin-inspiron.bbrouter ([103.160.233.84])
        by smtp.gmail.com with ESMTPSA id c9-20020a170902c2c900b00163ffbc4f74sm12344081pla.49.2022.06.29.21.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 21:47:27 -0700 (PDT)
From: Sebin Sebastian <mailmesebin00@gmail.com>
To: 
Subject: [PATCH v2 -next] usb: gadget: dereference before null check
Date: Thu, 30 Jun 2022 10:17:06 +0530
Message-Id: <20220630044706.10772-1-mailmesebin00@gmail.com>
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, kernel test robot <lkp@intel.com>, linux-aspeed@lists.ozlabs.org, Neal Liu <neal_liu@aspeedtech.com>, mailmesebin00@gmail.com, skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Fix coverity warning dereferencing before null check. _ep and desc is
dereferenced on all paths until the check for null. Move the
initializations after the check for null.
Coverity issue: 1518209

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sebin Sebastian <mailmesebin00@gmail.com>
---
 Changes since v1: Fix the build errors and warnings due to first patch.
 Fix the undeclared 'ep' and 'maxpacket' error. Fix the ISO C90 warning.

 drivers/usb/gadget/udc/aspeed_udc.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index d75a4e070bf7..a43cf8dde2a8 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -341,26 +341,33 @@ static void ast_udc_stop_activity(struct ast_udc_dev *udc)
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
 	u8 type;
+	u16 maxpacket;
+	struct ast_udc_ep *ep;
+	struct ast_udc_dev *udc;
+	u8 epnum;
 
-	if (!_ep || !ep || !desc || desc->bDescriptorType != USB_DT_ENDPOINT ||
-	    maxpacket == 0 || maxpacket > ep->ep.maxpacket) {
+	if (!_ep || !desc || desc->bDescriptorType != USB_DT_ENDPOINT) {
 		EP_DBG(ep, "Failed, invalid EP enable param\n");
 		return -EINVAL;
 	}
-
 	if (!udc->driver) {
 		EP_DBG(ep, "bogus device state\n");
 		return -ESHUTDOWN;
 	}
 
+	maxpacket = usb_endpoint_maxp(desc);
+	ep = to_ast_ep(_ep);
+	udc = ep->udc;
+	epnum = usb_endpoint_num(desc);
+	if (maxpacket == 0 || maxpacket > ep->ep.maxpacket) {
+		EP_DBG(ep, "Failed, invalid EP enable param\n");
+		return -EINVAL;
+	}
+
 	EP_DBG(ep, "maxpacket:0x%x\n", maxpacket);
 
 	spin_lock_irqsave(&udc->lock, flags);
-- 
2.34.1

