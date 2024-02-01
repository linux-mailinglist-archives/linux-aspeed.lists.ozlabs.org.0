Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E27098450E1
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Feb 2024 06:45:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=K9mqaiBt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQSYk18Bxz3cGv
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Feb 2024 16:45:46 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=K9mqaiBt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQSYd1rwYz30Qk
	for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Feb 2024 16:45:41 +1100 (AEDT)
Received: from [192.168.68.112] (ppp14-2-76-194.adl-apt-pir-bras31.tpg.internode.on.net [14.2.76.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 01E622017A;
	Thu,  1 Feb 2024 13:45:39 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1706766340;
	bh=nKCRisLpHjguaVO1EIS9AvNZ77fEHliVyA2UU02dTc8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=K9mqaiBtHwYehzQbf5LaySLWiMCocrRBFE0VQPz2DmpZPkhuPeOFm6ToPACVmmhNd
	 gT07+TMmNj9qpG8aCnyBBbV8CaBuulaA5srG3xBcXDkX9C0i4WhB/umOKB1qdImekR
	 Q1r5eP5JX86BpKSstQ4UD7qHS7Kjj+durIOQ7II1spM81ecVoyV/mE3bLCFcE8EL7e
	 0yV4ayPVVbVpUspAvNhyypdmuq9ughVDFn+F6GH9NJ6tK3IoFBIxLgEtApXyCGpU3E
	 vt5MiOFY657MRQuIP/nuHajEcqO6edsky6r18lwHEn839OxnhzXngpISCpgZ4O5yQ4
	 itYW4YT67vOKA==
Message-ID: <1823c7e3fd460b64c5bab3c1c6623a0a63e073d6.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 11/21] ARM: dts: aspeed: yosemite4: Add eeprom for
 yosemite4 use
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>
Date: Thu, 01 Feb 2024 16:15:39 +1030
In-Reply-To: <20240131084134.328307-12-Delphine_CC_Chiu@wiwynn.com>
References: <20240131084134.328307-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240131084134.328307-12-Delphine_CC_Chiu@wiwynn.com>
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
> Add eeprom for yosemite4 use
>=20
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index e8d7eb7ff568..f00df378a371 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -932,7 +932,7 @@ temperature-sensor@4b {
>  	};
> =20
>  	eeprom@54 {
> -		compatible =3D "atmel,24c256";
> +		compatible =3D "atmel,24c128";

This is changing an existing eeprom, not adding a new one - contrary to
the commit message. It probably should be in a separate patch?
Presumably this is also motivated by the change in the schematics? Some
explanation would be helpful.

I'm half wondering whether it would have been easier to add a separate
DTS for the new version of the schematic rather than make all these
piecemeal changes.

Andrew

