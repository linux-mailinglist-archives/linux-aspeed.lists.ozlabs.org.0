Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1108693EFF
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 08:42:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFbsP4Zycz3c71
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 18:42:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=c2yd1IFc;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=c2yd1IFc;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFbsG21JRz3bhH
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 18:42:26 +1100 (AEDT)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id F2D1B200E3; Mon, 13 Feb 2023 15:42:22 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676274142;
	bh=Gac3PppOPjYLz3RFgIIfbWPmQu5Mk+Pg0GDUNnRwP4E=;
	h=From:To:Cc:Subject:Date;
	b=c2yd1IFcixnbYvx10pSFloY8TVzM4S4/w12Ewfdg1qBxrRnf3V4gTP0rx+kEcbyy1
	 3f47Zts8DxFOuG89imjJctCO3MmQk1qRCim38z/HUyhg7Ck96ZaxIBtwGgHbSOxkNA
	 Tqk0A9WHlHfk7G9OXBKwWOZ4QJ7puRvXS/QqO+NNiM2q8gv5ak0Po8/eoRTyfVAvtt
	 a97NxRpI7rpnaNJPm9KOwaI1rUN+Soq9XXBA89R5dAxnMRbmbgQnc0mIApozMQttaw
	 6Rnpn6GoDuvjcIeRFMAQbqgIsbw3w1P6gCjmUoKgbmkfDyNfp93Dx+lfK7WZZVhxX1
	 1aVibyQQcqylQ==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: devicetree@vger.kernel.org
Subject: [RFC PATCH] dt-bindings: Add AST2600 i3c controller binding
Date: Mon, 13 Feb 2023 15:41:52 +0800
Message-Id: <5c047dd91390b9ee4cd8bca3ff107db37a7be4ac.1676273912.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-i3c@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This change adds a devicetree binding for the ast2600 i3c controller
hardware. This is heavily based on the designware i3c hardware, plus a
reset facility and two platform-specific properties:

 - sda-pullup-ohms: to specify the value of the configurable pullup
   resistors on the SDA line

 - global-regs: to reference the (ast2600-specific) i3c global register
   block, and the device index to use within it.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
RFC: the example in this depends on some not-yet-accepted patches for
the clock and reset linkages:

  https://lore.kernel.org/linux-devicetree/cover.1676267865.git.jk@codeconstruct.com.au/T/

I'm also keen to get some review on the pullup configuration too.

---
 .../bindings/i3c/aspeed,ast2600-i3c.yaml      | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml

diff --git a/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
new file mode 100644
index 000000000000..ef28a8b77c94
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/aspeed,ast2600-i3c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2600 i3c controller
+
+maintainers:
+  - Jeremy Kerr <jk@codeconstruct.com.au>
+
+allOf:
+  - $ref: i3c.yaml#
+
+properties:
+  compatible:
+    const: aspeed,ast2600-i3c
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  sda-pullup-ohms:
+    enum: [545, 750, 2000]
+    default: 2000
+    description: |
+      Value of SDA pullup resistor in Ohms
+
+  global-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      A (phandle, controller index) reference to the i3c global register set
+      used for this device.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - global-regs
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/ast2600-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i3c-master@2000 {
+        #address-cells = <3>;
+        #size-cells = <0>;
+        compatible = "aspeed,ast2600-i3c";
+        reg = <0x2000 0x1000>;
+        clocks = <&syscon ASPEED_CLK_GATE_I3C0CLK>;
+        resets = <&syscon ASPEED_RESET_I3C0>;
+        global-regs = <&i3c_global 0>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_i3c1_default>;
+        interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+    i3c_global: i3c-global@0 {
+        compatible = "aspeed,ast2600-i3c-global", "simple-mfd", "syscon";
+        resets = <&syscon ASPEED_RESET_I3C_DMA>;
+        reg = <0x0 0x1000>;
+    };
+...
-- 
2.39.1

