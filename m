Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBBC897D07
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Apr 2024 02:27:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=KMKihofe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V92W758lzz3d4L
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Apr 2024 11:27:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=KMKihofe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V92W16MLBz3cSd
	for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Apr 2024 11:27:09 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-182-70.adl-adc-lon-bras34.tpg.internode.on.net [118.210.182.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CD58320172;
	Thu,  4 Apr 2024 08:27:01 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1712190426;
	bh=7XBJv5sXFllW6o2Z1qUfGGSmKeySAzOgxYx/fU65DDo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KMKihofeIwJ5nFzr9rQ6jaTGM8JkIsM88UxAya7N3V3td2wYInXkbxhN4x2bfPXnc
	 6bc4M7rVw0UfgL1YD1QunC9k4bPWoTwTPRMghNm9ELeJyAy5a9QMUgXIQ2NNuoTTpR
	 RNBzwmlKIwzeVisUPu/Sin/4XaD+G9S5+9UbnpBwldoxXicbThPk3FX/37bSTiHuMv
	 hTD+rMM5ubqiu0BIG/tRIQ08n34xFzDKtPOICO9DhZFFDQF6si5kqe9Fhbm15OJXYx
	 Jp1qcUoBGCJpXndHnXvBOnr3T5xX0ARuczw0DPLlZkYyEIKNlYNNqMZrrOiY9WGA7+
	 wtT+HTc+9+kEw==
Message-ID: <cfc735c787707298ef3e2e1f5aa6f3096326a26b.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] dt-bindings: watchdog: aspeed,ast2400-wdt: Convert
 to DT schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>
Date: Thu, 04 Apr 2024 10:56:59 +1030
In-Reply-To: <20240403171321.GA3996007-robh@kernel.org>
References: <20240403020439.418788-1-andrew@codeconstruct.com.au>
	 <20240403171321.GA3996007-robh@kernel.org>
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

On Wed, 2024-04-03 at 12:13 -0500, Rob Herring wrote:
> On Wed, Apr 03, 2024 at 12:34:39PM +1030, Andrew Jeffery wrote:
> > Squash warnings such as:
> >=20
> > ```
> > arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: /ahb/apb@1e=
600000/watchdog@1e785000: failed to match any schema with compatible: ['asp=
eed,ast2400-wdt']
> > ```
> >=20
> > The schema binding additionally defines the clocks property over the
> > prose binding to align with use of the node in the DTS files.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > ---
> > v2: Address feedback from Rob and Zev
> >=20
> >     - Rob: https://lore.kernel.org/linux-watchdog/20240402180718.GA3585=
05-robh@kernel.org/
> >     - Zev: https://lore.kernel.org/linux-watchdog/65722a59-2e94-4616-81=
e1-835615b0e600@hatter.bewilderbeest.net/
> >=20
> > v1: https://lore.kernel.org/linux-watchdog/20240402120118.282035-1-andr=
ew@codeconstruct.com.au/
> >=20
> >  .../bindings/watchdog/aspeed,ast2400-wdt.yaml | 142 ++++++++++++++++++
> >  .../bindings/watchdog/aspeed-wdt.txt          |  73 ---------
> >  2 files changed, 142 insertions(+), 73 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/watchdog/aspeed,a=
st2400-wdt.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/watchdog/aspeed-w=
dt.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-=
wdt.yaml b/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.ya=
ml
> > new file mode 100644
> > index 000000000000..be78a9865584
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yam=
l
> > @@ -0,0 +1,142 @@
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
> > +  clocks:
> > +    maxItems: 1
> > +    description: >
>=20
> You don't need '>' either. I guess it is equivalent here as there are no=
=20
> double newlines. Drop these if you respin, otherwise:
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks. I've made a note for the future to avoid `>` if it's not
necessary, but at the time I figured it wasn't incorrect to include it.

Andrew
