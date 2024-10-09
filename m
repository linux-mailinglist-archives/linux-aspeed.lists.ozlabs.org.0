Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7A2996965
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2024 13:59:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNryW05zBz3blv
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2024 22:58:59 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728475136;
	cv=none; b=Ag02M4LlUSfNiu3izOYE4rqUSx/Exskhjl92UwZMkZKAMlt+/geFEX1WUEtXH76gT1wRhHciMsGOX61izwpToUvgEbiN9scuBLp0VBKVsRTT6Sr3TAHKKwcv8ZDDiNkXa8W3rF7GA9plZ3ugasD3N2OAjr3T7wwylwe2eWqOZXOnba8TtllorhTi2tTgI8Iz/E57v5vPkMMKvj/KWMaoimJfklFg7es6bxtzWmRwjW3jkBNVR0as6XDOnJMlOo9BhZw87c0tMHx4Gbydt7vnFi8j8DlkTbfXfwUZfiFE+dDyDIQE5bDek5gN0yIoICbqHRp3bOe8MFmPLxqafIqYlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728475136; c=relaxed/relaxed;
	bh=ze4ZFQ2rOW7RHaZyB7wXXO/kGD32nvRyk1GnbPSGOTo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N7D9OCsXjVsfRUpoGF25mXtHRsh+1PI/+eEAKVYuMicCbx0sac+dElvQzws8rEsBuSk2C5LxYyOyzr+kfmGVce1rSxr/XRBstvTdcSsTyjiA+RW1fGaaPKxBP2gtflvk1H4F+sym/ahn0ZPhx/KZR9Uxiub55XnoObvX9fPeAyNipx3H8hWdg7ANCsl2uOHAhAmvwB6B7PecIHkGe14rneKjDzlW4NKcnBT2PwiyIVRVUgg9y0WJ9tupyEz5RziyesTZJ1H2odUZMV5XIqBUIG42wlVgWqadw4JWB5tBMqhR/+RqQP9KEqBwvQymJ8WxhCMdLJnC6xRuMl3ey1dg4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNryQ2gzbz2x9N
	for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Oct 2024 22:58:53 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 9 Oct
 2024 19:58:18 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 9 Oct 2024 19:58:18 +0800
From: Kevin Chen <kevin_chen@aspeedtech.com>
To: <tglx@linutronix.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<kevin_chen@aspeedtech.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v3 1/2] dt-bindings: interrupt-controller: Add support for ASPEED AST27XX INTC
Date: Wed, 9 Oct 2024 19:58:12 +0800
Message-ID: <20241009115813.2908803-2-kevin_chen@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241009115813.2908803-1-kevin_chen@aspeedtech.com>
References: <20241009115813.2908803-1-kevin_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

The ASPEED AST27XX interrupt controller(INTC) contain second level and
third level interrupt controller.

INTC0:
The second level INTC, which used to assert GIC(#192~#197) if interrupt
in INTC1 asserted. There are 6 GIC interrupt number(#192~#197) used in
one INTC0.

INTC1_x:
The third level INTC, which used to assert GIC(#192~#197) if interrupt in
INTC1 asserted. There are 6 GIC interrupt number(#192~#197) used in one INTC0.

Signed-off-by: Kevin Chen <kevin_chen@aspeedtech.com>
---
 .../aspeed,ast2700-intc.yaml                  | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
new file mode 100644
index 000000000000..650a1f6e1177
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed AST2700 Interrupt Controller
+
+description:
+  This interrupt controller hardware is second level interrupt controller that
+  is hooked to a parent interrupt controller. It's useful to combine multiple
+  interrupt sources into 1 interrupt to parent interrupt controller.
+
+maintainers:
+  - Kevin Chen <kevin_chen@aspeedtech.com>
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2700-intc-ic
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupts:
+    maxItems: 10
+    description:
+      Depend to which INTC0 or INTC1 used.
+      INTC0 and INTC1 are two kinds of interrupt controller with enable and raw
+      status registers for use.
+      INTC0 is used to assert GIC if interrupt in INTC1 asserted.
+      INTC1 is used to assert INTC0 if interrupt of modules asserted.
+      +-----+   +-------+     +---------+---module0
+      | GIC |---| INTC0 |--+--| INTC1_0 |---module2
+      |     |   |       |  |  |         |---...
+      +-----+   +-------+  |  +---------+---module31
+                           |
+                           |   +---------+---module0
+                           +---| INTC1_1 |---module2
+                           |   |         |---...
+                           |   +---------+---module31
+                          ...
+                           |   +---------+---module0
+                           +---| INTC1_5 |---module2
+                               |         |---...
+                               +---------+---module31
+
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        interrupt-controller@12101b00 {
+            compatible = "aspeed,ast2700-intc-ic";
+            reg = <0 0x12101b00 0 0x10>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+            interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
-- 
2.34.1

