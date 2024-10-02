Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C86898CAF5
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 03:47:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJHkc6Gj3z2yPq
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 11:47:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727833671;
	cv=none; b=jPy2e28y2NLvU2thYVwWT7fGvlsPqNsHfbqbW+zZ5JnL4PC375bcan5KpctW1zHRLqY5ged3PbxL5Aa6/qdm8RIhVKsHSB1CENbWdnoSmLufOp3DLuj8q8K/xilOU7oy74GgjvLCnU3T0pw83DGNeTd4WzYOTxhfypsxrnXinGSKTW/QLg7ZU6rur4RHimZePSzvskL32YoNINmaT1WZZxj251tqhD85QY0MS8tqRmjJsH9a4uDDBnnFBL22wba4gnDwmIu9QhbzMHxNgPjwR9FQX84TTVcOxqAvxd2Bh2ILwWtqvlgY4s+unkUxyvnqQWitiuMt6kmkS1WWcxhFUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727833671; c=relaxed/relaxed;
	bh=+1Hb3ho1UIWmxjP8x4+K5GqWSB7N2LYWC8IVzjSU3GI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UseNX0Y7yClIetN336Ji5xv5VNYGHINxdyeQjaCRgG/Hv2iHFWy8Px5Am2nScA6A8dSqJqUmlFUvuTxycLfV+mCumfJgSUe7wI/oQJfpFYzG0m/L3cl5GtqKd7zfogYYnbsqk75a6+v623lg4MTuXj0oBWw5mEaLsnXVVWeSmiILB0sAsKnb7Cbex6Dbv3+ffdWSgkPxCSmGnCF5uZFjC1bBryYwd5HQN+bYgVaNS0kso2EpOqiTeVrXHb3qywZiV0/D4gxocPQDny4P1z6RuFMe8PGNqhZwHTJBwLdbvHrenJzDukxi/lOaB1d+OlmXCDdUUQtC94YLPhwLwI2lTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=BWM7+oZ3; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=BWM7+oZ3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJHkb4Rb5z2xjh
	for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Oct 2024 11:47:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727833670;
	bh=+1Hb3ho1UIWmxjP8x4+K5GqWSB7N2LYWC8IVzjSU3GI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BWM7+oZ3yveLbOZPROEWiCfIr9HEBBjdCN5VDTD3i1LWuxGjAP59l0Co9OOExTYsi
	 Xn59l2f2dVIcX86PT8ZclfBJYHV34ll820EJZe0+HaUdjrfyCmTj4JVlzzXMmSzVuc
	 g9EA54nzkqxAkUg/q4PShsy1nocUkiX2lxdt8OAbgq/vjOQdrzNvip5hlAAD+seH5K
	 GtEartBZwL3RW5Xf8XCQvydjqZSAhWTcv/o/p6psGlMCeefwgslAnhYejzdyYjtZPQ
	 5FtKi8YR0MTte3jb+vpc2kQKE8vVe4cpy7Yav8wBwZeuIK3dvV3yxwvdBdphyTXwXK
	 tbBdk0zdRnToQ==
Received: from [192.168.68.112] (ppp118-210-73-17.adl-adc-lon-bras32.tpg.internode.on.net [118.210.73.17])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3A43565013;
	Wed,  2 Oct 2024 09:47:50 +0800 (AWST)
Message-ID: <ac786013183162b78181de85fd72b1eb7df81e3d.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 2/8] ARM: dts: aspeed: yosemite4: Add i2c-mux for
 four NICs
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>, 
	"patrick@stwcx.xyz"
	 <patrick@stwcx.xyz>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Date: Wed, 02 Oct 2024 11:17:49 +0930
In-Reply-To: <TYZPR04MB585305DCD18AF723B8A48480D6772@TYZPR04MB5853.apcprd04.prod.outlook.com>
References: <20240930070500.3174431-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240930070500.3174431-3-Delphine_CC_Chiu@wiwynn.com>
	 <fffb98e40d407c68dc3de6fd21c8a724be96e38a.camel@codeconstruct.com.au>
	 <TYZPR04MB585305DCD18AF723B8A48480D6772@TYZPR04MB5853.apcprd04.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 2024-10-01 at 07:52 +0000, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:
>=20
> > -----Original Message-----
> > From: Andrew Jeffery <andrew@codeconstruct.com.au>
> > Sent: Tuesday, October 1, 2024 8:37 AM
> > To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>;
> > patrick@stwcx.xyz; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Joel Stanley
> > <joel@jms.id.au>
> > Cc: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v1 2/8] ARM: dts: aspeed: yosemite4: Add i2c-mux fo=
r four
> > NICs
> >=20
> >  [External Sender]
> >=20
> >  [External Sender]
> >=20
> > On Mon, 2024-09-30 at 15:04 +0800, Delphine CC Chiu wrote:
> > > From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> > >=20
> > > Add i2c-mux on Spider board for four NICs and add the temperature
> > > sensor and EEPROM for the NICs.
> > >=20
> > > Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> > > Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> > > ---
> > >  .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 75
> > > ++++++++++++++++++-
> > >  1 file changed, 72 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git
> > > a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> > > b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> > > index dbc992a625b7..b813140b3c5b 100644
> > > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> > > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> > > @@ -26,6 +26,10 @@ aliases {
> > >               i2c21 =3D &imux21;
> > >               i2c22 =3D &imux22;
> > >               i2c23 =3D &imux23;
> > > +             i2c24 =3D &imux24;
> > > +             i2c25 =3D &imux25;
> > > +             i2c26 =3D &imux26;
> > > +             i2c27 =3D &imux27;
> > >               i2c34 =3D &imux34;
> > >               i2c35 =3D &imux35;
> > >       };
> > > @@ -1196,8 +1200,9 @@ adc@35 {
> > >  };
> > >=20
> > >  &i2c15 {
> > > +     #address-cells =3D <1>;
> > > +     #size-cells =3D <0>;
> > >       status =3D "okay";
> > > -     mctp-controller;
> >=20
> > Why are you deleting this if you're not also deleting the MCTP endpoint=
 node?
> >=20
> > Unless there's some reason this is related to the NICs, this should be =
its own
> > patch with its own justification.
> >=20
> > Andrew
> Hi Andrew,
>=20
> We have discussed with Jeremy from Code Construct about removing the
> mctp-controller on bus 15 before.
>=20
> He thought it would be better to add the mctp-controller on each i2c mux =
port
> so the MCTP driver would ensure that the mux was configured properly befo=
re
> communicating with the device.
>=20
> I'll split a patch to remove the mctp-controller on bus 15 in next serial=
 of patches.

Ah, so having looked through v2, I can see what you're trying to
achieve. I don't think it's necessary to split this out from the NIC
mux patch, they are related.

Andrew
