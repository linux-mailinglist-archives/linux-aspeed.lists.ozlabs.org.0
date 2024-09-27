Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB5E987E09
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2024 07:57:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFKVz2LxBz30T8
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2024 15:57:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727416649;
	cv=none; b=naJyG8VePk+kWqGoT+tX8AdKbleLLopSHjI5KnCDYbCl18pif7ZSk1240m9iT6m5hmDJYKppn5Mp3WzLIg8Et5q9NjMDLlthoyZXKgQk1Cj53tUXZuzC4cVxj7f1Aix7uBCErcZAcHaiUnxwOZuvu+tCcHtSLthr79xLTiCu/vkYTzDbZWPsC6o8dpb/ETNAeGGJVikhpjWjDj1WV41Xr2OM9kERDkaMi5RxBpgdt9/emrKxbxCaeeZigoCUbM7DrOWuH1aMN8YA5mCvmA17EJ/Il+dD8r7oX6zDcujg0WvKVxnVza4lo0G5nftd3oY1xMvwiOrUJNLv3vSG52GUxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727416649; c=relaxed/relaxed;
	bh=eGQo/HTGjs3ISaIHu6Q8vT0fMKDRuGcwPfT4rFP9Omc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HiYPMRNc+e1YoG2c+Ij+NzkvDdDvZv3OWXjQTnwKbkScPcZFcy/terEG92x7PGGDj/ijwxLIPllV5JLs4wFSks4SruPVv3ETVXm7eG74Kvdboqmh4QiBc8HNM1I3sP6T2X/MnMTpc5SS5n7CfDd/UdlLALZGji3sqF3AvTShGRTC2qWhv+ocjLgIK4x88ru1sJwNgOYzrZCSqTEB42DysBSO7/RN4tEPuc/JM7TWgd2SUSfZzC/8VzR6P+9LfViseSYH2iKV1Pbr3h4ATd2XPsZV/nZanyjEH6o/zwZ35AFEW069sqq/lO33blE5EiU5ZhhMtmhcB1MSZ6/7lQHmrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Bj5SYJBS; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Bj5SYJBS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFKVx0g9rz2yVT
	for <linux-aspeed@lists.ozlabs.org>; Fri, 27 Sep 2024 15:57:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727416648;
	bh=eGQo/HTGjs3ISaIHu6Q8vT0fMKDRuGcwPfT4rFP9Omc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Bj5SYJBSHeTkNGOeTLidEjQytHkORHTbweHdN0NHnLekD0t4Rs2tqz1ONv0KhUFsY
	 lLGDgZ+YgtK03IReFtcwJJdLBMABgMAwF1VxVK1l9vyFDYK1yu/o4a9WT/IOyZH9JV
	 JYC9WxKzvgcktRgfXhy3XtzDnZ0uKZPdDRtg34msQ/01UgyFFjP1ew4Jvah9PNuOSd
	 5tb23z9fM3HdfgqmnJa5cBeXiZvZtXi+Qqb2/ms8x5cXD61UUBUJ3DWIEWGoDu6yNR
	 +6Eitm5VBPJAJ7Q+o5Ewiym/fFSnMF1t8uqUw+lC624/gQtSB7Rws93GufUmzwpci5
	 rJ4+rmTd5/iLw==
Received: from [192.168.68.112] (ppp118-210-187-73.adl-adc-lon-bras34.tpg.internode.on.net [118.210.187.73])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B483A65029;
	Fri, 27 Sep 2024 13:57:27 +0800 (AWST)
Message-ID: <fbdc9efe87a1bed9fea7d0abaf955aa1a3dc24ac.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1] ARM: dts: aspeed: yosemite4: Add i2c-mux for CPLD
 IOE on Spider Board
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Fri, 27 Sep 2024 15:27:25 +0930
In-Reply-To: <20240926024133.3786712-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240926024133.3786712-1-Delphine_CC_Chiu@wiwynn.com>
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

On Thu, 2024-09-26 at 10:41 +0800, Delphine CC Chiu wrote:
> From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
>=20
> Add I2C mux for CPLD IOE on Spider Board.
>=20
> Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index 98477792aa00..ea1a9c765483 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -17,6 +17,9 @@ aliases {
>  		serial6 =3D &uart7;
>  		serial7 =3D &uart8;
>  		serial8 =3D &uart9;
> +
> +		i2c28 =3D &imux28;
> +		i2c29 =3D &imux29;
>  	};
> =20

Have you tried to apply all of your individual yosemite4 patches
together in one branch? I have, and unfortunately I can't apply them
all, because they generate conflicts with each other.

If your patches have context dependencies you need to send them as a
single series and not separate patches that cannot be properly
combined.

Please assess the remaining yosemite4 devicetree patches (those you
haven't received a thank-you email for) and send an appropriately
constructed series so they can all be applied together, based on the
tree here:

https://github.com/amboar/linux/tree/for/bmc/dt

Please also indicate in the cover letter (with links to lore) which
remaining patches are truly independent that still need to be applied.

Thanks,

Andrew
