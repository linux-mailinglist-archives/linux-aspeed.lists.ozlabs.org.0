Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F367360C16
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Apr 2021 16:44:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLhtW2Szzz30NL
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Apr 2021 00:44:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z6ZlDhcW;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Z6ZlDhcW; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLhtS4Ldnz30DG
 for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Apr 2021 00:44:00 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6119C611F1
 for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Apr 2021 14:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618497837;
 bh=6YDhc8xCI+FkZnT6X57lEBZZ0hCXcx81oegShEjfCbA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Z6ZlDhcWIxnIIKYbnmouliVeqi2VBf2XHI4UElAFYWHmNaT2iWxY7jk5lFFKPlMfK
 Hq2/xAHZHMwSUivLVFeh26lXPfvDi2HZvC/Q1qZBcomfwHheMwMv4nrBjU4thFUJao
 SIS3JDxTIHFGK6kYVlBoMlS4Y3OiKtaGaQYY8r1NfCoXkMQMTioiPRpEyp+0hJ2kdL
 HQ9r3PuOdDjQn0J999lePEzQnvkQdhWVgyjcPq5lFBasAtKYjffg4re0/DJ0pp1bh0
 RMcl9ZebqTwDXzjqwOCwUim4PXzTYuSuTJY57W5xUf1PAtDEFswe4Fd08KoXmET89Z
 6Z7fKk6q7UXIg==
Received: by mail-ej1-f48.google.com with SMTP id x12so16479257ejc.1
 for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Apr 2021 07:43:57 -0700 (PDT)
X-Gm-Message-State: AOAM5313j+Mw+7K7t+sSH4gxVIar+o2r1Jw2yv8avF847M/Fg7v9Ek30
 MVyduHTGDPIIKEKTtPGrymck9tOEfUeJluauOA==
X-Google-Smtp-Source: ABdhPJxoNfBiv6+5FVrjD6sxs0rngR35h7XJV8B0TcpRMTSKtMd8b4jwSrTUYEnNhLg8xlj7miYfbYQNYSs9IO+gVcc=
X-Received: by 2002:a17:906:1984:: with SMTP id
 g4mr3706813ejd.525.1618497835986; 
 Thu, 15 Apr 2021 07:43:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210414104939.1093-1-billy_tsai@aspeedtech.com>
 <20210414104939.1093-2-billy_tsai@aspeedtech.com>
 <20210414221553.GA56046@robh.at.kernel.org>
 <B9287FE7-5EF5-40B3-BCB3-08DA11D6CDD7@aspeedtech.com>
In-Reply-To: <B9287FE7-5EF5-40B3-BCB3-08DA11D6CDD7@aspeedtech.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 15 Apr 2021 09:43:42 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLuswcRqQ-JQ9qgWQEhykPWCTsnVFLxCEPV6BbF86vWOw@mail.gmail.com>
Message-ID: <CAL_JsqLuswcRqQ-JQ9qgWQEhykPWCTsnVFLxCEPV6BbF86vWOw@mail.gmail.com>
Subject: Re: [v2 1/2] dt-bindings: Add bindings for aspeed pwm-tach and pwm.
To: Billy Tsai <billy_tsai@aspeedtech.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 BMC-SW <BMC-SW@aspeedtech.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Apr 14, 2021 at 10:44 PM Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
> Hi Rob,
>
> On 2021/4/15, 6:16 AM,Rob Herringwrote:
>
>     On Wed, Apr 14, 2021 at 06:49:38PM +0800, Billy Tsai wrote:
>     >> This patch adds device bindings for aspeed pwm-tach device which is a
>     >> multi-function device include pwn and tach function and pwm device which
>     >> should be the sub-node of pwm-tach device.
>     >>
>     >> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
>     >> Change-Id: I18d9dea14c3a04e1b7e38ffecd49d45917b9b545
>     >
>     >Drop
>     >
>     >> ---
>     >>  .../bindings/mfd/aspeed,ast2600-pwm-tach.yaml | 60 +++++++++++++++++++
>     >>  .../bindings/pwm/aspeed,ast2600-pwm.yaml      | 44 ++++++++++++++
>     >>  2 files changed, 104 insertions(+)
>     >>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
>     >>  create mode 100644 Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
>     >>
>     >> diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
>     >> new file mode 100644
>     >> index 000000000000..eaf8bdf8d44e
>     >> --- /dev/null
>     >> +++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
>     >> @@ -0,0 +1,60 @@
>     >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>     >> +# Copyright (C) 2021 ASPEED, Inc.
>     >> +%YAML 1.2
>     >> +---
>     >> +$id: http://devicetree.org/schemas/mfd/aspeed,ast2600-pwm-tach.yaml#
>     >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>     >> +
>     >> +title: PWM Tach controller Device Tree Bindings
>     >> +
>     >> +description: |
>     >> +  The PWM Tach controller is represented as a multi-function device which
>     >> +  includes:
>     >> +    PWM
>     >> +    Tach
>
>     > But is it really? A PWM and tach sounds like a fan controller. Look at
>
> Our PWM is not only for fans but also used for the motor, led, buzzer, and so on.
> So I want to split the function into two devices with a multi-function device.
> One for PWM output and one for tach monitor.
>
>     > other existing PWM+tach bindings we have for fans.
>
> I didn't see the PWM+tach bindings can you give some example for me, thanks.

