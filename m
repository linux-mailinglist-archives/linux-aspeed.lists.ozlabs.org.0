Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C11EC8269A8
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Jan 2024 09:40:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TDVWYAz6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T7nZn2bs6z2yDY
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Jan 2024 19:40:49 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TDVWYAz6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqQHl1d3zz2xPc
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Dec 2023 04:16:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 65334B815F2;
	Tue, 12 Dec 2023 17:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403B3C433C9;
	Tue, 12 Dec 2023 17:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702401359;
	bh=VXQhagqDGb9vAh1nRc7GzOZY2WN4Caui/rFTeDa4cko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TDVWYAz6eO+Y1M2LDd/np6T4h5hGeO0w73YW0SOmy8G4+7kKFRMH0f3fsGmxVRqFT
	 LnNiOkMZJuEQjjQSjehHrvC5Rzm8REtMRExbqV91CA06WgeA/hTFgJfu5JduqRI0S0
	 Rj7GoizXSMggJMReaz3jh4pXeIDkHvZ85cwxB7Pbd09B/4zfd6BgOHK8ZfC1vdZIWn
	 QnWa/lMRIzgQj+Ig7GiieaB3j5UePPw+WzwiEdZ7Kp2mPWDMY/66fTcJYXn+SQ89Ka
	 S4T8pFHh61+PSqbaC9Vh8lE/Aupq69ZXKXh4RWuyDT2Z9+pbFg3jDFY1nnH+q9+hbe
	 Wp31YanBsWVuQ==
Date: Tue, 12 Dec 2023 17:15:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Ninad Palsule <ninad@linux.ibm.com>
Subject: Re: [PATCH v1 7/8] tpm: tis-i2c: Add more compatible strings
Message-ID: <20231212-avid-grill-dbead068fac8@spud>
References: <20231212164004.1683589-1-ninad@linux.ibm.com>
 <20231212164004.1683589-8-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Truf82TN7Drb/wPF"
Content-Disposition: inline
In-Reply-To: <20231212164004.1683589-8-ninad@linux.ibm.com>
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


--Truf82TN7Drb/wPF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 10:40:03AM -0600, Ninad Palsule wrote:
> From: Joel Stanley <joel@jms.id.au>
>=20
> The NPCT75x TPM is TIS compatible. It has an I2C and SPI interface.
>=20
> https://www.nuvoton.com/products/cloud-computing/security/trusted-platfor=
m-module-tpm/
>=20
> Add a compatible string for it, and the generic compatible.
>=20
> OpenBMC-Staging-Count: 3

Delete this from every patch that it appears from.

> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
> Link: https://lore.kernel.org/r/20220928043957.2636877-4-joel@jms.id.au
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>  drivers/char/tpm/tpm_tis_i2c.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/char/tpm/tpm_tis_i2c.c b/drivers/char/tpm/tpm_tis_i2=
c.c
> index a897402cc36a..9511c0d50185 100644
> --- a/drivers/char/tpm/tpm_tis_i2c.c
> +++ b/drivers/char/tpm/tpm_tis_i2c.c
> @@ -383,6 +383,8 @@ MODULE_DEVICE_TABLE(i2c, tpm_tis_i2c_id);
>  #ifdef CONFIG_OF
>  static const struct of_device_id of_tis_i2c_match[] =3D {
>  	{ .compatible =3D "infineon,slb9673", },
> +	{ .compatible =3D "nuvoton,npct75x", },
> +	{ .compatible =3D "tcg,tpm-tis-i2c", },

What's the point of the generic compatible if you are adding the device
specific ones to the driver anyway?

Thanks,
Conor.

>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, of_tis_i2c_match);
> --=20
> 2.39.2
>=20

--Truf82TN7Drb/wPF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXiVRwAKCRB4tDGHoIJi
0moFAP9qCekg1FNgRigBOa03OCo2ImwKVNMJNUYY0hON1Ul2NQD/fRm6HnP66ToK
uVCHCdKv0uV6qfN1BFts+lYjExWXRQs=
=MJ72
-----END PGP SIGNATURE-----

--Truf82TN7Drb/wPF--
