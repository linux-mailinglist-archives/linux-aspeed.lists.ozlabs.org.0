Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21853959BC8
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 14:28:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WplxL6TP5z2yn4
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 22:28:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E3D9gUb4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WplxJ4G0Pz2yGq
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2024 22:28:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 34FF560DED;
	Wed, 21 Aug 2024 12:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FDE6C32782;
	Wed, 21 Aug 2024 12:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724243313;
	bh=NnoJ4qFOrxmlo0aB7R44FT9bZ5SZQaWEJ6peEjE3zZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E3D9gUb4B/GUKB3QWBW1JB559Sq93PNeppTYu3VmOASkkCKChnf6IPAfkMLkSiiyy
	 f9ylMtMjtQqmzjIUffkPJHWLC1zhXrtGoAZRDmCuGWDqIyoNAAwmc4gpCL+K++jA4N
	 Zw1oGxNmXsN4NP049XdRR5hN0r0heueyPOpbxHk9bRdxxPnnT8ZJBCnMQQU+tH3g0E
	 Xob5sf7o5JrAqRfg34C+PxKtN1GSsGFNP3a2jFLYekuAMXvmPv2C1IReuf8a5I7uKK
	 GJoCI/bHY9haMVIReHdKh0fDR8DfzHjYLrEBs72sHQ2qew4ntWiPTGg+rD/jMFGJOd
	 AUEqp1CEvkvzg==
Date: Wed, 21 Aug 2024 13:28:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Lei Liu <liulei.rjpt@vivo.com>
Subject: Re: [PATCH 4/5] usb: mpfs: Use devm_clk_get_enabled() helpers
Message-ID: <20240821-velocity-tribune-726bb3546ba8@spud>
References: <20240821121048.31566-1-liulei.rjpt@vivo.com>
 <20240821121048.31566-5-liulei.rjpt@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bcJo4N/CZuvGrFHi"
Content-Disposition: inline
In-Reply-To: <20240821121048.31566-5-liulei.rjpt@vivo.com>
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
Cc: linux-arm-kernel@lists.infradead.org, opensource.kernel@vivo.com, linux-usb@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Daire McNamara <daire.mcnamara@microchip.com>, Neal Liu <neal_liu@aspeedtech.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-riscv@lists.infradead.org, Andrew Jeffery <andrew@codeconstruct.com.au>, Robert Jarzmik <robert.jarzmik@free.fr>, Bin Liu <b-liu@ti.com>, Daniel Mack <daniel@zonque.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--bcJo4N/CZuvGrFHi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 08:10:42PM +0800, Lei Liu wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
>=20
> This simplifies the code and avoids calls to clk_disable_unprepare().
>=20
> Signed-off-by: Lei Liu <liulei.rjpt@vivo.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--bcJo4N/CZuvGrFHi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsXdbAAKCRB4tDGHoIJi
0vQXAPsFPWs5/bU//KkusZ+fex1LjVZZPj1iKD46J4gSjA3/IgEAmb8f82SYq0M7
5hCZmy+8jLkn5UKZOkLGj2pA+UNHXw0=
=TKQo
-----END PGP SIGNATURE-----

--bcJo4N/CZuvGrFHi--
