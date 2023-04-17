Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A6F6EC445
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Apr 2023 06:12:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4WtP3Q9Pz3f5l
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Apr 2023 14:12:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0Gl729JJz3cDt
	for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Apr 2023 16:06:08 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1poHwn-0002G3-5t; Mon, 17 Apr 2023 08:02:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1poHwE-00Bnse-I0; Mon, 17 Apr 2023 08:02:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1poHwD-00Dolu-4U; Mon, 17 Apr 2023 08:02:05 +0200
Date: Mon, 17 Apr 2023 08:02:03 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 000/117] media: Convert to platform remove callback
 returning void
Message-ID: <20230417060203.le3izz56wt73si6k@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ogmoi7vlr4vxdkq5"
Content-Disposition: inline
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
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
Cc: Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil@xs4all.nl>, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>, Dafna Hirschfeld <dafna@fastmail.com>, Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, Michal Simek <michal.simek@xilinx.com>, Antti Palosaari <crope@iki.fi>, NXP Linux Team <linux-imx@nxp.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-sunxi@lists.linux.dev, ye xingchen <ye.xingchen@zte.com.cn>, Sascha Hauer <s.hauer@pengutronix.de>, =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>, Eugen Hristev <eugen.hristev@collabora.com>, Shuah Khan <skhan@linuxfoundation.org>, Hyun Kwon <hyun.kwon@xilinx.com>, Michael Tretter <m.tretter@pengutronix.de>, Moudy Ho <moudy.ho@mediatek.com>, kernel@pengutronix.de, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Claudiu Be
 znea <claudiu.beznea@microchip.com>, Ming Qian <ming.qian@nxp.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-aspeed@lists.ozlabs.org, Yunfei Dong <yunfei.dong@mediatek.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Fabien Dessenne <fabien.dessenne@foss.st.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Alain Volmat <alain.volmat@foss.st.com>, Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, Colin Ian King <colin.i.king@gmail.com>, linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>, Rory Liu <hellojacky0226@hotmail.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Maxime Ripard <mripard@ker
 nel.org>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Zhou Peng <eagle.zhou@nxp.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-mediatek@lists.infradead.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Carpenter <error27@gmail.com>, Sean Young <sean@mess.org>, Xavier Roumegue <xavier.roumegue@oss.nxp.com>, Ettore Chimenti <ek5.chimenti@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, linux-tegra@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>, Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu 
 Tsai <wens@csie.org>, Jacob Chen <jacob-chen@iotwrt.com>, Yang Yingliang <yangyingliang@huawei.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Bin Liu <bin.liu@mediatek.com>, Nathan Chancellor <nathan@kernel.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Benson Leung <bleung@chromium.org>, "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, Qiheng Lin <linqiheng@huawei.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Yang Li <yang.lee@linux.alibaba.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Shawn Guo <shawnguo@kernel.org>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Daniel Almeida <daniel.almeida@collabora.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Todor Tomov <todor.too@gmail.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, Ajye Huang <ajye_huang@compal.corp-partner.google.com>, Scott Chao <scott_chao@wistron.corp-partner.google.com>, linux-renesas-soc@vger.
 kernel.org, Hugues Fruchet <hugues.fruchet@foss.st.com>, openbmc@lists.ozlabs.org, Andy Gross <agross@kernel.org>, Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Benoit Parrot <bparrot@ti.com>, Rui Miguel Silva <rmfrfs@gmail.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Yong Deng <yong.deng@magewell.com>, Matthias Brugger <matthias.bgg@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <andersson@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Houlong Wei <houlong.wei@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--ogmoi7vlr4vxdkq5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Mauro

On Sun, Mar 26, 2023 at 04:30:25PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> this series adapts the platform drivers below drivers/pci to use the

copy&paste failure here: s/pci/media/ of course.

> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver c=
ore
> doesn't (and cannot) cope for errors during remove. The only effect of a
> non-zero return value in .remove() is that the driver core emits a warnin=
g. The
> device is removed anyhow and an early return from .remove() usually yield=
s a
> resource leak.
>=20
> By changing the remove callback to return void driver authors cannot
> reasonably assume any more that there is some kind of cleanup later.
>=20
> Only three drivers needed some preparation first to make sure they
> return 0 unconditionally in their remove callback. Then all drivers
> could be trivially converted without side effects to .remove_new().
>=20
> The changes to the individual drivers are all orthogonal. If I need to
> resend some patches because of some review feedback, I'd like to only
> send the patches that actually needed changes, so please pick up the
> remaining patches that don't need changing to reduce the amount of mail.

I didn't hear anything back about application of this series. Is there a
blocker somewhere?

Apart from the three preparatory patches that are a precondition to the
conversion of the respective drivers, the patches are all pairwise
orthogonal. So from my POV the best would be to apply all patches that
still apply (which might be all), I will care for the fallout later
then.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ogmoi7vlr4vxdkq5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ84NoACgkQj4D7WH0S
/k65OwgAkM/14eqkcxTg0/453d2uwhPt/jiDru0C14NvpnN4AFU0sa+yzp1GfYRO
WfxjudHvw/OXq+eolRu8PrqJIpLHvQhOyjblYLXPqTB8RvdJSXI2Q1ZJjozYjCNJ
WeBerHqAXGOnxd+2kbfCs2VZWYgmJpj1VCXeRYekMB7Kv1tmfXNXetaHIH7Rypw1
+Si1nhZN4Sk68bdXU+RaQc6UP5/E0VohPVWnSB1tsTQVL4sogBkjfDl4tueHEZxj
959kirh12hfcFcqtz1mQ1u7V1dIc136PR+Kg/2b+GNaFbe/Zdsno5HbnbQl+NwL/
GWFmd+GksqXkwA3k1tkqVdOFEPO4cQ==
=K38Q
-----END PGP SIGNATURE-----

--ogmoi7vlr4vxdkq5--
