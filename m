Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 674B36EC448
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Apr 2023 06:12:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4Wtc2Zlnz3cBP
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Apr 2023 14:12:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0Jkd3mPkz3cFw
	for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Apr 2023 17:35:52 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1poJKU-0007L0-4Y; Mon, 17 Apr 2023 09:31:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1poJK6-00Bp12-OV; Mon, 17 Apr 2023 09:30:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1poJK5-00DpzA-RD; Mon, 17 Apr 2023 09:30:49 +0200
Date: Mon, 17 Apr 2023 09:30:49 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 000/117] media: Convert to platform remove callback
 returning void
Message-ID: <20230417073049.2b5b35hpjrjcrlge@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230417060203.le3izz56wt73si6k@pengutronix.de>
 <20230417061928.GD28551@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="enjtn2rx24tdhzqa"
Content-Disposition: inline
In-Reply-To: <20230417061928.GD28551@pendragon.ideasonboard.com>
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
Cc: Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil@xs4all.nl>, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>, Sean Young <sean@mess.org>, Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, Michal Simek <michal.simek@xilinx.com>, Antti Palosaari <crope@iki.fi>, NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev, ye xingchen <ye.xingchen@zte.com.cn>, Sascha Hauer <s.hauer@pengutronix.de>, =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>, Eugen Hristev <eugen.hristev@collabora.com>, Shuah Khan <skhan@linuxfoundation.org>, Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, Hyun Kwon <hyun.kwon@xilinx.com>, Michael Tretter <m.tretter@pengutronix.de>, Benoit Parrot <bparrot@ti.com>, Moudy Ho <moudy.ho@mediatek.com>, kernel@pengutronix.de, Hans Verkuil <hverkuil-cis
 co@xs4all.nl>, Claudiu Beznea <claudiu.beznea@microchip.com>, Ming Qian <ming.qian@nxp.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-aspeed@lists.ozlabs.org, Yunfei Dong <yunfei.dong@mediatek.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Fabien Dessenne <fabien.dessenne@foss.st.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Alain Volmat <alain.volmat@foss.st.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Colin Ian King <colin.i.king@gmail.com>, linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>, Rory Liu <hellojacky0226@hotmail.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Fabri
 zio Castro <fabrizio.castro.jz@renesas.com>, Maxime Ripard <mripard@kernel.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Zhou Peng <eagle.zhou@nxp.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Carpenter <error27@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, Xavier Roumegue <xavier.roumegue@oss.nxp.com>, Ettore Chimenti <ek5.chimenti@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>, Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Jacob Chen
  <jacob-chen@iotwrt.com>, Yang Yingliang <yangyingliang@huawei.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Bin Liu <bin.liu@mediatek.com>, Nathan Chancellor <nathan@kernel.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>, "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, Qiheng Lin <linqiheng@huawei.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Yang Li <yang.lee@linux.alibaba.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Shawn Guo <shawnguo@kernel.org>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Daniel Almeida <daniel.almeida@collabora.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Todor Tomov <todor.too@gmail.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, Ajye Huang <ajye_huang@compal.corp-partner.google.com>, Scott Chao <scott_chao@wistron.corp-partner.google.com>, linux-renes
 as-soc@vger.kernel.org, Hugues Fruchet <hugues.fruchet@foss.st.com>, openbmc@lists.ozlabs.org, Andy Gross <agross@kernel.org>, Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Eduardo Valentin <edubezval@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, linux-mediatek@lists.infradead.org, Yong Deng <yong.deng@magewell.com>, linux-tegra@vger.kernel.org, Tiffany Lin <tiffany.lin@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <andersson@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Houlong Wei <houlong.wei@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--enjtn2rx24tdhzqa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Laurent,

On Mon, Apr 17, 2023 at 09:19:28AM +0300, Laurent Pinchart wrote:
> On Mon, Apr 17, 2023 at 08:02:03AM +0200, Uwe Kleine-K=F6nig wrote:
> > On Sun, Mar 26, 2023 at 04:30:25PM +0200, Uwe Kleine-K=F6nig wrote:
> > > Hello,
> > >=20
> > > this series adapts the platform drivers below drivers/pci to use the
> >=20
> > copy&paste failure here: s/pci/media/ of course.
> >=20
> > > .remove_new() callback. Compared to the traditional .remove() callback
> > > .remove_new() returns no value. This is a good thing because the driv=
er core
> > > doesn't (and cannot) cope for errors during remove. The only effect o=
f a
> > > non-zero return value in .remove() is that the driver core emits a wa=
rning. The
> > > device is removed anyhow and an early return from .remove() usually y=
ields a
> > > resource leak.
> > >=20
> > > By changing the remove callback to return void driver authors cannot
> > > reasonably assume any more that there is some kind of cleanup later.
> > >=20
> > > Only three drivers needed some preparation first to make sure they
> > > return 0 unconditionally in their remove callback. Then all drivers
> > > could be trivially converted without side effects to .remove_new().
> > >=20
> > > The changes to the individual drivers are all orthogonal. If I need to
> > > resend some patches because of some review feedback, I'd like to only
> > > send the patches that actually needed changes, so please pick up the
> > > remaining patches that don't need changing to reduce the amount of ma=
il.
> >=20
> > I didn't hear anything back about application of this series. Is there a
> > blocker somewhere?
>=20
> I think the series got applied to the master branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git.
> It should thus appear in v6.4.

I guess that linux-stable.git is a copy&paste failure (and it's not
there). I don't see the series in the master branch of
git://linuxtv.org/media_tree.git either.

=2E. a bit later ...

ah, it's in git://linuxtv.org/mchehab/media-next.git

I guess I was just to quick and probably the series will be included in
today's next.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--enjtn2rx24tdhzqa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ89agACgkQj4D7WH0S
/k4s4ggArN93FA4J2SsWoxIGdtsLlazayNtSo5PW6O/QoaJlVadcVzXLyWFbOYBA
HognJPhOuPdPgaG4joVLMnL4IurY2Xd7+V7furLfSXnvFTqR9fyRieSzpj2zHHa8
uvvsD23g59Zmp7adY7VSmMpjYFyJsftQw/M7wPGXRdBhXR3IFXLhcUj9m2zzFYA5
/iO9j+CBw4KVF6pwz/qeOaZzA3JzREoHi8DMAn/CsKVmuykddnS2gaXdV/fId10f
PfyO+KMvCVH3+F1m60IRVQtpj1/Oss3/xSLE3VZZ7cGB1CPCFtAaSMUIUUDUWuMR
pIARu6BSUoL5anKyR34AryZO1vG9lA==
=f/6G
-----END PGP SIGNATURE-----

--enjtn2rx24tdhzqa--
