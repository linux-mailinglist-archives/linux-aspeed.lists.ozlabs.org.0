Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6662B8B2E24
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 02:51:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=b6a2416l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQZ1P00Lvz3dJn
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 10:51:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=b6a2416l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQZ1H4kK0z3cWH
	for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Apr 2024 10:51:47 +1000 (AEST)
Received: from [192.168.68.112] (ppp14-2-127-66.adl-apt-pir-bras32.tpg.internode.on.net [14.2.127.66])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 24E3520075;
	Fri, 26 Apr 2024 08:51:45 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1714092706;
	bh=NjN94PFfnv6THIE12/NBk/TDDVzgTTDfDSVQBicYRvE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=b6a2416lbz7mwL8wx+7sgO3FUkis1MId3UUgDxuD6EpdYUYxhzohbdYxqPn5+2xQR
	 WjVOC05Ss/4rHEkaDG3gpIOED+vJpUI/0EL83bN8wCWRXK9TJnI/Ybs+sSewfMlL9B
	 boHOJauKugnsic95tjgZfArNMpp/nzVIjVSKSuyxq7I3RvqrOw3B3r3T5NXmxwCsFg
	 YyzdayD7A87o3QwP2A4oDjC0nWHoEovlOdR3+cftfHxjNOk51SZseM7sdVQVSx/zB0
	 s91YIj4gKRCsYrM5SszT4SA5SAnAIs9CfTy2+UZqU2fVmnGBmM27d9GluFrRzER9Lv
	 mb5CwqvpsPtNw==
Message-ID: <f355ad1adb96cd8398c4ac81d1c72df289a2aaf0.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 1/2] Revise mux and hardware in yosemite4 dts
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Fri, 26 Apr 2024 10:21:45 +0930
In-Reply-To: <20240425060626.2558515-2-Delphine_CC_Chiu@wiwynn.com>
References: <20240425060626.2558515-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240425060626.2558515-2-Delphine_CC_Chiu@wiwynn.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 2024-04-25 at 14:06 +0800, Delphine CC Chiu wrote:
> ARM: dts: aspeed: yosemite4:

This should be in the patch subject, not the body of the commit
message.

> Change hardware configuration, consequently modifying the mux in the dts.

Perhaps "We have a new iteration of the hardware design, so update the
devicetree to match."?

>=20
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>

Overall it feels a bit untidy updating the description of distinct
devices in the one patch.

> ---
>  .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 78 ++++++++++++++-----
>  1 file changed, 58 insertions(+), 20 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index 64075cc41d92..e45293762316 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -433,16 +433,14 @@ eeprom@51 {
>  		reg =3D <0x51>;
>  	};
> =20
> -	i2c-mux@71 {
> -		compatible =3D "nxp,pca9846";
> +	i2c-mux@74 {
> +		compatible =3D "nxp,pca9546";
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> -
> -		idle-state =3D <0>;
>  		i2c-mux-idle-disconnect;
> -		reg =3D <0x71>;
> +		reg =3D <0x74>;
> =20
> -		i2c@0 {
> +		inux30: i2c@0{

'inux'? 'imux'?

>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
>  			reg =3D <0>;
> @@ -450,26 +448,46 @@ i2c@0 {
>  			adc@1f {
>  				compatible =3D "ti,adc128d818";
>  				reg =3D <0x1f>;
> -				ti,mode =3D /bits/ 8 <2>;
> +				ti,mode =3D /bits/ 8 <1>;
>  			};
> =20
>  			pwm@20{
> -				compatible =3D "max31790";
> -				reg =3D <0x20>;
> +				compatible =3D "maxim,max31790";

This looks like a change motivated by binding validation or a driver
change rather than hardware design :)

>  				#address-cells =3D <1>;
>  				#size-cells =3D <0>;
> +				reg =3D <0x20>;
> +				channel@4 {
> +					reg =3D <4>;
> +					sensor-type =3D "TACH";
> +				};
> +
> +				channel@5 {
> +					reg =3D <5>;
> +					sensor-type =3D "TACH";
> +				};
>  			};
> =20
>  			gpio@22{
>  				compatible =3D "ti,tca6424";
>  				reg =3D <0x22>;
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
>  			};
> =20
> -			pwm@23{
> -				compatible =3D "max31790";
> -				reg =3D <0x23>;
> +			pwm@2f{
> +				compatible =3D "maxim,max31790";

Again here

Andrew
