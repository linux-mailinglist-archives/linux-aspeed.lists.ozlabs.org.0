Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FED43D3658
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 10:16:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWMbK19Pqz30CQ
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 18:16:13 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWMbC0LKpz2yMp
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Jul 2021 18:16:05 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 16N7x5V2041949;
 Fri, 23 Jul 2021 15:59:05 +0800 (GMT-8)
 (envelope-from billy_tsai@aspeedtech.com)
Received: from BillyTsai-pc.aspeed.com (192.168.2.149) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 23 Jul
 2021 16:15:39 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <pmeerw@pmeerw.net>,
 <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <p.zabel@pengutronix.de>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [v2 2/8] dt-bindings: iio: adc: Binding ast2600 adc.
Date: Fri, 23 Jul 2021 16:16:15 +0800
Message-ID: <20210723081621.29477-3-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210723081621.29477-1-billy_tsai@aspeedtech.com>
References: <20210723081621.29477-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.149]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 16N7x5V2041949
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

This patch add more description about aspeed adc and add two property
for ast2600:
- vref: used to configure reference voltage.
- battery-sensing: used to enable battery sensing mode for last channel.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../bindings/iio/adc/aspeed,adc.yaml          | 28 +++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/aspeed,adc.yaml b/Documentation/devicetree/bindings/iio/adc/aspeed,adc.yaml
index 23f3da1ffca3..a562a7fbc30c 100644
--- a/Documentation/devicetree/bindings/iio/adc/aspeed,adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/aspeed,adc.yaml
@@ -10,14 +10,26 @@ maintainers:
   - Joel Stanley <joel@jms.id.au>
 
 description:
-  This device is a 10-bit converter for 16 voltage channels.  All inputs are
-  single ended.
+  • 10-bits resolution for 16 voltage channels.
+  At ast2400/ast2500 the device has only one engine with 16 voltage channels.
+  At ast2600 the device split into two individual engine and each contains 8 voltage channels.
+  • Channel scanning can be non-continuous.
+  • Programmable ADC clock frequency.
+  • Programmable upper and lower bound for each channels.
+  • Interrupt when larger or less than bounds for each channels.
+  • Support hysteresis for each channels.
+  • Buildin a compensating method.
+  Additional feature at ast2600
+  • Internal or External reference voltage.
+  • Support 2 Internal reference voltage 1.2v or 2.5v.
+  • Integrate dividing circuit for battery sensing.
 
 properties:
   compatible:
     enum:
       - aspeed,ast2400-adc
       - aspeed,ast2500-adc
+      - aspeed,ast2600-adc
 
   reg:
     maxItems: 1
@@ -33,6 +45,18 @@ properties:
   "#io-channel-cells":
     const: 1
 
+  vref:
+    minItems: 900
+    maxItems: 2700
+    default: 2500
+    description:
+      ADC Reference voltage in millivolts.
+
+  battery-sensing:
+    type: boolean
+    description:
+      Inform the driver that last channel will be used to sensor battery.
+
 required:
   - compatible
   - reg
-- 
2.25.1

