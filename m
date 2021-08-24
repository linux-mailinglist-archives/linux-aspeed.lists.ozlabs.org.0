Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F3F3F5AAC
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Aug 2021 11:13:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gv3Lf6MNsz2yM7
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Aug 2021 19:13:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=billy_tsai@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gv3LZ40Hzz2xsj
 for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Aug 2021 19:13:26 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 17O8rEkd098382;
 Tue, 24 Aug 2021 16:53:14 +0800 (GMT-8)
 (envelope-from billy_tsai@aspeedtech.com)
Received: from BillyTsai-pc.aspeed.com (192.168.2.149) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 24 Aug
 2021 17:11:46 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <pmeerw@pmeerw.net>,
 <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <p.zabel@pengutronix.de>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [RESEND v4 01/15] dt-bindings: iio: adc: Add ast2600-adc bindings
Date: Tue, 24 Aug 2021 17:12:29 +0800
Message-ID: <20210824091243.9393-2-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824091243.9393-1-billy_tsai@aspeedtech.com>
References: <20210824091243.9393-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.149]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 17O8rEkd098382
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

Add device tree bindings document for the aspeed ast2600 adc device
driver.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../bindings/iio/adc/aspeed,ast2600-adc.yaml  | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml b/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml
new file mode 100644
index 000000000000..248cda7d91e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ADC that forms part of an ASPEED server management processor.
+
+maintainers:
+  - Billy Tsai <billy_tsai@aspeedtech.com>
+
+description: |
+  • 10-bits resolution for 16 voltage channels.
+  • The device split into two individual engine and each contains 8 voltage
+  channels.
+  • Channel scanning can be non-continuous.
+  • Programmable ADC clock frequency.
+  • Programmable upper and lower threshold for each channels.
+  • Interrupt when larger or less than threshold for each channels.
+  • Support hysteresis for each channels.
+  • Built-in a compensating method.
+  • Built-in a register to trim internal reference voltage.
+  • Internal or External reference voltage.
+  • Support 2 Internal reference voltage 1.2v or 2.5v.
+  • Integrate dividing circuit for battery sensing.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2600-adc0
+      - aspeed,ast2600-adc1
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description:
+      Input clock used to derive the sample clock. Expected to be the
+      SoC's APB clock.
+
+  resets:
+    maxItems: 1
+
+  "#io-channel-cells":
+    const: 1
+
+  vref-supply:
+    description:
+      The external regulator supply ADC reference voltage.
+
+  aspeed,int_vref_mv:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1200, 2500]
+    description:
+      ADC internal reference voltage in millivolts.
+
+  aspeed,battery-sensing:
+    type: boolean
+    description:
+      Inform the driver that last channel will be used to sensor battery.
+
+  aspeed,trim-data-valid:
+    type: boolean
+    description: |
+      The ADC reference voltage can be calibrated to obtain the trimming
+      data which will be stored in otp. This property informs the driver that
+      the data store in the otp is valid.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+  - "#io-channel-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/ast2600-clock.h>
+    adc0: adc@1e6e9000 {
+        compatible = "aspeed,ast2600-adc0";
+        reg = <0x1e6e9000 0x100>;
+        clocks = <&syscon ASPEED_CLK_APB2>;
+        resets = <&syscon ASPEED_RESET_ADC>;
+        #io-channel-cells = <1>;
+        aspeed,int_vref_mv = <2500>;
+    };
+    adc1: adc@1e6e9100 {
+        compatible = "aspeed,ast2600-adc1";
+        reg = <0x1e6e9100 0x100>;
+        clocks = <&syscon ASPEED_CLK_APB2>;
+        resets = <&syscon ASPEED_RESET_ADC>;
+        #io-channel-cells = <1>;
+        aspeed,int_vref_mv = <2500>;
+    };
+...
-- 
2.25.1

