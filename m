Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BE368CE01
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Feb 2023 05:10:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9qRj45byz2x9d
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Feb 2023 15:10:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=F0H3B8NA;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=jernej.skrabec@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=F0H3B8NA;
	dkim-atps=neutral
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P74KY1HGGz2xCd;
	Fri,  3 Feb 2023 03:40:47 +1100 (AEDT)
Received: by mail-ej1-x635.google.com with SMTP id ud5so7647845ejc.4;
        Thu, 02 Feb 2023 08:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JxadcUmstQQisxG5SMmC/yE89rXvA6AYxcU2YUnVDQ=;
        b=F0H3B8NAgseBrYAc9OhvFrrJcHUs5RxsmEgusiWeYI4oHZkbOFHj9Ncu15Uvbi4tCO
         GCoGClEA/o94QYw0U1UfeOAEL80uwq+5tCfPJWGsWnHH8HpmO1lWGzeCrAsIdF4Fu6zR
         kNR+WhBg1xqNyaBWvq3l+bklN9GSWeF5rkZflnjP5JjP6Pm7phnd2Ab56G7cA8boFLp0
         xzt+aopsRq/bEYAtjRCwCMmTji3jBwX9xCOCD4tzAC2fkbovQWodfYFH0SLzujYlkR2S
         3SeXJQSQvZdrRrWbPhPWjXi7p2pGkVjdnp+X80CVTlvacpypSO18F0i1MgCSG84IgzXR
         jpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JxadcUmstQQisxG5SMmC/yE89rXvA6AYxcU2YUnVDQ=;
        b=G498FrZ3wxbWsBtYPXQAtziD8pBkmLHkTrr8tCyMpxN6epq/YN1eUlxO8d6FN+tPTk
         KfUKJW/ogDuRJjOu1o6DPJuDv0oc5YQz29crjYCMpR8Vkn3A2flj7+zzBmnAfbtqKCCD
         MgBCKKfpbUIgl7FEml8wf1ubLL3nrT3Iuh1R3iSmNgm9G2gopOxF1MrCQToK7B9aSOaI
         Mq7cx6Me88Yc5GM3UsVjGx2dIDq9nP1lyqqZ4BIkfzmjxUi89cXQkcNoToDnYyLOE6Nl
         jlTzeW1MWQB0csoVRpjYAlWy82Fz74Oa1jDoALrjP6pHxagUavBlWVyvVTH5bihfYmSE
         rBpw==
X-Gm-Message-State: AO0yUKUCBH/7c0wLeqLiHPiqafNicw+F6BXHxSLrcVr/YyOVerDfM1Yi
	6sXrbmzluh4qBo2Iv1Z+KCo=
X-Google-Smtp-Source: AK7set8DElzpOFybgSqmpPkVSDP76pQ9uMXg+BggB0EZ9TIGd1XdSGpOOvGTm4L9iJVvil59yp3mTw==
X-Received: by 2002:a17:906:c156:b0:88d:ba89:1835 with SMTP id dp22-20020a170906c15600b0088dba891835mr2844484ejc.6.1675356040636;
        Thu, 02 Feb 2023 08:40:40 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id by13-20020a0564021b0d00b004a277d55a6csm3387108edb.1.2023.02.02.08.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 08:40:40 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: broonie@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, jic23@kernel.org, tudor.ambarus@microchip.com,
 pratyush@kernel.org, sanju.mehta@amd.com, chin-ting_kuo@aspeedtech.com,
 clg@kaod.org, kdasu.kdev@gmail.com, f.fainelli@gmail.com, rjui@broadcom.com,
 sbranden@broadcom.com, eajames@linux.ibm.com, olteanv@gmail.com,
 han.xu@nxp.com, john.garry@huawei.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, narmstrong@baylibre.com, khilman@baylibre.com,
 matthias.bgg@gmail.com, haibo.chen@nxp.com, linus.walleij@linaro.org,
 daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr,
 agross@kernel.org, bjorn.andersson@linaro.org, heiko@sntech.de,
 krzysztof.kozlowski@linaro.org, andi@etezian.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, samuel@sholland.org,
 masahisa.kojima@linaro.org, jaswinder.singh@linaro.org, rostedt@goodmis.org,
 mingo@redhat.com, l.stelmach@samsung.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 alex.aring@gmail.com, stefan@datenfreihafen.org, kvalo@kernel.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, palmer@dabbelt.com
Subject:  Re: [PATCH v3 01/13] spi: Replace all spi->chip_select and spi->cs_gpiod
 references with function call
