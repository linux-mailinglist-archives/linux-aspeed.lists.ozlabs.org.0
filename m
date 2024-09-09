Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C599C971E5C
	for <lists+linux-aspeed@lfdr.de>; Mon,  9 Sep 2024 17:45:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2WPc3hTpz2yY1
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 01:45:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725896722;
	cv=none; b=HReBjn+uIBdY20VThIMnGPFlq8RXu92Zgu+Ri/p2mx59xZM4knvTV6fDxUlY3z1c7o3Tc20LlF53WFrwEYSD4rNm6BjBkCVUCbLpqnrMuQ/XnR2Gm6coD9Hfd6CvA8xG98A4QYfU42q3dHSJL6A6m4q8Ax6AqXOt+nTb/45QUHXaEIcw7gm82YCVRKYPz0QPBwxx3Q42PXHzQGMgafoZumEzSrhC9cAH/Poyj9MEJkJ9aLO0fBeJrTu7scsGzCz5pRtoylFyx95JXGMx+3LTPLF8+JO7wS+Cox/9RNxz+a5M3puQ4nhL2OOrGBUltUt5UpV/Qeg09uER2XlyPXdQbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725896722; c=relaxed/relaxed;
	bh=I0CaNfbxk/dbhF76UdUxhkm77qYC8V3QF//s6HB1aeM=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Y/ni4La+ZXsmnI2s6Ti2PZgM5/dwdHnhC0PjGSvR7lGlzYXKTIttwCrSfS/7AHXiCrjtXJjwkhP6pCRPBocaDsa8wN7JDCFhdBJKEb1jJeOkKiLkYqLxb/RxF7Pe/EaONRuLQS0ZUQuaYoLFRZZFfxkniWHAFNr9zbwCdElJQgl0kecsXxdLlZWSH5qumuzk3H+Y5OTlfFJS2+RB8KPheiQdJxeVVNtrs0t90IL1WkQTonN34SA78K/Ix/DpvAWVLqaY1UJgBaYIbKdao4n7DQOSoGg+XieovlnnQVWeIxmAvX7e/wsW4BWBk27lRB7Hl5NuZlpgdr4dvbU3DW0sSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oovaTBbY; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oovaTBbY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2WPZ24rXz2yN4
	for <linux-aspeed@lists.ozlabs.org>; Tue, 10 Sep 2024 01:45:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ACA3AA41331;
	Mon,  9 Sep 2024 15:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE5CC4CEC7;
	Mon,  9 Sep 2024 15:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725896718;
	bh=Ur507D/9IZAyiU6XEqp8riPXsLXhfJupKj8cr1+m2pE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=oovaTBbY3CzWuyUKTX786FZQwx2gT3U5PUPQ9XoK0h08O2YTXJ9fnHsmfPCaZlAvZ
	 Ovw5vm45HMw/seE0fw/A8j007TWa6qotq6HeP3Rb2P/C/FwSv3/fiQzWwq4YAcfmYo
	 oJeC53COu7aI84MQHUDwM72zbF7EOH9B4M3BtXrNFifVjKEbu4GCTC0h5zr/G2ltaj
	 9jvC2R8obKb1i1FGs6HGAXwp5MR5a3RAZePIWNni2pmmoNxqyJeWrR+2yHFQD0iQwo
	 eLptuClzZPUkU9B9kbCOry2utj2hjnKdbGfPzCIlh441+GytAHNAwHCEKdEvHHm1ZK
	 RIPKEBGS8EsEg==
Date: Mon, 09 Sep 2024 10:45:17 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240909105420.441607-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240909105420.441607-1-Delphine_CC_Chiu@wiwynn.com>
Message-Id: <172589661042.199175.14634437656639420015.robh@kernel.org>
Subject: Re: [PATCH v18 0/3] Add i2c-mux and eeprom devices for Meta
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Krzysztof Kozlowski <krzk+dt@kernel.org>, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Mon, 09 Sep 2024 18:54:15 +0800, Delphine CC Chiu wrote:
> From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> 
> Changelog:
>   - v18
>     - Fix warnings for reg_format reporting by dts checking tool.
>   - v17
>     - Add SoB for the patches.
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
>  .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 706 ++++++++++++++++--
>  1 file changed, 660 insertions(+), 46 deletions(-)
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


New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-facebook-yosemite4.dtb' for 20240909105420.441607-1-Delphine_CC_Chiu@wiwynn.com:

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





