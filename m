Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6C9399EC9
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Jun 2021 12:19:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwhhJ4gHbz301W
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Jun 2021 20:19:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=steven_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwhhC3xSXz2yx2
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Jun 2021 20:19:04 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 153A5002044880;
 Thu, 3 Jun 2021 18:05:00 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from slee-VirtualBox.localdomain (192.168.100.253) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Jun 2021 18:18:27 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, "open list:GPIO
 SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/5] dt-bindings: aspeed-sgpio: Convert txt bindings to
 yaml.
Date: Thu, 3 Jun 2021 18:18:17 +0800
Message-ID: <20210603101822.9645-2-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210603101822.9645-1-steven_lee@aspeedtech.com>
References: <20210603101822.9645-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 153A5002044880
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
Cc: steven_lee@aspeedtech.com, Hongweiz@ami.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

sgpio-aspeed bindings should be converted to yaml format.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 .../bindings/gpio/aspeed,sgpio.yaml           | 78 +++++++++++++++++++
 .../devicetree/bindings/gpio/sgpio-aspeed.txt | 46 -----------
 2 files changed, 78 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt

diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
new file mode 100644
index 000000000000..e7c2113cc096
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/aspeed,sgpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed SGPIO controller
+
+maintainers:
+  - Andrew Jeffery <andrew@aj.id.au>
+
+description:
+  This SGPIO controller is for ASPEED AST2400, AST2500 and AST2600 SoC,
+  AST2600 have two sgpio master one with 128 pins another one with 80 pins,
+  AST2500/AST2400 have one sgpio master with 80 pins. Each of the Serial
+  GPIO pins can be programmed to support the following options
+  - Support interrupt option for each input port and various interrupt
+    sensitivity option (level-high, level-low, edge-high, edge-low)
+  - Support reset tolerance option for each output port
+  - Directly connected to APB bus and its shift clock is from APB bus clock
+    divided by a programmable value.
+  - Co-work with external signal-chained TTL components (74LV165/74LV595)
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2400-sgpio
+      - aspeed,ast2500-sgpio
+      - aspeed,ast2600-sgpiom1
+      - aspeed,ast2600-sgpiom2
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  clocks:
+    maxItems: 1
+
+  ngpios: true
+
+  bus-frequency: true
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+  - interrupts
+  - interrupt-controller
+  - ngpios
+  - clocks
+  - bus-frequency
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/aspeed-clock.h>
+    sgpio: sgpio@1e780200 {
+        #gpio-cells = <2>;
+        compatible = "aspeed,ast2500-sgpio";
+        gpio-controller;
+        interrupts = <40>;
+        reg = <0x1e780200 0x0100>;
+        clocks = <&syscon ASPEED_CLK_APB>;
+        interrupt-controller;
+        ngpios = <80>;
+        bus-frequency = <12000000>;
+    };
diff --git a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
deleted file mode 100644
index be329ea4794f..000000000000
--- a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-Aspeed SGPIO controller Device Tree Bindings
---------------------------------------------
-
-This SGPIO controller is for ASPEED AST2500 SoC, it supports up to 80 full
-featured Serial GPIOs. Each of the Serial GPIO pins can be programmed to
-support the following options:
-- Support interrupt option for each input port and various interrupt
-  sensitivity option (level-high, level-low, edge-high, edge-low)
-- Support reset tolerance option for each output port
-- Directly connected to APB bus and its shift clock is from APB bus clock
-  divided by a programmable value.
-- Co-work with external signal-chained TTL components (74LV165/74LV595)
-
-Required properties:
-
-- compatible : Should be one of
-  "aspeed,ast2400-sgpio", "aspeed,ast2500-sgpio"
-- #gpio-cells : Should be 2, see gpio.txt
-- reg : Address and length of the register set for the device
-- gpio-controller : Marks the device node as a GPIO controller
-- interrupts : Interrupt specifier, see interrupt-controller/interrupts.txt
-- interrupt-controller : Mark the GPIO controller as an interrupt-controller
-- ngpios : number of *hardware* GPIO lines, see gpio.txt. This will expose
-  2 software GPIOs per hardware GPIO: one for hardware input, one for hardware
-  output. Up to 80 pins, must be a multiple of 8.
-- clocks : A phandle to the APB clock for SGPM clock division
-- bus-frequency : SGPM CLK frequency
-
-The sgpio and interrupt properties are further described in their respective
-bindings documentation:
-
-- Documentation/devicetree/bindings/gpio/gpio.txt
-- Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
-
-  Example:
-	sgpio: sgpio@1e780200 {
-		#gpio-cells = <2>;
-		compatible = "aspeed,ast2500-sgpio";
-		gpio-controller;
-		interrupts = <40>;
-		reg = <0x1e780200 0x0100>;
-		clocks = <&syscon ASPEED_CLK_APB>;
-		interrupt-controller;
-		ngpios = <8>;
-		bus-frequency = <12000000>;
-	};
-- 
2.17.1

