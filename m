Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9874987DEE
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2024 07:43:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFKBs6TYZz30Tc
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2024 15:43:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727415810;
	cv=none; b=g1B9morKHQC/HZwRZ6+wCFbS9zXWCaM72rmICkNp6fr2NyJv5qrvlUEuBmXvTDhn4P/hEievtOcDj7ITHwQ3UoUESLdXd/OGevzSJ4toJbzr7GDmDCNf6lTBytyuPWnOK0qQwas6pTrZD4UzSA8B56rv/RveIosLEu2eRQTaQbTCL/jBrQyMUewQFECfadjcvyMHed9StdjGhDWGEo5BXpDJxxh3Ya0C3uO+iWOw8/eA15fD9E2NXh74gEmHf+uClv8Kg0sQkXQULbOUvmHt43bT88OsaBPpQ3TExhPTEh4+ay+kEG2EEjs4NWpxeVy893bpMu+rEV7Ev1Rwxstszw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727415810; c=relaxed/relaxed;
	bh=hmM9nard7C236jMcmPNo75yk3HSeZ0dMHaCt6a0p4X4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UKNKlITUPNnqufn3y3o8f096I/y9JTQ7wk/w9T57d9gh4l1kvUKKcsZ63YCbxetFjt49Tb8EOrkj9sDbicDTNaQwNyzcrBNAh6OQggs9oyM+eJpn3wGxYNurnU5VQwoeSHAZn7ohKrFvU79OOzlB+1M+BfwajSqhA5OvHvfSsuqF83OUoBmS0bvl37dWD7VdhMyo+FSQm46txrWbm6dyEOPogXhIahIjxL8AtCzpgGAU0BtQfOvKzk7G/iHUiUTInjYPqSq57dZC1/xaknbXet/YhII7ZS418YU9gZvdXhB+tF/wUnO7bo5LASDpkYf8cwxwAtqDzipHtFQ92qXImg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=I6Lrnbrc; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=I6Lrnbrc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFKBp1YX6z2yDS
	for <linux-aspeed@lists.ozlabs.org>; Fri, 27 Sep 2024 15:43:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727415809;
	bh=hmM9nard7C236jMcmPNo75yk3HSeZ0dMHaCt6a0p4X4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=I6LrnbrcjS+t9cKS5+t1QWpHB3ZXrTfGOVlCEgIdfLk6TaC0UZAKI2xk1rP6Z+73i
	 JxTyr/pUssnJRw4c0sBqQOQ9xV9S2jn50Qw5A0XaME0quauF1Hz+xboRulGZlEGQ2i
	 bv16X3GZF1ftMpVT+XqjLazEvmZW89kll1D3jqyoVq42KXecBi9rjCG5XZfoALQvV/
	 B0/Y6CV4Q9A+0xjOrAbZPbwFKFSjU9Ql/G+9dv72pEOS8gU5lymdPLwnJenbn3IEx3
	 AIQRMK48KR4HjPCKCQdkbG5vP9VnzrTSNAP3H/PE5QfnObT3jQ4DKnmFcRMacrW2l6
	 FdCAxfwYFlLxg==
Received: from [192.168.68.112] (ppp118-210-187-73.adl-adc-lon-bras34.tpg.internode.on.net [118.210.187.73])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D890965029;
	Fri, 27 Sep 2024 13:43:28 +0800 (AWST)
Message-ID: <0e9483a19f916982ba6996b81c2f1254da3801f3.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 2/5] ARM: dts: aspeed: yosemite4: remove led gpio
 pca9552 on fan boards
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Fri, 27 Sep 2024 15:13:26 +0930
In-Reply-To: <20240926032821.4171466-3-Delphine_CC_Chiu@wiwynn.com>
References: <20240926032821.4171466-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240926032821.4171466-3-Delphine_CC_Chiu@wiwynn.com>
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

On Thu, 2024-09-26 at 11:28 +0800, Delphine CC Chiu wrote:
> From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
>=20
> Remove led gpio contorller: pca9552 on fan boards since there is
> no binding document for pca9552 currently.

That's not true, there is, just it's not converted to dt-schema:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/bindings/leds/leds-pca955x.txt?h=3Dv6.11

So the nodes can stay, though they probably generate warnings. The
right way to fix this is to convert the binding document.

Andrew

>=20
> Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  .../aspeed/aspeed-bmc-facebook-yosemite4.dts   | 18 ------------------
>  1 file changed, 18 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index 04f6378c2b5f..430c28bdd314 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -525,15 +525,6 @@ eeprom@52 {
>  				compatible =3D "atmel,24c128";
>  				reg =3D <0x52>;
>  			};
> -
> -			gpio@61 {
> -				compatible =3D "nxp,pca9552";
> -				reg =3D <0x61>;
> -				#address-cells =3D <1>;
> -				#size-cells =3D <0>;
> -				gpio-controller;
> -				#gpio-cells =3D <2>;
> -			};
>  		};
> =20
>  		imux31: i2c@1 {
> @@ -577,15 +568,6 @@ eeprom@52 {
>  				compatible =3D "atmel,24c128";
>  				reg =3D <0x52>;
>  			};
> -
> -			gpio@61 {
> -				compatible =3D "nxp,pca9552";
> -				reg =3D <0x61>;
> -				#address-cells =3D <1>;
> -				#size-cells =3D <0>;
> -				gpio-controller;
> -				#gpio-cells =3D <2>;
> -			};
>  		};
>  	};
>  };

