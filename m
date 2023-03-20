Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B586C5C59
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Mar 2023 02:50:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhpFp0rb9z3bg8
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Mar 2023 12:50:38 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=mkl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgCP01m63z3cCL
	for <linux-aspeed@lists.ozlabs.org>; Mon, 20 Mar 2023 22:36:17 +1100 (AEDT)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1peDmk-0005Mb-3u; Mon, 20 Mar 2023 12:34:42 +0100
Received: from pengutronix.de (unknown [IPv6:2a00:20:c04b:45e4:1953:f0f4:6a85:b0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 05ADB19732D;
	Mon, 20 Mar 2023 09:23:50 +0000 (UTC)
Date: Mon, 20 Mar 2023 10:23:49 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: net: Drop unneeded quotes
Message-ID: <20230320092349.7eqjqiblksjpw3fb@pengutronix.de>
References: <20230317233605.3967621-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5rfbuzw7ieky3r2g"
Content-Disposition: inline
In-Reply-To: <20230317233605.3967621-1-robh@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-aspeed@lists.ozlabs.org
X-Mailman-Approved-At: Thu, 23 Mar 2023 12:49:29 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Tobias Waldekranz <tobias@waldekranz.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, UNGLinuxDriver@microchip.com, linux-stm32@st-md-mailman.stormreply.com, Florian Fainelli <f.fainelli@gmail.com>, Samuel Holland <samuel@sholland.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, Michal Simek <michal.simek@xilinx.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev, Wolfgang Grandegger <wg@grandegger.com>, N
 aga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, Daniel Machon <daniel.machon@microchip.com>, Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-can@vger.kernel.org, linux-mediatek@lists.infradead.org, Appana Durga Kedareswara rao <appana.durga.rao@xilinx.com>, Matthias Brugger <matthias.bgg@gmail.com>, Lars Povlsen <lars.povlsen@microchip.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Konrad Dybcio <konrad.dybcio@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--5rfbuzw7ieky3r2g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 17.03.2023 18:36:03, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
[...]
>  .../devicetree/bindings/net/can/xilinx,can.yaml    |  6 +++---

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for bindings/net/can

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--5rfbuzw7ieky3r2g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmQYJiIACgkQvlAcSiqK
BOhjVQf/acPAkVlZAgSx2EeDlEf8hS1lf2sRkjDcvxt3kTD2h5jAh5U3kLV5DTD4
MjEV9UTZecOll5eioSnCl1DrrqCemegxaoOeML/pQDa4hNYWmm5JHZFLOKdQbL0T
B9Jl3hxOtVzm95NTggCnKp31A7Q7ft8wfQgSN//1++W90f7Yot/HEv/oPR68ElzX
J2GyX741B6AfKBqEztJ6OYDWiB2lHw6zzIxacqqM+zn9vjVteFg2FsbKvCRAbUCV
Bxg0WyzixKLhUf2Of1QOnEW70UfVtICWJ25BjPXp9+WGomovd5nb0MbV+2lou9kk
0u595tSMCR5sWDa8jKOahMLP+4ZClA==
=xkke
-----END PGP SIGNATURE-----

--5rfbuzw7ieky3r2g--
