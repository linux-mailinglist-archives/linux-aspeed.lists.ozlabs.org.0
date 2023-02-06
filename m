Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0414C68C719
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Feb 2023 20:55:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9cSG5nXqz3cMt
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Feb 2023 06:55:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sG6C/2gz;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sG6C/2gz;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9cS74Hn5z306Y
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Feb 2023 06:55:19 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EDE5760ECA
	for <linux-aspeed@lists.ozlabs.org>; Mon,  6 Feb 2023 19:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C5F3C4339C
	for <linux-aspeed@lists.ozlabs.org>; Mon,  6 Feb 2023 19:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675713316;
	bh=x0oD17S0/1CLJnGLH9iD1hxf62OiooTTKy/Q2s56BYI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sG6C/2gzWM3tYvIrJb8I23pi42ElybXEGbJ7080xrsz5NXdUbbZxw6RpYYkXayqUq
	 Q7/GInr0VJTw6MflBTmrfTVXPL2hYRfUnRb+JVeluhz73VgMk19KQRPIQxDFJ1SxWa
	 1IB+qBRluFfm78oEpWtfBAbF5LckGoHz/GIdCZ1HOPs8MMfH+1b0un2LLL1G9Tmmdg
	 6co+ZS8gqfyr9nUGl8scxNfnWOjOqdi/XsHpx5RKmWsUdDh8/gvP4DZeBfQNzqLvq6
	 u9CmsA3ZTuqizVKNY0l8PxP9E87fp6b4K0T+Tyf5C3XFUkpFTNKEiW3bQCclACBP7s
	 6a5KFO3jSALMw==
Received: by mail-vs1-f44.google.com with SMTP id v26so6143191vsk.8
        for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Feb 2023 11:55:16 -0800 (PST)
X-Gm-Message-State: AO0yUKWFv8C1BPahfdKqPXbpd/uYZHlBy+1nucMDxBHQtvCif/B+X6dG
	+i0S/Ea22zDLLmekP3aT0vsUm8fpEuH4mTtidg==
X-Google-Smtp-Source: AK7set93aZD9DhXMsr+HrpYTVLyOGOiqhromt8iBj7FIL5vA7u7EXhitVPK4xRog/7IQcegYFqSmO370ISv83kjze/g=
X-Received: by 2002:a67:7206:0:b0:3ea:c8c:48a5 with SMTP id
 n6-20020a677206000000b003ea0c8c48a5mr191202vsc.53.1675713315265; Mon, 06 Feb
 2023 11:55:15 -0800 (PST)
MIME-Version: 1.0
References: <20230206153325.43692-1-sunrockers8@gmail.com>
In-Reply-To: <20230206153325.43692-1-sunrockers8@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 6 Feb 2023 13:55:03 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJoH2EdWxZc115HpGLmqQ3Wu8q3MS85NiqGKu57Y1o6dA@mail.gmail.com>
Message-ID: <CAL_JsqJoH2EdWxZc115HpGLmqQ3Wu8q3MS85NiqGKu57Y1o6dA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings : misc : aspeed,cvic interrupt controller :
 convert the binding document to yaml
To: Vijaya Anand <sunrockers8@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Feb 6, 2023 at 9:35 AM Vijaya Anand <sunrockers8@gmail.com> wrote:
>
>     Convert the binding document for ASPEED AST2400 and AST2500 coprocessor interrupt controller
>     from txt to yaml so one could validate dt-entries correctly and any future additions can go
>     into yaml format. The options for compatability described according to the example given.

Missing DCO (Signed-off-by). checkpatch.pl will tell this for you.

