Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A31CA940620
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2024 05:59:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ihpbVfD3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WY1gl46Jrz3ck4
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2024 13:59:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ihpbVfD3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WY1gf3zjFz3cYk
	for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Jul 2024 13:59:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722311950;
	bh=4mdg6uNPlSlauYbqabzkmGIjQsigmJdCbZUU2fN6GHw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ihpbVfD3yuXOH42/S++YNFoUIDokwIAYeTvYZbGB9bdHqVBHjvnLH28I3V2pJ86lA
	 y18iJjyxGDg8yzdrRjHpLEgT0fgG7x6qBF7IRpAt9Y3flwtEYaj7h+Yosd4IhdLtIS
	 9vmtgi5TRY4l74OpDjOfK5iBDMdNZ9Oqx34uml/e+rasa+g1WP+90IV1ecwkcQz5Rb
	 l+kY/vLikGiw5K3qeYFfVG809nOLDplj4ruFifhJwZvZX5YmvuiGZG/iFXh8PhAwaG
	 MlPnIIdNZ4nBtp3b0TNhCQvgoz5F6pOwxpjvTdCgpKKS0dVfR4Vyy/EiS91S0PdHAv
	 2k+Yu2wzyAaNA==
Received: from [192.168.68.112] (ppp118-210-29-70.adl-adc-lon-bras31.tpg.internode.on.net [118.210.29.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7114966CCF;
	Tue, 30 Jul 2024 11:59:09 +0800 (AWST)
Message-ID: <86a3b58d00fc475065ad51458504a636e2f67e02.camel@codeconstruct.com.au>
Subject: Re: [PATCH v11 20/27] ARM: dts: aspeed: yosemite4: support medusa
 board adc sensors
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Patrick Williams <patrick@stwcx.xyz>, Delphine CC Chiu
	 <Delphine_CC_Chiu@wiwynn.com>
Date: Tue, 30 Jul 2024 13:29:08 +0930
In-Reply-To: <ZqgTz9DVPcqtTfUC@heinlein.vulture-banana.ts.net>
References: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240723092310.3565410-21-Delphine_CC_Chiu@wiwynn.com>
	 <ZqgTz9DVPcqtTfUC@heinlein.vulture-banana.ts.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 2024-07-29 at 17:12 -0500, Patrick Williams wrote:
> On Tue, Jul 23, 2024 at 05:23:01PM +0800, Delphine CC Chiu wrote:
> > Add ina233/ina28 support for medusa board adc sensors
> >=20
> > Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> > ---
> >  .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts    | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts=
 b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> > index 98eeee49b082..49500db53a13 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> > @@ -915,6 +915,19 @@ power-sensor@40 {
> >  		reg =3D <0x40>;
> >  	};
> > =20
> > +	power-sensor@41 {
> > +			compatible =3D "ti,ina233";
> > +			resistor-calibration =3D /bits/ 16 <0x0a00>;
> > +			current-lsb=3D /bits/ 16 <0x0001>;
> > +			reg =3D <0x41>;
> > +	};
>=20
> This depends on this unmerged patchset, right?
>=20
> https://lore.kernel.org/lkml/4a1cb223-448c-3e93-eb38-d86f543659e3@roeck-u=
s.net/
>=20
> Please resolve the issues Guenter raised.

Probably best to drop these nodes until those issues are resolved and
the binding patch is merged.

Andrew
