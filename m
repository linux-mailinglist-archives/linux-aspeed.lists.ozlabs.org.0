Return-Path: <linux-aspeed+bounces-1752-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A32C2B0B2ED
	for <lists+linux-aspeed@lfdr.de>; Sun, 20 Jul 2025 02:06:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bl3jp2cmDz30RK;
	Sun, 20 Jul 2025 10:06:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752970014;
	cv=none; b=JJdbp07WCvFHvLynT7TKSyf5lZoy9BWvPCFMhGKSN/UtNROi/QGrYVpzxwc3K74N/cP2q1eUrcF8hxUVj5lF3FollMLZUV3eCsuxDNonuY7LqFpSRM/qhpI3HFtrNt3HsjFxLkN2OVwWxyIW9FH0LvT/ZWOZ+7fwGwSKLimdWVvLIEuNvwNFJ91FSlYYwZFHhc0igfwGB2Pqq0rw9KMjTELJ0S1TZyl8UkU2FahgvswF8W3QCV9r6HcrJsACvJb6s+caVGP6/0a5olw7y/xYlf1Iq1nzPuGUynCeo4Pu3xJhJrCWHYazmGuCbyWFiTBThrdABW30MQkC566LDaTAfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752970014; c=relaxed/relaxed;
	bh=VEtXqytOleSamfRzv1+tx7V6wWK7HwnVehLpRHKCUTs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=gkZKEIQcaI2cBYscvJopzqKucZKCEsDJNNwrVOXxIfyNEftCzjuWOK6cMasGJs+Kq9386bMonWSITHATRsOvlO9YHDSUKeSR8oG4pd7MyZKOoe063q2pL13FMs96V50Zvb3mMYkC9DFUKKg5Wdhhv1I6tT371xbbnK+oRizAx+oyADXfTmI8Qv4vSL+9UwjIeDWE6v13G1gTOGdp//QI0XYo4c31RHh0NdAACLXjX/DilQbZDXu+X8n/F1+TIEXCh1+FemoW6bynyn/kUS8ePnIrVT6a0wXhnzKzmqtHm2FBwQviJvOqd+fWx/S/y137DShQvP0RYvHseECzPCzdKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=orwDcGe0; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=orwDcGe0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bl3jm4Mz1z2xck
	for <linux-aspeed@lists.ozlabs.org>; Sun, 20 Jul 2025 10:06:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 701B2601EB;
	Sun, 20 Jul 2025 00:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 059C8C4CEE3;
	Sun, 20 Jul 2025 00:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752970009;
	bh=+V1eGtsMdumOtrhGcVf28gk3WcgUNe1E2q8dA1FyvsY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=orwDcGe012VhgyPa7PKU5nnVgHVz7xsEmeCNlQsrbxBxqx82kyeujzVgf7hO6Hdyb
	 U2OW+6IbTERO23Apc6fJhyNqR7q8NipPt0JBaYnrkXPABRd8aq1tkq9AZ+JkcBfMKS
	 Gopiv3hifBz4oJxGk4zf5IIMZV4q1qIy+uVvBmDNb3auUQf67FPID27a0TRvdv3jAG
	 oiokCFq35VXhS3aFUuR5kcYsepBVi8/S0tPZbVKBjfCopM866/EGOf86u+bNeH3FFK
	 yrB2ueeF5TeRooXGjX/UkpswyBjjHHTkUZS0F65ChL41Rk2OVFn/vo9TUJPhTs3UAC
	 qOXwnhuB5gf9w==
Date: Sat, 19 Jul 2025 19:06:48 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: bruce.jy.hung@fii-foxconn.com, leo.jt.wang@fii-foxconn.com, 
 linux-aspeed@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Kees Cook <kees@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
 Joel Stanley <joel@jms.id.au>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, george.kw.lee@fii-foxconn.com
