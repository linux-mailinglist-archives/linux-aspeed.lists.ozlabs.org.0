Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 604E88687F4
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 04:47:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=SLojqN+/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkNhs0mcjz3dDn
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 14:47:09 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=SLojqN+/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkNhk45bZz2yVL
	for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Feb 2024 14:47:02 +1100 (AEDT)
Received: from [192.168.68.112] (ppp14-2-70-176.adl-apt-pir-bras31.tpg.internode.on.net [14.2.70.176])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1F7E620127;
	Tue, 27 Feb 2024 11:46:54 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1709005617;
	bh=Yx/R5fkt8EGERdv8FabE1EE9SthXf954n/R2MAjuQug=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SLojqN+/JevAlu0Fbb/O2ZDM2UC6gVtUYhFOtFS50KZ55S2YJvcZ3Fyu5JIMEMNAt
	 krhAMKqpde2iCUr93+zS/rotpd+iATzMCeiMkNUniNpEABmz19L8a75JF1xVdVOrwI
	 4irKXA2cA6oky5Ae82dPvP1bNRH/cx4El7tWU/BAWwQHKoCoMJ476xP4sW0B4oPGhw
	 ehHH7S5FX2xaqKODU/bZwV1scCiz/nD2N4EgKrX6ahrvje8KB1oG8M92V8wmqs18Ok
	 w8NHtk/60S1wXPhpYB73yBtsiTdAv4d+WNW1J/6AkcYLG6pgRdWaclHqnJIZKIxuwQ
	 KVOH2REL0/CDw==
Message-ID: <b69298f73d4d51546402410b45963f137d3e3c98.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4] dt-bindings: gpio: aspeed,ast2400-gpio: Convert to
 DT schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>
Date: Tue, 27 Feb 2024 14:16:52 +1030
In-Reply-To: <20240227034047.GA2644802-robh@kernel.org>
References: <20240227004414.841391-1-andrew@codeconstruct.com.au>
	 <170900020204.2360855.790404478830111761.robh@kernel.org>
	 <20240227034047.GA2644802-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, brgl@bgdev.pl, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 2024-02-26 at 21:40 -0600, Rob Herring wrote:
> On Mon, Feb 26, 2024 at 08:16:43PM -0600, Rob Herring wrote:
> >=20
> > On Tue, 27 Feb 2024 11:14:14 +1030, Andrew Jeffery wrote:
> > > Squash warnings such as:
> > >=20
> > > ```
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: /ahb/apb@=
1e600000/gpio@1e780000: failed to match any schema with compatible: ['aspee=
d,ast2400-gpio']
> > > ```
> > >=20
> > > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > > ---
> > > v4: Add constraints for gpio-line-names, ngpios as requested by Krzys=
ztof:
> > >     https://lore.kernel.org/all/458becdb-fb1e-4808-87b6-3037ec945647@=
linaro.org/
> > >=20
> > >     Add more examples to exercise constraints.
> > >=20
> > > v3: https://lore.kernel.org/all/20240226051645.414935-1-andrew@codeco=
nstruct.com.au/
> > >=20
> > >     Base on v6.8-rc6, fix yamllint warning
> > >=20
> > >     Rob's bot picked the missing `#interrupt-cells` in the example on=
 v2[1]. The
> > >     patch was based on v6.8-rc1, and going back over my shell history=
 I missed
> > >     the following output from `make dt_binding_check`:
> > >=20
> > >     ```
> > >     ...
> > >       LINT    Documentation/devicetree/bindings
> > >       usage: yamllint [-h] [-] [-c CONFIG_FILE | -d CONFIG_DATA] [--l=
ist-files] [-f {parsable,standard,colored,github,auto}] [-s] [--no-warnings=
] [-v] [FILE_OR_DIR ...]
> > >       yamllint: error: one of the arguments FILE_OR_DIR - is required
> > >     ...
> > >     ```
> > >=20
> > >     I've rebased on v6.8-rc6 and no-longer see the issue with the inv=
ocation
> > >     of `yamllint`.
> > >=20
> > > [1]: https://lore.kernel.org/all/170892197611.2260479.153435625635539=
59436.robh@kernel.org/
> > >=20
> > > v2: https://lore.kernel.org/all/20240226031951.284847-1-andrew@codeco=
nstruct.com.au/
> > >=20
> > >     Address feedback from Krzysztof:
> > >     https://lore.kernel.org/all/0d1dd262-b6dd-4d71-9239-8b0aec8cceff@=
linaro.org/
> > >=20
> > > v1: https://lore.kernel.org/all/20240220052918.742793-1-andrew@codeco=
nstruct.com.au/
> > >=20
> > >  .../bindings/gpio/aspeed,ast2400-gpio.yaml    | 149 ++++++++++++++++=
++
> > >  .../devicetree/bindings/gpio/gpio-aspeed.txt  |  39 -----
> > >  2 files changed, 149 insertions(+), 39 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,ast=
2400-gpio.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-aspee=
d.txt
> > >=20
> >=20
> > My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_chec=
k'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >=20
> > yamllint warnings/errors:
> >=20
> > dtschema/dtc warnings/errors:
> > In file included from Documentation/devicetree/bindings/gpio/aspeed,ast=
2400-gpio.example.dts:91:
> > ./scripts/dtc/include-prefixes/dt-bindings/clock/ast2600-clock.h:14: wa=
rning: "ASPEED_CLK_GATE_LCLK" redefined
> >    14 | #define ASPEED_CLK_GATE_LCLK            6
>=20
> The examples aren't isolated from each other, so you can't have=20
> conflicting includes. You'll have to drop some of the examples or drop=
=20
> their use of the conflicting include.

Thanks. I've reworked the patch to avoid use of the conflicting
includes. I'm also sorting myself out to avoid repeating the process
flaw of failing to run `make dt_binding_check` on the patch I ended up
sending.

Andrew

