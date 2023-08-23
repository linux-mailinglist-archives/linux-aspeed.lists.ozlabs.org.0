Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2758078860B
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 13:40:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXJ0H08YJz3cRC
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 21:39:59 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=lizetao1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW6lv10CDz3bkm;
	Wed, 23 Aug 2023 23:40:11 +1000 (AEST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RW6gd72g1zNn6Q;
	Wed, 23 Aug 2023 21:36:29 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 23 Aug
 2023 21:40:03 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <lizetao1@huawei.com>
Subject: [PATCH -next v2 12/25] spi: dw-mmio: Use helper function devm_clk_get_*()
Date: Wed, 23 Aug 2023 21:39:25 +0800
Message-ID: <20230823133938.1359106-13-lizetao1@huawei.com>
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
and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
replaced by devm_clk_get_enabled() when driver enables (and possibly
prepares) the clocks for the whole lifetime of the device. Moreover, it is
no longer necessary to unprepare and disable the clocks explicitly. Also,
devm_clk_get_optional() and clk_prepare_enable() can now be replaced by
devm_clk_get_optional_enabled(). Moreover, the lable "out_clk" no longer
makes sense, rename it to "out_reset".

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Return directly instead of calling reset_control_deassert()
before the reset control handler has been requested. And use the
"out_reset" label instead of "out" before calling pm_runtime_enable().

 drivers/spi/spi-dw-mmio.c | 31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
index 805264c9c65c..46801189a651 100644
--- a/drivers/spi/spi-dw-mmio.c
+++ b/drivers/spi/spi-dw-mmio.c
@@ -340,29 +340,20 @@ static int dw_spi_mmio_probe(struct platform_device *pdev)
 	if (dws->irq < 0)
 		return dws->irq; /* -ENXIO */
 
-	dwsmmio->clk = devm_clk_get(&pdev->dev, NULL);
+	dwsmmio->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(dwsmmio->clk))
 		return PTR_ERR(dwsmmio->clk);
-	ret = clk_prepare_enable(dwsmmio->clk);
-	if (ret)
-		return ret;
 
 	/* Optional clock needed to access the registers */
-	dwsmmio->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
-	if (IS_ERR(dwsmmio->pclk)) {
-		ret = PTR_ERR(dwsmmio->pclk);
-		goto out_clk;
-	}
-	ret = clk_prepare_enable(dwsmmio->pclk);
-	if (ret)
-		goto out_clk;
+	dwsmmio->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
+	if (IS_ERR(dwsmmio->pclk))
+		return PTR_ERR(dwsmmio->pclk);
 
 	/* find an optional reset controller */
 	dwsmmio->rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, "spi");
-	if (IS_ERR(dwsmmio->rstc)) {
-		ret = PTR_ERR(dwsmmio->rstc);
-		goto out_clk;
-	}
+	if (IS_ERR(dwsmmio->rstc))
+		return PTR_ERR(dwsmmio->rstc);
+
 	reset_control_deassert(dwsmmio->rstc);
 
 	dws->bus_num = pdev->id;
@@ -383,7 +374,7 @@ static int dw_spi_mmio_probe(struct platform_device *pdev)
 	if (init_func) {
 		ret = init_func(pdev, dwsmmio);
 		if (ret)
-			goto out;
+			goto out_reset;
 	}
 
 	pm_runtime_enable(&pdev->dev);
@@ -397,9 +388,7 @@ static int dw_spi_mmio_probe(struct platform_device *pdev)
 
 out:
 	pm_runtime_disable(&pdev->dev);
-	clk_disable_unprepare(dwsmmio->pclk);
-out_clk:
-	clk_disable_unprepare(dwsmmio->clk);
+out_reset:
 	reset_control_assert(dwsmmio->rstc);
 
 	return ret;
@@ -411,8 +400,6 @@ static void dw_spi_mmio_remove(struct platform_device *pdev)
 
 	dw_spi_remove_host(&dwsmmio->dws);
 	pm_runtime_disable(&pdev->dev);
-	clk_disable_unprepare(dwsmmio->pclk);
-	clk_disable_unprepare(dwsmmio->clk);
 	reset_control_assert(dwsmmio->rstc);
 }
 
-- 
2.34.1

