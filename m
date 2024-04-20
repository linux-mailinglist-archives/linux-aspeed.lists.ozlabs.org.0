Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DDB8ABB25
	for <lists+linux-aspeed@lfdr.de>; Sat, 20 Apr 2024 12:54:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i+MhFRNz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VM7gz1gx0z3dDg
	for <lists+linux-aspeed@lfdr.de>; Sat, 20 Apr 2024 20:54:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i+MhFRNz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VM7gp2Shgz3cYy;
	Sat, 20 Apr 2024 20:54:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5B331CE1B45;
	Sat, 20 Apr 2024 10:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14354C072AA;
	Sat, 20 Apr 2024 10:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713610481;
	bh=8yYLW7gyuedZRx0RuumC/a4QgikYsX4XXuwlrGE+6LI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i+MhFRNzmwun318tjv2apgDOjPymkWQojhdg2dg0w7ouVO0Pu1TyxonbZZpdl0DqO
	 eVTXd//9RShBN8Dik2Ze+T3Y9aGCDc6qnyy6R22rL3GoxxFrAGMaUGKmcwji6CIGj/
	 No3oEwoEJjrvx1Xnmub+hoEiC7x1fyBocYxAuAMTxuedIMqBhQWFyTAboksgOZdVSs
	 S+MoRD2Z7qA8EcL85/HXsVCKFH12J6e27YaZQJEtXeFqbUi8Pp/7N8/SsMTz4mOkvM
	 Su81SFoR+SZ1MZ43EbJLLMq+f3dIRSrOYzpZEAsImugI4Z8IeZOKW5lzTOplkbUIh2
	 kRbkqlTlW5nJw==
Date: Sat, 20 Apr 2024 11:54:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: fsi: Document the IBM SBEFIFO engine
Message-ID: <20240420-importer-smugness-fdb48c92ea15@spud>
References: <20240419211143.1039868-1-eajames@linux.ibm.com>
 <20240419211143.1039868-2-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2jVjDS/uYvR8ikWT"
Content-Disposition: inline
In-Reply-To: <20240419211143.1039868-2-eajames@linux.ibm.com>
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, alistair@popple.id.au, jk@ozlabs.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org, andrew@codeconstruct.com.au, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--2jVjDS/uYvR8ikWT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 04:11:41PM -0500, Eddie James wrote:
> The SBEFIFO engine provides an interface to the POWER processor
> Self Boot Engine (SBE).
>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--2jVjDS/uYvR8ikWT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiOe6AAKCRB4tDGHoIJi
0lt8APwOSCYgU1v4jfqtkGKOKck3jvgqM0rviuuVaPNURcdTywD/ZUz0yis4GFE1
pfcyKkHHp4IeVY6C+5duicPKVy1ZIwE=
=R6YT
-----END PGP SIGNATURE-----

--2jVjDS/uYvR8ikWT--
