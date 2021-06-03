Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 807C0399F83
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Jun 2021 13:07:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwjmT4dHgz301L
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Jun 2021 21:07:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=P78APJKc;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=P78APJKc; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwjmN0lM9z2xZg
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Jun 2021 21:07:48 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id
 l23-20020a17090a0717b029016ae774f973so3001133pjl.1
 for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Jun 2021 04:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wDo2z8iTAiJqBqvWvLB96Okm4phCuyBKqAvyvxyTJXs=;
 b=P78APJKcMH6oqL0fsJYDyeLXqod4sHzF3NXsn6tkC3NkBYbPumu8oRRPGT/fPb1HtZ
 UmaBhblYD4nltFb4LfHSbYjyeyRq1q+Xng3DOD5LCgR6V+7j7JfVMVnTO18hvNonTGAh
 nCB/Zk0yrCgyJlh9b6R39j8OT0/a53Lhanzzmvg5zyfHTnDax/5ap2oyt7s8WZ2Fdtsx
 vy6+WrmcmYqO+6/fcHjFDZsykRNKYqfV+dcheF40g7wGoRKkln9VKOvRpJV+xDXDJPOC
 QtohdoP4CivTDGn77Ix3q/Mdf1NSq+U0Q98iUBwG7EYtzwONK52ax/CLcWtkR7gWBfSg
 dTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wDo2z8iTAiJqBqvWvLB96Okm4phCuyBKqAvyvxyTJXs=;
 b=rN2i/A4IqJjD6mYDRcTCNS+0FkcbUVxuO+r/9E+Xw9n6Kcs+W/MXP2HCnUD9j888QL
 FSf/gb9S2DWz8VG2coLKQvUvv6OUL0n9wZ5kJC08UNeDNET+x2qzXtEJypU4p/+QBbbt
 DQY4JPfNtIzxpbsh7skYKOILsT/mTXCjr9kMg3sQh2WIBsX48ksDcdt3gadey0RSBnbb
 m7AP5WRtsqkZ0SWdVt+LiJ48KcKoRwqpFPc4lOTGdD3yJHcy+UfLnDsTuh7BDpna6qQb
 OrEFFVAKo+krKXzfriquHbGCoT1qI5l0zY7y1T8fE4tGRdsyra4xWHdzFF3Pr17TP8In
 ALtg==
X-Gm-Message-State: AOAM5334+9Z61guNtBOFnzR5tLhL/LlupMenAR5Chekf1cFsty+IXT1L
 kWqLxObuJjzRBm1n/2XA9AKX+FRyU0p6zDatvoI=
X-Google-Smtp-Source: ABdhPJyCs+wp9GQAeR/SyNmg8FNfUVK6o5CEsq9kbEkhUdzsvyuzZtCKxNpGLiUoC4lv9/PO9J5wxEFTLOwFP4TIkL0=
X-Received: by 2002:a17:90a:af8b:: with SMTP id
 w11mr36016810pjq.228.1622718464302; 
 Thu, 03 Jun 2021 04:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210603101822.9645-1-steven_lee@aspeedtech.com>
 <20210603101822.9645-5-steven_lee@aspeedtech.com>
In-Reply-To: <20210603101822.9645-5-steven_lee@aspeedtech.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 3 Jun 2021 14:07:28 +0300
Message-ID: <CAHp75VcPdUeK49w9qg9RuJY7ASMyFMEEi=cX1gnp=wM_QHDZ+w@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] gpio: gpio-aspeed-sgpio: Add set_config function
To: Steven Lee <steven_lee@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Hongweiz@ami.com,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Jun 3, 2021 at 1:20 PM Steven Lee <steven_lee@aspeedtech.com> wrote:
>
> AST SoC supports *retain pin state* function when wdt reset.
> The patch adds set_config function for handling sgpio reset tolerance
> register.

...

> +static int aspeed_sgpio_set_config(struct gpio_chip *chip, unsigned int offset,
> +                                  unsigned long config)
> +{
> +       unsigned long param = pinconf_to_config_param(config);
> +       u32 arg = pinconf_to_config_argument(config);
> +
> +       if (param == PIN_CONFIG_PERSIST_STATE)
> +               return aspeed_sgpio_reset_tolerance(chip, offset, arg);

> +       else

Redundant.

> +               return -EOPNOTSUPP;

IIRC we are using ENOTSUPP internally in the kernel. YEs, checkpatch
warning may be ignored.

> +}

-- 
With Best Regards,
Andy Shevchenko
