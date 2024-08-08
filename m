Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9A594B4CB
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Aug 2024 04:02:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=hbNSVSS8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfVfg3Bhzz3ck9
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Aug 2024 12:02:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=hbNSVSS8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfVfV0Y7fz3cjf
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Aug 2024 12:02:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1723082527;
	bh=xeBzGU5DTBwHDca/OreT1bQLesgiFRjH3NSbGQuJpLs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hbNSVSS8FuAodoVkZ0Ir/7WxJyNLX++H51FwksLk0g2vg35TWCVxko2msf1QFIE9G
	 VVKVkTt1P+rlM5gSWQP33zTNY2wAxqHrqHobycDEKBTQq42NPHVEmcNzLD2IXJu5M9
	 mwlJskVx3MisbQexHG4i9Lf/2WMPMtelC+INwEG3w81LgGZxJmXP/VJQxjlscmowxD
	 FFKyLTXRjooNTBBg3udS7FIZY2n6bkQrOYCgO4yjgvZu5+tsVlWcNxNjnhUbRhL/Bo
	 /ok4e7iWt5adUfNSZGoFnXOADNXDAkTmCqfM04ZyZmcquee6JOzQmAvrdWTMc7lK7w
	 8WUuvlc1c6qKQ==
Received: from [192.168.68.112] (203-57-213-111.dyn.iinet.net.au [203.57.213.111])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 09C95656AB;
	Thu,  8 Aug 2024 10:02:04 +0800 (AWST)
Message-ID: <18a932d777d1b3b86af15e80af82b50d2189872f.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller:
 aspeed,ast2400-vic: Convert to DT schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Joel Stanley
 <joel@jms.id.au>
Date: Thu, 08 Aug 2024 11:32:04 +0930
In-Reply-To: <c51fb027-f8bd-4b10-b9c0-dbbe8e8cf4c1@kernel.org>
References: 	<20240802-dt-warnings-irq-aspeed-dt-schema-v1-0-8cd4266d2094@codeconstruct.com.au>
	 <20240802-dt-warnings-irq-aspeed-dt-schema-v1-1-8cd4266d2094@codeconstruct.com.au>
	 <c51fb027-f8bd-4b10-b9c0-dbbe8e8cf4c1@kernel.org>
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

On Tue, 2024-08-06 at 08:07 +0200, Krzysztof Kozlowski wrote:
> On 02/08/2024 07:36, Andrew Jeffery wrote:
> > Squash warnings such as:
> >=20
> >     arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: /ahb/in=
terrupt-controller@1e6c0080: failed to match any schema with compatible: ['=
aspeed,ast2400-vic']
> >=20
> > The YAML DT schema defines an optional property, valid-sources, which
> > was not previously described in the prose binding. It is added to
> > document existing practice in the Aspeed devicetrees. Unfortunately
> > the property seems to predate the requirement that vendor-specific
> > properties be prefixed.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
>=20
>=20
> > +
> > +description:
> > +  The AST2400 and AST2500 SoC families include a legacy register layou=
t before
> > +  a redesigned layout, but the bindings do not prescribe the use of on=
e or the
> > +  other.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - aspeed,ast2400-vic
> > +      - aspeed,ast2500-vic
> > +
> > +  interrupt-controller: true
> > +
> > +  "#interrupt-cells":
> > +    const: 1
> > +    description:
> > +      Specifies the number of cells needed to encode an interrupt sour=
ce. It
> > +      must be 1 as the VIC has no configuration options for interrupt =
sources.
> > +      The single cell defines the interrupt number.
> > +
> > +  valid-sources:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description:
> > +      One cell, bitmap of support sources for the implementation.
>=20
> maxItems: 2

Ack.

> What does "one cell" mean? uint32? DTS has two items.

Hah, I think that was a process error :) Two is correct here. I'll
rework the description.

>=20
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
>=20
> Is this correct? DTS does not have parent interrupt controller for this
> device.

I'll removed it, it's not necessary.

>=20
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> > +
> > +allOf:
> > +  - $ref: /schemas/interrupt-controller.yaml
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    interrupt-controller@1e6c0080 {
> > +         compatible =3D "aspeed,ast2400-vic";
> > +         reg =3D <0x1e6c0080 0x80>;
> > +         interrupt-controller;
> > +         #interrupt-cells =3D <1>;
>=20
> Make the example complete - add valid-sources interupts.
>=20

Ack.

Thanks for the review.

Andrew
