Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01248788619
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 13:40:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXJ0d4L1Gz3c4w
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 21:40:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=lizetao1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW6mF0dmbz3c3S;
	Wed, 23 Aug 2023 23:40:28 +1000 (AEST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RW6jq3yGBzrSbq;
	Wed, 23 Aug 2023 21:38:23 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 23 Aug
 2023 21:39:52 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <lizetao1@huawei.com>
Subject: [PATCH -next v2 02/25] spi: armada-3700: Use helper function devm_clk_get_prepared()
Date: Wed, 23 Aug 2023 21:39:15 +0800
Message-ID: <20230823133938.1359106-3-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230823133938.1359106-1-lizetao1@huawei.com>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
 <20230823133938.1359106-1-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 25 Aug 2023 21:33:58 +1000
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
Cc: heiko@sntech.de, linux-aspeed@lists.ozlabs.org, linus.walleij@linaro.org, tali.perry1@gmail.com, conor.dooley@microchip.com, linux-riscv@lists.infradead.org, jbrunet@baylibre.com, florian.fainelli@broadcom.com, yuenn@google.com, khilman@baylibre.com, tmaimon77@gmail.com, linux-rockchip@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, avifishman70@gmail.com, martin.blumenstingl@googlemail.com, rjui@broadcom.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, clg@kaod.org, matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org, sbranden@broadcom.com, venture@google.com, fancer.lancer@gmail.com, linux-spi@vger.kernel.org, daire.mcnamara@microchip.com, olteanv@gmail.com, openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
and enabled clocks"), devm_clk_get() and clk_prepare() can now be replaced
by devm_clk_get_prepared() when driver prepares the clocks for the whole
lifetime of the device. Moreover, it is no longer necessary to unprepare
the clocks explicitly.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Drop the empty remove function a3700_spi_remove().

 drivers/spi/spi-armada-3700.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/spi/spi-armada-3700.c b/drivers/spi/spi-armada-3700.c
index 0103ac0158c0..3c9ed412932f 100644
--- a/drivers/spi/spi-armada-3700.c
+++ b/drivers/spi/spi-armada-3700.c
@@ -865,18 +865,12 @@ static int a3700_spi_probe(struct platform_device *pdev)
 
 	init_completion(&spi->done);
 
-	spi->clk = devm_clk_get(dev, NULL);
+	spi->clk = devm_clk_get_prepared(dev, NULL);
 	if (IS_ERR(spi->clk)) {
 		dev_err(dev, "could not find clk: %ld\n", PTR_ERR(spi->clk));
 		goto error;
 	}
 
-	ret = clk_prepare(spi->clk);
-	if (ret) {
-		dev_err(dev, "could not prepare clk: %d\n", ret);
-		goto error;
-	}
-
 	host->max_speed_hz = min_t(unsigned long, A3700_SPI_MAX_SPEED_HZ,
 					clk_get_rate(spi->clk));
 	host->min_speed_hz = DIV_ROUND_UP(clk_get_rate(spi->clk),
@@ -888,40 +882,29 @@ static int a3700_spi_probe(struct platform_device *pdev)
 			       dev_name(dev), host);
 	if (ret) {
 		dev_err(dev, "could not request IRQ: %d\n", ret);
-		goto error_clk;
+		goto error;
 	}
 
 	ret = devm_spi_register_controller(dev, host);
 	if (ret) {
 		dev_err(dev, "Failed to register host\n");
-		goto error_clk;
+		goto error;
 	}
 
 	return 0;
 
-error_clk:
-	clk_unprepare(spi->clk);
 error:
 	spi_controller_put(host);
 out:
 	return ret;
 }
 
-static void a3700_spi_remove(struct platform_device *pdev)
-{
-	struct spi_controller *host = platform_get_drvdata(pdev);
-	struct a3700_spi *spi = spi_controller_get_devdata(host);
-
-	clk_unprepare(spi->clk);
-}
-
 static struct platform_driver a3700_spi_driver = {
 	.driver = {
 		.name	= DRIVER_NAME,
 		.of_match_table = of_match_ptr(a3700_spi_dt_ids),
 	},
 	.probe		= a3700_spi_probe,
-	.remove_new	= a3700_spi_remove,
 };
 
 module_platform_driver(a3700_spi_driver);
-- 
2.34.1

