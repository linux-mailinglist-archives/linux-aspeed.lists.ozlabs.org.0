Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E652A3D8C
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Nov 2020 08:23:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQLpj54CxzDqWK
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Nov 2020 18:22:53 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chin-ting_kuo@aspeedtech.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQLpW5Rh2zDqW5
 for <linux-aspeed@lists.ozlabs.org>; Tue,  3 Nov 2020 18:22:41 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 0A37Id60008355;
 Tue, 3 Nov 2020 15:18:39 +0800 (GMT-8)
 (envelope-from chin-ting_kuo@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 Nov
 2020 15:22:11 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <clg@kaod.org>, <bbrezillon@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-spi@vger.kernel.org>
Subject: [v2 1/4] dt-bindings: spi: Add binding file for ASPEED FMC/SPI memory
 controller
Date: Tue, 3 Nov 2020 15:21:59 +0800
Message-ID: <20201103072202.24705-2-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201103072202.24705-1-chin-ting_kuo@aspeedtech.com>
References: <20201103072202.24705-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0A37Id60008355
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

Create binding file with YAML syntax for ASPEED FMC/SPI memory controller.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 .../bindings/spi/aspeed,spi-aspeed.yaml       | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/aspeed,spi-aspeed.yaml

diff --git a/Documentation/devicetree/bindings/spi/aspeed,spi-aspeed.yaml b/Documentation/devicetree/bindings/spi/aspeed,spi-aspeed.yaml
new file mode 100644
index 000000000000..41b9692c7226
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/aspeed,spi-aspeed.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/aspeed,spi-aspeed.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SPI memory controller for ASPEED SoCs
+
+maintainers:
+  - Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
+
+description: |
+  There are three SPI memory controllers embedded in a ASPEED SoC.
+  They are usually connected to SPI NOR flashes. Each of them has
+  more than a chip select. They also support SPI single, dual and
+  quad IO modes for SPI NOR flash.
+
+allOf:
+  - $ref: /spi/spi-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - aspeed,ast2600-fmc
+              - aspeed,ast2600-spi
+
+  reg:
+    items:
+      - description: the control register location and length
+      - description: the flash memory mapping address and length
+
+  clocks:
+    description: AHB bus clock which will be converted to SPI bus clock
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - num-cs
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/ast2600-clock.h>
+    spi1: spi@1e630000 {
+      compatible = "aspeed,ast2600-spi";
+      reg = <0x1e630000 0xc4>, <0x30000000 0x10000000>;
+      reg-names = "spi_ctrl_reg", "spi_mmap";
+      clocks = <&syscon ASPEED_CLK_AHB>;
+      num-cs = <2>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      flash@0 {
+        compatible = "jedec,spi-nor";
+        reg = <0>;
+        spi-max-frequency = <50000000>;
+      };
+      flash@1 {
+        compatible = "jedec,spi-nor";
+        reg = <1>;
+        spi-max-frequency = <50000000>;
+      };
+    };
-- 
2.17.1

