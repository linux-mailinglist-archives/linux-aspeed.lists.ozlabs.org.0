Return-Path: <linux-aspeed+bounces-3515-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJJzMkvejmluFgEAu9opvQ
	(envelope-from <linux-aspeed+bounces-3515-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Feb 2026 09:18:19 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1477133E69
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Feb 2026 09:18:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fC4mm3NX5z2yY0;
	Fri, 13 Feb 2026 19:18:16 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770970696;
	cv=none; b=h/FB2ChWe42S7GPU89OndyP4Hi2uw4zt3+b2vBnjcLT1K1+ZaHcRS7OHt/8KO2omFGyYcgl2mUjgyBbHJcAItFc9Q4gR63EvNv887ZFd3Qyl+l9AMZgjXJUqo7bktxqtd4OJdQ+u0Yu4rtRYi1yBhGd/FovXwQNSG79YL6iCytHwUNJcxNW0eoywKawNGxj93+Yh7HyxbHtdnDFSngYzOFWbUK7VY2Z1kPotWlKPvHM6cyRwboRFIClwZQXHo2hwb3Aiad+T28LpA5fufldSNHbPR8fuvBWrbuDXiOe7IDftM4RjA0r21/qkuVGtoXdQDNXEnw2HaIEZ2jh0cNFg7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770970696; c=relaxed/relaxed;
	bh=Br9Puazq3H86pm257fGD9Ivu1VHCNHj04CU7XXQMAuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BRDML1lqAzhzRAvxoPjkeUijvwkcjMrVXQqzl+6iw3g2mVocI6LAgtxx67nZ9yMS2fGD7t275d7yuJl6QC6epPDDbTbFukbFuvQY9IESNMZQc5coxE5a42mYOcnIPCeGWk3cJ2zyBJfuy08xBvh1P3ehPxqS/3JlRBItU6aSCMiGY6/1BF8LWUTHeVdBL1Q+VXUFZoZ5hgeV+cD84MkflKC72qo0oRbzINLdxiDU27j4AS33/Jwrd5K10YlXHKN36aKi/li65hQGaqUouJ7TcXJ3B7fPPIOa5duqP9MKfLFtQT9d7U8kwjm8RqQ7tlauUFbEJxLPfpHu3aEC4CCukA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fC4mk6nZ8z2xdY
	for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Feb 2026 19:18:14 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 13 Feb
 2026 16:17:55 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Feb 2026 16:17:55 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 13 Feb 2026 16:17:42 +0800
Subject: [PATCH RFC 1/2] dt-bindings: pinctrl: Add pinctrl-packed
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260213-pinctrl-single-bit-v1-1-c60f2fb80efb@aspeedtech.com>
References: <20260213-pinctrl-single-bit-v1-0-c60f2fb80efb@aspeedtech.com>
In-Reply-To: <20260213-pinctrl-single-bit-v1-0-c60f2fb80efb@aspeedtech.com>
To: Linus Walleij <linusw@kernel.org>, Tony Lindgren <tony@atomide.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>
CC: <patrickw3@meta.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<BMC-SW@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770970675; l=6251;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=btGp9Y9DY2YDzIKxQ4nzYfeU8KTNhNWyQaI1KcxpA8s=;
 b=s7ZgCtBuEJiKRU4PE4pTcsjmidOPe6Pr3I1F2LQbrMy2qT2AWW6Qip1McM+yHx0XX+Y2n7bVc
 zLiNwujNN/bAUthtPElUQpJiisIpUfI06GadbLUWPhHZhIFmTf8Wot1
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3515-lists,linux-aspeed=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[billy_tsai@aspeedtech.com,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:tony@atomide.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:brgl@kernel.org,m:patrickw3@meta.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:BMC-SW@aspeedtech.com,m:billy_tsai@aspeedtech.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCPT_COUNT_TWELVE(0.00)[16];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D1477133E69
X-Rspamd-Action: no action

Add a Devicetree binding for a generic pin controller where pinmux and/or
pin configuration are represented as fixed-width fields packed
sequentially within shared registers.

The binding targets controllers that are typically exposed as subnodes of
a syscon node and accessed via regmap-mmio through the parent.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../bindings/pinctrl/pinctrl-packed.yaml           | 166 +++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-packed.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-packed.yaml
new file mode 100644
index 000000000000..dd01ba2fed71
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-packed.yaml
@@ -0,0 +1,166 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/pinctrl-packed.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Pin Controller with Packed-Field Registers
+
+maintainers:
+  - Billy Tsai <billy_tsai@aspeedtech.com>
+
+description:
+  This binding describes pin controller hardware where pinmux and/or
+  pin configuration fields are represented as fixed-width fields packed
+  sequentially within shared registers.
+
+  Such controllers are commonly embedded within a larger system control
+  unit (SCU) register block and may be exposed as subnodes of a syscon
+  device.
+
+  Conceptually, this model is related to the pinctrl-single binding,
+  but instead of describing individual register offsets via
+  <offset, value, mask> tuples, the hardware provides fixed-width,
+  per-pin fields packed linearly within shared registers.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - pinctrl-packed
+          - pinconf-packed
+
+  reg:
+    maxItems: 1
+
+  '#pinctrl-cells':
+    description:
+      The pinctrl provider uses standard state nodes referenced by pinctrl-N
+      properties; consumers do not pass per-pin arguments via phandle.
+    const: 1
+
+  pinctrl-packed,function-mask:
+    description: Mask of the allowed register bits for a single pin.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  pinctrl-packed,gpio-range:
+    description: Optional list of pin base, nr pins & gpio function.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: phandle of a gpio-range node
+        - description: pin base
+        - description: number of pins
+        - description: gpio function
+
+patternProperties:
+  '-pins(-[0-9]+)?$|-pin$':
+    type: object
+    additionalProperties: false
+
+    properties:
+      pinctrl-packed,pins:
+        description: Array of pin index and function selector pairs.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+
+      pinctrl-packed,bias-pullup:
+        description: Optional bias pull-up configuration.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        maxItems: 4
+        items:
+          - description: Input value.
+          - description: Enabled pull-up bits.
+          - description: Disabled pull-up bits.
+          - description: Pull-up mask.
+        additionalItems: false
+
+      pinctrl-packed,bias-pulldown:
+        description: Optional bias pull-down configuration.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        maxItems: 4
+        items:
+          - description: Input value.
+          - description: Enabled pull-down bits.
+          - description: Disabled pull-down bits.
+          - description: Pull-down mask.
+        additionalItems: false
+
+      pinctrl-packed,drive-strength:
+        description: Optional drive strength configuration.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        maxItems: 2
+        items:
+          - description: Drive strength value.
+          - description: Drive strength mask.
+        additionalItems: false
+
+      pinctrl-packed,input-schmitt:
+        description: Optional input Schmitt trigger configuration.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        maxItems: 2
+        items:
+          - description: Schmitt trigger value.
+          - description: Schmitt trigger mask.
+        additionalItems: false
+
+      pinctrl-packed,input-schmitt-enable:
+        description: Optional input Schmitt enable configuration.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        maxItems: 4
+        items:
+          - description: Input value.
+          - description: Enable bits.
+          - description: Disable bits.
+          - description: Schmitt mask.
+        additionalItems: false
+
+      pinctrl-packed,low-power-mode:
+        description: Optional low power mode configuration.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        maxItems: 2
+        items:
+          - description: Low power value.
+          - description: Low power mask.
+        additionalItems: false
+
+      pinctrl-packed,slew-rate:
+        description: Optional slew rate configuration.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        maxItems: 2
+        items:
+          - description: Slew rate value.
+          - description: Slew rate mask.
+        additionalItems: false
+
+required:
+  - compatible
+  - reg
+  - "#pinctrl-cells"
+  - pinctrl-packed,function-mask
+
+additionalProperties: false
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+examples:
+  - |
+    syscon@0 {
+        compatible = "syscon", "simple-mfd";
+        reg = <0x0 0x1000>;
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        pinctrl@400 {
+            compatible = "pinctrl-packed";
+            reg = <0x400 0x80>;
+            #pinctrl-cells = <1>;
+            pinctrl-packed,function-mask = <0xf>;
+
+            uart0-pins {
+                /* <pin_index function_select> pairs */
+                pinctrl-packed,pins = <0 2>, <1 2>;
+            };
+        };
+    };

-- 
2.34.1


