Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 332DE8269AA
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Jan 2024 09:40:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hilZNWnT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T7nZs5Xlgz2xQH
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Jan 2024 19:40:53 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hilZNWnT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqSQ94K7Kz3bpp
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Dec 2023 05:51:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3A841CE198B;
	Tue, 12 Dec 2023 18:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E49BC433C8;
	Tue, 12 Dec 2023 18:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702407101;
	bh=dsv616JxuKXa+9HnLUwoLHTRzosx3BRQ5em0FE7Wdi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hilZNWnTPGBcJppGAc3Ra51k1swo6WEjxlJvulR/NT7rAMgcsyZn/2mMdOXAo8k2u
	 d6JquEwEOgdE3xHIK+puKGbF64+jG7CZeXdRpV5WtchLQMfpJKfQ3mGPTtq+hzrAKO
	 W+FWYIRRljOLiGZxqCMYL5Zd9V6ZHihWLlCXNBW+fa87m8A34i2/iNEGp5EM2NxC7k
	 ozA4yFqRi1JD7wgbWcVyyNufsWwsJcTuboXLSChed8W4MpcxY90j39R2KR/y+Yb+pB
	 L7qKpIQC2bYh2RuqSpBwZo31nX3CkwmY8kXhtC108ejoPasGyN7GhtiGN9v07SvhfO
	 4NnphCQGRzcCA==
Date: Tue, 12 Dec 2023 18:51:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1 7/8] tpm: tis-i2c: Add more compatible strings
Message-ID: <20231212-mouth-choice-40a83caa34ec@spud>
References: <20231212164004.1683589-1-ninad@linux.ibm.com>
 <20231212164004.1683589-8-ninad@linux.ibm.com>
 <20231212-avid-grill-dbead068fac8@spud>
 <73381bb0-7fa7-4a9e-88df-ab0063058e26@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V9Oj+WVlG5N/W7nM"
Content-Disposition: inline
In-Reply-To: <73381bb0-7fa7-4a9e-88df-ab0063058e26@roeck-us.net>
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
Cc: festevam@denx.de, linux-aspeed@lists.ozlabs.org, alexander.stein@ew.tq-group.com, naresh.solanki@9elements.com, johannes.holland@infineon.com, linux-hardening@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, peterhuewe@gmx.de, patrick.rudolph@9elements.com, peteryin.openbmc@gmail.com, jgg@ziepe.ca, andrew@codeconstruct.com.au, devicetree@vger.kernel.org, conor+dt@kernel.org, keescook@chromium.org, broonie@kernel.org, lakshmiy@us.ibm.com, bhelgaas@google.com, geissonator@yahoo.com, linux-arm-kernel@lists.infradead.org, tony.luck@intel.com, linux-kernel@vger.kernel.org, gpiccoli@igalia.com, jarkko@kernel.org, robh+dt@kernel.org, vincent@vtremblay.dev, linux-integrity@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--V9Oj+WVlG5N/W7nM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 10:00:39AM -0800, Guenter Roeck wrote:
> On Tue, Dec 12, 2023 at 05:15:51PM +0000, Conor Dooley wrote:
> > On Tue, Dec 12, 2023 at 10:40:03AM -0600, Ninad Palsule wrote:
> > > From: Joel Stanley <joel@jms.id.au>
> > >=20
> > > The NPCT75x TPM is TIS compatible. It has an I2C and SPI interface.
> > >=20
> > > https://www.nuvoton.com/products/cloud-computing/security/trusted-pla=
tform-module-tpm/
> > >=20
> > > Add a compatible string for it, and the generic compatible.
> > >=20
> > > OpenBMC-Staging-Count: 3
> >=20
> > Delete this from every patch that it appears from.
> >=20
> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > > Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > Link: https://lore.kernel.org/r/20220928043957.2636877-4-joel@jms.id.=
au
> > > Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> > > ---
> > >  drivers/char/tpm/tpm_tis_i2c.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/drivers/char/tpm/tpm_tis_i2c.c b/drivers/char/tpm/tpm_ti=
s_i2c.c
> > > index a897402cc36a..9511c0d50185 100644
> > > --- a/drivers/char/tpm/tpm_tis_i2c.c
> > > +++ b/drivers/char/tpm/tpm_tis_i2c.c
> > > @@ -383,6 +383,8 @@ MODULE_DEVICE_TABLE(i2c, tpm_tis_i2c_id);
> > >  #ifdef CONFIG_OF
> > >  static const struct of_device_id of_tis_i2c_match[] =3D {
> > >  	{ .compatible =3D "infineon,slb9673", },
> > > +	{ .compatible =3D "nuvoton,npct75x", },
> > > +	{ .compatible =3D "tcg,tpm-tis-i2c", },
> >=20
> > What's the point of the generic compatible if you are adding the device
> > specific ones to the driver anyway?
> >=20
>=20
> $ git grep infineon,slb9673
> Documentation/devicetree/bindings/trivial-devices.yaml:          - infine=
on,slb9673

Hmm, this would then need to be moved into the new schema, out of
trivial devices.

> drivers/char/tpm/tpm_tis_i2c.c: { .compatible =3D "infineon,slb9673", },
> $ git grep nuvoton,npct75x
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts:            compatibl=
e =3D "nuvoton,npct75x", "tcg,tpm-tis-i2c";
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts:            compatibl=
e =3D "nuvoton,npct75x", "tcg,tpm-tis-i2c";
> $ git grep tcg,tpm-tis-i2c
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts:            compatibl=
e =3D "nuvoton,npct75x", "tcg,tpm-tis-i2c";
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts:            compatibl=
e =3D "nuvoton,npct75x", "tcg,tpm-tis-i2c";
> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts:             compatibl=
e =3D "tcg,tpm-tis-i2c";

pog, undocumented compatibles.

> It looks like at least the generic entry is needed, given that it is quite
> likely that there is hardware out there using it. Other than that, this
> makes me wonder: Is there some official guideline describing if and when
> to use (only) generic devicetree compatible entries and when specific ones
> may / should / have to be used ? I suspect the answer to your question mi=
ght
> simply be "because we did not know better", and it might be helpful to be
> able to say "please see XXX for details".

To me using generic compatibles is okay when there is another mechanism
to identify the device. This patch would make more sense if the addition
of nuvoton,npct75x was omitted and the dt-binding had

properties:
  compatible:
    items:
      - enum:
          - infineon,slb9673
          - nuvoton,npct75x
      - const: tcg,tpm-tis-i2c

And whenever new i2c tpms showed up the device specific compatible was
added to the bindings and the driver had only* the generic compatible
static const struct of_device_id of_tis_i2c_match[] =3D {
	{ .compatible =3D "infineon,slb9673", },
	{ .compatible =3D "tcg,tpm-tis-i2c", },
};

* well, and the existing one since that cannot be removed.

--V9Oj+WVlG5N/W7nM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXirtAAKCRB4tDGHoIJi
0pVCAP9eEmViq9zfDvETMM5iORAPbi28FpIFeXMWyuql8hUi6AEA94t1EPXiXh8e
thK7zLOAbzpr0XigoTjBCCrT5zJs5wI=
=bTRp
-----END PGP SIGNATURE-----

--V9Oj+WVlG5N/W7nM--
