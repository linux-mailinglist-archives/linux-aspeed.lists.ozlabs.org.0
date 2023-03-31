Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 645B46D1BB3
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 Mar 2023 11:15:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnvlN1dl7z3f99
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 Mar 2023 20:15:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=llF+FE5l;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=llF+FE5l;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pnvl813Ybz3c9x
	for <linux-aspeed@lists.ozlabs.org>; Fri, 31 Mar 2023 20:15:15 +1100 (AEDT)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 9DC10203E4; Fri, 31 Mar 2023 17:15:14 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680254114;
	bh=4i6zbPriP30VDqxbtLw8DULJL2d8uZhDMuiqyIgkVgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=llF+FE5l2BTyEOtFdJl1ZHwWFVvFUruhmn50cOTFqKwvroSsYIYR3jOcgxj9o27gg
	 5SJiv06viDhRw3SPrdDRDyQ2OILIRaIMp80XtSzZbU6YiWBf/OQ7PGS/xLpj7/X+CQ
	 RfhUiynEx2JxXgsbz8dgz8/ipMoLjuJ1esyUTVlTVPJ7g6O3ED3KDtQSEj/orsHY6v
	 7fbUSswN0vE0YCfxGeNdTkrJ3mR/HX6+t5AsFci+VUGc6o5ZmB6bKpAN9PR1UBWF/F
	 +jPv8qQfT8Ru9Vq6WY6lyAfE00tv2X3rX0IFmNCxswOwUv4WB0kmO+RiLwoop59wvA
	 ILzrdfHa7c9Dg==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Subject: [PATCH v3 2/3] dt-bindings: i3c: Add AST2600 i3c controller
Date: Fri, 31 Mar 2023 17:15:00 +0800
Message-Id: <20230331091501.3800299-3-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230331091501.3800299-1-jk@codeconstruct.com.au>
References: <20230331091501.3800299-1-jk@codeconstruct.com.au>
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
Cc: Vitor Soares <ivitro@gmail.com>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matt Johnston <matt@codeconstruct.com.au>, Jack Chen <zenghuchen@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add a devicetree binding for the ast2600 i3c controller hardware. This
is heavily based on the designware i3c core, plus a reset facility
and two platform-specific properties:

 - sda-pullup-ohms: to specify the value of the configurable pullup
   resistors on the SDA line

 - aspeed,global-regs: to reference the (ast2600-specific) i3c global
   register block, and the device index to use within it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> (on v1)
Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

---
v2:
 - example: replace aspeed clock defines with constants, so we're not
   reliant on recent clk patches.
---
 .../bindings/i3c/aspeed,ast2600-i3c.yaml      | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml

diff --git a/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
new file mode 100644
index 000000000000..fcc3dbff9c9a
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
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
+      Value to configure SDA pullup resistor, in Ohms.
+
+  aspeed,global-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to i3c global register syscon node
+          - description: index of this i3c controller in the global register set
+    description: |
+      A (phandle, controller index) reference to the i3c global register set
+      used for this device.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - aspeed,global-regs
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i3c-master@2000 {
+        compatible = "aspeed,ast2600-i3c";
+        reg = <0x2000 0x1000>;
+        #address-cells = <3>;
+        #size-cells = <0>;
+        clocks = <&syscon 0>;
+        resets = <&syscon 0>;
+        aspeed,global-regs = <&i3c_global 0>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_i3c1_default>;
+        interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+    };
+...
-- 
2.39.1

