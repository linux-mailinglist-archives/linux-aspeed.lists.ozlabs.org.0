Return-Path: <linux-aspeed+bounces-1774-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 743D4B0D650
	for <lists+linux-aspeed@lfdr.de>; Tue, 22 Jul 2025 11:52:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bmXcP1Mj1z2yhb;
	Tue, 22 Jul 2025 19:52:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753177941;
	cv=none; b=LbjO3/4EUgPCrzbeV5gckl2Es6aU7yb6F7og+Ut0DLtOLGw5l1cK5Lhda8YUMk4OWDU6fXtUsDFj4EAcuNcU+7SvJJm4tFjViGEoGitaj1eXZbCTG/L2RF50bEoY6rWHhci1+P+5eROHhCJzwtclfleRGQLIDNy29ZAABXrJ30rZWEEZAiH9cz0V5RPltfpAEXabPFjk7d/9QK19vJJQleU3yr9UToSHJa44s/ffZpgXLzO4foUFYZ5i5e7sJvVBNnj+BKDAzhOr/wT645QJ+XDYdWqzOX1ZEdBG2GIwz2ogbYw5v4AC+AuefE1Z4uymHbCuMr/Czl/QhKduZp5TuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753177941; c=relaxed/relaxed;
	bh=yr50CXH8qpunM1YVt+HWcWF5mZkmZfOtK8D4zyOO+lo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g/qu7eCBeCUXw28+h2gTKavoy7WvE2RZOQCPGaqMkn6oEP3WrRSAsfdm9sbmw5PUdPKXU8W/I19Z2lIYwLwqelk+3vH0uwb4W9PCMsWtzAbvcZAj7LI7oaNzxodwKHqnnX08/3GctYgO9E2Hbs49+hOVBqPchy71pR3C9l6+ds/Ba2iHy/Cv4qgmJhUtd1kB91tn13HlZSPrliZJ7fNISsrpgAgeuUMzBb9ZlNqZDcaRDvYk3xiyV6a/oXDjQQp5puj+qP9Se4zJTQOJiVTCjWDOL31wNW5MpmAzhW8+RL5w5qpQwO5l8BVq+PeDIT2K1ay7BySSG7KbTEtcRzw5Wg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bmXcN4Cgsz2yF0
	for <linux-aspeed@lists.ozlabs.org>; Tue, 22 Jul 2025 19:52:20 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 22 Jul
 2025 17:51:56 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 22 Jul 2025 17:51:56 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: ryan_chen <ryan_chen@aspeedtech.com>, Thomas Gleixner
	<tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Kevin Chen
	<kevin_chen@aspeedtech.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v3 1/2] dt-bindings: interrupt-controller: aspeed: Add parent node compatibles and refine documentation
Date: Tue, 22 Jul 2025 17:51:55 +0800
Message-ID: <20250722095156.1672873-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722095156.1672873-1-ryan_chen@aspeedtech.com>
References: <20250722095156.1672873-1-ryan_chen@aspeedtech.com>
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The AST2700 SoC contains two independent top-level interrupt controllers
(INTC0 and INTC1), each responsible for handling different peripheral
groups and occupying separate register spaces. Above them, PSP(CA35) GIC
controller acts as the root interrupt aggregator. Accurately describing
this hierarchical hardware structure in the device tree requires distinct
compatible strings for the parent nodes of INTC0 and INTC1.

- Adds 'aspeed,ast2700-intc0' and 'aspeed,ast2700-intc1' compatible
 strings for parent interrupt controller nodes. (in addition to the
 existing 'aspeed,ast2700-intc-ic' for child nodes)
- Clarifies the relationship and function of INTC0 parent
 (intc0_0~x: child), INTC1 parent (intc1_0~x: child), and the GIC
 in the documentation.
- Updates block diagrams and device tree examples to illustrate
 the hierarchy and compatible usage.
- Refines documentation and example formatting.

This change allows the device tree and driver to distinguish between
parent (top-level) and child (group) interrupt controller nodes,
enabling more precise driver matching SOC register space allocation.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../aspeed,ast2700-intc.yaml                  | 158 +++++++++++++-----
 1 file changed, 115 insertions(+), 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
index 55636d06a674..bdc4d8835843 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
@@ -10,6 +10,33 @@ description:
   This interrupt controller hardware is second level interrupt controller that
   is hooked to a parent interrupt controller. It's useful to combine multiple
   interrupt sources into 1 interrupt to parent interrupt controller.
