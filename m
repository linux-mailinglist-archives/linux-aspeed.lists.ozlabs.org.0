Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 302F48D4FE1
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2024 18:32:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eKvxHvoM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqsHH026Sz3ckg
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 May 2024 02:32:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eKvxHvoM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqsH361f0z30TX
	for <linux-aspeed@lists.ozlabs.org>; Fri, 31 May 2024 02:32:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 873F5CE0BDA;
	Thu, 30 May 2024 16:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E210C2BBFC;
	Thu, 30 May 2024 16:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717086743;
	bh=OTxGST8XNys/EMwG0Pwv+gYvKJ4FkO3COc6Hrnsr/N0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eKvxHvoM9L970qC3PjwvD1ebAgB5Vi646X7qIhRXWCXnd7/3doEc1y4ujhtgFhD8g
	 l/+ReQeD5E/fcCAcUmTpGfT4opDuTSLFcSruguuvMC20E2PxjrvBlCSHqAAV9KTboJ
	 dTJxgTFwui+e9wwVabEhdQbSGfESq48OKRRZ6BRylIv2I4EFhOrnU29AX5zdhZTFYk
	 b6jz8MQnCMTZJ4+SHtGwNLT+xHsvrlG7ulQQyTZ/iPaRv7ILgPVeA/JjQ2K/fdiTEz
	 ZcW0g3k43jd/iDhQanVRc/ABP4L7qbWHWj4qkbQZ76cFI2baA3NQNWGz9tQAdUrT0j
	 8qBv6ZvTLmf1w==
Date: Thu, 30 May 2024 17:32:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/2] dt-bindings: gpio: aspeed,sgpio: Specify
 #interrupt-cells
Message-ID: <20240530-italics-ultra-6322f9475567@spud>
References: <20240530-dt-warnings-gpio-sgpio-interrupt-cells-v2-0-912cd16e641f@codeconstruct.com.au>
 <20240530-dt-warnings-gpio-sgpio-interrupt-cells-v2-2-912cd16e641f@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xWG7h6S3iMDrMBsD"
Content-Disposition: inline
In-Reply-To: <20240530-dt-warnings-gpio-sgpio-interrupt-cells-v2-2-912cd16e641f@codeconstruct.com.au>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--xWG7h6S3iMDrMBsD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 11:09:49AM +0930, Andrew Jeffery wrote:
> Squash warnings such as:
>=20
>     arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: sgpio@1e780200: '#in=
terrupt-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
>=20
> Also, mark #interrupt-cells as required. The kernel devicetrees already
> specified it where compatible nodes were defined, and u-boot pulls in
> the kernel devicetrees, so this should have minimal practical impact.
>=20
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--xWG7h6S3iMDrMBsD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZliqEwAKCRB4tDGHoIJi
0qKtAQDGasgNuDwkEHMlzMlvShE+BwoFZbZJcIXDNIgOUmaUgAEAvGgvfp+FbII6
TqchReUrnKMkeo00YnftuwduREe17gk=
=emAm
-----END PGP SIGNATURE-----

--xWG7h6S3iMDrMBsD--
