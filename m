Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D93E26B4AB4
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Mar 2023 16:26:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PY8yd5PZYz3cB9
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Mar 2023 02:26:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20210112.gappssmtp.com header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=xRgf8zpx;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2607:f8b0:4864:20::92b; helo=mail-ua1-x92b.google.com; envelope-from=brgl@bgdev.pl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20210112.gappssmtp.com header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=xRgf8zpx;
	dkim-atps=neutral
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PY8yS3NRjz3bgn
	for <linux-aspeed@lists.ozlabs.org>; Sat, 11 Mar 2023 02:25:50 +1100 (AEDT)
Received: by mail-ua1-x92b.google.com with SMTP id v48so3741212uad.6
        for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Mar 2023 07:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678461947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fdQamsC4vi5DdWnwK5HVEMpNIaeepKJtcchj23r+Ns8=;
        b=xRgf8zpxpRcJiHDvwUeCgbDOhtkP0Co5sv+gAy33WegXPv7/8fF4TChaKaOtJk7Zib
         p9248LVUG2Op1wOvSOlIN3/odHqRfA5uyWhQ+RCL/D4KcgIdvEK7nTGgRWvrJu7DwF68
         sG9v09jiWmvcWoAMA4OCSI8OUiY6S1+HZGGVvsKUEhzElhGVBwNBQ+A+mX6wTv8S8gzJ
         hMO8c8uEn1awYHv22BiJGlHel8L4nMzk7d8nnDK4iOpmrUHA4WqQN1E/ncqGT+JXGAxf
         1MgZ/5aFZSZ+zMeSbZ4OgVDyVDApZSpdwrT/vE+wCvVqciX5oRp7fbLAcCZvvo6aOWTX
         UDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678461947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fdQamsC4vi5DdWnwK5HVEMpNIaeepKJtcchj23r+Ns8=;
        b=i5R99PYJAQ7x8hWA+MxRxsptGUsxrT3D0hVqAILW/B65ZzDJ3GDVxfWr1rB7TDnyoL
         Ge9i9ebLJ/XUNchW+VNt/Kl7W1hOzpgZWkLONXuBdvD4E1EnN4d1gs8T45Gj4nrcmZbV
         hqhodXoV1ZLyiNGLxtxf0SWus1zpaUsS3S6o6lcRwb/RQFNqX0rxw29fbNUpvpyaEWy1
         rkfspGCvyl1GgySg3hbcST/B97mp4zzqQ21weOc59LZmh5s/Zydpj1rppVz2jYne5kZr
         wuOUXgFYEIPHPYN+ot6ZuQffPglyjx0Oy1aFarXh24Qf+YJkYaK02p1J6HBYwj2VTwvm
         piIw==
X-Gm-Message-State: AO0yUKXVVu9K5v/jfwsW2vMjtRcpZdR5N1lyoVxTSWle6mkkpigW1Ugu
	PnpxCRuj7DVemCoK4smVQEX2aQyXwWd/GNXw7xckew==
X-Google-Smtp-Source: AK7set8JKIa0SDKefJ5/5r0bsBT4FjcaTDkUOLiUSu4UpVWrx/n+FeDaLWhaBvyJsXFMK706ylGuz6gzvS1T6/qS6zA=
X-Received: by 2002:a05:6122:588:b0:42f:6cba:201f with SMTP id
 i8-20020a056122058800b0042f6cba201fmr3007297vko.1.1678461947541; Fri, 10 Mar
 2023 07:25:47 -0800 (PST)
