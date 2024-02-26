Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAB2866996
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Feb 2024 06:17:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NiuIa6GK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjplL0LT6z3cHC
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Feb 2024 16:17:18 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NiuIa6GK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjplD2B4Vz3bc2
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Feb 2024 16:17:12 +1100 (AEDT)
Received: from localhost.localdomain (ppp118-210-168-240.adl-adc-lon-bras34.tpg.internode.on.net [118.210.168.240])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 903582014E;
	Mon, 26 Feb 2024 13:17:06 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1708924629;
	bh=mdH/1Yorj+DulUAB+fzBS9UNRkSo6PY+idiU6w3jbB8=;
	h=From:To:Cc:Subject:Date;
	b=NiuIa6GKxthSeyOFdS7yvPAHZDjJZH7sFgYK7cqscvcSb2EIrZX/ltbvPzG/ueOiq
	 7h6gY6B1eI0Et+vksQapQ4VbFsSd5uDMhxMnJvzEY3tEMd2eZgO+ix6A6hmEWT4o5R
	 kR6r0+NRnbR4tOqV5xV38TyrMAsrBt73m5Lc9zEKSyvy+tMOHt2RltpEdH061A713q
	 UfL3Y+14UcELHI4/pnJ4MQ10CIvSMkAMgzEkMIIc5e7kiTaNZIm5MYY3TV9MrM1QOt
	 qBA1oyf4pUrUyzi/zHoL4hLJEQ1ew47D0TbLg2Qu9mdP/2YXcsTQv/CicOOH20QGgs
	 Opqw2ARSAwmCQ==
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v3] dt-bindings: gpio: aspeed,ast2400-gpio: Convert to DT schema
Date: Mon, 26 Feb 2024 15:46:45 +1030
Message-Id: <20240226051645.414935-1-andrew@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Squash warnings such as:

```
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: /ahb/apb@1e600000/gpio@1e780000: failed to match any schema with compatible: ['aspeed,ast2400-gpio']
```

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
v3: Base on v6.8-rc6, fix yamllint warning

    Rob's bot picked the missing `#interrupt-cells` in the example on v2[1]. The
    patch was based on v6.8-rc1, and going back over my shell history I missed
    the following output from `make dt_binding_check`:

    ```
    ...
      LINT    Documentation/devicetree/bindings
      usage: yamllint [-h] [-] [-c CONFIG_FILE | -d CONFIG_DATA] [--list-files] [-f {parsable,standard,colored,github,auto}] [-s] [--no-warnings] [-v] [FILE_OR_DIR ...]
      yamllint: error: one of the arguments FILE_OR_DIR - is required   
    ...
    ```

    I've rebased on v6.8-rc6 and no-longer see the issue with the invocation
    of `yamllint`.

[1]: https://lore.kernel.org/all/170892197611.2260479.15343562563553959436.robh@kernel.org/

v2: https://lore.kernel.org/all/20240226031951.284847-1-andrew@codeconstruct.com.au/

    Address feedback from Krzysztof:
    https://lore.kernel.org/all/0d1dd262-b6dd-4d71-9239-8b0aec8cceff@linaro.org/

v1: https://lore.kernel.org/all/20240220052918.742793-1-andrew@codeconstruct.com.au/

 .../bindings/gpio/aspeed,ast2400-gpio.yaml    | 74 +++++++++++++++++++
 .../devicetree/bindings/gpio/gpio-aspeed.txt  | 39 ----------
 2 files changed, 74 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-aspeed.txt

diff --git a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
new file mode 100644
index 000000000000..31fa8959c0e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed GPIO controller
+
+maintainers:
+  - Andrew Jeffery <andrew@codeconstruct.com.au>
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2400-gpio
+      - aspeed,ast2500-gpio
+      - aspeed,ast2600-gpio
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: The clock to use for debounce timings
+
+  gpio-controller: true
+  gpio-line-names: true
+  gpio-ranges: true
+
+  "#gpio-cells":
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  ngpios: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+  - gpio-controller
+  - "#gpio-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: aspeed,ast2600-gpio
+    then:
+      required:
+        - ngpios
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@1e780000 {
+        compatible = "aspeed,ast2400-gpio";
+        reg = <0x1e780000 0x1000>;
+        interrupts = <20>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
diff --git a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
deleted file mode 100644
index b2033fc3a71a..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-Aspeed GPIO controller Device Tree Bindings
--------------------------------------------
-
-Required properties:
-- compatible		: Either "aspeed,ast2400-gpio", "aspeed,ast2500-gpio",
-					or "aspeed,ast2600-gpio".
-
-- #gpio-cells 		: Should be two
-			  - First cell is the GPIO line number
-			  - Second cell is used to specify optional
-			    parameters (unused)
-
-- reg			: Address and length of the register set for the device
-- gpio-controller	: Marks the device node as a GPIO controller.
-- interrupts		: Interrupt specifier (see interrupt bindings for
-			  details)
-- interrupt-controller	: Mark the GPIO controller as an interrupt-controller
-
-Optional properties:
-
-- clocks		: A phandle to the clock to use for debounce timings
-- ngpios		: Number of GPIOs controlled by this controller. Should	be set
-				  when there are multiple GPIO controllers on a SoC (ast2600).
-
-The gpio and interrupt properties are further described in their respective
-bindings documentation:
-
-- Documentation/devicetree/bindings/gpio/gpio.txt
-- Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
-
-  Example:
-	gpio@1e780000 {
-		#gpio-cells = <2>;
-		compatible = "aspeed,ast2400-gpio";
-		gpio-controller;
-		interrupts = <20>;
-		reg = <0x1e780000 0x1000>;
-		interrupt-controller;
-	};

base-commit: d206a76d7d2726f3b096037f2079ce0bd3ba329b
-- 
2.39.2

