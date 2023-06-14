Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A1E725100
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Jun 2023 02:01:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbSFB49J4z3cdd
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Jun 2023 10:01:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=zVwx/d3o;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mail.zeus03.de (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=zVwx/d3o;
	dkim-atps=neutral
X-Greylist: delayed 376 seconds by postgrey-1.36 at boromir; Fri, 02 Jun 2023 00:01:40 AEST
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QX7900NTdz3cTk
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Jun 2023 00:01:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=k1; bh=xqhRMpVRwKGnSR4yTg3S/+wq82xe
	UEL1Dnls53yl8Mw=; b=zVwx/d3ot8d8N9TH4vhGyszu0niC+gq3K8uG69HepK4Y
	t1CR6rvFAw11dWupGg+KHJZM9VXnrwmpTZ00C0OaIHORagTv0B9jH9XPBTNbwemP
	vFoXYAeQFLs6rY1Vz3Ww188uwFKNR5sYWZndJ8YSYXkXS19jf7QjsglAtmCGf5U=
Received: (qmail 1670469 invoked from network); 1 Jun 2023 15:54:54 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Jun 2023 15:54:54 +0200
X-UD-Smtp-Session: l3s3148p1@qP6/xxH9ruwujnsI
Date: Thu, 1 Jun 2023 15:54:50 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 00/89] i2c: Convert to platform remove callback returning
 void
Message-ID: <ZHijKtBbH2sCSuT4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Thor Thayer <thor.thayer@linux.intel.com>,
	Elie Morisse <syniurge@gmail.com>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Allison Randal <allison@lohutok.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jochen Friedrich <jochen@scram.de>,
	Benson Leung <bleung@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Jean-Marie Verdun <verdun@hpe.com>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Oleksij Rempel <linux@rempel-privat.de>,
	Jean Delvare <jdelvare@suse.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Chris Pringle <chris.pringle@phabrix.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Michael Shych <michaelsh@nvidia.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>,
	Robert Richter <rric@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Vignesh R <vigneshr@ti.com>, Michael Ellerman <mpe@ellerman.id.au>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Sebastian Reichel <sre@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Chris Brandt <chris.brandt@renesas.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jim Cromie <jim.cromie@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wei Chen <harperchen1110@gmail.com>,
	George Cherian <gcherian@marvell.com>,
	Peter Rosin <peda@axentia.se>,
	Peter Korsgaard <peter.korsgaard@barco.com>,
	linux-aspeed@lists.ozlabs.org,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Jan Dabros <jsd@semihalf.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Guenter Roeck <groeck@chromium.org>,
	linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Jerome Brunet <jbrunet@baylibre.com>,
	chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	Benjamin Fair <benjaminfair@google.com>,
	linux-rockchip@lists.infradead.org, openbmc@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nancy Yuen <yuenn@google.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-sunxi@lists.linux.dev, Joel Stanley <joel@jms.id.au>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-msm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Patrick Venture <venture@google.com>, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Dmitry Osipenko <digetx@gmail.com>, asahi@lists.linux.dev,
	kernel@pengutronix.de, linuxppc-dev@lists.ozlabs.org,
	linux-i2c@vger.kernel.org
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230601073322.ww25ajaurktqsryr@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gpYQGInw32d3wriv"
Content-Disposition: inline
In-Reply-To: <20230601073322.ww25ajaurktqsryr@pengutronix.de>
X-Mailman-Approved-At: Wed, 07 Jun 2023 10:01:37 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>, Tomer Maimon <tmaimon77@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, Alim Akhtar <alim.akhtar@samsung.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>, Samuel Holland <samuel@sholland.org>, Michael Ellerman <mpe@ellerman.id.au>, Khalil Blaiech <kblaiech@nvidia.com>, Jochen Friedrich <jochen@scram.de>, Christophe Leroy <christophe.leroy@csgroup.eu>, NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev, Jean Delvare <jdelvare@suse.com>, linux-tegra@vger.kernel.org, ye xingchen <ye.xingchen@zte.com.cn>, Sascha Hauer <s.hauer@pengutronix.de>, Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, Allison Randal <allison@lohuto
 k.net>, Scott Branden <sbranden@broadcom.com>, Daire McNamara <daire.mcnamara@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Masami Hiramatsu <mhiramat@kernel.org>, kernel@pengutronix.de, Claudiu Beznea <claudiu.beznea@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Thierry Reding <thierry.reding@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-i2c@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Stefan Wahren <stefan.wahren@i2se.com>, chrome-platform@lists.linux.dev, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Peter Korsgaard <peter.korsgaard@barco.com>, Alain Volmat <alain.volmat@foss.st.com>, Jerome Brunet <jbrunet@baylibre.com>, Chris Pringle <chris.pringle@phabrix.com>, Andi Shyti <andi.shyti@kernel.org>, M
 artin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>, linux-rpi-kernel@lists.infradead.org, Nick Hawkins <nick.hawkins@hpe.com>, linux-amlogic@lists.infradead.org, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, Dong Aisheng <aisheng.dong@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>, Jim Cromie <jim.cromie@gmail.com>, Hector Martin <marcan@marcan.st>, linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Thor Thayer <thor.thayer@linux.intel.com>, Vadim Pasternak <vadimp@nvidia.com>, Jean-Marie Verdun <verdun@hpe.com>, Brendan Higgins <brendan.higgins@linux.dev>, Elie Morisse <syniurge@gmail.com>, Stefan Roese <sr@denx.de>, Krzysztof Adamski <krzysztof.adamski@nokia.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, Peter Korsgaard <peter@
 korsgaard.com>, Florian Fainelli <f.fainelli@gmail.com>, linux-aspeed@lists.ozlabs.org, Mika Westerberg <mika.westerberg@linux.intel.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Wei Chen <harperchen1110@gmail.com>, Nancy Yuen <yuenn@google.com>, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Robert Richter <rric@kernel.org>, Asmaa Mnebhi <asmaa@nvidia.com>, Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, Benson Leung <bleung@chromium.org>, Qii Wang <qii.wang@mediatek.com>, Avi Fishman <avifishman70@gmail.com>, linux-mips@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, Oleksij Rempel <linux@rempel-privat.de>, Julia Lawall <Julia.Lawall@inria.fr>, Laxman Dewangan <ldewangan@nvidia.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, asahi@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>, Peter Rosin <p
 eda@axentia.se>, Baruch Siach <baruch@tkos.co.il>, Vignesh R <vigneshr@ti.com>, Tony Lindgren <tony@atomide.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Chris Brandt <chris.brandt@renesas.com>, linux-mediatek@lists.infradead.org, Jan Dabros <jsd@semihalf.com>, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Kamal Dasu <kdasu.kdev@gmail.com>, openbmc@lists.ozlabs.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andy Gross <agross@kernel.org>, Sven Peter <sven@svenpeter.dev>, Hans de Goede <hdegoede@redhat.com>, George Cherian <gcherian@marvell.com>, Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Loic Poulain <loic.poulain@linaro.org>, Patrick Venture <venture@google.com>, 
 Bjorn Andersson <andersson@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Michael Shych <michaelsh@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Gregory CLEMENT <gregory.clement@bootlin.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--gpYQGInw32d3wriv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I wonder how this series will go in. My expectation was that Wolfram
