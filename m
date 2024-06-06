Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F6E8FDC27
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Jun 2024 03:31:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=cfhxf0BR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvmyY0PDwz3cVW
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Jun 2024 11:31:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=cfhxf0BR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvmyQ6C46z30Vp;
	Thu,  6 Jun 2024 11:31:42 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AE9EB20154;
	Thu,  6 Jun 2024 09:31:41 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717637502;
	bh=7Y+Fi/S9iFVYn77ci9owMZTSbegdzVDaxHeOlwRPaGs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cfhxf0BRfejrV5lGw89SKoK1CFwOsuKcHCvYL51e3sedQbbXH7LkO2OVLK18OfMbA
	 PEruDGnP2IC12lpC9J2m9GGQiCn78Xzv4YXrO2sOuDr59rNv/w+WWX50Q7KN04ekul
	 ioLz+hMseo7hu5KR2i93Kj85l0zwr5C3EfgaM+j2zUgrDR8owgcc4cDvX16/dgqwIM
	 l+2A7fmAo5e7DYHZNwToQyGhwPcaHpfoPVcBt2rcPW3mcujn3aEiEcP/tFoXABXcQn
	 QQy1CMxr2LBL/LqCUh9qj1HtEgbjrwaP24ZkU/ZTwusVkfs8mWVK6OKEm1i+jdd/lv
	 o8FLgQ3gr/LXg==
Message-ID: <b40486cf90de44bad177f034d13d8ab69ad9aac8.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 00/20] ARM: dts: aspeed: Add IBM P11 BMC systems
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org
Date: Thu, 06 Jun 2024 11:01:41 +0930
In-Reply-To: <f2f70d62-3edb-4273-b40e-430d789f19dc@linux.ibm.com>
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
	 <f2f70d62-3edb-4273-b40e-430d789f19dc@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, robh@kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org, linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Eddie,

On Wed, 2024-06-05 at 10:47 -0500, Eddie James wrote:
> On 5/22/24 14:25, Eddie James wrote:
> > Add the Blueridge and Fuji BMC systems. Document many missing FSI relat=
ed
> > properties, and fix existing warnings. Make some minor fixes in OCC and
> > SCOM drivers for the updated bindings.
>=20
>=20
> Hi Joel/Andrew, what else needs to be fixed before this can be merged=20
> (minus Huygens patch which I will resend)? I believe all the patches=20
> have been reviewed.
>=20

Firstly, thanks for your work here on the FSI bindings.

However, the series is a bit awkward, as it sandwiches Aspeed
devicetree patches that should go through Joel's bmc tree between the
bindings and driver fixes that should go through the FSI tree.

This is potentially less of a problem for Joel as he's the maintainer
for both, but it's not my place to be touching the FSI tree.=20

For now I've applied the dts patches and pushed them here after
dropping the Huygens patch:

https://github.com/amboar/linux/commits/for/bmc/dt-6.11/

But I would appreciate it if you split series by subsystem in the
future (see my comments on the other FSI series you have out for
review).

Andrew

