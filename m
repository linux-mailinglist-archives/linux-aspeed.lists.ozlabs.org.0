Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5479457A4
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 07:37:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=BrsLvjTS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZvj84MgLz3cjX
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 15:37:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=BrsLvjTS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZvhz1Q1Jz3cQM
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 15:36:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722577008;
	bh=21uSmggtGjSSVl6e7jX24nwcCPrx0PnGnisi64/bATE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BrsLvjTSbq/dLJDxRJrGY8ZONIDIrNmWysoYOSZXq0D6gRbk9noL/m8qF3SV9Pxu3
	 rTZH0nTLNKlc6foMcgjLwdahCjWNv7LHRY+2OpIfULzBu4p6nfD0MQYgOGUjyZlSpr
	 QG6gJpvH5EfR7ok0Mx6Wkv8PQpKYl/FrYYhnGjshNP1HJN9TyvqRNMo368KIqPaAP5
	 AlovjGXWRvUrRhzhv2jlsNKkiR8dmXiEubwhAE6i8RyEG4B3uSD4sxkHlPaOW/6c2N
	 O3VYItOJAzfTD8Czv+ZAEUKvomQLL+HF1zgL/7YLeSvFJUJpwolV9azWSGoTc5QcuU
	 IfbhG54tYwkxw==
Received: from [127.0.1.1] (ppp118-210-29-70.adl-adc-lon-bras31.tpg.internode.on.net [118.210.29.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4776E66CBD;
	Fri,  2 Aug 2024 13:36:48 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Fri, 02 Aug 2024 15:06:30 +0930
Subject: [PATCH 1/2] dt-bindings: interrupt-controller: aspeed,ast2400-vic:
 Convert to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240802-dt-warnings-irq-aspeed-dt-schema-v1-1-8cd4266d2094@codeconstruct.com.au>
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

Squash warnings such as:

    arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: /ahb/interrupt-controller@1e6c0080: failed to match any schema with compatible: ['aspeed,ast2400-vic']

The YAML DT schema defines an optional property, valid-sources, which
was not previously described in the prose binding. It is added to
document existing practice in the Aspeed devicetrees. Unfortunately
the property seems to predate the requirement that vendor-specific
properties be prefixed.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 .../interrupt-controller/aspeed,ast2400-vic.txt    | 23 --------
 .../interrupt-controller/aspeed,ast2400-vic.yaml   | 63 ++++++++++++++++++++++
 2 files changed, 63 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.txt b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.txt
deleted file mode 100644
index e3fea0758d25..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Aspeed Vectored Interrupt Controller
-
-These bindings are for the Aspeed interrupt controller. The AST2400 and
-AST2500 SoC families include a legacy register layout before a re-designed
-layout, but the bindings do not prescribe the use of one or the other.
-
-Required properties:
-
-- compatible : "aspeed,ast2400-vic"
-               "aspeed,ast2500-vic"
-
-- interrupt-controller : Identifies the node as an interrupt controller
-- #interrupt-cells : Specifies the number of cells needed to encode an
-  interrupt source. The value shall be 1.
-
-Example:
-
- vic: interrupt-controller@1e6c0080 {
-      compatible = "aspeed,ast2400-vic";
-      interrupt-controller;
-      #interrupt-cells = <1>;
-      reg = <0x1e6c0080 0x80>;
- };
diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.yaml b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.yaml
new file mode 100644
index 000000000000..1ecbc55571e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2400-vic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed Vectored Interrupt Controller
+
+maintainers:
+  - Andrew Jeffery <andrew@codeconstruct.com.au>
+
+description:
+  The AST2400 and AST2500 SoC families include a legacy register layout before
+  a redesigned layout, but the bindings do not prescribe the use of one or the
+  other.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2400-vic
+      - aspeed,ast2500-vic
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+    description:
+      Specifies the number of cells needed to encode an interrupt source. It
+      must be 1 as the VIC has no configuration options for interrupt sources.
+      The single cell defines the interrupt number.
+
+  valid-sources:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      One cell, bitmap of support sources for the implementation.
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - "#interrupt-cells"
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@1e6c0080 {
+         compatible = "aspeed,ast2400-vic";
+         reg = <0x1e6c0080 0x80>;
+         interrupt-controller;
+         #interrupt-cells = <1>;
+    };
+
+...

-- 
2.39.2

