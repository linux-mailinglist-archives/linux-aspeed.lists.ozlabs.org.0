Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F4F94061B
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2024 05:56:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GOKo00CW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WY1cl27Wcz3cfT
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2024 13:56:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GOKo00CW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WY1cZ4wKHz3c5h
	for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Jul 2024 13:56:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722311787;
	bh=MS3klEd7ZevntHEIeQtcKtN+G0dUXIcDk100cqPHI1Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GOKo00CWVXVHiPBmdkyKdzHKroWlZdp73d+ebOWjKyINjoBN2Vhmw4TMLP0oGzuz6
	 tAPZKohwTr5JtCqIKJDxWM0PGLFjpltsVozRKnO9EWu2FdbAKWaU6NUuxvQo02RfAP
	 vYA1O6nP8gtv9E0wtYt8gpo9g3g1MUiciDKLKVfSXxqiKYVsa5tBllZTYTDMSDHJBD
	 j2dgbZri8BtnQkonvSqbTmCSiZnpgXU8Nh7Lf2YieLV6MmiTCA0y6moVdXiD/ESQPh
	 ZS+a/AtKywnn5s6LZxEArI0RZpXlQ6OL3BVJQEFdGBBcAd2mfvR1Amwj5HS5sJlkUf
	 +bJVoTTtgEcLw==
Received: from [192.168.68.112] (ppp118-210-29-70.adl-adc-lon-bras31.tpg.internode.on.net [118.210.29.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6F32266B02;
	Tue, 30 Jul 2024 11:56:24 +0800 (AWST)
Message-ID: <cf5f5efb49ef6230ba5084e53316a8fb8ddedef1.camel@codeconstruct.com.au>
Subject: Re: [PATCH v11 25/27] ARM: dts: aspeed: yosemite4: add RTQ6056
 support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Patrick Williams <patrick@stwcx.xyz>, Delphine CC Chiu
	 <Delphine_CC_Chiu@wiwynn.com>
Date: Tue, 30 Jul 2024 13:26:21 +0930
In-Reply-To: <ZqgRq4h0HWClxSEW@heinlein.vulture-banana.ts.net>
References: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240723092310.3565410-26-Delphine_CC_Chiu@wiwynn.com>
	 <ZqgRq4h0HWClxSEW@heinlein.vulture-banana.ts.net>
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

On Mon, 2024-07-29 at 17:03 -0500, Patrick Williams wrote:
> On Tue, Jul 23, 2024 at 05:23:06PM +0800, Delphine CC Chiu wrote:
> > Add RTQ6056 (spider board 3rd source) support in yosemite4 DTS.
> >=20
> > Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> > ---
> >  .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts=
 b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> > index f73719b3c2f1..03a1e41312e3 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> > @@ -1240,35 +1240,35 @@ adc@37 {
> >  	};
> > =20
> >  	power-sensor@40 {
> > -		compatible =3D "ti,ina233";
> > +		compatible =3D "ti,ina233", "richtek,rtq6056";
>=20
> Is this legal to have two chips both listed as compatible?  I thought
> this approach has been rejected before.

It depends on the circumstances. Does one have a superset of the
functionality of the other?

https://github.com/devicetree-org/devicetree-specification/blob/main/source=
/chapter2-devicetree-basics.rst#compatible

Andrew
