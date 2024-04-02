Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8DD894A8B
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Apr 2024 06:42:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Q806oSm5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V7wGF4nzyz3dRm
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Apr 2024 15:42:13 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Q806oSm5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V7wG21KsJz3cRB
	for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Apr 2024 15:42:01 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-182-70.adl-adc-lon-bras34.tpg.internode.on.net [118.210.182.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4011420016;
	Tue,  2 Apr 2024 12:41:56 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1712032918;
	bh=fRcs8rvk7aWDd3jH1iz3Wdk5wU4Tj0kt/f5n2x/Nrm4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Q806oSm5OfEMDMJ/wLaqtQwDlfkPA1UW3d3kM0I97eEHY8VnrfYoNhex0sFxwKvNU
	 6ABUEJQjE84Nt41hQNrgJIZg172+oSPEcLDq42RZfwDIwJSHxrSx07P9n4ymSCw8ep
	 +3/OO15E0JLuAoaxhHDtcqt7DckH201EFNTyTtAlt8kfEbsZPjrDK11b/4nQxhqlOp
	 pnuud1xzxMRIV1k5kjs2qYfX9hIKg2uqZaLV7UkvbkXu4RWSM58ygdljZA0e3q22f7
	 4ff5N3+gQpp+ZU95Tu7iwprzzaRA9m/KlKiBgz7PD4BtQl9Mp4u8XX5sDt8zsANeZW
	 eR68bplZPpB9Q==
Message-ID: <3aad5148383ba9e8fd905b09690ffa9c378b31de.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1] Revise duty cycle for SMB9 and SMB10
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>
Date: Tue, 02 Apr 2024 15:11:55 +1030
In-Reply-To: <20240401090509.2338027-1-Delphine_CC_Chiu@Wiwynn.com>
References: <20240401090509.2338027-1-Delphine_CC_Chiu@Wiwynn.com>
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

On Mon, 2024-04-01 at 17:05 +0800, Delphine CC Chiu wrote:
> ARM: dts: aspeed: yosemite4:
> Revise duty cycle for SMB9 and SMB10 to 40:60
> To meet 400kHz-i2c clock low time spec (> 1.3 us).
>=20
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> ---
>  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index 64075cc41d92..b3a2aa8f53a5 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -257,6 +257,7 @@ power-sensor@40 {
>  &i2c8 {
>  	status =3D "okay";
>  	bus-frequency =3D <400000>;
> +	i2c-clk-high-min-percent =3D <40>;

A grep of the 6.9-rc2 tree doesn't turn up any mention of this property
name.

More work needs to be done if this is meant to have any effect.

What tree are you developing your patches against? If you're sending
them upstream then you must do your work (and test) in the context of
upstream.

Andrew
