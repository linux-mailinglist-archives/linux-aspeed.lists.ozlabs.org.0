Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 886214CB20B
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 23:13:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K87ff4Zdpz3byZ
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 09:13:14 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ucw.cz
 (client-ip=46.255.230.98; helo=jabberwock.ucw.cz; envelope-from=pavel@ucw.cz;
 receiver=<UNKNOWN>)
X-Greylist: delayed 333 seconds by postgrey-1.36 at boromir;
 Wed, 02 Mar 2022 20:00:12 AEDT
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7p3c69LSz3bbn
 for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Mar 2022 20:00:12 +1100 (AEDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 91B021C0B81; Wed,  2 Mar 2022 09:54:32 +0100 (CET)
Date: Wed, 2 Mar 2022 09:54:32 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 0/2] leds: pca955x: Expose GPIOs for all pins
Message-ID: <20220302085432.GA11054@duo.ucw.cz>
References: <20210921043936.468001-1-andrew@aj.id.au>
 <d2b85ad7-aef7-6088-03f5-cbd6e0bcab5d@kaod.org>
 <CACPK8Xdvns7PK9t1ZutAbkJqhb5eRcoWCDySQGsfbtLv+XMvqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
In-Reply-To: <CACPK8Xdvns7PK9t1ZutAbkJqhb5eRcoWCDySQGsfbtLv+XMvqQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 03 Mar 2022 09:11:13 +1100
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, linux-leds@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > Without these patches the driver limits the number of pins exposed on
> > > the gpiochip to the number of pins specified as GPIO in the devicetre=
e,
> > > but doesn't map between the GPIO and pin number spaces. The result is
> > > that specifying offset or interleaved GPIOs in the devicetree gives
> > > unexpected behaviour in userspace.
> > >
> > > By always exposing all pins as GPIOs the patches resolve the lack of
> > > mapping between GPIO offsets and pins on the package in the driver by
> > > ensuring we always have a 1-to-1 mapping.
> > >
> > > The issue is primarily addressed by patch 1/2. Patch 2/2 makes it
> > > possible to not expose any pins as LEDs (and therefore make them all
> > > accessible as GPIOs). This has a follow-on effect of allowing the dri=
ver
> > > to bind to a device instantiated at runtime without requiring a
> > > description in the devicetree.
> > >
> > > I've tested the series under qemu to inspect the various interactions
> > > between LEDs vs GPIOs as well as conflicting GPIO requests.
>=20
> > > Please review!
> >
> > This is simpler than the 'ngpio' business we had before.
> >
> > Reviewed-by: C=E9dric Le Goater <clg@kaod.org>
>=20
> I saw that you recently merged some LED patches. I was wondering if
> you could consider this series for v5.18. It still applies cleanly,
> and we've been running it for a while now, so it's very well tested.

Thanks, applied. I must say this is really ninja-mutant driver, but I
see no better way.

+++ b/drivers/leds/leds-pca955x.c
@@ -429,7 +429,7 @@ pca955x_get_pdata(struct i2c_client *client, struct pca=
955x_chipdef *chip)
        int count;

This really should be unsigned. Care to fix/submit a patch?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYh8wyAAKCRAw5/Bqldv6
8oNLAJ96DjXmoElXBR+MSiaDzZLxaLlC0QCdGgbx+NMDlutN+emWDQPClInhLhc=
=IHSy
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
