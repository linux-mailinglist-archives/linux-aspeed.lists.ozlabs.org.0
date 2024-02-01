Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A27B84502F
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Feb 2024 05:22:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lxcCNkqI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQQjK2MZGz3c8Q
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Feb 2024 15:22:13 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lxcCNkqI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQQjC3rN9z3bl6
	for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Feb 2024 15:22:07 +1100 (AEDT)
Received: from [192.168.68.112] (ppp14-2-76-194.adl-apt-pir-bras31.tpg.internode.on.net [14.2.76.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id ED385200EF;
	Thu,  1 Feb 2024 12:22:05 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1706761326;
	bh=w6MrQ1SSd4QNFPRqzO93oM6DOsujYyGsnvdyUzbnhrY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lxcCNkqIgStPU3lyS/g3lYBqUYokDeqaCqGY+yP0HbKBD07V+9BpC7kKGo1RkPfM3
	 4f1YkoEay+zXFsIo8Ne+EUKSLtUR5iGUG6hchfO4Z6SmQYXv1GdZKL3mWAPOgEy4i0
	 ryw0IaHpB8aBGb1uDaVPqA2LRUx32M975Jm8CvrGPRAtsLdgXEtMSyxJCGJI7Wlr9A
	 1AJCDw6vzChz4A4oM7YDkXzZjyaSDM7//e4T9Q//ofzfjmJRyA9wlKJ1Y58/Qq/fxP
	 MQBFV5LqemQdE18YWSFb6+2Stvvc1rm9u7xfDSxvOZ7G6venY+24RIUnDHgGUnQ7Zf
	 x9zK7Jz/B3o1g==
Message-ID: <aebd29d6890e54e93b46a102e7ea7532ad7b32f4.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 05/21] ARM: dts: aspeed: yosemite4: Revise quad mode
 to dual mode
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>
Date: Thu, 01 Feb 2024 14:52:05 +1030
In-Reply-To: <20240131084134.328307-6-Delphine_CC_Chiu@wiwynn.com>
References: <20240131084134.328307-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240131084134.328307-6-Delphine_CC_Chiu@wiwynn.com>
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
> Revise quad mode to dual mode to avoid WP pin influnece the SPI

What do you mean by this? Can you unpack what's going on a little more
in the commit message?

Andrew

>=20
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  .../arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index f8bfdefbefc6..23006dca5f26 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -149,15 +149,17 @@ flash@0 {
>  		status =3D "okay";
>  		m25p,fast-read;
>  		label =3D "bmc";
> -		spi-rx-bus-width =3D <4>;
> +		spi-tx-bus-width =3D <2>;
> +		spi-rx-bus-width =3D <2>;
>  		spi-max-frequency =3D <50000000>;
> -#include "openbmc-flash-layout-64.dtsi"
> +#include "openbmc-flash-layout-128.dtsi"
>  	};
>  	flash@1 {
>  		status =3D "okay";
>  		m25p,fast-read;
>  		label =3D "bmc2";
> -		spi-rx-bus-width =3D <4>;
> +		spi-tx-bus-width =3D <2>;
> +		spi-rx-bus-width =3D <2>;
>  		spi-max-frequency =3D <50000000>;
>  	};
>  };

