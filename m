Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3628C7C46
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 May 2024 20:25:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nkYjuS/N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgJRL260dz3fpm
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 May 2024 04:25:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nkYjuS/N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgJRC67Bpz3cyd;
	Fri, 17 May 2024 04:24:55 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 374AF6168B;
	Thu, 16 May 2024 18:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C819C113CC;
	Thu, 16 May 2024 18:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715883891;
	bh=cPL1DhrdW/xtQHPL/q/XvgIelBXk6IEmMe/AGb1c944=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nkYjuS/NexdomGUYU3PhmF2BEhhJUZUm4c0PYZXVThwzQ1oUCUlMhSlRnZ1V3G0dI
	 Wl35yGix0v9t0gXtX+EXf16tY03zkK6DewJ36fpxh/djVTlLkaW2R/+NRXUvKtylgO
	 aRhbWYSXg7PTX9Y3jEpRtXFnL/Ydoiw95ivnOxxWhnRT0x2UWZks1Yk+85EkqyFn5O
	 nTSQ8P7WVoKmLK5lq+y0Pd+JeIEPBYtIRr+ORf7MgipT/MbEkZBrOLgo2UNDPPG02Z
	 zMHpHpGNvRSuztl7iD7RNVzpr3jdPiJZ6FCQPxGqpZOxeN0/+iPfCsNAxZV4HyVH8v
	 ULd2zSEYDI5Pw==
Date: Thu, 16 May 2024 19:24:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v3 38/40] spi: fsi: Calculate clock divider from local
 bus frequency
Message-ID: <a3cf96f2-fa53-4f18-90f0-c21d6df5b2af@sirena.org.uk>
References: <20240516181907.3468796-1-eajames@linux.ibm.com>
 <20240516181907.3468796-39-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EtRMkbJm6V6cCFzH"
Content-Disposition: inline
In-Reply-To: <20240516181907.3468796-39-eajames@linux.ibm.com>
X-Cookie: I'm having a MID-WEEK CRISIS!
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
Cc: andrew@codeconstruct.com.au, andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, jk@ozlabs.org, alistair@popple.id.au, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--EtRMkbJm6V6cCFzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 16, 2024 at 01:19:05PM -0500, Eddie James wrote:
> Use the new FSI device local bus clock to calculate the proper SPI
> clock divider.

Acked-by: Mark Brown <broonie@kernel.org>

--EtRMkbJm6V6cCFzH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZGT20ACgkQJNaLcl1U
h9Cd2Af/YyaJyngR16Od3D4m0rdz60YKgrtOS3Cb/uzkT7akZun/GI8APPvqa3eT
MoMILsYV/sJLZZSToRxWTX4KeD6W05e/xroFqQGdEFOYPKIgSKurASoHutiksOW+
6eG20q6tI7MHN0ljWxuvxl5f50mmgNGHilOP9SliRxqwZ7Opezxbmjefr1Zzekpd
VpuzfhVO+Cb29HWR8NWcIqFcLi0Hi/VzEtJ6ydEWQAUuVU1UOWP1VeNLiNxLrP4d
mAn+T8KHJfreTV9pf2d9hGxH0KXpeEVeq1CYJCjClrSZ3I5ra3iSVNxIQhpTZnWJ
BhkD4E3BAnkYctMOFZms4ZgVm8W50A==
=n/DO
-----END PGP SIGNATURE-----

--EtRMkbJm6V6cCFzH--
