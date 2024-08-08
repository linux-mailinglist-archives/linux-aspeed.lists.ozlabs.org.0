Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E89D894B5D6
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Aug 2024 06:15:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ew2a9bdp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfYbl1Hxgz3dLS
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Aug 2024 14:14:59 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ew2a9bdp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfYbW6pSLz3cjt
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Aug 2024 14:14:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1723090487;
	bh=zIjev60vJCRiNsPPi+LvlB3D8Ln+9QLJSlUZ5NQKHQI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ew2a9bdpziluTiV6kHB2atR+og2mPO0pHxrTP1ctbg3pgwE/hmJm1+w47oQQz1hBp
	 mskBNAjhkczrTfhJkZ/o5YJEr7dNHWzPqk6045hmHMQ48W4gh1KJvytSrPE3Tg3WM6
	 VX09XihxIfsHw7yX8YthTWsScEMoqME79V9EZwk5kXrgv1G7nYybYnHWFTaGZnfqwp
	 NP2b+/fZ83xPtnUi2PgPkVdAtBILI21zubJaRsOTq+sQmQS/k/PhRSRrowtNOdciWn
	 cC2vAwvLwu/LwJ9boPxtjpzRqJ3PM+4+YCYmeRb+4fUhvGKRYOpJe2nVZj/OdM/T79
	 sdYd/ElAkkUtQ==
Received: from [127.0.1.1] (203-57-213-111.dyn.iinet.net.au [203.57.213.111])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D2EEF66FA3;
	Thu,  8 Aug 2024 12:14:46 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 08 Aug 2024 13:44:25 +0930
Subject: [PATCH v2 2/2] dt-bindings: misc: aspeed,ast2400-cvic: Convert to
 DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240808-dt-warnings-irq-aspeed-dt-schema-v2-2-c2531e02633d@codeconstruct.com.au>
References: <20240808-dt-warnings-irq-aspeed-dt-schema-v2-0-c2531e02633d@codeconstruct.com.au>
In-Reply-To: <20240808-dt-warnings-irq-aspeed-dt-schema-v2-0-c2531e02633d@codeconstruct.com.au>
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
index 000000000000..accf1a7ecf12
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
+    maxItems: 1
+    description:
+      A bitmap of supported sources for the implementation.
+
+  copro-sw-interrupts:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 32
+    description:
+      A list of interrupt numbers that can be used as software interrupts from
+      the ARM to the coprocessor.
+
+required:
+  - compatible
+  - reg
+  - valid-sources
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

