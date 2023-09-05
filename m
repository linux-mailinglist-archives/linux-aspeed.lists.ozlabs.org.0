Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AD2792BDC
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Sep 2023 19:10:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q7X/dAMp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RgBp92DY2z3c12
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Sep 2023 03:10:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q7X/dAMp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=srs0=6yhg=ev=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 582 seconds by postgrey-1.37 at boromir; Wed, 06 Sep 2023 03:10:02 AEST
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RgBp21Jhwz3bmj
	for <linux-aspeed@lists.ozlabs.org>; Wed,  6 Sep 2023 03:10:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 78DEECE10E7;
	Tue,  5 Sep 2023 17:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AB0C433C8;
	Tue,  5 Sep 2023 17:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693933213;
	bh=pJ0DvRrFskUG6FBsMu3DpwPIdUV6eUR/tLrf5Kjc+9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q7X/dAMpDMNEF7A3EVR4YOtR1NVmBflXkV7a316esIoXn9lNYU45E2DtGh5rfp3Z8
	 fFH60IlDJWg86y1p10GzoapFvrpnmOEaUUP1s1yiW+LQPSnBu7XRrXnP1AlRpDQ6Yx
	 qSz9ozZGjdw3VrREiCZKUQbVZWxM7onm25vMx2PaS/+INSn/JxtOoigc6HeuvJa+6i
	 3BoV6b3NeVk5ulDKzxads/bHGbJnBnLVJbQHobg225MjNwQx2gFWpKdDFYJK4PTI6Y
	 QqjNMnopi8/d0I/j+wfg0GWAWtMNKY3t64Q0c0Nlos9LbRnW58VKIc78riugK9nqDq
	 NL+1leog/wszg==
Received: (nullmailer pid 3528491 invoked by uid 1000);
	Tue, 05 Sep 2023 17:00:10 -0000
Date: Tue, 5 Sep 2023 12:00:10 -0500
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: hwmon: fan: Add fan binding to schema
Message-ID: <20230905170010.GA3505375-robh@kernel.org>
References: <20230830123202.3408318-1-billy_tsai@aspeedtech.com>
 <20230830123202.3408318-2-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230830123202.3408318-2-billy_tsai@aspeedtech.com>
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

On Wed, Aug 30, 2023 at 08:32:00PM +0800, Billy Tsai wrote:
> From: Naresh Solanki <naresh.solanki@9elements.com>
> 
> Add common fan properties bindings to a schema.
> 
> Bindings for fan controllers can reference the common schema for the
> fan
> 
> child nodes:
> 
>   patternProperties:
>     "^fan@[0-2]":
>       type: object
>       $ref: fan-common.yaml#

        unevaluatedProperties: false


> 
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../devicetree/bindings/hwmon/fan-common.yaml | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/fan-common.yaml b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
> new file mode 100644
> index 000000000000..a69b4d553e45
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause

Drop 'or-later'. It's GPL2 only.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/fan-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common Fan Properties
> +
> +maintainers:
> +  - Naresh Solanki <naresh.solanki@9elements.com>
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +properties:
> +  max-rpm:
> +    description:
> +      Max RPM supported by fan.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Physics will limit this to something much less than 2^32. Add some 
constraints. 10000?

> +
> +  min-rpm:
> +    description:
> +      Min RPM supported by fan.
> +    $ref: /schemas/types.yaml#/definitions/uint32

ditto

> +
> +  pulses-per-revolution:
> +    description:
> +      The number of pulse from fan sensor per revolution.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Needs constraints. I assume this is never more than 4 (or 2 even)?

> +  div:

Too generic of a name.

> +    description:
> +      Fan clock divisor

But what is a fan clock?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  target-rpm:
> +    description:
> +      Target RPM the fan should be configured during driver probe.

What driver? By the time the OS driver runs, a bunch of other boot 
software has already run on modern systems. So this value would likely 
be used much earlier. The point is that when exactly is outside the 
scope of DT. This is "what RPM do I use in case of no other information 
(e.g. temperature)".

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  mode:

Too generic.

> +    description:
> +      Select the operational mode of the fan.

What are modes? Spin and don't spin?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  pwms:
> +    description:
> +      PWM provider.

maxItems: 1

I don't think there are fans with more than 1 PWM input?

> +
> +  tach-ch:
> +    description:
> +      The tach channel used for the fan.
> +    $ref: /schemas/types.yaml#/definitions/uint32

The existing ASpeed version of this property allows more than 1 entry. I 
don't understand how a fan would have 2 tach signals, but if so, the 
generic property should allow for that.

Perhaps 'reg' should be defined in here with some text saying 'reg' 
corresponds to the fan controller specific id which may be the PWM+TACH 
channel, PWM channel (deprecated), or TACH channel. I think there are 
examples of all 3 of these cases.

> +
> +  label:
> +    description:
> +      Optional fan label
> +
> +  fan-supply:
> +    description:
> +      Power supply for fan.
> +
> +additionalProperties: true
> +
> +...
> -- 
> 2.25.1
> 