To: Leo Wang <leo.jt.wang@gmail.com>
In-Reply-To: <20250717-add-support-for-meta-clemente-bmc-v8-0-2ff6afb36b0e@fii-foxconn.com>
References: <20250717-add-support-for-meta-clemente-bmc-v8-0-2ff6afb36b0e@fii-foxconn.com>
Message-Id: <175296991777.777229.6170492596613432717.robh@kernel.org>
Subject: Re: [PATCH v8 0/2] ARM: dts: Add support for Meta Clemente BMC
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Thu, 17 Jul 2025 22:58:58 +0800, Leo Wang wrote:
> This series adds initial support for the Meta Clemente BMC based on the
> ASPEED AST2600 SoC.
> 
> Patch 1 documents the compatible string.
> Patch 2 adds the device tree for the board.
> 
> Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
> ---
> Changes in v8:
> - Relocate IOBx_NICx_TEMP TMP421 sensors
> - Enable byte mode for i2c11
> - Link to v7: https://lore.kernel.org/r/20250716-add-support-for-meta-clemente-bmc-v7-0-d5bb7459c5aa@fii-foxconn.com
> 
> Changes in v7:
> - Relocate CBC FRU EEPROMs from i2c13 to i2c12.
> - Link to v6: https://lore.kernel.org/r/20250708-add-support-for-meta-clemente-bmc-v6-0-7f3e57bd0336@fii-foxconn.com
> 
> Changes in v6:
> - Correct Author email to match Signed-off-by email address.
> - Link to v5: https://lore.kernel.org/r/20250627-add-support-for-meta-clemente-bmc-v5-0-038ed6f1cb9f@fii-foxconn.com
> 
> Changes in v5:
> - Remove accidentally pasted texts.
> - Link to v4: https://lore.kernel.org/r/20250627-add-support-for-meta-clemente-bmc-v4-0-ce7ff23460c4@fii-foxconn.com
> 
> Changes in v4:
> - Move properties of nodes defined in the same file from label ref back to where they belong.
> - Move pinctrl default configs for ncsi3 and ncsi4 to aspeed-g6-pinctrl.dtsi.
> - Add properties to i2c10 and i2c15 to enable MCTP.
> - Link to v3: https://lore.kernel.org/r/20250623-add-support-for-meta-clemente-bmc-v3-0-c223ffcf46cf@fii-foxconn.com
> 
> Changes in v3:
> - Modify leakage sensor to reflect current design.
> - Link to v2: https://lore.kernel.org/r/20250621-add-support-for-meta-clemente-bmc-v2-0-6c5ef059149c@fii-foxconn.com
> 
> Changes in v2:
> - Fix patch 1/2 subject line to match dt-bindings convention.
> - Reorder device tree nodes in patch 2/2 to follow upstream DTS style.
> - Link to v1: https://lore.kernel.org/r/20250618-add-support-for-meta-clemente-bmc-v1-0-e5ca669ee47b@fii-foxconn.com
> 
> ---
> Leo Wang (2):
>       dt-bindings: arm: aspeed: add Meta Clemente board
>       ARM: dts: aspeed: clemente: add Meta Clemente BMC
> 
>  .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
>  arch/arm/boot/dts/aspeed/Makefile                  |    1 +
>  .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    | 1295 ++++++++++++++++++++
>  arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |   11 +
>  4 files changed, 1308 insertions(+)
> ---
> base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
> change-id: 20250618-add-support-for-meta-clemente-bmc-941a469bc523
> 
> Best regards,
> --
> Leo Wang <leo.jt.wang@fii-foxconn.com>
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


This patch series was applied (using b4) to base:
 Base: using specified base-commit 52da431bf03b5506203bca27fe14a97895c80faf

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/aspeed/' for 20250717-add-support-for-meta-clemente-bmc-v8-0-2ff6afb36b0e@fii-foxconn.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: timer (arm,armv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: bus@1e600000 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: /ahb/apb/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: lpc@1e789000 (aspeed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: lpc@1e789000 (aspeed,ast2600-lpc-v2): lpc-snoop@80: 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: kcs@24 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: kcs@28 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: kcs@2c (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: kcs@114 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: adc@34 (maxim,max1363): '#address-cells', '#size-cells', 'channel@0', 'channel@1', 'channel@2', 'channel@3' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/maxim,max1363.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: adc@35 (maxim,max1363): '#address-cells', '#size-cells', 'channel@0', 'channel@1', 'channel@2', 'channel@3' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/maxim,max1363.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: i2c@600 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('aspeed,enable-byte' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: fsi@1e79b000 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: fsi@1e79b100 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: /ahb/apb/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: kcs@24 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#






