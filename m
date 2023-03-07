Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ECE6AFCAC
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Mar 2023 02:58:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWb8427Qhz3brK
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Mar 2023 12:58:44 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWNH26kXkz3cLB
	for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Mar 2023 04:49:00 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pZbOi-0001A8-23; Tue, 07 Mar 2023 18:46:48 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pZbOJ-002XP1-FG; Tue, 07 Mar 2023 18:46:23 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pZbOI-0034GD-GY; Tue, 07 Mar 2023 18:46:22 +0100
Date: Tue, 7 Mar 2023 18:46:22 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 00/87] spi: Convert to platform remove callback returning
 void
Message-ID: <20230307174622.vluzrlicw2gdn7hq@pengutronix.de>
References: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
 <ddcda593-f8e9-43a4-bba6-dae31e8d6b39@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="subqk3tp4gcmon6z"
Content-Disposition: inline
In-Reply-To: <ddcda593-f8e9-43a4-bba6-dae31e8d6b39@sirena.org.uk>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-aspeed@lists.ozlabs.org
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
Cc: Kursad Oney <kursad.oney@broadcom.com>, Tomer Maimon <tmaimon77@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Alim Akhtar <alim.akhtar@samsung.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, Michal Simek <michal.simek@xilinx.com>, Haibo Chen <haibo.chen@nxp.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev, Anand Gore <anand.gore@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Scott Branden <sbranden@broadcom.com>, Daire McNamara <daire.mcnamara@microchip.com>, linux-spi@vger.kernel.org, Sowjanya Komatineni <skomatineni@nvidia.com>, Masami Hiramatsu <mhiramat@kernel.org>, Andi Shyti <andi@etezian.org>, Vladimir Oltean <olteanv@gmail.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Alexandre Belloni <alexand
 re.belloni@bootlin.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Max Filippov <jcmvbkbc@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jonas Gorski <jonas.gorski@gmail.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Alain Volmat <alain.volmat@foss.st.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-xtensa@linux-xtensa.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, Radu Pirea <radu_nicolae.pirea@upb.ro>, Jay Fang <f.fangjian@huawei.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Jassi Brar <jaswinder.singh@linaro.org>, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-rpi-kernel@lists.infradead.org
 , linux-tegra@vger.kernel.org, Masahisa Kojima <masahisa.kojima@linaro.org>, Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, linux-aspeed@lists.ozlabs.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Nancy Yuen <yuenn@google.com>, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Orson Zhai <orsonzhai@gmail.com>, William Zhang <william.zhang@broadcom.com>, Ray Jui <rjui@broadcom.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Li-hao Kuo <lhjeff911@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, linux-riscv@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>, Kamal Dasu <kdasu.kdev@gmail.com>, Andy Gross <agross@kernel.org>, linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsl
 ey@sifive.com>, Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Patrick Venture <venture@google.com>, Bjorn Andersson <andersson@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Serge Semin <fancer.lancer@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, openbmc@lists.ozlabs.org, Daniel Mack <daniel@zonque.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--subqk3tp4gcmon6z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Mark,

On Tue, Mar 07, 2023 at 05:00:47PM +0000, Mark Brown wrote:
> On Fri, Mar 03, 2023 at 06:19:14PM +0100, Uwe Kleine-K=F6nig wrote:
>=20
> >   spi: mpc512x-psc: Convert to platform remove callback returning void
> >   spi: mpc52xx-psc: Convert to platform remove callback returning void
>=20
> As well as the Raspberry Pi patch dropped due to build failures I also
> dropped these two as they conflicted with Rob's refactoring of that
> driver, nothing especially complex but since there's stuff to resend
> anyway...

Fine for me. Given that my queue of patches to convert the remove
callbacks is quite big, there is no pressure from my side to get these
all in. 84 from 87 is great already, I'll care about the remaining 3
patches (and the few drivers that don't return 0 in .remove()) later.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--subqk3tp4gcmon6z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQHeGsACgkQwfwUeK3K
7AmJQAf+OLFnhHHVOJXrgsKSMBVT9Qycgk1Nx3JjIocPvU73GYAc8BXwKRUCjb2G
yTOGAdCjHSEwQuDZxv2NhBd/vpxLkpD7iy/doYJxHT2UMPWV54rl6CFYJEHlJPqW
Z/Ml4CO3hzmB4BXtCN8RnFyPLmswQObzaXX8HL2DGHB1XE8S1ih7F9Kal3TQISuT
hZmmMMLaoUtmq5BdGPNybIlL7hGGrMoH0ej+lkPelgMI+QnFAQ6ge26Uc1x9lkDb
M9w96TPGO6fCBhTV7g21HUUO1P1MsEqJqTPxwUxg+iatcXPmt/w55d07QZQbST7b
W1YrIAGbAt6hkfVtrrUIlqw3J57gTA==
=WgaT
-----END PGP SIGNATURE-----

--subqk3tp4gcmon6z--
