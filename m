Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6397097E475
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Sep 2024 03:01:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBl7g0y1Sz2yT0
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Sep 2024 11:01:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727053309;
	cv=none; b=QvxEURUAz9Z65GVPNofFzhPnhi791K1OtQXKFcd0bo5o5khXsgq6JX9p3edoHJBVnIG52oBhavMqAlWInBPgcmr0x1k3pRcueeZdp71GmnQNDohQEgTnb0bfd6qA1gXC4CguYW10mCaTrvV6L+APCfTPEQXrb52j8NpwE33shAfFbE9JLwBgdYTalBPqjHq0c2qDgxBfe1zLs+IZcsE9hS9jmqqH44hDgHUaGb2zxFa/0gwVHgC9tjmSVvGU3zv88dKpW+4w7hZJoNEwXlTCB0sgbuMeN/2gUpzpmNGPcygKNHSbqAz5s+RBz5hPH0RhJ5u+w4qlI2/BHt4sZYFt7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727053309; c=relaxed/relaxed;
	bh=rEz5q50Q88VwaKB4RIe1Y0Mq0OGB9yE2/0HHGblYAQQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lCCS70TFBT/5Y6B8etX50ZQShYcKPcJpaUb81mNW5OMx9p4QFziyrK5IbcRKFG6PmyP/oITBm3mM04sOg6TsZDdPoME4sFRHDesyYnNn26FLK/EWoNyB5RKjkbaRqHGpNYRNd9XLcGoefm3gL0aauUsujGt/pv145//mkjZP2+hWGdr+47zPWMHSq744w6tNx62BRE8ABbNyKXN0qnNzEXetTTVIMExk2hAObZJAN2OdMJvlG4hlFmpT0eVgtoGNbh85AwkmDFRMIPxqY8GA+OuZSqU/lN0/uhbb0boixFYr05UVrCzHwEN/riMBGmfzLQrMCYSHZCWZJs4HMY2uaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RhVlsKpt; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RhVlsKpt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XBl7d4bQYz2xJ5
	for <linux-aspeed@lists.ozlabs.org>; Mon, 23 Sep 2024 11:01:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727053309;
	bh=rEz5q50Q88VwaKB4RIe1Y0Mq0OGB9yE2/0HHGblYAQQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RhVlsKptaqDaqD49XfvrnNKT4IGbhX3ygGKBW1df8GlyNiM+scf6o2qMlJSdwDl0+
	 J/N/6KVkxNlV25Ap+oMrDDpi6vk7KcSLzRAdfV1s3IvqVgycoLUK0nMZ6UAi/gF3X1
	 +Pvxa7x8V6wOr86F27rNobBbvg1q6iZOR8XQZ9Iy7DUOVXpiVKNQxAZhGDprawRPKp
	 sbY+M0paacteznirwn8F/Q8MV+dvFFCmnheEfiTipP4L1rmAwuAmooSDQzx9SaWpls
	 onC2QNC/CaOOxN8WeqPrJNUMiVv/whbR/5cv2tvt4BGcNBnTTg+y6UIk1m667Ig2SX
	 buWVmzzhTJWDQ==
Received: from [192.168.68.112] (ppp118-210-177-92.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.92])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 60638640E8;
	Mon, 23 Sep 2024 09:01:48 +0800 (AWST)
Message-ID: <59baad7d486637f7f82f2730181734eca047efd7.camel@codeconstruct.com.au>
Subject: Re: [PATCH v19 1/2] ARM: dts: aspeed: yosemite4: Revise i2c-mux
 devices
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Mon, 23 Sep 2024 10:31:47 +0930
In-Reply-To: <20240920070449.3871705-2-Delphine_CC_Chiu@wiwynn.com>
References: <20240920070449.3871705-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240920070449.3871705-2-Delphine_CC_Chiu@wiwynn.com>
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

On Fri, 2024-09-20 at 15:04 +0800, Delphine CC Chiu wrote:
> From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
>=20
> Revise Yosemite 4 devicetree for devices behind i2c-mux
> - Add gpio and eeprom behind i2c-mux
> - Remove redundant idle-state setting for i2c-mux
> - Revise address of max31790 devices after i2c-mux.
> - Fix warnings reporting by dts checking tool.

Can you be more specific here? If you've had to fix existing warnings
that the devicetree produces you should split those out into commits
separate from adding further nodes. Instead, if you're just fixing
warnings that this patch itself introduced then you should drop this
comment as it's just a process issue. Process issues are better
described in the patch notes or series cover letter, not in the commit
message.

Generally if you feel you have to list the changes you're making in the
commit message for a single patch, it's a sign that you patch should be
split into multiple commits anyway.

> - Remove led_gpio pca9552 since there is no binding document.
>=20
> Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 539 +++++++++++++++---
>  1 file changed, 466 insertions(+), 73 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index 98477792aa00..6b4efb5fbd83 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
>=20

...

> =20
>  &i2c11 {
>  	status =3D "okay";
>  	power-sensor@10 {
> -		compatible =3D "adi, adm1272";
> +		compatible =3D "adi,adm1272";
>  		reg =3D <0x10>;
>  	};
> =20
>  	power-sensor@12 {
> -		compatible =3D "adi, adm1272";
> +		compatible =3D "adi,adm1272";
>  		reg =3D <0x12>;
>  	};

Can you please split the adm1272 compatible changes out to a separate
patch and include an appropriate Fixes: tag?

Andrew
