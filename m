Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD8789604B
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Apr 2024 01:39:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZXHLJUfK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8PVn1Dbdz3vYq
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Apr 2024 10:39:45 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZXHLJUfK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8PVh2vBMz2xTl
	for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Apr 2024 10:39:40 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-182-70.adl-adc-lon-bras34.tpg.internode.on.net [118.210.182.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 806F420075;
	Wed,  3 Apr 2024 07:39:38 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1712101179;
	bh=TYTY5ED6B4EfxtLOSSjN5VvpvocVSJ4sFiS7mfpMhBs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZXHLJUfKEfTPo/L5jQPCZ2RoFiql/3S//f0byjixfY7jvhq3TUlwuUCEv504O1Pnz
	 GU3oWpyf9rtcRApqMsANR9qfcPAHakXe233AWncmTBYt1rCNzgBFw6jWlFf30CHwKI
	 U2HTxNYc9mVrs30mOx1fI9xcm/NAxlJ9+dXwTRr5/8mr5zliRxw6wp++iUTFwnuq06
	 Qi8Gc5XjjzBKjMeX+9iuE9Ozn/CoV1x1TXlFyowx6iJNby/0ng74NBlMkLQvyF9n0w
	 ZzWop2iZlpYwO4f8U2Vk1nnJr20/9DT03gq0hD0l2K++SexJY2T4jlocIiZwgUtYs8
	 P/ZJCSDEyICkA==
Message-ID: <99fa05be32787c88150c6df2f882e31582aebf90.camel@codeconstruct.com.au>
Subject: Re: [PATCH] dt-bindings: watchdog: Convert Aspeed binding to DT
 schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Zev Weiss <zev@bewilderbeest.net>
Date: Wed, 03 Apr 2024 10:09:37 +1030
In-Reply-To: <65722a59-2e94-4616-81e1-835615b0e600@hatter.bewilderbeest.net>
References: <20240402120118.282035-1-andrew@codeconstruct.com.au>
	 <65722a59-2e94-4616-81e1-835615b0e600@hatter.bewilderbeest.net>
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
Cc: linux-arm-kernel@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, wim@linux-watchdog.org, linux@roeck-us.net
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 2024-04-02 at 16:30 -0700, Zev Weiss wrote:
> On Tue, Apr 02, 2024 at 05:01:18AM PDT, Andrew Jeffery wrote:
> > Squash warnings such as:
> >=20
> > ```
> > arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: /ahb/apb@1e=
600000/watchdog@1e785000: failed to match any schema with compatible: ['asp=
eed,ast2400-wdt']
> > ```
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > ---
> > .../bindings/watchdog/aspeed,ast2400-wdt.yaml | 130 ++++++++++++++++++
> > .../bindings/watchdog/aspeed-wdt.txt          |  73 ----------
> > 2 files changed, 130 insertions(+), 73 deletions(-)
> > create mode 100644 Documentation/devicetree/bindings/watchdog/aspeed,as=
t2400-wdt.yaml
> > delete mode 100644 Documentation/devicetree/bindings/watchdog/aspeed-wd=
t.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-=
wdt.yaml b/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.ya=
ml
> > new file mode 100644
> > index 000000000000..10fcb50c4051
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yam=
l
> > @@ -0,0 +1,130 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Aspeed watchdog timer controllers
> > +
> > +maintainers:
> > +  - Andrew Jeffery <andrew@codeconstruct.com.au>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - aspeed,ast2400-wdt
> > +      - aspeed,ast2500-wdt
> > +      - aspeed,ast2600-wdt
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks: true
> > +
> > +  aspeed,reset-type:
> > +    enum:
> > +      - cpu
> > +      - soc
> > +      - system
> > +      - none
> > +    description: |
> > +      Reset behaviour - The watchdog can be programmed to generate one=
 of three
> > +      different types of reset when a timeout occcurs.
> > +
> > +      Specifying 'cpu' will only reset the processor on a timeout even=
t.
> > +
> > +      Specifying 'soc' will reset a configurable subset of the SoC's c=
ontrollers
>=20
> Might be worth clarifying that it's configurable only on ast2500 &=20
> ast2600, and which property (aspeed,reset-mask) configures it?

Good point, will do.

>=20
> > +      on a timeout event. Controllers critical to the SoC's operation =
may remain untouched.
> > +
> > +      Specifying 'system' will reset all controllers on a timeout even=
t, as if EXTRST had been asserted.
> > +      Specifying "none" will cause the timeout event to have no reset =
effect.
>=20
> Tiny nit: quoting (single vs. double) is slightly inconsistent between=
=20
> values here.

Ack.

>=20
> > +      Another watchdog engine on the chip must be used for chip reset =
operations.
> > +
> > +      The default reset type is "system"
> > +
> > +  aspeed,alt-boot:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      Direct the watchdog to configure the SoC to boot from the altern=
ative boot
> > +      region if a timeout occurs.
> > +
> > +  aspeed,external-signal:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      Assert the timeout event on an external signal pin associated wi=
th the
> > +      watchdog controller instance. The pin must be muxed appropriatel=
y.
> > +
> > +  aspeed,ext-pulse-duration:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      The duration, in microseconds, of the pulse emitted on the exter=
nal signal pin
> > +
> > +  aspeed,ext-push-pull:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      If aspeed,external-signal is specified in the node, set the exte=
rnal
> > +      signal pin's drive type to push-pull. If aspeed,ext-push-pull is=
 not
> > +      specified then the pin is configured as open-drain.
> > +
> > +  aspeed,ext-active-high:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      If both aspeed,external-signal and aspeed,ext-push-pull are spec=
ified in
> > +      the node, set the pulse polarity to active-high. If aspeed,ext-a=
ctive-high
> > +      is not specified then the pin is configured as active-low.
> > +
> > +  aspeed,reset-mask:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 1
> > +    maxItems: 2
> > +    description: |
> > +      A bitmaks indicating which peripherals will be reset if the watc=
hdog
>=20
> Typo: "bitmask"

Good catch.

Thanks,

Andrew
