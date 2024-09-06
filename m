Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94ADE96FC37
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 21:37:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0mjF14wGz30Ds
	for <lists+linux-aspeed@lfdr.de>; Sat,  7 Sep 2024 05:37:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725651467;
	cv=none; b=gdbT3/VAB3gGO8Xt/2wSOW7ke1HDi+4NyWvf9E+c01pdoH2rxRQRaKdOZU+W3ksdLiK47qEnxbmAWktJjUeiMcnwainjt/mYa3ZEHqfyeLj56TbBmoOdORKHoDV1vaTxCPuilbOgSc8usWqEqcuHVqnq0VxnjVLf5PELtu8tgnm0AQL3ITGwq5mh0swVhGLPjiMr2avxPLoU3NIsh0Wa0Wp0MC+n8KNVwb7QRu8N2EVYxpDi+lnITLEuYxBBDgMlXN6xkiDxyiAvn4WaGZb76Yg+a+WAJKHspd34pA6WpsD54IUj19cVz9wwCo5WRqnPZjloXNTP9c7jAgOC2KIgLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725651467; c=relaxed/relaxed;
	bh=75Xgl+lkVAyX1/SE6/qpwejrfutWGNhlgbES1YAcvxY=;
	h=DKIM-Signature:Date:Content-Type:MIME-Version:From:To:Cc:
	 In-Reply-To:References:Message-Id:Subject; b=Ii5zVWpCQd1P+EgP6NJAcN9SIKV8X6Ng3d41Vqx3RGjvUp8SVBcqB4abEscur7Ul5syFrWKpx3MPPrRgUdwPzq46i+IZ8DN3e47FMrO51tMzLyBfEmbvF2MnZSvMH4CbhvlWgrbxqqBRF4hVYv9AhVnl8baAYFa48xH08z2CmhMK6zd3ji+tjuKIS84JuXxYyGMej8xun5wkn8vud1gYjxvUuD9BQtMd2ho1yuNhXDAaVxAbE+DmDXHGP2gmVM+nVAIA10qcsCkpO/NhL1skdh5RAO/UOSsS4urP46+vXpanfAfy5WHZMxvqegfZ1snvXtJA7iQgnmWWlMCI0hpw9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lkMZ422a; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lkMZ422a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0mj71BkYz2ym2
	for <linux-aspeed@lists.ozlabs.org>; Sat,  7 Sep 2024 05:37:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B7135C5B72;
	Fri,  6 Sep 2024 19:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532BFC4CEC7;
	Fri,  6 Sep 2024 19:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725651463;
	bh=JOzcCz7eQkiMxz7Rpe+7eT+9/VRYAeuQzq1pPtkFPmU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=lkMZ422aWndWiERmyhGW1qnUfnTsDhmhmEkw38OzoZ4h3pKBXUa6hoF4pv1h4CUXL
	 G+StC+p0tQn2SuU8Fuf0iWXBB7VAa5m0g9fWVGAp06kO1ghlwoW5kNBaxbKbfKpc4+
	 UxXU+BJdtPb3uV3A4G/KYlIsI9mGjw9NBSCrmN0kIp7YN7XsiLrcSMpr9fkxtvwpzj
	 5tUexHz/7bDwdZZtQQbfVymCJtDtBpiSjGxZbPUJ2Q2zMB2TB8XxkWn3NWXrhb0Bz1
	 mt8ryK0cF6ma0/90HEmp4Wd1deGdfl2wT1eDutLgFN1lcMfe/oDVfu1AQoC+vi5ptn
	 /G4oRqTpCG51Q==
