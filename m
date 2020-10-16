Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E29B28FE4D
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Oct 2020 08:27:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCGQg5X6dzDqc5
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Oct 2020 17:27:07 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCGQK5gxXzDqSD
 for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Oct 2020 17:26:46 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 09G6Njfp073161;
 Fri, 16 Oct 2020 14:23:45 +0800 (GMT-8)
 (envelope-from billy_tsai@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Oct
 2020 14:26:08 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <jae.hyun.yoo@linux.intel.com>, <billy_tsai@aspeedtech.com>,
 <haiyue.wang@linux.intel.com>, <james.feist@linux.intel.com>,
 <vernon.mauery@linux.intel.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH 2/3] peci: aspeed: Auto calculate the adapter divisor
Date: Fri, 16 Oct 2020 14:26:01 +0800
Message-ID: <20201016062602.20014-3-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201016062602.20014-1-billy_tsai@aspeedtech.com>
References: <20201016062602.20014-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 09G6Njfp073161
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

This pach change the meaning of clk-frequency property from original
controller clock to bit frequency of peci negotiation stage and auto
calculate the adapter divisor setting to close aim.
The expected frequency and real frequency may have errors because of the
granularities of the divisor.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-g6.dtsi  |  4 +-
 drivers/peci/busses/peci-aspeed.c | 91 ++++++++++++++++++-------------
 2 files changed, 53 insertions(+), 42 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index cb053a996e87..6e1e5b5733e6 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -750,9 +750,7 @@
 		interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&syscon ASPEED_CLK_GATE_REF0CLK>;
 		resets = <&syscon ASPEED_RESET_PECI>;
-		clock-frequency = <24000000>;
-		msg-timing = <1>;
-		addr-timing = <1>;
+		clock-frequency = <1000000>;
 		rd-sampling-point = <8>;
 		cmd-timeout-ms = <1000>;
 		status = "disabled";
diff --git a/drivers/peci/busses/peci-aspeed.c b/drivers/peci/busses/peci-aspeed.c
index d6039b1c4494..9e7c7582e4bb 100644
--- a/drivers/peci/busses/peci-aspeed.c
+++ b/drivers/peci/busses/peci-aspeed.c
@@ -133,6 +133,11 @@
 #define ASPEED_PECI_64B_R_DATAE  0xF8
 #define ASPEED_PECI_64B_R_DATAF  0xFC
 
+/* Bus Frequency */
+#define ASPEED_PECI_BUS_FREQ_MAX	2000000
+#define ASPEED_PECI_BUS_FREQ_MIN	2000
+#define ASPEED_PECI_BUS_FREQ_DEFAULT	1000000
+
 /* Timing Negotiation */
 #define ASPEED_PECI_RD_SAMPLING_POINT_DEFAULT	8
 #define ASPEED_PECI_RD_SAMPLING_POINT_MAX	15
