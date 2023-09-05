Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5643D792B6E
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Sep 2023 19:07:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uXlbNU97;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RgBlY6xvpz3bxH
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Sep 2023 03:07:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uXlbNU97;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=srs0=6yhg=ev=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 442 seconds by postgrey-1.37 at boromir; Wed, 06 Sep 2023 03:07:41 AEST
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RgBlK6QBvz30h5
	for <linux-aspeed@lists.ozlabs.org>; Wed,  6 Sep 2023 03:07:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 5B372CE128D;
	Tue,  5 Sep 2023 17:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F2FC433C7;
	Tue,  5 Sep 2023 17:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693933658;
	bh=wvydTW5tlFfjmX77STi/JFlf00/5kzHytlOiPmKMEV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uXlbNU97DMqwAC9ZNu5M7ajd6mDymvsmtCU7vrn1VzmDTcTpbt0vvMp1v641v2IQZ
	 SgVsL37pQLJ/Gp4U5eQffjkCedFKhKlriLxtQAh7m7RFlWBXj13W1YVwXqPfOmfJZF
	 vx1JCiQ4Ylx48/d2kHSiqhU93FzLfhAIaKFUhqGmoddtVvktDjJGF3LkiQJlVL++Q0
	 1zVL4u23WIIDcAaP3kxgwZwe32m2/F5Uh6SiFLBZWOUUp8D3ZxzkN+s25HRuMfDEpX
	 VwMPqEwD8llmszk0BL/HJOAZevfkwn64EsM4CTipbwOMQo+5pLTtFrkQYZhoHcNMIG
	 IRFBOOwr4tiIA==
Received: (nullmailer pid 3568796 invoked by uid 1000);
	Tue, 05 Sep 2023 17:07:35 -0000
Date: Tue, 5 Sep 2023 12:07:35 -0500
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v8 2/3] dt-bindings: hwmon: Support Aspeed g6 PWM TACH
 Control
Message-ID: <20230905170735.GA3528724-robh@kernel.org>
References: <20230830123202.3408318-1-billy_tsai@aspeedtech.com>
 <20230830123202.3408318-3-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230830123202.3408318-3-billy_tsai@aspeedtech.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org, corbet@lwn.net, BMC-SW@aspeedtech.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, naresh.solanki@9elements.com, patrick@stwcx.xyz, thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org, u.kleine-koenig@pengutronix.de, linux@roeck-us.net, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Aug 30, 2023 at 08:32:01PM +0800, Billy Tsai wrote:
> Document the compatible for aspeed,ast2600-pwm-tach device, which can
> support up to 16 PWM outputs and 16 fan tach input.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/hwmon/aspeed,g6-pwm-tach.yaml    | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> new file mode 100644
> index 000000000000..95bac5588c04
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2021 Aspeed, Inc.

A few years out of date.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/aspeed,g6-pwm-tach.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED G6 PWM and Fan Tach controller device driver
> +
> +maintainers:
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +description: |
> +  The ASPEED PWM controller can support up to 16 PWM outputs.
> +  The ASPEED Fan Tacho controller can support up to 16 fan tach input.

Are PWM and tach channels independent? Would be useful to know here.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-pwm-tach
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 3
> +
> +patternProperties:
> +  "^fan[0-9a-f]_hwmon+$":

Drop 'hwmon'. Standard practice for naming without 'reg' is 
'^fan-[0-9]+$'.

> +    $ref: fan-common.yaml#

       unevaluatedProperties: false

> +    required:
> +      - tach-ch
> +
> +required:
> +  - reg
> +  - clocks
> +  - resets
> +  - "#pwm-cells"
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    pwm_tach: pwm-tach-controller@1e610000 {
> +      compatible = "aspeed,ast2600-pwm-tach";
> +      reg = <0x1e610000 0x100>;
> +      clocks = <&syscon ASPEED_CLK_AHB>;
> +      resets = <&syscon ASPEED_RESET_PWM>;
> +      #pwm-cells = <3>;

Blank line.

> +      fan0_hwmon {
> +        tach-ch = <0x0>;

Don't you need 'pwms'?

> +      };

Blank line.

> +      fan1_hwmon {
> +        tach-ch = <0x1>;
> +      };
> +      fan2_hwmon {
> +        tach-ch = <0x2>;
> +      };
> +    };
> -- 
> 2.25.1
> 
