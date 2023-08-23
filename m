Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 227C278861A
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 13:40:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXJ0h00sKz3cTR
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 21:40:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=lizetao1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW6mF4PsBz3c56;
	Wed, 23 Aug 2023 23:40:29 +1000 (AEST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RW6jn2yyczrSbn;
	Wed, 23 Aug 2023 21:38:21 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 23 Aug
 2023 21:39:50 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <lizetao1@huawei.com>
Subject: [PATCH -next v2 00/25] spi: Use devm_clk_get_*() helper function to simplify the drivers.
Date: Wed, 23 Aug 2023 21:39:13 +0800
Message-ID: <20230823133938.1359106-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230822131237.1022815-1-lizetao1@huawei.com>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
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

Commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
and enabled clocks") provides a new helper function for prepared and
enabled clocks when a driver keeps a clock prepared (or enabled) during
the whole lifetime of the driver. So where drivers get clocks and enable
them immediately, it can be combined into a single function
devm_clk_get_*(). Moreover, the unprepare and disable function
has been registered to devm_clk_state, and before devm_clk_state is
released, the clocks will be unprepareed and disable, so it is unnecessary
to unprepare and disable clocks explicitly when remove drivers or in the
error handling path.

Change log:

v2:
 - Remove empty function a3700_spi_remove(), while is nothing to do.
 - Return directly instead of calling reset_control_deassert(), because
   the reset control handler hasn't been requested yet in
   dw_spi_mmio_probe(). And use the "out_reset" label instead of "out"
   before calling pm_runtime_enable().
 - Delete the modification of odd formatting, it should probably be a
   separate patch.

v1: https://lore.kernel.org/all/20230822131237.1022815-1-lizetao1@huawei.com/

Li Zetao (25):
  spi: ar934x: Use helper function devm_clk_get_enabled()
  spi: armada-3700: Use helper function devm_clk_get_prepared()
  spi: aspeed: Use helper function devm_clk_get_enabled()
  spi: ath79: Use helper function devm_clk_get_enabled()
  spi: spi-axi-spi-engine: Use helper function devm_clk_get_enabled()
  spi: bcm2835: Use helper function devm_clk_get_enabled()
  spi: bcm2835aux: Use helper function devm_clk_get_enabled()
  spi: spi-cadence: Use helper function devm_clk_get_enabled()
  spi: spi-cavium-thunderx: Use helper function devm_clk_get_enabled()
  spi: davinci: Use helper function devm_clk_get_enabled()
  spi: dw-bt1: Use helper function devm_clk_get_enabled()
  spi: dw-mmio: Use helper function devm_clk_get_*()
  spi: spi-fsl-dspi: Use helper function devm_clk_get_enabled()
  spi: lantiq-ssc: Use helper function devm_clk_get_enabled()
  spi: meson-spicc: Use helper function devm_clk_get_enabled()
  spi: spi-meson-spifc: Use helper function devm_clk_get_enabled()
  spi: microchip-core-qspi: Use helper function devm_clk_get_enabled()
  spi: microchip-core: Use helper function devm_clk_get_enabled()
  spi: mtk-snfi: Use helper function devm_clk_get_enabled()
  spi: npcm-fiu: Use helper function devm_clk_get_enabled()
  spi: orion: Use helper function devm_clk_get_enabled()
  spi: pic32-sqi: Use helper function devm_clk_get_enabled()
  spi: pic32: Use helper function devm_clk_get_enabled()
  spi: spl022: Use helper function devm_clk_get_enabled()
  spi: rockchip: Use helper function devm_clk_get_enabled()

 drivers/spi/spi-ar934x.c              | 22 ++--------
 drivers/spi/spi-armada-3700.c         | 23 ++--------
 drivers/spi/spi-aspeed-smc.c          | 16 +------
 drivers/spi/spi-ath79.c               | 11 +----
 drivers/spi/spi-axi-spi-engine.c      | 25 +++--------
 drivers/spi/spi-bcm2835.c             | 11 +----
 drivers/spi/spi-bcm2835aux.c          | 23 ++--------
 drivers/spi/spi-cadence.c             | 23 ++--------
 drivers/spi/spi-cavium-thunderx.c     |  8 +---
 drivers/spi/spi-davinci.c             | 11 +----
 drivers/spi/spi-dw-bt1.c              | 23 +++-------
 drivers/spi/spi-dw-mmio.c             | 31 ++++----------
 drivers/spi/spi-fsl-dspi.c            | 12 ++----
 drivers/spi/spi-lantiq-ssc.c          | 10 +----
 drivers/spi/spi-meson-spicc.c         | 33 +++------------
 drivers/spi/spi-meson-spifc.c         | 17 ++------
 drivers/spi/spi-microchip-core-qspi.c | 29 +++----------
 drivers/spi/spi-microchip-core.c      |  9 +---
 drivers/spi/spi-mtk-snfi.c            | 61 ++++-----------------------
 drivers/spi/spi-npcm-fiu.c            | 14 ++----
 drivers/spi/spi-orion.c               | 11 +----
 drivers/spi/spi-pic32-sqi.c           | 27 ++----------
 drivers/spi/spi-pic32.c               |  8 +---
 drivers/spi/spi-pl022.c               | 11 +----
 drivers/spi/spi-rockchip.c            | 30 +++----------
 25 files changed, 87 insertions(+), 412 deletions(-)

-- 
2.34.1

