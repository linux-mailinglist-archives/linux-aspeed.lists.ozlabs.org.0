Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 71D2D8D2C5A
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 May 2024 07:21:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=QYa0XjOA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VpyGk4dnlz3vfP
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 May 2024 15:14:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=QYa0XjOA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VpyGP42BTz3dMW
	for <linux-aspeed@lists.ozlabs.org>; Wed, 29 May 2024 15:13:49 +1000 (AEST)
Received: from [127.0.1.1] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D9B9720174;
	Wed, 29 May 2024 13:13:47 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1716959628;
	bh=/kCC/N3bNiMS05Tj8Fe/ikNvI4lWNncOVV0tIccEmmc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QYa0XjOALWVq7z6GhWeIteNJfE3k+PxHwl7GYBfn2DJ1mBhwZ+ulIvcY7QNOu3fHP
	 t3unjjg5ZFdfppIdD+oTS8knouKCNlgCyu+VSH8WOaxMqw5Ea5EMTT4WiYXK/+u8cz
	 3IAXc/3WDOD5Wl59RK/KNbnLmLlj5tzkKdr9h29WFThQsoPfO4GAmkLC5Pyi296jTf
	 hRIs7zNGKoIofzuFkSJi6ISt+gSjbcxH395uW+NM0rdNcoQUXk4+2y2kCJbSWAPS1v
	 BIUubirGDBSFCV9e7Il+Cic5NRdHKARn7dgxpE9vrFoukJMQl7DsLvy+mjvWI/sVYr
	 LqWMjLPWjqEgQ==
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Wed, 29 May 2024 14:43:20 +0930
Subject: [PATCH 1/4] dt-bindings: gpio: aspeed,sgpio: Order properties by
 DTS style
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-1-91c42976833b@codeconstruct.com.au>
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

Tidy up the list of required properties and the example node by ordering
the properties in terms of the DTS coding style.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
index 46bb121360dc..6b15a3a3fb66 100644
--- a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
@@ -51,12 +51,12 @@ properties:
 required:
   - compatible
   - reg
-  - gpio-controller
-  - '#gpio-cells'
+  - clocks
   - interrupts
   - interrupt-controller
+  - gpio-controller
+  - '#gpio-cells'
   - ngpios
-  - clocks
   - bus-frequency
 
 additionalProperties: false
@@ -65,13 +65,13 @@ examples:
   - |
     #include <dt-bindings/clock/aspeed-clock.h>
     sgpio: sgpio@1e780200 {
-        #gpio-cells = <2>;
         compatible = "aspeed,ast2500-sgpio";
-        gpio-controller;
-        interrupts = <40>;
         reg = <0x1e780200 0x0100>;
         clocks = <&syscon ASPEED_CLK_APB>;
+        interrupts = <40>;
         interrupt-controller;
+        gpio-controller;
+        #gpio-cells = <2>;
         ngpios = <80>;
         bus-frequency = <12000000>;
     };

-- 
2.39.2

