Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 109AA60C183
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Oct 2022 04:09:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxFk739Nwz3byZ
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Oct 2022 13:09:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LLBbz+nS;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LLBbz+nS;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxFjz6gZqz2yYj
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Oct 2022 13:09:09 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id g16so5133084pfr.12
        for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Oct 2022 19:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Pm3uBTI2KyqfNFZG8zBDmAPLyP8aHcCfyyi7loUOwwU=;
        b=LLBbz+nSU2WPxTx1LHdM1QUtJxdTj36sWunxs0/XsvfUJiXhf94YmGoHTpCCtdua0L
         14huliCPBU8aR4E9FYCQ4VuD287NEl7HnTdYVhYWFKhd12eiLEao3wkdnC53STj5hsQV
         wlBwSGGgzMCwgxZ5jGt6ZwYbSAd/LB7wFv4xSCSrjLWCLnCH1Tyw1kfgqHr7JAHNlQgk
         WTv9l8kSyq4XCUhz+E0FMh9AnM2Qwjmk9clBSQOHCFiNd7P36XM8q4yOfi9q+Z2Ze9/4
         WxNeGjGfpSbZTHT2XPns/gwnEdfaQjtsjBj8D0mHK0WWCHg5MH/jLL3SMnXB0l4YKVbF
         O1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pm3uBTI2KyqfNFZG8zBDmAPLyP8aHcCfyyi7loUOwwU=;
        b=cDxReXzPCNvmBws2Yu27B6aLR7O51wyLjo5lre0HGJI4pJDWoR2UhEYeu3DhUm/v1Q
         y2eAu8gT2ZpCnJBuf9TxiXjMld+Y+lx3uerlS08n7Aj/1EeUvZEZ62EfEWoZl8ryJZPp
         YWZT6GnvNoA5OlADaGXked9JMJ4vsppSlRdCEQsr0jgsl4Xh4qsNTmX3Ikb7+xvAiCtX
         iOU0HoOXJRLQZOEx0P7WiYpl27t/x2tPrQbfm/N4w68+MJZMlVABGgjhH5EyS7V+IzzZ
         8px2YsI8uYCa9t60FoQZbzyLlQNp9NBQ+Om7BjDf4AfrjEDg9qr63dOHfGC5X4j1qA4J
         uf6g==
X-Gm-Message-State: ACrzQf1agqUizmoGMRA3VO7bE/8lW0r5lXew8jwK74Klw7n5B3tiqUwI
	O+ySsgDIGQ+/Kj3pxt0hzDk=
X-Google-Smtp-Source: AMsMyM6TvAu7HSzVk41KXIjjB1wvSO/fyRQDbFUp8OyaCscpgUP5cnmYDmpXvIG2fHp2dKUS+5w8Zw==
X-Received: by 2002:a05:6a00:1309:b0:535:d421:1347 with SMTP id j9-20020a056a00130900b00535d4211347mr36764044pfu.5.1666663745665;
        Mon, 24 Oct 2022 19:09:05 -0700 (PDT)
Received: from voyager.lan ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ecc600b0017f80305239sm338116plh.136.2022.10.24.19.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 19:09:04 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH] MAINTAINERS: Add Ben as a reviewer for ASPEED UCD
Date: Tue, 25 Oct 2022 12:38:56 +1030
Message-Id: <20221025020856.744202-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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
Cc: Neal Liu <neal_liu@aspeedtech.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

He wrote the vhub driver and would like to be cc'd on patches.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3bb30c0d1cb4..637beabc70f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3232,12 +3232,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/aspeed-video.txt
 F:	drivers/media/platform/aspeed/
 
-ASPEED USB UDC DRIVER
+ASPEED USB UDC DRIVERS
 M:	Neal Liu <neal_liu@aspeedtech.com>
+R:	Benjamin Herrenschmidt <benh@kernel.crashing.org>
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/usb/aspeed,ast2600-udc.yaml
 F:	drivers/usb/gadget/udc/aspeed_udc.c
+F:	Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
+F: 	drivers/usb/gadget/udc/aspeed-vhub/
 
 ASPEED CRYPTO DRIVER
 M:	Neal Liu <neal_liu@aspeedtech.com>
-- 
2.35.1

