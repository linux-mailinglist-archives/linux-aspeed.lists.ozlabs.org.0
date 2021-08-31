Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAF33FC31B
	for <lists+linux-aspeed@lfdr.de>; Tue, 31 Aug 2021 09:14:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzJMt177dz2yJ4
	for <lists+linux-aspeed@lfdr.de>; Tue, 31 Aug 2021 17:14:18 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzJMl0THxz2xtp
 for <linux-aspeed@lists.ozlabs.org>; Tue, 31 Aug 2021 17:14:08 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 17V6sbOx028265;
 Tue, 31 Aug 2021 14:54:37 +0800 (GMT-8)
 (envelope-from billy_tsai@aspeedtech.com)
Received: from BillyTsai-pc.aspeed.com (192.168.2.149) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 31 Aug
 2021 15:13:35 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <pmeerw@pmeerw.net>,
 <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <p.zabel@pengutronix.de>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [v5 06/15] iio: adc: aspeed: Add vref config function
Date: Tue, 31 Aug 2021 15:14:49 +0800
Message-ID: <20210831071458.2334-7-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831071458.2334-1-billy_tsai@aspeedtech.com>
References: <20210831071458.2334-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.149]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 17V6sbOx028265
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

Add the function to check the vref_fixed_mv and set the value to driver
data.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/iio/adc/aspeed_adc.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 6ce2f676c54a..01df24f6d3f1 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -130,7 +130,7 @@ static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
 		return IIO_VAL_INT;
 
 	case IIO_CHAN_INFO_SCALE:
-		*val = data->model_data->vref_fixed_mv;
+		*val = data->vref_mv;
 		*val2 = ASPEED_RESOLUTION_BITS;
 		return IIO_VAL_FRACTIONAL_LOG2;
 
@@ -195,6 +195,17 @@ static const struct iio_info aspeed_adc_iio_info = {
 	.debugfs_reg_access = aspeed_adc_reg_access,
 };
 
+static int aspeed_adc_vref_config(struct iio_dev *indio_dev)
+{
+	struct aspeed_adc_data *data = iio_priv(indio_dev);
+
+	if (data->model_data->vref_fixed_mv) {
+		data->vref_mv = data->model_data->vref_fixed_mv;
+		return 0;
+	}
+	return 0;
+}
+
 static int aspeed_adc_probe(struct platform_device *pdev)
 {
 	struct iio_dev *indio_dev;
@@ -250,6 +261,10 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	}
 	reset_control_deassert(data->rst);
 
+	ret = aspeed_adc_vref_config(indio_dev);
+	if (ret)
+		goto vref_config_error;
+
 	if (data->model_data->wait_init_sequence) {
 		/* Enable engine in normal mode. */
 		writel(FIELD_PREP(ASPEED_ADC_OP_MODE,
@@ -298,6 +313,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	clk_disable_unprepare(data->clk_scaler->clk);
 clk_enable_error:
 poll_timeout_error:
+vref_config_error:
 	reset_control_assert(data->rst);
 reset_error:
 	clk_hw_unregister_divider(data->clk_scaler);
-- 
2.25.1

