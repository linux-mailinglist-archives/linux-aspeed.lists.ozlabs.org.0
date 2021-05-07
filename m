Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC8A375E36
	for <lists+linux-aspeed@lfdr.de>; Fri,  7 May 2021 03:08:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fbsl964Qyz2yWv
	for <lists+linux-aspeed@lfdr.de>; Fri,  7 May 2021 11:08:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.182;
 helo=mail-oi1-f182.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fbsl65wt2z2yR6
 for <linux-aspeed@lists.ozlabs.org>; Fri,  7 May 2021 11:08:18 +1000 (AEST)
Received: by mail-oi1-f182.google.com with SMTP id i81so7285649oif.6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 06 May 2021 18:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6W67RaksQjLOYNdnbdfa9p+lVZInKWZVCWpoKGgd/9A=;
 b=jmxP4DdHBV1M+68ZAeLTeAxxfPR+XbcaMURYSSiS1DQm3grmhShZgDYBjUcuteLqwF
 l0LoiQyD0u+0WSN+SzZZ3CiksOGaSgDZqYwT/jaRY3NXhj+B8jAqO+O/R0r5hs5NPKD0
 uoUvj10vjOEdY8EeFabp/Py6qYnNBbr8tvejv76UD3aRrOrCAbvXpKCdwBVbNAfy4FQ+
 C/m3sQvSmg8VN7Gf1cBXE5Uw6nmcETHmQ7B9aPfbp2xCOzswF+V8iud2E4Wdu6WYljET
 bnQgnwuJxYbv+FfoR0gE+u2hHo3YGCoZgKKF8k5NalUMnRC453w2d4RyWbQexmTKfvAm
 +r3Q==
X-Gm-Message-State: AOAM530/SlZ8DPrEyMpPQoSDBpMlszCUAMK043AaaTjNFdmAZOGUcoFt
 Hor9KowBar8aZOXEht1Nnw==
X-Google-Smtp-Source: ABdhPJydS+y6C4SE9bnB/eY0GFTj76KejxPRwA3cPRPWNm3aKDpDwriU4T1PtWSn1k5qw2lPTbQDWw==
X-Received: by 2002:a54:4d83:: with SMTP id y3mr13034438oix.97.1620349696505; 
 Thu, 06 May 2021 18:08:16 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p65sm721005oia.46.2021.05.06.18.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 18:08:15 -0700 (PDT)
Received: (nullmailer pid 1118308 invoked by uid 1000);
 Fri, 07 May 2021 01:08:14 -0000
Date: Thu, 6 May 2021 20:08:14 -0500
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v3 1/2] dt-bindings: Add bindings for aspeed pwm-tach and pwm.
Message-ID: <20210507010814.GB1110621@robh.at.kernel.org>
References: <20210506061050.8001-1-billy_tsai@aspeedtech.com>
 <20210506061050.8001-2-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506061050.8001-2-billy_tsai@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-pwm@vger.kernel.org, BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, p.zabel@pengutronix.de,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, May 06, 2021 at 02:10:49PM +0800, Billy Tsai wrote:
> This patch adds device bindings for aspeed pwm-tach device which is a
> multi-function device include pwn and tach function and pwm device which
> should be the sub-node of pwm-tach device.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/mfd/aspeed,ast2600-pwm-tach.yaml | 55 +++++++++++++++++++
>  .../bindings/pwm/aspeed,ast2600-pwm.yaml      | 41 ++++++++++++++
>  2 files changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
>  create mode 100644 Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
> new file mode 100644
> index 000000000000..9626bbd50acd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2021 ASPEED, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/aspeed,ast2600-pwm-tach.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PWM Tach controller Device Tree Bindings
> +
> +description: |
> +  The PWM Tach controller is represented as a multi-function device which
> +  includes:
> +    PWM
> +    Tach
> +
> +maintainers:
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - aspeed,ast2600-pwm-tach
> +      - const: syscon
> +      - const: simple-mfd
> +  reg:
> +    maxItems: 1
> +  clocks:
> +    maxItems: 1
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +
> +additionalProperties:
> +  type: object
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +    pwm_tach: pwm_tach@1e610000 {
> +      compatible = "aspeed,ast2600-pwm-tach", "syscon", "simple-mfd";
> +      reg = <0x1e610000 0x100>;
> +      clocks = <&syscon ASPEED_CLK_AHB>;
> +      resets = <&syscon ASPEED_RESET_PWM>;
> +
> +      pwm: pwm {
> +        compatible = "aspeed,ast2600-pwm";
> +        #pwm-cells = <3>;

There's no need for a child node here. Just put #pwm-cells in the 
parent node.

Of course this all looks incomplete if you ever plan to hook up fans and 
have more than 1 PWM and Tach signal.

> +      };
> +    };
