Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E8969479E
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 15:05:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFmLk59kvz3bh7
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Feb 2023 01:05:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DIRZZdqG;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DIRZZdqG;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFmLZ5Grqz2xb4
	for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Feb 2023 01:04:54 +1100 (AEDT)
Received: from rico.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DE37120034;
	Mon, 13 Feb 2023 22:04:50 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676297093;
	bh=Rqlv2sqC3TCOsNxDajqKf5TrX0e0ldaMazRHcAdox5Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DIRZZdqGngeJpL61e8FmNJDXUh91fn2h6RfyVA7ijmQpB0hxt9dliRXy1EEqMiAIr
	 QJkUxMMLbSVSCNX1pJAtXYEfiwPttzlLm9Ln8IZZxRRNFBJp9xDQY00bC4IvjGLdmM
	 0xuWehqRc6RE4z3Zfcx/GmqzItE07VMqI2TkOXckldrPjQvKP1Rpv1d4WyTNEoeUOf
	 jrwsJ1NJgQpza5gM3+4XaDrzbSY63fsp20aaRtXVdaom4s+N7v0eV3qiu4qXAkbVsa
	 NriW9m15mybE2ZMva6kvmuQZJAgQWPg1q+/WzTRdfg/UVuYXYh1kE6zsdIvtM5s0uI
	 jHi4M2mUSZQ9g==
Message-ID: <2528217bf1d43b834587cc0e399d7e86695bd390.camel@codeconstruct.com.au>
Subject: Re: [RFC PATCH] dt-bindings: Add AST2600 i3c controller binding
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	devicetree@vger.kernel.org
Date: Mon, 13 Feb 2023 22:04:50 +0800
In-Reply-To: <71aeb3da-13a1-1c79-9fe6-f5c23d398394@linaro.org>
References: 	<5c047dd91390b9ee4cd8bca3ff107db37a7be4ac.1676273912.git.jk@codeconstruct.com.au>
	 <7c6741e1-ae41-ba20-b859-736214c680e8@linaro.org>
	 <91e9e815bed8c2eff19dbe6b3ed36d10c6edcbfd.camel@codeconstruct.com.au>
	 <929a30fc-35f3-ab21-3a16-936ed69d5505@linaro.org>
	 <80fa21969d9e0e7a123bd525199dbb40e79d47e3.camel@codeconstruct.com.au>
	 <71aeb3da-13a1-1c79-9fe6-f5c23d398394@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-i3c@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

> > Yes, that's essentially what I'm looking for with this change -
> > particularly with the pullup config, which (as you say) could
> > arguably
> > be a pinctrl config instead.
>=20
> Depends, there was just a short sentence. If this is external
> resistor
> on the board, why this device needs such property (and none of other
> devices need...)? If this is internal pull up of I3C (and there is no
> other pin configuration possible, no other pins), it looks reasonable
> to me to have it here. But I am all guessing it...

It's the second case: there is a configurable pullup resistor in each of
the i3c controllers (or, more accurately: in the ast2600's glue
between the SoC and the I3C IP block).

The pullup configuration is controlled by the SoC "global" i3c
registers; a block shared by all of the SoC's i3c controllers. So, any
driver implementation would need to set up that global register
configuration on i3c controller init.

So, I can see two options for the binding (and consequently the driver
implementation):

 1) the sda-pullup-ohms property on the controller binding, which a
 driver implementation could set directly through the global register
 set

 2) define a pin controller on the global register block, allowing other
 (standard) DT pinctrl definitions to control the pullup calue. This
 would need a new driver implementation for the pin controller, but that
 shouldn't be too complex to implement.

For the binding proposed here, I've chosen (1). We can handle all of the
other (non-pullup-related) global register configuration by treating the
globals as a simple generic syscon device.

I'm happy to try (2) instead, if that's the better approach. However,
that may be over-engineering the binding spec (and consequently, the
necessary driver implementation) for just setting a register value.

From your second point:

> (and there is no other pin configuration possible, no other pins)

This is a fairly small and isolated component of the global ast2600 pin
configuration; the pullup value is set separately from the
already-implemented SoC-wide pinctrl. Merging the pullup values into
that wouldn't really fit the hardware interface mode though; this is a
separate IP block linked to the i3c controllers.

Let me know if you have any preferences on the approach to a biding
structure.

And Andrew: let me know if your experience with the ast2600 SoC's
pinctrl would suggest either option.

Cheers,


Jeremy
