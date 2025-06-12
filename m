Return-Path: <linux-aspeed+bounces-1409-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC911AD7C0A
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Jun 2025 22:12:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJDGR5L9Pz306l;
	Fri, 13 Jun 2025 06:12:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749759151;
	cv=none; b=PYNNfwwWfyEoSbT+G+aso47IFXoCey+AEqstpfGEtjY+mUenZv/VH8uTjFUzmZZdxlkWh4yNbpQdvSzx1oUaPj1nzTZiL4FkT7iZKdzrDH2sDFm11DV4HOsxo4tRY4cRUWcHlnYRHOR9MooPYqGwz6xvN0eHiFpqcqOxFpA+ffzUbWvHs6+5zQZluzGazcwDpWHBOHSP4dIQoQADR/pIiym7g78PUX3V+B8u5ch1ih9xtuSmHgJoPz9QN2at2XszNh6sirZ1GaNqdEPhnCGyYI5CjJP8HvUmtyO/TO9MR6r+m3WVCr4dP61vnA6JPHwJf2xdt2Cs+i4ne59zexzxng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749759151; c=relaxed/relaxed;
	bh=n8UmY+DjVICQvkxkV5qowXtXkSU++ghDZkpNVcnAI3M=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ENTdlu9kmJebtBjxr8zbQW1GNExjo9Umgyy7IGa9gwyFHjY8XIA2p4DPSc0CBVljGsVxGszYIgWv8mrUzjRt/Wk+ah/BoBole0t8V22AbV0wX7Cf8bxE2oaElE4GsSO1ihveTrMFzf7YDs9wUyFUr78Mcb82Kq8+RRTL1zMS73ZjmEUGGFgMqOsBQ2Y0VlD24HhpqM0RNe8XCmTkFEvMvDPooVh31GmbY1ptq7Y7ELc23c1CC0W3taSz0Rq5c/tDhfID4J527hE3yuk51NVA8URTb4U9g72pHDGH/aodMt5Y+2sV7KmGXsrL/w9bn/gZQRJVFSXZk1JxjSpWnkBdCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UC5n9LvW; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UC5n9LvW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJDGQ65G3z2xQ6
	for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Jun 2025 06:12:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E48E42B84;
	Thu, 12 Jun 2025 20:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8910C4CEEA;
	Thu, 12 Jun 2025 20:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749759148;
	bh=bIZ8HFvB6OMgNNW2NXkcAGo3Nhl2JK11AbarG/O5N+Y=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=UC5n9LvWLL3JZhvYwMX5kxSKsoXED94YidpkOLAjq+oMTeoMB8cpXOP1D7c/rczip
	 9aGAul3sQjIBUsgNebjAZae9a18D3eY8afIPf/74C7jrJ4ihLDwAGe73XAXMKSS98f
	 8NBKQero4YKp3/5mekWKhXl/5zmXkEiIYRr3aTUtJmJY25j5gN1oHuRtp2Wq38ejxT
	 mZBLjGzUGHI9o2OnMG8dyU/9jduusKQeUuQrvUJCek9mbj7A70IMyEqP+v7QOTZpiu
	 VjXyc872zaqo9YngpIo/MPl5Yh0DkBcNSToFJ5OvK9lD2KJchsyvbLrIhmFtn5BLrB
	 DB6v1/rDDUyiw==
Date: Thu, 12 Jun 2025 15:12:26 -0500
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, soc@lists.linux.dev, 
 Mo Elbadry <elbadrym@google.com>, Arnd Bergmann <arnd@arndb.de>, 
 William Kennington <wak@google.com>, Taniya Das <quic_tdas@quicinc.com>, 
 linux-kernel@vger.kernel.org, spuranik@nvidia.com, 
 Eric Biggers <ebiggers@google.com>, Joel Stanley <joel@jms.id.au>, 
 linux-aspeed@lists.ozlabs.org, Will Deacon <will@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 nfraprado@collabora.com, linux-arm-kernel@lists.infradead.org, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Rom Lemarchand <romlem@google.com>, devicetree@vger.kernel.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, leohu@nvidia.com, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
 Yuxiao Zhang <yuxiaozhang@google.com>, dkodihalli@nvidia.com, 
 wthai@nvidia.com
To: Ryan Chen <ryan_chen@aspeedtech.com>
In-Reply-To: <20250612100933.3007673-1-ryan_chen@aspeedtech.com>
References: <20250612100933.3007673-1-ryan_chen@aspeedtech.com>
Message-Id: <174975871838.2916138.1953670783794758715.robh@kernel.org>
Subject: Re: [PATCH v0 0/5] Add initial AST2700 SoC support
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Thu, 12 Jun 2025 18:09:28 +0800, Ryan Chen wrote:
> This patch series introduces initial support for the Aspeed AST2700 SoC
> and the AST2700 Evaluation Board (EVB) to the Linux kernel. The AST2700
> is the 7th generation Baseboard Management Controller (BMC) SoC from Aspeed,
> featuring improved performance, enhanced security, and expanded I/O
> capabilities compared to previous generations.
> 
> The patchset includes the following changes:
> - Device tree bindings for AST2700 boards.
> - Addition of the AST2700 platform to the Kconfig menu.
> - Basic device tree for the AST2700 SoC.
> - Device tree for the AST2700-EVB.
> - Updated defconfig to enable essential options for AST2700.
> 
> Ryan Chen (5):
>   dt-bindings: arm: aspeed: Add AST2700 board compatible
>   arm64: Kconfig: Add Aspeed SoC family (ast2700) platform option
>   arm64: dts: aspeed: Add initial AST2700 SoC device tree
>   arm64: dts: aspeed: Add AST2700 EVB device tree
>   arm64: configs: Update defconfig for AST2700 platform support
> 
>  .../bindings/arm/aspeed/aspeed.yaml           |   5 +
>  arch/arm64/Kconfig.platforms                  |   6 +
>  arch/arm64/boot/dts/Makefile                  |   1 +
>  arch/arm64/boot/dts/aspeed/Makefile           |   4 +
>  arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi     | 380 ++++++++++++++++++
>  arch/arm64/boot/dts/aspeed/ast2700-evb.dts    |  54 +++
>  arch/arm64/configs/defconfig                  |   1 +
>  7 files changed, 451 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/aspeed/Makefile
>  create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi
>  create mode 100644 arch/arm64/boot/dts/aspeed/ast2700-evb.dts
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.16-rc1 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/aspeed/' for 20250612100933.3007673-1-ryan_chen@aspeedtech.com:

arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: serial@14c33b00 (ns16550a): 'pinctrl-0' is a dependency of 'pinctrl-names'
	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@100 (aspeed,ast2700-intc-ic): interrupts-extended: [[6, 0, 3844]] is too short
	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@110 (aspeed,ast2700-intc-ic): interrupts-extended: [[6, 1, 3844]] is too short
	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@120 (aspeed,ast2700-intc-ic): interrupts-extended: [[6, 2, 3844]] is too short
	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@130 (aspeed,ast2700-intc-ic): interrupts-extended: [[6, 3, 3844]] is too short
	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@140 (aspeed,ast2700-intc-ic): interrupts-extended: [[6, 4, 3844]] is too short
	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@150 (aspeed,ast2700-intc-ic): interrupts-extended: [[6, 5, 3844]] is too short
	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#






