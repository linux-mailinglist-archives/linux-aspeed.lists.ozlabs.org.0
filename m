Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEEB997743
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2024 23:11:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XP5Cv2syMz3bkc
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Oct 2024 08:11:23 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728508282;
	cv=none; b=ZTQQL8+wLiibyPWUNqe/Jn9STDmzzvNljYf5gY3XyC9uMtLM/YpgU4rFu2NLQ96wrIFXLmVLu01fd6MzOrPcj/6t92XZojf1F7kyJRKQfazwOwFzwRly/CYxjgE/FzOTnhoX+QjH9PORUuQ6FPKMF2QOXfWbcXW2ZC7PciAfQEbt30qSNxurp7Aq4+2ToxQC2mYpw8uqU91zi9XhHAuAexmIX7qAoatzN8qB9C2Pg0MxJNBeObPKqt3jzBYaGojkhPr4aTqgC/97Jmw2ELC+3jDHQzSHDTog5fmk4Aqddo6uhObnJ8WXKQFRj3lMlubjtBJl9tXReijFDNOghO8kig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728508282; c=relaxed/relaxed;
	bh=HtmrrjWLt/XYMKSHKXvShEhTnkV/YFhRLlOyxU6uA74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XO3CwFC96r82FZgq8+z1dz5+6MWBXwwDpzy8ZhjBttFr07Gfit9MHsxXlxwP+UE8GQtGnOUG+NjebsQONVgVCUrDj/zlruWiWcyVi7vfyawOFJHyRNSzhISFAtJqXnInlJe+sYnFGnyEAM9OGWxfAL4Qq+Ul+O4mrgotuH+aFz+lR+rf26Riq/CiahV22YHIG3cpvfLYzbNWD3SYjEix1fp1qkkB2Tiz1uGG1klhVH3URzekHggsmgACabXmqsWSkGMUNupREIYWhqPJfzFIliuKgKRdqxOz74A9VGT0qLL9jLq8qUqZ1nFauNeOfokzVtc0ciZniDkVkCDL0oChFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AGgRIQKN; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AGgRIQKN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XP5Cr6qccz2xs7
	for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Oct 2024 08:11:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DC49BA445A1;
	Wed,  9 Oct 2024 21:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B49C4CEC3;
	Wed,  9 Oct 2024 21:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728508278;
	bh=2qQdeHWaX+qTxGR0KQZi4qkIcfoXEQWS9Egj0Q4nlf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AGgRIQKNVPuCm/Ouid8MPqRKI3K90ejJcdcKpPB8YxRDkqFsG64eUWGa0uYxlxayn
	 RYHOso+H6e9C0KlL6R1BFsrZrlFp3dFPkB5vhaHIP0VLr3K6IsTxzHwqOPbM5sLTcE
	 b/Ak83oCC9ep8LThG1oxTmU3ai+ewYmbl7biY9noBbyiWXVtwV10kQeZNyD68oqSA1
	 pHDyLzQu6dqBXY5K9ir2ySoTRPwfS7ArseORsVHhGLh079BfQY3AAsf4zu/vC7fHzR
	 FY8xZ2aXkhG7p4yMWUH1QyMHqcgUmPHmlqEdax0MwsK8ZsW0KQB5pWyZzPyTDy/oj7
	 v1Ef5s59J/75A==
Date: Wed, 9 Oct 2024 16:11:16 -0500
From: Rob Herring <robh@kernel.org>
To: Kevin Chen <kevin_chen@aspeedtech.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: interrupt-controller: Add support
 for ASPEED AST27XX INTC
Message-ID: <20241009211116.GA676770-robh@kernel.org>
References: <20241009115813.2908803-1-kevin_chen@aspeedtech.com>
 <20241009115813.2908803-2-kevin_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009115813.2908803-2-kevin_chen@aspeedtech.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, tglx@linutronix.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Oct 09, 2024 at 07:58:12PM +0800, Kevin Chen wrote:
> The ASPEED AST27XX interrupt controller(INTC) contain second level and
> third level interrupt controller.
> 
> INTC0:
> The second level INTC, which used to assert GIC(#192~#197) if interrupt
> in INTC1 asserted. There are 6 GIC interrupt number(#192~#197) used in
> one INTC0.
> 
> INTC1_x:
> The third level INTC, which used to assert GIC(#192~#197) if interrupt in
> INTC1 asserted. There are 6 GIC interrupt number(#192~#197) used in one INTC0.
> 
> Signed-off-by: Kevin Chen <kevin_chen@aspeedtech.com>
> ---
>  .../aspeed,ast2700-intc.yaml                  | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
> new file mode 100644
> index 000000000000..650a1f6e1177
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed AST2700 Interrupt Controller
> +
> +description:
> +  This interrupt controller hardware is second level interrupt controller that
> +  is hooked to a parent interrupt controller. It's useful to combine multiple
> +  interrupt sources into 1 interrupt to parent interrupt controller.
> +
> +maintainers:
> +  - Kevin Chen <kevin_chen@aspeedtech.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2700-intc-ic
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2

Describe the meaning of the cells here.

> +
> +  interrupts:
> +    maxItems: 10
> +    description:

You need '|' to preserve formatting.

> +      Depend to which INTC0 or INTC1 used.
> +      INTC0 and INTC1 are two kinds of interrupt controller with enable and raw
> +      status registers for use.
> +      INTC0 is used to assert GIC if interrupt in INTC1 asserted.
> +      INTC1 is used to assert INTC0 if interrupt of modules asserted.
> +      +-----+   +-------+     +---------+---module0
> +      | GIC |---| INTC0 |--+--| INTC1_0 |---module2
> +      |     |   |       |  |  |         |---...
> +      +-----+   +-------+  |  +---------+---module31
> +                           |
> +                           |   +---------+---module0
> +                           +---| INTC1_1 |---module2
> +                           |   |         |---...
> +                           |   +---------+---module31
> +                          ...
> +                           |   +---------+---module0
> +                           +---| INTC1_5 |---module2
> +                               |         |---...
> +                               +---------+---module31
> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    bus {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        interrupt-controller@12101b00 {
> +            compatible = "aspeed,ast2700-intc-ic";
> +            reg = <0 0x12101b00 0 0x10>;
> +            #interrupt-cells = <2>;
> +            interrupt-controller;
> +            interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> +    };
> -- 
> 2.34.1
> 