MIME-Version: 1.0
References: <20230215-immutable-chips-v3-0-972542092a77@linaro.org>
In-Reply-To: <20230215-immutable-chips-v3-0-972542092a77@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 10 Mar 2023 16:25:36 +0100
Message-ID: <CAMRc=MdyjQDEMNxGYOKwWHry7MnEFMHYZSg=-FPohNwn6dxjaQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/17] Mass convert GPIO IRQ chips to be immutable
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-aspeed@lists.ozlabs.org, Tony Lindgren <tony@atomide.com>, Daniel Palmer <daniel@thingy.jp>, Alban Bedel <albeu@free.fr>, Kevin Hilman <khilman@kernel.org>, Marc Zyngier <maz@kernel.org>, William Breathitt Gray <william.gray@linaro.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jay Fang <f.fangjian@huawei.com>, linux-gpio@vger.kernel.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Santosh Shilimkar <ssantosh@kernel.org>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Mun Yew Tham <mun.yew.tham@intel.com>, linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>, Romain Perier <romain.perier@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Mar 9, 2023 at 8:45=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> We are getting tired of these irq_chips not getting converted
> to be immutable, so I just take out the big hammer and fix
> some that I deem not too complex as best I can.
>
> I stopped after doing some, I will take another sweep at some
> point I guess.
>
> This is v6.4 material.
>
> The last two patches to pci-idio-* (patch 15 and 16) can be
> omitted if William's patches to convert this driver to
> regmap GPIO are merged first.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes in v3:
> - Deleted the irq_chip->name assignment in the Aspeed driver
> - Fold in a patch from Joel to make aspeed IRQs compulsory
> - Link to v2: https://lore.kernel.org/r/20230215-immutable-chips-v2-0-d6b=
0e3f2d991@linaro.org
>
> Changes in v2:
> - Rebased on v6.3-rc1
> - Collected some test and ACK tags
> - Link to v1: https://lore.kernel.org/r/20230215-immutable-chips-v1-0-51a=
8f224a5d0@linaro.org
>
> ---
> Joel Stanley (1):
>       gpio: aspeed: Always register the irqchip
>
> Linus Walleij (16):
>       gpio: altera: Convert to immutable irq_chip
>       gpio: adnp: Convert to immutable irq_chip
>       gpio: aspeed: Convert to immutable irq_chip
>       gpio: aspeed-sgpio: Convert to immutable irq_chip
>       gpio: ath79: Convert to immutable irq_chip
>       gpio: cadence: Convert to immutable irq_chip
>       gpio: hisi: Convert to immutable irq_chip
>       gpio: hlwd: Convert to immutable irq_chip
>       gpio: idt3243x: Convert to immutable irq_chip
>       gpio: msc313: Convert to immutable irq_chip
>       gpio: mlxbf2: Convert to immutable irq_chip
>       gpio: max732x: Convert to immutable irq_chip
>       gpio: omap: Drop irq_base
>       gpio: omap: Convert to immutable irq_chip
>       gpio: pci-idio-16: Convert to immutable irq_chip
>       gpio: pcie-idio-24: Convert to immutable irq_chip
>
>  drivers/gpio/gpio-adnp.c         |  9 ++++-
>  drivers/gpio/gpio-altera.c       | 25 +++++++-----
>  drivers/gpio/gpio-aspeed-sgpio.c | 44 +++++++++++++++++----
>  drivers/gpio/gpio-aspeed.c       | 82 ++++++++++++++++++++++++++--------=
-----
>  drivers/gpio/gpio-ath79.c        |  8 +++-
>  drivers/gpio/gpio-cadence.c      | 10 +++--
>  drivers/gpio/gpio-hisi.c         | 25 +++++++-----
>  drivers/gpio/gpio-hlwd.c         | 33 ++++++++++++----
>  drivers/gpio/gpio-idt3243x.c     | 11 ++++--
>  drivers/gpio/gpio-max732x.c      |  8 +++-
>  drivers/gpio/gpio-mlxbf2.c       | 32 ++++++++++++----
>  drivers/gpio/gpio-msc313.c       | 26 +++++++++++--
>  drivers/gpio/gpio-omap.c         | 83 ++++++++++++++++++++++------------=
------
>  drivers/gpio/gpio-pci-idio-16.c  | 12 ++++--
>  drivers/gpio/gpio-pcie-idio-24.c | 12 ++++--
>  15 files changed, 290 insertions(+), 130 deletions(-)
> ---
> base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
> change-id: 20230215-immutable-chips-762922277f1e
>
> Best regards,
> --
> Linus Walleij <linus.walleij@linaro.org>
>

Normally these irq_chip conversions would go upstream as fixes but
this time there are too many at once. I applied them to my
gpio/for-next branch. Let's give them some time in next and later we
can backport them if necessary.

Bartosz
