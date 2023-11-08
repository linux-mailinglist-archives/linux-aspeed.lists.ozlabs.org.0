Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3124D7E5D07
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Nov 2023 19:17:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQYFs3P25z3cT3
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Nov 2023 05:17:05 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.169; helo=mail-oi1-f169.google.com; envelope-from=robherring2@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQYFn5TcTz3cR3
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Nov 2023 05:17:00 +1100 (AEDT)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3b2f28caab9so4226909b6e.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Nov 2023 10:17:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699467417; x=1700072217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDMXHrCNHotVlfHJTukvHxKiw+LRe2nJBe8uVVsPODE=;
        b=jQxR/+1gwLvUgqfvBDoAWsI3Iq7OqWl3XHNUOx8fGQ+6Cs8nVV+tmKZhr9XrawgETu
         TzKf4091qnLIuc6uyRN/tWOrPTKw2h7ptWXUi+vaR3lFCyx4AIX0tlF8LVKtJUCiDh6f
         YZWhRx5niH6Y8cApmYjJKL69btd5CN1zdVsKEJOz/Fy0xXmGjzdyXQ97c1wU1fvrWzpM
         glXwwmF9PYBcGJtnZqRtwbObjuMDrMRa1ezvfhCVqJP9rhDNqB1xQPcG956EgnBUI3sn
         HQG9hkXM1dm4f6tYJ4wKOZvTZrL4d1D3l2xXVD65AVmWHgJvqM83JqQXnpC64Wj2EzuS
         5MkQ==
X-Gm-Message-State: AOJu0YxTVSC/KAdHBI0Ofr18ibVVrt5+A4opOLAEDsqFZ73JvqvC/wbL
	kRSrCCq2wrfpz2l3KWTklg==
X-Google-Smtp-Source: AGHT+IG8jY8GfwEmq1IF9uXyhmf+3vLAsgL0KuuTgiy5XZG6/I66+r21zbsN2TLNHOOJD0uL9WcRyA==
X-Received: by 2002:a05:6808:181c:b0:3a7:500a:a491 with SMTP id bh28-20020a056808181c00b003a7500aa491mr3345541oib.28.1699467416982;
        Wed, 08 Nov 2023 10:16:56 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u6-20020a056808150600b003af6eeed9b6sm1976108oiw.27.2023.11.08.10.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 10:16:56 -0800 (PST)
Received: (nullmailer pid 2697492 invoked by uid 1000);
	Wed, 08 Nov 2023 18:16:54 -0000
Date: Wed, 8 Nov 2023 12:16:54 -0600
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH RESEND v10 1/3] dt-bindings: hwmon: fan: Add fan binding
 to schema
Message-ID: <20231108181654.GA2664986-robh@kernel.org>
References: <20231107105025.1480561-1-billy_tsai@aspeedtech.com>
 <20231107105025.1480561-2-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107105025.1480561-2-billy_tsai@aspeedtech.com>
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

On Tue, Nov 07, 2023 at 06:50:23PM +0800, Billy Tsai wrote:
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
>       unevaluatedProperties: false
> 
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../devicetree/bindings/hwmon/fan-common.yaml | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml

Looking pretty good to me. It's disappointing that no one else 
interested in upstreaming their fan controller can be bothered to 
comment.

> 
> diff --git a/Documentation/devicetree/bindings/hwmon/fan-common.yaml b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
> new file mode 100644
> index 000000000000..be4ce3bd7f22
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
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
> +    maximum: 100000
> +
> +  min-rpm:
> +    description:
> +      Min RPM supported by fan.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 1000
> +
> +  pulses-per-revolution:
> +    description:
> +      The number of pulse from fan sensor per revolution.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 4
> +
> +  tach-div:
> +    description:
> +      Divisor for the tach sampling clock, which determines the sensitivity of the tach pin.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  target-rpm:
> +    description:
> +      The default desired fan speed in RPM.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  fan-driving-mode:
> +    description:
> +      Select the driving mode of the fan.(DC, PWM and so on)
> +    $ref: /schemas/types.yaml#/definitions/string

You need to define the possible values. I assume it's:

enum:
  - dc
  - pwm
  - anything else???

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
