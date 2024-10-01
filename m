Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4031898B17A
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 02:37:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHfCw5tt8z2yLT
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 10:37:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727743049;
	cv=none; b=llAKGxFHU/V6Y/tg165FbT9QpO1tVf5yQ4c1lDt+JQcnN/X4MPfCrgULYWPDwvSOKqTR/NAwNlH/tfwB29owc5dH/tmGUw2gZMbewBJsH9eC4Rfy0fF2NGS+f/E4KcftN1cRXO3eQcDG0hbLELeRAPpjMbdCR2YNSnAbG00sO/E6R9BimSiUMfK5eEBnM9LvPd/YedHaPPVfNzDA47hWdbXgAtY3RFUrjLmBH2W7K4BZpVEai64smeKNqddDvsKfQEDSRUq3wVc9AO7VcSyWoQn4YYg4MloePIN3vgrj+ftd/VEV/y7n1hCfi20S1vG+tf40SsuMp4W/3X1mQD+aOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727743049; c=relaxed/relaxed;
	bh=0OjlemPLmRuT7L4kYUkhwkgv6/KlB/R9FhMl7U4Cm6c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zs5pfeTQQPwFb7QpkQWkvcAaQESgQDJ36HSDhAbX/oAJKZApfNCh2LsiPojYZbKv+d71Lfoegu83A6fDQKQ6kVrGdcgH77rw0UyZeC/lVhBsbdZHCk2naKFtkDjzy+12IupKftbD/DkvfSEa+fW9/ADjKTwn5jesJ1nJPmKxG/HZOmHAB67nefViGq8yMr9371mafe4W3w3Qm8fkV619SyNmCS0d2qsGHsZhcwweZji+TTMV7ZaHdiUA/iN4SoukezezwI+tBHdcK5ivX/5dgsKTDZCZYRl9iM9LoOLDN6OcVb/Q5df0fIz1ftbT6xxTya6a9g7AUsdfafatxfY9ng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Qv+AoF4V; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Qv+AoF4V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHfCs1Qxnz2xYl
	for <linux-aspeed@lists.ozlabs.org>; Tue,  1 Oct 2024 10:37:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727743046;
	bh=0OjlemPLmRuT7L4kYUkhwkgv6/KlB/R9FhMl7U4Cm6c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Qv+AoF4Vl27mVWXkSEfa5n3tNY9EbN7iWXbnXw32/EbaTBfUtYCksBpBzwWjJWTSd
	 +JMC4Y5UqPISlYRq0loVXAbMeaDCpmGHottWl/DPco7g5MABRf4GVelqKclegKfZjL
	 rDS130SQ82JT0Cw3tstmSAv8wVXmWclP/nz0Miwhg/0icPaHE6gVR2qRBqAXC7mgh2
	 QihdIi5d3bx/vh/ireLA0QsSFs9jn3rNzt0ZOqc8oGJAQsqr3YajsrUGurTcJzoEA6
	 HoZML6pAs5FXf7wIumejrN9cqilOv1xNWUYNL1JO5GVjaCCwSUwksY1kojGGAltbk2
	 5sQDHAD5MBFdg==
Received: from [192.168.68.112] (ppp118-210-73-17.adl-adc-lon-bras32.tpg.internode.on.net [118.210.73.17])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 04459650AC;
	Tue,  1 Oct 2024 08:37:24 +0800 (AWST)
Message-ID: <fffb98e40d407c68dc3de6fd21c8a724be96e38a.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 2/8] ARM: dts: aspeed: yosemite4: Add i2c-mux for
 four NICs
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Tue, 01 Oct 2024 10:07:23 +0930
In-Reply-To: <20240930070500.3174431-3-Delphine_CC_Chiu@wiwynn.com>
References: <20240930070500.3174431-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240930070500.3174431-3-Delphine_CC_Chiu@wiwynn.com>
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
> Add i2c-mux on Spider board for four NICs and add the temperature sensor
> and EEPROM for the NICs.
>=20
> Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 75 ++++++++++++++++++-
>  1 file changed, 72 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index dbc992a625b7..b813140b3c5b 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -26,6 +26,10 @@ aliases {
>  		i2c21 =3D &imux21;
>  		i2c22 =3D &imux22;
>  		i2c23 =3D &imux23;
> +		i2c24 =3D &imux24;
> +		i2c25 =3D &imux25;
> +		i2c26 =3D &imux26;
> +		i2c27 =3D &imux27;
>  		i2c34 =3D &imux34;
>  		i2c35 =3D &imux35;
>  	};
> @@ -1196,8 +1200,9 @@ adc@35 {
>  };
> =20
>  &i2c15 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
>  	status =3D "okay";
> -	mctp-controller;

Why are you deleting this if you're not also deleting the MCTP endpoint
node?

Unless there's some reason this is related to the NICs, this should be
its own patch with its own justification.

Andrew
