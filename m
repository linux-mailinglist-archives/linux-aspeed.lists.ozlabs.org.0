Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 796EB3F6C93
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 Aug 2021 02:25:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvRZT1nmPz2yLQ
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 Aug 2021 10:25:05 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvRZR1rnvz2xrp
 for <linux-aspeed@lists.ozlabs.org>; Wed, 25 Aug 2021 10:25:02 +1000 (AEST)
Received: (from root@localhost) by twspam01.aspeedtech.com id 17P06O4n097273
 for <linux-aspeed@lists.ozlabs.org>; Wed, 25 Aug 2021 08:06:24 +0800 (GMT-8)
 (envelope-from billy_tsai@aspeedtech.com)
Message-Id: <202108250006.17P06O4n097273@twspam01.aspeedtech.com>
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 17O8rHlF098404;
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
Subject: [RESEND v4 13/15] iio: adc: aspeed: Add compensation phase.
Date: Tue, 24 Aug 2021 17:12:41 +0800
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
X-MAIL: twspam01.aspeedtech.com 17P06O4n097273
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

This patch adds a compensation phase to improve the accurate of ADC
measurement. This is the built-in function though input half of the
reference voltage to get the ADC offset.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/iio/adc/aspeed_adc.c | 54 +++++++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 4d979dd7fe88..20caf28dff18 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -95,6 +95,7 @@ struct aspeed_adc_data {
 	struct reset_control	*rst;
 	int			vref;
 	u32			sample_period_ns;
+	int			cv;
 };
 
 #define ASPEED_CHAN(_idx, _data_reg_addr) {			\
@@ -104,7 +105,8 @@ struct aspeed_adc_data {
 	.address = (_data_reg_addr),				\
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE) |	\
-				BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
+				BIT(IIO_CHAN_INFO_SAMP_FREQ) |	\
+				BIT(IIO_CHAN_INFO_OFFSET),	\
 }
 
 static const struct iio_chan_spec aspeed_adc_iio_channels[] = {
@@ -126,6 +128,51 @@ static const struct iio_chan_spec aspeed_adc_iio_channels[] = {
 	ASPEED_CHAN(15, 0x2E),
 };
 
+static int aspeed_adc_compensation(struct iio_dev *indio_dev)
+{
+	struct aspeed_adc_data *data = iio_priv(indio_dev);
+	u32 index, adc_raw = 0;
+	u32 adc_engine_control_reg_val;
+
+	adc_engine_control_reg_val =
+		readl(data->base + ASPEED_REG_ENGINE_CONTROL);
+	adc_engine_control_reg_val &= ~ASPEED_ADC_OP_MODE;
+	adc_engine_control_reg_val |=
+		(FIELD_PREP(ASPEED_ADC_OP_MODE, ASPEED_ADC_OP_MODE_NORMAL) |
+		 ASPEED_ADC_ENGINE_ENABLE);
+	/*
+	 * Enable compensating sensing:
+	 * After that, the input voltage of ADC will force to half of the reference
+	 * voltage. So the expected reading raw data will become half of the max
+	 * value. We can get compensating value = 0x200 - ADC read raw value.
+	 * It is recommended to average at least 10 samples to get a final CV.
+	 */
+	writel(adc_engine_control_reg_val | ASPEED_ADC_CTRL_COMPENSATION |
+		       ASPEED_ADC_CTRL_CHANNEL_ENABLE(0),
+	       data->base + ASPEED_REG_ENGINE_CONTROL);
+	/*
+	 * After enable compensating sensing mode need to wait some time for ADC stable
+	 * Experiment result is 1ms.
+	 */
+	mdelay(1);
+
+	for (index = 0; index < 16; index++) {
+		/*
+		 * Waiting for the sampling period ensures that the value acquired
+		 * is fresh each time.
+		 */
+		ndelay(data->sample_period_ns);
+		adc_raw += readw(data->base + aspeed_adc_iio_channels[0].address);
+	}
+	adc_raw >>= 4;
+	data->cv = BIT(ASPEED_RESOLUTION_BITS - 1) - adc_raw;
+	writel(adc_engine_control_reg_val,
+	       data->base + ASPEED_REG_ENGINE_CONTROL);
+	dev_dbg(data->dev, "Compensating value = %d\n", data->cv);
+
+	return 0;
+}
+
 static int aspeed_adc_set_sampling_rate(struct iio_dev *indio_dev, u32 rate)
 {
 	struct aspeed_adc_data *data = iio_priv(indio_dev);
@@ -155,6 +202,10 @@ static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
 		*val = readw(data->base + chan->address);
 		return IIO_VAL_INT;
 
+	case IIO_CHAN_INFO_OFFSET:
+		*val = data->cv;
+		return IIO_VAL_INT;
+
 	case IIO_CHAN_INFO_SCALE:
 		*val = data->vref;
 		*val2 = ASPEED_RESOLUTION_BITS;
@@ -444,6 +495,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	aspeed_adc_compensation(indio_dev);
 	/* Start all channels in normal mode. */
 	adc_engine_control_reg_val =
 		readl(data->base + ASPEED_REG_ENGINE_CONTROL);
-- 
2.25.1

