Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 00AD48CDAF9
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 21:41:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qJ8wCSnQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vlddc4hWNz78qQ
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 May 2024 05:33:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qJ8wCSnQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlddT13hqz78hS;
	Fri, 24 May 2024 05:33:49 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 368DDCE17E0;
	Thu, 23 May 2024 19:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03DAC2BD10;
	Thu, 23 May 2024 19:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716492824;
	bh=b6J+elZwD4xE9hgMeYlYy/kGwaXhneuYcL/jeP1V5OM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJ8wCSnQCyP1Y5lWQZxFLADe/4lC2KWx8fUn4klan9iPI4CjeDFl3zBOLWUkaOui5
	 1CthTA4Z8+w5hkKWS1AlPAwtAHXDUqVhd48lanEkG1XezDHlVMjg+lG3YlqT6dNUfz
	 U5jAKnlNbq4O7HZ37jrR8WDbhBZfNUqnIeJwqmWu5bS2EjhWKicjLqkF7pSNomGPZH
	 W190I2rDbrBz912EgZbHmBcXoAuriOkxfQT5elzB6/BMshF0MPk3P2fY0rcW/WijSV
	 5iuvns3sK6jG4XIge95T/1BFNszGsGJds3vmf1fsZthDvnYttaf5bJbctitYFBa7bh
	 +MdfyQSLz25Eg==
Date: Thu, 23 May 2024 20:33:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
Message-ID: <20240523-rinse-sturdily-7c78d8517884@spud>
References: <20240522192524.3286237-18-eajames@linux.ibm.com>
 <2fe45df6-01a2-488b-99fb-5ee20491554c@web.de>
 <910b18b7-3717-4087-b028-fcaf5f2a604b@linux.ibm.com>
 <398bf753-6701-4925-b814-781a68a75cc5@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="F3aOdyo1Rjmg6l29"
Content-Disposition: inline
In-Reply-To: <398bf753-6701-4925-b814-781a68a75cc5@web.de>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh@kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-spi@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, linux-i2c@vger.kernel.org, Lakshmi Yadlapati <lakshmiy@us.ibm.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--F3aOdyo1Rjmg6l29
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Markus,

On Thu, May 23, 2024 at 09:30:55PM +0200, Markus Elfring wrote:
> >>> The Huygens is a Rainier with modifed FSI wiring.
> >> Will imperative wordings become helpful for a better commit message he=
re?
> >
> >
> > This statement is a description of hardware. I cannot word that imperat=
ively.
>=20
> Please take another look at corresponding improvement possibilities.
>=20
>=20
> > The commit message is imperative - "Add Huygens system".
>=20
> This information fits to the summary phrase.
>=20
> Would you like to mention in the changelog that a hardware description
> should be extended anyhow?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.9#n94

You are talking absolute crap here. Stop harassing contributors with
your inane comments.

Thanks,
Conor.

--F3aOdyo1Rjmg6l29
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZk+aEgAKCRB4tDGHoIJi
0mb/AQDX7B+NkGBYPuEc6h8NwJ+uUcyqGhHnz75SmYF7f+e18wEA0SPKX+z6SMf8
FVfYwuJ8FPV4UOZultKHc8HwIWcuBws=
=nUOM
-----END PGP SIGNATURE-----

--F3aOdyo1Rjmg6l29--