> ---
>  .../devicetree/bindings/misc/aspeed,cvic.txt  | 35 ----------
>  .../devicetree/bindings/misc/aspeed,cvic.yaml | 67 +++++++++++++++++++
>  2 files changed, 67 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/misc/aspeed,cvic.txt
>  create mode 100644 Documentation/devicetree/bindings/misc/aspeed,cvic.yaml
>
> diff --git a/Documentation/devicetree/bindings/misc/aspeed,cvic.txt b/Documentation/devicetree/bindings/misc/aspeed,cvic.txt
> deleted file mode 100644
> index d62c783d1d5e..000000000000
> --- a/Documentation/devicetree/bindings/misc/aspeed,cvic.txt
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -* ASPEED AST2400 and AST2500 coprocessor interrupt controller
> -
> -This file describes the bindings for the interrupt controller present
> -in the AST2400 and AST2500 BMC SoCs which provides interrupt to the
> -ColdFire coprocessor.
> -
> -It is not a normal interrupt controller and it would be rather
> -inconvenient to create an interrupt tree for it as it somewhat shares
> -some of the same sources as the main ARM interrupt controller but with
> -different numbers.
> -
> -The AST2500 supports a SW generated interrupt
> -
> -Required properties:
> -- reg: address and length of the register for the device.
> -- compatible: "aspeed,cvic" and one of:
> -               "aspeed,ast2400-cvic"
> -             or
> -               "aspeed,ast2500-cvic"
> -
> -- valid-sources: One cell, bitmap of supported sources for the implementation
> -
> -Optional properties;
> -- copro-sw-interrupts: List of interrupt numbers that can be used as
> -                      SW interrupts from the ARM to the coprocessor.
> -                      (AST2500 only)
> -
> -Example:
> -
> -       cvic: copro-interrupt-controller@1e6c2000 {
> -               compatible = "aspeed,ast2500-cvic";
> -               valid-sources = <0xffffffff>;
> -               copro-sw-interrupts = <1>;
> -               reg = <0x1e6c2000 0x80>;
> -       };
> diff --git a/Documentation/devicetree/bindings/misc/aspeed,cvic.yaml b/Documentation/devicetree/bindings/misc/aspeed,cvic.yaml
> new file mode 100644
> index 000000000000..bbff0418fa2c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/aspeed,cvic.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/misc/aspeed,cvic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED AST2400 and AST2500 coprocessor interrupt controller
> +
> +maintainers:
> +  - Benjamin Herrenschmidt <benh@kernel.crashing.org>
> +  - Rob Herring <robh@kernel.org>

Should be someone that has and cares about Aspeed h/w, not me.

> +
> +description: |
> +  This file describes the bindings for the interrupt controller present
> +  in the AST2400 and AST2500 BMC SoCs which provides interrupt to the
> +  ColdFire coprocessor.
> +
> +  It is not a normal interrupt controller and it would be rather
> +  inconvenient to create an interrupt tree for it as it somewhat shares
> +  some of the same sources as the main ARM interrupt controller but with
> +  different numbers.
> +
> +  The AST2500 supports a SW generated interruptThe Soft Decision Forward Error Correction (SDFEC) Engine is a Hard IP block
> +  which provides high-throughput LDPC and Turbo Code implementations.
> +  The LDPC decode & encode functionality is capable of covering a range of
> +  customer specified Quasi-cyclic (QC) codes. The Turbo decode functionality
> +  principally covers codes used by LTE. The FEC Engine offers significant
> +  power and area savings versus implementations done in the FPGA fabric.
> +
> +properties:
> +
> +  compatible:
> +    enum:
> +      - aspeed,ast2400-cvic
> +      - aspeed,ast2500-cvic
> +
> +  reg:
> +    maxItems: 1
> +    description: address and length of the register for the device.

Drop generic descriptions.

> +
> +  valid-sources:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: One cell, bitmap of supported sources for the implementation

Drop 'one cell'. The type says that.

> +
> +  copro-sw-interrupts:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

Is there a range of number of entries and/or values for entries. If
so, add constraints.

> +    description: |

Don't need '|' if no formatting to maintain.

> +                  List of interrupt numbers that can be used as
> +                  SW interrupts from the ARM to the coprocessor.
> +                  (AST2500 only)
> +
> +required:
> +  - compatible
> +  - reg
> +  - valid-sources
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    cvic: copro-interrupt-controller@1e6c2000
> +    {
> +        compatible = "aspeed,ast2500-cvic";
> +        valid-sources = <0xffffffff>;
> +        copro-sw-interrupts = <1>;
> +        reg = <0x1e6c2000 0x80>;
> +    };
> --
> 2.37.1 (Apple Git-137.1)
>
