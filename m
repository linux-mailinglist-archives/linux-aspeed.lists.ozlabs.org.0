Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A366378262
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 01:34:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xfKv3YxbzDqRx
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 09:34:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::141; helo=mail-lf1-x141.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="aEFFIjaZ"; 
 dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xfKp4c1XzDqQf
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Jul 2019 09:34:19 +1000 (AEST)
Received: by mail-lf1-x141.google.com with SMTP id b29so33489292lfq.1
 for <linux-aspeed@lists.ozlabs.org>; Sun, 28 Jul 2019 16:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eUvn9OI5nD/4S7v8ywB8lgEu/KDQowtKmV6CtOSPqUA=;
 b=aEFFIjaZRLhrPDgULFaRicTLJcOaMeowEaKUJOOHKxsU0QeLveEc4UGQHyiCE9z748
 LokY6dj1a7TghWqOkoJZ0mkFKXLYJN/B++Ka3tTFhWmvmB78ADuM9y9mObtiU0E4Trqz
 yeY0A1yraFZKZIdaaAh0yHYrBWOyKpGLB5iZhDkYTZOU/kUmbgRr9tG+Bvf4lOWB324F
 svF5yh/hqwRzyr0EgJCkUZhzkclqGfGdEZE6Jd5Tb3xOCak99/+GzYvbwS5TI3h5A998
 sN1u/IeShA4POS42IOkF4YLja9CWZ5LFecqlS73MoehKEDHT6PnnW3TJx2g8hZYF7j2s
 Zopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eUvn9OI5nD/4S7v8ywB8lgEu/KDQowtKmV6CtOSPqUA=;
 b=pgLIF2r7NEkGVuzfQ2bcxu67K0qtWj9b5mgUGDAt8ZxiQ/wCQ2O67GgO5JGY2bRRFw
 ex76YwKWbUi6LDLQpWlE8wJ7wijNoxUURtE8DXArJYOrYuIFUJ3Czim21R/uUA84clij
 RH4zTJo1u6q0FI821GSxfLewA8QXFUDYO5FbWG0d0TuL5qremg8JUPfr4KSlbxFMl8Gy
 UJg+fk11hBk4tpOpHdiTh2dY5WFZbu8lEdespr3BYi5jB2uJY+esyo+WhGHVOXCBMF/s
 BdFUGFVDIIuNiIogK022jIS++jlMEnVJ1ryEpoAoCFlRhQH4ElynBq7uvA1KFdHgy4Lz
 Wsdg==
X-Gm-Message-State: APjAAAVFRs/V7vMtBb9gen9N1BT597z7sC/jyN4WnumcJ0JZLSIDIfuB
 m2bPDzLyO56QBmLbX/dNtBZnZd5zj17KVS3AUCTlZg==
X-Google-Smtp-Source: APXvYqysascwZ7s8p4u+iWYY6k2d56GISla2oOhZmhWM9B7cI6Cbtauk+/chIBA1grY5/zLjWKJ3aCLJJa9z3+4C1R8=
X-Received: by 2002:ac2:4891:: with SMTP id x17mr51451245lfc.60.1564356855227; 
 Sun, 28 Jul 2019 16:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <1563564291-9692-1-git-send-email-hongweiz@ami.com>
 <1563564291-9692-2-git-send-email-hongweiz@ami.com>
 <CACRpkdYhVoP75ZDfASW+DH5yf-a5diitiXsh7eLsJx5hsTC9sQ@mail.gmail.com>
 <ef9d9c17-6e2d-4a4e-ac44-f8da4bb3b8eb@www.fastmail.com>
In-Reply-To: <ef9d9c17-6e2d-4a4e-ac44-f8da4bb3b8eb@www.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 29 Jul 2019 01:34:02 +0200
Message-ID: <CACRpkdZxsF9gQj0VicVLsPKXg6rKA1mLwbywmazOf0w8PLnOfA@mail.gmail.com>
Subject: Re: [v5 1/2] dt-bindings: gpio: aspeed: Add SGPIO support
To: Andrew Jeffery <andrew@aj.id.au>
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
 Rob Herring <robh+dt@kernel.org>, Hongwei Zhang <hongweiz@ami.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Jul 22, 2019 at 3:42 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> If the clock driver owns the control register, it also needs to know how
> many GPIOs we want to emit on the bus. This seems like an awkward
> configuration parameter for a clock driver.
>
> To avoid the weird parameter we could protect the control register
> with a lock shared between the clock driver and the SGPIO driver. This
> way the SGPIO driver could have the ngpios parameter, and request
> the clock after its written the ngpios value to the control register. A
> regmap would be useful here to avoid the resource clash and it also
> provides the required lock.

Nah. Too complicated.

What about using the clock API locally (in the singleton driver,
much as it is today) though, to give the right abstraction?

See
drivers/gpu/drm/pl111/pl111_display.c
pl111_init_clock_divider() for an example of a local
clock.

> However, you're also going down the path of splitting the driver such
> that there's one instance per bank. With this approach we need to
> solve two problems: Accounting for the total number of GPIOs,

I don't see that as a big problem since each driver instance will
handle 8 GPIOs and don't need to know how many the
other instances have and whether they exist or not.

> and
> only enabling the bus after the last bank has had its driver probed.

That is a bigger problem and a good reason to stick with
some complex driver like this.

> The accounting might be handled by accumulating the number of
> GPIOs in each bank in the control register itself, e.g. the driver
> implementation does something like:
>
> spin_lock(...)
> ctrl = ioread32(...)
> ngpios = FIELD_GET(ASPEED_SGPIO_CTRL_NGPIOS, ctrl);
> ngpios += 8;
> ctrl &= ~ASPEED_SGPIO_CTRL_NGPIOS;
> ctrl |= FIELD_PREP(ASPEED_SGPIO_CTRL_NGPIOS, ngpios);
> iowrite32(ctrl, ...);
> spin_unlock(...);

But why. The gpio_chip only knows the ngpios for its own instance.
It has no business knowing about how many gpios are on the
other chips or not. If this is split across several instances this should
not be accounted that is the point.

> This works on cold boot of the device when the ngpios field is set to
> zero due to reset, however will fail on subsequent warm reboots if
> the GPIO IP block is protected from reset by the SoC's watchdog
> configuration: the field will not be zeroed in this case, and the
> value of the field is represented by `NR_BOOTS * NR_GPIOS`,
> which is incorrect. To do this correctly I guess we would need some
> other global state held in the driver implementation (zeroed when
> the kernel is loaded), and write the incremented value to the control
> register on each probe() invocation.

This is answered about I guess.

> However, that aside, we can't simply enable the bus in the clock
> enable callback if enable is called per-bank, as it is called once on
> the first request with further requests simply refcounted as you
> mentioned. This is exactly the behaviour we can't tolerate with the
> bus: it must only be enabled after the last GPIO bank is registered,
> when we know the total number of GPIOs to emit.

So the bus needs to know the total number of GPIOs or
everything breaks, and that is the blocker for this
divide-and-conquer approach.

Why does the bus need to know the total number of GPIOs?

(Maybe the answer is elsewhere in the thread...)

I guess I will accept it if it is really this complex in the
hardware.

Yours,
Linus Walleij
