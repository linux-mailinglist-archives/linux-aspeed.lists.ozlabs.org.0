Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A98956090
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Aug 2024 02:30:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnD5j0gqBz2y1b
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Aug 2024 10:30:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=aTzhA+5G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnD5g6QDqz2xMW
	for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Aug 2024 10:30:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1724027431;
	bh=rTGgY3aHExRZzJq6zw8CNonDfFysPyBeT0Xa98FNgtk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aTzhA+5GYEIScmNuzLJPKGaqNO9VJb4wYVYQ4GYkDM1chmPD5TMD6W5DSPGjGu6oT
	 ELZFpl1eRING75F6BpjdYyf5Cya9L+dLPlCcJr42hu0LSAc04FlboAyk/y73L9j6sG
	 bMnXZwa5MlCXXapG9PgO/OYMjRqzwKuQikVcKs27uHFMdNjjhVmnLyXpJ+S/pKFje1
	 ++n8if+sBTBTPUtI+KRscZRZDYRm44b/CfuAhx6//eE+2njVMSaGs/o5lAt+5x6sjN
	 0BZK+Deas7C5ir53q1m5YLkLiNmuzh3jAnfq7yYuaFhHnkWj0rBaW3NqpmpkQQp5R6
	 JZlLqfiGUpmrg==
Received: from [192.168.68.112] (ppp118-210-94-119.adl-adc-lon-bras32.tpg.internode.on.net [118.210.94.119])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6157164BE9;
	Mon, 19 Aug 2024 08:30:30 +0800 (AWST)
Message-ID: <729e650fc7716b8507b19d43979782a7f2c420cb.camel@codeconstruct.com.au>
Subject: Re: [PATCH v12 10/28] ARM: dts: aspeed: yosemite4: Add power sensor
 for power module reading
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Mon, 19 Aug 2024 10:00:29 +0930
In-Reply-To: <20240816092417.3651434-11-Delphine_CC_Chiu@wiwynn.com>
References: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240816092417.3651434-11-Delphine_CC_Chiu@wiwynn.com>
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

On Fri, 2024-08-16 at 17:23 +0800, Delphine CC Chiu wrote:
> Add power sensor for power module reading
>=20
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index 09bbbcb192f5..139a09de24cf 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -906,6 +906,11 @@ gpio@23 {
>  		"HSC7_ALERT2_R_N","HSC8_ALERT2_R_N";
>  	};
> =20
> +	power-sensor@40 {
> +		compatible =3D "mps,mp5023";
> +		reg =3D <0x40>;
> +	};
> +

This appears to be supported by hmwon but there's no binding for the
driver[1]. I'm hesitant to accept it and add more warnings to the
Aspeed devicetrees, but at the same time I'm sympathetic to leaving it
in.

Can you perhaps send a patch for
Documentation/devicetree/bindings/trivial-devices.yaml along with this
series?

Andrew

[1]: https://lore.kernel.org/all/20211217155206.GA3015782@roeck-us.net/
