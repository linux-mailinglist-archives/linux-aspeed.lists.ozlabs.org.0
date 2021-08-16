Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D89CF3ED248
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Aug 2021 12:49:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp9rY5Frrz3bX1
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Aug 2021 20:49:01 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp9rV3kqTz2xff
 for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Aug 2021 20:48:57 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 17GAUMO6044039;
 Mon, 16 Aug 2021 18:30:22 +0800 (GMT-8)
 (envelope-from billy_tsai@aspeedtech.com)
Received: from BillyTsai-pc.aspeed.com (192.168.2.149) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Aug
 2021 18:48:27 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <pmeerw@pmeerw.net>,
 <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <p.zabel@pengutronix.de>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [v3 02/15] iio: adc: aspeed: completes the bitfield declare.
Date: Mon, 16 Aug 2021 18:48:33 +0800
Message-ID: <20210816104846.13155-3-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210816104846.13155-1-billy_tsai@aspeedtech.com>
References: <20210816104846.13155-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.149]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 17GAUMO6044039
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

This patch completes the declare of adc register bitfields and uses the
same prefix ASPEED_ADC_* for these bitfields.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/iio/adc/aspeed_adc.c | 56 +++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 17 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 19efaa41bc34..7010d56ac3b9 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -3,6 +3,7 @@
  * Aspeed AST2400/2500 ADC
  *
  * Copyright (C) 2017 Google, Inc.
+ * Copyright (C) 2021 Aspeed Technology Inc.
  */
 
 #include <linux/clk.h>
@@ -16,6 +17,7 @@
 #include <linux/reset.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
+#include <linux/bitfield.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/driver.h>
@@ -28,15 +30,31 @@
 #define ASPEED_REG_INTERRUPT_CONTROL	0x04
 #define ASPEED_REG_VGA_DETECT_CONTROL	0x08
 #define ASPEED_REG_CLOCK_CONTROL	0x0C
-#define ASPEED_REG_MAX			0xC0
-
-#define ASPEED_OPERATION_MODE_POWER_DOWN	(0x0 << 1)
-#define ASPEED_OPERATION_MODE_STANDBY		(0x1 << 1)
-#define ASPEED_OPERATION_MODE_NORMAL		(0x7 << 1)
-
-#define ASPEED_ENGINE_ENABLE		BIT(0)
-
-#define ASPEED_ADC_CTRL_INIT_RDY	BIT(8)
+#define ASPEED_REG_COMPENSATION_TRIM	0xC4
+#define ASPEED_REG_MAX			0xCC
+
+#define ASPEED_ADC_ENGINE_ENABLE		BIT(0)
+#define ASPEED_ADC_OP_MODE			GENMASK(3, 1)
+#define ASPEED_ADC_OP_MODE_PWR_DOWN		0
+#define ASPEED_ADC_OP_MODE_STANDBY		1
+#define ASPEED_ADC_OP_MODE_NORMAL		7
+#define ASPEED_ADC_CTRL_COMPENSATION		BIT(4)
+#define ASPEED_ADC_AUTO_COMPENSATION		BIT(5)
+#define ASPEED_ADC_REF_VOLTAGE			GENMASK(7, 6)
+#define ASPEED_ADC_REF_VOLTAGE_2500mV		0
+#define ASPEED_ADC_REF_VOLTAGE_1200mV		1
+#define ASPEED_ADC_REF_VOLTAGE_EXT_HIGH		2
+#define ASPEED_ADC_REF_VOLTAGE_EXT_LOW		3
+#define ASPEED_ADC_BAT_SENSING_DIV		BIT(6)
+#define ASPEED_ADC_BAT_SENSING_DIV_2_3		0
+#define ASPEED_ADC_BAT_SENSING_DIV_1_3		1
+#define ASPEED_ADC_CTRL_INIT_RDY		BIT(8)
+#define ASPEED_ADC_CH7_MODE			BIT(12)
+#define ASPEED_ADC_CH7_NORMAL			0
+#define ASPEED_ADC_CH7_BAT			1
+#define ASPEED_ADC_BAT_SENSING_ENABLE		BIT(13)
+#define ASPEED_ADC_CTRL_CHANNEL			GENMASK(31, 16)
+#define ASPEED_ADC_CTRL_CHANNEL_ENABLE(ch)	FIELD_PREP(ASPEED_ADC_CTRL_CHANNEL, BIT(ch))
 
 #define ASPEED_ADC_INIT_POLLING_TIME	500
 #define ASPEED_ADC_INIT_TIMEOUT		500000
@@ -226,7 +244,9 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 
 	if (model_data->wait_init_sequence) {
 		/* Enable engine in normal mode. */
-		writel(ASPEED_OPERATION_MODE_NORMAL | ASPEED_ENGINE_ENABLE,
+		writel(FIELD_PREP(ASPEED_ADC_OP_MODE,
+				  ASPEED_ADC_OP_MODE_NORMAL) |
+			       ASPEED_ADC_ENGINE_ENABLE,
 		       data->base + ASPEED_REG_ENGINE_CONTROL);
 
 		/* Wait for initial sequence complete. */
@@ -245,10 +265,12 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	if (ret)
 		goto clk_enable_error;
 
-	adc_engine_control_reg_val = GENMASK(31, 16) |
-		ASPEED_OPERATION_MODE_NORMAL | ASPEED_ENGINE_ENABLE;
+	adc_engine_control_reg_val =
+		ASPEED_ADC_CTRL_CHANNEL |
+		FIELD_PREP(ASPEED_ADC_OP_MODE, ASPEED_ADC_OP_MODE_NORMAL) |
+		ASPEED_ADC_ENGINE_ENABLE;
 	writel(adc_engine_control_reg_val,
-		data->base + ASPEED_REG_ENGINE_CONTROL);
+	       data->base + ASPEED_REG_ENGINE_CONTROL);
 
 	model_data = of_device_get_match_data(&pdev->dev);
 	indio_dev->name = model_data->model_name;
@@ -264,8 +286,8 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	return 0;
 
 iio_register_error:
-	writel(ASPEED_OPERATION_MODE_POWER_DOWN,
-		data->base + ASPEED_REG_ENGINE_CONTROL);
+	writel(FIELD_PREP(ASPEED_ADC_OP_MODE, ASPEED_ADC_OP_MODE_PWR_DOWN),
+	       data->base + ASPEED_REG_ENGINE_CONTROL);
 	clk_disable_unprepare(data->clk_scaler->clk);
 clk_enable_error:
 poll_timeout_error:
@@ -283,8 +305,8 @@ static int aspeed_adc_remove(struct platform_device *pdev)
 	struct aspeed_adc_data *data = iio_priv(indio_dev);
 
 	iio_device_unregister(indio_dev);
-	writel(ASPEED_OPERATION_MODE_POWER_DOWN,
-		data->base + ASPEED_REG_ENGINE_CONTROL);
+	writel(FIELD_PREP(ASPEED_ADC_OP_MODE, ASPEED_ADC_OP_MODE_PWR_DOWN),
+	       data->base + ASPEED_REG_ENGINE_CONTROL);
 	clk_disable_unprepare(data->clk_scaler->clk);
 	reset_control_assert(data->rst);
 	clk_hw_unregister_divider(data->clk_scaler);
-- 
2.25.1

