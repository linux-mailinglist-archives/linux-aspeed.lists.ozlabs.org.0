Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C2F7885EC
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 13:38:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXHym1PN8z3dGw
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 21:38:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=lizetao1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVVbx6SR3z2xdq;
	Tue, 22 Aug 2023 23:31:09 +1000 (AEST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RVV7b3XwRzLpDZ;
	Tue, 22 Aug 2023 21:10:03 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 21:13:06 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <broonie@kernel.org>, <chin-ting_kuo@aspeedtech.com>, <clg@kaod.org>,
	<joel@jms.id.au>, <andrew@aj.id.au>, <florian.fainelli@broadcom.com>,
	<rjui@broadcom.com>, <sbranden@broadcom.com>,
	<bcm-kernel-feedback-list@broadcom.com>, <fancer.lancer@gmail.com>,
	<olteanv@gmail.com>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<avifishman70@gmail.com>, <tmaimon77@gmail.com>, <tali.perry1@gmail.com>,
	<venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
	<linus.walleij@linaro.org>, <heiko@sntech.de>
Subject: [PATCH -next 17/25] spi: microchip-core-qspi: Use helper function devm_clk_get_enabled()
Date: Tue, 22 Aug 2023 21:12:29 +0800
Message-ID: <20230822131237.1022815-18-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230822131237.1022815-1-lizetao1@huawei.com>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, lizetao1@huawei.com, linux-spi@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
replaced by devm_clk_get_enabled() when driver enables (and possibly
prepares) the clocks for the whole lifetime of the device. Moreover, it is
no longer necessary to unprepare and disable the clocks explicitly.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/spi/spi-microchip-core-qspi.c | 29 +++++++--------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/spi/spi-microchip-core-qspi.c b/drivers/spi/spi-microchip-core-qspi.c
index 4f76ddf97b10..396dfc0fa278 100644
--- a/drivers/spi/spi-microchip-core-qspi.c
+++ b/drivers/spi/spi-microchip-core-qspi.c
@@ -518,30 +518,23 @@ static int mchp_coreqspi_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(qspi->regs),
 				     "failed to map registers\n");
 
-	qspi->clk = devm_clk_get(&pdev->dev, NULL);
+	qspi->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(qspi->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(qspi->clk),
 				     "could not get clock\n");
 
-	ret = clk_prepare_enable(qspi->clk);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "failed to enable clock\n");
-
 	init_completion(&qspi->data_completion);
 	mutex_init(&qspi->op_lock);
 
 	qspi->irq = platform_get_irq(pdev, 0);
-	if (qspi->irq < 0) {
-		ret = qspi->irq;
-		goto out;
-	}
+	if (qspi->irq < 0)
+		return qspi->irq;
 
 	ret = devm_request_irq(&pdev->dev, qspi->irq, mchp_coreqspi_isr,
 			       IRQF_SHARED, pdev->name, qspi);
 	if (ret) {
 		dev_err(&pdev->dev, "request_irq failed %d\n", ret);
-		goto out;
+		return ret;
 	}
 
 	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
@@ -552,18 +545,11 @@ static int mchp_coreqspi_probe(struct platform_device *pdev)
 	ctlr->dev.of_node = np;
 
 	ret = devm_spi_register_controller(&pdev->dev, ctlr);
-	if (ret) {
-		dev_err_probe(&pdev->dev, ret,
-			      "spi_register_controller failed\n");
-		goto out;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "spi_register_controller failed\n");
 
 	return 0;
-
-out:
-	clk_disable_unprepare(qspi->clk);
-
-	return ret;
 }
 
 static void mchp_coreqspi_remove(struct platform_device *pdev)
@@ -574,7 +560,6 @@ static void mchp_coreqspi_remove(struct platform_device *pdev)
 	mchp_coreqspi_disable_ints(qspi);
 	control &= ~CONTROL_ENABLE;
 	writel_relaxed(control, qspi->regs + REG_CONTROL);
-	clk_disable_unprepare(qspi->clk);
 }
 
 static const struct of_device_id mchp_coreqspi_of_match[] = {
-- 
2.34.1

