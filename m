Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1598CE975
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 May 2024 20:26:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YseXi/5h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VmCyG6p9Xz87c8
	for <lists+linux-aspeed@lfdr.de>; Sat, 25 May 2024 04:20:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YseXi/5h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VmCy640dLz87bJ
	for <linux-aspeed@lists.ozlabs.org>; Sat, 25 May 2024 04:20:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1890762818;
	Fri, 24 May 2024 18:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B13E7C2BBFC;
	Fri, 24 May 2024 18:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716574804;
	bh=+8Fbxlx5eo/oIR6yTo80tZtLDDGQUpDOc4GEdoiNLys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YseXi/5h2BMoThQr36j8Sb1Zo9jVbI43GB4WuAYe+GZ1F6tIpcKa95PSSl1ckFHub
	 EPSwqSZV+4kazDQtmalMcKzBTHJ067ZGR2tU7+w3zRizrVb5jqind3yJ/LGz+r3x8r
	 CTSDG/SQoQprTgjvkjxoebwN+bGMjHn2fVCipOvGH2/a5nqkLbgrqVQ6w+l9nErGXH
	 aHRsGhwx9GdEXJYUTihb2qY1LLYKp/hPHxbRzlsMWm/SQwDB5pKMcMCgsR4TnmcNkA
	 MM/yYOpAnYogBJuJnGztg8+LCh6tJNVO7O9aqVNFU5gbMjaLcGBRxjELoH+TNFtcUc
	 LrIOscbZ2nGBg==
Date: Fri, 24 May 2024 19:20:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Naresh Solanki <naresh.solanki@9elements.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: aspeed: add IBM SBP1 board
Message-ID: <20240524-engraving-scrimmage-4b7e470fe5db@spud>
References: <20240524105929.557129-1-naresh.solanki@9elements.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ikdhEzjYvs4Y3VNX"
Content-Disposition: inline
In-Reply-To: <20240524105929.557129-1-naresh.solanki@9elements.com>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--ikdhEzjYvs4Y3VNX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 04:29:23PM +0530, Naresh Solanki wrote:
> Document the new compatibles used on IBM SBP1.
>=20
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--ikdhEzjYvs4Y3VNX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlDaUAAKCRB4tDGHoIJi
0ke8AP9eoKw/VC5gTmKmKg2tNZmY6NF7Daql17nntRTwULugFQD+MOhoqb2A5sgU
zkv569pLnAS+0M+eL6heZfvgEmS8eww=
=UaWu
-----END PGP SIGNATURE-----

--ikdhEzjYvs4Y3VNX--
