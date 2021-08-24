Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0293F5AA7
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Aug 2021 11:13:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gv3L44gJfz2yMP
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Aug 2021 19:13:00 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gv3L11wTLz2xrb
 for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Aug 2021 19:12:55 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 17O8rFR0098383;
 Tue, 24 Aug 2021 16:53:15 +0800 (GMT-8)
 (envelope-from billy_tsai@aspeedtech.com)
Received: from BillyTsai-pc.aspeed.com (192.168.2.149) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 24 Aug
 2021 17:11:47 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <pmeerw@pmeerw.net>,
 <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <p.zabel@pengutronix.de>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [RESEND v4 04/15] iio: adc: aspeed: Keep model data to driver data.
Date: Tue, 24 Aug 2021 17:12:32 +0800
Message-ID: <20210824091243.9393-5-billy_tsai@aspeedtech.com>
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
X-MAIL: twspam01.aspeedtech.com 17O8rFR0098383
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

Keep the model data pointer to driver data for reducing the usage of
of_device_get_match_data().

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/iio/adc/aspeed_adc.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 20462cf659e4..d85aa31ee3b1 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -69,6 +69,7 @@ struct aspeed_adc_model_data {
 
 struct aspeed_adc_data {
 	struct device		*dev;
+	const struct aspeed_adc_model_data *model_data;
 	void __iomem		*base;
 	spinlock_t		clk_lock;
 	struct clk_hw		*clk_prescaler;
@@ -110,8 +111,6 @@ static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
 			       int *val, int *val2, long mask)
 {
 	struct aspeed_adc_data *data = iio_priv(indio_dev);
-	const struct aspeed_adc_model_data *model_data =
-			of_device_get_match_data(data->dev);
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
@@ -119,7 +118,7 @@ static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
 		return IIO_VAL_INT;
 
 	case IIO_CHAN_INFO_SCALE:
-		*val = model_data->vref_voltage;
+		*val = data->model_data->vref_voltage;
 		*val2 = ASPEED_RESOLUTION_BITS;
 		return IIO_VAL_FRACTIONAL_LOG2;
 
@@ -138,13 +137,11 @@ static int aspeed_adc_write_raw(struct iio_dev *indio_dev,
 				int val, int val2, long mask)
 {
 	struct aspeed_adc_data *data = iio_priv(indio_dev);
-	const struct aspeed_adc_model_data *model_data =
-			of_device_get_match_data(data->dev);
 
 	switch (mask) {
 	case IIO_CHAN_INFO_SAMP_FREQ:
-		if (val < model_data->min_sampling_rate ||
-			val > model_data->max_sampling_rate)
+		if (val < data->model_data->min_sampling_rate ||
+			val > data->model_data->max_sampling_rate)
 			return -EINVAL;
 
 		clk_set_rate(data->clk_scaler->clk,
@@ -190,7 +187,6 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 {
 	struct iio_dev *indio_dev;
 	struct aspeed_adc_data *data;
-	const struct aspeed_adc_model_data *model_data;
 	const char *clk_parent_name;
 	int ret;
 	u32 adc_engine_control_reg_val;
@@ -201,6 +197,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 
 	data = iio_priv(indio_dev);
 	data->dev = &pdev->dev;
+	data->model_data = of_device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, indio_dev);
 
 	data->base = devm_platform_ioremap_resource(pdev, 0);
@@ -241,9 +238,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	}
 	reset_control_deassert(data->rst);
 
-	model_data = of_device_get_match_data(&pdev->dev);
-
-	if (model_data->wait_init_sequence) {
+	if (data->model_data->wait_init_sequence) {
 		/* Enable engine in normal mode. */
 		writel(FIELD_PREP(ASPEED_ADC_OP_MODE,
 				  ASPEED_ADC_OP_MODE_NORMAL) |
@@ -273,8 +268,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	writel(adc_engine_control_reg_val,
 	       data->base + ASPEED_REG_ENGINE_CONTROL);
 
-	model_data = of_device_get_match_data(&pdev->dev);
-	indio_dev->name = model_data->model_name;
+	indio_dev->name = data->model_data->model_name;
 	indio_dev->info = &aspeed_adc_iio_info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 	indio_dev->channels = aspeed_adc_iio_channels;
-- 
2.25.1

