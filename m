Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 7C13E8D2C5D
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 May 2024 07:21:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=T5l8q/Jk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VpyGq1shLz3vwG
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 May 2024 15:14:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=T5l8q/Jk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VpyGQ1CwPz3fmX
	for <linux-aspeed@lists.ozlabs.org>; Wed, 29 May 2024 15:13:50 +1000 (AEST)
Received: from [127.0.1.1] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 43F322024D;
	Wed, 29 May 2024 13:13:49 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1716959629;
	bh=RM0WLi2RJAK84kDk7oeF/Th0CqQkfxxrTkSFxmoFxho=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=T5l8q/JkQhlJqQvasahZe8N9NJFmSYLuQ0yU3G9i4C5vTUCBKyMD7XHhRpPFfaIpM
	 Ts5bK7T26S0UExzICplw4oGdsJS6tlHY+dJnNPlMKpUlZdC6IrtQSaFBpyTZZvtkCR
	 aDIFiQqPBcRsGLsJqmC27MMCw2XO/6jSyeOyldx84q4IipV53vuytBBgqwE1sjFPRG
	 YVxszLFo6dYlDUmpXt+Lp0N3z90kQ3AhH+3/YqXhWBY8vVXdmguaX/KKhtDNDrHMHj
	 Jt9p+1+z8nc5vytFxAwoqp1AYpXglN59qW28cBWwFusHhQY+PB1CN9hQU6Ju+8us31
	 IL2hqk104VfAg==
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Wed, 29 May 2024 14:43:22 +0930
Subject: [PATCH 3/4] dt-bindings: gpio: aspeed,sgpio: Specify
 #interrupt-cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-3-91c42976833b@codeconstruct.com.au>
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

Squash warnings such as:

```
/home/andrew/src/kernel.org/linux/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: sgpio@1e780200: '#interrupt-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
```

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
index fe27b5d01e80..02c02ef97565 100644
--- a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
@@ -46,6 +46,9 @@ properties:
 
   interrupt-controller: true
 
+  '#interrupt-cells':
+    const: 2
+
   clocks:
     maxItems: 1
 
@@ -75,6 +78,7 @@ examples:
         clocks = <&syscon ASPEED_CLK_APB>;
         interrupts = <40>;
         interrupt-controller;
+        #interrupt-cells = <2>;
         gpio-controller;
         #gpio-cells = <2>;
         ngpios = <80>;

-- 
2.39.2