Date: Thu, 02 Feb 2023 17:40:35 +0100
Message-ID: <4802797.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20230202152258.512973-2-amit.kumar-mahapatra@amd.com>
References:  <20230202152258.512973-1-amit.kumar-mahapatra@amd.com>
 <20230202152258.512973-2-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 07 Feb 2023 15:09:45 +1100
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
Cc: alexandre.belloni@bootlin.com, tmaimon77@gmail.com, linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, konrad.dybcio@somainline.org, tali.perry1@gmail.com, ldewangan@nvidia.com, linux-mtd@lists.infradead.org, alim.akhtar@samsung.com, linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org, festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com, git@amd.com, linux-samsung-soc@vger.kernel.org, yogeshgaur.83@gmail.com, openbmc@lists.ozlabs.org, yuenn@google.com, bcm-kernel-feedback-list@broadcom.com, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-imx@nxp.com, martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org, radu_nicolae.pirea@upb.ro, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, avifishman70@gmail.com, venture@google.com, libertas-dev@lists.infradead.org, linux-wireless@vger.k
 ernel.org, nicolas.ferre@microchip.com, fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com, kernel@pengutronix.de, netdev@vger.kernel.org, linux-wpan@vger.kernel.org, claudiu.beznea@microchip.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi!

