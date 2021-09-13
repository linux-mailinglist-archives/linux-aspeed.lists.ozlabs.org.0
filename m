Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9804085BB
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Sep 2021 09:52:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7JbV2z9nz2yJs
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Sep 2021 17:52:06 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7JbJ154Lz2yJQ
 for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Sep 2021 17:51:56 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 18D7VLpP004719;
 Mon, 13 Sep 2021 15:31:21 +0800 (GMT-8)
 (envelope-from billy_tsai@aspeedtech.com)
Received: from BillyTsai-pc.aspeed.com (192.168.2.149) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 13 Sep
 2021 15:51:06 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <pmeerw@pmeerw.net>,
 <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <p.zabel@pengutronix.de>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [v6 04/11] iio: adc: aspeed: Use model_data to set clk scaler.
Date: Mon, 13 Sep 2021 15:53:30 +0800
Message-ID: <20210913075337.19991-5-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913075337.19991-1-billy_tsai@aspeedtech.com>
References: <20210913075337.19991-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.149]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 18D7VLpP004719
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
Cc: BMC-SW@aspeedtech.com, kernel test robot <lkp@intel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This patch uses need_prescaler and scaler_bit_width to set the ADC clock
scaler.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/iio/adc/aspeed_adc.c | 43 ++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index aec335956310..e53d1541ad1d 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -210,9 +210,10 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 {
 	struct iio_dev *indio_dev;
 	struct aspeed_adc_data *data;
-	const char *clk_parent_name;
 	int ret;
 	u32 adc_engine_control_reg_val;
+	unsigned long scaler_flags = 0;
+	char clk_name[32], clk_parent_name[32];
 
 	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*data));
 	if (!indio_dev)
@@ -229,24 +230,32 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 
 	/* Register ADC clock prescaler with source specified by device tree. */
 	spin_lock_init(&data->clk_lock);
-	clk_parent_name = of_clk_get_parent_name(pdev->dev.of_node, 0);
-
-	data->clk_prescaler = clk_hw_register_divider(
-				&pdev->dev, "prescaler", clk_parent_name, 0,
-				data->base + ASPEED_REG_CLOCK_CONTROL,
-				17, 15, 0, &data->clk_lock);
-	if (IS_ERR(data->clk_prescaler))
-		return PTR_ERR(data->clk_prescaler);
-
+	snprintf(clk_parent_name, ARRAY_SIZE(clk_parent_name), "%s",
+		 of_clk_get_parent_name(pdev->dev.of_node, 0));
+
+	if (data->model_data->need_prescaler) {
+		snprintf(clk_name, ARRAY_SIZE(clk_name), "%s-prescaler",
+			 data->model_data->model_name);
+		data->clk_prescaler = clk_hw_register_divider(
+			&pdev->dev, clk_name, clk_parent_name, 0,
+			data->base + ASPEED_REG_CLOCK_CONTROL, 17, 15, 0,
+			&data->clk_lock);
+		if (IS_ERR(data->clk_prescaler))
+			return PTR_ERR(data->clk_prescaler);
+		snprintf(clk_parent_name, ARRAY_SIZE(clk_parent_name),
+			 clk_name);
+		scaler_flags = CLK_SET_RATE_PARENT;
+	}
 	/*
 	 * Register ADC clock scaler downstream from the prescaler. Allow rate
 	 * setting to adjust the prescaler as well.
 	 */
+	snprintf(clk_name, ARRAY_SIZE(clk_name), "%s-scaler",
+		 data->model_data->model_name);
 	data->clk_scaler = clk_hw_register_divider(
-				&pdev->dev, "scaler", "prescaler",
-				CLK_SET_RATE_PARENT,
-				data->base + ASPEED_REG_CLOCK_CONTROL,
-				0, 10, 0, &data->clk_lock);
+		&pdev->dev, clk_name, clk_parent_name, scaler_flags,
+		data->base + ASPEED_REG_CLOCK_CONTROL, 0,
+		data->model_data->scaler_bit_width, 0, &data->clk_lock);
 	if (IS_ERR(data->clk_scaler)) {
 		ret = PTR_ERR(data->clk_scaler);
 		goto scaler_error;
@@ -318,7 +327,8 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 reset_error:
 	clk_hw_unregister_divider(data->clk_scaler);
 scaler_error:
-	clk_hw_unregister_divider(data->clk_prescaler);
+	if (data->model_data->need_prescaler)
+		clk_hw_unregister_divider(data->clk_prescaler);
 	return ret;
 }
 
@@ -333,7 +343,8 @@ static int aspeed_adc_remove(struct platform_device *pdev)
 	clk_disable_unprepare(data->clk_scaler->clk);
 	reset_control_assert(data->rst);
 	clk_hw_unregister_divider(data->clk_scaler);
-	clk_hw_unregister_divider(data->clk_prescaler);
+	if (data->model_data->need_prescaler)
+		clk_hw_unregister_divider(data->clk_prescaler);
 
 	return 0;
 }
-- 
2.25.1

