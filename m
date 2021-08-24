Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F0D3F6C87
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 Aug 2021 02:23:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvRXx0Pntz2yLV
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 Aug 2021 10:23:45 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvRXt0VVnz2xxn
 for <linux-aspeed@lists.ozlabs.org>; Wed, 25 Aug 2021 10:23:41 +1000 (AEST)
Received: (from root@localhost) by twspam01.aspeedtech.com id 17P050Ig095234
 for <linux-aspeed@lists.ozlabs.org>; Wed, 25 Aug 2021 08:05:00 +0800 (GMT-8)
 (envelope-from billy_tsai@aspeedtech.com)
Message-Id: <202108250005.17P050Ig095234@twspam01.aspeedtech.com>
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 17O8rHlG098404;
 Tue, 24 Aug 2021 16:53:17 +0800 (GMT-8)
 (envelope-from billy_tsai@aspeedtech.com)
Received: from BillyTsai-pc.aspeed.com (192.168.2.149) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 24 Aug
 2021 17:11:49 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <pmeerw@pmeerw.net>,
 <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <p.zabel@pengutronix.de>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [RESEND v4 14/15] iio: adc: aspeed: Support battery sensing.
Date: Tue, 24 Aug 2021 17:12:42 +0800
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824091243.9393-1-billy_tsai@aspeedtech.com>
References: <20210824091243.9393-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.149]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 17P050Ig095234
X-MSS: FORWARD@twspam01.aspeedtech.com
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

In ast2600, ADC integrate dividing circuit at last input channel for
battery sensing. This patch use the dts property "battery-sensing" to
enable this feature makes the last channel of each adc can tolerance
higher voltage than reference voltage.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/iio/adc/aspeed_adc.c | 62 +++++++++++++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 20caf28dff18..0c5d84e82561 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -79,10 +79,16 @@ struct aspeed_adc_model_data {
 	unsigned int vref_fixed;	// mV
 	bool wait_init_sequence;
 	bool need_prescaler;
+	bool bat_sense_sup;
 	u8 scaler_bit_width;
 	unsigned int num_channels;
 };
 
+struct adc_gain {
+	u8 mult;
+	u8 div;
+};
+
 struct aspeed_adc_data {
 	struct device		*dev;
 	const struct aspeed_adc_model_data *model_data;
@@ -96,6 +102,8 @@ struct aspeed_adc_data {
 	int			vref;
 	u32			sample_period_ns;
 	int			cv;
+	bool			battery_sensing;
+	struct adc_gain		battery_mode_gain;
 };
 
 #define ASPEED_CHAN(_idx, _data_reg_addr) {			\
@@ -103,10 +111,10 @@ struct aspeed_adc_data {
 	.indexed = 1,						\
 	.channel = (_idx),					\
 	.address = (_data_reg_addr),				\
-	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
-	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE) |	\
-				BIT(IIO_CHAN_INFO_SAMP_FREQ) |	\
+	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |		\
 				BIT(IIO_CHAN_INFO_OFFSET),	\
+	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE) |	\
+				BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
 }
 
 static const struct iio_chan_spec aspeed_adc_iio_channels[] = {
@@ -196,14 +204,39 @@ static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
 			       int *val, int *val2, long mask)
 {
 	struct aspeed_adc_data *data = iio_priv(indio_dev);
+	u32 adc_engine_control_reg_val;
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
-		*val = readw(data->base + chan->address);
+		if (data->battery_sensing && chan->channel == 7) {
+			adc_engine_control_reg_val =
+				readl(data->base + ASPEED_REG_ENGINE_CONTROL);
+			writel(adc_engine_control_reg_val |
+				       FIELD_PREP(ASPEED_ADC_CH7_MODE,
+						  ASPEED_ADC_CH7_BAT) |
+				       ASPEED_ADC_BAT_SENSING_ENABLE,
+			       data->base + ASPEED_REG_ENGINE_CONTROL);
+			/*
+			 * After enable battery sensing mode need to wait some time for adc stable
+			 * Experiment result is 1ms.
+			 */
+			mdelay(1);
+			*val = readw(data->base + chan->address);
+			*val = (*val * data->battery_mode_gain.mult) /
+			       data->battery_mode_gain.div;
+			/* Restore control register value */
+			writel(adc_engine_control_reg_val,
+			       data->base + ASPEED_REG_ENGINE_CONTROL);
+		} else
+			*val = readw(data->base + chan->address);
 		return IIO_VAL_INT;
 
 	case IIO_CHAN_INFO_OFFSET:
-		*val = data->cv;
+		if (data->battery_sensing && chan->channel == 7)
+			*val = (data->cv * data->battery_mode_gain.mult) /
+			       data->battery_mode_gain.div;
+		else
+			*val = data->cv;
 		return IIO_VAL_INT;
 
 	case IIO_CHAN_INFO_SCALE:
@@ -473,6 +506,23 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (of_find_property(data->dev->of_node, "aspeed,battery-sensing",
+			     NULL)) {
+		if (data->model_data->bat_sense_sup) {
+			data->battery_sensing = 1;
+			if (readl(data->base + ASPEED_REG_ENGINE_CONTROL) &
+			ASPEED_ADC_BAT_SENSING_DIV) {
+				data->battery_mode_gain.mult = 3;
+				data->battery_mode_gain.div = 1;
+			} else {
+				data->battery_mode_gain.mult = 3;
+				data->battery_mode_gain.div = 2;
+			}
+		} else
+			dev_warn(&pdev->dev,
+				"Failed to enable battey-sensing mode\n");
+	}
+
 	if (data->model_data->wait_init_sequence) {
 		adc_engine_control_reg_val =
 			readl(data->base + ASPEED_REG_ENGINE_CONTROL);
@@ -555,6 +605,7 @@ static const struct aspeed_adc_model_data ast2600_adc0_model_data = {
 	.min_sampling_rate = 10000,
 	.max_sampling_rate = 500000,
 	.wait_init_sequence = true,
+	.bat_sense_sup = true,
 	.scaler_bit_width = 16,
 	.num_channels = 8,
 };
@@ -564,6 +615,7 @@ static const struct aspeed_adc_model_data ast2600_adc1_model_data = {
 	.min_sampling_rate = 10000,
 	.max_sampling_rate = 500000,
 	.wait_init_sequence = true,
+	.bat_sense_sup = true,
 	.scaler_bit_width = 16,
 	.num_channels = 8,
 };
-- 
2.25.1

