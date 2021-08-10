Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 775B23E5BCA
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Aug 2021 15:35:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkYpq2yP9z30F9
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Aug 2021 23:34:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZkMvWvxM;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22a;
 helo=mail-lj1-x22a.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZkMvWvxM; dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkYpl4d3qz2yLS
 for <linux-aspeed@lists.ozlabs.org>; Tue, 10 Aug 2021 23:34:54 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id h17so17787049ljh.13
 for <linux-aspeed@lists.ozlabs.org>; Tue, 10 Aug 2021 06:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=weC7sDSz7PzZbDSqoiKFHyafe+0MyeXAiBAfK1qKcS4=;
 b=ZkMvWvxM4pvYUqy5fI/4E/yYTR8XZ9e8pydJ6+ayXV+l/hEgGcg9Ypw9CVe+FUTQ2v
 /houmtJqyVgq02TKQ6a746nHq4/i+0VpeDz9l/1d2CpGOlFO38Q1vpU6i7sO+p2s3tMI
 DUlynGX/7LZqhwkoGdQ1I52fAp7G+fpqh10/pb1NMYjXvJSVuesWsHOSGtrvkuPxriNc
 jvVf677JQLZxYssZpEuMQaobwk4MEkUKrGAGiABlPkeOE1bm7qE+ceiIrkU9NvaF3v3R
 LaSTJbXjQcT785+AN9Ak3xvACeT3zp4mEp3Lyn0uUHq+VwXoC16GbDvi0V6XITOL18RG
 FEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=weC7sDSz7PzZbDSqoiKFHyafe+0MyeXAiBAfK1qKcS4=;
 b=OPMLYisRP4YDO+yxrOzgyFDWdxxvLkpMgulPqIZcwEjyYxuckVvACaXNtRukAdBPFo
 wJUHU5BmXrLXJllVT8w5OIe9TEKpP+oJVcTv023joY7d3YQNckHO9AcfxGGH5L5dKBpl
 nVvv0wo27C2pHKSO4tr9eizWhd7effFMe/w+6Ir4qr6LAICjFfU7fN7lPtjBg//lqgLe
 Ke8dy1CeY8hxsRm4mjFFZ3ciMDnldBalpn+Yw7XuRbN5hOsO0Qyif+lKuXZUPiF5o1g1
 InTupgvAqzJNrZuu1lCsptk3Yi2ghmZdh2uO0pypXD4vgkXGVYjiKma0D6ZXJa0WD/hl
 jQuA==
X-Gm-Message-State: AOAM530DSNyalcEZM+4OIp5nT6X7o3882hTsavbj3qfN0uIEX67R37r0
 alnXVDHugf4ltCQzqxrM454lyGUuRgExXuAsf+BMeQ==
X-Google-Smtp-Source: ABdhPJxTxTJieZbnaNjRPZUIvrVUDFyycbbX1QvFSIH1cQRHK81GI3c7N6EJyS6zlrZ5d2BhxV7i2qX73NcqQoP17mQ=
X-Received: by 2002:a2e:888f:: with SMTP id k15mr19671128lji.326.1628602490522; 
 Tue, 10 Aug 2021 06:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210723075858.376378-1-andrew@aj.id.au>
 <20210723075858.376378-2-andrew@aj.id.au>
In-Reply-To: <20210723075858.376378-2-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Aug 2021 15:34:39 +0200
Message-ID: <CACRpkdZ4A3Lw2U+_jXfbuXJFhpesi3SzNN1Codqxi4sLNu5zPw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] pinctrl: Add pinctrl_gpio_as_pin()
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Pavel Machek <pavel@ucw.cz>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Jul 23, 2021 at 9:59 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> Allow gpiochips to map the GPIO numberspace onto a pin numberspace when
> the register layout for GPIO control is implemented in terms of the
> pin numberspace.
>
> This requirement sounds kind of strange, but the patch is driven by
> trying to resolve a bug in the leds-pca955x driver where this mapping is
> not correctly performed.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

(...)

Hm  this looks a bit strange...

> +int pinctrl_gpio_as_pin(struct pinctrl_dev *pctldev, unsigned int gpio)

This is not a good name for this function. Try to come up with
a name that says exactly what the function does.

E.g. "apple pear as apple slice" isn't very helpful, the use case for
this is really hard to understand.

> +EXPORT_SYMBOL_GPL(pinctrl_find_gpio_range_from_pin);

This looks completely wrong.

Yours,
Linus Walleij
