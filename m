Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7325F8269A5
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Jan 2024 09:40:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YaQxsfHF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T7nZj0Hn5z3bsJ
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Jan 2024 19:40:45 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YaQxsfHF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqQG61RhBz2xpd
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Dec 2023 04:14:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 13DE2B817C8;
	Tue, 12 Dec 2023 17:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE9EC433C7;
	Tue, 12 Dec 2023 17:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702401274;
	bh=Zcj0fXIYj05PfXAXJRRaba5K0+vOckPktiL630dMYgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YaQxsfHFiB42qftcR6JIjgF6HOa9mFE3f99F0/2J8URfdFND6pZ217M2SLq7InFZN
	 oEFXu+Lf/wQ7YSvLx1w5Q9jzNBY/Qc1WVKretbOmlcoLt/Swv1ld9vz/dalKNU5pLm
	 9wIhqZnctSuPaMCfLkR+9uHaZDlOXJG9EvVhYP2OSGpSfmb47zwx4z2ebcCcSucmB9
	 48ntdXs609bTUl4lCqHP3vA13xXAsU2dALDh2vvOolorLHqJNKS+P1hcp9UVsSeuO9
	 K+8KE1iKh3+/3phhUlltwDyg+gKlHq8nTyD7OdMOGm2gHZ8Wiviu8N6UG2cwp1JY9S
	 EwD7Iz17sNZyw==
Date: Tue, 12 Dec 2023 17:14:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Ninad Palsule <ninad@linux.ibm.com>
Subject: Re: [PATCH v1 2/8] dt-bindings: tpm: Add schema for TIS I2C devices
Message-ID: <20231212-amusement-elevation-28e42bcccc35@spud>
References: <20231212164004.1683589-1-ninad@linux.ibm.com>
 <20231212164004.1683589-3-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2PG9iIB6csIKhjsS"
Content-Disposition: inline
In-Reply-To: <20231212164004.1683589-3-ninad@linux.ibm.com>
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


--2PG9iIB6csIKhjsS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Tue, Dec 12, 2023 at 10:39:58AM -0600, Ninad Palsule wrote:
> From: Johannes Holland <johannes.holland@infineon.com>
>=20
> Add a dt schema to support device tree bindings

"Add bindings for..."

> for the generic I2C
> physical layer. Refer to the TCG PC Client Platform TPM Profile (PTP)
> Specification for TPM 2.0 v1.04 Revision 14.
>=20
> This includes descriptions for the Nuvoton and Infineon devices.
>=20

> OpenBMC-Staging-Count: 3

I have no idea what this is, but it needs to be removed from the patch.

> Signed-off-by: Johannes Holland <johannes.holland@infineon.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>  .../bindings/security/tpm/tpm-tis-i2c.yaml    | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/security/tpm/tpm-ti=
s-i2c.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/security/tpm/tpm-tis-i2c.y=
aml b/Documentation/devicetree/bindings/security/tpm/tpm-tis-i2c.yaml
> new file mode 100644
> index 000000000000..de1e34065748
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/security/tpm/tpm-tis-i2c.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/security/tpm/tpm-tis-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: I2C PTP based TPM Devices
> +
> +maintainers:
> +  - Johannes Holland <johannes.holland@infineon.com>
> +
> +description:
> +  Device Tree Bindings for I2C based Trusted Platform Module (TPM).

s/Device Tree Bindings for //. Doesn't dt_binding_check now complain if
you have this in a title or description?

> +properties:
> +  $nodename:
> +    pattern: "^tpm(@[0-9a-f]+)?$"
> +
> +  compatible:
> +    oneOf:
> +      - description: Infineon's Trusted Platform Module (TPM) (SLB9673).
> +        items:
> +          - const: infineon,slb9673
> +          - const: tcg,tpm-tis-i2c
> +      - description: Nuvoton's Trusted Platform Module (TPM) (NPCT75x).
> +        items:
> +          - const: nuvoton,npct75x
> +          - const: tcg,tpm-tis-i2c

> +      - const: tcg,tpm-tis-i2c

IMO this should be removed and this fallback should only be used in
combination with device specific compatibles, like you have here for the
infineon and nuvoton devices.

Cheers,
Conor.

> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      tpm@2e {
> +        compatible =3D "nuvoton,npct75x", "tcg,tpm-tis-i2c";
> +        reg =3D <0x2e>;
> +      };
> +    };
> +...
> --=20
> 2.39.2
>=20

--2PG9iIB6csIKhjsS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXiU8gAKCRB4tDGHoIJi
0rfJAP4nZ5EnLrc7JoF/x1QncshpSRifSSj5EXGcysTDO4Sr+wEAwPGS175s6OHs
QOXCdCmeYeUbjJsKyPpDYvec+54oKgg=
=kpn3
-----END PGP SIGNATURE-----

--2PG9iIB6csIKhjsS--