+  Depend to which INTC0 or INTC1 used.
+  INTC0 and INTC1 are two kinds of interrupt controller with enable and raw
+  status registers for use.
+  INTC0 is used to assert GIC if interrupt in INTC1 asserted.
+  INTC1 is used to assert INTC0 if interrupt of modules asserted.
+  +-----+   +---------+
+  | GIC |---|  INTC0  |
+  +-----+   +---------+
+            +---------+
+            |         |---module0
+            | INTC0_0 |---module1
+            |         |---...
+            +---------+---module31
+            |---....  |
+            +---------+
+            |         |     +---------+
+            | INTC0_11| +---| INTC1   |
+            |         |     +---------+
+            +---------+     +---------+---module0
+                            | INTC1_0 |---module1
+                            |         |---...
+                            +---------+---module31
+                            ...
+                            +---------+---module0
+                            | INTC1_5 |---module1
+                            |         |---...
+                            +---------+---module31
 
 maintainers:
   - Kevin Chen <kevin_chen@aspeedtech.com>
@@ -17,49 +44,70 @@ maintainers:
 properties:
   compatible:
     enum:
-      - aspeed,ast2700-intc-ic
+      - aspeed,ast2700-intc0
+      - aspeed,ast2700-intc1
 
   reg:
     maxItems: 1
 
-  interrupt-controller: true
+  '#address-cells':
+    const: 2
 
-  '#interrupt-cells':
+  '#size-cells':
     const: 2
-    description:
-      The first cell is the IRQ number, the second cell is the trigger
-      type as defined in interrupt.txt in this directory.
-
-  interrupts:
-    maxItems: 6
-    description: |
-      Depend to which INTC0 or INTC1 used.
-      INTC0 and INTC1 are two kinds of interrupt controller with enable and raw
-      status registers for use.
-      INTC0 is used to assert GIC if interrupt in INTC1 asserted.
-      INTC1 is used to assert INTC0 if interrupt of modules asserted.
-      +-----+   +-------+     +---------+---module0
-      | GIC |---| INTC0 |--+--| INTC1_0 |---module2
-      |     |   |       |  |  |         |---...
-      +-----+   +-------+  |  +---------+---module31
-                           |
-                           |   +---------+---module0
-                           +---| INTC1_1 |---module2
-                           |   |         |---...
-                           |   +---------+---module31
-                          ...
-                           |   +---------+---module0
-                           +---| INTC1_5 |---module2
-                               |         |---...
-                               +---------+---module31
 
+  ranges: true
+
+patternProperties:
+  "^interrupt-controller@":
+    type: object
+    description: Interrupt group child nodes
+    additionalProperties: false
+
+    properties:
+      compatible:
+        enum:
+          - aspeed,ast2700-intc-ic
+
+      reg:
+        maxItems: 1
+
+      interrupt-controller: true
+
+      '#interrupt-cells':
+        const: 2
+        description: |
+          The first cell is the IRQ number, the second cell is the trigger
+          type as defined in interrupt.txt in this directory.
+
+      interrupts:
+        minItems: 1
+        maxItems: 6
+        description: |
+          The interrupts provided by this interrupt controller.
+
+      interrupts-extended:
+        minItems: 1
+        maxItems: 6
+        description: |
+          This property is required when defining a cascaded interrupt controller
+          that is connected under another interrupt controller. It specifies the
+          parent interrupt(s) in the upstream controller to which this controller
+          is connected.
+
+    oneOf:
+      - required: [interrupts]
+      - required: [interrupts-extended]
+
+    required:
+      - compatible
+      - reg
+      - interrupt-controller
+      - '#interrupt-cells'
 
 required:
   - compatible
   - reg
-  - interrupt-controller
-  - '#interrupt-cells'
-  - interrupts
 
 additionalProperties: false
 
@@ -68,19 +116,43 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      intc0: interrupt-controller@12100000 {
+        compatible = "aspeed,ast2700-intc0";
+        reg = <0 0x12100000 0 0x4000>;
+        ranges = <0x0 0x0 0x0 0x12100000 0x0 0x4000>;
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        intc0_11: interrupt-controller@1b00 {
+          compatible = "aspeed,ast2700-intc-ic";
+          reg = <0 0x12101b00 0 0x10>;
+          #interrupt-cells = <2>;
+          interrupt-controller;
+          interrupts = <GIC_SPI 192 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+                       <GIC_SPI 193 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+                       <GIC_SPI 194 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+                       <GIC_SPI 195 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+                       <GIC_SPI 196 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+                       <GIC_SPI 197 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+        };
+      };
+
+      intc1: interrupt-controller@14c18000 {
+        compatible = "aspeed,ast2700-intc1";
+        reg = <0 0x14c18000 0 0x400>;
+        ranges = <0x0 0x0 0x0 0x14c18000 0x0 0x400>;
         #address-cells = <2>;
         #size-cells = <2>;
 
-        interrupt-controller@12101b00 {
-            compatible = "aspeed,ast2700-intc-ic";
-            reg = <0 0x12101b00 0 0x10>;
-            #interrupt-cells = <2>;
-            interrupt-controller;
-            interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+        intc1_0: interrupt-controller@100 {
+          compatible = "aspeed,ast2700-intc-ic";
+          reg = <0x0 0x100 0x0 0x10>;
+          #interrupt-cells = <2>;
+          interrupt-controller;
+          interrupts-extended = <&intc0_11 0 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
         };
+      };
     };
-- 
2.34.1


