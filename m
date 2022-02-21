Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CFC4BD319
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Feb 2022 02:28:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K24SH6c18z3cDN
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Feb 2022 12:28:15 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K24SC5lPHz30Nj
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Feb 2022 12:28:09 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 21L1HQCl026167;
 Mon, 21 Feb 2022 09:17:26 +0800 (GMT-8)
 (envelope-from billy_tsai@aspeedtech.com)
Received: from BillyTsai-pc.aspeed.com (192.168.2.149) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 21 Feb
 2022 09:26:16 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <billy_tsai@aspeedtech.com>, <colin.king@canonical.com>,
 <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] iio: adc: aspeed: Add divider flag to fix incorrect
 voltage reading.
Date: Mon, 21 Feb 2022 09:27:05 +0800
Message-ID: <20220221012705.22008-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.149]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 21L1HQCl026167
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
Cc: Konstantin Klubnichkin <kitsok@yandex-team.ru>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The formula for the ADC sampling period in ast2400/ast2500 is:
ADC clock period = PCLK * 2 * (ADC0C[31:17] + 1) * (ADC0C[9:0])
When ADC0C[9:0] is set to 0 the sampling voltage will be lower than
expected, because the hardware may not have enough time to
charge/discharge to a stable voltage. This patch use the flag
CLK_DIVIDER_ONE_BASED which will use the raw value read from the
register, with the value of zero considered invalid to conform to the
corrected formula.

Fixes: 573803234e72 ("iio: Aspeed ADC")
Reported-by: Konstantin Klubnichkin <kitsok@yandex-team.ru>
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/iio/adc/aspeed_adc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index a957cad1bfab..ffae64f39221 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -539,7 +539,9 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	data->clk_scaler = devm_clk_hw_register_divider(
 		&pdev->dev, clk_name, clk_parent_name, scaler_flags,
 		data->base + ASPEED_REG_CLOCK_CONTROL, 0,
-		data->model_data->scaler_bit_width, 0, &data->clk_lock);
+		data->model_data->scaler_bit_width,
+		data->model_data->need_prescaler ? CLK_DIVIDER_ONE_BASED : 0,
+		&data->clk_lock);
 	if (IS_ERR(data->clk_scaler))
 		return PTR_ERR(data->clk_scaler);
 
-- 
2.25.1

