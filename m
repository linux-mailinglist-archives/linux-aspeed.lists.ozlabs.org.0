Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5967C975EEE
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 04:34:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X41j916xZz2yS0
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 12:34:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726108443;
	cv=none; b=WeFZphP2H56gFtx2ME2LVkoy1xiKCsvYiiFotcGCeCEanq+9G9DzErxCM4jDbrapcvfHUuO/HSbEVRotyv+RVfUQ6yqR67gvdaUof3HYy9fe24V9VrdQmtZiDHYiPEhi6lzNbBr672TTA5GVeDzLLZ5xYb1woTnfrmNKQ0Ku+/vg8XdSSsQlASzyDFa724Kzg8t7awJwHdivA1+IprG7qJaIEaQqkAsA3zufYs4A2FIUdqc32gGF8QrWRz3e+I7DxG+QlHE636/9rHv2JAzlFjiA9QrH1CjjI71uLQeLiKOzbBaApuEvEXozlxkwuq+Lznc4+/U49g22c/x1mEyYFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726108443; c=relaxed/relaxed;
	bh=7YUclhj44Kyj9d/lxkh3kctrbYaslwM23zCN0mCChZM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kno3Qz0wa4ej1BX62WH0LqdGkbGonqcGwQcNnjIac0gYvNwOFAA3d1Ld7ebR7C+P/z6KIfaMUuH5Kv80dItmrc2GtmWfHb7XhZu++RrpfqlmchzomL7HaZDtafnpOHdkjCXQ/y/IKunGlyJIy2wa8FekNRED5+g8mCuBwYWYWbiaPl5vmbaIzoUgxNhFTVj9Tgv9koAppGBAgGz4siVTNpth70KO0tgtvvm24yRsajW681F5zPqBSeytEwcWTt+R5NSM7KjYMNmsmAZvc6u9LKgPWjJcMPv1LsVQJuJ6HIDsa3DusE6Zf5W31NRvDNrl5z1x8oSOgzDSnSBX4SSn2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=G1c8nAHP; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=G1c8nAHP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X41j72m26z2xy7
	for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Sep 2024 12:34:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726108442;
	bh=7YUclhj44Kyj9d/lxkh3kctrbYaslwM23zCN0mCChZM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=G1c8nAHP2+fWZgBrge/Lwz4XFo2Gch36lC54YlL0QKvRBbPfHBnG683b6H+gdN/5f
	 jL8OaGge60Bt9Bns2329yAR2KG2IwmvYNKVqD8CF6m9R0QOk2f+GIaNb6QvvHIyYs8
	 0KhJ4fSoKajZX8HISAuoncmrDA7xh+XjxNA24T+nZsPq8Th//cV450FS5QT8lr/fM4
	 MrdemVOky131UXBHUA1KID5dRASIAvnCHGSZATdqcNXAAWw0f4kacX9bsp1coLSJ24
	 ZwjX3UaSKqp0wEkchahAGOoklBKRF27+NCKh2GmKiITFxAQzXZkD379L4zUMFG1dfo
	 N1XhNR6Yid/VQ==
Received: from [192.168.68.112] (ppp118-210-89-8.adl-adc-lon-bras32.tpg.internode.on.net [118.210.89.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 177FB650D6;
	Thu, 12 Sep 2024 10:34:02 +0800 (AWST)
Message-ID: <39630cb9cf923eec6d8e229aea4e6fc5980aa73e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v18 0/3] Add i2c-mux and eeprom devices for Meta
 Yosemite4
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Ricky CX Wu
	 <ricky.cx.wu.wiwynn@gmail.com>
Date: Thu, 12 Sep 2024 12:04:01 +0930
In-Reply-To: <172589661042.199175.14634437656639420015.robh@kernel.org>
References: <20240909105420.441607-1-Delphine_CC_Chiu@wiwynn.com>
	 <172589661042.199175.14634437656639420015.robh@kernel.org>
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

On Mon, 2024-09-09 at 10:45 -0500, Rob Herring (Arm) wrote:
> On Mon, 09 Sep 2024 18:54:15 +0800, Delphine CC Chiu wrote:
> > From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> >=20
...
> >=20
> > Ricky CX Wu (3):
> >   ARM: dts: aspeed: yosemite4: Revise i2c-mux devices
> >   ARM: dts: aspeed: yosemite4: add mctp config and sensors for NIC
> >   ARM: dts: aspeed: yosemite4: add fan led config
> >=20
> >  .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 706 ++++++++++++++++--
> >  1 file changed, 660 insertions(+), 46 deletions(-)
> >=20
> > --
> > 2.25.1
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
mite4.dtb' for 20240909105420.441607-1-Delphine_CC_Chiu@wiwynn.com:
>=20
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: pwm@20: '#add=
ress-cells', '#size-cells' do not match any of the regexes: '^fan-[0-9]+$',=
 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: pwm@2f: '#add=
ress-cells', '#size-cells' do not match any of the regexes: '^fan-[0-9]+$',=
 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@=
1e78a000/i2c@780/i2c-mux@74/i2c@0/gpio@61: failed to match any schema with =
compatible: ['nxp,pca9552']
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: pwm@20: '#add=
ress-cells', '#size-cells' do not match any of the regexes: '^fan-[0-9]+$',=
 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: pwm@2f: '#add=
ress-cells', '#size-cells' do not match any of the regexes: '^fan-[0-9]+$',=
 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@=
1e78a000/i2c@780/i2c-mux@74/i2c@1/gpio@61: failed to match any schema with =
compatible: ['nxp,pca9552']
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@=
1e78a000/i2c@800/i2c-mux@72/i2c@0/temperature-sensor@3c: failed to match an=
y schema with compatible: ['smsc,emc1403']
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@=
1e78a000/i2c@800/i2c-mux@72/i2c@1/temperature-sensor@3c: failed to match an=
y schema with compatible: ['smsc,emc1403']
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@=
1e78a000/i2c@800/i2c-mux@72/i2c@2/temperature-sensor@3c: failed to match an=
y schema with compatible: ['smsc,emc1403']
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@=
1e78a000/i2c@800/i2c-mux@72/i2c@3/temperature-sensor@3c: failed to match an=
y schema with compatible: ['smsc,emc1403']
>=20

Please either:

1. Remove the offending nodes from your series so we don't add yet more
warnings, or
2. Write appropriate bindings and send them as part of the series

Regarding 1, you can always update the devicetree to add the nodes
after someone else has got the bindings merged. However, if you must
have the nodes, then you need to do 2.

Thanks,

Andrew
