Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BE0895FEC
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Apr 2024 01:11:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=FrXBUrga;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8Nsp2LYWz3vpB
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Apr 2024 10:11:10 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=FrXBUrga;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8Nsd6X4sz3vp5
	for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Apr 2024 10:11:01 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-182-70.adl-adc-lon-bras34.tpg.internode.on.net [118.210.182.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 63CEE20075;
	Wed,  3 Apr 2024 07:10:55 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1712099458;
	bh=iuif0x0Ofo31gqORgNXcOWh8jcQ5qL5zLNFZaEZcCdA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FrXBUrgaQtHbvcweWF1VlRsmsh73gLQR6AFdBBQ3+/OiLS99ACu3Wj168ZYdQybWT
	 kQYb/CzlAfThARZupumQ241w5uK9vS1dKRQVFPUEjZwNZnGNvnGhH00lfrGGyknXgs
	 JhUZjADkr9Oil7R3kbLh5PwvY07AVibaunk6wsBMJiZ5MLYD4XVhFY03iib9BZ9U3p
	 3B87bBrATIe8zuzC+Q2bvFQL9fgUun3wL4Kw2j8dzk7eGyR5eSoXFV4sNi4F1DIhYs
	 wkaNqqYy+RvYqxSGnexrLNlXrOXheFrRuBHb5IAnJIoINAD25yFY+5QnbAnA5cY0zr
	 5e1o39nMutU7Q==
Message-ID: <37d2cc0d19cc4ace869eace13c8452525bad8609.camel@codeconstruct.com.au>
Subject: Re: [PATCH] dt-bindings: watchdog: Convert Aspeed binding to DT
 schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>
Date: Wed, 03 Apr 2024 09:40:51 +1030
In-Reply-To: <20240402180718.GA358505-robh@kernel.org>
References: <20240402120118.282035-1-andrew@codeconstruct.com.au>
	 <20240402180718.GA358505-robh@kernel.org>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-watchdog@vger.kernel.org, zev@bewilderbeest.net, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, krzysztof.kozlowski+dt@linaro.org, wim@linux-watchdog.org, linux@roeck-us.net
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 2024-04-02 at 13:07 -0500, Rob Herring wrote:
> On Tue, Apr 02, 2024 at 10:31:18PM +1030, Andrew Jeffery wrote:
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
> >  .../bindings/watchdog/aspeed,ast2400-wdt.yaml | 130 ++++++++++++++++++
> >  .../bindings/watchdog/aspeed-wdt.txt          |  73 ----------
> >  2 files changed, 130 insertions(+), 73 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/watchdog/aspeed,a=
st2400-wdt.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/watchdog/aspeed-w=
dt.txt
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
>=20
> # and order/function if more than 1 must be defined.

Ack.

>=20
> Please note it was missing from the original binding in the commit=20
> message.

Ack.

>=20
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
> > +      on a timeout event. Controllers critical to the SoC's operation =
may remain untouched.
> > +
> > +      Specifying 'system' will reset all controllers on a timeout even=
t, as if EXTRST had been asserted.
> > +      Specifying "none" will cause the timeout event to have no reset =
effect.
> > +      Another watchdog engine on the chip must be used for chip reset =
operations.
> > +
> > +      The default reset type is "system"
>=20
> Express as schema:
>=20
> default: system

Ack.

>=20
> > +
> > +  aspeed,alt-boot:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
>=20
> Don't need '|' if no formatting to preserve.

Ack.

>=20
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
>=20
> Wrap at <80. Period at end needed.

Ack for both.

>=20
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
> > +      timer expires. On AST2500 SoCs this should be a single word defi=
ned using
> > +      the AST2500_WDT_RESET_* macros; on AST2600 SoCs this should be a=
 two-word
> > +      array with the first word defined using the AST2600_WDT_RESET1_*=
 macros,
> > +      and the second word defined using the AST2600_WDT_RESET2_* macro=
s.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +allOf:
> > +  - if:
> > +      anyOf:
> > +        - required:
> > +            - aspeed,ext-push-pull
> > +        - required:
> > +            - aspeed,ext-active-high
> > +        - required:
> > +            - aspeed,reset-mask
> > +    then:
> > +      properties:
> > +        compatible:
> > +          enum:
> > +            - aspeed,ast2500-wdt
> > +            - aspeed,ast2600-wdt
> > +  - if:
> > +      required:
> > +        - aspeed,ext-active-high
> > +    then:
> > +      required:
> > +        - aspeed,ext-push-pull
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    wdt1: watchdog@1e785000 {
>=20
> Drop unused labels.

Ack.

Thanks for the feedback.

Andrew