Date: Fri, 06 Sep 2024 14:37:42 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240906092438.1047225-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240906092438.1047225-1-Delphine_CC_Chiu@wiwynn.com>
Message-Id: <172565139933.2035193.3894583401733279611.robh@kernel.org>
Subject: Re: [PATCH v16 0/3] Add i2c-mux and eeprom devices for Meta
 Yosemite4
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Fri, 06 Sep 2024 17:24:34 +0800, Delphine CC Chiu wrote:
> From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> 
> Changelog:
>   - v16
>     - Reorganized the patches.
>     - Add i2c-mux and resolve the dt-validate errors.
>     - Revise Yosemite 4 devicetree for devices behind i2c-mux.
>     - Add mctp config and sensors for NIC after i2c-mux on bus 15.
>     - Add fan led config for BMC to control according the status of fan.
>   - v15
>     - Add ISL28022 support
>   - v14
>     - Add SQ52205 support
>     - Add GPIO I6 pin
>   - v13
>     - Add RTQ6056-support-on-bus-11
>   - v12
>     - Fix GPIO linename typo and add missing GPIO pin initial state.
>   - v11
>     - Revise all GPIO line name with bottom line
>   - v10
>     - adjust mgm cpld ioexp bus
>     - add GPIOO7 name
>     - remove mctp driver
>   - v9
>     - add XDP710 support
>     - add RTQ6056 support
>     - add MP5990 support
>   - v8
>     - add fan led config
>   - v7
>     - Revise pca9506 i2c address
>   - v6
>     - Revise i2c duty-cycle for meeting 400khz spec
>   - v5
>     - Support medusa board adc sensors
>     - support NIC eeprom
>   - v4
>     - Re-format gpio linename
>     - Revise i2c device node names
>     - Split patches by logic changes
>   - v3
>     - Correct patch for revising gpio name
>   - v2
>     - Revise mx31790 fan tach config
>     - Add mctp config for NIC
>     - Support mux to cpld
>     - Revise gpio name
>   - v1
>     - Add gpio and eeprom behind i2c-mux
>     - Remove redundant idle-state setting for i2c-mux
>     - Enable adc 15, wdt2,spi gpio for yosemite4 use
>     - Revise quad mode to dual mode to avoid WP pin influnece the SPI
>     - Revise power sensor adm1281 for yosemite4 schematic change
>     - Add gpio pca9506 I/O expander for yosemite4 use
>     - remove space for adm1272 compatible
>     - enable interrupt setting for pca9555
>     - add eeprom for yosemite4 medusa board/BSM use
>     - remove temperature sensor for yosemite4 schematic change
>     - add power sensor for power module reading
>     - Revise adc128d818 adc mode for yosemite4 schematic change
>     - Revise ina233 for yosemite4 schematic change
>     - Remove idle state setting for yosemite4 NIC connection
>     - Initialize bmc gpio state
>     - Revise mx31790 fan tach config
>     - Add mctp config for NIC
>     - Support mux to cpld
>     - Revise gpio name
> 
> Ricky CX Wu (3):
>   ARM: dts: aspeed: yosemite4: Revise i2c-mux devices
>   ARM: dts: aspeed: yosemite4: add mctp config and sensors for NIC
>   ARM: dts: aspeed: yosemite4: add fan led config
> 
>  .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 650 ++++++++++++++++--
>  1 file changed, 609 insertions(+), 41 deletions(-)
> 
> --
> 2.25.1
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


