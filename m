Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 064805F3BA7
	for <lists+linux-aspeed@lfdr.de>; Tue,  4 Oct 2022 05:30:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhNWB5KXjz3blj
	for <lists+linux-aspeed@lfdr.de>; Tue,  4 Oct 2022 14:30:14 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=neal_liu@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhNVx5cMnz2y33
	for <linux-aspeed@lists.ozlabs.org>; Tue,  4 Oct 2022 14:29:58 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 29437FXe092749;
	Tue, 4 Oct 2022 11:07:16 +0800 (GMT-8)
	(envelope-from neal_liu@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 Oct
 2022 11:28:49 +0800
From: Neal Liu <neal_liu@aspeedtech.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller"
	<davem@davemloft.net>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@aj.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        "Chia-Wei Wang --cc=linux-kernel @ vger
 . kernel . org" <chiawei_wang@aspeedtech.com>
Subject: [PATCH v2 4/4] dt-bindings: bus: add documentation for Aspeed AHBC
Date: Tue, 4 Oct 2022 11:28:41 +0800
Message-ID: <20221004032841.3714928-5-neal_liu@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221004032841.3714928-1-neal_liu@aspeedtech.com>
References: <20221004032841.3714928-1-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 29437FXe092749
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-crypto@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add device tree binding documentation for the Aspeed
Advanced High-Performance Bus (AHB) Controller.

Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
---
 .../bindings/bus/aspeed,ast2600-ahbc.yaml     | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml

diff --git a/Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml b/Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml
new file mode 100644
index 000000000000..c42a350d30a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED Advanced High-Performance Bus Controller (AHBC) Device Tree Bindings
+
+maintainers:
+  - Neal Liu <neal_liu@aspeedtech.com>
+  - Chia-Wei Wang <chiawei_wang@aspeedtech.com>
+
+description: |
+  Advanced High-performance Bus Controller (AHBC) supports plenty of mechanisms
+  including a priority arbiter, an address decoder and a data multiplexer
+  to control the overall operations of Advanced High-performance
+  Bus (AHB). AHB is the main system bus for ARM CPU to communicate with the
+  related peripherals.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2600-ahbc
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    bus {
+        compatible = "simple-bus";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        ahbc: bus@1e600000 {
+            compatible = "aspeed,ast2600-ahbc";
+            reg = <0x1e600000 0x100>;
+        };
+    };
-- 
2.25.1

