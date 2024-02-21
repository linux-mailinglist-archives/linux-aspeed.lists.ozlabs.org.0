Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F3D85CE2A
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 03:41:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Y5grKhT/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfgXF6HPPz3cDr
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 13:41:49 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Y5grKhT/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfgX62Jz4z30Pp
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Feb 2024 13:41:41 +1100 (AEDT)
Received: from [192.168.68.112] (ppp14-2-85-8.adl-apt-pir-bras31.tpg.internode.on.net [14.2.85.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5459D20184;
	Wed, 21 Feb 2024 10:41:36 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1708483298;
	bh=i30tH1Ja0ZXVCudrf3PesBOg0hw/OSVcL1FWavEO4jI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Y5grKhT/tF0diY/VUxBXx4FN3msX2l1/VU2VbGaHBcbd95wusYTx58qbginFcaWdC
	 G9cvzahU/eRJnSi6osDKRYFrAgAGnCqUHoCfoobsO+r84qs3yR5ae63XvzRafVmhpY
	 ic5NC87lLFT9fBZdfjBdlm5x17brSbH/nwTK6ru92fbsLItwtUNnFWbINuXBZdjZFK
	 NWIwXZ/u8LSYweLwt9pKUG4hss4zUQ5eRaeAmke/68G6g+ZY5kit/9AViBQpS4HEtX
	 d35pjRJ7BQNFDkkTxxOXI85htwDkNLsqVP1LTtfLjLSg+OD/BMLpjfzvmayjQs0rpb
	 9Pper7XHXuqZg==
Message-ID: <18dfd5f2eff5049fa5e3a098490dc601cf146f96.camel@codeconstruct.com.au>
Subject: Re: [PATCH] dt-bindings: gpio: Convert Aspeed binding to YAML schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linus.walleij@linaro.org, brgl@bgdev.pl
Date: Wed, 21 Feb 2024 13:11:35 +1030
In-Reply-To: <0d1dd262-b6dd-4d71-9239-8b0aec8cceff@linaro.org>
References: <20240220052918.742793-1-andrew@codeconstruct.com.au>
	 <0d1dd262-b6dd-4d71-9239-8b0aec8cceff@linaro.org>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Krzysztof, thanks for the feedback.

On Tue, 2024-02-20 at 09:27 +0100, Krzysztof Kozlowski wrote:
> > On 20/02/2024 06:29, Andrew Jeffery wrote:
> > > > Squash warnings such as:
> > > >=20
> >=20
> > Missing subject prefix: aspeed,ast2400-gpio
> >=20
> >=20
> > > > ```
> > > > arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: /ahb/ap=
b@1e600000/gpio@1e780000: failed to match any schema with compatible: ['asp=
eed,ast2400-gpio']
> > > > ```
> > > >=20
> > > > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> >=20
> > Thank you for your patch. There is something to discuss/improve.
> >=20
> >=20
> > > > ---
> > > >  .../bindings/gpio/aspeed,ast2400-gpio.yaml    | 64 +++++++++++++++=
++++
> > > >  .../devicetree/bindings/gpio/gpio-aspeed.txt  | 39 -----------
> > > >  2 files changed, 64 insertions(+), 39 deletions(-)
> > > >  create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,a=
st2400-gpio.yaml
> > > >  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-asp=
eed.txt
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-=
gpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> > > > new file mode 100644
> > > > index 000000000000..353c7620013f
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.ya=
ml
> > > > @@ -0,0 +1,64 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Aspeed GPIO controller
> > > > +
> > > > +maintainers:
> > > > +  - Andrew Jeffery <andrew@codeconstruct.com.au>
> > > > +
> > > > +allOf:
> > > > +  - $ref: /schemas/gpio/gpio.yaml#
> >=20
> > From where did you take it? None of the bindings have such code. Start
> > from recent bindings in given category when writing new ones.

I didn't take it from anywhere so much as try to apply some reasoning
via the commentary in the example at [1]. Maybe I could have fought
that approach by contrasting what I wrote to a wider set of existing
binding documents (I did look at some and obviously didn't find
anything similar).

Anyway reflecting on the misunderstanding, is the ref unnecessary
because the gpio binding sets `select: true`[2] and so is applied to
the node regardless?

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/devicetree/bindings/example-schema.yaml?h=3Dv6.7#n238
[2]: https://github.com/devicetree-org/dt-schema/blob/v2023.11/dtschema/sch=
emas/gpio/gpio.yaml#L12

> >=20
> > Please drop it.

Ack.

> >=20
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            const: aspeed,ast2600-gpio
> > > > +    then:
> > > > +      required:
> > > > +        - ngpios
> >=20
> > Please put entire allOf: after required: block. That's the convention
> > when it has something more than $ref, because we still want the most
> > important parts at the top of the file.

Ack.

> >=20
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - aspeed,ast2400-gpio
> > > > +      - aspeed,ast2500-gpio
> > > > +      - aspeed,ast2600-gpio
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    maxItems: 1
> > > > +    description: The clock to use for debounce timings
> > > > +
> > > > +  interrupts:
> > > > +    maxItems: 1
> > > > +
> > > > +  interrupt-controller: true
> > > > +
> > > > +  "#interrupt-cells":
> > > > +    const: 2
> > > > +
> >=20
> > ngpios with some constraints

Is this just with regard to the constraints I have under allOf above?
Or something further (constrain the values of ngpios for the various
controllers across the Aspeed SoCs)?

Maybe I'll look at some more of the existing bindings for this as
well...

> >=20
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - interrupts
> > > > +  - interrupt-controller
> > > > +  - "#gpio-cells"
> > > > +  - gpio-controller
> > > > +
> > > > +unevaluatedProperties: false
> >=20
> > Instead additionalProperties: false.

Ack - this is the same misunderstanding as the gpio schema ref
discussed above.

Andrew

