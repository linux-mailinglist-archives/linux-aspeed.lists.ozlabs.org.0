Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 114EC68CDFF
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Feb 2023 05:10:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9qRX6nMSz3cMH
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Feb 2023 15:10:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KU4ZzAZC;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KU4ZzAZC;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6QVC0d6nz3cFd;
	Thu,  2 Feb 2023 02:16:03 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 58CC5617E3;
	Wed,  1 Feb 2023 15:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DF4C433D2;
	Wed,  1 Feb 2023 15:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675264559;
	bh=LRcOg2q+eDGVIXXY2nwx4erwH77a/aRq28NUs5IDyCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KU4ZzAZCfEIFr0jm610wDLcfNDu1BT7alWBq4lCdAi8jxLcmCiG+N3M8pD98e92bq
	 jEveutD/LRtarHkLSi1VT+wkWbr0FiUwuP11kxiQ/FQ/0dLJS9f7wk4WIsY81RNwsT
	 zE2rXqGv+swsJ+x2navfQqq5XD8GmEgv0vJSNVcB+mloglAaqXwO0rFQl2XUbT1nWE
	 N9OHyols6boAqmJ12PCA7BF6t1yvrYW7Nw9tEb0eKdvPWGnJ5Rqf1wv3Ng4NK3ygNW
	 owxjCxS1tCFcCwRtOSIJKriVsuXGINVmjP3mb2jgXizk7d2Q0jSrHyCO8vF9Om7Gjt
	 MSXjxi7+9AcEg==
Date: Wed, 1 Feb 2023 15:15:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: Re: [PATCH v2 02/13] spi: Replace all spi->chip_select and
 spi->cs_gpiod references with function call
Message-ID: <Y9qCF7DS+FQo1RYp@sirena.org.uk>
References: <20230119185342.2093323-1-amit.kumar-mahapatra@amd.com>
 <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RnOekfr0Q/w96KQx"
Content-Disposition: inline
In-Reply-To: <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
X-Cookie: Oh no, not again.
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
Cc: heiko@sntech.de, linus.walleij@linaro.org, dri-devel@lists.freedesktop.org, alim.akhtar@samsung.com, miquel.raynal@bootlin.com, sumit.semwal@linaro.org, stefan@datenfreihafen.org, tmaimon77@gmail.com, linux-samsung-soc@vger.kernel.org, samuel@sholland.org, khilman@baylibre.com, haibo.chen@nxp.com, mingo@redhat.com, linux-imx@nxp.com, linux-sunxi@lists.linux.dev, s.hauer@pengutronix.de, l.stelmach@samsung.com, sanju.mehta@amd.com, elder@kernel.org, sbranden@broadcom.com, gregkh@linuxfoundation.org, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, yogeshgaur.83@gmail.com, michael@walle.cc, skomatineni@nvidia.com, kernel@pengutronix.de, olteanv@gmail.com, linux-wpan@vger.kernel.org, claudiu.beznea@microchip.com, alexandre.belloni@bootlin.com, linux-aspeed@lists.ozlabs.org, linux-wireless@vger.kernel.org, edumazet@google.com, thierry.reding@gmail.com, lars@metafoo.de, vireshk@kernel.org, jonathanh@nvidia.com, linux-rockchip@lists.infr
 adead.org, jbrunet@baylibre.com, linux-media@vger.kernel.org, andi@etezian.org, Michael.Hennerich@analog.com, martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org, radu_nicolae.pirea@upb.ro, haojian.zhuang@gmail.com, jaswinder.singh@linaro.org, clg@kaod.org, linux-amlogic@lists.infradead.org, michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org, libertas-dev@lists.infradead.org, davem@davemloft.net, mcoquelin.stm32@gmail.com, pratyush@kernel.org, linux-rpi-kernel@lists.infradead.org, narmstrong@baylibre.com, linux-iio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-mtd@lists.infradead.org, masahisa.kojima@linaro.org, festevam@gmail.com, git@amd.com, f.fainelli@gmail.com, linux-staging@lists.linux.dev, jernej.skrabec@gmail.com, yuenn@google.com, wens@csie.org, bcm-kernel-feedback-list@broadcom.com, pabeni@redhat.com, amitrkcian2002@gmail.com, rjui@broadcom.com, john.garry@huawei.com, j.neuschaefer@gmx.net, rostedt@goodmis.org, tali
 .perry1@gmail.com, avifishman70@gmail.com, ldewangan@nvidia.com, netdev@vger.kernel.org, shawnguo@kernel.org, christian.koenig@amd.com, alex.aring@gmail.com, vigneshr@ti.com, konrad.dybcio@somainline.org, alexandre.torgue@foss.st.com, bjorn.andersson@linaro.org, linux-riscv@lists.infradead.org, robert.jarzmik@free.fr, kdasu.kdev@gmail.com, richard@nod.at, agross@kernel.org, kuba@kernel.org, tudor.ambarus@microchip.com, kvalo@kernel.org, johan@kernel.org, rmfrfs@gmail.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, han.xu@nxp.com, venture@google.com, nicolas.ferre@microchip.com, fancer.lancer@gmail.com, krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, jic23@kernel.org, openbmc@lists.ozlabs.org, daniel@zonque.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--RnOekfr0Q/w96KQx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 20, 2023 at 12:23:31AM +0530, Amit Kumar Mahapatra wrote:
> Supporting multi-cs in spi drivers would require the chip_select & cs_gpiod
> members of struct spi_device to be an array. But changing the type of these
> members to array would break the spi driver functionality. To make the
> transition smoother introduced four new APIs to get/set the
> spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and
> spi->cs_gpiod references with get or set API calls.
> While adding multi-cs support in further patches the chip_select & cs_gpiod
> members of the spi_device structure would be converted to arrays & the
> "idx" parameter of the APIs would be used as array index i.e.,
> spi->chip_select[idx] & spi->cs_gpiod[idx] respectively.

This doesn't apply against current code, please check and resend.

--RnOekfr0Q/w96KQx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPaghYACgkQJNaLcl1U
h9Cmcgf7BtQa6jVrXNU71IJVO9/XKJzR22YYvwnRLJqC4Pd6uUnIG4DAhyw1qQyf
fucGeAY9Y8jlqFuw1RM+0pFy53EabmhZAQjypGnDXk/YJ0fTV2VJuT7bSfXC+JJe
0Qs8nYPpVfn9TmLvBxiPjnsghneRyWbx+V7MzflSFTsVl/fM5ypTH92qZ3S6rTDh
ExXE6oTe7hNyto8+VoMfi0qvdqTKMyPciO0DnOeUsbPG3FpAiNiHN1lD5yhI6QEM
jA8R67+KRGUoFZsozgB5N3NN8BH9FWq5Hrl/ToTuWP1AT9C8prAEa2uwlU3YVDmA
SztMxe2B+kl+AF4gZ5yyL6EOiMGk6g==
=zhKL
-----END PGP SIGNATURE-----

--RnOekfr0Q/w96KQx--
