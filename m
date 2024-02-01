Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6745584500F
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Feb 2024 05:13:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=VnYHnXB7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQQW31xB6z3cSN
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Feb 2024 15:13:19 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=VnYHnXB7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQQVy2SCNz3byP
	for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Feb 2024 15:13:14 +1100 (AEDT)
Received: from [192.168.68.112] (ppp14-2-76-194.adl-apt-pir-bras31.tpg.internode.on.net [14.2.76.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C628C200EF;
	Thu,  1 Feb 2024 12:13:12 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1706760793;
	bh=JrTUckIWEWBP1tWhndI3yPaxzsWNgqHzto5OnfAby40=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VnYHnXB7uAj3wQA79fcO77DWSSdw0fTW3EkFGRIm4Z3HNHQDRPK7S266+R7Ncx874
	 7dE3N4BLoaqBXwwx6/TzBcSHvSUmMBewIibuKlUnw3Tzc2r/EDHPSUnnWBdq81YEZ5
	 zLfvD08uHjXnHcoSbNnOxZHV8bAYg/nkl6lAXb+pOBzbX0XkczXggm3JQGCyXG6eD+
	 /fI2H8eUfZZh4FARE7qXYWc4+tEb+quObdrn5P38F5k7DiNdAcQFvt/o+dPj7aUxA4
	 WaAC23GE840kyrJv84NefL34u3D6pxVWbtngnVEx6D/J4LoPq0aFxUiGs1BH8pfHuW
	 G+tJIRD9s3sgw==
Message-ID: <3050b9cb85cc2d308ada602794fd2ba09014334f.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 02/21] ARM: dts: aspeed: yosemite4: Enable adc15
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>
Date: Thu, 01 Feb 2024 14:43:12 +1030
In-Reply-To: <20240131084134.328307-3-Delphine_CC_Chiu@wiwynn.com>
References: <20240131084134.328307-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240131084134.328307-3-Delphine_CC_Chiu@wiwynn.com>
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

On Wed, 2024-01-31 at 16:41 +0800, Delphine CC Chiu wrote:
> Enable Yosemite 4 adc15 config

This should have a description. What's motivating the change? Why make
it? What are we monitoring with ADC15? Why wasn't it necessary
previously?

The expectations on commit messages are outlined here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/process/submitting-patches.rst?h=3Dv6.7#n45

Andrew

>=20
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index dac58d3ea63c..6846aab893ad 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -51,7 +51,7 @@ iio-hwmon {
>  		compatible =3D "iio-hwmon";
>  		io-channels =3D <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
>  				<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
> -				<&adc1 0>, <&adc1 1>;
> +				<&adc1 0>, <&adc1 1>, <&adc1 7>;
>  	};
>  };
> =20
> @@ -920,10 +920,10 @@ &pinctrl_adc4_default &pinctrl_adc5_default
>  &adc1 {
>  	ref_voltage =3D <2500>;
>  	status =3D "okay";
> -	pinctrl-0 =3D <&pinctrl_adc8_default &pinctrl_adc9_default>;
> +	pinctrl-0 =3D <&pinctrl_adc8_default &pinctrl_adc9_default
> +	    &pinctrl_adc15_default>;
>  };
> =20
> -
>  &ehci0 {
>  	status =3D "okay";
>  };

