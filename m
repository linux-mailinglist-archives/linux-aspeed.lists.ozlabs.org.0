Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B2594B4D3
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Aug 2024 04:06:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LHsZlJgo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfVlZ07LZz3dSG
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Aug 2024 12:06:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LHsZlJgo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfVlT726Xz3cjt
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Aug 2024 12:06:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1723082789;
	bh=OnyU4K9Xs3OQ6gjOrSz6jTsZs25qhB/EPzhnB51St3U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LHsZlJgoxe2y22kAI9EN4j+HNry8kSr3WF2Od0kH5bmtymF7vLHaKSmj2xnzH6zc7
	 Vc3iX6jMT1QztIpxXfMFEJRVam4nLKamu1TDi/cmZMlfSptW9gtXRWBynGfLzvVDoV
	 98WI63bq6l72+k4JF6/Bk3+km79IHArILkFHmDvqp5mjMJma2EHn70Qf53yvkzLJCX
	 7AelvkqsrM7a4bdr5sAnpEMxGK3dp1QWQmgIADUKvrpK2ugsrnJhE1BqVPMhLpPJJJ
	 9ebml7Gr1q17RVD+8xpsyiSeySQmOBaP+JNv0gJMAZN5EiUcqr1V4Io4mQySZompv8
	 744nsHhAWMy8w==
Received: from [192.168.68.112] (203-57-213-111.dyn.iinet.net.au [203.57.213.111])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8C20B66F97;
	Thu,  8 Aug 2024 10:06:28 +0800 (AWST)
Message-ID: <4d26bde0bda7cb1d44958d967c4b0c2da5b2abc4.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/2] dt-bindings: misc: aspeed,ast2400-cvic: Convert to
 DT schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Joel Stanley
 <joel@jms.id.au>
Date: Thu, 08 Aug 2024 11:36:28 +0930
In-Reply-To: <ec19fe07-84bd-4c32-a886-e6126af52f4c@kernel.org>
References: 	<20240802-dt-warnings-irq-aspeed-dt-schema-v1-0-8cd4266d2094@codeconstruct.com.au>
	 <20240802-dt-warnings-irq-aspeed-dt-schema-v1-2-8cd4266d2094@codeconstruct.com.au>
	 <ec19fe07-84bd-4c32-a886-e6126af52f4c@kernel.org>
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

On Tue, 2024-08-06 at 08:12 +0200, Krzysztof Kozlowski wrote:
> On 02/08/2024 07:36, Andrew Jeffery wrote:
> > Address warnings such as:
> >=20
>=20
>=20
> > +description:
> > +  The Aspeed AST2400 and AST2500 SoCs have a controller that provides =
interrupts
> > +  to the ColdFire coprocessor. It's not a normal interrupt controller =
and it
> > +  would be rather inconvenient to create an interrupt tree for it, as =
it
> > +  somewhat shares some of the same sources as the main ARM interrupt c=
ontroller
> > +  but with different numbers.
> > +
> > +  The AST2500 also supports a software generated interrupt.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - aspeed,ast2400-cvic
> > +          - aspeed,ast2500-cvic
> > +      - const: aspeed,cvic
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  valid-sources:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description:
> > +      One cell, bitmap of support sources for the implementation.
>=20
> maxItems: 1
> (and drop "One cell" - no need to repeat constraints in free form text)

Ack to both.

>=20
> BTW, for both bindings, I do not see any user in the kernel. Why is this
> property needed in the DTS?

Good question. This is a hangover from when benh was involved in the
Aspeed kernel port.

Given it's specified in the prose binding and the devicetrees contain
the property I'll leaving it in for now, but I think it's something we
could consider removing down the track.

>=20
> > +
> > +  copro-sw-interrupts:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
>=20
> uint32? I do not see anywhere usage as an array. The in-kernel driver
> explicitly reads just uint32.

You're right, and in the context of the hardware an array doesn't make
sense here. I'll switch it to a uint32.

Thanks for the review.

Andrew