Let me grep 'tach' for you:

Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt

Hey, look at that, there's already one for ASpeed. So the question is
how is the newer h/w different?

>
>     >> +
>     >> +maintainers:
>     >> +  - Billy Tsai <billy_tsai@aspeedtech.com>
>     >> +
>     >> +properties:
>     >> +  compatible:
>     >> +    items:
>     >> +      - enum:
>     >> +          - aspeed,ast2600-pwm-tach
>     >> +      - const: syscon
>     >> +      - const: simple-mfd
>     >> +  reg:
>     >> +    maxItems: 1
>     >> +  "#address-cells":
>     >> +    const: 1
>     >> +  "#size-cells":
>     >> +    const: 1
>     >> +
>     >> +required:
>     >> +  - compatible
>     >> +  - reg
>     >> +  - "#address-cells"
>     >> +  - "#size-cells"
>     >> +
>     >> +additionalProperties:
>     >> +  type: object
>
>     > As you know the 2 node names, they should be documented. However, see
>     > below.
>
>     >> +
>     >> +examples:
>     >> +  - |
>     >> +    pwm_tach: pwm_tach@1e610000 {
>     >> +      compatible = "aspeed,ast2600-pwm-tach", "syscon", "simple-mfd";
>     >> +      #address-cells = <1>;
>     >> +      #size-cells = <1>;
>     >> +      reg = <0x1e610000 0x100>;
>     >> +
>     >> +      pwm: pwm@0 {
>     >> +        compatible = "aspeed,ast2600-pwm";
>     >> +        #pwm-cells = <3>;
>     >> +        reg = <0x0 0x100>;
>     >> +      };
>     >> +
>     >> +      tach: tach@1 {
>     >> +        compatible = "aspeed,ast2600-tach";
>     >> +        reg = <0x0 0x100>;
>
>     > You have 2 nodes at the same address. Not valid.
>
> Our pwm and tach is used the same base address and the offset is like below:
>
> PWM0 used 0x0 0x4, Tach0 used 0x8 0xc
> PWM1 used 0x10 0x14, Tach1 used 0x18 0x1c
> ...
>
> I will remove the reg property from pwm and tach node and remove the "#address-cells" and
> "#size-cells" from the parent node.

That's not really the solution...

>
>     >> +      };
>
>     > There's no real need for 2 child nodes. The parent node can be a PWM
>     > provider.
>
> However, In our usage, the parent node is a mfd, not a simple PWM device only. I don't want to
> combine the different functions with the one device node.

Looks like a single h/w block to me. If you want to divide that up
into multiple drivers, then that's an OS problem. A single node can be
multiple providers. For example, on the existing aspeed binding, just
add '#pwm-cells' to the node if you want to also expose it as a PWM
provider.

Rob
