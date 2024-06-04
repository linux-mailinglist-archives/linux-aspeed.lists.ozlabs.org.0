Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E987F8FA80A
	for <lists+linux-aspeed@lfdr.de>; Tue,  4 Jun 2024 04:03:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=dpLdVfSz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtYlS0qc0z3dBr
	for <lists+linux-aspeed@lfdr.de>; Tue,  4 Jun 2024 12:03:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=dpLdVfSz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtYlN0NDMz30TK
	for <linux-aspeed@lists.ozlabs.org>; Tue,  4 Jun 2024 12:02:56 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A5736201B6;
	Tue,  4 Jun 2024 10:02:54 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717466576;
	bh=wWRmPcmFirZAAtih3AkzVHKsH5OIiMN68xLR8oBNnrw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dpLdVfSzJPSFbaw7WOZX2/IyBbi7NtqcTPgi/yb6jsOKOzF6hZjibXlaravhzyjPe
	 DD9Xk5t+cK8wKP4FSlPxWOx82EWORymqtyJDOV9wlG8m6EibEunNZ7G8mhZmfsPFqD
	 uxx77xIUfnXVwqhu9XlXMO6cIh5orl3v7nA8gpHiKv7JF7EsFfs4YKsf2VsWTHj3AF
	 QDd2HpviGUaCLcDX91bIQHnX3MUZhuZ/kfe96SCg29rIDseDO6axvI1C3i0W9y+9UN
	 Q7JZ0p6XqYf/C8xEcLFPD03owuun1I2dLwPaLyRq7uc9X/cG75ayqeDdJ9hNSWW+lT
	 JWM3g2Lo8MvVw==
Message-ID: <f4a891a6548461935129bb8ef4bed68c265567a1.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: convert ASRock SPC621D8HM3 NVMEM
 content to layout syntax
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Zev Weiss <zev@bewilderbeest.net>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
	 <zajec5@gmail.com>
Date: Tue, 04 Jun 2024 11:32:54 +0930
In-Reply-To: <11f0a9a0-967e-4971-8ca1-4730f2881ee1@hatter.bewilderbeest.net>
References: <20240520063044.4885-1-zajec5@gmail.com>
	 <11f0a9a0-967e-4971-8ca1-4730f2881ee1@hatter.bewilderbeest.net>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 2024-06-03 at 18:21 -0700, Zev Weiss wrote:
> On Sun, May 19, 2024 at 11:30:44PM PDT, Rafa=C5=82 Mi=C5=82ecki wrote:
> > From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >=20
> > Use cleaner (and non-deprecated) bindings syntax. See commit
> > bd912c991d2e ("dt-bindings: nvmem: layouts: add fixed-layout") for
> > details.
> >=20
> > Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> > ---
> > .../dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts     | 12 ++++++++----
> > 1 file changed, 8 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts=
 b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts
> > index 555485871e7a..c4097e4f2ca4 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts
> > @@ -110,11 +110,15 @@ eeprom@50 {
> > 		compatible =3D "st,24c128", "atmel,24c128";
> > 		reg =3D <0x50>;
> > 		pagesize =3D <16>;
> > -		#address-cells =3D <1>;
> > -		#size-cells =3D <1>;
> >=20
> > -		eth0_macaddress: macaddress@3f80 {
> > -			reg =3D <0x3f80 6>;
> > +		nvmem-layout {
> > +			compatible =3D "fixed-layout";
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <1>;
> > +
> > +			eth0_macaddress: macaddress@3f80 {
> > +				reg =3D <0x3f80 6>;
> > +			};
> > 		};
> > 	};
> >=20
> > --=20
> > 2.35.3
> >=20
>=20
> Acked-by: Zev Weiss <zev@bewilderbeest.net>
>=20

Thanks, I've applied this to a tree for Joel to pick up.

Andrew
