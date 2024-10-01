Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFA498B184
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 02:39:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHfG71Lf1z2yNG
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 10:39:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727743164;
	cv=none; b=cCYTgRmZtRbcE78y02SKNhbT80JB2tdZgYrwFKDWypWRWvNfH9p7BAd73yzAbK2Vlm8MLEyB8DDp5n/8tmHXby8UmBsbVhwQd31nX2S3/bss9jkE5izP6Vd/OeSCSUWniDh1TebFOOP7NBcq/3sJWtAdH6s3IdiK6EVfIAlWv1HDqZqC2vzc8YDTEKtTLBJTa6HMcRIIWF2FlZazpmdwTSwyUaudQWEnxAaIJ/o6kXO+RsSJIjix+3lM0F0t7hejmFdAujdefE1Dg3dpxrwo1leBJ6/QyyYR0F+ge09VCSGkEReoJnCxVBOFqOFyzvUwZ5z2xAJroINUQsVPwLuXgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727743164; c=relaxed/relaxed;
	bh=Ob0FYk4MOn2+/LkBSgodtWgm9m037MF4mRKnkQZryEo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aLj/ZkT9LjDMSK0SAkZZqJNjA3KuLAhb2ZsiTlDwRrHhc6f142Y8Mie5f6RlhonTckK894aChH5YW4sBEnFQ/lZ4NAGmu8uP9IMK6kO6lpLr7LFdm/smU8VGk39frqefuEb4oDNkXAsh00J5HAVp7xRhj7689k9xa6S5ApP2VCj9ENjcBFDe9GMqn+xVdnF8pCVOGrZy+K+WIXTGpti28/7fTfdS92aLE8FRvyut+a00DZrWWGNZcEhzJ4zppEnK2PxXnA5rrqFS1W+BCZVdKjw0aXPXRxRae6dVKP0bS/G2o/YdJYLDjvhS/llUoVuZG874rRWgFrlpusgwKnar6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=hM2AhVR1; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=hM2AhVR1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHfG46PRyz2yD8
	for <linux-aspeed@lists.ozlabs.org>; Tue,  1 Oct 2024 10:39:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727743164;
	bh=Ob0FYk4MOn2+/LkBSgodtWgm9m037MF4mRKnkQZryEo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hM2AhVR1q7U1Y+LIANn29DADLTYOwonQCe/iarbXLbuf8sv+cS8yUnvPZd9VcBhfq
	 nPEV4ibnLMtmEV0BppBpV84WMRbkbWTJmRKwVLo7ZDqRHKllnKFLdsUwEFnSOToV8Q
	 Rma+nAD9V/N2AAsXLxTDN2JRoRC/X1f8zI0/K4PpF6HP+YmrEGdsuYplfy/ldGfVS8
	 PtJsWJNhET5HwIYQIUrLahSzGlswOxd9DD7hjIF3TB6nm8vCS+bxmqV+kELUHKSm5M
	 /xSYui1c9fGOLNKSWUJzzuhRtdsZp/6uBdux9Nf8+G6XVC/gYXyxjZCmgBM/uv3rZg
	 HNX/o2llk3ctw==
Received: from [192.168.68.112] (ppp118-210-73-17.adl-adc-lon-bras32.tpg.internode.on.net [118.210.73.17])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7A7FE650AC;
	Tue,  1 Oct 2024 08:39:23 +0800 (AWST)
Message-ID: <9c0a5a8247622e094b927f2c26550d3ce9af5896.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 4/8] ARM: dts: aspeed: yosemite4: Revise address of
 i2c-mux for two fan boards
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Tue, 01 Oct 2024 10:09:22 +0930
In-Reply-To: <20240930070500.3174431-5-Delphine_CC_Chiu@wiwynn.com>
References: <20240930070500.3174431-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240930070500.3174431-5-Delphine_CC_Chiu@wiwynn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

