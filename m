Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEE4979A0C
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Sep 2024 05:05:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6VCV507vz2yWr
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Sep 2024 13:05:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726455925;
	cv=none; b=RGzEqdjZWH66YhUOaDGCY4JmWNXRYdb0xXutSuhqKnggkRtIUxrv04E77jHXV8wgI4ENc1Eoz6lVkmM9uAoEpHh7RiCK1OB1axenjsQGpEbLErGYeS5yKlqt9q7jtA3VCd1YpDGQ05Uwr/ZZG33RWDXWm/hlda1jXkuh+Sfl/9NUJpgF+t3qjyD8QyCLJ1h/XG/cl8Xa0GnVI8EYBsD5gjyaOqAZrappCUFgpFyj44K7R2q1BzmuLTgvAncEOPougcAmwonqL1MCqUocSG+BLIHZ+t/Caxyyb+2yy+hxWAkudJjS0MLZaHPzjSZ/4V8W0hlqjYhvzaShFl9cMLncnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726455925; c=relaxed/relaxed;
	bh=b4aPzdKJ99+8nbf9/pwFtWuXuCfyXaWcetBCqR9CkIg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JofrvdfVd7h6zkstk9oTcAw7FoGbTkGBWp+ib7LD1YaJw4mw3N1DhnFzdYzN2fWisMaPSeX0FPjt4kh49M7SNOIMUOGiAYkRIPGa0MgrMfyd7NLdy68S5ISkSoPtOjAcQf44zMBQcT23nZzV9M34j14wbcyXmGVZL8LGy5tYIdmcrbCg7xZkVqwd/wf1tNiIeRtvb3nXOMoPtCsU4vxjaZjZHO0x9HRn1m9NS9HkYLA7RjxR7p+hgHv2ed1rFfRfZjdcXOkNhOhzc/F8IOsiq5jtxoovWL7rYk5dnOabtoiPgfmdaE4gZnN3qTMD1FOzbBJaPnkXkik60VMun4PJvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=XIB5v7pq; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=XIB5v7pq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6VCS6vcYz2xs8
	for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Sep 2024 13:05:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726455924;
	bh=b4aPzdKJ99+8nbf9/pwFtWuXuCfyXaWcetBCqR9CkIg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XIB5v7pqm0HLKI8xDjUR88PYDtxQHFhQ2cI+x8sfAHyoEs+wmShl9smp93Fg8SMa3
	 dH5/LtmaCPJBZEav8qJdbXp5mYFKTHdN7kpD4e8glJ9rgqEX5+s8J2FtBDbvkfA0EL
	 ygaOavTjBoPJ9TfgYPOHtjvjJyE9P64rQsasm3cx8JmZpZfP/mlqKMCSHTff3P0zc9
	 u3VmWd6eq10HQnT03Loh0fWaAy9KCHsXP8eGCVzlZn1SNNWDiLizAnOOWdKjix3kF1
	 Ofr0lXHp6iwIPweLJBZwLiKW3CaGFy9erBWUMMqnJPlfh5uLMctamH3FlkWtygMuQL
	 oQf42QZSua8aA==
Received: from [192.168.68.112] (ppp118-210-161-36.adl-adc-lon-bras34.tpg.internode.on.net [118.210.161.36])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0399B65027;
	Mon, 16 Sep 2024 11:05:22 +0800 (AWST)
Message-ID: <a18eff1095e1ddffa8eb44fb4a76a0b458213a62.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 2/2] ARM: dts: aspeed: yosemite4: Add gpio pca9506
 for CPLD IOE
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>, 
	"patrick@stwcx.xyz"
	 <patrick@stwcx.xyz>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Date: Mon, 16 Sep 2024 12:35:22 +0930
In-Reply-To: <TYZPR04MB5853062387962EB4CA08A366D6652@TYZPR04MB5853.apcprd04.prod.outlook.com>
References: <20240910054751.2943217-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240910054751.2943217-3-Delphine_CC_Chiu@wiwynn.com>
	 <ccef1d90b9a7eb343e99afa2c6cd6ea7407b0541.camel@codeconstruct.com.au>
	 <TYZPR04MB5853B6611AF9AA5C3E5AE778D6652@TYZPR04MB5853.apcprd04.prod.outlook.com>
	 <TYZPR04MB5853062387962EB4CA08A366D6652@TYZPR04MB5853.apcprd04.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2024-09-13 at 03:26 +0000, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:
>=20
> > -----Original Message-----
> > From: Delphine_CC_Chiu/WYHQ/Wiwynn
> > Sent: Friday, September 13, 2024 10:08 AM
> > To: Andrew Jeffery <andrew@codeconstruct.com.au>;
> > Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>;
> > patrick@stwcx.xyz; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Joel Stanley
> > <joel@jms.id.au>
> > Cc: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
> > Subject: RE: [PATCH v1 2/2] ARM: dts: aspeed: yosemite4: Add gpio pca95=
06
> > for CPLD IOE
> >=20
> >=20
> >=20
> > > -----Original Message-----
> > > From: Andrew Jeffery <andrew@codeconstruct.com.au>
> > > Sent: Thursday, September 12, 2024 10:11 AM
> > > To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>;
> > > patrick@stwcx.xyz; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Joel Stanle=
y
> > > <joel@jms.id.au>
> > > Cc: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>;
> > > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > > linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
> > > Subject: Re: [PATCH v1 2/2] ARM: dts: aspeed: yosemite4: Add gpio
> > > pca9506 for CPLD IOE
> > >=20
> > >  [External Sender]
> > >=20
> > >  [External Sender]
> > >=20
> > > On Tue, 2024-09-10 at 13:47 +0800, Delphine CC Chiu wrote:
> > > > From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> > > >=20
> > > > We use CPLD to emulate gpio pca9506 I/O expander on each server
> > > > boards.
> > > > Therefore, add pca9506 to probe driver for the CPLD I/O expander.
> > >=20
> > > I think it might be best if you add your own compatible to the list i=
n
> > > the gpio-pca95xx binding just in case there are some behavioural
> > > quirks of your CPLD implementation? Not sure if this should be
> > > "facebook,pca9506" or "wywinn,pca9506", but assuming facebook, from
> > > there you can specify
> > >=20
> > >     compatible =3D "facebook,pca9506", "nxp,pca9506";
> > >=20
> > > This allows you to add the quirks to the driver as required in the
> > > future through the more-specific compatible.
> > >=20
> > > Andrew
> >=20
> > Hi Andrew,
> >=20
> > Thanks for the review.
> > I'll add the "facebook,pca9506" in gpio-pca95xx binding in next version=
 of
> > patches.
>=20
> Hi Andrew,
>=20
> I tried to add "facebook,pca9506" in the compatible list of gpio-pca95xx =
binding
> and add compatible =3D "facebook,pca9506", "nxp,pca9506" but got followin=
g failed
> messages:
>     gpio@21: compatible: 'oneOf' conditional failed, one must be fixed:
>         ['facebook,pca9506', 'nxp,pca9506'] is too long
>         'diodes,pi4ioe5v6534q' was expected
>         'nxp,pcal6534' was expected
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.=
yaml#
> Would like to ask do you have any suggestions? Thanks.

Mmm, maybe it's best if we leave the compatible as just 'nxp,pca9506'
for now, but if you do discover quirks then we can consider this again.

Andrew
