Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE831D075B
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 08:41:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46p4Pq1MfGzDqL8
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 17:41:51 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=bootlin.com
 (client-ip=217.70.178.242; helo=mslow2.mail.gandi.net;
 envelope-from=alexandre.belloni@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=bootlin.com
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46mxld57zYzDqDM
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Oct 2019 21:38:18 +1100 (AEDT)
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 80E1F3B3CF6
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Oct 2019 10:11:17 +0000 (UTC)
Received: from localhost
 (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 57274240012;
 Mon,  7 Oct 2019 10:10:37 +0000 (UTC)
Date: Mon, 7 Oct 2019 12:10:37 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next 00/34] rtc: use devm_platform_ioremap_resource() to
 simplify code
Message-ID: <20191007101037.GE4254@piout.net>
References: <20191006102953.57536-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191006102953.57536-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Wed, 09 Oct 2019 17:41:37 +1100
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
Cc: baruch@tkos.co.il, linux-aspeed@lists.ozlabs.org, linus.walleij@linaro.org,
 patrice.chotard@st.com, paul@crapouillou.net, linux-tegra@vger.kernel.org,
 thierry.reding@gmail.com, michal.simek@xilinx.com, linux-rtc@vger.kernel.org,
 f.fainelli@gmail.com, khilman@baylibre.com, wens@csie.org,
 jonathanh@nvidia.com, ludovic.desroches@microchip.com,
 bcm-kernel-feedback-list@broadcom.com, slemieux.tyco@gmail.com,
 alexandre.torgue@st.com, sean.wang@mediatek.com, mripard@kernel.org,
 vz@mleia.com, linux-mediatek@lists.infradead.org, gregory.0xf0@gmail.com,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org,
 a.zummo@towertech.it, linux-stm32@st-md-mailman.stormreply.com,
 nicolas.ferre@microchip.com, linux-kernel@vger.kernel.org,
 linux@prisktech.co.nz, mcoquelin.stm32@gmail.com, computersforpeace@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 06/10/2019 18:29:19+0800, YueHaibing wrote:
> devm_platform_ioremap_resource() internally have platform_get_resource()
> and devm_ioremap_resource() in it. So instead of calling them separately
> use devm_platform_ioremap_resource() directly.
> 
> YueHaibing (34):
>   rtc: asm9260: use devm_platform_ioremap_resource() to simplify code
>   rtc: rtc-aspeed: use devm_platform_ioremap_resource() to simplify code
>   rtc: brcmstb-waketimer: use devm_platform_ioremap_resource() to
>     simplify code
>   rtc: at91sam9: use devm_platform_ioremap_resource() to simplify code
>   rtc: cadence: use devm_platform_ioremap_resource() to simplify code
>   rtc: coh901331: use devm_platform_ioremap_resource() to simplify code
>   rtc: davinci: use devm_platform_ioremap_resource() to simplify code
>   rtc: digicolor: use devm_platform_ioremap_resource() to simplify code
>   rtc: ds1216: use devm_platform_ioremap_resource() to simplify code
>   rtc: ds1511: use devm_platform_ioremap_resource() to simplify code
>   rtc: ds1553: use devm_platform_ioremap_resource() to simplify code
>   rtc: ep93xx: use devm_platform_ioremap_resource() to simplify code
>   rtc: jz4740: use devm_platform_ioremap_resource() to simplify code
>   rtc: lpc24xx: use devm_platform_ioremap_resource() to simplify code
>   rtc: lpc32xx: use devm_platform_ioremap_resource() to simplify code
>   rtc: meson: use devm_platform_ioremap_resource() to simplify code
>   rtc: mt7622: use devm_platform_ioremap_resource() to simplify code
>   rtc: mv: use devm_platform_ioremap_resource() to simplify code
>   rtc: omap: use devm_platform_ioremap_resource() to simplify code
>   rtc: pic32: use devm_platform_ioremap_resource() to simplify code
>   rtc: rtd119x: use devm_platform_ioremap_resource() to simplify code
>   rtc: s3c: use devm_platform_ioremap_resource() to simplify code
>   rtc: sa1100: use devm_platform_ioremap_resource() to simplify code
>   rtc: spear: use devm_platform_ioremap_resource() to simplify code
>   rtc: stk17ta8: use devm_platform_ioremap_resource() to simplify code
>   rtc: ds1286: use devm_platform_ioremap_resource() to simplify code
>   rtc: st-lpc: use devm_platform_ioremap_resource() to simplify code
>   rtc: stm32: use devm_platform_ioremap_resource() to simplify code
>   rtc: sunxi: use devm_platform_ioremap_resource() to simplify code
>   rtc: tegra: use devm_platform_ioremap_resource() to simplify code
>   rtc: tx4939: use devm_platform_ioremap_resource() to simplify code
>   rtc: vt8500: use devm_platform_ioremap_resource() to simplify code
>   rtc: xgene: use devm_platform_ioremap_resource() to simplify code
>   rtc: zynqmp: use devm_platform_ioremap_resource() to simplify code
> 
>  drivers/rtc/rtc-asm9260.c           | 4 +---
>  drivers/rtc/rtc-aspeed.c            | 4 +---
>  drivers/rtc/rtc-at91sam9.c          | 4 +---
>  drivers/rtc/rtc-brcmstb-waketimer.c | 4 +---
>  drivers/rtc/rtc-cadence.c           | 4 +---
>  drivers/rtc/rtc-coh901331.c         | 4 +---
>  drivers/rtc/rtc-davinci.c           | 4 +---
>  drivers/rtc/rtc-digicolor.c         | 4 +---
>  drivers/rtc/rtc-ds1216.c            | 4 +---
>  drivers/rtc/rtc-ds1286.c            | 4 +---
>  drivers/rtc/rtc-ds1511.c            | 4 +---
>  drivers/rtc/rtc-ds1553.c            | 4 +---
>  drivers/rtc/rtc-ep93xx.c            | 4 +---
>  drivers/rtc/rtc-jz4740.c            | 4 +---
>  drivers/rtc/rtc-lpc24xx.c           | 4 +---
>  drivers/rtc/rtc-lpc32xx.c           | 4 +---
>  drivers/rtc/rtc-meson.c             | 4 +---
>  drivers/rtc/rtc-mt7622.c            | 4 +---
>  drivers/rtc/rtc-mv.c                | 4 +---
>  drivers/rtc/rtc-omap.c              | 4 +---
>  drivers/rtc/rtc-pic32.c             | 4 +---
>  drivers/rtc/rtc-rtd119x.c           | 4 +---
>  drivers/rtc/rtc-s3c.c               | 4 +---
>  drivers/rtc/rtc-sa1100.c            | 4 +---
>  drivers/rtc/rtc-spear.c             | 4 +---
>  drivers/rtc/rtc-st-lpc.c            | 4 +---
>  drivers/rtc/rtc-stk17ta8.c          | 4 +---
>  drivers/rtc/rtc-stm32.c             | 4 +---
>  drivers/rtc/rtc-sunxi.c             | 4 +---
>  drivers/rtc/rtc-tegra.c             | 4 +---
>  drivers/rtc/rtc-tx4939.c            | 4 +---
>  drivers/rtc/rtc-vt8500.c            | 4 +---
>  drivers/rtc/rtc-xgene.c             | 4 +---
>  drivers/rtc/rtc-zynqmp.c            | 5 +----
>  34 files changed, 34 insertions(+), 103 deletions(-)
> 

I've quashed and applied.

> -- 
> 2.7.4
> 
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
