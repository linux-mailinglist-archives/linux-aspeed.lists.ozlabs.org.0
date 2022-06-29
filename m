Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F1E579327
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Jul 2022 08:28:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ln86t0tRLz3dqr
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Jul 2022 16:28:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QK/5e2zQ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=mailmesebin00@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QK/5e2zQ;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXrLf6Tdkz30LC
	for <linux-aspeed@lists.ozlabs.org>; Wed, 29 Jun 2022 15:56:25 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id m2so13123280plx.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Jun 2022 22:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zysuHUP/InQT5Fi1lB0z6tjNnC0mTo16xnyZM6YuAJw=;
        b=QK/5e2zQieB6A4dmexNIProsq3M79RKCnmora4GTRtVMPjkkvv3D4aT204RFEfBWx4
         nId2C5ed5MHevimldiWc6Cjde/EbequTigTeiNKdBodzJkUX9bD3ohxdMQnuIO16C92c
         cp955TzJcSZV4gQvc+gd9U7cL8BLf4+2kKrf4Hte3bACe8eIPTlrlIg7Ph1vWkIcuXDl
         fIr+vIWPAyjVLyKVR71SZZjibIWSUNaAIDtHoXjlHTCVYvRZ/udaUv5cKICLS4WUOmEz
         Y+mN1BV0/tn9BU7nWku0MgYLRIP8nEaeWD2bIzk+D5O6mxgA5I1AkhOhyH6BrtTW/hZb
         a6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zysuHUP/InQT5Fi1lB0z6tjNnC0mTo16xnyZM6YuAJw=;
        b=ThDquJlVQYpyxuRUq0MXRnthXmw9fC2Lh6QF5LEL9tmcIhzriQU3e9W0eYJddkXR8S
         Wd8srKCwTkcFkqSO05xXBEkCvIwGE55W+nLyku9tdo8qWBE1RlYO7sPfe385yfMyFYoK
         m1YvfvuLtr1UMF8aDXqT3+GOPpKCEkC2eLrRccubi2i8U6aiZYh6Gsg156fk6nho917z
         P6RCRU+a0ltIcJK1SjsrVZbDYjJ7QD4dmVQQ++NkvQ+gey2djT8tGA1ArpJvoKd5xRSP
         mGydetZVXtz8qkaEatH9XWUFNb3iA/WwGraCOz/2OeM9Ylx0sLhz0h8P55v0cosAPVeK
         uNSg==
X-Gm-Message-State: AJIora9FeQ6jJIyJxbij33gwxSEWMEluBsMRzb9dzn2KiPSvMFqyLEGM
	Qj9AtBMf3z5zXNr5X7kEpLc=
X-Google-Smtp-Source: AGRyM1tXAC4bhW6xMpfXOnI72qyaFcpjuVyN0Ilx++e7/GU7Zz0+Z6//cTeok3vV2AY7ITsad9MSHg==
X-Received: by 2002:a17:90b:4ac7:b0:1ed:21e8:ddb2 with SMTP id mh7-20020a17090b4ac700b001ed21e8ddb2mr1929375pjb.93.1656482181452;
        Tue, 28 Jun 2022 22:56:21 -0700 (PDT)
Received: from sebin-inspiron.bbrouter ([103.160.194.58])
        by smtp.gmail.com with ESMTPSA id p12-20020aa79e8c000000b0050dc7628162sm10587451pfq.60.2022.06.28.22.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 22:56:20 -0700 (PDT)
From: SebinSebastian <mailmesebin00@gmail.com>
To: 
Subject: [PATCH-next] usb: gadget: dereference before null check
Date: Wed, 29 Jun 2022 11:26:05 +0530
Message-Id: <20220629055605.102425-1-mailmesebin00@gmail.com>
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

From: Sebin Sebastian <mailmesebin00@gmail.com>

Fix coverity warning dereferencing before null check. _ep and desc is
deferenced on all paths until the check for null. Move the
initilizations after the check for null.
Coverity issue: 1518209

Signed-off-by: Sebin Sebastian <mailmesebin00@gmail.com>
---
 drivers/usb/gadget/udc/aspeed_udc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index d75a4e070bf7..4f158030e2cc 100644
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
@@ -355,6 +351,12 @@ static int ast_udc_ep_enable(struct usb_ep *_ep,
 		EP_DBG(ep, "Failed, invalid EP enable param\n");
 		return -EINVAL;
 	}
+
+	u16 maxpacket = usb_endpoint_maxp(desc);
+	struct ast_udc_ep *ep = to_ast_ep(_ep);
+	struct ast_udc_dev *udc = ep->udc;
+	u8 epnum = usb_endpoint_num(desc);
+
 
 	if (!udc->driver) {
 		EP_DBG(ep, "bogus device state\n");
-- 
2.34.1

