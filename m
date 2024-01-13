Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 604CB82C8FF
	for <lists+linux-aspeed@lfdr.de>; Sat, 13 Jan 2024 02:56:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HqvQYNpC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TBhMW6LXcz3br5
	for <lists+linux-aspeed@lfdr.de>; Sat, 13 Jan 2024 12:56:07 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HqvQYNpC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TBhMQ25ZDz30XZ
	for <linux-aspeed@lists.ozlabs.org>; Sat, 13 Jan 2024 12:56:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A177FB82323;
	Sat, 13 Jan 2024 01:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C371EC433F1;
	Sat, 13 Jan 2024 01:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705110959;
	bh=tD8IG8K67wmGBd7W0V7EQk7phCaD6jkAx+XmJvURp+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HqvQYNpC/lV84vyyd0xN0jSWmbHYqGKRe8KYTT81o6nVm0v90wwES24ZOMfXDvJxD
	 vkspXPaPXWEDj7cA/P/uQCcZKBd66x+v6Fv1+khUA4YIeIhusKJlFBt70ezSZ/RF4d
	 oRCKn7KQvW1PaInf2G7H//eqUUqNkP7OZL/SJf7JM+Lzti0Q4bJWwne3Do/HSMv72A
	 SUyo/k8ULEU426n3z5JLXv4T6wLyZ4o0rh21/McYvNaf+u8sFbZclreKx6VPlLpukt
	 p4X1kwWb7KDf6jyFMIjbB2oqW+605siQJR7BdJNHsxsvNzCncNUyES63zxFpsq8o9L
	 kiBbRRsuXIiJQ==
Date: Fri, 12 Jan 2024 19:55:56 -0600
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v12 2/3] dt-bindings: hwmon: Support Aspeed g6 PWM TACH
 Control
Message-ID: <20240113015556.GA3829553-robh@kernel.org>
References: <20240108074348.735014-1-billy_tsai@aspeedtech.com>
 <20240108074348.735014-3-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240108074348.735014-3-billy_tsai@aspeedtech.com>
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

On Mon, Jan 08, 2024 at 03:43:47PM +0800, Billy Tsai wrote:
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
> index 000000000000..c615fb10705c
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
> +title: ASPEED G6 PWM and Fan Tach controller
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
> +  "^fan-[0-9]+$":
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
> +      };
> +
> +      fan-1 {
> +        tach-ch = /bits/ 8 <0x1 0x2>;
> +      };

NAK on this based on how you are using pwm-fan in v10 discussion. See my 
comments there.

Rob