>=20
> Thanks,
>=20
> Eddie
>=20
>=20
> >=20
> > Changes since v5:
> >   - Switch from clock-frequency to bus-frequency for common FSI control=
ler
> >     properties
> >   - Add reg properties for AST2700 FSI controller
> >   - Fix patternProperties for i2c bus nodes under FSI-based I2C control=
ler
> >   - Add bus-frequency for P11 FSI device tree node
> >   - Change model name from Blueridge to Blueridge 2U
> >   - Add missing reset gpio to led controller on Fuji
> >   - Add Huygens (Rainier with modified FSI wiring)
> >=20
> > Eddie James (20):
> >    spi: dt-bindings: Document the IBM FSI-attached SPI controller
> >    dt-bindings: fsi: fsi2spi: Document SPI controller child nodes
> >    dt-bindings: fsi: Document the IBM SCOM engine
> >    dt-bindings: fsi: p9-occ: Convert to json-schema
> >    dt-bindings: fsi: Document the IBM SBEFIFO engine
> >    dt-bindings: fsi: Document the FSI controller common properties
> >    dt-bindings: fsi: ibm,i2cr-fsi-master: Reference common FSI controll=
er
> >    dt-bindings: fsi: ast2600-fsi-master: Convert to json-schema
> >    dt-bindings: fsi: Document the AST2700 FSI controller
> >    dt-bindings: fsi: Document the FSI Hub Controller
> >    dt-bindings: i2c: i2c-fsi: Convert to json-schema
> >    dt-bindings: arm: aspeed: add IBM P11 BMC boards
> >    ARM: dts: aspeed: Add IBM P11 FSI devices
> >    ARM: dts: aspeed: Add IBM P11 Blueridge BMC system
> >    ARM: dts: aspeed: Add IBM P11 Blueridge 4U BMC system
> >    ARM: dts: aspeed: Add IBM P11 Fuji BMC system
> >    ARM: dts: aspeed: Add IBM Huygens BMC system
> >    fsi: occ: Get device number from FSI minor number API
> >    fsi: occ: Find next available child rather than node name match
> >    fsi: scom: Update compatible string to match documentation
> >=20
> >   .../bindings/arm/aspeed/aspeed.yaml           |    2 +
> >   .../fsi/aspeed,ast2600-fsi-master.yaml        |  121 +
> >   .../bindings/fsi/fsi-controller.yaml          |   66 +
> >   .../bindings/fsi/fsi-master-aspeed.txt        |   36 -
> >   .../devicetree/bindings/fsi/ibm,fsi2spi.yaml  |   36 +-
> >   .../bindings/fsi/ibm,i2cr-fsi-master.yaml     |    5 +-
> >   .../bindings/fsi/ibm,p9-fsi-controller.yaml   |   45 +
> >   .../devicetree/bindings/fsi/ibm,p9-occ.txt    |   16 -
> >   .../devicetree/bindings/fsi/ibm,p9-occ.yaml   |   40 +
> >   .../bindings/fsi/ibm,p9-sbefifo.yaml          |   46 +
> >   .../devicetree/bindings/fsi/ibm,p9-scom.yaml  |   37 +
> >   .../devicetree/bindings/i2c/i2c-fsi.txt       |   40 -
> >   .../devicetree/bindings/i2c/ibm,i2c-fsi.yaml  |   76 +
> >   .../devicetree/bindings/spi/ibm,spi-fsi.yaml  |   55 +
> >   MAINTAINERS                                   |    2 +-
> >   arch/arm/boot/dts/aspeed/Makefile             |    3 +
> >   .../aspeed/aspeed-bmc-ibm-blueridge-4u.dts    |   21 +
> >   .../dts/aspeed/aspeed-bmc-ibm-blueridge.dts   | 1691 +++++++
> >   .../boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts   | 3881 ++++++++++++++++=
+
> >   .../dts/aspeed/aspeed-bmc-ibm-huygens.dts     |   23 +
> >   .../arm/boot/dts/aspeed/ibm-power11-quad.dtsi | 1539 +++++++
> >   drivers/fsi/fsi-occ.c                         |   49 +-
> >   drivers/fsi/fsi-scom.c                        |    1 +
> >   23 files changed, 7694 insertions(+), 137 deletions(-)
> >   create mode 100644 Documentation/devicetree/bindings/fsi/aspeed,ast26=
00-fsi-master.yaml
> >   create mode 100644 Documentation/devicetree/bindings/fsi/fsi-controll=
er.yaml
> >   delete mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-a=
speed.txt
> >   create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-fsi-c=
ontroller.yaml
> >   delete mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.t=
xt
> >   create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.y=
aml
> >   create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-sbefi=
fo.yaml
> >   create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-scom.=
yaml
> >   delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-fsi.txt
> >   create mode 100644 Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.=
yaml
> >   create mode 100644 Documentation/devicetree/bindings/spi/ibm,spi-fsi.=
yaml
> >   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-=
4u.dts
> >   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.=
dts
> >   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts
> >   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-huygens.dt=
s
> >   create mode 100644 arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi
> >=20

