Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B56A56EE64
	for <lists+linux-aspeed@lfdr.de>; Sat, 20 Jul 2019 10:13:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45rLGk1YByzDqtN
	for <lists+linux-aspeed@lfdr.de>; Sat, 20 Jul 2019 18:13:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::242; helo=mail-lj1-x242.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="yPSEvpAh"; 
 dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45rLGf1scHzDqsb
 for <linux-aspeed@lists.ozlabs.org>; Sat, 20 Jul 2019 18:13:12 +1000 (AEST)
Received: by mail-lj1-x242.google.com with SMTP id k18so32855584ljc.11
 for <linux-aspeed@lists.ozlabs.org>; Sat, 20 Jul 2019 01:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z0jjqiEWK8ZwPUy1E/hBEFEfeUX6fZKXUCvS400AT+E=;
 b=yPSEvpAhtbj/j09qHG2JWZfrDA4ejU9evwOJais+pJ0lGCPO05Gns70r4+pQNpZ4xK
 lDKoKVvkmiGIDLP+l/FkDXc1fKJsf9Uk4CdBZeUDu+IsFD4fs/jH9Vh+YJrDGixb3HJ3
 Ue7R1TwHlXHvmgyfmDJqycCgkmTCbjCHYxmEh2EdRFsmKmntYBYBfVUhRjzsgZeVPYb+
 8K4202ecZU1xhmPNMkuAY7dkNXe1ab5LPwhjlJnovA4AmK+Wz/yOz1qlHoDUXr4Yj0SC
 kiaxocC37eF3GwefxCq3OJiGqjz7iJVeDnWpJnKKiO4nhTokU6iSmnvj/ddVQoxSY787
 XpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z0jjqiEWK8ZwPUy1E/hBEFEfeUX6fZKXUCvS400AT+E=;
 b=ikZvOnoEP3Knf5HpC8l3DKqDU6H9dkibjOg0F+3qyY/78BUdfPAZfLzQDSGj5HQ+oL
 pnY6WiY3c/oFE+4OOh6T4VciEf+jIgLCmfIVITHq2XunbJwd0TWCJOa1ICk1mRGHvSPF
 Vf/e0uoos8BnAd1L6JCjhfdsvY05k01P1CTcuF2zA98v0/dRpESDGZB2XXG4JUtP7egH
 gYzuu30vwqmCjzSi/ASgolhmoPPiD9uxMif3KxQwZsAkNIK9WJ6aEe3fean1rQ2mlzqz
 TU0GhvJxg8QbP6bxgX3QyQTWxy1X1b8IorpWG8o6LyEmOtPX6YDbQkAcuOQwtV+AII5h
 4d+Q==
X-Gm-Message-State: APjAAAVdBeg0cz26cEDjXIOudhAtgpaM27y6ZlJ4JLhs9AJLOEoodz00
 mLvyeMJDZIBcOUe8N1LFEDhWmGFP5fATVCMLAgqkuQ==
X-Google-Smtp-Source: APXvYqxPq0egzZ9v6Hlqgi5GtM0dh5ZLA6APWqqK+dAf0wl4ZE3tiHWf4L7DfCkkNOMh235amVo0TuFZXRekFrjKVAc=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr12432277ljs.54.1563610388042; 
 Sat, 20 Jul 2019 01:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <1563564291-9692-1-git-send-email-hongweiz@ami.com>
 <1563564291-9692-2-git-send-email-hongweiz@ami.com>
In-Reply-To: <1563564291-9692-2-git-send-email-hongweiz@ami.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 20 Jul 2019 10:12:56 +0200
Message-ID: <CACRpkdYhVoP75ZDfASW+DH5yf-a5diitiXsh7eLsJx5hsTC9sQ@mail.gmail.com>
Subject: Re: [v5 1/2] dt-bindings: gpio: aspeed: Add SGPIO support
To: Hongwei Zhang <hongweiz@ami.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Hongwei,

