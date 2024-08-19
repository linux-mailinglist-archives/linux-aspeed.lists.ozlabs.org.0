Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCBB956094
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Aug 2024 02:33:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnD8Y3QV4z2y1j
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Aug 2024 10:33:01 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=e180Ns5f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnD8V72v8z2xMW
	for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Aug 2024 10:32:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1724027578;
	bh=FbUkf0vf4nPTxDEKtxyiEBQtf4h9Z61lRGRPcxHrRCU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=e180Ns5fDeR7O6FjKC5Nr8lTciKbOX4GAhWdEzYYiveZQ9UI69sOwNU5WgLqBl5O4
	 71OH0FqBXP1LywkmSp+//T2xc4EFK0o1rszv3Xh5M+Rs2dacW/hzeXKAfsnluD+EGu
	 S02ogDYhSOtfmmDMNogppgOTN64+paS1uVR6FnvJmipNETvdxWKeAquvzRBhX2W3Fr
	 A1FRgcqUEslwv5GsKEIAD72KoNDrv76OhKfUeo9rJ/TKEsGlG5AW/pUIsLRAFrYgLT
	 vAUV1U6f7Se/RctoPkJNWTu70wVqp+/H8nT0bVzJI0gzH3UF5mSYFzq9o69WrEx4tR
	 w2NlaoDQ86+3w==
Received: from [192.168.68.112] (ppp118-210-94-119.adl-adc-lon-bras32.tpg.internode.on.net [118.210.94.119])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BE0EC64BE9;
	Mon, 19 Aug 2024 08:32:57 +0800 (AWST)
Message-ID: <2aaf4cc4de2c3ed96400fc5d98e9873ea5ec1411.camel@codeconstruct.com.au>
Subject: Re: [PATCH v12 14/28] ARM: dts: aspeed: yosemite4: Revise ina233
 config for yosemite4 schematic change
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Mon, 19 Aug 2024 10:02:57 +0930
In-Reply-To: <20240816092417.3651434-15-Delphine_CC_Chiu@wiwynn.com>
References: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240816092417.3651434-15-Delphine_CC_Chiu@wiwynn.com>
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
> Revise ina233 config for yosemite4 schematic change
>=20
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 20 ++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index 1765a0bb70d7..df389b506b4b 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -1034,28 +1034,38 @@ adc@37 {
>  	};
> =20
>  	power-sensor@40 {
> -		compatible =3D "ti,ina230";
> +		compatible =3D "ti,ina233";

Can you please address my previous comment?

https://lore.kernel.org/all/86a3b58d00fc475065ad51458504a636e2f67e02.camel@=
codeconstruct.com.au/

Andrew
