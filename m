Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC66785894
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Aug 2023 15:13:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MsPaOqQ+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW69c20R3z3c2Z
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Aug 2023 23:13:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MsPaOqQ+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=yznc=ei=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW69L2C2qz2xpx
	for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Aug 2023 23:13:42 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 72BC4656E3;
	Wed, 23 Aug 2023 13:13:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE786C433C8;
	Wed, 23 Aug 2023 13:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692796417;
	bh=DaGglQshpU9aTm/Tv91gnQQDys7dUA7tLk3NwPkPRFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MsPaOqQ+kqB2t/YvmWau52gagC8bfE45jMsvBQnlroxNCZYsBR5PJBhBCc77d10We
	 R3gRHOTSVZom8xz6+Ojn4fSqbgZ0BMreYCIM3zSTszk9NhHhaViyCDsCkeJXaXWII6
	 ydUKJ/3yzfTPSUN1foUMOz44KC2K/4HlcCa5lKFOaDF1FA9SNjSr13HJQuFCiF2Ixp
	 +woHAjlR1Add2jN6/FQFaFCjHvNN8lF0/+HJl2iXAJfeBuP+JIx3SF0XOpWYZ81c/Z
	 f5UiMfKsJAFfxO/5UUpOBKwSFeiXVQJha3FTLJ9ND2ihND+V01vbZHsLTxz2ZrykJV
	 0RjttZkHtsEKw==
Received: (nullmailer pid 2148592 invoked by uid 1000);
	Wed, 23 Aug 2023 13:13:34 -0000
Date: Wed, 23 Aug 2023 08:13:34 -0500
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: hwmon: Support Aspeed g6 PWM TACH
 Control
Message-ID: <20230823131334.GA2059582-robh@kernel.org>
References: <20230817120029.221484-1-billy_tsai@aspeedtech.com>
 <20230817120029.221484-2-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817120029.221484-2-billy_tsai@aspeedtech.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org, corbet@lwn.net, BMC-SW@aspeedtech.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, patrick@stwcx.xyz, thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org, u.kleine-koenig@pengutronix.de, linux@roeck-us.net, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Aug 17, 2023 at 08:00:28PM +0800, Billy Tsai wrote:
> Document the compatible for aspeed,ast2600-pwm-tach device, which can
> support upto 16 PWM outputs and 16 fan tach input.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/hwmon/aspeed,g6-pwm-tach.yaml    | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> new file mode 100644
> index 000000000000..1666304d0b0f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2021 Aspeed, Inc.
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
> +  The ASPEED PWM controller can support upto 16 PWM outputs.
> +  The ASPEED Fan Tacho controller can support upto 16 fan tach input.
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
> +  aspeed,fan-tach-ch:
> +    description: Specify the Fan tach input channels.
> +    $ref: "/schemas/types.yaml#/definitions/uint8-array"

This property is already defined in aspeed-pwm-tacho.txt as a single u8 
that goes in a fan node. You can't redefine its type and location here.

To repeat what I've said in previous versions, work with others to 
define a common fan and fan controller binding. Otherwise, anything new 
with fan related properties is simply going to be rejected.

Rob
