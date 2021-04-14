Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D1835F1B7
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Apr 2021 12:52:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKznW2W21z30FQ
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Apr 2021 20:52:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=billy_tsai@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKznS3gysz2xfn
 for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Apr 2021 20:52:11 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 13EAd1LU057544;
 Wed, 14 Apr 2021 18:39:01 +0800 (GMT-8)
 (envelope-from billy_tsai@aspeedtech.com)
Received: from BillyTsai-pc.aspeed.com (192.168.2.149) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 14 Apr
 2021 18:49:31 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <lee.jones@linaro.org>, <robh+dt@kernel.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <p.zabel@pengutronix.de>,
 <billy_tsai@aspeedtech.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>
Subject: [v2 1/2] dt-bindings: Add bindings for aspeed pwm-tach and pwm.
Date: Wed, 14 Apr 2021 18:49:38 +0800
Message-ID: <20210414104939.1093-2-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210414104939.1093-1-billy_tsai@aspeedtech.com>
References: <20210414104939.1093-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.149]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 13EAd1LU057544
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
Cc: BMC-SW@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This patch adds device bindings for aspeed pwm-tach device which is a
multi-function device include pwn and tach function and pwm device which
should be the sub-node of pwm-tach device.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Change-Id: I18d9dea14c3a04e1b7e38ffecd49d45917b9b545
---
 .../bindings/mfd/aspeed,ast2600-pwm-tach.yaml | 60 +++++++++++++++++++
 .../bindings/pwm/aspeed,ast2600-pwm.yaml      | 44 ++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
 create mode 100644 Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml

diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
new file mode 100644
index 000000000000..eaf8bdf8d44e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2021 ASPEED, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/aspeed,ast2600-pwm-tach.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PWM Tach controller Device Tree Bindings
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
+  reg:
+    maxItems: 1
+  "#address-cells":
+    const: 1
+  "#size-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties:
+  type: object
+
+examples:
+  - |
+    pwm_tach: pwm_tach@1e610000 {
+      compatible = "aspeed,ast2600-pwm-tach", "syscon", "simple-mfd";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      reg = <0x1e610000 0x100>;
+
+      pwm: pwm@0 {
+        compatible = "aspeed,ast2600-pwm";
+        #pwm-cells = <3>;
+        reg = <0x0 0x100>;
+      };
+
+      tach: tach@1 {
+        compatible = "aspeed,ast2600-tach";
+        reg = <0x0 0x100>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml b/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
new file mode 100644
index 000000000000..97923e68ccb9
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2021 ASPEED, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/aspeed,ast2600-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2600 PWM controller
+
+maintainers:
+  - Billy Tsai <billy_tsai@aspeedtech.com>
+
+description: |
+  The ASPEED PWM controller can support upto 16 PWM outputs.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2600-pwm
+
+  "#pwm-cells":
+    const: 3
+
+  reg:
+    maxItems: 1
+
+additionalProperties: false
+
+examples:
+  - |
+    // The PWM should be a subnode of a "aspeed,ast2600-pwm-tach" compatible
+    // node.
+    pwm_tach: pwm_tach@1e610000 {
+      compatible = "aspeed,ast2600-pwm-tach", "syscon", "simple-mfd";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      reg = <0x1e610000 0x100>;
+
+      pwm: pwm@0 {
+        compatible = "aspeed,ast2600-pwm";
+        #pwm-cells = <3>;
+        reg = <0x0 0x100>;
+      };
+    };
-- 
2.25.1

