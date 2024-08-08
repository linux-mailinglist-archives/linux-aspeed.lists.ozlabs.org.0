Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE24194B5A4
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Aug 2024 05:53:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=l2Ksm/2O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfY6Q4TRkz3dFS
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Aug 2024 13:53:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=l2Ksm/2O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfY6L2b3rz3cWd
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Aug 2024 13:52:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1723089176;
	bh=PosnylbE4Y7ewXvd+zX7wq2nvzxbsSbmn+ew7CfQ/SM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=l2Ksm/2O4zEyMfZ/Bqws1Ow6EYrwShNr+Mci1PzlplSz5cAZXnwPOZCOW7ge7ROFT
	 Yn54QhVOOfirUObYnPi1ClLRGBiDVpV38wh9AKXoqmNGhL+erEGZV8xi5IxRJUbYQz
	 tOFP1OLk5rLj3uTV09U2fGE59CuTH0L82y1ox88+74/r0/RXhGVCbZ/R9Mdfk5D9wD
	 87XtbUIeP0LaGDqHbOG6qXD1R2c8KS3+hzxwU2HiCf4Y99t02xd9wv8IHVJKPsngFn
	 SSL6McwgNZyoinMaYd/7mELVOzIPxWWFggu38V43zMr0laoex2QLyJKyRxZXYsuN48
	 /Q9RHkFq+zVwg==
Received: from [192.168.68.112] (203-57-213-111.dyn.iinet.net.au [203.57.213.111])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id EA77A654E9;
	Thu,  8 Aug 2024 11:52:53 +0800 (AWST)
Message-ID: <211294ed76c23c55518015f4beedeb6efa63d540.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/2] dt-bindings: misc: aspeed,ast2400-cvic: Convert to
 DT schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Joel Stanley
 <joel@jms.id.au>
Date: Thu, 08 Aug 2024 13:22:53 +0930
In-Reply-To: <4d26bde0bda7cb1d44958d967c4b0c2da5b2abc4.camel@codeconstruct.com.au>
References: 	<20240802-dt-warnings-irq-aspeed-dt-schema-v1-0-8cd4266d2094@codeconstruct.com.au>
	 <20240802-dt-warnings-irq-aspeed-dt-schema-v1-2-8cd4266d2094@codeconstruct.com.au>
	 <ec19fe07-84bd-4c32-a886-e6126af52f4c@kernel.org>
	 <4d26bde0bda7cb1d44958d967c4b0c2da5b2abc4.camel@codeconstruct.com.au>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 2024-08-08 at 11:36 +0930, Andrew Jeffery wrote:
> On Tue, 2024-08-06 at 08:12 +0200, Krzysztof Kozlowski wrote:
> > On 02/08/2024 07:36, Andrew Jeffery wrote:
> > > Address warnings such as:
> > >=20
> >=20
> >=20
> > > +description:
> > > +  The Aspeed AST2400 and AST2500 SoCs have a controller that provide=
s interrupts
> > > +  to the ColdFire coprocessor. It's not a normal interrupt controlle=
r and it
> > > +  would be rather inconvenient to create an interrupt tree for it, a=
s it
> > > +  somewhat shares some of the same sources as the main ARM interrupt=
 controller
> > > +  but with different numbers.
> > > +
> > > +  The AST2500 also supports a software generated interrupt.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - aspeed,ast2400-cvic
> > > +          - aspeed,ast2500-cvic
> > > +      - const: aspeed,cvic
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  valid-sources:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +    description:
> > > +      One cell, bitmap of support sources for the implementation.
> >=20
> > maxItems: 1
> > (and drop "One cell" - no need to repeat constraints in free form text)
>=20
> Ack to both.
>=20
> >=20
> > BTW, for both bindings, I do not see any user in the kernel. Why is thi=
s
> > property needed in the DTS?
>=20
> Good question. This is a hangover from when benh was involved in the
> Aspeed kernel port.
>=20
> Given it's specified in the prose binding and the devicetrees contain
> the property I'll leaving it in for now, but I think it's something we
> could consider removing down the track.
>=20
> >=20
> > > +
> > > +  copro-sw-interrupts:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >=20
> > uint32? I do not see anywhere usage as an array. The in-kernel driver
> > explicitly reads just uint32.
>=20
> You're right, and in the context of the hardware an array doesn't make
> sense here. I'll switch it to a uint32.
>=20

Actually, on further inspection, the description says the property
should contain a list of interrupt _numbers_ (the hardware exposes 32
software drive-able interrupt bits). Given aspeed-g5.dtsi only lists
the single value '1' the intent feels somewhat murky. When I wrote the
reply above I had in my head that it was a bitmask like valid-sources
but the description suggests that's not true. I'm not sure the
described behaviour was chosen to be different to valid-sources,
however, for the co-processor, index 1 is an interrupt from the main
ARM core. Perhaps it felt less tedious just to write the index and not
the mask.

I'm going to backtrack on my reply above leave this as uint32-array
with `maxItems: 32` to meet the intent of the description. If there are
problems down the track we can consider the driver to have a bug with
respect to the binding (I don't think there's much risk there though).

Andrew
