Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 989AE6FD2EC
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 May 2023 01:01:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGDCt2SSVz3fJP
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 May 2023 09:00:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=WY9qoPDX;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=WY9qoPDX;
	dkim-atps=neutral
X-Greylist: delayed 331 seconds by postgrey-1.36 at boromir; Wed, 10 May 2023 09:00:48 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGDCh6nPgz3c4B
	for <linux-aspeed@lists.ozlabs.org>; Wed, 10 May 2023 09:00:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1683673244; i=j.neuschaefer@gmx.net;
	bh=IjOsP3Hl5WOUcxHtKpSlXVU2zmb5sAncILY7B0EhNVs=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WY9qoPDXRS3/4RA/dwc9ozQgC9eCSg5NDDoBtH8NPP+p9ryxXTXEdL7KcHeqbdo7p
	 TaJ7fm2CueEFhysx88ppeaIqqt256AVuI3WMxK258JgJOSjvkebH58Zgome4So/PYF
	 5F52f1BoZUKZx6pJVocT+LHor4qZnl6mZPM1QKqp6XEP8WrJcvm74Te/ndWn6r4krA
	 udykVtD+1RcFQe5ckhuoYA2hMd54henQK9u99Ta9GCYrx8ZT52OPKSYEdyIhgHX+Fy
	 V+1UqwUrUcu3DyHV/XDPKMKj9tFgDi3OfDRgeInIdapH/6Q8DS0ErBAxo+LwMw6c+y
	 Ln6Di6v86IuKA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.193]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ml6m4-1qdIgl1tr2-00lTxs; Wed, 10
 May 2023 00:54:31 +0200
Date: Wed, 10 May 2023 00:54:29 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Message-ID: <ZFrPJQdwoxqFpzUO@probook>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ue5Z9u7UyMsdbJpp"
Content-Disposition: inline
In-Reply-To: <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
X-Provags-ID: V03:K1:aR+k41JkL+Jax7RkQK1pXFPVqGsXbknpTCCf601eNGl3xQsbw4B
 lW4IptIuDnFJb+jaCScKg4f1qDLjuoiDEqEJsUWT/Ek6YzDXkULOeXYq9EqgQyN8A6axbG1
 JRKm5mq+iW4e1K1v2w2BOTrGSmAwegcfBLrzES8HGqnWOqrguxalKWu6+fqbhobKFkw7JNy
 qeUuaRpvcFFSSatMddRDg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:T2FXNBbsM34=;NHM33FDE4L+RuA7+DgEsDwldtWK
 r/lVo17txIxg1C36Sgg9eNxxOCydWeNoHO0UEjS35gjFG+xBUKmr2pHHBM09QYRHSgvF9MOZR
 rnCWi0TXdTdC5D9nGWwRFlN2g6zEr7RDMIIyyjuKk/zdmIQDZRjmLybRAc7ubnehsmeHyrRGj
 Y9KRnqXZzzsEzf5502grAv8BKkIp4yCdfeTsG1eX4JLOBPxAF6ReBOsSQQunHfd6rzT6EWrHO
 5eMuy7lCs94H9vN2Gvz8Il4tB+q0vfYdMmpr4hrBAAFk4bPM+5hg72it/Ih5Sk5UugPszRWQy
 aWAqpPVm/3ebhuZmkL5XTjOMbQsaRHei+2NnUopEAdViPEyKelI0rxyMdw8h1Uu+g//Cqg5cH
 Did36Ms6tmLLkd4vIOzlePbNWBEW0IfiCo/1ZSm8A1Gz2RrnPsT67B4Ra4B7U1zZOCfKOCexk
 6eReb434iTNY2B8z7hMej5Y2siAFsCOKFpNCVbjpw0beQHqhoh+SOpv3UbKAN/VHYHZjykbPW
 cqY6RWD58IAbhPlkb/2P77e64zLKAyMUZdD/vv5ffoYFBkSQSdXz/4IwxMp6W89DiXImc/OFv
 t4zCjoc4xuz4slhYTl3PAgMInsmeU+JdBCPJnkN0xeCBSipS99kqKcdEtM8qx9tHFWjEGzDLY
 cXAuDz3p0yiK3zknMJlo9IoS7leqA3vwGXlXrfv2jDMth03cfmm1W/kQcdGR5Gy09KSDtwR4P
 ZHrZnNjHrI83G/xnlQJPMOHgOHbggieVA/xM5kttUyNKNduJ6OJ6hd8K1GFIZFZoPIdWl0aVZ
 DoJmXaPaYmLkM0qWpxXI/i1xm8wqxmsC0r3H6YGOQkt416DPOAsHQy5YgElh01wIYslP+5wdb
 qCpl5p97MD7x/eDxH82XL4jY/MhyjKKaLWtcQWRQpdpe8SXl8tT+ryICROj4mDTF5P5KqhGaw
 0xEkoejg6/g//atRzrRYaTdhtkU=
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org, linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, "linux-oxnas@groups.io" <linux-oxnas@groups.io
 >
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--ue5Z9u7UyMsdbJpp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2023 at 02:40:19PM -0500, Rob Herring wrote:
[...]
> I've dusted off my script and made a branch[1] with the result.
> There's just a couple of fixes needed after the script is run (see the
> top commit). The cross arch includes are all fixed up by the script.
> dtbs_install maintains a flat install. I compared the number of .dtbs
> before and after to check the script.
>=20
> I think the only issue remaining is finalizing the mapping of
> platforms to subdirs. What I have currently is a mixture of SoC
> families and vendors. The most notable are all the Freescale/NXP
> platforms, pxa, socfpga, and stm32. It's not consistent with arm64
> either. Once that's finalized, I still need to go update MAINTAINERS.
>=20
> Here's the current mapping:
>=20
> vendor_map =3D {
[...]
>     'aspeed' : 'aspeed',
>     'ast2' : 'aspeed',
>     'facebook' : 'aspeed',
>     'ibm' : 'aspeed',

>     'openbmc' : 'aspeed',

The openbmc flash layouts are currently only used by aspeed devicetrees,
but they don't really depend on any aspeed details. It would be possible
to reuse them in Nuvoton BMC devicetrees in the future, for example.

In that sense, I think putting them in a separate "openbmc" directory
would be slightly better.


Jonathan



[...]
>     'nuvo' : 'nuvoton',
[...]
> }
>=20
> Rob
>=20
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git arm-dts-=
move-v2

