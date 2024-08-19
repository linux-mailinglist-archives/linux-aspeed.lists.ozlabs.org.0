Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7C095609C
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Aug 2024 02:56:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnDgP4rx6z2y2B
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Aug 2024 10:56:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=CL+tRS4c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnDgM4CZLz2xMW
	for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Aug 2024 10:56:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1724028975;
	bh=QKEzQuAn3wAo7of8JrYw5j4T4w4srW9b5VgYcJjtbpE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CL+tRS4ckqlYYd8Lank1rQklmbFYyrtgFSlt5vLkmfoCLHOL8dFuU1EcS34SaYCZK
	 UUsZWjRyTbJn3JciTLcrLjAek3Jp1f3yKzEv1Yuu9/JVBWWQ0it9d67LnLyTZa46jm
	 ZE4AGzLqBq2VU1Skl1Z6L2rz1tavslffd7M+/68uWEBonNYUbzUJGlWSwkmOrTuYMx
	 t/P1SfFzSLlp+VzNCz69Sr8TnAPjqIROPk87l5PEiBe7xn1KJqYlVF4PQ8WCp+4li4
	 uciERl65TZuUpNNKpxswlVsfwlu+/jp5rmrU1Vrb4uO4POBVtfZY4DQWFjGCqT/0ab
	 37UQl289nOM7Q==
Received: from [192.168.68.112] (ppp118-210-94-119.adl-adc-lon-bras32.tpg.internode.on.net [118.210.94.119])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1FD8964BE9;
	Mon, 19 Aug 2024 08:56:13 +0800 (AWST)
Message-ID: <96c1ab665e28f49b5f52b0bc3397280a47edbbb5.camel@codeconstruct.com.au>
Subject: Re: [PATCH v12 28/28] ARM: dts: aspeed: yosemite4: fix GPIO
 linename typo
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Mon, 19 Aug 2024 10:26:13 +0930
In-Reply-To: <20240816092417.3651434-29-Delphine_CC_Chiu@wiwynn.com>
References: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240816092417.3651434-29-Delphine_CC_Chiu@wiwynn.com>
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

