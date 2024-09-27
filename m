Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8F0987DF1
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2024 07:46:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFKFx26Fwz30Tc
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2024 15:46:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727415969;
	cv=none; b=eGQQYgPa4r1ae4PE0QKxiV4Y+q1KMNrd8fzcc7C0gZyKgwanhw+Wfd/X9dOXl1gxR21rWBDqBRziEpBVGe4eOnbxKjFvrzT1q/mgThpBv8ixIMQ/UJx68d7UwAdPJ9iOrzv7Gn4IKDZ2uHcBuH5SAZd2I/TtWENm5vevMngkTlZtn+ipX5XUtoYL5HLFaFydaqHsEKJWYwWNRXWAZ1SPn5G6Slb2XAHFeoOkH0PvbPPz6ovRPrHisGhyDPL3guC1LMvYP9LREK6uIJAqiiEWWhggMyoNJjMDcoMyBBfQt4D/fnsEYQk9223BrOmWrJlFMNrNalImkpf47zKUiUle/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727415969; c=relaxed/relaxed;
	bh=lR8CM85Fsk5eJ3v/EmZG9zqhCtPYW4GlO6MdtlhMpMA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e/dhXSKRUJt7eRgBEmIcw7Odz8qUNWfqLMbFmgA/fL6/yFqp5uOPEcqMXtSUmLHx/mDZWVskIDS+77zBimW+QViXR9waOdG9e2niS+vuOwCv9kZzjEhK2k9eBQUBp/DkSlOat7pMKZ2kvEmTX11mQJ4EdVwNfz+w7BF54qH/r9Za92EBLQanDC3bbXEkoV/mAXH9mIGVTxusnnoPHP0ntwmW8Qs0tCtUs+/3aRecTyP2v7we4Q1gJAmr3cKZPpvmVL8wqJ6dPMCb8zKA3SteXzWdUbIKbDadodWybvlRo5HlZBhKz997ksLqyaKBCFlWJAOXWKuO8sjK9aacHelVTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RsMFxn+1; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RsMFxn+1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFKFs6gZHz2yDS
	for <linux-aspeed@lists.ozlabs.org>; Fri, 27 Sep 2024 15:46:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727415969;
	bh=lR8CM85Fsk5eJ3v/EmZG9zqhCtPYW4GlO6MdtlhMpMA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RsMFxn+1eaz5Dmg6g4v32cjJXYgtYvMCKwIrjOZHe7HXrUGL/pYVBTWkkC0NNL76d
	 SffmDO/0TS1XSFQwTxf971qlXDnC5Z7f+eHXZFpw41p/DJ2VWaLjBo0Otnf9Dl7BSS
	 yUM6UwiRZthYPewTL05yDyhege6GorRtYnxe4Zo0Jihelwndyl/dI/yzg/KAY0a1Ny
	 7yHpM0rIpFr/66CkN26t+/MwU+jc0Rmt8jkhpTPU+gxg8yymdIrwVoULSx5c0loOHi
	 31i0gQhKl9lmVXvQDlNhw+3qZiHLh20UHw/qPoleYzbULpbJOa/+PxATqu1qY1UWYj
	 jG3yKUX/qxFkg==
Received: from [192.168.68.112] (ppp118-210-187-73.adl-adc-lon-bras34.tpg.internode.on.net [118.210.187.73])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8919565029;
	Fri, 27 Sep 2024 13:46:08 +0800 (AWST)
Message-ID: <7a97e482c01a32d40fd2a70a839acf239ef28608.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 3/5] ARM: dts: aspeed: yosemite4: Change the address
 of Fan IC on fan boards
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Fri, 27 Sep 2024 15:16:06 +0930
In-Reply-To: <20240926032821.4171466-4-Delphine_CC_Chiu@wiwynn.com>
References: <20240926032821.4171466-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240926032821.4171466-4-Delphine_CC_Chiu@wiwynn.com>
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
> Change the address of Fan IC: Max31790 on fan boards according to
> schematic.
>=20
> Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 24 +++++++------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index 430c28bdd314..a7e51725c595 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -496,10 +496,8 @@ adc@1f {
>  			};
> =20
>  			pwm@20{
> -				compatible =3D "max31790";
> +				compatible =3D "maxim,max31790";

This isn't changing the address, it's fixing the compatible string.
Please make this a separate patch with an appropriate Fixes: tag.

>  				reg =3D <0x20>;
> -				#address-cells =3D <1>;
> -				#size-cells =3D <0>;

Maybe put this in the same patch as the compatible fix though, if it's
correct.

>  			};
> =20
>  			gpio@22{
> @@ -509,11 +507,9 @@ gpio@22{
>  				#gpio-cells =3D <2>;
>  			};
> =20
> -			pwm@23{
> -				compatible =3D "max31790";
> -				reg =3D <0x23>;
> -				#address-cells =3D <1>;
> -				#size-cells =3D <0>;
> +			pwm@2f{
> +				compatible =3D "maxim,max31790";
> +				reg =3D <0x2f>;
>  			};
> =20
>  			adc@33 {
> @@ -539,10 +535,8 @@ adc@1f {
>  			};
> =20
>  			pwm@20{
> -				compatible =3D "max31790";
> +				compatible =3D "maxim,max31790";
>  				reg =3D <0x20>;
> -				#address-cells =3D <1>;
> -				#size-cells =3D <0>;

As above for this diff hunk too.

Andrew

>  			};
> =20
>  			gpio@22{
> @@ -552,11 +546,9 @@ gpio@22{
>  				#gpio-cells =3D <2>;
>  			};
> =20
> -			pwm@23{
> -				compatible =3D "max31790";
> -				reg =3D <0x23>;
> -				#address-cells =3D <1>;
> -				#size-cells =3D <0>;
> +			pwm@2f{
> +				compatible =3D "maxim,max31790";
> +				reg =3D <0x2f>;
>  			};
> =20
>  			adc@33 {

