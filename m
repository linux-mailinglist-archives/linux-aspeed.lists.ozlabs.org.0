Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBFE6B06B4
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Mar 2023 13:13:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWrns4kcMz3cFr
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Mar 2023 23:13:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mG+VNc7/;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mG+VNc7/;
	dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWrnh60rmz3bg8
	for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Mar 2023 23:13:42 +1100 (AEDT)
Received: by mail-yb1-xb29.google.com with SMTP id q8so72679ybu.5
        for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Mar 2023 04:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678277617;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Oca9dY8hWUO5/h8xtr438Tcso20TDnzGLmg2ddoHe4M=;
        b=mG+VNc7/+ZVH4peD5IzNTeOjeDEtz2/QDLrQseyt1w5jR60Vf3vwhV/UiECtfojG1d
         placMWBg9SZ3uNn9KmQCqQyQKL+3dbLOvATLA2d7k4wzQeMx7iD1t8Ej0dykdODGuchw
         ZIC5gVhPTsdlc+vgfY7DP/ICTAy1rHAyN0BtycPUV2Td9bWfnWKPQAR41CdVEPVcLgjE
         +amCcxZzViJs5TgPv/+zaeIZbAkHw0Gr3djUm2UlDD9P1vRU2cWC0xMDVSvcDMuZv6Ij
         EZN20pCM7mLDwQNRN/EbnHrQycWZHZ6Zqd7umnQU+0SOlaK2Kpr6Cuz2EZN4okjiyEw/
         ID7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678277617;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oca9dY8hWUO5/h8xtr438Tcso20TDnzGLmg2ddoHe4M=;
        b=BnB9NjNVWz8WTQDNXlrmR36+EaCmJ9bV/9ryihKY0ENH+uK28IQ0eB37oqqKlX8JgP
         CI+aQkKSh2j0SQkgx7mgglVy3I0XVZpMfCcbiBAn8qeg/N4kXDcMYNVrVc8EyLDqO5H8
         GIyjthWRbARi0qbolF0GU679zV2wZwvBLcYkUkMpyES96EU4f0QzZ3ekzAQYsOBetBj0
         RmPBstQTTtf+16e1Vr8Tdu/jGfzCMbub+mrj9YCJJMaD1KqlbxHtWt3Ts1Vk/X7lEnZ9
         IDGtA0ssvziGoKsxMcDvN8b1R2dYqSn/mCvg+dIk5Ye00BotprXOPVdj0zB4TfgcKW/6
         41zQ==
X-Gm-Message-State: AO0yUKW0tyEoiER5kDWvJoen4EtvicY2/+phmnes/WBliz8OBjaY3I3z
	jO7fxNMJj4YhCGZleuJ1yZfeFZMRItoZqA3Y8ZHjmg==
X-Google-Smtp-Source: AK7set+ggNypJdI+7ULj7vVNY+A7k42rbSaDWPMWE5mmu2065wVDPTzRD/vMNWcCbvtu842b/ja6rElDW3gnsY5CIcg=
X-Received: by 2002:a5b:209:0:b0:aa9:bd2e:3746 with SMTP id
 z9-20020a5b0209000000b00aa9bd2e3746mr6164422ybl.4.1678277617418; Wed, 08 Mar
 2023 04:13:37 -0800 (PST)
MIME-Version: 1.0
References: <20230215-immutable-chips-v2-0-d6b0e3f2d991@linaro.org>
 <20230215-immutable-chips-v2-3-d6b0e3f2d991@linaro.org> <CACPK8Xc7ekzM9oeR7+fYuK8RfZ4jA8gpH=nUJ-OTp0XZoKwzHQ@mail.gmail.com>
In-Reply-To: <CACPK8Xc7ekzM9oeR7+fYuK8RfZ4jA8gpH=nUJ-OTp0XZoKwzHQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 8 Mar 2023 13:13:25 +0100
Message-ID: <CACRpkdZmemtVHkdo7f8G4wTHEayk1moHSMHEyvomebPV_h8AHA@mail.gmail.com>
Subject: Re: [PATCH v2 03/16] gpio: aspeed: Convert to immutable irq_chip
To: Joel Stanley <joel@jms.id.au>
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
Cc: Marc Zyngier <maz@kernel.org>, linux-omap@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Mun Yew Tham <mun.yew.tham@intel.com>, Kevin Hilman <khilman@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Jay Fang <f.fangjian@huawei.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>, Alban Bedel <albeu@free.fr>, Baolin Wang <baolin.wang@linux.alibaba.com>, Santosh Shilimkar <ssantosh@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, Romain Perier <romain.perier@gmail.com>, William Breathitt Gray <william.gray@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Mar 8, 2023 at 2:22 AM Joel Stanley <joel@jms.id.au> wrote:
> On Tue, 7 Mar 2023 at 13:04, Linus Walleij <linus.walleij@linaro.org> wrote:

> > +static void aspeed_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
> > +{
> > +       const struct aspeed_gpio_bank *bank;
> > +       struct aspeed_gpio *gpio;
> > +       u32 bit;
> > +       int rc, offset;
> > +
> > +       rc = irqd_to_aspeed_gpio_data(d, &gpio, &bank, &bit, &offset);
>
> Why do we call this instead of using irq_data_get_irq_chip_data?

Because this is what the other irqchip callbacks do and I do not
dare to do anything inventive or different as I can't really test
the patches.

> Actually, the callback appears to do the same as the default
> implementation, so we could just drop it?

So is chip->name always set to dev_name(dev) if we don't define
it? I had no idea.

I can respon with this change, the optional IRQ should be a separate
patch I think?

Yours,
Linus Walleij
