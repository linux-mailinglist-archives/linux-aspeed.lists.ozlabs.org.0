Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E819F78861C
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 13:40:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXJ0m44dkz3d7y
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 21:40:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=lizetao1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW6mG6jDYz3c43;
	Wed, 23 Aug 2023 23:40:30 +1000 (AEST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RW6gJ4xKSztRwy;
	Wed, 23 Aug 2023 21:36:12 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 23 Aug
 2023 21:39:55 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <lizetao1@huawei.com>
Subject: [PATCH -next v2 05/25] spi: spi-axi-spi-engine: Use helper function devm_clk_get_enabled()
Date: Wed, 23 Aug 2023 21:39:18 +0800
Message-ID: <20230823133938.1359106-6-lizetao1@huawei.com>
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
Cc: heiko@sntech.de, linux-aspeed@lists.ozlabs.org, linus.walleij@linaro.org, tali.perry1@gmail.com, conor.dooley@microchip.com, linux-riscv@lists.infradead.org, jbrunet@baylibre.com, florian.fainelli@broadcom.com, yuenn@google.com, khilman@baylibre.com, tmaimon77@gmail.com, linux-rockchip@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, avifishman70@gmail.com, martin.blumenstingl@googlemail.com, rjui@broadcom.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, clg@kaod.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>, matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org, sbranden@broadcom.com, venture@google.com, fancer.lancer@gmail.com, linux-spi@vger.kernel.org, daire.mcnamara@microchip.com, olteanv@gmail.com, openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
replaced by devm_clk_get_enabled() when driver enables (and possibly
prepares) the clocks for the whole lifetime of the device. Moreover, it is
no longer necessary to unprepare and disable the clocks explicitly.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: None

 drivers/spi/spi-axi-spi-engine.c | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/spi/spi-axi-spi-engine.c b/drivers/spi/spi-axi-spi-engine.c
index 0258c9a72fdc..b96e55f59d1a 100644
--- a/drivers/spi/spi-axi-spi-engine.c
+++ b/drivers/spi/spi-axi-spi-engine.c
@@ -485,30 +485,22 @@ static int spi_engine_probe(struct platform_device *pdev)
 
 	spin_lock_init(&spi_engine->lock);
 
-	spi_engine->clk = devm_clk_get(&pdev->dev, "s_axi_aclk");
+	spi_engine->clk = devm_clk_get_enabled(&pdev->dev, "s_axi_aclk");
 	if (IS_ERR(spi_engine->clk)) {
 		ret = PTR_ERR(spi_engine->clk);
 		goto err_put_host;
 	}
 
-	spi_engine->ref_clk = devm_clk_get(&pdev->dev, "spi_clk");
+	spi_engine->ref_clk = devm_clk_get_enabled(&pdev->dev, "spi_clk");
 	if (IS_ERR(spi_engine->ref_clk)) {
 		ret = PTR_ERR(spi_engine->ref_clk);
 		goto err_put_host;
 	}
 
-	ret = clk_prepare_enable(spi_engine->clk);
-	if (ret)
-		goto err_put_host;
-
-	ret = clk_prepare_enable(spi_engine->ref_clk);
-	if (ret)
-		goto err_clk_disable;
-
 	spi_engine->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(spi_engine->base)) {
 		ret = PTR_ERR(spi_engine->base);
-		goto err_ref_clk_disable;
+		goto err_put_host;
 	}
 
 	version = readl(spi_engine->base + SPI_ENGINE_REG_VERSION);
@@ -518,7 +510,7 @@ static int spi_engine_probe(struct platform_device *pdev)
 			SPI_ENGINE_VERSION_MINOR(version),
 			SPI_ENGINE_VERSION_PATCH(version));
 		ret = -ENODEV;
-		goto err_ref_clk_disable;
+		goto err_put_host;
 	}
 
 	writel_relaxed(0x00, spi_engine->base + SPI_ENGINE_REG_RESET);
@@ -527,7 +519,7 @@ static int spi_engine_probe(struct platform_device *pdev)
 
 	ret = request_irq(irq, spi_engine_irq, 0, pdev->name, host);
 	if (ret)
-		goto err_ref_clk_disable;
+		goto err_put_host;
 
 	host->dev.of_node = pdev->dev.of_node;
 	host->mode_bits = SPI_CPOL | SPI_CPHA | SPI_3WIRE;
@@ -545,10 +537,6 @@ static int spi_engine_probe(struct platform_device *pdev)
 	return 0;
 err_free_irq:
 	free_irq(irq, host);
-err_ref_clk_disable:
-	clk_disable_unprepare(spi_engine->ref_clk);
-err_clk_disable:
-	clk_disable_unprepare(spi_engine->clk);
 err_put_host:
 	spi_controller_put(host);
 	return ret;
@@ -569,9 +557,6 @@ static void spi_engine_remove(struct platform_device *pdev)
 	writel_relaxed(0xff, spi_engine->base + SPI_ENGINE_REG_INT_PENDING);
 	writel_relaxed(0x00, spi_engine->base + SPI_ENGINE_REG_INT_ENABLE);
 	writel_relaxed(0x01, spi_engine->base + SPI_ENGINE_REG_RESET);
-
-	clk_disable_unprepare(spi_engine->ref_clk);
-	clk_disable_unprepare(spi_engine->clk);
 }
 
 static const struct of_device_id spi_engine_match_table[] = {
-- 
2.34.1