--ue5Z9u7UyMsdbJpp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmRazv0ACgkQCDBEmo7z
X9tB/A//Y5MU9b+r/mxCUuxjsa0CB4Ewu8xmc+YTd1pdMEIrJYfgdpXFskBmzFsg
QFYR1gBnq7P4mhusW4RaYWxpzD3M45B2vIuhgL6t8lqIWae0UuNbPEO4rbCIbvGZ
PCx1dTAGZ2vg+mxRK0OYouuCE9EvgrC9PGmOcgDkqCLngGsr11gXz0GMNebggmie
TX8iauQHnzfGaSQWtwIdQRu1gj2d/VO5NSn4CrgvMIuLCSwhTwY+e9H9/+CcrqHK
wNiMG0W8yY5CMO7ZSYf7EkEidunJ0htwqJmUoLfpqN4NZ/21yno69v+L36ZRu/lq
+KrZJeaXC3Ar39R2x75Pns5em46uwJJdI5aXumj9xPU3A3rgWCQcrECZJ7i/HEoK
hzhnsQhJNP4jAPVxdiaWJTYUXHRwafI6/GVvj1BvfgqZ9VHE28iGdDcgVvOfmkDx
eRZQxcJzFaWZeWTOeM05/dHUDUJXFrYvDsj0+FgneBU/oqEc+H4bR9AP2ttU24hU
4jBq2I2FlDyKlC0ARS22oRQlZG6KS50d1Nvx6cLr7lxeOHmcW09dPCqHijQVtX3V
f/Z7MYrDEXgTK8r1wJk6PuvVN+jFX/l/Ali5L/OJqUsZB4bgteXKEWXWMmgik1/I
d3nr3gTYEaykVkjCJORFKu4G2FHrzWgWpFYsl8Mu+safGLa+rdA=
=Jzyt
-----END PGP SIGNATURE-----

--ue5Z9u7UyMsdbJpp--