@@ -324,51 +329,47 @@ static irqreturn_t aspeed_peci_irq_handler(int irq, void *arg)
 static int aspeed_peci_init_ctrl(struct aspeed_peci *priv)
 {
 	u32 msg_timing, addr_timing, rd_sampling_point;
-	u32 clk_freq, clk_divisor, clk_div_val = 0;
+	u32 clk_freq, clk_div_val = 0;
+	u32 msg_timing_idx, clk_div_val_idx;
+	int delta_value, delta_tmp, clk_divisor, clk_divisor_tmp;
 	int ret;
 
-	priv->clk = devm_clk_get(priv->dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(priv->dev, "Failed to get clk source.\n");
-		return PTR_ERR(priv->clk);
-	}
-
-	ret = clk_prepare_enable(priv->clk);
-	if (ret) {
-		dev_err(priv->dev, "Failed to enable clock.\n");
-		return ret;
-	}
-
 	ret = device_property_read_u32(priv->dev, "clock-frequency", &clk_freq);
-	if (ret) {
-		dev_err(priv->dev,
-			"Could not read clock-frequency property.\n");
-		clk_disable_unprepare(priv->clk);
-		return ret;
-	}
-
-	clk_divisor = clk_get_rate(priv->clk) / clk_freq;
-
-	while ((clk_divisor >> 1) && (clk_div_val < ASPEED_PECI_CLK_DIV_MAX))
-		clk_div_val++;
-
-	ret = device_property_read_u32(priv->dev, "msg-timing", &msg_timing);
-	if (ret || msg_timing > ASPEED_PECI_MSG_TIMING_MAX) {
+	if (ret ||
+	clk_freq > ASPEED_PECI_BUS_FREQ_MAX ||
+	clk_freq < ASPEED_PECI_BUS_FREQ_MIN) {
 		if (!ret)
 			dev_warn(priv->dev,
-				 "Invalid msg-timing : %u, Use default : %u\n",
-				 msg_timing, ASPEED_PECI_MSG_TIMING_DEFAULT);
-		msg_timing = ASPEED_PECI_MSG_TIMING_DEFAULT;
-	}
-
-	ret = device_property_read_u32(priv->dev, "addr-timing", &addr_timing);
-	if (ret || addr_timing > ASPEED_PECI_ADDR_TIMING_MAX) {
-		if (!ret)
-			dev_warn(priv->dev,
-				 "Invalid addr-timing : %u, Use default : %u\n",
-				 addr_timing, ASPEED_PECI_ADDR_TIMING_DEFAULT);
-		addr_timing = ASPEED_PECI_ADDR_TIMING_DEFAULT;
+				 "Invalid clock-frequency : %u, Use default : %u\n",
+				 clk_freq, ASPEED_PECI_BUS_FREQ_DEFAULT);
+		clk_freq = ASPEED_PECI_BUS_FREQ_DEFAULT;
 	}
+	/*
+	 * PECI bus clock = (Ref. clk) / (1 << PECI00[10:8])
+	 * PECI operation clock = (PECI bus clock)/ 4*(PECI04[15:8]*4+1)
+	 * (1 << PECI00[10:8]) * (PECI04[15:8]*4+1) =
+	 * (Ref. clk) / (4 * PECI operation clock)
+	 */
+	clk_divisor = clk_get_rate(priv->clk) / (4*clk_freq);
+	delta_value = clk_divisor;
+	/* Find the closest divisor for clock-frequency */
+	for (msg_timing_idx = 1; msg_timing_idx <= 255; msg_timing_idx++)
+		for (clk_div_val_idx = 0; clk_div_val_idx < 7;
+			clk_div_val_idx++) {
+			clk_divisor_tmp = (1 << clk_div_val_idx) *
+					(msg_timing_idx * 4 + 1);
+			delta_tmp = abs(clk_divisor - clk_divisor_tmp);
+			if (delta_tmp < delta_value) {
+				delta_value = delta_tmp;
+				msg_timing = msg_timing_idx;
+				clk_div_val = clk_div_val_idx;
+			}
+		}
+	addr_timing = msg_timing;
+	dev_info(priv->dev, "Expect frequency: %d Real frequency is about: %lu",
+		clk_freq,
+		clk_get_rate(priv->clk) /
+		(4 * (1 << clk_div_val) * (msg_timing * 4 + 1)));
 
 	ret = device_property_read_u32(priv->dev, "rd-sampling-point",
 				       &rd_sampling_point);
@@ -463,6 +464,18 @@ static int aspeed_peci_probe(struct platform_device *pdev)
 	priv->adapter->xfer = aspeed_peci_xfer;
 	priv->adapter->use_dma = false;
 
+	priv->clk = devm_clk_get(priv->dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(priv->dev, "Failed to get clk source.\n");
+		return PTR_ERR(priv->clk);
+	}
+
+	ret = clk_prepare_enable(priv->clk);
+	if (ret) {
+		dev_err(priv->dev, "Failed to enable clock.\n");
+		return ret;
+	}
+
 	priv->rst = devm_reset_control_get(&pdev->dev, NULL);
 	if (IS_ERR(priv->rst)) {
 		dev_err(&pdev->dev,
-- 
2.17.1

