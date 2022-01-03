Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A09E5488E68
	for <lists+linux-aspeed@lfdr.de>; Mon, 10 Jan 2022 02:55:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXH3B3xQNz30LD
	for <lists+linux-aspeed@lfdr.de>; Mon, 10 Jan 2022 12:55:34 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 357 seconds by postgrey-1.36 at boromir;
 Tue, 04 Jan 2022 03:23:33 AEDT
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JSLdx6pzJz2yb6
 for <linux-aspeed@lists.ozlabs.org>; Tue,  4 Jan 2022 03:23:32 +1100 (AEDT)
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 32713CF215
 for <linux-aspeed@lists.ozlabs.org>; Mon,  3 Jan 2022 16:17:57 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 49201200006;
 Mon,  3 Jan 2022 16:17:23 +0000 (UTC)
Date: Mon, 3 Jan 2022 17:17:21 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH] mtd: aspeed-smc: improve probe resilience
Message-ID: <20220103171721.46c8e697@xps13>
In-Reply-To: <20211231102623.izaqlzjvracbbgmp@ti.com>
References: <20211229143334.297305-1-patrick@stwcx.xyz>
 <20211229173411.l2bipmi4x3arqjoo@ti.com>
 <Yc3Qav+ULNdF5zRT@heinlein>
 <20211231102623.izaqlzjvracbbgmp@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 10 Jan 2022 12:51:28 +1100
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-aspeed@lists.ozlabs.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Potin Lai <potin.lai@quantatw.com>,
 linux-kernel@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

p.yadav@ti.com wrote on Fri, 31 Dec 2021 15:56:25 +0530:

> Hi Patrick,
>=20
> On 30/12/21 09:29AM, Patrick Williams wrote:
> > On Wed, Dec 29, 2021 at 11:04:13PM +0530, Pratyush Yadav wrote: =20
> > > Hi,
> > >=20
> > > On 29/12/21 08:33AM, Patrick Williams wrote: =20
> >   =20
> > > The patch itself looks fine to me but we no longer want to maintain=20
> > > drivers under drivers/mtd/spi-nor/controllers/. They should be moved =
to=20
> > > implement the SPI MEM API (under drivers/spi/). =20
> >=20
> > Is the linux-aspeed community aware of this?  Are you saying you don't =
want to
> > take fixes for their driver into the MTD tree?  Can it be pulled into t=
he Aspeed
> > tree? =20
>=20
> I am fine with taking in bug fixes but no longer want to take in any new=
=20
> features. My main intention was to nudge you to convert it to SPI MEM=20
> regardless of whether this is a bug fix or a new feature, because=20
> eventually we want to get rid of drivers/mtd/spi-nor/controllers/ and=20
> the API that comes along with it.

I totally agree with Pratyush here, we no longer want to support the
spi-nor controller API so if, as you say, there are boards failing
in the field, it means there are still users and these users must be
warned that at some point we might discontinue the support of these
drivers if it becomes too painful.

> As for your patch, I certainly don't want it to go via the aspeed tree.

Definitely, no.

> It should go via the MTD tree or not at all. I am not quite sure if this=
=20
> counts as a bug fix or a new feature though.
>=20
> >  =20
> > > Could you please volunteer to do the conversion for this driver? =20
> >=20
> > I'm not personally going to be able to get to it for at least the next =
3 months.
> >=20
> > It looks like we don't have a dedicated maintainer for this driver othe=
r than
> > Joel by nature of him being listed as the maintainer of "ARM/ASPEED MAC=
HINE
> > SUPPORT".  I'm not sure if Aspeed themselves are planning on doing the =
necessary
> > refactoring here.
> >=20
> >=20
> > Joel, are you aware of this driver using a deprecated implementation?  =
Were
> > there anyone planning to do the reworks that you are aware of?  I'd lik=
e to get
> > this fix at least into the OpenBMC kernel tree because I'm seeing this =
fail in
> > the real world. =20
>=20

Thanks,
Miqu=C3=A8l
