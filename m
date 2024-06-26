Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C9E918272
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 15:31:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R7jeLE29;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8Mzv52ndz3cFN
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 23:31:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R7jeLE29;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8Mzn3j2Lz3c05
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 23:31:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD5A7619FD;
	Wed, 26 Jun 2024 13:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F693C2BD10;
	Wed, 26 Jun 2024 13:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719408690;
	bh=qWRZjYdp6f0m7F2CPEnOeoB7wAZFdZxYUWa0DLizaZs=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=R7jeLE29XB+cvHIPvyIyRJcrkMxEW5ws6Wh4978oi2akpn6WdF5kDSjm/KjNozEkF
	 nKuti987SfpPxl03XISvVyULKG4QjvWq6gHMIaFMWgSXsXM5+qxuDvU1c7XUeoOX6C
	 9TjMHyBKwatoLS9wiVdVmFofbXQbREZVsORFi071mhIgtDJQJ9LcBan+yQTRjtEvlJ
	 AcORB5oi1FFKTFcgl2xrpVJRKXyLAde9IGafuWemicR39ET+8CliOcZ9cSMy6NLTwr
	 3zJavJcJAJ4wXiLb6qlX4d+sowu57kYbkzRJrwTvHtfmwO1s0hafO03xDWzi1mlPUP
	 EliXnIUIqrw/A==
Date: Wed, 26 Jun 2024 07:31:29 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yang Chen <yangchen.openbmc@gmail.com>
In-Reply-To: <20240625121835.751013-1-yangchen.openbmc@gmail.com>
References: <20240625121835.751013-1-yangchen.openbmc@gmail.com>
Message-Id: <171940832692.2961326.910026599869370818.robh@kernel.org>
Subject: Re: [PATCH 00/17] Revise Facebook Minerva BMC DTS
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
Cc: devicetree@vger.kernel.org, Jerry.Lin@quantatw.com, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, andrew@codeconstruct.com.au, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Tue, 25 Jun 2024 20:18:18 +0800, Yang Chen wrote:
> Revise the Linux device tree entry related to Facebook platform Minerva
> specific devices connected to the Aspeed AST2600 BMC.
> 
> Yang Chen (17):
>   ARM: dts: aspeed: minerva: change the address of tmp75
>   ARM: dts: aspeed: minerva: Add spi-gpio
>   ARM: dts: aspeed: minerva: change aliases for uart
>   ARM: dts: aspeed: minerva: add eeprom on i2c bus
>   ARM: dts: aspeed: minerva: change RTC reference
>   ARM: dts: aspeed: minerva: enable mdio3
>   ARM: dts: aspeed: minerva: remove unused bus and device
>   ARM: dts: aspeed: minerva: Define the LEDs node name
>   ARM: dts: aspeed: minerva: Add adc sensors for fan board
>   ARM: dts: aspeed: minerva: add linename of two pins
>   ARM: dts: aspeed: minerva: enable ehci0 for USB
>   ARM: dts: aspeed: minerva: add tmp75 sensor
>   ARM: dts: minerva: add power monitor xdp710
>   ARM: dts: aspeed: minerva: revise sgpio line name
>   ARM: dts: aspeed: minerva: Switch the i2c bus number
>   ARM: dts: aspeed: minerva: remove unused power device
>   ARM: dts: aspeed: minerva: add ltc4287 device
> 
>  .../aspeed/aspeed-bmc-facebook-minerva.dts    | 516 +++++++++++++-----
>  1 file changed, 373 insertions(+), 143 deletions(-)
> 
> --
> 2.34.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-facebook-minerva.dtb' for 20240625121835.751013-1-yangchen.openbmc@gmail.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /: spi-gpio: {'status': ['okay'], 'compatible': ['spi-gpio'], '#address-cells': 1, '#size-cells': 0, 'gpio-sck': [61, 203, 0], 'gpio-mosi': [61, 204, 0], 'gpio-miso': [61, 205, 0], 'num-chipselects': 1, 'cs-gpios': [[61, 200, 1]], 'tpmdev@0': {'compatible': ['infineon,slb9670', 'tcg,tpm_tis-spi'], 'spi-max-frequency': 33000000, 'reg': [[0]]}} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: spi-gpio: $nodename:0: 'spi-gpio' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: spi-gpio: gpio-sck: False schema does not allow [61, 203, 0]
	from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: spi-gpio: gpio-miso: False schema does not allow [61, 205, 0]
	from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: spi-gpio: gpio-mosi: False schema does not allow [61, 204, 0]
	from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: spi-gpio: 'sck-gpios' is a required property
	from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: spi-gpio: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'gpio-miso', 'gpio-mosi', 'gpio-sck', 'tpmdev@0' were unexpected)
	from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: tpmdev@0: $nodename:0: 'tpmdev@0' does not match '^tpm(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm_tis-spi.yaml#





