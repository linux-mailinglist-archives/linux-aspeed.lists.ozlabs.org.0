Return-Path: <linux-aspeed+bounces-1896-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E9EB19A67
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Aug 2025 05:09:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwM3p3RZlz30Wn;
	Mon,  4 Aug 2025 13:09:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754276982;
	cv=none; b=Fm/CbUTAiCYZi67xjd0NB6z4t0J8PlQPrh2LgCVoAtwtc4lLn5LelphKPPnn+FwZFVi9hws9H9ukDMpMm4ClfPvWuxhmOUzIZHvSpgKnZBtATdFzcrG8At3g8C4DdKoyHzboOYKVpgyoG/lR46ODMS9tW+5mziPbH1OAxR6pXLiGduJgobTA5Bq6O+JENC7MCqsGrH1DyeRVja5Plm5BszD67vljcAh2G9OnIuBVZUe7DTYMSeJ/fZ6WgymXK7Df9UuQKvoaS1TUoGzJm+N2byEJWyThB3PNCGAd3mlC1UcPMX17R7+ZPa6F19umillXRGV3qthLddtT+ojptfx5PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754276982; c=relaxed/relaxed;
	bh=9XEaU/CLJ530FZN2d/lKZlC5TxydfxwNCLreFw+FezU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=QXZjDz+2DraEz337aBnNzwMGq1lJaM9MFaQ7PXJmJhNAPkBQ0T/mDI6kRQTklfaVsvrT8REEo/JYzO06FZCuHsW+EGSHsNIVTNSwAeAzuONKUXLetlAylQhboXjIbhrPRj/T0hVyMF0bnJ9nV9bh6gxnhjDA13GqAh4M8UipyQ/aCqEqtb7hpjqdrEAkU3a/RDr6cJX9EuEskBPHxI1p/zXotQ0RoHlBzeDXcTnW1ZH+1UyehcZ2YKNxMs/q0SIxWAL5yjknocf3VVyefOR1BzyCni/FdASn7jR8ruApsceX3MaE8wQjfPq7FxNG2//ajFaBG6s/qkOBz9+uiz95Fw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bPJjFPrg; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bPJjFPrg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwM3n2CCVz2yLB
	for <linux-aspeed@lists.ozlabs.org>; Mon,  4 Aug 2025 13:09:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 24012A551ED;
	Mon,  4 Aug 2025 03:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A306CC4CEEB;
	Mon,  4 Aug 2025 03:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754276977;
	bh=voCsL460D8V6dc8thN7QJQy/hbr0f8CssRhZcgxCPn4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=bPJjFPrgobqxRaL7nNB4qwHkkdlWle3vvvMb4jHmIngMqsLNBptON5X9EEA+wizye
	 haR2jeB82up0BVka2d9lkyPW38vdE8wRr0uF4/fPtD9jdiwpKE/XY2PEL6UIxAlSez
	 6HcVVy8Y8Ax1KwoAcvfKOsgmXrcekVwg7Q4cw4yMh2mHqpVDq2cHTAa4MiuA0YpCFs
	 P8Xl+5EIcJJnoV1DNhP3WJZ/m7VrwHkuVWDY+e+YxS75tooCRnursXYYDwDETO2TvT
	 PiTGk2RFmnDCjFdDMzJgMASjDTHeE31u6BDkG2+R2I5kNtMTT37VAvcTL/BTHYp1dD
	 ZpCtsrgW/chFg==
Date: Sun, 03 Aug 2025 22:09:36 -0500
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
Cc: joel@jms.id.au, p.k.lee@quantatw.com, linux-kernel@vger.kernel.org, 
 Jason-Hsu@quantatw.com, linux-aspeed@lists.ozlabs.org, 
 devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 yang.chen@quantatw.com, Jerry.Lin@quantatw.com, patrick@stwcx.xyz, 
 linux-arm-kernel@lists.infradead.org, andrew@codeconstruct.com.au
