Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5638D414364
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Sep 2021 10:15:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDrhc1sWrz2yPM
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Sep 2021 18:15:44 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDrhW6K1xz2yLZ
 for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Sep 2021 18:15:39 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 18M7sc8c099785;
 Wed, 22 Sep 2021 15:54:38 +0800 (GMT-8)
 (envelope-from billy_tsai@aspeedtech.com)
Received: from BillyTsai-pc.aspeed.com (192.168.2.149) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 22 Sep
 2021 16:14:56 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <pmeerw@pmeerw.net>,
 <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <p.zabel@pengutronix.de>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [v7 05/11] iio: adc: aspeed: Use devm_add_action_or_reset.
Date: Wed, 22 Sep 2021 16:15:14 +0800
Message-ID: <20210922081520.30580-6-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922081520.30580-1-billy_tsai@aspeedtech.com>
References: <20210922081520.30580-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.149]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 18M7sc8c099785
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

This patch use devm_add_action_or_reset to handle the error in probe
phase.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/iio/adc/aspeed_adc.c | 113 +++++++++++++++++------------------
 1 file changed, 55 insertions(+), 58 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index e53d1541ad1d..0a18893c47f0 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -195,6 +195,28 @@ static const struct iio_info aspeed_adc_iio_info = {
 	.debugfs_reg_access = aspeed_adc_reg_access,
 };
 
