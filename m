Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E584197E47E
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Sep 2024 03:09:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBlJ70y3cz2yS0
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Sep 2024 11:09:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727053749;
	cv=none; b=HNPYj7GmVDd2V0O/8WEjwdDjZvVsgGC0F1by6FIpXXUxYDCCORrabmQuefPaI2/p2ZKpm7+GUhY/3Rp/ewMMe04cMJXSGUuEOYPYoHjY4yC+JRG65adL6KelNInd0LyVzID3lFk4dHaOj3lQ84NA8REZ7CaKsMTlOMK2GxVwAVi7OTlJh27GzPd0F31GV7nf8VIA9hKPAuM2R8kC4B002ysT/RXoZKlPzNJHhPmvG/2Z8N/l1RAbwPEkNEqX1ibCC4x8LSdfv9CsTDX7zQ9WIcLSdazbsxnqHekZUOVdsREBFLJXzNOwqWUh6h4ao750le6YlCV/hThw95voBuchUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727053749; c=relaxed/relaxed;
	bh=+G0XJf/d/VA4rBfpqhj2Iciipn6AYGuPI900BalqIjA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WAgpnn89Ym0gBbumwcu7bWm+/wbrHXWKkGB6UHLf13aAmbMQAHXgPnrLiMhXlqnjYjceupaklL+0L9/0LkncGv5l8aSZ2acuMVPIl4PtnaDmVg69SXVzbWjgKve26dPYr3/tJKwaGFemezNemqccjjEdxiLqnAXfPvdtItX+M0ig9BW5IS4VKWBCP09ssfzPH20VSY1pc+67a55KoRH9FuL6S2zUoqL9VsFBpu1FfmgCcRati0yfdbaPQZJxQsbj+H4GgNIDWGpQlH/RlerOnaksfuwwTNlVQ2uwilbOsq7tKSWd+hAS4fULd9GZiTr5G95jx4pKFVAazZspCdN1/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=VPnfWP/C; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=VPnfWP/C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XBlJ545m6z2xgv
	for <linux-aspeed@lists.ozlabs.org>; Mon, 23 Sep 2024 11:09:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727053748;
	bh=+G0XJf/d/VA4rBfpqhj2Iciipn6AYGuPI900BalqIjA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VPnfWP/CS4BJC3Ym9/6/A95bxGfS166HiF09LDabbS3pKJuQyzlUMlAk/VdBpium4
	 f8rw9uQVUCKGYrxWXQUOjafLr74zaRd1B+Ya+Qy+LIY4FKFACd2TC5+41AcNYMXBgN
	 58sNuwy9X7AwrmGKVnIYGoS31qyd9Susx10NmNhiwOlBAwsv0wMv018U+kOy/Bnvlm
	 u5nGHmKypLjwb8kynHTxDBuWMmNXQdeFDtjueQ0V0j1ast8Hr0e/FcB9C4uzCBZNA7
	 XfE5o0ogJ1ex2QO9hipuVSw7pyw+iGpYNu7onj02iPTStQ00gqQ/2UclPpPFSN6v9W
	 KhAQnLM0ysIdA==
Received: from [192.168.68.112] (ppp118-210-177-92.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.92])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CBEF1640E8;
	Mon, 23 Sep 2024 09:09:06 +0800 (AWST)
Message-ID: <516706cb77ac88ff1b9d94a69b0e1ed54e184ec9.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/3] dt-bindings: trivial-devices: support MPS MP5023
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>, Guenter
 Roeck <linux@roeck-us.net>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>
Date: Mon, 23 Sep 2024 10:39:06 +0930
In-Reply-To: <TYZPR04MB5853BD9CD0774B40BAEF7BDFD66C2@TYZPR04MB5853.apcprd04.prod.outlook.com>
References: <20240918095438.1345886-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240918095438.1345886-3-Delphine_CC_Chiu@wiwynn.com>
	 <bf5258b8-a5a1-4cf3-9bd0-1fa44696c3b0@roeck-us.net>
	 <355b19a62e54aa979451d796c3ebe1e294a0cf45.camel@codeconstruct.com.au>
	 <TYZPR04MB5853BD9CD0774B40BAEF7BDFD66C2@TYZPR04MB5853.apcprd04.prod.outlook.com>
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
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Peter Yin <peteryin.openbmc@gmail.com>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Noah Wang <noahwang.wang@outlook.com>, Lukas Wunner <lukas@wunner.de>, Fabio Estevam <festevam@gmail.com>, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2024-09-20 at 01:54 +0000, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:
>=20
> > -----Original Message-----
> > From: Andrew Jeffery <andrew@codeconstruct.com.au>
> > Sent: Thursday, September 19, 2024 9:24 AM
> > To: Guenter Roeck <linux@roeck-us.net>; Delphine_CC_Chiu/WYHQ/Wiwynn
> > <Delphine_CC_Chiu@wiwynn.com>; patrick@stwcx.xyz; Rob Herring
> > <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dool=
ey
> > <conor+dt@kernel.org>
> > Cc: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>; Joel Stanley
> > <joel@jms.id.au>; Peter Yin <peteryin.openbmc@gmail.com>; Noah Wang
> > <noahwang.wang@outlook.com>; Javier Carrasco
> > <javier.carrasco.cruz@gmail.com>; Fabio Estevam <festevam@gmail.com>;
> > Lukas Wunner <lukas@wunner.de>; Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com>; devicetree@vger.kernel.org;
> > linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux-aspeed@lists.ozlabs.org
> > Subject: Re: [PATCH v2 2/3] dt-bindings: trivial-devices: support MPS M=
P5023
> >=20
> >  [External Sender]
> >=20
> >  [External Sender]
> >=20
> > On Wed, 2024-09-18 at 10:00 -0700, Guenter Roeck wrote:
> > > On 9/18/24 02:54, Delphine CC Chiu wrote:
> > > > From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> > > >=20
> > > > Add support for hot-swap controller MPS MP5023.
> > > >=20
> > > > Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> > > > Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> > > > --
> > >=20
> > > The hardware monitoring mailing list was not copied, so I assume that
> > > the expectation is that it will be applied through some other tree.
> >=20
> > We can take it through the BMC tree, but I'd prefer that the hardware
> > monitoring list were copied regardless.
> >=20
> > Ricky: Please do so for v3 onwards.
> >=20
> > Andrew
> Hi Guenter & Andrew,
>=20
> Would like to ask how to copy the hardware monitoring mailing list?

Not sure how best to answer this, but add it in the To: line for your
patches?=20

> Should I just send the v3 patch with only this dt-bindings patch for MP50=
23
> and it will be added in the mail automatically?

Well, if whatever process you're already using isn't adding it
automatically, I doubt it's going to start doing so now.

You can add it using the `--to` option to `b4 send` or `git send-
email`, for instance.

The details for the hwmon list are here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/MAI=
NTAINERS?h=3Dv6.11#n9836

Andrew
