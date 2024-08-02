Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 097939457A6
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 07:37:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ILzoFj4J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZvjD5vNwz3cVd
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 15:37:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ILzoFj4J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZvhz0f9xz3cND
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 15:36:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722577009;
	bh=xlZ4/Kw11xpyrMXD0cAsdFdsF3dDK1F5MYgwiSI6304=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ILzoFj4JHHtHcpMCOKJ6MMAerPlbAY5PRWfKzguT3wZFVbawVINU/c8u8K+tKi9LD
	 abfvrYUJKiZZdj/V4Qb6HljDj5VhanCYBR38ngzyefmHQJuHpQYa5nLmDPsC1nMeJ0
	 +b3chIs0EJleJtkJOiHXqjHGWfn/AmskmYg8joBeaNMSgCC+Gp53s6WH5lua+P4Rvq
	 t4HSP7mbvlvWzfdnrlz1jpGtot81TM8JZZ7rgZHlawSbNTjRXICA/rdapC55aH1diD
	 fVWcMQv0wG8bT/+e1jd3oRb8G4uJ6AYI0KFmbLmxOpd5X4Yp6faA1ROFLOWW1dMuB6
	 BbfZaFWMtVigA==
Received: from [127.0.1.1] (ppp118-210-29-70.adl-adc-lon-bras31.tpg.internode.on.net [118.210.29.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0888C66E06;
	Fri,  2 Aug 2024 13:36:48 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Fri, 02 Aug 2024 15:06:31 +0930
Subject: [PATCH 2/2] dt-bindings: misc: aspeed,ast2400-cvic: Convert to DT
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240802-dt-warnings-irq-aspeed-dt-schema-v1-2-8cd4266d2094@codeconstruct.com.au>
References: <20240802-dt-warnings-irq-aspeed-dt-schema-v1-0-8cd4266d2094@codeconstruct.com.au>
In-Reply-To: <20240802-dt-warnings-irq-aspeed-dt-schema-v1-0-8cd4266d2094@codeconstruct.com.au>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Address warnings such as:

    arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: interrupt-controller@1e6c0080: 'valid-sources' does not match any of the regexes: 'pinctrl-[0-9]+'

and

    arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2400-cvic', 'aspeed-cvic']

Note that the conversion to DT schema causes some further warnings to
be emitted, because the Aspeed devicetrees are not in great shape. These
new warnings are resolved in a separate series:

https://lore.kernel.org/lkml/20240802-dt-warnings-bmc-dts-cleanups-v1-0-1cb1378e5fcd@codeconstruct.com.au/

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 .../bindings/misc/aspeed,ast2400-cvic.yaml         | 60 ++++++++++++++++++++++
 .../devicetree/bindings/misc/aspeed,cvic.txt       | 35 -------------
 2 files changed, 60 insertions(+), 35 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/aspeed,ast2400-cvic.yaml b/Documentation/devicetree/bindings/misc/aspeed,ast2400-cvic.yaml
new file mode 100644
index 000000000000..3c85b4924c05
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/aspeed,ast2400-cvic.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed Coprocessor Vectored Interrupt Controller
+
+maintainers:
+  - Andrew Jeffery <andrew@codeconstruct.com.au>
+
+description:
+  The Aspeed AST2400 and AST2500 SoCs have a controller that provides interrupts
+  to the ColdFire coprocessor. It's not a normal interrupt controller and it
+  would be rather inconvenient to create an interrupt tree for it, as it
+  somewhat shares some of the same sources as the main ARM interrupt controller
+  but with different numbers.
+
+  The AST2500 also supports a software generated interrupt.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - aspeed,ast2400-cvic
+          - aspeed,ast2500-cvic
+      - const: aspeed,cvic
+
+  reg:
+    maxItems: 1
+
+  valid-sources:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      One cell, bitmap of support sources for the implementation.
+
+  copro-sw-interrupts:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      A list of interrupt numbers that can be used as software interrupts from
+      the ARM to the coprocessor.
+
+required:
+  - compatible
+  - reg
+  - valid-sources
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@1e6c2000 {
+        compatible = "aspeed,ast2500-cvic", "aspeed,cvic";
+        reg = <0x1e6c2000 0x80>;
+        valid-sources = <0xffffffff>;
+        copro-sw-interrupts = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/misc/aspeed,cvic.txt b/Documentation/devicetree/bindings/misc/aspeed,cvic.txt
deleted file mode 100644
index d62c783d1d5e..000000000000
--- a/Documentation/devicetree/bindings/misc/aspeed,cvic.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-* ASPEED AST2400 and AST2500 coprocessor interrupt controller
-
-This file describes the bindings for the interrupt controller present
-in the AST2400 and AST2500 BMC SoCs which provides interrupt to the
-ColdFire coprocessor.
-
-It is not a normal interrupt controller and it would be rather
-inconvenient to create an interrupt tree for it as it somewhat shares
-some of the same sources as the main ARM interrupt controller but with
-different numbers.
-
-The AST2500 supports a SW generated interrupt
-
-Required properties:
-- reg: address and length of the register for the device.
-- compatible: "aspeed,cvic" and one of:
-		"aspeed,ast2400-cvic"
-	      or
-		"aspeed,ast2500-cvic"
-
-- valid-sources: One cell, bitmap of supported sources for the implementation
-
-Optional properties;
-- copro-sw-interrupts: List of interrupt numbers that can be used as
-		       SW interrupts from the ARM to the coprocessor.
-		       (AST2500 only)
-
-Example:
-
-	cvic: copro-interrupt-controller@1e6c2000 {
-		compatible = "aspeed,ast2500-cvic";
-		valid-sources = <0xffffffff>;
-		copro-sw-interrupts = <1>;
-		reg = <0x1e6c2000 0x80>;
-	};

-- 
2.39.2

