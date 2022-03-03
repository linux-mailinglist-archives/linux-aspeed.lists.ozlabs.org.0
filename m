Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FD94CBAE5
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 11:01:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8RN32j02z3c1h
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 21:01:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=iGc3tjeR;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832;
 helo=mail-qt1-x832.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=iGc3tjeR; dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8RMy6XbHz3bk2
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Mar 2022 21:01:34 +1100 (AEDT)
Received: by mail-qt1-x832.google.com with SMTP id b23so4117130qtt.6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Mar 2022 02:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G9PHk5b8ybcVtwN7kEtMFnRB/ixoL3gdzwNYrWBekH4=;
 b=iGc3tjeRFO5Rq2XYTcdMye2mUJQXxEERvcn+LrCIDZkAydY6bGbK56wkpjUHFc0TjF
 LECSYDRcmRUtSG7JBAXl3WSRHANYn5S2QY+ktWPAjNaYVap0AlSjvhdAzmLMvzK1WlaJ
 zJRdPYVyaxF/ju9TGZyi8ifWNzfUbUVZusKPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G9PHk5b8ybcVtwN7kEtMFnRB/ixoL3gdzwNYrWBekH4=;
 b=jV0l2/87e6KnZ4L6RT1D37uS9YZQ1zEib2PoR9/Qwztjlcctj5y61j9ufLr3w2bYIs
 Ig2jOQeCW9bvz9aWoKRoyiYQS7MGqUJu18/BIb97Oaf1dKDa1uiaMJEN0KX9RVyMg25l
 kfCThsgRL7xs7KGGCXnEZlnO5P79N+vLGFbH0d7UMem10Z5e/yMFiz3BT11pOJE6gxTt
 TLUElW+oCtqg2pSfgag7w2yEjZDv5ZdtN9u/JMAkPba89LC6mqeuBOpPn5/b/4ul951H
 GcnhhjSkgmtE8T3vXk4ENQSIjU82Hnu/1xjus+glJOn9pMBsAHJB4wtPji+kj576I5OA
 whXQ==
X-Gm-Message-State: AOAM530E1xBu8z7glL0HA4iWzLnIvLA2lZ6LMRJEJgfYSU23oo+FuGfR
 BRWJ2boHoZz51o24zy/mpdmd6jmhA7KT8KlCE9U=
X-Google-Smtp-Source: ABdhPJwbyjMF4/+uKtidDmLm+UFMaRCJqygDuoveGbZrVmtjir51PTwiLHr0xfupuoRunq3CJSzt8npBsay+Od5Tn0Q=
X-Received: by 2002:ac8:5d89:0:b0:2df:f357:c681 with SMTP id
 d9-20020ac85d89000000b002dff357c681mr20144873qtx.475.1646301692215; Thu, 03
 Mar 2022 02:01:32 -0800 (PST)
MIME-Version: 1.0
References: <20220302173114.927476-1-clg@kaod.org>
In-Reply-To: <20220302173114.927476-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 3 Mar 2022 10:01:20 +0000
Message-ID: <CACPK8Xdo=krCNVVs5=jiSnmyiPkNPd9Dxxyx0Tv8eUHKR5J3cQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] spi: spi-mem: Add driver for Aspeed SMC
 controllers
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Tao Ren <rentao.bupt@gmail.com>, John Wang <wangzq.jn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2 Mar 2022 at 17:31, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hi,
>
> This series adds a new SPI driver using the spi-mem interface for the
> Aspeed static memory controllers of the AST2600, AST2500 and AST2400
> SoCs.
>
>  * AST2600 Firmware SPI Memory Controller (FMC)
>  * AST2600 SPI Flash Controller (SPI1 and SPI2)

I've performed read and write tests on the 2600 controllers, and the
driver seems stable at the settings you have in the device tree.

Tested-by: Joel Stanley <joel@jms.id.au>

I've added Tao and John to cc as they have tested the 2400 and 2500,
and I'm sure will be able to provide some Tested-by.

Cheers,

Joel

