Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3288269AC
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Jan 2024 09:41:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=osr3FgHO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T7nZy07KZz2yMJ
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Jan 2024 19:40:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=osr3FgHO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrdJC3nl9z3cWF
	for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Dec 2023 03:35:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD53C62331;
	Thu, 14 Dec 2023 16:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F85C433C8;
	Thu, 14 Dec 2023 16:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702571735;
	bh=xLP+CoYVRLf33dBZWy5D+JKVopjIGSKoYshwiIZs8WA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=osr3FgHOd4SxcHlgM+KOE3JV5uBYP9C8KxGaoG2GKSPe6NrSS8k4Otmqu4xV46Yas
	 waqEXYeDYaxMmJiZn/Ld0KbTKe1csyUB23OvBJMSRempX0Te7sC4TA3JrVvyJp5qar
	 EX642T5u02Fu+1kmlzxxE0xK5FczFoX5t6PD2QIUWiPXcXlYRUkyJOe1UAWR5vAftl
	 8tWrd1VeDeWfI+HH8oAycivpbskmMyPDLLF4okV29ou9JImHjNKXIExJWL11P+OtjW
	 UjjKb4KEtvajbahh8rfFn/MGo3ArVlhAFke2+6PTj58UqBfSR+owDpZhR3CcFz8ww1
	 NSSQ3uH/wi5xQ==
Date: Thu, 14 Dec 2023 16:35:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Ninad Palsule <ninad@linux.ibm.com>
Subject: Re: [PATCH v1 2/8] dt-bindings: tpm: Add schema for TIS I2C devices
Message-ID: <20231214-stopper-bounce-ca9002869293@spud>
References: <20231212164004.1683589-1-ninad@linux.ibm.com>
 <20231212164004.1683589-3-ninad@linux.ibm.com>
 <20231212-amusement-elevation-28e42bcccc35@spud>
 <d8b5df1c-c732-4cf3-ae28-cc2017d3b0b6@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MMQ9s9pZoIm9/Al5"
Content-Disposition: inline
In-Reply-To: <d8b5df1c-c732-4cf3-ae28-cc2017d3b0b6@linux.ibm.com>
X-Mailman-Approved-At: Mon, 08 Jan 2024 19:40:35 +1100
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
Cc: festevam@denx.de, linux-aspeed@lists.ozlabs.org, alexander.stein@ew.tq-group.com, naresh.solanki@9elements.com, johannes.holland@infineon.com, linux-hardening@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, peterhuewe@gmx.de, patrick.rudolph@9elements.com, peteryin.openbmc@gmail.com, jgg@ziepe.ca, andrew@codeconstruct.com.au, linux@roeck-us.net, devicetree@vger.kernel.org, conor+dt@kernel.org, keescook@chromium.org, broonie@kernel.org, lakshmiy@us.ibm.com, bhelgaas@google.com, geissonator@yahoo.com, linux-arm-kernel@lists.infradead.org, tony.luck@intel.com, linux-kernel@vger.kernel.org, gpiccoli@igalia.com, jarkko@kernel.org, robh+dt@kernel.org, vincent@vtremblay.dev, linux-integrity@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--MMQ9s9pZoIm9/Al5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 09:34:39AM -0600, Ninad Palsule wrote:
> Hello Conor,
>=20
> On 12/12/23 11:14, Conor Dooley wrote:
> > Hey,
> >=20
> > On Tue, Dec 12, 2023 at 10:39:58AM -0600, Ninad Palsule wrote:
> > > From: Johannes Holland <johannes.holland@infineon.com>
> > >=20
> > > Add a dt schema to support device tree bindings
> > "Add bindings for..."
> Fixed.
> >=20
> > > for the generic I2C
> > > physical layer. Refer to the TCG PC Client Platform TPM Profile (PTP)
> > > Specification for TPM 2.0 v1.04 Revision 14.
> > >=20
> > > This includes descriptions for the Nuvoton and Infineon devices.
> > >=20
> > > OpenBMC-Staging-Count: 3
> > I have no idea what this is, but it needs to be removed from the patch.
> Removed.
> >=20
> > > Signed-off-by: Johannes Holland <johannes.holland@infineon.com>
> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > > Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> > > ---
> > >   .../bindings/security/tpm/tpm-tis-i2c.yaml    | 50 ++++++++++++++++=
+++
> > >   1 file changed, 50 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/security/tpm/t=
pm-tis-i2c.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/security/tpm/tpm-tis-i=
2c.yaml b/Documentation/devicetree/bindings/security/tpm/tpm-tis-i2c.yaml
> > > new file mode 100644
> > > index 000000000000..de1e34065748
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/security/tpm/tpm-tis-i2c.yaml
> > > @@ -0,0 +1,50 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/security/tpm/tpm-tis-i2c.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: I2C PTP based TPM Devices
> > > +
> > > +maintainers:
> > > +  - Johannes Holland <johannes.holland@infineon.com>
> > > +
> > > +description:
> > > +  Device Tree Bindings for I2C based Trusted Platform Module (TPM).
> > s/Device Tree Bindings for //. Doesn't dt_binding_check now complain if
> > you have this in a title or description?
> Fixed.
> >=20
> > > +properties:
> > > +  $nodename:
> > > +    pattern: "^tpm(@[0-9a-f]+)?$"
> > > +
> > > +  compatible:
> > > +    oneOf:
> > > +      - description: Infineon's Trusted Platform Module (TPM) (SLB96=
73).
> > > +        items:
> > > +          - const: infineon,slb9673
> > > +          - const: tcg,tpm-tis-i2c
> > > +      - description: Nuvoton's Trusted Platform Module (TPM) (NPCT75=
x).
> > > +        items:
> > > +          - const: nuvoton,npct75x
> > > +          - const: tcg,tpm-tis-i2c

Also, another thought - the bus is not usually encoded in the compatible
string, so it would be good to remove that.

> > > +      - const: tcg,tpm-tis-i2c
> > IMO this should be removed and this fallback should only be used in
> > combination with device specific compatibles, like you have here for the
> > infineon and nuvoton devices.
>=20
> As Guenter mentioned I need to keep it as tacoma board is just using this
> string.

No, that does not mean that you have to keep this in the binding. I know
Rob had some comments that might invalidate this binding entirely, but
if that does not happen then I think think that the tacoma devicetree
needs to have a device-specific compatible added for the tpm that it has.
You could of course retain the generic fallback compatible however.

--MMQ9s9pZoIm9/Al5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXsuzwAKCRB4tDGHoIJi
0iCVAQDk5mHO10tmO5WDzSu3wLDAmW2sRXfnlt57B2JKfnI6ugEA4cuH9pF3plY6
Hwto/5Zwn/wHNXZGd/jh0wVacJxniQo=
=N8sK
-----END PGP SIGNATURE-----

--MMQ9s9pZoIm9/Al5--
