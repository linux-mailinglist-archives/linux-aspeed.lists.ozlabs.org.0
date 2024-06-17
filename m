Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BB490A787
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jun 2024 09:41:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=OveYK393;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2hf709bzz3fql
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jun 2024 17:41:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=OveYK393;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2hf01w6Sz3dS0
	for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jun 2024 17:41:28 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E152D2014F;
	Mon, 17 Jun 2024 15:41:27 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1718610088;
	bh=x9+zAFyMZm/7B6EtHFsboC7Irgy20gXAvPeF+y2R7t8=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=OveYK393V8uvj6JEsiSZT7QZl4vPieX0Ju+ZLvf5kbShLas6hXj4+QG7Dxwmt/92Y
	 H5iBzJlEahDYzQN2ilXXMdTYKofCyR997WswNQyaLjNrChXHXfefaytfdtnQaoRnyc
	 ZoQoOxgtLM70vjfv7lojCmbd2OTXZcUYLv9hZpYQUKR0bbvGHX2zvYP9Ooy+qO2t/k
	 a4UkFuKUSKcLo7ZQhZgEficn/6k/jIf6SbHT5EBCz+6aTkJ+ZWsCp9+nKjxfJTtiX8
	 JRWNJNYjUtF6FXOsJcPdpb3ni+CxTlsrInu/ubsTR/5GGups2Xrtk8EyFJvo26/+kx
	 RZ17kajnCs9aQ==
Message-ID: <643e0e9bbab98d442add8e6ef0c39c923942e9d0.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 7/7] ARM: dts: aspeed: Harma: remove pca9546
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Peter Yin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Mon, 17 Jun 2024 17:11:27 +0930
In-Reply-To: <20240613152425.1582059-8-peteryin.openbmc@gmail.com>
References: <20240613152425.1582059-1-peteryin.openbmc@gmail.com>
	 <20240613152425.1582059-8-peteryin.openbmc@gmail.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Peter,

On Thu, 2024-06-13 at 23:24 +0800, Peter Yin wrote:
> remove pca9546 and add Aegis fru device

Is there some relationship between these two things? Can you elaborate?

You also add a couple of GPIO expanders that aren't mentioned here?

Andrew

>=20
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> ---
>  .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 56 +++++++++----------
>  1 file changed, 25 insertions(+), 31 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arc=
h/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> index d892e646fced..4ff9e0104bbe 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> @@ -20,10 +20,6 @@ aliases {
>  		i2c21 =3D &imux21;
>  		i2c22 =3D &imux22;
>  		i2c23 =3D &imux23;
> -		i2c24 =3D &imux24;
> -		i2c25 =3D &imux25;
> -		i2c26 =3D &imux26;
> -		i2c27 =3D &imux27;
>  		i2c28 =3D &imux28;
>  		i2c29 =3D &imux29;
>  		i2c30 =3D &imux30;
> @@ -391,33 +387,6 @@ gpio@31 {
>  		"","","","";
>  	};
> =20
> -	i2c-mux@71 {
> -		compatible =3D "nxp,pca9546";
> -		reg =3D <0x71>;
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
> -
> -		imux24: i2c@0 {
> -			#address-cells =3D <1>;
> -			#size-cells =3D <0>;
> -			reg =3D <0>;
> -		};
> -		imux25: i2c@1 {
> -			#address-cells =3D <1>;
> -			#size-cells =3D <0>;
> -			reg =3D <1>;
> -		};
> -		imux26: i2c@2 {
> -			#address-cells =3D <1>;
> -			#size-cells =3D <0>;
> -			reg =3D <2>;
> -		};
> -		imux27: i2c@3 {
> -			#address-cells =3D <1>;
> -			#size-cells =3D <0>;
> -			reg =3D <3>;
> -		};
> -	};
>  	// PTTV FRU
>  	eeprom@52 {
>  		compatible =3D "atmel,24c64";
> @@ -427,6 +396,31 @@ eeprom@52 {
> =20
>  &i2c11 {
>  	status =3D "okay";
> +
> +	gpio@30 {
> +		compatible =3D "nxp,pca9555";
> +		reg =3D <0x30>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +	gpio@31 {
> +		compatible =3D "nxp,pca9555";
> +		reg =3D <0x31>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +
> +		gpio-line-names =3D
> +		"","","","",
> +		"","","presence-cmm","",
> +		"","","","",
> +		"","","","";
> +	};
> +
> +	// Aegis FRU
> +	eeprom@52 {
> +		compatible =3D "atmel,24c64";
> +		reg =3D <0x52>;
> +	};
>  };
> =20
>  &i2c12 {

