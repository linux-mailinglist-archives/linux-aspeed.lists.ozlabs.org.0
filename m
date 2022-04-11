Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 212E44FB73A
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Apr 2022 11:20:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcNcG1BzGz2ypn
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Apr 2022 19:20:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=p.zabel@pengutronix.de;
 receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcNc84KQrz2xX6
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Apr 2022 19:20:06 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1ndqD4-0003hy-BW; Mon, 11 Apr 2022 11:19:46 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1ndqCz-002MLK-V5; Mon, 11 Apr 2022 11:19:40 +0200
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1ndqCx-00040Q-Qs; Mon, 11 Apr 2022 11:19:39 +0200
Message-ID: <8470f6029703a29bd7c384f489da0c7936c44cc7.camel@pengutronix.de>
Subject: Re: [PATCH RESEND v3 2/3] net: mdio: add reset control for Aspeed MDIO
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Andrew Jeffery <andrew@aj.id.au>, Dylan Hung
 <dylan_hung@aspeedtech.com>,  Rob Herring <robh+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, David Miller
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, netdev
 <netdev@vger.kernel.org>
Date: Mon, 11 Apr 2022 11:19:39 +0200
In-Reply-To: <667280e7-526d-4002-9dff-389f6b35ac2f@www.fastmail.com>
References: <20220407075734.19644-1-dylan_hung@aspeedtech.com>
 <20220407075734.19644-3-dylan_hung@aspeedtech.com>
 <667280e7-526d-4002-9dff-389f6b35ac2f@www.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-aspeed@lists.ozlabs.org
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
Cc: BMC-SW@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mo, 2022-04-11 at 09:50 +0930, Andrew Jeffery wrote:
>=20
> On Thu, 7 Apr 2022, at 17:27, Dylan Hung wrote:
> > Add reset assertion/deassertion for Aspeed MDIO.  There are 4 MDIO
> > controllers embedded in Aspeed AST2600 SOC and share one reset control
> > register SCU50[3].  To work with old DT blobs which don't have the rese=
t
> > property, devm_reset_control_get_optional_shared is used in this change=
.
> >=20
> > Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> > =C2=A0drivers/net/mdio/mdio-aspeed.c | 15 ++++++++++++++-
> > =C2=A01 file changed, 14 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/net/mdio/mdio-aspeed.c b/drivers/net/mdio/mdio-asp=
eed.c
> > index e2273588c75b..1afb58ccc524 100644
> > --- a/drivers/net/mdio/mdio-aspeed.c
> > +++ b/drivers/net/mdio/mdio-aspeed.c
> > @@ -3,6 +3,7 @@
> >=20
> > =C2=A0#include <linux/bitfield.h>
> > =C2=A0#include <linux/delay.h>
> > +#include <linux/reset.h>
> > =C2=A0#include <linux/iopoll.h>
> > =C2=A0#include <linux/mdio.h>
> > =C2=A0#include <linux/module.h>
> > @@ -37,6 +38,7 @@
> >=20
> > =C2=A0struct aspeed_mdio {
> > =C2=A0	void __iomem *base;
> > +	struct reset_control *reset;
> > =C2=A0};
> >=20
> > =C2=A0static int aspeed_mdio_read(struct mii_bus *bus, int addr, int re=
gnum)
> > @@ -120,6 +122,12 @@ static int aspeed_mdio_probe(struct platform_devic=
e *pdev)
> > =C2=A0	if (IS_ERR(ctx->base))
> > =C2=A0		return PTR_ERR(ctx->base);
> >=20
> > +	ctx->reset =3D devm_reset_control_get_optional_shared(&pdev->dev, NUL=
L);
> > +	if (IS_ERR(ctx->reset))
> > +		return PTR_ERR(ctx->reset);
> > +
> > +	reset_control_deassert(ctx->reset);
> > +
> > =C2=A0	bus->name =3D DRV_NAME;
> > =C2=A0	snprintf(bus->id, MII_BUS_ID_SIZE, "%s%d", pdev->name, pdev->id)=
;
> > =C2=A0	bus->parent =3D &pdev->dev;
> > @@ -129,6 +137,7 @@ static int aspeed_mdio_probe(struct platform_device=
 *pdev)
> > =C2=A0	rc =3D of_mdiobus_register(bus, pdev->dev.of_node);
> > =C2=A0	if (rc) {
> > =C2=A0		dev_err(&pdev->dev, "Cannot register MDIO bus!\n");
> > +		reset_control_assert(ctx->reset);
> > =C2=A0		return rc;
> > =C2=A0	}
> >=20
> > @@ -139,7 +148,11 @@ static int aspeed_mdio_probe(struct platform_devic=
e *pdev)
> >=20
> > =C2=A0static int aspeed_mdio_remove(struct platform_device *pdev)
> > =C2=A0{
> > -	mdiobus_unregister(platform_get_drvdata(pdev));
> > +	struct mii_bus *bus =3D (struct mii_bus *)platform_get_drvdata(pdev);
> > +	struct aspeed_mdio *ctx =3D bus->priv;
> > +
> > +	reset_control_assert(ctx->reset);
>=20
> Isn't this unnecessary because you've used the devm_ variant to acquire=
=20
> the reset?

No, this is correct. deassert/assert needs to be balanced, and the
reset_control_deassert() call in aspeed_mdio_probe() is not devres
managed.

regards
Philipp
