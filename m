Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 480C59175A7
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 03:30:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=h8tBGxgR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W84064rgQz3fnS
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 11:30:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=h8tBGxgR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W84011wK2z3fm4
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 11:30:40 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 673A820009;
	Wed, 26 Jun 2024 09:30:36 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1719365438;
	bh=X7FD5oPv28K3sYjsKRmxtB3gZH81Qm9pRxGi9lHMBZI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=h8tBGxgRPSDXyEaS+3XN2CMKE6rsFD+erg3JYsLIiR2ICZ5WkHG/t4Ufi4P5BH9/4
	 Wo5AHi/oSm9GHwzc3EvzMh+wjC23WbywSwe3mY1g7ZpBO9dbD+gUpgtE7S41Fr4vG+
	 1x9bKnuITzfo0t0s1OPlwTqDDETsJ5h66HkNHbA77cC9x2amCOhSrkR7Wm2eSXOAT2
	 PdJBMVK35Hmd1qCQs93gcHZGYKc9tOTerrR6/I+2V6bFXdP0CMOF3Hf8Ofu6rAWSMB
	 Wbj7jSPSjeUK/ZNazF8PVCYy0qTh8D8dg1GpK6zo1Wiowmh4rCgeiBd9dsa9sFkEer
	 yHMvBHsH/JLHA==
Message-ID: <4391083991a16c435c5d8849eb5ee2be2f03793c.camel@codeconstruct.com.au>
Subject: Re: [PATCH 02/17] ARM: dts: aspeed: minerva: Add spi-gpio
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Yang Chen <yangchen.openbmc@gmail.com>, joel@jms.id.au,
 patrick@stwcx.xyz,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Date: Wed, 26 Jun 2024 11:00:35 +0930
In-Reply-To: <20240625121835.751013-3-yangchen.openbmc@gmail.com>
References: <20240625121835.751013-1-yangchen.openbmc@gmail.com>
	 <20240625121835.751013-3-yangchen.openbmc@gmail.com>
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
Cc: Jerry.Lin@quantatw.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 2024-06-25 at 20:18 +0800, Yang Chen wrote:
> From: Yang Chen <yang.chen@quantatw.com>
>=20
> Add spi-gpio for TPM device.
>=20
> Signed-off-by: Yang Chen <yang.chen@quantatw.com>
> ---
>  .../aspeed/aspeed-bmc-facebook-minerva.dts    | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
> index e20e31917d6c..7d96a3638448 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
> @@ -22,6 +22,8 @@ aliases {
>  		i2c19 =3D &imux19;
>  		i2c20 =3D &imux20;
>  		i2c21 =3D &imux21;
> +
> +		spi1 =3D &spi_gpio;
>  	};
> =20
>  	chosen {
> @@ -49,6 +51,25 @@ led-fan-fault {
>  			default-state =3D "off";
>  		};
>  	};
> +
> +	spi_gpio: spi-gpio {
> +		status =3D "okay";
> +		compatible =3D "spi-gpio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		gpio-sck =3D <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
> +		gpio-mosi =3D <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
> +		gpio-miso =3D <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
> +		num-chipselects =3D <1>;
> +		cs-gpios =3D <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
> +
> +		tpmdev@0 {
> +			compatible =3D "infineon,slb9670", "tcg,tpm_tis-spi";
> +			spi-max-frequency =3D <33000000>;
> +			reg =3D <0>;
> +		};
> +	};

I poked at your series with the following script:

```
$ cat dtb-check
#!/usr/bin/bash

set -euo pipefail

DTB=3D"$1"

rm -f arch/arm/boot/dts/"$DTB"
make CHECK_DTBS=3Dy "$DTB" 2>&1 |
    sed "/should not be valid under {'type': 'object'}/d" > curr.log
diff -u ref.log curr.log
```

I ran this after creating a reference output prior to your series using
the same `make CHECK_DTBS=3Dy` command.

This patch gave the following output (which I expect Rob's bot will
follow up with at some point as well):

```
--- ref.log     2024-06-26 10:48:23.767078834 +0930
+++ curr.log    2024-06-26 10:55:56.857034132 +0930
@@ -1,4 +1,6 @@
   DTC_CHK arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb
+/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts=
/aspeed/aspeed-bmc-facebook-minerva.dtb: /: spi-gpio: {'status': ['okay'], =
'compatible': ['spi-gpio'], '#address-cells': [[1]], '#size-cells': [[0]], =
'gpio-sck': [[62, 203, 0]], 'gpio-mosi': [[62, 204, 0]], 'gpio-miso': [[62,=
 205, 0]], 'num-chipselects': [[1]], 'cs-gpios': [[62, 200, 1]], 'tpmdev@0'=
: {'compatible': ['infineon,slb9670', 'tcg,tpm_tis-spi'], 'spi-max-frequenc=
y': [[33000000]], 'reg': [[0]]}} is not of type 'array'
+       from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.y=
aml#
 /home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts=
/aspeed/aspeed-bmc-facebook-minerva.dtb: timer: 'clocks' does not match any=
 of the regexes: 'pinctrl-[0-9]+'
        from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer=
.yaml#
 /home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts=
/aspeed/aspeed-bmc-facebook-minerva.dtb: sdram@1e6e0000: compatible: ['aspe=
ed,ast2600-sdram-edac', 'syscon'] is too long
@@ -38,3 +40,17 @@
        from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-f=
si-master.yaml#
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /ahb/apb/fsi@1e7=
9b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-mas=
ter', 'fsi-master']
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /ahb/apb/dma-con=
troller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2=
600-udma']
+/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts=
/aspeed/aspeed-bmc-facebook-minerva.dtb: spi-gpio: $nodename:0: 'spi-gpio' =
does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
+       from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
+/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts=
/aspeed/aspeed-bmc-facebook-minerva.dtb: spi-gpio: gpio-sck: False schema d=
oes not allow [[62, 203, 0]]
+       from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
+/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts=
/aspeed/aspeed-bmc-facebook-minerva.dtb: spi-gpio: gpio-miso: False schema =
does not allow [[62, 205, 0]]
+       from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
+/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts=
/aspeed/aspeed-bmc-facebook-minerva.dtb: spi-gpio: gpio-mosi: False schema =
does not allow [[62, 204, 0]]
+       from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
+/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts=
/aspeed/aspeed-bmc-facebook-minerva.dtb: spi-gpio: 'sck-gpios' is a require=
d property
+       from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
+/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts=
/aspeed/aspeed-bmc-facebook-minerva.dtb: spi-gpio: Unevaluated properties a=
re not allowed ('#address-cells', '#size-cells', 'gpio-miso', 'gpio-mosi', =
'gpio-sck', 'tpmdev@0' were unexpected)
+       from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
+/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts=
/aspeed/aspeed-bmc-facebook-minerva.dtb: tpmdev@0: $nodename:0: 'tpmdev@0' =
does not match '^tpm(@[0-9a-f]+)?$'
+       from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm_tis-spi.=
yaml#
```

Can you please address these and go over the rest of the patches to
shore them up against the current bindings?

Thanks,

Andrew
