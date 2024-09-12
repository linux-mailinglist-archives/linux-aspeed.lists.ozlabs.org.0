Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73668975ECF
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 04:16:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X41KH0cDNz2yS0
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 12:16:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726107409;
	cv=none; b=IL9dNWQrCketcZQp85oQH7rJ95e87vHG4iptgN9XQ9DBdf44RVoOsDcbViu8zYKtqmXUDtyvVXQsYViHNZq7J3ob3unatRngJeCAvIoMnOqVQ/jm51vg08hMLZCug22yFS2mjfLlwIAg7iyuQzdGkvazRc/Kf4PnL22nn8uebTsTrDYidPWmIp02SAYq4NOcZnhCtwBFVg/xYjUt6HScX0w48xL/U/oZt8247KY2VXYq3uoe6PhgucdM5NoOananqxHaC+ebhpCYwcgjNoCO3oPrBhNhWoI+ysRGulDb507LarGuLVTuxi6BmW9yw4nVZSPF+UIEKwOCTTEG1US4YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726107409; c=relaxed/relaxed;
	bh=dTGWD0Gn+Yi/RRB39Ic05wD/vXoyL7B1/d6vhk5Cy3w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KW1zOIkTKIRWpWP3GwicXkDjxJR21OphLBYARC2bl9BH9nPKyyJico5NWhr0ij42/BzP3nSOaClPBTuoxD1uq9Qq3QRym5JoN89+v5SE4IlvcBBlFm0AMuQ3qIVz5+aDyGPwsSWkRh7XOPmUIwdY6kCUURjpIsmKP7OyEcEN768xYNeuJ8IOcAwWtvxTWfL+reOKC+hVvHEUkMguHS0p6jY2MwVGl+R0eaiLDaDVD6K1oQRUNGG0K7ZxIbrhvOpeaWMkvtA+uGB8JFEQU86xj+jZcayV48KanMTc/SrJywgTiMyaf0c+/r3cfOPotKm6JnIWfXC/+0kztMA75rxShw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=UWlhUR4k; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=UWlhUR4k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X41KF2ydpz2xmh
	for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Sep 2024 12:16:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726107408;
	bh=dTGWD0Gn+Yi/RRB39Ic05wD/vXoyL7B1/d6vhk5Cy3w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UWlhUR4kacrXMMr2rVhZkPbmfXUDEaLDt0sgF7YKt8aeR2BiebejEq1g8TC3GlEra
	 ++wdggIEtNkwpIA8zpgXUkgVvoRvb/cyH2vZW4AIbJ59zHAc6f0YNklc3mrrFWJgX4
	 db/kntu0OAts7HlM38nLtFf6bK0PVSUTVgFlxNDn6JR7Y4N7WThLSkgtWIY7PZ84t/
	 j0r3mapTb7LZKT687nj6I4IMmFVq8vZkBti+N21/ZTzNu9oA2NeZE2LL4wweTC4WKB
	 X6+JZaKtG4NGP/kTJFh7b6QM/039wx3cfHwonfP8k0b/NMSaP6eAkVuFPozY7QMxrr
	 Nc7RxDnBUH6LQ==
Received: from [192.168.68.112] (ppp118-210-89-8.adl-adc-lon-bras32.tpg.internode.on.net [118.210.89.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 13AB9650D6;
	Thu, 12 Sep 2024 10:16:48 +0800 (AWST)
Message-ID: <215e32abc38011a5e265d91340292234ca157ec8.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1] ARM: dts: aspeed: yosemite4: Revise quad mode to
 dual mode
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Thu, 12 Sep 2024 11:46:47 +0930
In-Reply-To: <20240910051350.2580971-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240910051350.2580971-1-Delphine_CC_Chiu@wiwynn.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 2024-09-10 at 13:13 +0800, Delphine CC Chiu wrote:
> From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
>=20
> Revise quad mode to dual mode to avoid WP pin influnece the SPI.
>=20
> Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  .../arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index 98477792aa00..3073ade6d77c 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -105,15 +105,17 @@ flash@0 {
>  		status =3D "okay";
>  		m25p,fast-read;
>  		label =3D "bmc";
> -		spi-rx-bus-width =3D <4>;
> +		spi-tx-bus-width =3D <2>;
> +		spi-rx-bus-width =3D <2>;
>  		spi-max-frequency =3D <50000000>;
> -#include "openbmc-flash-layout-64.dtsi"
> +#include "openbmc-flash-layout-128.dtsi"

This is a bit more drastic than changing the bus mode.

Can you please split that out to a separate change with some
justification in the commit message? For instance, was the chip changed
too? Or were you using the 64M layout or a 128M chip the whole time?

Andrew
