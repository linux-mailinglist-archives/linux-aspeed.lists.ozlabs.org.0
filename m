Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7ED6AFCAB
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Mar 2023 02:58:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWb8121xlz3c6Z
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Mar 2023 12:58:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gqt5/BmZ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gqt5/BmZ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWMCr0sYDz3cC1;
	Wed,  8 Mar 2023 04:01:12 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 93C0FB81997;
	Tue,  7 Mar 2023 17:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7A4C433B0;
	Tue,  7 Mar 2023 17:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678208468;
	bh=tKFTmiEx5lWVMe9kc/4siOWPAS1vRgintq9BdapPuw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gqt5/BmZ7eO+af/HjVRQiU3sw8JOtHGp6EMO4dWuOwrg2LueVE87FwMwbJmSMbDw3
	 ws29jqaUjUDjYiikTtt7/iKYg+2yrYf4T2JYLdR/uOCpmU1RmrY5zY6A63gtW5rM+x
	 DmiW0/1nByleyTnwwYj1Q66go/nxAjY8OGVSo4KWOto0Z75wa5ysvNT77Nh88lPcIm
	 kdDMXsZCBZ0GbSeik/wu87szoip24bAwSGhB4IwTpJH8yCVAVCuT2KqcDQtesriupl
	 JAFNPocJHQredNufuxvTfWTr5qcifQwWUjloMf3yohaiWo14eqm5mjyT1XK3IaJ4T9
	 RGF37doTHhI7Q==
Date: Tue, 7 Mar 2023 17:00:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 00/87] spi: Convert to platform remove callback returning
 void
Message-ID: <ddcda593-f8e9-43a4-bba6-dae31e8d6b39@sirena.org.uk>
References: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wo9frzy+aFktTPxK"
Content-Disposition: inline
In-Reply-To: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
X-Cookie: A rolling stone gathers momentum.
X-Mailman-Approved-At: Wed, 08 Mar 2023 12:56:37 +1100
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
Cc: Kursad Oney <kursad.oney@broadcom.com>, Tomer Maimon <tmaimon77@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Alim Akhtar <alim.akhtar@samsung.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, Michal Simek <michal.simek@xilinx.com>, Haibo Chen <haibo.chen@nxp.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev, Anand Gore <anand.gore@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Scott Branden <sbranden@broadcom.com>, linux-spi@vger.kernel.org, Yogesh Gaur <yogeshgaur.83@gmail.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Vladimir Oltean <olteanv@gmail.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Alexandre Bellon
 i <alexandre.belloni@bootlin.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Max Filippov <jcmvbkbc@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jonas Gorski <jonas.gorski@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Alain Volmat <alain.volmat@foss.st.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-xtensa@linux-xtensa.org, Andi Shyti <andi@etezian.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, Radu Pirea <radu_nicolae.pirea@upb.ro>, Jay Fang <f.fangjian@huawei.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Jassi Brar <jaswinder.singh@linaro.org>, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Masahisa Kojim
 a <masahisa.kojima@linaro.org>, Fabio Estevam <festevam@gmail.com>, linux-aspeed@lists.ozlabs.org, Florian Fainelli <f.fainelli@gmail.com>, Daire McNamara <daire.mcnamara@microchip.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Nancy Yuen <yuenn@google.com>, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Orson Zhai <orsonzhai@gmail.com>, William Zhang <william.zhang@broadcom.com>, Ray Jui <rjui@broadcom.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Li-hao Kuo <lhjeff911@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, linux-riscv@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>, Kamal Dasu <kdasu.kdev@gmail.com>, Andy Gross <agross@kernel.org>, linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walm
 sley@sifive.com>, Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Patrick Venture <venture@google.com>, Bjorn Andersson <andersson@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Serge Semin <fancer.lancer@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, openbmc@lists.ozlabs.org, Daniel Mack <daniel@zonque.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--Wo9frzy+aFktTPxK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2023 at 06:19:14PM +0100, Uwe Kleine-K=F6nig wrote:

>   spi: mpc512x-psc: Convert to platform remove callback returning void
>   spi: mpc52xx-psc: Convert to platform remove callback returning void

As well as the Raspberry Pi patch dropped due to build failures I also
dropped these two as they conflicted with Rob's refactoring of that
driver, nothing especially complex but since there's stuff to resend
anyway...

--Wo9frzy+aFktTPxK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQHbb4ACgkQJNaLcl1U
h9DDDQf/eo3lXns3dzYdzJYf8MxUxafb8rgDkge5kzhM/iS9lEnDcJX8Vno7IHOa
iZ7/NuWC1p4ofFyl04/WPa94f4hEYWTNqXgQ4TuEq9SRTyOTwZsqpS33uEc9v0zm
3/ja2SHHOw97vKeI+1IjK8fycKlOze/YwzP38U0UTECpJou6+41HYgRgx8L+J3Js
zILjs+qw1DhbaslGny+CEV6juxQO2LcIoNjdQYfWSbN4leZdcg8cW1+Obbr8KLen
nbcN3szhArY3SvbxgXR5muD5yNFtETWVBmVtjlT0mBXX4Lzgj7Pf0SgN1haH9bq/
jlQbNnEEvvkvGVicjB7wmDlS6gOoKw==
=fVjM
-----END PGP SIGNATURE-----

--Wo9frzy+aFktTPxK--
