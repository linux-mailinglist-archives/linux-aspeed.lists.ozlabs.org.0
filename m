Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7CA8431F6
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 01:33:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M3KMncQp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPjgH52Ggz3bsT
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 11:32:59 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M3KMncQp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPjgB6Rx8z30GC
	for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Jan 2024 11:32:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CAF36CE1D57;
	Wed, 31 Jan 2024 00:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46FFFC433C7;
	Wed, 31 Jan 2024 00:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706661170;
	bh=TbbCfL8IJfxgiIsFWKnXWPwHbFFZ4Te+lbkwAcKaEhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M3KMncQphv5pdrMNdBn56gAU1QjTtwVLGki7OgDIU+VK4dl7bi5jLL54lo3hcy95k
	 bAZLYI1imLFoDGg1x+YHGaJjYYU3YiZvf60c6T3W6Pg3HYkmgYP5rroXAj7ximGlBG
	 +UlaOpMaPHfBTLYwcd+ShnHL+dk1EGx07p3ytF0hFkRcoqMlqL5vwmqKjBSLPgKYE3
	 67JQZJXz2o6/6aWflWPgAyUoivH969ABA9qySqfKz80Vd+kQFs7Qo7QADGgpU9dFsA
	 Zd1fTu/pCVGNYsYIcHSwiQAAbmW/mkbncQ027jmNXyZS25MB4g9Ig56uaokw55iZ/D
	 OggQXOwCTGVCQ==
Date: Wed, 31 Jan 2024 00:32:42 +0000
From: Conor Dooley <conor@kernel.org>
To: "Corona, Ernesto" <ernesto.corona@intel.com>
Subject: Re: [PATCH 30 2/7] Add binding for Aspeed SOC
Message-ID: <20240131-felt-tip-mountain-e29606b63acf@spud>
References: <LV8PR11MB8463D0017B82135324127DB98B7D2@LV8PR11MB8463.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QWiiH/5RiPb5Te7D"
Content-Disposition: inline
In-Reply-To: <LV8PR11MB8463D0017B82135324127DB98B7D2@LV8PR11MB8463.namprd11.prod.outlook.com>
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
Cc: "'mark.rutland@arm.com'" <mark.rutland@arm.com>, "'alexandre.belloni@bootlin.com'" <alexandre.belloni@bootlin.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Filary, Steven A" <steven.a.filary@intel.com>, "'rgrs@protonmail.com'" <rgrs@protonmail.com>, "'mchehab+samsung@kernel.org'" <mchehab+samsung@kernel.org>, "'robh@kernel.org'" <robh@kernel.org>, "'corbet@lwn.net'" <corbet@lwn.net>, "'ebiggers@google.com'" <ebiggers@google.com>, "'patrickw3@fb.com'" <patrickw3@fb.com>, "Chen, Luke" <luke_chen@aspeedtech.com>, "'arnd@arndb.de'" <arnd@arndb.de>, "'omar.eduardo.castro@linux.intel.com'" <omar.eduardo.castro@linux.intel.com>, "'jiri@nvidia.com'" <jiri@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "'tytso@mit.edu'" <tytso@mit.edu>, "'vadimp@mellanox.com'" <vadimp@mellanox.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Castro, Omar Edua
 rdo" <omar.eduardo.castro@intel.com>, "'oleksandrs@mellanox.com'" <oleksandrs@mellanox.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--QWiiH/5RiPb5Te7D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Tue, Jan 30, 2024 at 11:30:10PM +0000, Corona, Ernesto wrote:
> Aspeed AST2400, AST2500 and AST2600 JTAG controller driver.
>=20
> Signed-off-by: Oleksandr Shamray <oleksandrs@mellanox.com>
> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
> Signed-off-by: Ernesto Corona <ernesto.corona@intel.com>
> Signed-off-by: Omar Castro <omar.eduardo.castro@linux.intel.com>
> Acked-by: Rob Herring <robh@kernel.org>

Where did this ack come from? The conversion to a yaml binding was in
v29 (according to your changelog) but I don't see the ack from Rob
there.
I think a conversion from (text?) to yaml would be sufficient of a
change to drop his tag.

> v28->v29
> - Change documentation to the new dt-bindings yaml format.

>  .../devicetree/bindings/jtag/aspeed-jtag.yaml | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/jtag/aspeed-jtag.ya=
ml
>=20
> diff --git a/Documentation/devicetree/bindings/jtag/aspeed-jtag.yaml b/Do=
cumentation/devicetree/bindings/jtag/aspeed-jtag.yaml
> new file mode 100644
> index 000000000000..1a412e83b81b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/jtag/aspeed-jtag.yaml

Filename matching a compatible please.

> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/jtag/aspeed-jtag.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed JTAG driver for ast2400, ast2500 and ast2600 SoC
> +
> +description:
> +  Driver adds support of Aspeed 24/25/2600 series SOC JTAG controller.
> +  Driver implements the following jtag ops
> +    freq_get
> +    freq_set
> +    status_get
> +    status_set
> +    xfer
> +    mode_set
> +    bitbang
> +    enable
> +    disable

None of the driver stuff, nor where you tested this, is relevant to the
description in the binding nor the title of the binding. Just describe
the hardware.

> +
> +  It has been tested on Mellanox system with BMC equipped with
> +  Aspeed 2520 SoC for programming CPLD devices.
> +
> +  It has also been tested on Intel system using Aspeed 25xx SoC
> +  for JTAG communication.
> +
> +  Tested on Intel system using Aspeed 26xx SoC for JTAG communication.
> +
> +maintainers:
> +  - Oleksandr Shamray <oleksandrs@mellanox.com>
> +  - Jiri Pirko <jiri@nvidia.com>
> +  - Ernesto Corona<ernesto.corona@intel.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - aspeed,ast2400-jtag
> +              - aspeed,ast2500-jtag
> +              - aspeed,ast2600-jtag

You don't need the "oneOf" or "items" here, it's enough to do:
  compatible:
    enum:
      - allwinner,sun5i-a13-mbus
      - allwinner,sun8i-a33-mbus

> +
> +
> +  reg:
> +    items:
> +      - description: JTAG Master controller register range
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +      jtag: jtag@1e6e4000 {

The labels for both of these examples are also not needed
as they're not used anywhere.

Thanks,
Conor.

> +          compatible =3D "aspeed,ast2500-jtag";
> +          reg =3D <0x1e6e4000 0x1c>;
> +          clocks =3D <&syscon ASPEED_CLK_APB>;
> +          resets =3D <&syscon ASPEED_RESET_JTAG_MASTER>;
> +          interrupts =3D <43>;
> +      };
> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +      jtag1: jtag@1e6e4100 {
> +          compatible =3D "aspeed,ast2600-jtag";
> +          reg =3D <0x1e6e4100 0x40>;
> +          clocks =3D <&syscon ASPEED_CLK_APB1>;
> +          resets =3D <&syscon ASPEED_RESET_JTAG_MASTER2>;
> +          interrupts =3D <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> +      };
> +
> +...
> --=20
> 2.25.1

--QWiiH/5RiPb5Te7D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbmVKgAKCRB4tDGHoIJi
0rCjAQDYj1EFmAGScPlfZN5yZJTxnHl32pOtpDUx3mrrfxczLQEA2sbvYzMN1NN0
lsTxpN/rFe4/GnLJeDKbYtp82xbo1gA=
=L/R4
-----END PGP SIGNATURE-----

--QWiiH/5RiPb5Te7D--
