Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B2C7B563D
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Oct 2023 17:28:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VdKIGKKO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RzlGW4K8sz3cNl
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Oct 2023 02:28:35 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VdKIGKKO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=mcio=fq=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RzlGM5xkTz3cN3
	for <linux-aspeed@lists.ozlabs.org>; Tue,  3 Oct 2023 02:28:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0F3CC60EF3;
	Mon,  2 Oct 2023 15:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F18C433C8;
	Mon,  2 Oct 2023 15:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696260504;
	bh=cBsXuH+waMnbRb4zU7K8v3UB85/p7ufJUV9Y1AvcxRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VdKIGKKOTx6RCCphHOtVS/Dr/s/B5hcvTW3AukByt1zrZOIpZJw0DS+x9GQjStAVx
	 C77Au3XeTTzvbiNUtG824gBmuwqXxgloskfVs+S8AN5nOCfpzi9SbnZlU1arCJREee
	 DcvqT5Ki92KBnFv/YHTsXVpzOQEybww5AmVYUGhwoKPQ5htUUorEwjW05u5sy0w48M
	 cmePtZHUeuyQERcJBWGnU1Khdvf0qyCeiccLQFn6c4n+YyfyBtj3BKI1MIZMT/iA2i
	 7MpJXE3H6AmIGBwDLUkrn6GiJIO50tbZga685E62N1w/+R8n+l0CWpro5kNA+Rijku
	 EJNvViksJFWgw==
Received: (nullmailer pid 1757850 invoked by uid 1000);
	Mon, 02 Oct 2023 15:28:19 -0000
Date: Mon, 2 Oct 2023 10:28:19 -0500
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v9 2/3] dt-bindings: hwmon: Support Aspeed g6 PWM TACH
 Control
Message-ID: <20231002152819.GB1747496-robh@kernel.org>
References: <20230918064111.2221594-1-billy_tsai@aspeedtech.com>
 <20230918064111.2221594-3-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918064111.2221594-3-billy_tsai@aspeedtech.com>
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

On Mon, Sep 18, 2023 at 02:41:10PM +0800, Billy Tsai wrote:
> Document the compatible for aspeed,ast2600-pwm-tach device, which can
> support up to 16 PWM outputs and 16 fan tach input.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/hwmon/aspeed,g6-pwm-tach.yaml    | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> new file mode 100644
> index 000000000000..5a679f4ad2fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2023 Aspeed, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/aspeed,g6-pwm-tach.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED G6 PWM and Fan Tach controller device driver

This is binding for the h/w, not a 'device driver'.

> +
> +maintainers:
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +description: |
> +  The ASPEED PWM controller can support up to 16 PWM outputs.
> +  The ASPEED Fan Tacho controller can support up to 16 fan tach input.
> +  They are independent hardware blocks, which are different from the
> +  previous version of the ASPEED chip.
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
> +  "^fan-[0-9a-f]+$":

foo-<index> naming is decimal, not hex. (unit-addresses are hex)

But if 0 and 1 correspond to something in the h/w, then you should 
probably be using 'reg' instead (which means a unit-address too).

> +    $ref: fan-common.yaml#
> +    unevaluatedProperties: false
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
> +
> +      fan-0 {
> +        tach-ch = /bits/ 8 <0x0>;

What about the PWM connection?

> +      };
> +
> +      fan-1 {
> +        tach-ch = /bits/ 8 <0x1 0x2>;
> +      };
> +    };
> -- 
> 2.25.1
> 