after looking close at the driver and bindings I have this feeback:

On Fri, Jul 19, 2019 at 9:25 PM Hongwei Zhang <hongweiz@ami.com> wrote:

+- reg                  : Address and length of the register set for the device

This 0x100 range may look simple but in the driver it looks like
this:

+static const struct aspeed_sgpio_bank aspeed_sgpio_banks[] = {
+       {
+               .val_regs = 0x0000,
+               .rdata_reg = 0x0070,
+               .irq_regs = 0x0004,
+               .names = { "A", "B", "C", "D" },
+       },
+       {
+               .val_regs = 0x001C,
+               .rdata_reg = 0x0074,
+               .irq_regs = 0x0020,
+               .names = { "E", "F", "G", "H" },
+       },
+       {
+               .val_regs = 0x0038,
+               .rdata_reg = 0x0078,
+               .irq_regs = 0x003C,
+               .names = { "I", "J" },
+       },
+};

So first break this into up to 10 different instances with one device
per bank instead.

For each device:

reg = <0x1e780200 4>, <x1e780204 ..>, <0x1e780270 ..>;
reg-names = "val", "irq", "rdata";

This way you use the device tree features for locating the
register offsets instead of hard-coding it into the driver,
which will make the driver simpler.

> +- ngpios               : number of GPIO pins to serialise.
> +                         (should be multiple of 8, up to 80 pins)

This is wrong. This should be split into 10 different devices providing
8 GPIO lines each. The "ngpios" is not intended to subdivide
banks, but for the case where you use say bits 0..11 of 32 bits in
a register by setting ngpios to 12.

I see that they use the same clock divider and the same interrupt,
but this is better to partition into a separate clock divider driver
and up to 10 instances of GPIO devices with 8 GPIOs each.

I also see that they use the same interrupt. This is fine, in your
driver just grab a shared IRQ and all the IRQ handlers will be
traversed. This is a well known pattern for all operating systems.

> +- clocks                : A phandle to the APB clock for SGPM clock division
> +
> +- bus-frequency                : SGPM CLK frequency

I see that there is a common clock control register in offset 0x54.

Split this out to a separate clock driver that provides a divided clock
that all GPIO blocks can get, no matter if you use 1, 2 .. 10 of these
blocks.

The fact that these GPIO banks and the clock register is in the same
memory range does not really matter. Split up the memory range in
on reg = per GPIO chip and one reg for the clock.

> +  Example:
> +       sgpio: sgpio@1e780200 {
> +               #gpio-cells = <2>;
> +               compatible = "aspeed,ast2500-sgpio";
> +               gpio-controller;
> +               interrupts = <40>;
> +               reg = <0x1e780200 0x0100>;
> +               clocks = <&syscon ASPEED_CLK_APB>;
> +               interrupt-controller;
> +               ngpios = <8>;
> +               bus-frequency = <12000000>;
> +       };

Splitting this up into a clock controller and 1-10 instances of sgpio
will make things simpler, because it will closer reflect what the hardware
people are doing: they have just created 10 instances of the same
block, and added a clock divider.

You can put the 1-10 instances and the clock divider inside a collected
node "simple-bus" in the device tree:

{
    compatible = "simple-bus";

    sgpio0: sgpio {
        compatible = "aspeed,ast2500-sgpio";
        reg = <0x1e780200 ...> ...;
        clk = <&sgpioclk>;
    };
    sgpio1: sgpio {
        ...
    };
    ...
    sgpioclk: clock {
          compatible = "aspeed,sgpio-clock";
          reg = 0x1e780254 4>;
    };
};

This is a better fit with the actual hardware and will make it much
easier to write drivers.

Admittedly DT device partitioning of SoC devices is a grey area,
but here I think the DT infrastructure helps you to break things
down and make it easier, I am thinking in a divide-and-conquer
way about it.

Yours,
Linus Walleij
