Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C393829E71
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jan 2024 17:23:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eNFc6vbv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T9Cly5mVVz3c5t
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jan 2024 03:23:42 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eNFc6vbv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T9Cls1JTgz30hC
	for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jan 2024 03:23:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6ED70B81E1E;
	Wed, 10 Jan 2024 16:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20634C433C7;
	Wed, 10 Jan 2024 16:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704903813;
	bh=eNBsfotIxA6oJoW5N6NgGDl5v3asXMtOGMdtipXCqO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eNFc6vbvq9MCcj7qHc7w5/8P2zz5HWo6hBJ2ySTcS2Cnfo91MFIcJIzZHGOPCC4LB
	 fVIIeoPbAouT31AT9BTQa65yUCSr+A49sqJYd7d69pFQqZDA8rIg/MRvtOzG52a3fd
	 stIVEXAA37eEfMFj1zm1ADvJu7nviGuC7RPXJpjjE1Pf2sdGa5dQU1BP8DTGcu0oXy
	 ZF+FO7OxEzaZM6oS/z8QyxvVDKN7vKPOfNsQB1U5XXNRyuKPPCcPRkKRsdMnBCm3hK
	 pq6PWAY1djk3nAkAcNcAo4RWC5A+i6N5xVrKmGLYKXEyRxZwjn/kzcN8zMoZci+8Vj
	 nTTk7o9MoupuQ==
Date: Wed, 10 Jan 2024 16:23:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Ninad Palsule <ninad@linux.ibm.com>
Subject: Re: [PATCH v1 7/8] tpm: tis-i2c: Add more compatible strings
Message-ID: <20240110-straggler-around-a53bc0a669fb@spud>
References: <73381bb0-7fa7-4a9e-88df-ab0063058e26@roeck-us.net>
 <20231212-mouth-choice-40a83caa34ec@spud>
 <2946fbb1-2a47-4d21-83dc-8e45bf6ba5a9@roeck-us.net>
 <60c8bbdb-4e08-44f0-88d4-ab164d4843b5@linux.ibm.com>
 <20240109-pep-coerce-2a86ae88753d@spud>
 <01974929-dfbf-4989-ba39-369e521827d0@linux.ibm.com>
 <3d194e84-bf1a-48e4-a376-e5c327c6508d@linaro.org>
 <2dd37d2b-28da-4e73-9047-61ec5d64bdb5@linux.ibm.com>
 <edbefdfd-eb59-4d86-ad07-feb066a21082@linaro.org>
 <385b06e9-1daa-408a-a0ed-7b09d7d539df@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Nfn0kt/7dCO7kpcR"
Content-Disposition: inline
In-Reply-To: <385b06e9-1daa-408a-a0ed-7b09d7d539df@linux.ibm.com>
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
Cc: festevam@denx.de, linux-aspeed@lists.ozlabs.org, alexander.stein@ew.tq-group.com, naresh.solanki@9elements.com, johannes.holland@infineon.com, linux-hardening@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, peterhuewe@gmx.de, patrick.rudolph@9elements.com, peteryin.openbmc@gmail.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, jgg@ziepe.ca, andrew@codeconstruct.com.au, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, conor+dt@kernel.org, keescook@chromium.org, broonie@kernel.org, lakshmiy@us.ibm.com, bhelgaas@google.com, geissonator@yahoo.com, linux-arm-kernel@lists.infradead.org, tony.luck@intel.com, linux-kernel@vger.kernel.org, gpiccoli@igalia.com, jarkko@kernel.org, robh+dt@kernel.org, vincent@vtremblay.dev, linux-integrity@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--Nfn0kt/7dCO7kpcR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 09:54:19AM -0600, Ninad Palsule wrote:
> Hello Krzysztof,
>=20
>=20
> On 1/10/24 09:37, Krzysztof Kozlowski wrote:
> > On 10/01/2024 15:31, Ninad Palsule wrote:
> > > Hello Krzysztof,
> > >=20
> > >=20
> > >=20
> > > > > > > I have send it as a separate commit. https://lore.kernel.org/=
linux-kernel/20231214144954.3833998-1-ninad@linux.ibm.com/
> > > > > > Why did you do that? It now just adds undocumented compatibles =
to the
> > > > > > driver. Please, as Rob requested, work with Lukas on his series=
 to make
> > > > > > sure that these devices are documented.
> > > > > I think krzysztof kozlowski suggested to send these patches separ=
ately:
> > > > > https://lore.kernel.org/linux-kernel/1c5ace65-2fd8-4503-b22f-e0f5=
64d1c83f@linaro.org/
> > > > >=20
> > > > > Did I misunderstood it? Do you guys want me to include that commi=
t again?
> > > > My comment was in DTS thread under specific DTS patch. How did you
> > > > figure out it applies to driver and bindings? This does not make se=
nse.
> > > Sorry for the misunderstanding. Where do you want me to add driver
> > > patch? Before all DTS patches or after all DTS patches?
> > Does not matter, why do you insist on combining them with DTS? Drivers
> > and bindings are going together. DTS better separate, although depending
> > on the case can be together.
> >=20
> I have combined DTS and Driver because DTS was using compatibility string
> which is not upstream yet hence I thought it is logical to send it under
> same patchset.
>=20
> Conor and Rob, Do you have preference?

I'm not sure what you want from me that Krzysztof hasn't already
provided. dt-bindings and drivers usually go together, and the dts
patches are often in the same series. If you send dts separately, note
under the --- line the patches adding the binding so that the platform
maintainer knows that the compatible has not yet been documented.

--Nfn0kt/7dCO7kpcR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZ7EfQAKCRB4tDGHoIJi
0uh3AQC7n1zpvCOgwRmJ2TWpkVaHRV4kl7Lf3HTTUFgMuyKlOAD+OIT57H0iSn/M
DmPl0DJh1FNbUbHYufAGfUrXlkzyMQU=
=NtVA
-----END PGP SIGNATURE-----

--Nfn0kt/7dCO7kpcR--
