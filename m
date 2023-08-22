Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B5A7885F2
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 13:38:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXHz16Q9bz3dFJ
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 21:38:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=lizetao1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVVcY654Kz3bgs;
	Tue, 22 Aug 2023 23:31:40 +1000 (AEST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RVV765Z8SzNnNM;
	Tue, 22 Aug 2023 21:09:38 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 21:13:11 +0800
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
Subject: [PATCH -next 22/25] spi: pic32-sqi: Use helper function devm_clk_get_enabled()
Date: Tue, 22 Aug 2023 21:12:34 +0800
Message-ID: <20230822131237.1022815-23-lizetao1@huawei.com>
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
 drivers/spi/spi-pic32-sqi.c | 27 +++------------------------
 1 file changed, 3 insertions(+), 24 deletions(-)

diff --git a/drivers/spi/spi-pic32-sqi.c b/drivers/spi/spi-pic32-sqi.c
index 5cbebcf26a2a..d894b99e4104 100644
--- a/drivers/spi/spi-pic32-sqi.c
+++ b/drivers/spi/spi-pic32-sqi.c
@@ -593,33 +593,20 @@ static int pic32_sqi_probe(struct platform_device *pdev)
 	}
 
 	/* clocks */
-	sqi->sys_clk = devm_clk_get(&pdev->dev, "reg_ck");
+	sqi->sys_clk = devm_clk_get_enabled(&pdev->dev, "reg_ck");
 	if (IS_ERR(sqi->sys_clk)) {
 		ret = PTR_ERR(sqi->sys_clk);
 		dev_err(&pdev->dev, "no sys_clk ?\n");
 		goto err_free_master;
 	}
 
-	sqi->base_clk = devm_clk_get(&pdev->dev, "spi_ck");
+	sqi->base_clk = devm_clk_get_enabled(&pdev->dev, "spi_ck");
 	if (IS_ERR(sqi->base_clk)) {
 		ret = PTR_ERR(sqi->base_clk);
 		dev_err(&pdev->dev, "no base clk ?\n");
 		goto err_free_master;
 	}
 
-	ret = clk_prepare_enable(sqi->sys_clk);
-	if (ret) {
-		dev_err(&pdev->dev, "sys clk enable failed\n");
-		goto err_free_master;
-	}
-
-	ret = clk_prepare_enable(sqi->base_clk);
-	if (ret) {
-		dev_err(&pdev->dev, "base clk enable failed\n");
-		clk_disable_unprepare(sqi->sys_clk);
-		goto err_free_master;
-	}
-
 	init_completion(&sqi->xfer_done);
 
 	/* initialize hardware */
@@ -629,7 +616,7 @@ static int pic32_sqi_probe(struct platform_device *pdev)
 	ret = ring_desc_ring_alloc(sqi);
 	if (ret) {
 		dev_err(&pdev->dev, "ring alloc failed\n");
-		goto err_disable_clk;
+		goto err_free_master;
 	}
 
 	/* install irq handlers */
@@ -669,10 +656,6 @@ static int pic32_sqi_probe(struct platform_device *pdev)
 err_free_ring:
 	ring_desc_ring_free(sqi);
 
-err_disable_clk:
-	clk_disable_unprepare(sqi->base_clk);
-	clk_disable_unprepare(sqi->sys_clk);
-
 err_free_master:
 	spi_master_put(master);
 	return ret;
@@ -685,10 +668,6 @@ static void pic32_sqi_remove(struct platform_device *pdev)
 	/* release resources */
 	free_irq(sqi->irq, sqi);
 	ring_desc_ring_free(sqi);
-
-	/* disable clk */
-	clk_disable_unprepare(sqi->base_clk);
-	clk_disable_unprepare(sqi->sys_clk);
 }
 
 static const struct of_device_id pic32_sqi_of_ids[] = {
-- 
2.34.1

