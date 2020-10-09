Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A162884ED
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Oct 2020 10:09:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C712134CpzDqcj
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Oct 2020 19:09:29 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=tzimmermann@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C70rd5tcrzDqMM
 for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Oct 2020 19:01:14 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 94CB6AC7D;
 Fri,  9 Oct 2020 08:01:09 +0000 (UTC)
Subject: Re: [PATCH 04/21] drm/aspeed: Set driver CMA functions with
 DRM_GEM_CMA_DRIVER_OPS
To: Joel Stanley <joel@jms.id.au>
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-5-tzimmermann@suse.de>
 <CACPK8XcGOAjocCMp9ubgQpfiBaqSj61i_frSU7ZdiKO_uSt-hQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <3df12a74-d8f3-d607-78ff-5a0f21e86cb9@suse.de>
Date: Fri, 9 Oct 2020 10:01:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcGOAjocCMp9ubgQpfiBaqSj61i_frSU7ZdiKO_uSt-hQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="kEU4Rxxajn4ZvbdCL0rTaKlQlc7wSHFrL"
X-Mailman-Approved-At: Fri, 09 Oct 2020 19:09:19 +1100
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, narmstrong@baylibre.com,
 David Airlie <airlied@linux.ie>, Linus Walleij <linus.walleij@linaro.org>,
 liviu.dudau@arm.com, stefan@agner.ch, philippe.cornu@st.com,
 paul@crapouillou.net, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 benjamin.gaignard@linaro.org, mihail.atanassov@arm.com,
 Sam Ravnborg <sam@ravnborg.org>, alexandre.torgue@st.com,
 Marek Vasut <marex@denx.de>, Fabio Estevam <festevam@gmail.com>,
 abrodkin@synopsys.com, Ludovic Desroches <ludovic.desroches@microchip.com>,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com,
 james.qian.wang@arm.com, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, puck.chen@hisilicon.com,
 Sascha Hauer <s.hauer@pengutronix.de>, alison.wang@nxp.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, mripard@kernel.org,
 john.stultz@linaro.org, jsarha@ti.com, Chen-Yu Tsai <wens@csie.org>,
 vincent.abriou@st.com, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Boris Brezillon <bbrezillon@kernel.org>, dri-devel@lists.freedesktop.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, yannick.fertre@st.com,
 kieran.bingham+renesas@ideasonboard.com, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, zourongrong@gmail.com,
 Shawn Guo <shawnguo@kernel.org>, brian.starkey@arm.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kEU4Rxxajn4ZvbdCL0rTaKlQlc7wSHFrL
Content-Type: multipart/mixed; boundary="CDUXDnhrvNpujlj9uJXMumh8LxM8mJo5z";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Joel Stanley <joel@jms.id.au>
Cc: abrodkin@synopsys.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, james.qian.wang@arm.com,
 liviu.dudau@arm.com, mihail.atanassov@arm.com, brian.starkey@arm.com,
 Andrew Jeffery <andrew@aj.id.au>, Sam Ravnborg <sam@ravnborg.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, mripard@kernel.org,
 stefan@agner.ch, alison.wang@nxp.com, xinliang.liu@linaro.org,
 zourongrong@gmail.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 paul@crapouillou.net, Linus Walleij <linus.walleij@linaro.org>,
 narmstrong@baylibre.com, Kevin Hilman <khilman@baylibre.com>,
 Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 kieran.bingham+renesas@ideasonboard.com, benjamin.gaignard@linaro.org,
 vincent.abriou@st.com, yannick.fertre@st.com, philippe.cornu@st.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, alexandre.torgue@st.com,
 Chen-Yu Tsai <wens@csie.org>, jsarha@ti.com, tomi.valkeinen@ti.com,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, linux-aspeed
 <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Message-ID: <3df12a74-d8f3-d607-78ff-5a0f21e86cb9@suse.de>
Subject: Re: [PATCH 04/21] drm/aspeed: Set driver CMA functions with
 DRM_GEM_CMA_DRIVER_OPS
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-5-tzimmermann@suse.de>
 <CACPK8XcGOAjocCMp9ubgQpfiBaqSj61i_frSU7ZdiKO_uSt-hQ@mail.gmail.com>
In-Reply-To: <CACPK8XcGOAjocCMp9ubgQpfiBaqSj61i_frSU7ZdiKO_uSt-hQ@mail.gmail.com>

--CDUXDnhrvNpujlj9uJXMumh8LxM8mJo5z
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 09.10.20 um 09:54 schrieb Joel Stanley:
> On Fri, 22 May 2020 at 13:52, Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
>>
>> DRM_GEM_CMA_DRIVER_OPS sets the functions in struct drm_driver
>> to their defaults. No functional changes are made.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> I just found this in my inbox. I assume it has not been applied as you
> were after a review.

The patchset as a whole got an A-b and was merged a while ago.

>=20
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Nevertheless thanks for taking a look at the patch.

Best regards
Thomas

>=20
> I will apply it to drm-misc-next.
>=20
> Cheers,
>=20
> Joel
>=20
>> ---
>>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 7 +------
>>  1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm=
/aspeed/aspeed_gfx_drv.c
>> index 6b27242b9ee3c..1167ff78e24a3 100644
>> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
>> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
>> @@ -188,12 +188,7 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
>>
>>  static struct drm_driver aspeed_gfx_driver =3D {
>>         .driver_features        =3D DRIVER_GEM | DRIVER_MODESET | DRIV=
ER_ATOMIC,
>> -       .gem_create_object      =3D drm_cma_gem_create_object_default_=
funcs,
>> -       .dumb_create            =3D drm_gem_cma_dumb_create,
>> -       .prime_handle_to_fd     =3D drm_gem_prime_handle_to_fd,
>> -       .prime_fd_to_handle     =3D drm_gem_prime_fd_to_handle,
>> -       .gem_prime_import_sg_table =3D drm_gem_cma_prime_import_sg_tab=
le,
>> -       .gem_prime_mmap         =3D drm_gem_prime_mmap,
>> +       DRM_GEM_CMA_DRIVER_OPS,
>>         .fops =3D &fops,
>>         .name =3D "aspeed-gfx-drm",
>>         .desc =3D "ASPEED GFX DRM",
>> --
>> 2.26.2
>>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--CDUXDnhrvNpujlj9uJXMumh8LxM8mJo5z--

--kEU4Rxxajn4ZvbdCL0rTaKlQlc7wSHFrL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl+AGMAUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPV+gf9FkOWZ4AJ4Ex25mOfleuQ49aLGMOY
bj6WHni0jINbT0azrK1LFXLA47JBitwcvYGleGaHIb09+Kk4PsiKBeMsCbaD+GRy
jP9AU6oKYsrw2BTC9z70XowgVQnZaiV5QD7cD5n+luZwlYPA/n6hp3FPXRb7uxER
Tiht1E7F/YV6TI0xA7OZwStI7ukX5/EJ1DNNFZx9j1aEYsvNtMBM41YiHUbONZqi
HKOToBxBlG8l3VaRwYX4QvXBzI7hdPxE1Z9OpkYIDChJCslOm/gh5EIaoLzN0iTh
0Q8rT/VLxbnbUTDGrYVdDfzav2fjWo/Cm7vE5PLbCPOYrHtMunMH53HzAA==
=TVfp
-----END PGP SIGNATURE-----

--kEU4Rxxajn4ZvbdCL0rTaKlQlc7wSHFrL--
