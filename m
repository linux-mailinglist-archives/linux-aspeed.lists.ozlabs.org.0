Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA45C6EC44A
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Apr 2023 06:12:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4Wtl4QPmz3cjK
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Apr 2023 14:12:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0Ldh45sDz3c9V
	for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Apr 2023 19:01:43 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1poKd9-0004W9-9f; Mon, 17 Apr 2023 10:54:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1poKce-00Bpk9-B4; Mon, 17 Apr 2023 10:54:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1poKcd-00DrOr-K2; Mon, 17 Apr 2023 10:54:03 +0200
Date: Mon, 17 Apr 2023 10:54:03 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 000/117] media: Convert to platform remove callback
 returning void
Message-ID: <20230417085403.sbk3k4qlpljbfqld@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230417060203.le3izz56wt73si6k@pengutronix.de>
 <20230417061928.GD28551@pendragon.ideasonboard.com>
 <20230417073049.2b5b35hpjrjcrlge@pengutronix.de>
 <OS0PR01MB59221153A63F64BBAD3ED20D869C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fbine4cndaaohubi"
Content-Disposition: inline
In-Reply-To: <OS0PR01MB59221153A63F64BBAD3ED20D869C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-aspeed@lists.ozlabs.org
X-Mailman-Approved-At: Mon, 24 Apr 2023 14:10:49 +1000
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
Cc: Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil@xs4all.nl>, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, Jerome Brunet <jbrunet@baylibre.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Robert Foss <rfoss@kernel.org>, Dafna Hirschfeld <dafna@fastmail.com>, Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, Michal Simek <michal.simek@xilinx.com>, Antti Palosaari <crope@iki.fi>, NXP Linux Team <linux-imx@nxp.com>, "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>, ye xingchen <ye.xingchen@zte.com.cn>, Sascha Hauer <s.hauer@pengutronix.de>, =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>, Eugen Hristev <eugen.hristev@collabora.com>, Shuah Khan <skhan@linuxfoundation.org>, Hyun Kwon <hyun.kwon@xilinx.com>, Michael Tretter <m.tretter@pengutronix.de>, Moudy Ho <moudy.ho@mediatek.com>, "ker
 nel@pengutronix.de" <kernel@pengutronix.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Claudiu Beznea <claudiu.beznea@microchip.com>, Ming Qian <ming.qian@nxp.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Yunfei Dong <yunfei.dong@mediatek.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Guenter Roeck <groeck@chromium.org>, "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>, Jonathan Hunter <jonathanh@nvidia.com>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, Fabien Dessenne <fabien.dessenne@foss.st.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Alain Volmat <alain.volmat@foss.st.com>, Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, Colin Ian King <colin.i.king@gmail.com>, "linux-media@vger.kernel.org" <linux-media@vger.
 kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, Rory Liu <hellojacky0226@hotmail.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>, Maxime Ripard <mripard@kernel.org>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Neil Armstrong <neil.armstrong@linaro.org>, Zhou Peng <eagle.zhou@nxp.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Carpenter <error27@gmail.com>, Sean Young <sean@mess.org>, Xavier Roumegue <xavier.roumegue@oss.nxp.com>, Ettore Chimenti <ek5.chimenti@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, "linux-tegra@vger.kernel
 .org" <linux-tegra@vger.kernel.org>, Eduardo Valentin <edubezval@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>, Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Jacob Chen <jacob-chen@iotwrt.com>, Yang Yingliang <yangyingliang@huawei.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Bin Liu <bin.liu@mediatek.com>, Nathan Chancellor <nathan@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>, "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, Qiheng Lin <linqiheng@huawei.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
 , Yang Li <yang.lee@linux.alibaba.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Shawn Guo <shawnguo@kernel.org>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Daniel Almeida <daniel.almeida@collabora.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Todor Tomov <todor.too@gmail.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, Ajye Huang <ajye_huang@compal.corp-partner.google.com>, Scott Chao <scott_chao@wistron.corp-partner.google.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Hugues Fruchet <hugues.fruchet@foss.st.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Andy Gross <agross@kernel.org>, Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Benoit Parrot <bparrot@ti.com>, Rui Miguel Silva <rmfrfs@gmail.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Yong Deng <yong.deng@magewell.com>, Matthias Brugger <matthias.bg
 g@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <andersson@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Houlong Wei <houlong.wei@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--fbine4cndaaohubi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2023 at 07:57:57AM +0000, Biju Das wrote:
> Hi Uwe,
> > > I think the series got applied to the master branch of
> > > git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git.
> > > It should thus appear in v6.4.
> >=20
> > I guess that linux-stable.git is a copy&paste failure (and it's not the=
re).
> > I don't see the series in the master branch of
> > git://linuxtv.org/media_tree.git either.
> >=20
> > .. a bit later ...
> >=20
> > ah, it's in git://linuxtv.org/mchehab/media-next.git
> >=20
> > I guess I was just to quick and probably the series will be included in
> > today's next.
>=20
> I believe patchwork <patchwork@linuxtv.org> will send notification to
> author and along with people who applied tags for that patch.

Indeed, I got such a notification on Apr 11. But even if I had that on
my radar when asking and considered such notifications reliable in
general, I would have asked, as the patches didn't apprear in next up to
now.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--fbine4cndaaohubi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ9CSoACgkQj4D7WH0S
/k6ShQgAkiGsAbqnu5CIYl6vVltmySdbzFphOT5lae+k2iaPjP4KBQyey9E309bA
T8cWAHGmSzTAr3+xiHj0Vl3KS3KltR2ike2TLIupFKTW6gJIpAyseCA8SLtj625z
DYRY5/9pDFLtNe4MD6tpVn7ZPAzEb/DdC/F12elKbSP+3RLwwRhyo/EtmAbFc6f9
e/G2EuuAPaBs+wywWC9piaSjYWk57nSelhyJqSoWAJbpZM2hOiGsIeaiI2OI6l9X
sye5ayrw1sdGUVa70KExUaG9L0d1hFmhkfZz3m7I2ZosIc5Q3k5RCBDj41MxyvTC
7hFi24KnDnjHVL2gEWrM+oBRJZju9Q==
=h+pR
-----END PGP SIGNATURE-----

--fbine4cndaaohubi--
