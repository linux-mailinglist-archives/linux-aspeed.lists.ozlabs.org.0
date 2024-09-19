Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 810C797C266
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 03:22:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8Hnb0s57z2yFJ
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 11:22:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726708957;
	cv=none; b=kx3jiyq+iCviXE47kkmosgNB7s0Gqgv8mNeKqFBOenZf5eZj4bKn4zUowxBEYXnoKlQKtT0MFu9iRZYWOIRl/mcN/GP0VaBprQbPQUXGM+DRsFHNSljgrbFxR8HoNH0Y6Q9i5npangFX6q+yKWHKwUeDOu9msNN7BMae45UswLeR0ci7QwT+z5EsUF/f8VQXwChNLUvEX8Ycw4Kb2CutXsrjYHS0hm+jZQhP8NPIo4PNAXSNlGwv1VeDIeqls9H/FpcSdBJRXlim+qzW2M5yrsBaa3VzYhxzx4M92V1hWdO5LRgVzuFLAADzQaKtjGp51d7TixR8T8YQeOIBWsqUiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726708957; c=relaxed/relaxed;
	bh=Q9bLimoZ5dqO/v/xStiEtBFXXxiEU7NxX3hkGV7VX/4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TssolNxi1PlLSsgybCtI6CyBAVHu+MpFYNXkthidr5rcYxD5l0VH8RX9xRtVbY/duEUAvXtKO7acJ+FtpAYNH0xS9T3nG3qUyEYYccMo76q25flapa0C3XSdWdvgHP0LNN+QCmbzbe9yZlQFQbzGPSpZyTL6SbqO2AkE7wHib0KIiYC0fCX/JfUMiACGAebBvHdR7/uZOeHL9ie36f/29NaUEw7Vuo0V0jF19vbjHUDgZunyw0FRJVrJUnE3MBhefCb1oXATVO2M+LO5HPafALtZwPT6ALW2pcSNXmAXpdF44zrTlQPdQAaMHmc6GjlGlzpRQz5aodsiVXCZuFR0OQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=nQiCg+Jw; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=nQiCg+Jw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8HnT0Sq3z2xDM
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Sep 2024 11:22:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726708955;
	bh=Q9bLimoZ5dqO/v/xStiEtBFXXxiEU7NxX3hkGV7VX/4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=nQiCg+JwJb/V4sGdSmNJ3xEHu9mtyIOtCwDxbSWQ76UXYP+XVeBk3rKqwz3OUw26i
	 B3Uh7p7Se6Kk15jEjrlERxP3FOSn6Zt5lzNMa24SUk4h4e0qHs0L3q4z9PfgyDQjI8
	 yA0bfCBJKbplMl2lfcqTQp9psRYryV8O+ZVrPHXLQ1npr5RLO8e/443pDH9rjKgSCA
	 eOWLb2Khz8AWakal2b8PCLPnsRtfwVcJZFJehBxlwyIG+UpyZQyPFD4z4ACEpwy35b
	 3wPFTTJMAALOCNdH3wB5GYm5oQ3kc5t06MfUk8RXNtVCIg84TTKV93++/sZDLFTf8L
	 w3qPq6AubH1vw==
Received: from [192.168.238.88] (ppp118-210-188-185.adl-adc-lon-bras34.tpg.internode.on.net [118.210.188.185])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5A09965027;
	Thu, 19 Sep 2024 09:22:27 +0800 (AWST)
Message-ID: <11a0ae09bc722b1f21ae76df99bd8c1d885c85d1.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 3/3] ARM: dts: aspeed: yosemite4: Add power module
 and ADC on Medusa Board
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Thu, 19 Sep 2024 10:52:24 +0930
In-Reply-To: <20240918095438.1345886-4-Delphine_CC_Chiu@wiwynn.com>
References: <20240918095438.1345886-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240918095438.1345886-4-Delphine_CC_Chiu@wiwynn.com>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Peter Yin <peteryin.openbmc@gmail.com>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org, Noah Wang <noahwang.wang@outlook.com>, Lukas Wunner <lukas@wunner.de>, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Ricky,

On Wed, 2024-09-18 at 17:54 +0800, Delphine CC Chiu wrote:
> From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
>=20
> Add RTQ6056 as 2nd source ADC sensor on Medusa Board.

Can you unpack why this is related in the commit message? I assume it's
for something like battery monitoring? An explanation would help
though.

> Add power sensors on Medusa board:
> - Add XDP710 as 2nd source HSC to monitor P48V PSU power.
> - Add MP5023 as P12V efuse (Driver exists but un-documented).
> - Add PMBUS sensors as P12V Delta Module.

Generally if you're listing multiple things the change does in the
commit message you should have split the patch up accordingly.

There's some good advice here:

https://docs.kernel.org/process/5.Posting.html#patch-preparation

and here:

https://github.com/axboe/liburing/blob/master/CONTRIBUTING.md?plain=3D1#L21=
-L32

>=20
> Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 45 ++++++++++++++++++-
>  1 file changed, 43 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index 98477792aa00..e486b9d78f61 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -284,15 +284,25 @@ &i2c10 {
>  &i2c11 {
>  	status =3D "okay";
>  	power-sensor@10 {
> -		compatible =3D "adi, adm1272";
> +		compatible =3D "adi,adm1272";
>  		reg =3D <0x10>;
>  	};

This was outright busted. The hunk is a fix, as is the second instance
below. Please separate these out into their own patch and add a Fixes:
tag to it.

> =20
> +	power-sensor@11 {
> +		compatible =3D "infineon,xdp710";
> +		reg =3D <0x11>;
> +	};
> +
>  	power-sensor@12 {
> -		compatible =3D "adi, adm1272";
> +		compatible =3D "adi,adm1272";

(i.e. this one also)

>  		reg =3D <0x12>;
>  	};
> =20
> +	power-sensor@13 {
> +		compatible =3D "infineon,xdp710";
> +		reg =3D <0x13>;
> +	};
> +
>  	gpio@20 {
>  		compatible =3D "nxp,pca9555";
>  		reg =3D <0x20>;
> @@ -321,6 +331,17 @@ gpio@23 {
>  		#gpio-cells =3D <2>;
>  	};
> =20
> +	power-sensor@40 {
> +		compatible =3D "mps,mp5023";
> +		reg =3D <0x40>;
> +	};
> +
> +	adc@41 {
> +		compatible =3D "richtek,rtq6056";
> +		reg =3D <0x41>;
> +		#io-channel-cells =3D <1>;
> +	};
> +
>  	temperature-sensor@48 {
>  		compatible =3D "ti,tmp75";
>  		reg =3D <0x48>;
> @@ -345,6 +366,26 @@ eeprom@54 {
>  		compatible =3D "atmel,24c256";
>  		reg =3D <0x54>;
>  	};
> +
> +	power-sensor@62 {
> +		compatible =3D "pmbus";
> +		reg =3D <0x62>;
> +	};
> +
> +	power-sensor@64 {
> +		compatible =3D "pmbus";
> +		reg =3D <0x64>;
> +	};
> +
> +	power-sensor@65 {
> +		compatible =3D "pmbus";
> +		reg =3D <0x65>;
> +	};
> +
> +	power-sensor@68 {
> +		compatible =3D "pmbus";
> +		reg =3D <0x68>;
> +	};

See the discussion on your proposed DT binding document; I expect these
will need to change.

Andrew
