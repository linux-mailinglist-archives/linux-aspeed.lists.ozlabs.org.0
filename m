Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9AB788611
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 13:40:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXJ0X3k89z3dFg
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 21:40:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=lizetao1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW6m60QW8z3c4w;
	Wed, 23 Aug 2023 23:40:22 +1000 (AEST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RW6kH6Qblz16Nym;
	Wed, 23 Aug 2023 21:38:47 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 23 Aug
 2023 21:40:16 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <lizetao1@huawei.com>
Subject: [PATCH -next v2 24/25] spi: spl022: Use helper function devm_clk_get_enabled()
Date: Wed, 23 Aug 2023 21:39:37 +0800
Message-ID: <20230823133938.1359106-25-lizetao1@huawei.com>
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
no longer necessary to unprepare and disable the clocks explicitly.
Moreover, the label "err_no_clk_en" is no used, drop it for clean code.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Delete the modification of odd formatting.

 drivers/spi/spi-pl022.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/spi/spi-pl022.c b/drivers/spi/spi-pl022.c
index bb347b6bb6f3..d1b6110b38fc 100644
--- a/drivers/spi/spi-pl022.c
+++ b/drivers/spi/spi-pl022.c
@@ -2168,19 +2168,13 @@ static int pl022_probe(struct amba_device *adev, const struct amba_id *id)
 	dev_info(&adev->dev, "mapped registers from %pa to %p\n",
 		&adev->res.start, pl022->virtbase);
 
-	pl022->clk = devm_clk_get(&adev->dev, NULL);
+	pl022->clk = devm_clk_get_enabled(&adev->dev, NULL);
 	if (IS_ERR(pl022->clk)) {
 		status = PTR_ERR(pl022->clk);
 		dev_err(&adev->dev, "could not retrieve SSP/SPI bus clock\n");
 		goto err_no_clk;
 	}
 
-	status = clk_prepare_enable(pl022->clk);
-	if (status) {
-		dev_err(&adev->dev, "could not enable SSP/SPI bus clock\n");
-		goto err_no_clk_en;
-	}
-
 	/* Initialize transfer pump */
 	tasklet_init(&pl022->pump_transfers, pump_transfers,
 		     (unsigned long)pl022);
@@ -2240,8 +2234,6 @@ static int pl022_probe(struct amba_device *adev, const struct amba_id *id)
 	if (platform_info->enable_dma)
 		pl022_dma_remove(pl022);
  err_no_irq:
-	clk_disable_unprepare(pl022->clk);
- err_no_clk_en:
  err_no_clk:
  err_no_ioremap:
 	amba_release_regions(adev);
@@ -2268,7 +2260,6 @@ pl022_remove(struct amba_device *adev)
 	if (pl022->host_info->enable_dma)
 		pl022_dma_remove(pl022);
 
-	clk_disable_unprepare(pl022->clk);
 	amba_release_regions(adev);
 	tasklet_disable(&pl022->pump_transfers);
 }
-- 
2.34.1

