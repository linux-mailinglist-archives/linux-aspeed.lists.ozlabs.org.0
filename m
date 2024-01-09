Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA70828AD0
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jan 2024 18:14:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SbN6CCuK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8cxL0NPZz3bsJ
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jan 2024 04:14:46 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SbN6CCuK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8cxC6SYTz30RS
	for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Jan 2024 04:14:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3FAE3614BF;
	Tue,  9 Jan 2024 17:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548BCC433C7;
	Tue,  9 Jan 2024 17:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704820476;
	bh=siOZC4wOuNDoVWsdLiyPsbZnkPF7a7ofovZKE/nAX/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SbN6CCuK5NChl9458MDDbcbs1SdUAG1Fd/5ItykQxgrlxYOt8DA2J14s9SYA8usPM
	 m5ylQNkriV3WnFbF7c+AFAqUyUAktzZbK3wZoEFB2gKpzmpeF0rHc7zyicWESv7X7n
	 dFWPf/MH+vgH1EU05HcjMtBdgGFIcA6QVLQ3Zn0XdIe4dg9+PM0H4lp6ZCNA14vqCf
	 K/XKUGrO0ohFsnTQfU0uJ8mF4pDjRqdZdIN0U0URwMfdzjeGtd6+Jr23csiXdPwDN/
	 UtmTiCgQlFnX6thWpQcgXP0b9vy5yRfx4+iNclwxUJ8xcjZnZYEPVHPpBX19d0ZaiH
	 M9/ChPwWdY3CQ==
Date: Tue, 9 Jan 2024 17:14:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Ninad Palsule <ninad@linux.ibm.com>
Subject: Re: [PATCH v1 7/8] tpm: tis-i2c: Add more compatible strings
Message-ID: <20240109-pep-coerce-2a86ae88753d@spud>
References: <20231212164004.1683589-1-ninad@linux.ibm.com>
 <20231212164004.1683589-8-ninad@linux.ibm.com>
 <20231212-avid-grill-dbead068fac8@spud>
 <73381bb0-7fa7-4a9e-88df-ab0063058e26@roeck-us.net>
 <20231212-mouth-choice-40a83caa34ec@spud>
 <2946fbb1-2a47-4d21-83dc-8e45bf6ba5a9@roeck-us.net>
 <60c8bbdb-4e08-44f0-88d4-ab164d4843b5@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OEamGw2PREjDYnc1"
Content-Disposition: inline
In-Reply-To: <60c8bbdb-4e08-44f0-88d4-ab164d4843b5@linux.ibm.com>
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
Cc: festevam@denx.de, linux-aspeed@lists.ozlabs.org, alexander.stein@ew.tq-group.com, naresh.solanki@9elements.com, johannes.holland@infineon.com, linux-hardening@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, peterhuewe@gmx.de, patrick.rudolph@9elements.com, peteryin.openbmc@gmail.com, jgg@ziepe.ca, andrew@codeconstruct.com.au, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, conor+dt@kernel.org, keescook@chromium.org, broonie@kernel.org, lakshmiy@us.ibm.com, bhelgaas@google.com, geissonator@yahoo.com, linux-arm-kernel@lists.infradead.org, tony.luck@intel.com, linux-kernel@vger.kernel.org, gpiccoli@igalia.com, jarkko@kernel.org, robh+dt@kernel.org, vincent@vtremblay.dev, linux-integrity@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--OEamGw2PREjDYnc1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 08, 2024 at 02:05:53PM -0600, Ninad Palsule wrote:
> Hello Guenter,
>=20
> On 12/12/23 13:50, Guenter Roeck wrote:
> > On 12/12/23 10:51, Conor Dooley wrote:
> > > On Tue, Dec 12, 2023 at 10:00:39AM -0800, Guenter Roeck wrote:
> > > > On Tue, Dec 12, 2023 at 05:15:51PM +0000, Conor Dooley wrote:
> > > > > On Tue, Dec 12, 2023 at 10:40:03AM -0600, Ninad Palsule wrote:
> > > > > > From: Joel Stanley <joel@jms.id.au>
> > > > > >=20
> > > > > > The NPCT75x TPM is TIS compatible. It has an I2C and SPI interf=
ace.
> > > > > >=20
> > > > > > https://www.nuvoton.com/products/cloud-computing/security/trust=
ed-platform-module-tpm/
> > > > > >=20
> > > > > >=20
> > > > > > Add a compatible string for it, and the generic compatible.
> > > > > >=20
> > > > > > OpenBMC-Staging-Count: 3
> > > > >=20
> > > > > Delete this from every patch that it appears from.
>=20
>=20
> I have send it as a separate commit. https://lore.kernel.org/linux-kernel=
/20231214144954.3833998-1-ninad@linux.ibm.com/

Why did you do that? It now just adds undocumented compatibles to the
driver. Please, as Rob requested, work with Lukas on his series to make
sure that these devices are documented.

Thanks,
Conor.

--OEamGw2PREjDYnc1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZ1+9AAKCRB4tDGHoIJi
0htZAP9a2iXLaNyt9gp80dOzXMKedooH9x1JxCeLqDSn/jQ4FAD7BmzWTG2ck+GX
6HtPX7JRe5C0eqmAl9taPHOuxon4HQw=
=q6NZ
-----END PGP SIGNATURE-----

--OEamGw2PREjDYnc1--
