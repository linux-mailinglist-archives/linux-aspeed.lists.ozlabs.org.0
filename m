Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1DE975ED4
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 04:19:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X41NH3mNXz2yRP
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 12:19:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726107566;
	cv=none; b=ZdQMbq3MeUTxLpjxJ0sQmcLUXUfIAT/fGUVWhV5j1xdiE1qJI3tiyTkXN4hLuP5KgSitskSvhYWyYsP/QqgxbUEVyV53v/al3d011q+tQvXt7EhDDvx2ewGrhGQq7OWaNYKdOlVU4l/5R7U3rMPjZX1/eZfQDPh5uMCjQcHO+1b8NjXd39u3+N9vpwcmGI7VmHDik33lP4SXCrt0caczUIQTOwR1xNMjG8Mlr1N/EXZWsEYUfS5xQjdcuXBtDv14yQSpZ+XyD2rt6/HUxJ0y3TG6kszzN3x+5dgchvPOJhUdeXlwXlru8jiJbFjwyus7k+KoRm7Ta0G/CRU4MqAE0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726107566; c=relaxed/relaxed;
	bh=ipltQWMwxD1LeV+oKdLSFHbv43Qowb0JPJe2RinWwYo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YISgimTZ3gBSCW6i1N6TkkoV2INhFGUTMveYLiaSNdoZCxrUgVjVFSE2v2MtaSBbomcTRvlk9Gt0QRRTHuIQY5M/0EXwlrJAUAr+oBIMAd/bAQx/i2QQSQ95DeijJf2wVBaJhztPB9aKKiw+wsxHjmOo9P37nPgxBq/p14bO16RhSQLE955c0znv81i41b+XvO69e8ujVa4Cg9aMNN/pVAq977HyPnVojfCwmPiTWB3WWo04s6sxCF5g7xKlCzow9/YJSNATaQTE/YhbHO71sEVSu0pVU+dcsI4OVJoPdn/OGrbw96INPkvR0RSYLZzlSeDLTHl6jchQ31CJDhFXmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=nYm0mDHT; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=nYm0mDHT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X41NG1ZsWz2xmh
	for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Sep 2024 12:19:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726107565;
	bh=ipltQWMwxD1LeV+oKdLSFHbv43Qowb0JPJe2RinWwYo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=nYm0mDHTJQ09HXajwVGyc/Q11zzgDlq+Y8IIwyDDuJeDTAyg/vA5BbpHxdFYEW9Mb
	 AEqUuhEXp/TjE73BF0Z3T64UyZjwJX3IMlH81qoBv5tft/OINmb3addy58zHUiss31
	 8QYjiEEOoP5vlEWVzwsTtG1ZC0hyMx42S6n10EWSf+x4YE3dCQ+NK7Fi60pe/wgGnq
	 zjvEysFysrnifPwx68cA4WHzC4Hqv7oakCfXMEB8A4HiHIISci6CFjhNzenbyRM/1b
	 YbBGg0iBe9mRUItZLcm/RYTkxIoS9q3IvAcPBr+dOeK1U6Vx+U7qWcikfwunFGt1OF
	 sYJiZqMVphLPQ==
Received: from [192.168.68.112] (ppp118-210-89-8.adl-adc-lon-bras32.tpg.internode.on.net [118.210.89.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DED3B650D6;
	Thu, 12 Sep 2024 10:19:24 +0800 (AWST)
Message-ID: <63ce2d4b7edc52952a5f1bb97eb4dc8e7305045f.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1] ARM: dts: aspeed: yosemite4: Enable spi-gpio setting
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Thu, 12 Sep 2024 11:49:24 +0930
In-Reply-To: <20240910030324.2256698-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240910030324.2256698-1-Delphine_CC_Chiu@wiwynn.com>
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

On Tue, 2024-09-10 at 11:03 +0800, Delphine CC Chiu wrote:
> From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
>=20
> Enable spi-gpio setting for spi flash in yosemite4.

Is there actually a flash chip on the same bus? You've only described a
TPM. If there's no flash then this seems misleading.

Andrew

> Add tpm device under spi.
>=20
> Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  .../aspeed/aspeed-bmc-facebook-yosemite4.dts   | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index 98477792aa00..fdf9040d655b 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -34,6 +34,24 @@ iio-hwmon {
>  				<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
>  				<&adc1 0>, <&adc1 1>;
>  	};
> +
> +	spi {
> +		compatible =3D "spi-gpio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		sck-gpios =3D <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
> +		mosi-gpios =3D <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
> +		miso-gpios =3D <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
> +		cs-gpios =3D <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
> +		num-chipselects =3D <1>;
> +
> +		tpm@0 {
> +			reg =3D <0>;
> +			compatible =3D "infineon,slb9670", "tcg,tpm_tis-spi";
> +			spi-max-frequency =3D <33000000>;
> +		};
> +	};
>  };
> =20
>  &uart1 {