To: "P.K. Lee" <pkleequanta@gmail.com>
In-Reply-To: <20250801141131.2238599-1-pkleequanta@gmail.com>
References: <20250801141131.2238599-1-pkleequanta@gmail.com>
Message-Id: <175427693317.1227278.3466107434143462265.robh@kernel.org>
Subject: Re: [PATCH v10 0/2] Add Meta (Facebook) Ventura BMC (AST2600)
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Fri, 01 Aug 2025 22:11:29 +0800, P.K. Lee wrote:
> Add Linux device tree entry related to Meta (Facebook) Ventura specific
> devices connected to the BMC (AST2600) SoC. The purpose of Ventura is to
> detect liquid leakage from all compute trays, switch trays and rack
> sensors within the rack, log the events, and take necessary actions
> accordingly.
> 
> ---
> v1:
>     1. Create ventura dts file.
>     2. Add commit msg.
>     3. Use format-patch to generate patch.
>     4. Add subject prefixes matching the subsystem.
> ---
> v2:
>     1. Modify email content.
> ---
> v3:
>     1. Add mail list.
> ---
> v4:
>     1. Apply git send-email --thread option.
>     2. Sort nodes in the dts alphanumerically.
> ---
> v5:
>     1. Run scripts/checkpatch.pl and fix reported warnings.
>     2. Remove unnecessary 88E6393X CONFIG FRU.
> ---
> v6:
>     1. Add a new stage for the DTS change.
>     2. Run scripts/checkpatch.pl and fix reported error.
>     3. Fix the issue in a separate patch.
> ---
> v7:
>     1. Fix broken indentation in the device tree file.
>     2. Sort nodes alphabetically, then by address if equal.
>     3. Rename fan sensor nodes from 'hwmon' to 'fan-controller'.
> ---
> v8:
>     1. This patch series has significant changes compared to
>        previous versions, and quite some time has passed since the last
>        submission.Therefore, previously received Acked-by/Reviewed-by/Tested-by
>        tags are not included in this version.
>        If needed, tags can be added again after review of thisnew version.
> ---
> v9:
>     1. Reordered the node sequence under i2c5.
>     2. Added a description of the platform's intended use to the commit
>        messages.
>     3. Added 3 GPIO expanders to i2c10 and defined the necessary GPIO
>        line names.
> ---
> v10:
>     1. Added IRQ support in GPIO expanders under i2c10 to handle edge-triggered
>        events.
>     2. Reordered the nodes.
> ---
> P.K. Lee (2):
>   dt-bindings: arm:aspeed add Meta Ventura board
>   ARM: dts: aspeed: ventura: add Meta Ventura BMC
> 
>  .../bindings/arm/aspeed/aspeed.yaml           |    1 +
>  arch/arm/boot/dts/aspeed/Makefile             |    1 +
>  .../aspeed/aspeed-bmc-facebook-ventura.dts    | 1578 +++++++++++++++++
>  3 files changed, 1580 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dts
> 
> --
> 2.43.0
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
 Base: attempting to guess base-commit...
 Base: tags/next-20250801 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/aspeed/' for 20250801141131.2238599-1-pkleequanta@gmail.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: timer (arm,armv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: bus@1e600000 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: lpc@1e789000 (aspeed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: lpc@1e789000 (aspeed,ast2600-lpc-v2): lpc-snoop@80: 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: kcs@24 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: kcs@28 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: kcs@2c (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: kcs@114 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: /ahb/apb/bus@1e78a000/i2c@200/i2c-mux@77/i2c@5/pwm@20: failed to match any schema with compatible: ['max31790']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: i2c@400 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('aspeed,hw-timeout-ms' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: /ahb/apb/bus@1e78a000/i2c@580/power-monitor@69: failed to match any schema with compatible: ['pmbus']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: fsi@1e79b000 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: fsi@1e79b100 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: /ahb/apb/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']
arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: fan@0: aspeed,fan-tach-ch: b'\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#






