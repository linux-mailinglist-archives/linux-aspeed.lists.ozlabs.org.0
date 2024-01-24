Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9577F83A321
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jan 2024 08:40:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UHLsnCQ1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TKbTB5XY4z3c2V
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jan 2024 18:39:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UHLsnCQ1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TKbT33KXwz2xQG
	for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jan 2024 18:39:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B0E2FCE2F29;
	Wed, 24 Jan 2024 07:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3E6C433F1;
	Wed, 24 Jan 2024 07:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706081986;
	bh=91grIYIx9OkFtRlDhcvytYmNOKGOQX3yknnlFt+vEew=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=UHLsnCQ1dUShb1uVeOf7TkGdla3aigkHLEvLXzWs42kwKOTgVFt2D1NWvBsm4WO3X
	 H5k/EQg5Px4owCmhHLRBNGwlw4mmPQ+XdwWow9DNqNBijEnlCvhuVWxViCyAvDUdl6
	 TfScqKcste9zFamQJs0/AV0Yv4acCb7nNWvakLWgjKcQas/vzZ/INICfFG97v+htT5
	 cmAIu4A2ApnTcoREmT+wAy1VgsHIHCWVTKoknVHXvVgNkYju1K+TgWsqFikALl0301
	 MpkcmybZR9mY4KlUuPprphfjD2HbEiPWmQJpkkbBk10qXOqFOvhXj0O3Q+d0qsI5MO
	 mYGQi0CH3g03Q==
Date: Wed, 24 Jan 2024 01:39:45 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
In-Reply-To: <20240124060705.1342461-3-billy_tsai@aspeedtech.com>
References: <20240124060705.1342461-1-billy_tsai@aspeedtech.com>
 <20240124060705.1342461-3-billy_tsai@aspeedtech.com>
Message-Id: <170608198415.3412038.3874422575074669118.robh@kernel.org>
Subject: Re: [PATCH v13 2/3] dt-bindings: hwmon: Support Aspeed g6 PWM TACH
 Control
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, krzysztof.kozlowski+dt@linaro.org, linux-aspeed@lists.ozlabs.org, linux-pwm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, naresh.solanki@9elements.com, patrick@stwcx.xyz, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, p.zabel@pengutronix.de, BMC-SW@aspeedtech.com, u.kleine-koenig@pengutronix.de, corbet@lwn.net, andrew@codeconstruct.com.au, linux@roeck-us.net
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Wed, 24 Jan 2024 14:07:04 +0800, Billy Tsai wrote:
> Document the compatible for aspeed,ast2600-pwm-tach device, which can
> support up to 16 PWM outputs and 16 fan tach input.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/hwmon/aspeed,g6-pwm-tach.yaml    | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.example.dtb: pwm-tach-controller@1e610000: fan-0: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/hwmon/aspeed,g6-pwm-tach.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.example.dtb: pwm-tach-controller@1e610000: fan-1: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/hwmon/aspeed,g6-pwm-tach.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.example.dtb: fan-0: 'tach-ch' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.example.dtb: fan-1: 'tach-ch' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240124060705.1342461-3-billy_tsai@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

