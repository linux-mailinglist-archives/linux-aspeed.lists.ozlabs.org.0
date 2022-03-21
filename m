Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC854E224C
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Mar 2022 09:35:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMSbw0sYtz30Ph
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Mar 2022 19:35:08 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=p.zabel@pengutronix.de;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1191 seconds by postgrey-1.36 at boromir;
 Mon, 21 Mar 2022 19:35:03 AEDT
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMSbq4sL3z307B
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Mar 2022 19:35:02 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nWDBd-0004Zy-AB; Mon, 21 Mar 2022 09:14:45 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nWDBW-0023Fj-7t; Mon, 21 Mar 2022 09:14:39 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nWDBW-0001PK-AO; Mon, 21 Mar 2022 09:14:38 +0100
Message-ID: <84f2c72ced35506522ea3a6be72879d1699f885b.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] net: mdio: add reset deassertion for Aspeed MDIO
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Dylan Hung <dylan_hung@aspeedtech.com>, robh+dt@kernel.org,
 joel@jms.id.au,  andrew@aj.id.au, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk,  davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com,  devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,  netdev@vger.kernel.org
Date: Mon, 21 Mar 2022 09:14:38 +0100
In-Reply-To: <20220321070131.23363-2-dylan_hung@aspeedtech.com>
References: <20220321070131.23363-1-dylan_hung@aspeedtech.com>
 <20220321070131.23363-2-dylan_hung@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, stable@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Dylan,

On Mo, 2022-03-21 at 15:01 +0800, Dylan Hung wrote:
> Add reset deassertion for Aspeed MDIO.=C2=A0 There are 4 MDIO controllers
> embedded in Aspeed AST2600 SOC and share one reset control register
> SCU50[3]. So devm_reset_control_get_shared is used in this change.
>=20
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> Cc: stable@vger.kernel.org
> ---
> =C2=A0drivers/net/mdio/mdio-aspeed.c | 8 ++++++++
> =C2=A01 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/net/mdio/mdio-aspeed.c b/drivers/net/mdio/mdio-
> aspeed.c
> index e2273588c75b..8ac262a12d13 100644
> --- a/drivers/net/mdio/mdio-aspeed.c
> +++ b/drivers/net/mdio/mdio-aspeed.c
> @@ -3,6 +3,7 @@
> =C2=A0
> =C2=A0#include <linux/bitfield.h>
> =C2=A0#include <linux/delay.h>
> +#include <linux/reset.h>
> =C2=A0#include <linux/iopoll.h>
> =C2=A0#include <linux/mdio.h>
> =C2=A0#include <linux/module.h>
> @@ -37,6 +38,7 @@
> =C2=A0
> =C2=A0struct aspeed_mdio {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void __iomem *base;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct reset_control *reset;
> =C2=A0};
> =C2=A0
> =C2=A0static int aspeed_mdio_read(struct mii_bus *bus, int addr, int
> regnum)
> @@ -120,6 +122,12 @@ static int aspeed_mdio_probe(struct
> platform_device *pdev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(ctx->base))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return PTR_ERR(ctx->base);
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ctx->reset =3D devm_reset_cont=
rol_get_shared(&pdev->dev, NULL);

The device tree bindings should have a required reset control property
documented before this is added.

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(ctx->reset))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return PTR_ERR(ctx->reset);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reset_control_deassert(ctx->re=
set);
> +

This is missing a corresponding reset_control_assert() in
aspeed_mdio_remove() and in the error path of of_mdiobus_register().
That would allow to assert the reset line again after all MDIO
controllers are unbound.

regards
Philipp
