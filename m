Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id B5AD78D4299
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2024 02:56:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DcdFYA/Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqSKm2kw3z79rg
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2024 10:48:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DcdFYA/Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqSKX6dDfz79q8
	for <linux-aspeed@lists.ozlabs.org>; Thu, 30 May 2024 10:48:16 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A76CF2012A;
	Thu, 30 May 2024 08:48:11 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717030094;
	bh=BL3VSBZFjB9LfmhW9pMux5iQFs+tV59KattgzjY68gk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DcdFYA/ZptlfMYfcV4NO4o+KF/gifV+wKQ4sSxRqP95G0dKtp6DtmTY41Wz+SekIB
	 zftLO4U3716/mBRT/9X8IImKRWNy04vYIW+Y/0sz3vRYh5qEJqHBimFY7UOUsOIino
	 XNu+eOmv869hLH0yeykwSsFuOdcjqZ4JB7rWds0rVlB79n6pTjqTZ7pfbaisT6MI30
	 cb95f+y96/sp3CGwy7yyGJ2II3Um1HJQFjDYHLgq5sbUOZb+BUkom92ufY+eIVG11E
	 2Si31f036oeodXxYnt82tZwX+adjOU11ZohZFf9MjlQIfcU5PB9Yavnz9DK+z0353e
	 Vh5I59nlhomyg==
Message-ID: <1bcaba5063820df7fd87d887835c42e2faad9d86.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/4] dt-bindings: gpio: aspeed,sgpio: Order properties
 by DTS style
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Thu, 30 May 2024 10:18:10 +0930
In-Reply-To: <080c4c05-e795-49d8-a547-d39d10ed8333@kernel.org>
References: 	<20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-0-91c42976833b@codeconstruct.com.au>
	 <20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-1-91c42976833b@codeconstruct.com.au>
	 <080c4c05-e795-49d8-a547-d39d10ed8333@kernel.org>
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
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2024-05-29 at 09:26 +0200, Krzysztof Kozlowski wrote:
> On 29/05/2024 07:13, Andrew Jeffery wrote:
> > Tidy up the list of required properties and the example node by orderin=
g
> > the properties in terms of the DTS coding style.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > ---
> >  Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 12 ++++++--=
----
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml b=
/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> > index 46bb121360dc..6b15a3a3fb66 100644
> > --- a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> > +++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> > @@ -51,12 +51,12 @@ properties:
> >  required:
> >    - compatible
> >    - reg
> > -  - gpio-controller
> > -  - '#gpio-cells'
> > +  - clocks
> >    - interrupts
> >    - interrupt-controller
> > +  - gpio-controller
> > +  - '#gpio-cells'
> >    - ngpios
> > -  - clocks
> >    - bus-frequency
>=20
> No, this should have the same order as properties are listed.
>=20
> Don't change it.

Ack.

>=20
> > =20
> >  additionalProperties: false
> > @@ -65,13 +65,13 @@ examples:
> >    - |
> >      #include <dt-bindings/clock/aspeed-clock.h>
> >      sgpio: sgpio@1e780200 {
> > -        #gpio-cells =3D <2>;
> >          compatible =3D "aspeed,ast2500-sgpio";
> > -        gpio-controller;
> > -        interrupts =3D <40>;
> >          reg =3D <0x1e780200 0x0100>;
> >          clocks =3D <&syscon ASPEED_CLK_APB>;
> > +        interrupts =3D <40>;
> >          interrupt-controller;
> > +        gpio-controller;
> > +        #gpio-cells =3D <2>;
>=20
> That's just example. I don't find this change useful but churn.

Sure, I'll drop the patch.

Thanks,

Andrew
