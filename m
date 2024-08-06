Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC329496C0
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Aug 2024 19:29:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iRDu42hk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdgKP13jHz3cG5
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Aug 2024 03:29:29 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iRDu42hk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdgKF3lMSz3cRc
	for <linux-aspeed@lists.ozlabs.org>; Wed,  7 Aug 2024 03:29:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B50216108C;
	Tue,  6 Aug 2024 17:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B64C32786;
	Tue,  6 Aug 2024 17:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722965358;
	bh=DofvQUUcQFIETiczpIF5gJHLeGYi8mKOd63Og3SACc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iRDu42hksbv/tG52EbZeMZeva3thQioloHG/Z1Qw7xVZQAhDp5Gs804PeAQMBdnix
	 dCfqnFN3B+/GtHuSKoSYLT/8dG39eSny57VmPTy9yX7MbLs+ZTGUGvlZ/nwbE564hF
	 qbQtNaKe48/NFBNt9sr36hoUb0Obp/pp1RIf8WzwJwOD5cgoNFXsArMLlvQae7RPYj
	 YEnIHr9wZkunFUSEEJ27eNd7b1X86fDetDMG3i25ilou8Ci6bcKzoIOD8Melhs4aTC
	 3XLKpPcauLjyp3+o6lczmtb7VzuBg1SbQ0eZz6sgJEQqr0+qJb9riNlSRvHZD7XdLc
	 O2XA1cXEI3ZWQ==
Date: Tue, 6 Aug 2024 11:29:17 -0600
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH 2/2] dt-bindings: misc: aspeed,ast2400-cvic: Convert to
 DT schema
Message-ID: <20240806172917.GA1836473-robh@kernel.org>
References: <20240802-dt-warnings-irq-aspeed-dt-schema-v1-0-8cd4266d2094@codeconstruct.com.au>
 <20240802-dt-warnings-irq-aspeed-dt-schema-v1-2-8cd4266d2094@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240802-dt-warnings-irq-aspeed-dt-schema-v1-2-8cd4266d2094@codeconstruct.com.au>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Aug 02, 2024 at 03:06:31PM +0930, Andrew Jeffery wrote:
> Address warnings such as:
> 
>     arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: interrupt-controller@1e6c0080: 'valid-sources' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> and
> 
>     arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2400-cvic', 'aspeed-cvic']
> 
> Note that the conversion to DT schema causes some further warnings to
> be emitted, because the Aspeed devicetrees are not in great shape. These
> new warnings are resolved in a separate series:
> 
> https://lore.kernel.org/lkml/20240802-dt-warnings-bmc-dts-cleanups-v1-0-1cb1378e5fcd@codeconstruct.com.au/
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  .../bindings/misc/aspeed,ast2400-cvic.yaml         | 60 ++++++++++++++++++++++
>  .../devicetree/bindings/misc/aspeed,cvic.txt       | 35 -------------
>  2 files changed, 60 insertions(+), 35 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/misc/aspeed,ast2400-cvic.yaml b/Documentation/devicetree/bindings/misc/aspeed,ast2400-cvic.yaml
> new file mode 100644
> index 000000000000..3c85b4924c05
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/aspeed,ast2400-cvic.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed Coprocessor Vectored Interrupt Controller
> +
> +maintainers:
> +  - Andrew Jeffery <andrew@codeconstruct.com.au>
> +
> +description:
> +  The Aspeed AST2400 and AST2500 SoCs have a controller that provides interrupts
> +  to the ColdFire coprocessor. It's not a normal interrupt controller and it
> +  would be rather inconvenient to create an interrupt tree for it, as it
> +  somewhat shares some of the same sources as the main ARM interrupt controller
> +  but with different numbers.
> +
> +  The AST2500 also supports a software generated interrupt.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - aspeed,ast2400-cvic
> +          - aspeed,ast2500-cvic
> +      - const: aspeed,cvic
> +
> +  reg:
> +    maxItems: 1
> +
> +  valid-sources:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      One cell, bitmap of support sources for the implementation.
> +
> +  copro-sw-interrupts:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      A list of interrupt numbers that can be used as software interrupts from
> +      the ARM to the coprocessor.
> +
> +required:
> +  - compatible
> +  - reg
> +  - valid-sources
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#

Doesn't really look like this schema applies to this binding. Drop the 
ref.


> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller@1e6c2000 {
> +        compatible = "aspeed,ast2500-cvic", "aspeed,cvic";
> +        reg = <0x1e6c2000 0x80>;
> +        valid-sources = <0xffffffff>;
> +        copro-sw-interrupts = <1>;
> +    };
