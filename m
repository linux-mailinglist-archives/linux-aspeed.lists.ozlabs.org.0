Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D6794062A
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2024 06:00:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=e13R1Vy+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WY1jf12gLz3cmC
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2024 14:00:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=e13R1Vy+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WY1jY6ByWz3cYk
	for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Jul 2024 14:00:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722312049;
	bh=5hs93budehkzX9Q4D8B3eGfGDY0os2f4EhftOfeCigs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=e13R1Vy+J5d8003I6X1CnM/oqYsLT6/EihQCuFuwUR4eEke67bbdSoF1TEMbhHnow
	 CLDFmdu6LFCPaL698kMpxw26JHv8Z+g3ahrWRQaWUu7sgACCGK9APgxwcSZpT6xOTd
	 OeXas52U+XyqKFXQYkNpUUd/SLK+Tqssu2juDTM/qku27sU0iBi0SHc8XIxVXfwYp4
	 /myOiiDoIt9KzGcvkYrXXVKZSfmsHDmBrDr/Cb9dQgZSKW2Q4TxZW5W4DR/Do6mvuk
	 cuRuWfA4lfmDdR0QHvzrSgFRZ0ffBorraK80LDiSl5ovWZRyHxcd0pIB8lYDFUc94G
	 WXes2/532E6Jw==
Received: from [192.168.68.112] (ppp118-210-29-70.adl-adc-lon-bras31.tpg.internode.on.net [118.210.29.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6A0B866CD3;
	Tue, 30 Jul 2024 12:00:48 +0800 (AWST)
Message-ID: <87dc3f83dfd85c2d6b81fb28b9058d59efc6b2c6.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 0/2] Add Meta(Facebook) Catalina BMC(AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>
Date: Tue, 30 Jul 2024 13:30:47 +0930
In-Reply-To: <CAGfYmwVSd846mX=WwhPu9dzZ0-d92jEzWG=dbDA+hQP+25uC9A@mail.gmail.com>
References: <20240726-potin-catalina-dts-v5-0-8f02305af527@gmail.com>
	 <172199921421.1507234.14901757413141840919.robh@kernel.org>
	 <6d73dcf20c726ad59e2aa16e507af17b3af59c42.camel@codeconstruct.com.au>
	 <CAGfYmwVSd846mX=WwhPu9dzZ0-d92jEzWG=dbDA+hQP+25uC9A@mail.gmail.com>
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
Cc: "Rob Herring \(Arm\)" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>, Conor Dooley <conor.dooley@microchip.com>, Cosmo Chou <cosmo.chou@quantatw.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 2024-07-29 at 09:50 +0800, Potin Lai wrote:
> On Mon, Jul 29, 2024 at 9:17=E2=80=AFAM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >=20
> > Hi Potin,
> >=20
> > On Fri, 2024-07-26 at 08:09 -0500, Rob Herring (Arm) wrote:
> > > On Fri, 26 Jul 2024 18:26:48 +0800, Potin Lai wrote:
> > > > Add Linux device tree entry related to Meta(Facebook) Catalina spec=
ific
> > > > devices connected to BMC(AST2600) SoC.
> > >=20
> > ...
> > >=20
> > > My bot found new DTB warnings on the .dts files added or changed in t=
his
> > > series.
> > >=20
> > > Some warnings may be from an existing SoC .dtsi. Or perhaps the warni=
ngs
> > > are fixed by another series. Ultimately, it is up to the platform
> > > maintainer whether these warnings are acceptable or not. No need to r=
eply
> > > unless the platform maintainer has comments.
> > >=20
> > > If you already ran DT checks and didn't see these error(s), then
> > > make sure dt-schema is up to date:
> > >=20
> > >   pip3 install dtschema --upgrade
> > >=20
> > >=20
> > > New warnings running 'make CHECK_DTBS=3Dy aspeed/aspeed-bmc-facebook-=
catalina.dtb' for 20240726-potin-catalina-dts-v5-0-8f02305af527@gmail.com:
> > >=20
> > >=20
> > ...
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/b=
us@1e78a000/i2c@100/i2c-mux@70/i2c@2/pwm@21: failed to match any schema wit=
h compatible: ['maxim,max31790']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/b=
us@1e78a000/i2c@100/i2c-mux@70/i2c@2/pwm@27: failed to match any schema wit=
h compatible: ['maxim,max31790']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/b=
us@1e78a000/i2c@100/i2c-mux@70/i2c@3/vrm@60: failed to match any schema wit=
h compatible: ['isil,raa228004']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/b=
us@1e78a000/i2c@100/i2c-mux@70/i2c@3/vrm@61: failed to match any schema wit=
h compatible: ['isil,raa228004']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/b=
us@1e78a000/i2c@100/i2c-mux@70/i2c@3/vrm@62: failed to match any schema wit=
h compatible: ['isil,raa228004']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/b=
us@1e78a000/i2c@400/ipmb@10: failed to match any schema with compatible: ['=
ipmb-dev']
> > ...
> >=20
> > The snipped errors are mostly from the DTSI, but these errors above are
> > specific to your DTS. Can you please address them?
> >=20
> > Andrew
>=20
> Hi Andrew,
>=20
> I tried to follow exist dts files to add the compatible strings, but
> all of them are showing error when I manual running "make ARCH=3Darm
> CHECK_DTBS=3Dy aspeed/aspeed-bmc-facebook-catalina.dtb".
>=20
> - "ipmb-dev": arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts at l=
ine 432
> - "max31790": arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts at l=
ine 196
> - "maxim,max31790": arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts
> at line 511
> - "isil,raa229004": arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts
> at line 512
>=20
> And there is no .yaml file for these drivers to check the proper
> compatible string.
> Do you have any suggestions in this case? Thank you.

Yes, please don't add any more cases of these warnings :)

Either get the bindings merged for these devices, or drop these nodes
from your devicetree (... and add them back later once the bindings are
merged).

Cheers,

Andrew