On Fri, 2024-08-16 at 17:24 +0800, Delphine CC Chiu wrote:
> Fix GPIO linename typo and add missing GPIO pin initial state.
>=20
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 554 ++++++++++++++----
>  1 file changed, 455 insertions(+), 99 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index abd4a9173de4..4090725160f9 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -285,6 +285,8 @@ &mac2 {
>  	pinctrl-0 =3D <&pinctrl_rmii3_default>;
>  	use-ncsi;
>  	mellanox,multi-host;
> +	ncsi-ctrl,start-redo-probe;
> +	ncsi-ctrl,no-channel-monitor;
>  };
> =20
>  &mac3 {
> @@ -293,6 +295,8 @@ &mac3 {
>  	pinctrl-0 =3D <&pinctrl_rmii4_default>;
>  	use-ncsi;
>  	mellanox,multi-host;
> +	ncsi-ctrl,start-redo-probe;
> +	ncsi-ctrl,no-channel-monitor;
>  };
> =20
>  &fmc {
> @@ -327,6 +331,13 @@ mctp@10 {
>  		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
>  	};
> =20
> +	gpio@24 {
> +		compatible =3D "nxp,pca9506";
> +		reg =3D <0x24>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +
>  	gpio@21 {
>  		compatible =3D "nxp,pca9506";
>  		reg =3D <0x21>;
> @@ -348,13 +359,6 @@ gpio@23 {
>  		#gpio-cells =3D <2>;
>  	};
> =20
> -	gpio@24 {
> -		compatible =3D "nxp,pca9506";
> -		reg =3D <0x24>;
> -		gpio-controller;
> -		#gpio-cells =3D <2>;
> -	};
> -
>  	power-sensor@40 {
>  		compatible =3D "adi,adm1281", "mps,mp5990";
>  		reg =3D <0x40>;
> @@ -373,6 +377,13 @@ mctp@10 {
>  		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
>  	};
> =20
> +	gpio@24 {
> +		compatible =3D "nxp,pca9506";
> +		reg =3D <0x24>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +
>  	gpio@21 {
>  		compatible =3D "nxp,pca9506";
>  		reg =3D <0x21>;
> @@ -394,13 +405,6 @@ gpio@23 {
>  		#gpio-cells =3D <2>;
>  	};
> =20
> -	gpio@24 {
> -		compatible =3D "nxp,pca9506";
> -		reg =3D <0x24>;
> -		gpio-controller;
> -		#gpio-cells =3D <2>;
> -	};
> -
>  	power-sensor@40 {
>  		compatible =3D "adi,adm1281", "mps,mp5990";
>  		reg =3D <0x40>;
> @@ -419,6 +423,13 @@ mctp@10 {
>  		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
>  	};
> =20
> +	gpio@24 {
> +		compatible =3D "nxp,pca9506";
> +		reg =3D <0x24>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +
>  	gpio@21 {
>  		compatible =3D "nxp,pca9506";
>  		reg =3D <0x21>;
> @@ -440,13 +451,6 @@ gpio@23 {
>  		#gpio-cells =3D <2>;
>  	};
> =20
> -	gpio@24 {
> -		compatible =3D "nxp,pca9506";
> -		reg =3D <0x24>;
> -		gpio-controller;
> -		#gpio-cells =3D <2>;
> -	};
> -
>  	power-sensor@40 {
>  		compatible =3D "adi,adm1281", "mps,mp5990";
>  		reg =3D <0x40>;
> @@ -465,6 +469,13 @@ mctp@10 {
>  		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
>  	};
> =20
> +	gpio@24 {
> +		compatible =3D "nxp,pca9506";
> +		reg =3D <0x24>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +
>  	gpio@21 {
>  		compatible =3D "nxp,pca9506";
>  		reg =3D <0x21>;
> @@ -486,13 +497,6 @@ gpio@23 {
>  		#gpio-cells =3D <2>;
>  	};
> =20
> -	gpio@24 {
> -		compatible =3D "nxp,pca9506";
> -		reg =3D <0x24>;
> -		gpio-controller;
> -		#gpio-cells =3D <2>;
> -	};
> -
>  	power-sensor@40 {
>  		compatible =3D "adi,adm1281", "mps,mp5990";
>  		reg =3D <0x40>;
> @@ -511,6 +515,13 @@ mctp@10 {
>  		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
>  	};
> =20
> +	gpio@24 {
> +		compatible =3D "nxp,pca9506";
> +		reg =3D <0x24>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +
>  	gpio@21 {
>  		compatible =3D "nxp,pca9506";
>  		reg =3D <0x21>;
> @@ -532,13 +543,6 @@ gpio@23 {
>  		#gpio-cells =3D <2>;
>  	};
> =20
> -	gpio@24 {
> -		compatible =3D "nxp,pca9506";
> -		reg =3D <0x24>;
> -		gpio-controller;
> -		#gpio-cells =3D <2>;
> -	};
> -
>  	power-sensor@40 {
>  		compatible =3D "adi,adm1281", "mps,mp5990";
>  		reg =3D <0x40>;
> @@ -557,6 +561,13 @@ mctp@10 {
>  		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
>  	};
> =20
> +	gpio@24 {
> +		compatible =3D "nxp,pca9506";
> +		reg =3D <0x24>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +
>  	gpio@21 {
>  		compatible =3D "nxp,pca9506";
>  		reg =3D <0x21>;
> @@ -578,13 +589,6 @@ gpio@23 {
>  		#gpio-cells =3D <2>;
>  	};
> =20
> -	gpio@24 {
> -		compatible =3D "nxp,pca9506";
> -		reg =3D <0x24>;
> -		gpio-controller;
> -		#gpio-cells =3D <2>;
> -	};
> -
>  	power-sensor@40 {
>  		compatible =3D "adi,adm1281", "mps,mp5990";
>  		reg =3D <0x40>;
> @@ -603,6 +607,13 @@ mctp@10 {
>  		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
>  	};
> =20
> +	gpio@24 {
> +		compatible =3D "nxp,pca9506";
> +		reg =3D <0x24>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +
>  	gpio@21 {
>  		compatible =3D "nxp,pca9506";
>  		reg =3D <0x21>;
> @@ -624,13 +635,6 @@ gpio@23 {
>  		#gpio-cells =3D <2>;
>  	};
> =20
> -	gpio@24 {
> -		compatible =3D "nxp,pca9506";
> -		reg =3D <0x24>;
> -		gpio-controller;
> -		#gpio-cells =3D <2>;
> -	};
> -
>  	power-sensor@40 {
>  		compatible =3D "adi,adm1281", "mps,mp5990";
>  		reg =3D <0x40>;
> @@ -649,6 +653,13 @@ mctp@10 {
>  		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
>  	};
> =20
> +	gpio@24 {
> +		compatible =3D "nxp,pca9506";
> +		reg =3D <0x24>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +
>  	gpio@21 {
>  		compatible =3D "nxp,pca9506";
>  		reg =3D <0x21>;
> @@ -670,13 +681,6 @@ gpio@23 {
>  		#gpio-cells =3D <2>;
>  	};
> =20
> -	gpio@24 {
> -		compatible =3D "nxp,pca9506";
> -		reg =3D <0x24>;
> -		gpio-controller;
> -		#gpio-cells =3D <2>;
> -	};
> -
>  	power-sensor@40 {
>  		compatible =3D "adi,adm1281", "mps,mp5990";
>  		reg =3D <0x40>;
> @@ -687,6 +691,7 @@ power-sensor@40 {
>  &i2c8 {
>  	status =3D "okay";
>  	bus-frequency =3D <400000>;
> +	i2c-clk-high-min-percent =3D <40>;
>  	i2c-mux@70 {
>  		compatible =3D "nxp,pca9544";
>  		i2c-mux-idle-disconnect;
> @@ -798,6 +803,7 @@ eeprom@54 {
>  &i2c9 {
>  	status =3D "okay";
>  	bus-frequency =3D <400000>;
> +	i2c-clk-high-min-percent =3D <40>;
>  	i2c-mux@71 {
>  		compatible =3D "nxp,pca9544";
>  		i2c-mux-idle-disconnect;
> @@ -993,7 +999,7 @@ power-sensor@13 {
>  		reg =3D <0x13>;
>  	};
> =20
> -	gpio@20 {
> +	gpio_ext1: pca9555@20 {
>  		compatible =3D "nxp,pca9555";
>  		pinctrl-names =3D "default";
>  		gpio-controller;
> @@ -1012,7 +1018,7 @@ gpio@20 {
>  		"","";
>  	};
> =20
> -	gpio@21 {
> +	gpio_ext2: pca9555@21 {
>  		compatible =3D "nxp,pca9555";
>  		pinctrl-names =3D "default";
>  		gpio-controller;
> @@ -1031,7 +1037,7 @@ gpio@21 {
>  		"","";
>  	};
> =20
> -	gpio@22 {
> +	gpio_ext3: pca9555@22 {
>  		compatible =3D "nxp,pca9555";
>  		pinctrl-names =3D "default";
>  		gpio-controller;
> @@ -1050,7 +1056,7 @@ gpio@22 {
>  		"PWRGD_P12V_AUX_0","PWRGD_P12V_AUX_1";
>  	};
> =20
> -	gpio@23 {
> +	gpio_ext4: pca9555@23 {
>  		compatible =3D "nxp,pca9555";
>  		pinctrl-names =3D "default";
>  		gpio-controller;
> @@ -1070,21 +1076,21 @@ gpio@23 {
>  	};
> =20
>  	power-sensor@40 {
> -		compatible =3D "mps,mp5023";
> -		reg =3D <0x40>;
> +			compatible =3D "mps,mp5023";
> +			reg =3D <0x40>;
>  	};
> =20
>  	power-sensor@41 {
> -			compatible =3D "ti,ina233";
> -			resistor-calibration =3D /bits/ 16 <0x0a00>;
> -			current-lsb=3D /bits/ 16 <0x0001>;
> -			reg =3D <0x41>;
> +		compatible =3D "ti,ina233";
> +		resistor-calibration =3D /bits/ 16 <0x0a00>;
> +		current-lsb=3D /bits/ 16 <0x0001>;
> +		reg =3D <0x41>;
>  	};
> =20
>  	power-sensor@44 {
> -			compatible =3D "ti,ina238";
> -			shunt-resistor =3D <1000>;
> -			reg =3D <0x44>;
> +		compatible =3D "ti,ina238";
> +		shunt-resistor =3D <1000>;
> +		reg =3D <0x44>;
>  	};
> =20
>  	temperature-sensor@48 {
> @@ -1156,33 +1162,32 @@ rtc@6f {
>  				compatible =3D "nuvoton,nct3018y";
>  				reg =3D <0x6f>;
>  			};
> -
>  			gpio@20 {
> -				compatible =3D "nxp,pca9506";
> -				reg =3D <0x20>;
> -				gpio-controller;
> -				#gpio-cells =3D <2>;
> +					compatible =3D "nxp,pca9506";
> +					reg =3D <0x20>;
> +					gpio-controller;
> +					#gpio-cells =3D <2>;
>  			};
> =20
>  			gpio@21 {
> -				compatible =3D "nxp,pca9506";
> -				reg =3D <0x21>;
> -				gpio-controller;
> -				#gpio-cells =3D <2>;
> +					compatible =3D "nxp,pca9506";
> +					reg =3D <0x21>;
> +					gpio-controller;
> +					#gpio-cells =3D <2>;
>  			};
> =20
>  			gpio@22 {
> -				compatible =3D "nxp,pca9506";
> -				reg =3D <0x22>;
> -				gpio-controller;
> -				#gpio-cells =3D <2>;
> +					compatible =3D "nxp,pca9506";
> +					reg =3D <0x22>;
> +					gpio-controller;
> +					#gpio-cells =3D <2>;
>  			};
> =20
>  			gpio@23 {
> -				compatible =3D "nxp,pca9506";
> -				reg =3D <0x23>;
> -				gpio-controller;
> -				#gpio-cells =3D <2>;
> +					compatible =3D "nxp,pca9506";
> +					reg =3D <0x23>;
> +					gpio-controller;
> +					#gpio-cells =3D <2>;
>  			};
>  		};
> =20
> @@ -1242,35 +1247,35 @@ adc@37 {
>  	power-sensor@40 {
>  		compatible =3D "ti,ina233", "richtek,rtq6056";
>  		reg =3D <0x40>;
> -		resistor-calibration =3D /bits/ 16 <0x0a00>;
> +		resistor-calibration =3D /bits/ 16 <0x0400>;
>  		current-lsb=3D /bits/ 16 <0x0001>;
>  	};
> =20
>  	power-sensor@41 {
>  		compatible =3D "ti,ina233", "richtek,rtq6056";
>  		reg =3D <0x41>;
> -		resistor-calibration =3D /bits/ 16 <0x0a00>;
> +		resistor-calibration =3D /bits/ 16 <0x0400>;
>  		current-lsb=3D /bits/ 16 <0x0001>;
>  	};
> =20
>  	power-sensor@42 {
>  		compatible =3D "ti,ina233", "richtek,rtq6056";
>  		reg =3D <0x42>;
> -		resistor-calibration =3D /bits/ 16 <0x0a00>;
> +		resistor-calibration =3D /bits/ 16 <0x0400>;
>  		current-lsb=3D /bits/ 16 <0x0001>;
>  	};
> =20
>  	power-sensor@43 {
>  		compatible =3D "ti,ina233", "richtek,rtq6056";
>  		reg =3D <0x43>;
> -		resistor-calibration =3D /bits/ 16 <0x0a00>;
> +		resistor-calibration =3D /bits/ 16 <0x0400>;
>  		current-lsb=3D /bits/ 16 <0x0001>;
>  	};
> =20
>  	power-sensor@44 {
>  		compatible =3D "ti,ina233", "richtek,rtq6056";
>  		reg =3D <0x44>;
> -		resistor-calibration =3D /bits/ 16 <0x0a00>;
> +		resistor-calibration =3D /bits/ 16 <0x0400>;
>  		current-lsb=3D /bits/ 16 <0x0001>;
>  	};
> =20
> @@ -1323,6 +1328,42 @@ channel@5 {
>  				};
>  			};
> =20
> +			hwmon0: hwmon@21 {
> +				compatible =3D "nuvoton,nct7363";

It looks like this series didn't progress any further?

https://lore.kernel.org/all/20240322081158.4106326-2-kcfeng0@nuvoton.com/

Please drop these nodes for now and send a follow-up patch once the
driver and binding have been reworked and merged.

Andrew
