Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E0A93D1EF
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2024 13:17:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IbRfLKCc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVlb05XBXz3dKb
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2024 21:17:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IbRfLKCc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVlZv5nsjz3dDT
	for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2024 21:17:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5D76CCE1742;
	Fri, 26 Jul 2024 11:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999E2C4AF09;
	Fri, 26 Jul 2024 11:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721992629;
	bh=xz21XeKk6Jh5vorDOFaezBjDi7mGuYx6lx40T8g4h3c=;
	h=Date:Subject:List-Id:To:References:From:In-Reply-To:From;
	b=IbRfLKCcUs1m+iV8xkOBqr7dD7BNE3R6uY3g2GTPoa/ISwret+2be6edJQEU7kbQX
	 rSctWtZLrHYdaiH4qLvPp4LtCNUr61zZlLYpvDkWS3Fwvda8AqFHlxDokEGJ53Uh4M
	 s57oak1znDytaN3flPaDD6JZtM31nKM0CDsJCJq8v7xSiIB+a06c1Sdn8hDCtS5//p
	 ZGtAgxg/BM36T91sSXSqMdcPJ1fjqMiBfb+Z/MV6Xm05L5InLAIx3DZWrLwXs0cOhk
	 siFotPG8oCcLewdvqkfFdLiKjHLiAeuQMburKIdPgfhXmib9fci1xkvi98kjx2BgD/
	 0UxK6KcF3HXHA==
Message-ID: <79d13e65-ca4a-461f-9888-9664e204f2ed@kernel.org>
Date: Fri, 26 Jul 2024 13:16:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/10] arm64: dts: aspeed: Add initial AST2700 EVB
 device tree
To: Kevin Chen <kevin_chen@aspeedtech.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, lee@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, shawnguo@kernel.org, neil.armstrong@linaro.org,
 m.szyprowski@samsung.com, nfraprado@collabora.com, u-kumar1@ti.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20240726110355.2181563-1-kevin_chen@aspeedtech.com>
 <20240726110355.2181563-10-kevin_chen@aspeedtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240726110355.2181563-10-kevin_chen@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 26/07/2024 13:03, Kevin Chen wrote:
> ---
>  arch/arm64/boot/dts/aspeed/Makefile        |  4 ++
>  arch/arm64/boot/dts/aspeed/ast2700-evb.dts | 50 ++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/aspeed/Makefile
>  create mode 100644 arch/arm64/boot/dts/aspeed/ast2700-evb.dts
> 
> diff --git a/arch/arm64/boot/dts/aspeed/Makefile b/arch/arm64/boot/dts/aspeed/Makefile
> new file mode 100644
> index 000000000000..ffe7e15017cc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/aspeed/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +dtb-$(CONFIG_ARCH_ASPEED) += \
> +	ast2700-evb.dtb
> diff --git a/arch/arm64/boot/dts/aspeed/ast2700-evb.dts b/arch/arm64/boot/dts/aspeed/ast2700-evb.dts
> new file mode 100644
> index 000000000000..187c458e566b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/aspeed/ast2700-evb.dts
> @@ -0,0 +1,50 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +/dts-v1/;
> +
> +#include "aspeed-g7.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model = "AST2700A1-EVB";
> +	compatible = "aspeed,ast2700a1-evb", "aspeed,ast2700";

You have never tested this.

Sorry, test your DTS first.

> +
> +	chosen {
> +		bootargs = "console=ttyS12,115200n8";

Drop.

> +		stdout-path = &uart12;
> +	};
> +
> +	firmware {
> +		optee: optee {
> +			compatible = "linaro,optee-tz";
> +			method = "smc";
> +		};
> +	};
> +
> +	memory@400000000 {
> +		device_type = "memory";
> +		reg = <0x4 0x00000000 0x0 0x40000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		mcu_fw: mcu-firmware@42fe00000 {
> +			reg = <0x4 0x2fe00000 0x0 0x200000>;
> +			no-map;
> +		};
> +
> +		atf: trusted-firmware-a@430000000 {
> +			reg = <0x4 0x30000000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		optee_core: optee_core@430080000 {

Read DTS coding style.

> +			reg = <0x4 0x30080000 0x0 0x1000000>;
> +			no-map;
> +		};
> +	};
> +};
> +

Remove stray blank line.

Best regards,
Krzysztof

