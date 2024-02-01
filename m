Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F58F84510E
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Feb 2024 06:53:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DM8xbrHo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQSkn2jCBz3btk
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Feb 2024 16:53:37 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DM8xbrHo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQSkj1hDlz3bl6
	for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Feb 2024 16:53:33 +1100 (AEDT)
Received: from [192.168.68.112] (ppp14-2-76-194.adl-apt-pir-bras31.tpg.internode.on.net [14.2.76.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B8E6E2017A;
	Thu,  1 Feb 2024 13:53:31 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1706766812;
	bh=rI8P+diGy8KEwpMykWyWoBLcsgBDvjFoVkDPmpqeTSo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DM8xbrHotWktCfZXqrNxsoWb3wCYAx/NrtfEqSeuDwct39ip1/+neHABCwpE1PWY8
	 6XgRKKHOUT4STg71WQcjkOP46UCu7Ljr2DtDi8TGwNomsg/iF6G2WT8X1cP5bXJRIu
	 mky4vsFVfHQxIM87mm4Y7FZHXZRn79FOqG08yT9CcaYCpNAhiZgmAX0j4U1hzPxcVO
	 3HlpUJuGWy/NaQ1KbvCrMa8vlAfhzmYk3x1rXfsm06Gcckf1tRjXmsFE0IFclEHM0Y
	 K7zkrx64iWCMyJVUfg/V9joGg3hdN13JVQQ5Jaw3VThqnZH8sSibP0wdLmTPYYT9jV
	 oo1Jdmd+hhDAw==
Message-ID: <6f39a2cc2a853b45624553d5fdc66c3b65830721.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 18/21] ARM: dts: aspeed: yosemite4: add mctp config
 for NIC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>
Date: Thu, 01 Feb 2024 16:23:31 +1030
In-Reply-To: <20240131084134.328307-19-Delphine_CC_Chiu@wiwynn.com>
References: <20240131084134.328307-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240131084134.328307-19-Delphine_CC_Chiu@wiwynn.com>
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
> add mctp config for NIC

How does this integrate into the MCTP network(s)? It would be good to
have more of a description.

>=20
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
> Changelog:
>   - v4
>     - Revise device node name
>   - v2
>     - Add patch for NIC mctp config
> ---
>  .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index 7c7c9e85bb92..b9b6fe729cd6 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -1273,40 +1273,64 @@ imux24: i2c@0 {
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

This is unrelated to the MCTP configuration? Same with the other nodes
in the patch.

Andrew
