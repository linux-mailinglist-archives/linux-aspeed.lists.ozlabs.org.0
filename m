Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A923393D3C2
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2024 15:09:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jwuOjQTf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVp504G0Bz3dLn
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2024 23:09:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jwuOjQTf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVp4r5MZtz3cK8
	for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2024 23:09:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1AF7DCE1748;
	Fri, 26 Jul 2024 13:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1CEC32782;
	Fri, 26 Jul 2024 13:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721999385;
	bh=iAGrV52cHbMBboTdMq+gQQiOugUcN8ulkje4eUWYYyA=;
	h=Date:From:To:List-Id:Cc:In-Reply-To:References:Subject:From;
	b=jwuOjQTfOTALWQKlNPyD+08Hxfy0tgwRB+EgBd3M3sinbPmynriEgYq5+4ElVcZgk
	 Thk51IQCg9IsD7xNwbAljuKoxIqGoo+OF5TbXF1nEcyod/IQrIJ7ryCAEy3XmNmukv
	 Y6t3J2FFTF/qFNWqgr5KcMhlakDydgU/YiX81uHfDlvkg3ydt1WCxh/CqPXEZ6Y/rR
	 cOGZyWS8I4owxuAHLIPJKZ1JGptEAmRCVmXzUjLP6fiHQTPi0lbinTVonh3mj9dG/E
	 tkfMaCTAmDS1AwrU/MJI/2SvopiOkDWkG7MqqMIXtixC9zSTgqY1nR3XtoDqnHxkNj
	 zA0UB/ogwaD/Q==
Date: Fri, 26 Jul 2024 08:09:43 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kevin Chen <kevin_chen@aspeedtech.com>
In-Reply-To: <20240726110355.2181563-1-kevin_chen@aspeedtech.com>
References: <20240726110355.2181563-1-kevin_chen@aspeedtech.com>
Message-Id: <172199921352.1507193.4411331020670815695.robh@kernel.org>
Subject: Re: [PATCH v1 00/10] Introduce ASPEED AST27XX BMC SoC
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
Cc: linux-aspeed@lists.ozlabs.org, catalin.marinas@arm.com, mturquette@baylibre.com, will@kernel.org, linux-clk@vger.kernel.org, m.szyprowski@samsung.com, quic_bjorande@quicinc.com, arnd@arndb.de, u-kumar1@ti.com, lee@kernel.org, geert+renesas@glider.be, andrew@codeconstruct.com.au, devicetree@vger.kernel.org, conor+dt@kernel.org, nfraprado@collabora.com, dmitry.baryshkov@linaro.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org, sboyd@kernel.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, olof@lixom.net, krzk+dt@kernel.org, shawnguo@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Fri, 26 Jul 2024 19:03:45 +0800, Kevin Chen wrote:
> This patchset adds initial support for the ASPEED.
> AST27XX Board Management controller (BMC) SoC family.
> 
> AST2700 is ASPEED's 8th-generation server management processor.
> Featuring a quad-core ARM Cortex A35 64-bit processor and two
> independent ARM Cortex M4 processors
> 
> This patchset adds minimal architecture and drivers such as:
> Clocksource, Clock and Reset
> 
> This patchset was tested on the ASPEED AST2700 evaluation board.
> 
> Kevin Chen (10):
>   dt-binding: mfd: aspeed,ast2x00-scu: Add binding for ASPEED AST2700
>     SCU
>   dt-binding: clk: ast2700: Add binding for Aspeed AST27xx Clock
>   clk: ast2700: add clock controller
>   dt-bindings: reset: ast2700: Add binding for ASPEED AST2700 Reset
>   dt-bindings: arm: aspeed: Add maintainer
>   dt-bindings: arm: aspeed: Add aspeed,ast2700-evb compatible string
>   arm64: aspeed: Add support for ASPEED AST2700 BMC SoC
>   arm64: dts: aspeed: Add initial AST27XX device tree
>   arm64: dts: aspeed: Add initial AST2700 EVB device tree
>   arm64: defconfig: Add ASPEED AST2700 family support
> 
>  .../bindings/arm/aspeed/aspeed.yaml           |    6 +
>  .../bindings/mfd/aspeed,ast2x00-scu.yaml      |    3 +
>  MAINTAINERS                                   |    3 +
>  arch/arm64/Kconfig.platforms                  |   14 +
>  arch/arm64/boot/dts/Makefile                  |    1 +
>  arch/arm64/boot/dts/aspeed/Makefile           |    4 +
>  arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi     |  217 +++
>  arch/arm64/boot/dts/aspeed/ast2700-evb.dts    |   50 +
>  arch/arm64/configs/defconfig                  |    1 +
>  drivers/clk/Makefile                          |    1 +
>  drivers/clk/clk-ast2700.c                     | 1166 +++++++++++++++++
>  .../dt-bindings/clock/aspeed,ast2700-clk.h    |  180 +++
>  .../dt-bindings/reset/aspeed,ast2700-reset.h  |  126 ++
>  13 files changed, 1772 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/aspeed/Makefile
>  create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi
>  create mode 100644 arch/arm64/boot/dts/aspeed/ast2700-evb.dts
>  create mode 100644 drivers/clk/clk-ast2700.c
>  create mode 100644 include/dt-bindings/clock/aspeed,ast2700-clk.h
>  create mode 100644 include/dt-bindings/reset/aspeed,ast2700-reset.h
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


New warnings running 'make CHECK_DTBS=y aspeed/ast2700-evb.dtb' for 20240726110355.2181563-1-kevin_chen@aspeedtech.com:

arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /: failed to match any schema with compatible: ['aspeed,ast2700a1-evb', 'aspeed,ast2700']
arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /: failed to match any schema with compatible: ['aspeed,ast2700a1-evb', 'aspeed,ast2700']
arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: l2-cache0: 'cache-unified' is a dependency of 'cache-size'
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: l2-cache0: 'cache-unified' is a dependency of 'cache-sets'
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: l2-cache0: 'cache-unified' is a dependency of 'cache-line-size'
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: l2-cache0: 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: l2-cache0: Unevaluated properties are not allowed ('cache-level', 'cache-line-size', 'cache-sets', 'cache-size' were unexpected)
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sram@10000000: #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sram@10000000: #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sram@10000000: 'exported@0' does not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@10000000/syscon@12c02000: failed to match any schema with compatible: ['aspeed,ast2700-scu0', 'syscon', 'simple-mfd']
arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@10000000/syscon@12c02000/interrupt-controller@1D0: failed to match any schema with compatible: ['aspeed,ast2700-scu-ic0']
arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@10000000/syscon@12c02000/interrupt-controller@1E0: failed to match any schema with compatible: ['aspeed,ast2700-scu-ic1']
arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/syscon@14c02000: failed to match any schema with compatible: ['aspeed,ast2700-scu1', 'syscon', 'simple-mfd']
arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: serial@14c33b00: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: serial@14c33b00: 'pinctrl-0' is a dependency of 'pinctrl-names'
	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#





