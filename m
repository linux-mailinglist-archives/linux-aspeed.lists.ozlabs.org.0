Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4C728CBC5
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Oct 2020 12:34:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9X381JP3zDqfV
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Oct 2020 21:34:12 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=billy_tsai@aspeedtech.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9X2n2CDYzDqcY
 for <linux-aspeed@lists.ozlabs.org>; Tue, 13 Oct 2020 21:33:52 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 09DAUg2f010593;
 Tue, 13 Oct 2020 18:30:42 +0800 (GMT-8)
 (envelope-from billy_tsai@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Oct
 2020 18:32:57 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <jic23@kernel.org>, <knaack.h@gmx.de>, <lars@metafoo.de>,
 <pmeerw@pmeerw.net>, <robh+dt@kernel.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <p.zabel@pengutronix.de>,
 <billy_tsai@aspeedtech.com>, <alexandru.ardelean@analog.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] iio: adc: aspeed: Setting ref_voltage in probe
Date: Tue, 13 Oct 2020 18:32:45 +0800
Message-ID: <20201013103245.16723-4-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201013103245.16723-1-billy_tsai@aspeedtech.com>
References: <20201013103245.16723-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 09DAUg2f010593
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

At ast2600 ref_voltage becomes configurable and this property is board
dependency.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../devicetree/bindings/iio/adc/aspeed_adc.txt   | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt b/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
index 034fc2ba100e..0ba1980c4e06 100644
--- a/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
@@ -3,8 +3,11 @@ Aspeed ADC
 This device is a 10-bit converter for 16 voltage channels.  All inputs are
 single ended.
 
+At ast2600, this device split into two individual IPs and each contains 8 voltage channels.
+
+Chip level dtsi:
 Required properties:
-- compatible: Should be "aspeed,ast2400-adc" or "aspeed,ast2500-adc"
+- compatible: Should be "aspeed,ast2400-adc" or "aspeed,ast2500-adc" or "aspeed,ast2600-adc"
 - reg: memory window mapping address and length
 - clocks: Input clock used to derive the sample clock. Expected to be the
           SoC's APB clock.
@@ -20,3 +23,14 @@ Example:
 		resets = <&syscon ASPEED_RESET_ADC>;
 		#io-channel-cells = <1>;
 	};
+
+Board level dts:
+Required properties:
+- ref_voltage: (ast2600 only)
+	- Reference voltage in millivolts for the conversions.
+	- The range of value is 900 to 2700 mv.
+
+Example:
+&adc0 {
+	ref_voltage = <2500>;
+};
\ No newline at end of file
-- 
2.17.1

