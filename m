Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id DA5058D2C5C
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 May 2024 07:21:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Ogf7jb0r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VpyGv2zrrz3wHB
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 May 2024 15:14:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Ogf7jb0r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VpyGQ51DWz3fmX
	for <linux-aspeed@lists.ozlabs.org>; Wed, 29 May 2024 15:13:50 +1000 (AEST)
Received: from [127.0.1.1] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 00E64202C8;
	Wed, 29 May 2024 13:13:49 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1716959630;
	bh=P8gBf6jRS53rX70PCjwXjULQnqD4pYqLyrNQvX02Huk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ogf7jb0rwfeRUAkEBHkEOilwFfPZtc+QdoNrArChblbzGnE7CDo46q1yyT0DH/Ynf
	 z5n9pmVMBzEXkzjtkjG0izFzI1kSxebGxNUXFvTbPHoicrexeNxg/g2BRg0reUlBvr
	 TzUfLfF++c7HdZb/Um7ygIBpum0TyF4Gh7CMdLmoTEP3Y1kOs5WtG47/HNteyXEK5H
	 ITUSb0lRKidY9pqHKZI/VT6P9Qdqpra5M+UyYMdvnRevOX/5pGpBuMnwizSsfbMjfm
	 APUQrzWs2NCjULoUy++v+NaqFRZH51JSWxkfwvQcu4ML1TRmqoHKqmceMl9OI+XEcD
	 CtDR8KeQQ1P6g==
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Wed, 29 May 2024 14:43:23 +0930
Subject: [PATCH 4/4] dt-bindings: gpio: aspeed,sgpio: Require
 #interrupt-cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-4-91c42976833b@codeconstruct.com.au>
References: <20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-0-91c42976833b@codeconstruct.com.au>
In-Reply-To: <20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-0-91c42976833b@codeconstruct.com.au>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.13.0
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
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

It shouldn't have been the case that it wasn't required. The kernel
devicetrees already specified it where compatible nodes were defined,
and u-boot pulls in the kernel devicetrees, so this should have minimal
practical impact.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
index 02c02ef97565..433b50bd5484 100644
--- a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
@@ -62,6 +62,7 @@ required:
   - clocks
   - interrupts
   - interrupt-controller
+  - '#interrupt-cells'
   - gpio-controller
   - '#gpio-cells'
   - ngpios

-- 
2.39.2

