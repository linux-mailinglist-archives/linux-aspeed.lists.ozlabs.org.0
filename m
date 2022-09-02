Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5DF5AA779
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Sep 2022 08:01:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJnNj5592z2yyd
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Sep 2022 16:01:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=neal_liu@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJnNf1BgYz2xrX
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Sep 2022 16:01:36 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 2825eWm6091015;
	Fri, 2 Sep 2022 13:40:33 +0800 (GMT-8)
	(envelope-from neal_liu@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 2 Sep
 2022 14:00:16 +0800
From: Neal Liu <neal_liu@aspeedtech.com>
To: Dhananjay Phadke <dphadke@linux.microsoft.com>,
        Herbert Xu
	<herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        "Joel Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Rob
 Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        "Chia-Wei Wang --cc=linux-kernel @ vger
 . kernel . org" <chiawei_wang@aspeedtech.com>
Subject: [PATCH v1 3/4] dt-bindings: crypto: add documentation for Aspeed ACRY
Date: Fri, 2 Sep 2022 14:00:11 +0800
Message-ID: <20220902060012.3758637-4-neal_liu@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902060012.3758637-1-neal_liu@aspeedtech.com>
References: <20220902060012.3758637-1-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2825eWm6091015
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add device tree binding documentation for the Aspeed
ECDSA/RSA ACRY Engines Controller.

Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
---
 .../bindings/crypto/aspeed,ast2600-acry.yaml  | 49 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/crypto/aspeed,ast2600-acry.yaml

diff --git a/Documentation/devicetree/bindings/crypto/aspeed,ast2600-acry.yaml b/Documentation/devicetree/bindings/crypto/aspeed,ast2600-acry.yaml
new file mode 100644
index 000000000000..192b40cd0a39
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/aspeed,ast2600-acry.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED ACRY ECDSA/RSA Hardware Accelerator Engines Device Tree Bindings
+
+maintainers:
+  - Neal Liu <neal_liu@aspeedtech.com>
+
+description: |
+  The ACRY ECDSA/RSA engines is designed to accelerate the throughput
+  of ECDSA/RSA signature and verification. Basically, ACRY can be
+  divided into two independently engines - ECC Engine and RSA Engine.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2600-acry
+
+  reg:
+    items:
+      - description: acry base address & size
+      - description: acry sram base address & size
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/ast2600-clock.h>
+    acry: crypto@1e6fa000 {
+        compatible = "aspeed,ast2600-acry";
+        reg = <0x1e6fa000 0x400>, <0x1e710000 0x1800>;
+        interrupts = <160>;
+        clocks = <&syscon ASPEED_CLK_GATE_RSACLK>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 832da6d77374..09ab1c3adbb7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3214,7 +3214,7 @@ ASPEED CRYPTO DRIVER
 M:	Neal Liu <neal_liu@aspeedtech.com>
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
 S:	Maintained
-F:	Documentation/devicetree/bindings/crypto/aspeed,ast2500-hace.yaml
+F:	Documentation/devicetree/bindings/crypto/aspeed,*
 F:	drivers/crypto/aspeed/
 
 ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
-- 
2.25.1