New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-facebook-yosemite4.dtb' for 20240906092438.1047225-1-Delphine_CC_Chiu@wiwynn.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:464.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c@480/i2c-mux@70/i2c@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:492.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c@480/i2c-mux@70/i2c@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:519.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c@480/i2c-mux@70/i2c@2:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:546.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c@480/i2c-mux@70/i2c@3:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:583.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c@500/i2c-mux@71/i2c@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:610.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c@500/i2c-mux@71/i2c@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:637.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c@500/i2c-mux@71/i2c@2:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:664.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c@500/i2c-mux@71/i2c@3:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:702.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c@580/i2c-mux@74/i2c@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:750.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c@580/i2c-mux@74/i2c@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:833.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c@680/i2c-mux@70/i2c@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:859.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c@680/i2c-mux@70/i2c@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:865.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c@680/i2c-mux@70/i2c@2:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:871.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c@680/i2c-mux@70/i2c@3:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:1110.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c@800/i2c-mux@72/i2c@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:1132.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c@800/i2c-mux@72/i2c@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:1154.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c@800/i2c-mux@72/i2c@2:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:1176.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c@800/i2c-mux@72/i2c@3:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:461.17-487.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@480/i2c-mux@70/i2c@0: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:461.17-487.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@480/i2c-mux@70/i2c@0: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:489.17-514.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@480/i2c-mux@70/i2c@1: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:489.17-514.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@480/i2c-mux@70/i2c@1: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:516.17-541.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@480/i2c-mux@70/i2c@2: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:516.17-541.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@480/i2c-mux@70/i2c@2: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:543.17-568.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@480/i2c-mux@70/i2c@3: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:543.17-568.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@480/i2c-mux@70/i2c@3: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:580.17-605.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@500/i2c-mux@71/i2c@0: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:580.17-605.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@500/i2c-mux@71/i2c@0: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:607.17-632.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@500/i2c-mux@71/i2c@1: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:607.17-632.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@500/i2c-mux@71/i2c@1: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:634.17-659.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@500/i2c-mux@71/i2c@2: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:634.17-659.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@500/i2c-mux@71/i2c@2: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:661.17-687.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@500/i2c-mux@71/i2c@3: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:661.17-687.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@500/i2c-mux@71/i2c@3: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:699.17-745.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@580/i2c-mux@74/i2c@0: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:699.17-745.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@580/i2c-mux@74/i2c@0: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:747.17-751.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@580/i2c-mux@74/i2c@1: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:747.17-751.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@580/i2c-mux@74/i2c@1: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:830.17-854.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@680/i2c-mux@70/i2c@0: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:830.17-854.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@680/i2c-mux@70/i2c@0: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:856.17-860.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@680/i2c-mux@70/i2c@1: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:856.17-860.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@680/i2c-mux@70/i2c@1: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:862.17-866.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@680/i2c-mux@70/i2c@2: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:862.17-866.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@680/i2c-mux@70/i2c@2: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:868.17-872.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@680/i2c-mux@70/i2c@3: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:868.17-872.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@680/i2c-mux@70/i2c@3: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:1107.17-1127.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@800/i2c-mux@72/i2c@0: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:1107.17-1127.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@800/i2c-mux@72/i2c@0: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:1129.17-1149.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@800/i2c-mux@72/i2c@1: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:1129.17-1149.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@800/i2c-mux@72/i2c@1: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:1151.17-1171.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@800/i2c-mux@72/i2c@2: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:1151.17-1171.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@800/i2c-mux@72/i2c@2: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:1173.17-1193.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@800/i2c-mux@72/i2c@3: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:1173.17-1193.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c@800/i2c-mux@72/i2c@3: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: pwm@20: '#address-cells', '#size-cells' do not match any of the regexes: '^fan-[0-9]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: pwm@2f: '#address-cells', '#size-cells' do not match any of the regexes: '^fan-[0-9]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c@780/i2c-mux@74/i2c@0/gpio@61: failed to match any schema with compatible: ['nxp,pca9552']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: pwm@20: '#address-cells', '#size-cells' do not match any of the regexes: '^fan-[0-9]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: pwm@2f: '#address-cells', '#size-cells' do not match any of the regexes: '^fan-[0-9]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c@780/i2c-mux@74/i2c@1/gpio@61: failed to match any schema with compatible: ['nxp,pca9552']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c@800/i2c-mux@72/i2c@0/temperature-sensor@3c: failed to match any schema with compatible: ['smsc,emc1403']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c@800/i2c-mux@72/i2c@1/temperature-sensor@3c: failed to match any schema with compatible: ['smsc,emc1403']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c@800/i2c-mux@72/i2c@2/temperature-sensor@3c: failed to match any schema with compatible: ['smsc,emc1403']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c@800/i2c-mux@72/i2c@3/temperature-sensor@3c: failed to match any schema with compatible: ['smsc,emc1403']