> picks up the whole series via his tree?!

Will do. I am currently super-busy, though.



--gpYQGInw32d3wriv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmR4oyYACgkQFA3kzBSg
KbYkxRAAgf5VeQe2YA/rv9xTTFOLsiZ2yYaKqe5cSG8ORritsNgMayx5mytBy0Eb
vLblB6pyYYUuu3M8/UNmMh+ud1b9uX4klUjd/spaehbsehFeEKn6qXIp8cwcSIYf
Urcj54jsziLug9CQlidx+Zv9cK5qBCkmgMqzf+Nsc/qUEnZFhpblZkoqV1cEMbkQ
ZrFXWEauQuCK9R9A4x6GrmfmdMn3c792FdLYJIL6bVJ3YJbN27vqzC8e+5NJqhs4
KxCJ0LH0/M3rfhuDi//PfKk116qlUNYOkukv86eih76CBDm8sef221IfgFmLQx0h
Hhvgc9g5MZNb9gSZP3UBsdXIiQgOEMztVEnWROaMIPLhab4G/rJhF0YMEAq132/Q
4F6E5uIBY055Hdc4rrfounk8Ia3VRfuqG9B7bmaujkDmOBkLTB33+93c+b9xsJMh
njdGaRmhDm3FnKzUqe//7kjRC2Eh004VP4Yr4JZ4byJWDkHtLLx2foYlV/Vry+Ka
vajzcCTXVcDghWSXcd60VkXpI8cePJeHF6pnJfq6gTGFSrE3nH27ERG0zM8T7ADq
E3PRusML2KJhpLcPuqnF2ntYSo8cwt2MW5gtEtaFlizmjuIZ/sLCTrDZKRUN9XAX
k3ic9QCDUVLlKLXBftokeMi0I1NEhto6+ck+Fc8SNGnNnWxYJZ8=
=ijai
-----END PGP SIGNATURE-----

--gpYQGInw32d3wriv--
