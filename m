Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E75A978860A
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 13:39:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXJ0D5kT2z3dL3
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 21:39:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=lizetao1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW6lv4Y4zz3c1M;
	Wed, 23 Aug 2023 23:40:11 +1000 (AEST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RW6hG4ZB9zLpCH;
	Wed, 23 Aug 2023 21:37:02 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 23 Aug
 2023 21:40:06 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <lizetao1@huawei.com>
Subject: [PATCH -next v2 15/25] spi: meson-spicc: Use helper function devm_clk_get_enabled()
Date: Wed, 23 Aug 2023 21:39:28 +0800
Message-ID: <20230823133938.1359106-16-lizetao1@huawei.com>
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

 drivers/spi/spi-meson-spicc.c | 33 ++++++---------------------------
 1 file changed, 6 insertions(+), 27 deletions(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index 43d134f4b42b..1f2d26254e03 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -820,7 +820,7 @@ static int meson_spicc_probe(struct platform_device *pdev)
 		goto out_master;
 	}
 
-	spicc->core = devm_clk_get(&pdev->dev, "core");
+	spicc->core = devm_clk_get_enabled(&pdev->dev, "core");
 	if (IS_ERR(spicc->core)) {
 		dev_err(&pdev->dev, "core clock request failed\n");
 		ret = PTR_ERR(spicc->core);
@@ -828,7 +828,7 @@ static int meson_spicc_probe(struct platform_device *pdev)
 	}
 
 	if (spicc->data->has_pclk) {
-		spicc->pclk = devm_clk_get(&pdev->dev, "pclk");
+		spicc->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
 		if (IS_ERR(spicc->pclk)) {
 			dev_err(&pdev->dev, "pclk clock request failed\n");
 			ret = PTR_ERR(spicc->pclk);
@@ -836,22 +836,10 @@ static int meson_spicc_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = clk_prepare_enable(spicc->core);
-	if (ret) {
-		dev_err(&pdev->dev, "core clock enable failed\n");
-		goto out_master;
-	}
-
-	ret = clk_prepare_enable(spicc->pclk);
-	if (ret) {
-		dev_err(&pdev->dev, "pclk clock enable failed\n");
-		goto out_core_clk;
-	}
-
 	spicc->pinctrl = devm_pinctrl_get(&pdev->dev);
 	if (IS_ERR(spicc->pinctrl)) {
 		ret = PTR_ERR(spicc->pinctrl);
-		goto out_clk;
+		goto out_master;
 	}
 
 	device_reset_optional(&pdev->dev);
@@ -878,31 +866,25 @@ static int meson_spicc_probe(struct platform_device *pdev)
 	ret = meson_spicc_pow2_clk_init(spicc);
 	if (ret) {
 		dev_err(&pdev->dev, "pow2 clock registration failed\n");
-		goto out_clk;
+		goto out_master;
 	}
 
 	if (spicc->data->has_enhance_clk_div) {
 		ret = meson_spicc_enh_clk_init(spicc);
 		if (ret) {
 			dev_err(&pdev->dev, "clock registration failed\n");
-			goto out_clk;
+			goto out_master;
 		}
 	}
 
 	ret = devm_spi_register_master(&pdev->dev, master);
 	if (ret) {
 		dev_err(&pdev->dev, "spi master registration failed\n");
-		goto out_clk;
+		goto out_master;
 	}
 
 	return 0;
 
-out_clk:
-	clk_disable_unprepare(spicc->pclk);
-
-out_core_clk:
-	clk_disable_unprepare(spicc->core);
-
 out_master:
 	spi_master_put(master);
 
@@ -916,9 +898,6 @@ static void meson_spicc_remove(struct platform_device *pdev)
 	/* Disable SPI */
 	writel(0, spicc->base + SPICC_CONREG);
 
-	clk_disable_unprepare(spicc->core);
-	clk_disable_unprepare(spicc->pclk);
-
 	spi_master_put(spicc->master);
 }
 
-- 
2.34.1

