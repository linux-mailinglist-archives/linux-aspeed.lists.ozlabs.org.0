Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E20F9787BA
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Sep 2024 20:22:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X52jX6n8Fz2ywh
	for <lists+linux-aspeed@lfdr.de>; Sat, 14 Sep 2024 04:22:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726251771;
	cv=none; b=UcDf/5oqpn/fxwtwurMS9R3Nq2FVvdAmnow91o1O+jZ9LXsPSDxOjDNO7DdoRZ1j6gM0ZcBVCJJcLhDJmCr2I+xhfm9UAOpLf6NVpxNaBvErNec5vAsxEGfc7Bpm0YOKozbqZOmBd4CYE48wovw63UAEHubUe/KHUHA7qF2appCwHnwMuIFl8dEkXCfkswe9movVKOBdIe8l8n3JnFM8j/+gAfrlD5Z7GHO8AwQ76+jtIHhmWqKLzw/Mvx/VfEnVOwLmVKhwishT7+B4Ihe9VPgHd6vLUjvxaon+X2hSzgr15qcGpjabcWqOYeTtBa7aStiH6Bv3cNOJHtuT9xFzLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726251771; c=relaxed/relaxed;
	bh=jE+LkE/GlxxxXS2sFFMatGgGcsp8+WN8tBPvxibbjNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2ohd/q3zz9xAtnodhjJRzeC7rdw9SA2sxo+2e78E9J13mbUkgoLXrcQ93RlZfYLqwkF3Vau9zdAVjZ31d7s0iKMQCsVuNI3fNsVcIhZLaDlw5P7TT1lgAYBDtLK+AenRY0+kgjmr1tsORQCMi7evqbkw5pxDwyEJLqurX71LR8CvoRuOtmXhVy6/ZUD4JC5282NuPg13w02+PEZ/Ho+ZXJXoiD1du8kTarbnSJ/IgO+Km9KdUJpDCLa0w4cnkYjq1jt4DP5en9SXM1S1nJl0kUw7Z0KCSF2BRa22icbCfhyAH6jeI0aRVsG9rOYZ2IwkglNRbDnH6MPK62cmSRZ0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U2L3trD9; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U2L3trD9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X52jR13NTz2yFD
	for <linux-aspeed@lists.ozlabs.org>; Sat, 14 Sep 2024 04:22:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DC751A44401;
	Fri, 13 Sep 2024 18:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614D7C4CEC0;
	Fri, 13 Sep 2024 18:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726251768;
	bh=jE+LkE/GlxxxXS2sFFMatGgGcsp8+WN8tBPvxibbjNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U2L3trD9OLdQuIgpQE3ohbntUQa/rm0t7Ual0AgT9rA85tRGnYbfnseRsuChBN3w/
	 yJo/5pF860m+j+0aVsqtW9Cf9bxOF0co6XaL4AcWzzahD/poPSp/cjATKAW8hcdmA5
	 yNVrxkdWcsNOvJEpW/eyeOc8GkextREBehBX8qYbOaWxNykH5CJ6RLWy0uYfrYrASP
	 msu12cR53WXFawLkKc73hkXCw05HVrRgurfOiIfRewiEZ33D+gMQyIjHvzLbrFIHW7
	 i5SyDhaiJTyvUMu/hkz9FB+dfl5uKlgncImR5GDkWztxWpJTcn17Tc0ByvxOT2ZtHD
	 wh8AOH1mV6WHA==
Date: Fri, 13 Sep 2024 19:22:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: gpio: aspeed,ast2400-gpio: Support
 ast2700
Message-ID: <20240913-swipe-crummiest-0d449f2e3314@spud>
References: <20240913074325.239390-1-billy_tsai@aspeedtech.com>
 <20240913074325.239390-2-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yr6ZZcr6IEzTYaC7"
Content-Disposition: inline
In-Reply-To: <20240913074325.239390-2-billy_tsai@aspeedtech.com>
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, Peter.Yin@quantatw.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, BMC-SW@aspeedtech.com, krzk+dt@kernel.org, brgl@bgdev.pl, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--yr6ZZcr6IEzTYaC7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 03:43:20PM +0800, Billy Tsai wrote:
> The AST2700 is the 7th generation SoC from Aspeed, featuring two GPIO
> controllers: one with 12 GPIO pins and another with 216 GPIO pins.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--yr6ZZcr6IEzTYaC7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuSC8wAKCRB4tDGHoIJi
0q3PAQC+/acGGSL2QPDUEaNfdNP0E6QO4gxyHGWHPni0w3cXZwEA90qz6xLtwZmg
8iPP+K7iuHz0tAtAnMP7TYFSWOkA4QU=
=2i7K
-----END PGP SIGNATURE-----

--yr6ZZcr6IEzTYaC7--
