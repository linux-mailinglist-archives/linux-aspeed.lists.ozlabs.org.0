Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF3B723E13
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Jun 2023 11:45:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb5FP1hnJz3dsf
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Jun 2023 19:45:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=mail.aspeedtech.com; envelope-from=billy_tsai@aspeedtech.com; receiver=<UNKNOWN>)
Received: from mail.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb5F72TZdz3bdV
	for <linux-aspeed@lists.ozlabs.org>; Tue,  6 Jun 2023 19:45:31 +1000 (AEST)
Received: from BillyTsai-pc.aspeed.com (192.168.1.221) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 6 Jun
 2023 17:43:42 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
	<lee@kernel.org>, <thierry.reding@gmail.com>,
	<u.kleine-koenig@pengutronix.de>, <corbet@lwn.net>, <p.zabel@pengutronix.de>,
	<billy_tsai@aspeedtech.com>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-doc@vger.kernel.org>, <patrick@stwcx.xyz>
Subject: [v5 3/5] dt-bindings: mfd: Add aspeed pwm-tach binding
Date: Tue, 6 Jun 2023 17:45:33 +0800
Message-ID: <20230606094535.5388-4-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230606094535.5388-1-billy_tsai@aspeedtech.com>
References: <20230606094535.5388-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.1.221]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
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

Add device binding for aspeed pwm-tach device which is a multi-function
device include pwm and tach function.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

---
 .../bindings/mfd/aspeed,ast2600-pwm-tach.yaml | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml

diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
new file mode 100644
index 000000000000..f98c11ff3f8a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2021 Aspeed, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/aspeed,ast2600-pwm-tach.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PWM Tach controller
+
+description: |
+  The PWM Tach controller is represented as a multi-function device which
+  includes:
+    PWM
+    Tach
+
+maintainers:
+  - Billy Tsai <billy_tsai@aspeedtech.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - aspeed,ast2600-pwm-tach
+      - const: syscon
+      - const: simple-mfd
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
+  pwm:
+    type: object
+    $ref: "/schemas/pwm/aspeed,ast2600-pwm.yaml"
+
+  tach:
+    type: object
+    $ref: "/schemas/hwmon/aspeed,ast2600-tach.yaml"
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/ast2600-clock.h>
+    pwm_tach: pwm-tach@1e610000 {
+      compatible = "aspeed,ast2600-pwm-tach", "syscon", "simple-mfd";
+      reg = <0x1e610000 0x100>;
+      clocks = <&syscon ASPEED_CLK_AHB>;
+      resets = <&syscon ASPEED_RESET_PWM>;
+
+      pwm: pwm {
+        compatible = "aspeed,ast2600-pwm";
+        #pwm-cells = <3>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_pwm0_default>;
+      };
+
+      tach: tach {
+        compatible = "aspeed,ast2600-tach";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_tach0_default>;
+        fan@0 {
+          reg = <0x00>;
+        };
+      };
+    };
-- 
2.25.1

