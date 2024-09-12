Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC09F975E4A
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 03:00:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3zdX50Tnz2yR9
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 11:00:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726102846;
	cv=none; b=EETQTFFk0MbcyWoyxaccW7auSAYHXYdEMGtm/GTDgz5Yp/mAYWXJTfV7AG2nNah2TNI/CywdQH4Y5kevjWfbBcCcy2Yp/BPLPGhAsrTlP/OdSTxrJUFiCwn6P4p5li4XUeOOQMo19msCxi/CE6lD7PjE/ZCXh1WAMwb2R2AGFpB22b6VsL9hLkYiuDTG8qSr6t6+lFilFLOgl2rwnzOUFuyxrvMLAfVyO0XvgqZpsffNn5LkZzDXT6yHAw+TtpPAtlQtfuRlUCl2t8Go5XYhM8mPo3YQeoJ6VSt8bQ6pJIuhOUi2qE8SJkJbPcrWAfiK5pYShQQAC1+wrS5J4pt/UA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726102846; c=relaxed/relaxed;
	bh=GNjZ85orHNFiT2iD9bmLshHf/vQPcwQdQ803KguC+x0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F6eIlCxbdVEu+tVlwYNorYsehJjFAmxXpLLMEg29DkV8j4gWjAC5Xdw/5okbTbvaPFSHlblvLnDhQj+wwVFt+J6PL8xMQB61I9lwnvb0D17TNPYvkhb6QK0GEKtb7ZaUt8BZRG3SYXpUwknDxf6zfhMlj+u09Kw9ZCZel/gnmMLiikUSfLFpDPT991VSSL7kr35xDkqLAHgdvSllMgZR80qGDjR3hgQOYc6xFKCje1kUqvn2HZxk3t9/WL7AksQ6LHn1YKnel/DLxmldV9eGbANQGXWDKN0LyJn44tZLWMTFvp7AbnBAE+KFmFMui1Enznb7WKhPuM1TD0j/uAxJ8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=UgDTvYii; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=UgDTvYii;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3zdV2dNXz2xk7
	for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Sep 2024 11:00:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726102845;
	bh=GNjZ85orHNFiT2iD9bmLshHf/vQPcwQdQ803KguC+x0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UgDTvYiiiAUto4p3EkRZMy61b83Dvibk+E2PmV3N2CigzezLx1Fz3sYCBXtmqXSNn
	 1zHiK68BlJ9nB6QJAgtyzHS/COKy3i6A2vpNpfjnuJRBPHdJSOxGrti6Thjaocf82m
	 ubI9epK0MvBLymOdQDmTaxpU7KtzoHp7o/kef74CARNhpwcSjovFaElV09GH75C+Xv
	 B+DyKxxIVYwq7uI21sIkfd5aqlnp4E0ZNPbqAMStHCd0nTe+7224+liizl8SsgNiS1
	 2fUttIp7ffwHVEgRJ/Y+qgdTLm0i1+QUvo+TOnly4e3dutdvvNYxRFUiba1vFLac3l
	 VGyvojW7DfwuA==
Received: from [192.168.68.112] (ppp118-210-89-8.adl-adc-lon-bras32.tpg.internode.on.net [118.210.89.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9BE28650AD;
	Thu, 12 Sep 2024 09:00:44 +0800 (AWST)
Message-ID: <4ad15ead271edd36d4638068cdf63b124a78b437.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1] ARM: dts: aspeed: yosemite4: Add power module and
 ADC on Medusa Board
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Ricky CX Wu
	 <ricky.cx.wu.wiwynn@gmail.com>
Date: Thu, 12 Sep 2024 10:30:44 +0930
In-Reply-To: <172597760852.3917242.15739474117640537130.robh@kernel.org>
References: <20240910075357.3531211-1-Delphine_CC_Chiu@wiwynn.com>
	 <172597760852.3917242.15739474117640537130.robh@kernel.org>
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
Cc: "Rob Herring \(Arm\)" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Ricky,

On Tue, 2024-09-10 at 09:15 -0500, Rob Herring (Arm) wrote:
> On Tue, 10 Sep 2024 15:53:56 +0800, Delphine CC Chiu wrote:
> > From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> >=20
> > Add RTQ6056 as 2nd source ADC sensor on Medusa Board.
> > Add power sensors on Medusa board:
> > - Add XDP710 as 2nd source HSC to monitor P48V PSU power.
> > - Add MP5023 as P12V efuse (Driver exists but un-documented).
> > - Add PMBUS sensors as P12V Delta Module.
> >=20
> > Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> > Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> > ---
> >  .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 45 ++++++++++++++++++-
> >  1 file changed, 43 insertions(+), 2 deletions(-)
> >=20
>=20
>=20
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>=20
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>=20
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>=20
>   pip3 install dtschema --upgrade
>=20
>=20
> New warnings running 'make CHECK_DTBS=3Dy aspeed/aspeed-bmc-facebook-yose=
mite4.dtb' for 20240910075357.3531211-1-Delphine_CC_Chiu@wiwynn.com:
>=20
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@=
1e78a000/i2c@600/power-sensor@40: failed to match any schema with compatibl=
e: ['mps,mp5023']
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@=
1e78a000/i2c@600/power-sensor@62: failed to match any schema with compatibl=
e: ['pmbus']
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@=
1e78a000/i2c@600/power-sensor@64: failed to match any schema with compatibl=
e: ['pmbus']
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@=
1e78a000/i2c@600/power-sensor@65: failed to match any schema with compatibl=
e: ['pmbus']
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@=
1e78a000/i2c@600/power-sensor@68: failed to match any schema with compatibl=
e: ['pmbus']

Can you please either:

1. Drop these nodes so we're not adding more warnings, or
2. Write the appropriate bindings and send them in a v2?

Andrew
