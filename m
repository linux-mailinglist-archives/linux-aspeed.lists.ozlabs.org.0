Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8BE7846BA
	for <lists+linux-aspeed@lfdr.de>; Tue, 22 Aug 2023 18:16:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVZGs36rVz3c2f
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Aug 2023 02:16:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVZGn1jymz3bq1;
	Wed, 23 Aug 2023 02:16:33 +1000 (AEST)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RVZ9f3gsrz6J6cZ;
	Wed, 23 Aug 2023 00:12:06 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 17:16:28 +0100
Date: Tue, 22 Aug 2023 17:16:27 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Li Zetao <lizetao1@huawei.com>
Subject: Re: [PATCH -next 00/25] spi: Use devm_clk_get_*() helper function
 to simplify the drivers.
Message-ID: <20230822171627.00007020@Huawei.com>
In-Reply-To: <20230822131237.1022815-1-lizetao1@huawei.com>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
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
Cc: tmaimon77@gmail.com, linux-aspeed@lists.ozlabs.org, linus.walleij@linaro.org, tali.perry1@gmail.com, conor.dooley@microchip.com, linux-riscv@lists.infradead.org, jbrunet@baylibre.com, florian.fainelli@broadcom.com, linux-rockchip@lists.infradead.org, khilman@baylibre.com, yuenn@google.com, bcm-kernel-feedback-list@broadcom.com, avifishman70@gmail.com, martin.blumenstingl@googlemail.com, rjui@broadcom.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, clg@kaod.org, matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org, sbranden@broadcom.com, daire.mcnamara@microchip.com, venture@google.com, heiko@sntech.de, fancer.lancer@gmail.com, linux-spi@vger.kernel.org, olteanv@gmail.com, openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 22 Aug 2023 21:12:12 +0800
Li Zetao <lizetao1@huawei.com> wrote:

> Commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks") provides a new helper function for prepared and
> enabled clocks when a driver keeps a clock prepared (or enabled) during
> the whole lifetime of the driver. So where drivers get clocks and enable
> them immediately, it can be combined into a single function
> devm_clk_get_*(). Moreover, the unprepare and disable function
> has been registered to devm_clk_state, and before devm_clk_state is
> released, the clocks will be unprepareed and disable, so it is unnecessary
> to unprepare and disable clocks explicitly when remove drivers or in the
> error handling path.

For all except 2, 12 and 24
they look good to me and I don't think there are any other ordering issues
of the sort we tend to see in devm conversions where things get turned off
later than in pre devm version.

So for those..
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>



> 
> Li Zetao (25):
>   spi: ar934x: Use helper function devm_clk_get_enabled()
>   spi: armada-3700: Use helper function devm_clk_get_prepared()
>   spi: aspeed: Use helper function devm_clk_get_enabled()
>   spi: ath79: Use helper function devm_clk_get_enabled()
>   spi: spi-axi-spi-engine: Use helper function devm_clk_get_enabled()
>   spi: bcm2835: Use helper function devm_clk_get_enabled()
>   spi: bcm2835aux: Use helper function devm_clk_get_enabled()
>   spi: spi-cadence: Use helper function devm_clk_get_enabled()
>   spi: spi-cavium-thunderx: Use helper function devm_clk_get_enabled()
>   spi: davinci: Use helper function devm_clk_get_enabled()
>   spi: dw-bt1: Use helper function devm_clk_get_enabled()
>   spi: dw-mmio: Use helper function devm_clk_get_*()
>   spi: spi-fsl-dspi: Use helper function devm_clk_get_enabled()
>   spi: lantiq-ssc: Use helper function devm_clk_get_enabled()
>   spi: meson-spicc: Use helper function devm_clk_get_enabled()
>   spi: spi-meson-spifc: Use helper function devm_clk_get_enabled()
>   spi: microchip-core-qspi: Use helper function devm_clk_get_enabled()
>   spi: microchip-core: Use helper function devm_clk_get_enabled()
>   spi: mtk-snfi: Use helper function devm_clk_get_enabled()
>   spi: npcm-fiu: Use helper function devm_clk_get_enabled()
>   spi: orion: Use helper function devm_clk_get_enabled()
>   spi: pic32-sqi: Use helper function devm_clk_get_enabled()
>   spi: pic32: Use helper function devm_clk_get_enabled()
>   spi: spl022: Use helper function devm_clk_get_enabled()
>   spi: rockchip: Use helper function devm_clk_get_enabled()
> 
>  drivers/spi/spi-ar934x.c              | 22 ++--------
>  drivers/spi/spi-armada-3700.c         | 18 ++------
>  drivers/spi/spi-aspeed-smc.c          | 16 +------
>  drivers/spi/spi-ath79.c               | 11 +----
>  drivers/spi/spi-axi-spi-engine.c      | 25 +++--------
>  drivers/spi/spi-bcm2835.c             | 11 +----
>  drivers/spi/spi-bcm2835aux.c          | 23 ++--------
>  drivers/spi/spi-cadence.c             | 23 ++--------
>  drivers/spi/spi-cavium-thunderx.c     |  8 +---
>  drivers/spi/spi-davinci.c             | 11 +----
>  drivers/spi/spi-dw-bt1.c              | 23 +++-------
>  drivers/spi/spi-dw-mmio.c             | 20 +++------
>  drivers/spi/spi-fsl-dspi.c            | 12 ++----
>  drivers/spi/spi-lantiq-ssc.c          | 10 +----
>  drivers/spi/spi-meson-spicc.c         | 33 +++------------
>  drivers/spi/spi-meson-spifc.c         | 17 ++------
>  drivers/spi/spi-microchip-core-qspi.c | 29 +++----------
>  drivers/spi/spi-microchip-core.c      |  9 +---
>  drivers/spi/spi-mtk-snfi.c            | 61 ++++-----------------------
>  drivers/spi/spi-npcm-fiu.c            | 14 ++----
>  drivers/spi/spi-orion.c               | 11 +----
>  drivers/spi/spi-pic32-sqi.c           | 27 ++----------
>  drivers/spi/spi-pic32.c               |  8 +---
>  drivers/spi/spi-pl022.c               | 21 +++------
>  drivers/spi/spi-rockchip.c            | 30 +++----------
>  25 files changed, 88 insertions(+), 405 deletions(-)
> 

