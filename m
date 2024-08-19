Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC33956099
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Aug 2024 02:46:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnDSX4t4rz2y1b
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Aug 2024 10:46:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=d6FSQom6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnDST6vHDz2xMW
	for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Aug 2024 10:46:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1724028409;
	bh=bGQ/6crBzg1SbZu2JoYzHaThvgd+RzBseuDcIcIe2/c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=d6FSQom6vPscKpKyn+aa9H1ffN0cbZnR+trtLKlJP5NDfPyXrBiZQKZHvEEEW85t6
	 YFAQQUpeLSJOlDDeUIPSTY/thcWl/Afekd5eOmH3A1abvnSzvZGkwVVE8rIKVEqvOg
	 Jh69GK+5eFcvKtqIzjzpfIPRo349wiljHq4PwcK00STHCyFKA7XWIxHw2JDhIUJeBt
	 W7NV3CVCBOtnwrP1J/EolVj9wSUAKqwcaRIoLgjmWqdxXtJPH0MPP/fwx5gl1P/20X
	 KqfQsR0gvSqdGd8jP3edagqSwQz1ovZ3UFm8/41GJwfVrKc9g18SwD9jCTxyd0c13U
	 Xm/18aoskkNrQ==
Received: from [192.168.68.112] (ppp118-210-94-119.adl-adc-lon-bras32.tpg.internode.on.net [118.210.94.119])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2CC2A64BE9;
	Mon, 19 Aug 2024 08:46:48 +0800 (AWST)
Message-ID: <aa4a9c154f54a2f1b5b55fa80bdd2e14aa3d1b3b.camel@codeconstruct.com.au>
Subject: Re: [PATCH v12 18/28] ARM: dts: aspeed: yosemite4: add mctp config
 for NIC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Mon, 19 Aug 2024 10:16:47 +0930
In-Reply-To: <20240816092417.3651434-19-Delphine_CC_Chiu@wiwynn.com>
References: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240816092417.3651434-19-Delphine_CC_Chiu@wiwynn.com>
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
> add mctp config for NIC
>=20
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index b46a0b9940e2..7b8a2384d99d 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -1281,40 +1281,64 @@ imux24: i2c@0 {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
>  			reg =3D <0>;
> +			mctp-controller;
>  			temperature-sensor@1f {
>  				compatible =3D "ti,tmp421";
>  				reg =3D <0x1f>;
>  			};
> +
> +			temperature-sensor@3c {
> +				compatible =3D "smsc,emc1403";
> +				reg =3D <0x3c>;
> +			};

These nodes are unrelated to MCTP? Given we're assembling the puzzle
via the jigsaw pieces in the rest of the series, please split the
addition of these nodes out to a separate patch.

Further, the EMC1403 compatible is undocumented as of v6.11-rc1, and a
brief search didn't turn up anything on the lists. Please send a patch
adding it to the trivial-devices binding document.

Andrew
