Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1E67885EB
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 13:38:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXHyj6LMFz3c5V
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 21:38:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=lizetao1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVVby6B7Mz2ymM;
	Tue, 22 Aug 2023 23:31:10 +1000 (AEST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RVV7F1HmdzLpDb;
	Tue, 22 Aug 2023 21:09:45 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 21:12:48 +0800
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
Subject: [PATCH -next 00/25] spi: Use devm_clk_get_*() helper function to simplify the drivers.
Date: Tue, 22 Aug 2023 21:12:12 +0800
Message-ID: <20230822131237.1022815-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
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
 drivers/spi/spi-armada-3700.c         | 18 ++------
 drivers/spi/spi-aspeed-smc.c          | 16 +------
 drivers/spi/spi-ath79.c               | 11 +----
 drivers/spi/spi-axi-spi-engine.c      | 25 +++--------
 drivers/spi/spi-bcm2835.c             | 11 +----
 drivers/spi/spi-bcm2835aux.c          | 23 ++--------
 drivers/spi/spi-cadence.c             | 23 ++--------
 drivers/spi/spi-cavium-thunderx.c     |  8 +---
 drivers/spi/spi-davinci.c             | 11 +----
 drivers/spi/spi-dw-bt1.c              | 23 +++-------
 drivers/spi/spi-dw-mmio.c             | 20 +++------
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
 drivers/spi/spi-pl022.c               | 21 +++------
 drivers/spi/spi-rockchip.c            | 30 +++----------
 25 files changed, 88 insertions(+), 405 deletions(-)

-- 
2.34.1