On Mon, 2024-09-30 at 15:04 +0800, Delphine CC Chiu wrote:
> From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
>=20
> Change the address of the I2C mux for two fan boards to 0x74
> according to schematic.
>=20
> Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 80 ++++++++++---------
>  1 file changed, 43 insertions(+), 37 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index 26e0fcbed8d2..ecf012c9cbbc 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -32,6 +32,8 @@ aliases {
>  		i2c27 =3D &imux27;
>  		i2c28 =3D &imux28;
>  		i2c29 =3D &imux29;
> +		i2c30 =3D &imux30;
> +		i2c31 =3D &imux31;
>  		i2c34 =3D &imux34;
>  		i2c35 =3D &imux35;
>  	};
> @@ -1062,6 +1064,8 @@ gpio@23 {
>  };
> =20
>  &i2c14 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
>  	status =3D "okay";
>  	bus-frequency =3D <400000>;
>  	adc@1d {
> @@ -1122,20 +1126,50 @@ eeprom@51 {
>  		reg =3D <0x51>;
>  	};
> =20
> -	i2c-mux@71 {
> -		compatible =3D "nxp,pca9846";
> +	i2c-mux@73 {
> +		compatible =3D "nxp,pca9544";
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> =20
>  		idle-state =3D <0>;
>  		i2c-mux-idle-disconnect;
> -		reg =3D <0x71>;
> +		reg =3D <0x73>;
> =20
>  		i2c@0 {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
>  			reg =3D <0>;
> =20
> +			adc@35 {
> +				compatible =3D "maxim,max11617";
> +				reg =3D <0x35>;
> +			};
> +		};
> +
> +		i2c@1 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <0>;
> +
> +			adc@35 {
> +				compatible =3D "maxim,max11617";
> +				reg =3D <0x35>;
> +			};
> +		};
> +	};
> +
> +	i2c-mux@74 {
> +		compatible =3D "nxp,pca9546";
> +		reg =3D <0x74>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		i2c-mux-idle-disconnect;
> +
> +		imux30: i2c@0 {
> +			reg =3D <0>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
>  			adc@1f {
>  				compatible =3D "ti,adc128d818";
>  				reg =3D <0x1f>;
> @@ -1152,6 +1186,8 @@ pwm@20{
>  			gpio@22{
>  				compatible =3D "ti,tca6424";
>  				reg =3D <0x22>;
> +				gpio-controller;
> +				#gpio-cells =3D <2>;

This seems unrelated. Such changes should be in their own patch with a
`Fixes:` tag.

>  			};
> =20
>  			pwm@23{
> @@ -1181,10 +1217,10 @@ gpio@61 {
>  			};
>  		};
> =20
> -		i2c@1 {
> +		imux31: i2c@1 {
> +			reg =3D <1>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
> -			reg =3D <0>;
> =20
>  			adc@1f {
>  				compatible =3D "ti,adc128d818";
> @@ -1202,6 +1238,8 @@ pwm@20{
>  			gpio@22{
>  				compatible =3D "ti,tca6424";
>  				reg =3D <0x22>;
> +				gpio-controller;
> +				#gpio-cells =3D <2>;

This should go in the same patch as the instance above.

>  			};
> =20
>  			pwm@23{
> @@ -1231,38 +1269,6 @@ gpio@61 {
>  			};
>  		};
>  	};
> -
> -	i2c-mux@73 {
> -		compatible =3D "nxp,pca9544";
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
> -
> -		idle-state =3D <0>;
> -		i2c-mux-idle-disconnect;
> -		reg =3D <0x73>;
> -
> -		i2c@0 {
> -			#address-cells =3D <1>;
> -			#size-cells =3D <0>;
> -			reg =3D <0>;
> -
> -			adc@35 {
> -				compatible =3D "maxim,max11617";
> -				reg =3D <0x35>;
> -			};
> -		};
> -
> -		i2c@1 {
> -			#address-cells =3D <1>;
> -			#size-cells =3D <0>;
> -			reg =3D <0>;
> -
> -			adc@35 {
> -				compatible =3D "maxim,max11617";
> -				reg =3D <0x35>;
> -			};
> -		};
> -	};
>  };
> =20
>  &i2c15 {