>  * AST2500 Firmware SPI Memory Controller (FMC)
>  * AST2500 SPI Flash Controller (SPI1 and SPI2)
>  * AST2400 New Static Memory Controller (also referred as FMC)
>  * AST2400 SPI Flash Controller (SPI)
>
> It is based on the current OpenBMC kernel driver [1], using directly
> the MTD SPI-NOR interface and on a patchset [2] previously proposed
> adding support for the AST2600 only. This driver takes a slightly
> different approach to cover all 6 controllers.
>
> It does not make use of the controller register disabling Address and
> Data byte lanes because is not available on the AST2400 SoC. We could
> introduce a specific handler for new features available on recent SoCs
> if needed. As there is not much difference on performance, the driver
> chooses the common denominator: "User mode" which has been heavily
> tested in [1]. "User mode" is also used as a fall back method when
> flash device mapping window is too small.
>
> Problems to address with spi-mem were the configuration of the mapping
> windows and the calibration of the read timings. The driver handles
> them in the direct mapping handler when some knowledge on the size of
> the flash device is know. It is not perfect but not incorrect either.
> The algorithm is one from [1] because it doesn't require the DMA
> registers which are not available on all controllers.
>
> Direct mapping for writes is not supported (yet). I have seen some
> corruption with writes and I preferred to use the safer and proven
> method of the initial driver [1]. We can improve that later.
>
> The driver supports Quad SPI RX transfers on the AST2600 SoC but it
> didn't have the expected results. Therefore it is not activated yet.
> There are some issues on the pinctrl to investigate first.
>
> The series does not remove the current Aspeed SMC driver but prepares
> ground for its removal by changing its CONFIG option. This last step
> can be addressed as a followup when the new driver using the spi-mem
> interface has been sufficiently exposed.
>
> Tested on:
>
>  * OpenPOWER Palmetto (AST2400)
>  * Facebook Wedge 100 BMC (AST2400) by Tao Ren <rentao.bupt@gmail.com>
>  * Evaluation board (AST2500)
>  * Inspur FP5280G2 BMC  (AST2500) by John Wang <wangzq.jn@gmail.com>
>  * Facebook Backpack CMM BMC (AST2500) by Tao Ren <rentao.bupt@gmail.com>
>  * OpenPOWER Witherspoon (AST2500)
>  * Evaluation board (AST2600 A0 and A3)
>  * Rainier board (AST2600)
>
> [1] https://github.com/openbmc/linux/blob/dev-5.15/drivers/mtd/spi-nor/co=
ntrollers/aspeed-smc.c
> [2] https://patchwork.ozlabs.org/project/linux-aspeed/list/?series=3D2123=
94
>
> Thanks,
>
> C.
>
> Changes in v2:
>
>  - Fixed dt_binding_check warnings (Rob)
>  - New entry in MAINTAINERS
>  - Addressed Lukas comments regarding the SPI controller registration
>    and device removal. Checked with driver bind/unbind
>  - Introduced setup and cleanup handlers and removed routine looping
>    on the DT children properties (Pratyush)
>  - Clarified in commit log requirements for training.
>  - Removed defconfig changes of patch 1 since they were reverted in
>    the last patch (Joel)
>
> C=C3=A9dric Le Goater (10):
>   mtd: spi-nor: aspeed: Rename Kconfig option
>   ARM: dts: aspeed: Adjust "reg" property of FMC/SPI controllers
>   dt-bindings: spi: Add Aspeed SMC controllers device tree binding
>   spi: spi-mem: Add driver for Aspeed SMC controllers
>   spi: aspeed: Add support for direct mapping
>   spi: aspeed: Adjust direct mapping to device size
>   spi: aspeed: Workaround AST2500 limitations
>   spi: aspeed: Add support for the AST2400 SPI controller
>   spi: aspeed: Calibrate read timings
>   ARM: dts: aspeed: Enable Dual SPI RX transfers
>
>  drivers/spi/spi-aspeed-smc.c                  | 1186 +++++++++++++++++
>  .../bindings/spi/aspeed,ast2600-fmc.yaml      |   90 ++
>  MAINTAINERS                                   |   10 +
>  arch/arm/boot/dts/aspeed-g4.dtsi              |   12 +-
>  arch/arm/boot/dts/aspeed-g5.dtsi              |   16 +-
>  arch/arm/boot/dts/aspeed-g6.dtsi              |   17 +-
>  drivers/mtd/spi-nor/controllers/Kconfig       |    4 +-
>  drivers/mtd/spi-nor/controllers/Makefile      |    2 +-
>  drivers/spi/Kconfig                           |   11 +
>  drivers/spi/Makefile                          |    1 +
>  10 files changed, 1330 insertions(+), 19 deletions(-)
>  create mode 100644 drivers/spi/spi-aspeed-smc.c
>  create mode 100644 Documentation/devicetree/bindings/spi/aspeed,ast2600-=
fmc.yaml
>
> --
> 2.34.1
>
