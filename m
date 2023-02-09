Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D11069BEF4
	for <lists+linux-aspeed@lfdr.de>; Sun, 19 Feb 2023 08:46:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKHfd3Czbz3bgX
	for <lists+linux-aspeed@lfdr.de>; Sun, 19 Feb 2023 18:46:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L4cNRE4M;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L4cNRE4M;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCK6S5Dj5z307T;
	Fri, 10 Feb 2023 01:30:56 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7820061AB9;
	Thu,  9 Feb 2023 14:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C41C433EF;
	Thu,  9 Feb 2023 14:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675953052;
	bh=n5q92jtNB++4BoYIauYygzacB4DdXZvQYlYHsoaQZHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L4cNRE4MQxZhPNyBF/08CXXf/FWNQlzUwcRLG/0S65J/4ZChTqeAH+gdyIm7+puo/
	 e1NMfqyqjToGWx/m2stUfU7oe9VJ+8njI+o0jyklZ6aQ10e0wIfN7idp96BYLv9Fv3
	 QhfxNouUc0qZTgyD3UIjJF1eoI/sa7sYlEflw9jIrrOTdIfoFZo0OmH5vYc0Tjwjlg
	 7k/6gJhmjkwo6pEOCZrEJ5FmUMlxfm8y1s7LLhR+jeJXraVBKucJ1jUqjs66gKI0qH
	 XjavWBRymrRU2MvlL95tjkP7Fwb0aTwHP4DAbOFosKC6AT8CudX5DVtLZ+LDNj9wE2
	 dDufUua3aqd7w==
Date: Thu, 9 Feb 2023 14:30:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: Re: [PATCH v3 01/13] spi: Replace all spi->chip_select and
 spi->cs_gpiod references with function call
Message-ID: <Y+UDhWK6u9NkMTxv@sirena.org.uk>
References: <20230202152258.512973-1-amit.kumar-mahapatra@amd.com>
 <20230202152258.512973-2-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iWU3nY956KPhZko1"
Content-Disposition: inline
In-Reply-To: <20230202152258.512973-2-amit.kumar-mahapatra@amd.com>
X-Cookie: Androphobia:
X-Mailman-Approved-At: Sun, 19 Feb 2023 18:42:49 +1100
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
Cc: heiko@sntech.de, linus.walleij@linaro.org, alim.akhtar@samsung.com, miquel.raynal@bootlin.com, linux-stm32@st-md-mailman.stormreply.com, stefan@datenfreihafen.org, tmaimon77@gmail.com, linux-samsung-soc@vger.kernel.org, samuel@sholland.org, khilman@baylibre.com, Dhruva Gole <d-gole@ti.com>, haibo.chen@nxp.com, mingo@redhat.com, linux-imx@nxp.com, linux-sunxi@lists.linux.dev, s.hauer@pengutronix.de, l.stelmach@samsung.com, sanju.mehta@amd.com, sbranden@broadcom.com, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, yogeshgaur.83@gmail.com, michael@walle.cc, kernel@pengutronix.de, olteanv@gmail.com, linux-wpan@vger.kernel.org, claudiu.beznea@microchip.com, alexandre.belloni@bootlin.com, linux-aspeed@lists.ozlabs.org, edumazet@google.com, ldewangan@nvidia.com, lars@metafoo.de, jonathanh@nvidia.com, linux-rockchip@lists.infradead.org, jbrunet@baylibre.com, andi@etezian.org, Michael.Hennerich@analog.com, martin.blumenstingl@googlemail.com, linux-
 arm-msm@vger.kernel.org, radu_nicolae.pirea@upb.ro, haojian.zhuang@gmail.com, jaswinder.singh@linaro.org, clg@kaod.org, linux-amlogic@lists.infradead.org, michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, libertas-dev@lists.infradead.org, mcoquelin.stm32@gmail.com, pratyush@kernel.org, linux-rpi-kernel@lists.infradead.org, narmstrong@baylibre.com, linux-iio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-mtd@lists.infradead.org, masahisa.kojima@linaro.org, festevam@gmail.com, git@amd.com, f.fainelli@gmail.com, jernej.skrabec@gmail.com, yuenn@google.com, wens@csie.org, bcm-kernel-feedback-list@broadcom.com, pabeni@redhat.com, Patrice Chotard <patrice.chotard@foss.st.com>, amitrkcian2002@gmail.com, William Zhang <william.zhang@broadcom.com>, rjui@broadcom.com, john.garry@huawei.com, rostedt@goodmis.org, tali.perry1@gmail.com, avifishman70@gmail.com, thierry.reding@gmail.com, netdev@vger.kernel.org, shawnguo@kernel.org, davem@davemloft.net, alex.aring@gmail.com, vigneshr@
 ti.com, konrad.dybcio@somainline.org, alexandre.torgue@foss.st.com, bjorn.andersson@linaro.org, linux-riscv@lists.infradead.org, robert.jarzmik@free.fr, kdasu.kdev@gmail.com, richard@nod.at, agross@kernel.org, kuba@kernel.org, tudor.ambarus@microchip.com, kvalo@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, han.xu@nxp.com, venture@google.com, nicolas.ferre@microchip.com, fancer.lancer@gmail.com, krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, jic23@kernel.org, openbmc@lists.ozlabs.org, daniel@zonque.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--iWU3nY956KPhZko1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2023 at 08:52:46PM +0530, Amit Kumar Mahapatra wrote:
> Supporting multi-cs in spi drivers would require the chip_select & cs_gpi=
od
> members of struct spi_device to be an array. But changing the type of the=
se
> members to array would break the spi driver functionality. To make the
> transition smoother introduced four new APIs to get/set the

This break an arm multi_v7_defconfig build:

/build/stage/linux/drivers/spi/spi-pl022.c: In function =E2=80=98pl022_tran=
sfer_one_message=E2=80=99:
/build/stage/linux/drivers/spi/spi-pl022.c:1592:31: error: =E2=80=98struct =
spi_message=E2=80=99 has no member named =E2=80=98spi_get_csgpiod=E2=80=99
 1592 |         pl022->cur_gpiod =3D msg->spi_get_csgpiod(spi, 0);
      |                               ^~
/build/stage/linux/drivers/spi/spi-pl022.c:1592:49: error: =E2=80=98spi=E2=
=80=99 undeclared (first use in this function)
 1592 |         pl022->cur_gpiod =3D msg->spi_get_csgpiod(spi, 0);
      |                                                 ^~~
/build/stage/linux/drivers/spi/spi-pl022.c:1592:49: note: each undeclared i=
dentifier is reported only once for each function it appears in

--iWU3nY956KPhZko1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPlA4QACgkQJNaLcl1U
h9Ai+wf+IWbvrI/uIEjinXzailRkkSP40/uzdnv8AAKF5zA3laimeZYZPCoKfD4X
GzBSQEjiZOJmPZ0wBaHHFFaxHSBlL6rtUoA6r+EEktjzWc6vOsmoUVRt74R+ZMHw
1FyvWR07nFAstJD2rPfPhIZ5bt4yiRX/CmA2SxN1qW74IwjKYAy6jLvbpSAZ4byY
KRnij11f/xqUuiao0L/PTya+dYLUOBEQvXm5JBAIqhZaQVH4G7Ppov0MR15cEMug
OG9oMzu197RFh7WgO6lj8rI9Cssl4vvj6+3owDZ/nK+LFq62Z6AvBGbaP7SoHOOI
Xcz8JdTcCAH0XAgza9flmPUQME9cmQ==
=4wBC
-----END PGP SIGNATURE-----

--iWU3nY956KPhZko1--
