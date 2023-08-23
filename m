Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5631F78861B
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 13:40:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXJ0k1V8gz3clr
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 21:40:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=lizetao1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW6mG70slz3c5V;
	Wed, 23 Aug 2023 23:40:30 +1000 (AEST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RW6gH4PXcztRv3;
	Wed, 23 Aug 2023 21:36:11 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 23 Aug
 2023 21:39:54 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <lizetao1@huawei.com>
Subject: [PATCH -next v2 04/25] spi: ath79: Use helper function devm_clk_get_enabled()
Date: Wed, 23 Aug 2023 21:39:17 +0800
Message-ID: <20230823133938.1359106-5-lizetao1@huawei.com>
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

 drivers/spi/spi-ath79.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-ath79.c b/drivers/spi/spi-ath79.c
index 1b6d977d111c..c9f1d1e1dcf7 100644
--- a/drivers/spi/spi-ath79.c
+++ b/drivers/spi/spi-ath79.c
@@ -200,20 +200,16 @@ static int ath79_spi_probe(struct platform_device *pdev)
 		goto err_put_host;
 	}
 
-	sp->clk = devm_clk_get(&pdev->dev, "ahb");
+	sp->clk = devm_clk_get_enabled(&pdev->dev, "ahb");
 	if (IS_ERR(sp->clk)) {
 		ret = PTR_ERR(sp->clk);
 		goto err_put_host;
 	}
 
-	ret = clk_prepare_enable(sp->clk);
-	if (ret)
-		goto err_put_host;
-
 	rate = DIV_ROUND_UP(clk_get_rate(sp->clk), MHZ);
 	if (!rate) {
 		ret = -EINVAL;
-		goto err_clk_disable;
+		goto err_put_host;
 	}
 
 	sp->rrw_delay = ATH79_SPI_RRW_DELAY_FACTOR / rate;
@@ -229,8 +225,6 @@ static int ath79_spi_probe(struct platform_device *pdev)
 
 err_disable:
 	ath79_spi_disable(sp);
-err_clk_disable:
-	clk_disable_unprepare(sp->clk);
 err_put_host:
 	spi_controller_put(host);
 
@@ -243,7 +237,6 @@ static void ath79_spi_remove(struct platform_device *pdev)
 
 	spi_bitbang_stop(&sp->bitbang);
 	ath79_spi_disable(sp);
-	clk_disable_unprepare(sp->clk);
 	spi_controller_put(sp->bitbang.master);
 }
 
-- 
2.34.1

