Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFFA9655C6
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Aug 2024 05:41:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww3q83jQJz30Ds
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Aug 2024 13:41:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724989291;
	cv=none; b=ITJ6jWgZ7uJSOUHHbEOlo4FK1VirI8sCbDhGofT0RN2bxbvmkmZnzKVFT9IbWoZyKGaktP3Rx5sASHcxq1UF9pgvA+7MrZ5bs21wTFY7QMtnDTrNh0B5DAuu24qQOFWYGpPGUO5OIoVbpaMkbkyYwOxamvQg4Lc/OuDneewpXhz0wqMgNK/z6UrlcaLofFGaMk6IId0Ws+/pxPM+ZX2tyyu+PE80QluaLs0VHY62D9v7e2Ow3soKQDnvenvzxCQWgW1z1MP+Ep+F6xz2z5ym41OsKcRr6HAjt5PkHG8ZcL0xn1AGEGEtTXF4aBDABChiLQT38sE4L61XMNFkedGuTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724989291; c=relaxed/relaxed;
	bh=3bsBwqMGpIr6QM0PWM/ItHgl4/YFfBbvN59COWgMOxA=;
	h=Received:Received:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type; b=fq3qFdtyqT18IyfkBVHllZPkjLkfWGYOvul1hbK7apPbUVNI277N1hhUbtw9CimrTyunbk1p/y/l7Rls3JgPEIsFPoKmPtx3MZ7d6r6hFFXC1enBflwZEX1odf15M4SrZX34V+Ojp3iKBzFeEo0AH1pAic+Om7vfApOb5LjzZkspLpH6wUVMAe253i4G4AmY/NT/38VA2Y/+cjzTSkZtDkTnpbAASU7D8JETglaFz4Z3BZDkwq36oZ97jHnDqXTiS5nJfHUsoyxIS5Ln1LZWHJgbVQVCUbFAvrr4Vyg+mWWzsLOL5rWuNhtSWxJ9epkS+FhkeTQabDgusHGEQd2edg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww3pt4TbCz2ypx
	for <linux-aspeed@lists.ozlabs.org>; Fri, 30 Aug 2024 13:41:23 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 30 Aug
 2024 11:40:47 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 30 Aug 2024 11:40:47 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH v2 1/4] dt-bindings: gpio: aspeed,ast2400-gpio: Support ast2700
Date: Fri, 30 Aug 2024 11:40:44 +0800
Message-ID: <20240830034047.2251482-2-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240830034047.2251482-1-billy_tsai@aspeedtech.com>
References: <20240830034047.2251482-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The AST2700 is the 7th generation SoC from Aspeed, featuring two GPIO
controllers: one with 12 GPIO pins and another with 216 GPIO pins.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../bindings/gpio/aspeed,ast2400-gpio.yaml    | 46 ++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
index cf11aa7ec8c7..4d439972c14b 100644
--- a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
@@ -15,6 +15,7 @@ properties:
       - aspeed,ast2400-gpio
       - aspeed,ast2500-gpio
       - aspeed,ast2600-gpio
+      - aspeed,ast2700-gpio
 
   reg:
     maxItems: 1
@@ -42,7 +43,7 @@ properties:
     const: 2
 
   ngpios:
-    minimum: 36
+    minimum: 12
     maximum: 232
 
 required:
@@ -93,6 +94,20 @@ allOf:
           enum: [ 36, 208 ]
       required:
         - ngpios
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: aspeed,ast2700-gpio
+    then:
+      properties:
+        gpio-line-names:
+          minItems: 12
+          maxItems: 216
+        ngpios:
+          enum: [ 12, 216 ]
+      required:
+        - ngpios
 
 additionalProperties: false
 
@@ -146,3 +161,32 @@ examples:
         gpio-ranges = <&pinctrl 0 208 36>;
         ngpios = <36>;
     };
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+        gpio2: gpio@14c0b000 {
+            compatible = "aspeed,ast2700-gpio";
+            reg = <0x0 0x14c0b000 0x0 0x1000>;
+            interrupts-extended = <&soc1_intc2 18>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            #gpio-cells = <2>;
+            gpio-controller;
+            gpio-ranges = <&pinctrl1 0 0 216>;
+            ngpios = <216>;
+        };
+
+        gpio3: gpio@12c11000 {
+            compatible = "aspeed,ast2700-gpio";
+            reg = <0x0 0x12c11000 0x0 0x1000>;
+            interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            #gpio-cells = <2>;
+            gpio-controller;
+            gpio-ranges = <&pinctrl0 0 0 12>;
+            ngpios = <12>;
+        };
+    };
-- 
2.25.1