Dne =C4=8Detrtek, 02. februar 2023 ob 16:22:46 CET je Amit Kumar Mahapatra=
=20
napisal(a):
> Supporting multi-cs in spi drivers would require the chip_select & cs_gpi=
od
> members of struct spi_device to be an array. But changing the type of the=
se
> members to array would break the spi driver functionality. To make the
> transition smoother introduced four new APIs to get/set the
> spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and
> spi->cs_gpiod references with get or set API calls.
> While adding multi-cs support in further patches the chip_select & cs_gpi=
od
> members of the spi_device structure would be converted to arrays & the
> "idx" parameter of the APIs would be used as array index i.e.,
> spi->chip_select[idx] & spi->cs_gpiod[idx] respectively.
>=20
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> Acked-by: Heiko Stuebner <heiko@sntech.de> # Rockchip drivers
> Reviewed-by: Michal Simek <michal.simek@amd.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org> # Aspeed driver
> Reviewed-by: Dhruva Gole <d-gole@ti.com> # SPI Cadence QSPI
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com> # spi-stm32-qs=
pi
> Acked-by: William Zhang <william.zhang@broadcom.com> # bcm63xx-hsspi driv=
er
> ---
>  drivers/spi/spi-altera-core.c     |  2 +-
>  drivers/spi/spi-amd.c             |  4 ++--
>  drivers/spi/spi-ar934x.c          |  2 +-
>  drivers/spi/spi-armada-3700.c     |  4 ++--
>  drivers/spi/spi-aspeed-smc.c      | 13 +++++++------
>  drivers/spi/spi-at91-usart.c      |  2 +-
>  drivers/spi/spi-ath79.c           |  4 ++--
>  drivers/spi/spi-atmel.c           | 26 +++++++++++++-------------
>  drivers/spi/spi-au1550.c          |  4 ++--
>  drivers/spi/spi-axi-spi-engine.c  |  2 +-
>  drivers/spi/spi-bcm-qspi.c        | 10 +++++-----
>  drivers/spi/spi-bcm2835.c         | 19 ++++++++++---------
>  drivers/spi/spi-bcm2835aux.c      |  4 ++--
>  drivers/spi/spi-bcm63xx-hsspi.c   | 22 +++++++++++-----------
>  drivers/spi/spi-bcm63xx.c         |  2 +-
>  drivers/spi/spi-cadence-quadspi.c |  5 +++--
>  drivers/spi/spi-cadence-xspi.c    |  4 ++--
>  drivers/spi/spi-cadence.c         |  4 ++--
>  drivers/spi/spi-cavium.c          |  8 ++++----
>  drivers/spi/spi-coldfire-qspi.c   |  8 ++++----
>  drivers/spi/spi-davinci.c         | 18 +++++++++---------
>  drivers/spi/spi-dln2.c            |  6 +++---
>  drivers/spi/spi-dw-core.c         |  2 +-
>  drivers/spi/spi-dw-mmio.c         |  4 ++--
>  drivers/spi/spi-falcon.c          |  2 +-
>  drivers/spi/spi-fsi.c             |  2 +-
>  drivers/spi/spi-fsl-dspi.c        | 16 ++++++++--------
>  drivers/spi/spi-fsl-espi.c        |  6 +++---
>  drivers/spi/spi-fsl-lpspi.c       |  2 +-
>  drivers/spi/spi-fsl-qspi.c        |  6 +++---
>  drivers/spi/spi-fsl-spi.c         |  2 +-
>  drivers/spi/spi-geni-qcom.c       |  6 +++---
>  drivers/spi/spi-gpio.c            |  4 ++--
>  drivers/spi/spi-gxp.c             |  4 ++--
>  drivers/spi/spi-hisi-sfc-v3xx.c   |  2 +-
>  drivers/spi/spi-img-spfi.c        | 14 +++++++-------
>  drivers/spi/spi-imx.c             | 30 +++++++++++++++---------------
>  drivers/spi/spi-ingenic.c         |  4 ++--
>  drivers/spi/spi-intel.c           |  2 +-
>  drivers/spi/spi-jcore.c           |  4 ++--
>  drivers/spi/spi-lantiq-ssc.c      |  6 +++---
>  drivers/spi/spi-mem.c             |  4 ++--
>  drivers/spi/spi-meson-spicc.c     |  2 +-
>  drivers/spi/spi-microchip-core.c  |  6 +++---
>  drivers/spi/spi-mpc512x-psc.c     |  8 ++++----
>  drivers/spi/spi-mpc52xx.c         |  2 +-
>  drivers/spi/spi-mt65xx.c          |  6 +++---
>  drivers/spi/spi-mt7621.c          |  2 +-
>  drivers/spi/spi-mux.c             |  8 ++++----
>  drivers/spi/spi-mxic.c            | 10 +++++-----
>  drivers/spi/spi-mxs.c             |  2 +-
>  drivers/spi/spi-npcm-fiu.c        | 20 ++++++++++----------
>  drivers/spi/spi-nxp-fspi.c        | 10 +++++-----
>  drivers/spi/spi-omap-100k.c       |  2 +-
>  drivers/spi/spi-omap-uwire.c      |  8 ++++----
>  drivers/spi/spi-omap2-mcspi.c     | 24 ++++++++++++------------
>  drivers/spi/spi-orion.c           |  4 ++--
>  drivers/spi/spi-pci1xxxx.c        |  4 ++--
>  drivers/spi/spi-pic32-sqi.c       |  2 +-
>  drivers/spi/spi-pic32.c           |  4 ++--
>  drivers/spi/spi-pl022.c           |  4 ++--
>  drivers/spi/spi-pxa2xx.c          |  6 +++---
>  drivers/spi/spi-qcom-qspi.c       |  2 +-
>  drivers/spi/spi-rb4xx.c           |  2 +-
>  drivers/spi/spi-rockchip-sfc.c    |  2 +-
>  drivers/spi/spi-rockchip.c        | 26 ++++++++++++++------------
>  drivers/spi/spi-rspi.c            | 10 +++++-----
>  drivers/spi/spi-s3c64xx.c         |  2 +-
>  drivers/spi/spi-sc18is602.c       |  4 ++--
>  drivers/spi/spi-sh-msiof.c        |  6 +++---
>  drivers/spi/spi-sh-sci.c          |  2 +-
>  drivers/spi/spi-sifive.c          |  6 +++---
>  drivers/spi/spi-sn-f-ospi.c       |  2 +-
>  drivers/spi/spi-st-ssc4.c         |  2 +-
>  drivers/spi/spi-stm32-qspi.c      | 12 ++++++------
>  drivers/spi/spi-sun4i.c           |  2 +-
>  drivers/spi/spi-sun6i.c           |  2 +-

=46or sun4i, sun6i:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/spi/spi-synquacer.c       |  6 +++---
>  drivers/spi/spi-tegra114.c        | 28 ++++++++++++++--------------
>  drivers/spi/spi-tegra20-sflash.c  |  2 +-
>  drivers/spi/spi-tegra20-slink.c   |  6 +++---
>  drivers/spi/spi-tegra210-quad.c   |  8 ++++----
>  drivers/spi/spi-ti-qspi.c         | 16 ++++++++--------
>  drivers/spi/spi-topcliff-pch.c    |  4 ++--
>  drivers/spi/spi-wpcm-fiu.c        | 12 ++++++------
>  drivers/spi/spi-xcomm.c           |  2 +-
>  drivers/spi/spi-xilinx.c          |  6 +++---
>  drivers/spi/spi-xlp.c             |  4 ++--
>  drivers/spi/spi-zynq-qspi.c       |  2 +-
>  drivers/spi/spi-zynqmp-gqspi.c    |  2 +-
>  drivers/spi/spidev.c              |  6 +++---
>  include/trace/events/spi.h        | 10 +++++-----
>  92 files changed, 315 insertions(+), 310 deletions(-)