+static void aspeed_adc_reset_assert(void *data)
+{
+	struct reset_control *rst = data;
+
+	reset_control_assert(rst);
+}
+
+static void aspeed_adc_clk_disable_unprepare(void *data)
+{
+	struct clk *clk = data;
+
+	clk_disable_unprepare(clk);
+}
+
+static void aspeed_adc_power_down(void *data)
+{
+	struct aspeed_adc_data *priv_data = data;
+
+	writel(FIELD_PREP(ASPEED_ADC_OP_MODE, ASPEED_ADC_OP_MODE_PWR_DOWN),
+	       priv_data->base + ASPEED_REG_ENGINE_CONTROL);
+}
+
 static int aspeed_adc_vref_config(struct iio_dev *indio_dev)
 {
 	struct aspeed_adc_data *data = iio_priv(indio_dev);
@@ -236,7 +258,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	if (data->model_data->need_prescaler) {
 		snprintf(clk_name, ARRAY_SIZE(clk_name), "%s-prescaler",
 			 data->model_data->model_name);
-		data->clk_prescaler = clk_hw_register_divider(
+		data->clk_prescaler = devm_clk_hw_register_divider(
 			&pdev->dev, clk_name, clk_parent_name, 0,
 			data->base + ASPEED_REG_CLOCK_CONTROL, 17, 15, 0,
 			&data->clk_lock);
@@ -252,35 +274,41 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	 */
 	snprintf(clk_name, ARRAY_SIZE(clk_name), "%s-scaler",
 		 data->model_data->model_name);
-	data->clk_scaler = clk_hw_register_divider(
+	data->clk_scaler = devm_clk_hw_register_divider(
 		&pdev->dev, clk_name, clk_parent_name, scaler_flags,
 		data->base + ASPEED_REG_CLOCK_CONTROL, 0,
 		data->model_data->scaler_bit_width, 0, &data->clk_lock);
-	if (IS_ERR(data->clk_scaler)) {
-		ret = PTR_ERR(data->clk_scaler);
-		goto scaler_error;
-	}
+	if (IS_ERR(data->clk_scaler))
+		return PTR_ERR(data->clk_scaler);
 
 	data->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(data->rst)) {
 		dev_err(&pdev->dev,
 			"invalid or missing reset controller device tree entry");
-		ret = PTR_ERR(data->rst);
-		goto reset_error;
+		return PTR_ERR(data->rst);
 	}
 	reset_control_deassert(data->rst);
 
+	ret = devm_add_action_or_reset(data->dev, aspeed_adc_reset_assert,
+				       data->rst);
+	if (ret)
+		return ret;
+
 	ret = aspeed_adc_vref_config(indio_dev);
 	if (ret)
-		goto vref_config_error;
+		return ret;
 
-	if (data->model_data->wait_init_sequence) {
-		/* Enable engine in normal mode. */
-		writel(FIELD_PREP(ASPEED_ADC_OP_MODE,
-				  ASPEED_ADC_OP_MODE_NORMAL) |
-			       ASPEED_ADC_ENGINE_ENABLE,
-		       data->base + ASPEED_REG_ENGINE_CONTROL);
+	/* Enable engine in normal mode. */
+	writel(FIELD_PREP(ASPEED_ADC_OP_MODE, ASPEED_ADC_OP_MODE_NORMAL) |
+		       ASPEED_ADC_ENGINE_ENABLE,
+	       data->base + ASPEED_REG_ENGINE_CONTROL);
+
+	ret = devm_add_action_or_reset(data->dev, aspeed_adc_power_down,
+					data);
+	if (ret)
+		return ret;
 
+	if (data->model_data->wait_init_sequence) {
 		/* Wait for initial sequence complete. */
 		ret = readl_poll_timeout(data->base + ASPEED_REG_ENGINE_CONTROL,
 					 adc_engine_control_reg_val,
@@ -289,18 +317,23 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 					 ASPEED_ADC_INIT_POLLING_TIME,
 					 ASPEED_ADC_INIT_TIMEOUT);
 		if (ret)
-			goto poll_timeout_error;
+			return ret;
 	}
 
-	/* Start all channels in normal mode. */
 	ret = clk_prepare_enable(data->clk_scaler->clk);
 	if (ret)
-		goto clk_enable_error;
+		return ret;
 
+	ret = devm_add_action_or_reset(data->dev,
+				       aspeed_adc_clk_disable_unprepare,
+				       data->clk_scaler->clk);
+	if (ret)
+		return ret;
+
+	/* Start all channels in normal mode. */
 	adc_engine_control_reg_val =
-		ASPEED_ADC_CTRL_CHANNEL |
-		FIELD_PREP(ASPEED_ADC_OP_MODE, ASPEED_ADC_OP_MODE_NORMAL) |
-		ASPEED_ADC_ENGINE_ENABLE;
+		readl(data->base + ASPEED_REG_ENGINE_CONTROL);
+	adc_engine_control_reg_val |= ASPEED_ADC_CTRL_CHANNEL;
 	writel(adc_engine_control_reg_val,
 	       data->base + ASPEED_REG_ENGINE_CONTROL);
 
@@ -310,45 +343,10 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	indio_dev->channels = aspeed_adc_iio_channels;
 	indio_dev->num_channels = data->model_data->num_channels;
 
-	ret = iio_device_register(indio_dev);
-	if (ret)
-		goto iio_register_error;
-
-	return 0;
-
-iio_register_error:
-	writel(FIELD_PREP(ASPEED_ADC_OP_MODE, ASPEED_ADC_OP_MODE_PWR_DOWN),
-	       data->base + ASPEED_REG_ENGINE_CONTROL);
-	clk_disable_unprepare(data->clk_scaler->clk);
-clk_enable_error:
-poll_timeout_error:
-vref_config_error:
-	reset_control_assert(data->rst);
-reset_error:
-	clk_hw_unregister_divider(data->clk_scaler);
-scaler_error:
-	if (data->model_data->need_prescaler)
-		clk_hw_unregister_divider(data->clk_prescaler);
+	ret = devm_iio_device_register(data->dev, indio_dev);
 	return ret;
 }
 
-static int aspeed_adc_remove(struct platform_device *pdev)
-{
-	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
-	struct aspeed_adc_data *data = iio_priv(indio_dev);
-
-	iio_device_unregister(indio_dev);
-	writel(FIELD_PREP(ASPEED_ADC_OP_MODE, ASPEED_ADC_OP_MODE_PWR_DOWN),
-	       data->base + ASPEED_REG_ENGINE_CONTROL);
-	clk_disable_unprepare(data->clk_scaler->clk);
-	reset_control_assert(data->rst);
-	clk_hw_unregister_divider(data->clk_scaler);
-	if (data->model_data->need_prescaler)
-		clk_hw_unregister_divider(data->clk_prescaler);
-
-	return 0;
-}
-
 static const struct aspeed_adc_model_data ast2400_model_data = {
 	.model_name = "ast2400-adc",
 	.vref_fixed_mv = 2500,
@@ -379,7 +377,6 @@ MODULE_DEVICE_TABLE(of, aspeed_adc_matches);
 
 static struct platform_driver aspeed_adc_driver = {
 	.probe = aspeed_adc_probe,
-	.remove = aspeed_adc_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.of_match_table = aspeed_adc_matches,
-- 
2.25.1

