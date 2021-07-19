Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 577873CCF16
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Jul 2021 10:06:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GSvYt2KdDz3bSk
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Jul 2021 18:06:26 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GSvYm14GHz2ydJ
 for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Jul 2021 18:06:16 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 16J7nQMB015322;
 Mon, 19 Jul 2021 15:49:26 +0800 (GMT-8)
 (envelope-from billy_tsai@aspeedtech.com)
Received: from BillyTsai-pc.aspeed.com (192.168.2.149) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Jul
 2021 16:05:48 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <pmeerw@pmeerw.net>,
 <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <p.zabel@pengutronix.de>, <billy_tsai@aspeedtech.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <raltherr@google.com>
Subject: [v1 3/7] iio: adc: aspeed: completes the bitfield declare.
Date: Mon, 19 Jul 2021 16:06:03 +0800
Message-ID: <20210719080607.28712-4-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719080607.28712-1-billy_tsai@aspeedtech.com>
References: <20210719080607.28712-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.149]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 16J7nQMB015322
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
 drivers/iio/adc/aspeed_adc.c | 40 ++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 19efaa41bc34..99466a5924c7 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -16,6 +16,7 @@
 #include <linux/reset.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
+#include <linux/bitfield.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/driver.h>
@@ -28,15 +29,28 @@
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
+#define ASPEED_ADC_OPERATION_MODE		GENMASK(3, 1)
+#define ASPEED_ADC_OPERATION_MODE_POWER_DOWN	FIELD_PREP(ASPEED_ADC_OPERATION_MODE, 0)
+#define ASPEED_ADC_OPERATION_MODE_STANDBY	FIELD_PREP(ASPEED_ADC_OPERATION_MODE, 1)
+#define ASPEED_ADC_OPERATION_MODE_NORMAL	FIELD_PREP(ASPEED_ADC_OPERATION_MODE, 7)
+#define ASPEED_ADC_CTRL_COMPENSATION		BIT(4)
+#define ASPEED_ADC_AUTO_COMPENSATION		BIT(5)
+#define ASPEED_ADC_REF_VOLTAGE			GENMASK(7, 6)
+#define ASPEED_ADC_REF_VOLTAGE_2500mV		FIELD_PREP(ASPEED_ADC_REF_VOLTAGE, 0)
+#define ASPEED_ADC_REF_VOLTAGE_1200mV		FIELD_PREP(ASPEED_ADC_REF_VOLTAGE, 1)
+#define ASPEED_ADC_REF_VOLTAGE_EXT_HIGH		FIELD_PREP(ASPEED_ADC_REF_VOLTAGE, 2)
+#define ASPEED_ADC_REF_VOLTAGE_EXT_LOW		FIELD_PREP(ASPEED_ADC_REF_VOLTAGE, 3)
+#define ASPEED_ADC_CTRL_INIT_RDY		BIT(8)
+#define ASPEED_ADC_CH7_MODE			BIT(12)
+#define ASPEED_ADC_CH7_NORMAL			FIELD_PREP(ASPEED_ADC_CH7_MODE, 0)
+#define ASPEED_ADC_CH7_BATTERY			FIELD_PREP(ASPEED_ADC_CH7_MODE, 1)
+#define ASPEED_ADC_BATTERY_SENSING_ENABLE	BIT(13)
+#define ASPEED_ADC_CTRL_CHANNEL			GENMASK(31, 16)
+#define ASPEED_ADC_CTRL_CHANNEL_ENABLE(ch)	FIELD_PREP(ASPEED_ADC_CTRL_CHANNEL, BIT(ch))
 
 #define ASPEED_ADC_INIT_POLLING_TIME	500
 #define ASPEED_ADC_INIT_TIMEOUT		500000
@@ -226,7 +240,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 
 	if (model_data->wait_init_sequence) {
 		/* Enable engine in normal mode. */
-		writel(ASPEED_OPERATION_MODE_NORMAL | ASPEED_ENGINE_ENABLE,
+		writel(ASPEED_ADC_OPERATION_MODE_NORMAL | ASPEED_ADC_ENGINE_ENABLE,
 		       data->base + ASPEED_REG_ENGINE_CONTROL);
 
 		/* Wait for initial sequence complete. */
@@ -246,7 +260,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 		goto clk_enable_error;
 
 	adc_engine_control_reg_val = GENMASK(31, 16) |
-		ASPEED_OPERATION_MODE_NORMAL | ASPEED_ENGINE_ENABLE;
+		ASPEED_ADC_OPERATION_MODE_NORMAL | ASPEED_ADC_ENGINE_ENABLE;
 	writel(adc_engine_control_reg_val,
 		data->base + ASPEED_REG_ENGINE_CONTROL);
 
@@ -264,7 +278,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	return 0;
 
 iio_register_error:
-	writel(ASPEED_OPERATION_MODE_POWER_DOWN,
+	writel(ASPEED_ADC_OPERATION_MODE_POWER_DOWN,
 		data->base + ASPEED_REG_ENGINE_CONTROL);
 	clk_disable_unprepare(data->clk_scaler->clk);
 clk_enable_error:
@@ -283,7 +297,7 @@ static int aspeed_adc_remove(struct platform_device *pdev)
 	struct aspeed_adc_data *data = iio_priv(indio_dev);
 
 	iio_device_unregister(indio_dev);
-	writel(ASPEED_OPERATION_MODE_POWER_DOWN,
+	writel(ASPEED_ADC_OPERATION_MODE_POWER_DOWN,
 		data->base + ASPEED_REG_ENGINE_CONTROL);
 	clk_disable_unprepare(data->clk_scaler->clk);
 	reset_control_assert(data->rst);
-- 
2.25.1

