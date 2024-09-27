Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35445987E12
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2024 08:00:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFKZZ6F7xz30Tq
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2024 16:00:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727416837;
	cv=none; b=hu8ZcOaeJePKuzSE/dIvV5dlT7HzZutpDDYH9HDfKou4xzcCBi+oZbzU/Bg7ycCagjZB30+ucUOUdss6nooMi4aW0nnskATI/v1G0WAwNFFyPURpJ/1LzwVV2H/rmv45bzF3DZ3XnC9rQTVyIwUHiN0C9LjEhUFeD9GAiCjrkzfg0MqQCIbJV0EtG5EAiSXb/ChmJ6UZxYgSYvhQaGfFvDzpnMdlLqLcLoBYy2dg1KQjI4ruD5eWA4ifchKEvkKKQ+iTFfWgguL3Szzkt9DxL5SjbIY6bmyMO2bsWddHbXEeV5C0mzwAv5L1OfUjLyDdML6ae/WjNGR1rwadqSuHNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727416837; c=relaxed/relaxed;
	bh=699NuMm8IMQ7ey19zdyLF9Pg8zDH6KqpN6yn26NXjVU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kvujcc2WgnXl+cozHH3b32HBNlp+mJpAurFaeKCS8ikhH8AEn9HyCwjHMxoabjm85x2dYEuq/c6obxfLJgIFLoLcZcR0+Hguzx7MzmUPl5FFDhdSQQmAnpfR0jbA7kcfDBiAdKdYgFg/u2y3ED+HVwpqrn0nIsKrRaKiJx3M3dS4dxuFr6xfTSkJroeyzNpJI9thzFJJtu8J4AXLyCCkyiTrbwcg+Ls8KViJFVX+09d8T1gGmia8gyodVrEW3YKlre18uq7siMFkTy20FjRz5/NPcEXM+8WT+qxZw8ndYLnWRgB16oO8t/VlUxEe6lAN7a310aTJx+2TZ3OCsINlrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=R0HibH3f; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=R0HibH3f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFKZY4Dtsz2yl1
	for <linux-aspeed@lists.ozlabs.org>; Fri, 27 Sep 2024 16:00:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727416836;
	bh=699NuMm8IMQ7ey19zdyLF9Pg8zDH6KqpN6yn26NXjVU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=R0HibH3fYTr/hp02LdHjsuH2UCxY/65xYzRsbx4lLJCw6saiMzkXpO6YO3/H+minT
	 HY4FxJUe8ZDChK1AvRYUz01YCJzLLB+BSXzWAXqq58p50R89L8FTXmtN0vIgCh85r2
	 7HWpjG1WMWD2XmE+5dD282jwGAsAS8W1X4V0bBIQQNifzp7WuqhVZXjpkOsFqSGBXJ
	 I1NAaplNiexstdikhJZNBaoAhMh42urYL4I69/YVvdHQyCws7gipCvsctEhLdVFVWE
	 DafIJBXj+t3cD9h6HeOJt6PKtamzNT/7YnwDq5+MvZjZBkZaFWF2tpVoJ9v/i7tzez
	 QICycZGmRIHqg==
Received: from [192.168.68.112] (ppp118-210-187-73.adl-adc-lon-bras34.tpg.internode.on.net [118.210.187.73])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 13D0265029;
	Fri, 27 Sep 2024 14:00:36 +0800 (AWST)
Message-ID: <c2ddf0375eff2c9c18fd26029fc6a1be7ed23a8b.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1] ARM: dts: aspeed: yosemite4: correct the compatible
 string of adm1272
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Fri, 27 Sep 2024 15:30:34 +0930
In-Reply-To: <20240926013411.3701546-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240926013411.3701546-1-Delphine_CC_Chiu@wiwynn.com>
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

On Thu, 2024-09-26 at 09:34 +0800, Delphine CC Chiu wrote:
> From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
>=20
> Remove the redundant space in the compatible string of adm1272.

In this case the space is not redundant, it's just incorrect, the
compatible string doesn't match any specified. Do you mind fixing the
wording?

>=20
> Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>

Can you please add an appropriate Fixes: tag?

Thanks,

Andrew

> ---
>  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index 98477792aa00..7ed76cd4fd2d 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -284,12 +284,12 @@ &i2c10 {
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
> =20

