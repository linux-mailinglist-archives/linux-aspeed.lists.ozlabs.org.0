Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA34E913F8B
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Jun 2024 02:28:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ikWtRn7y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W6pjJ3M82z3cTf
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Jun 2024 10:28:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ikWtRn7y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W6pj76FSrz3c13
	for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Jun 2024 10:28:27 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5D51E2009F;
	Mon, 24 Jun 2024 08:28:18 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1719188905;
	bh=DKEYpgz0d3KtkghyncW6fFCgulDpzB03f6swFpdnWE8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ikWtRn7yN7Ise0vcKddcWtskvinN6xOYIvvgomBM0u3faQxCrY2BhN/6QG9cQYymI
	 Alg6XDXdF2cal8IZz2T3NcoiHNf1jq3vV1eVaC1NPkmOm9MiFlD3FUqHrVKnIW+4rR
	 tt/OZguADkA/5xfiWttYJ0l7RdJUTW0Zn4iyEFUoVwfEz3Zgi6f4xmaWoXv+lvkosu
	 rz69u2eveZL7rzRWySQh9cW3dHe2Srdfv4eOslqM2tuMZ8dCX1i/Zh87NvBxgPLchk
	 B1V0Gs9X5DvSkmbXBkaNMBlUTlOQtxETkNCbGsqMrTpUXEUFUJ6pgGyTZ0/TsNLdNc
	 WAT3bpeO9l2Jw==
Message-ID: <b522733009008a22dd8975a92ad6d0b1c038c452.camel@codeconstruct.com.au>
Subject: Re: [PATCH 01/10] iio: adc: aspeed_adc: use
 devm_regulator_get_enable_read_voltage()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: David Lechner <dlechner@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>
Date: Mon, 24 Jun 2024 09:58:17 +0930
In-Reply-To: <20240621-iio-regulator-refactor-round-2-v1-1-49e50cd0b99a@baylibre.com>
References: 	<20240621-iio-regulator-refactor-round-2-v1-0-49e50cd0b99a@baylibre.com>
	 <20240621-iio-regulator-refactor-round-2-v1-1-49e50cd0b99a@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: linux-aspeed@lists.ozlabs.org, Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Mark Brown <broonie@kernel.org>, Andreas Klinger <ak@it-klinger.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2024-06-21 at 17:11 -0500, David Lechner wrote:
> This makes use of the devm_regulator_get_enable_read_voltage() helper
> function to simplify the code.
>=20
> The error return is moved closer to the function call to make it easier
> to follow the logic. And a few blank lines are added for readability.
>=20
> Signed-off-by: David Lechner <dlechner@baylibre.com>

Nice cleanup!

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

