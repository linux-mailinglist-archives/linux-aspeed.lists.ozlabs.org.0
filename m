Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD2E2918D6
	for <lists+linux-aspeed@lfdr.de>; Sun, 18 Oct 2020 20:27:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CDpJq30svzDqbk
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Oct 2020 05:27:23 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eCP39ru/; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CDpJT75PyzDqZT
 for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Oct 2020 05:27:05 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id y14so4631616pgf.12
 for <linux-aspeed@lists.ozlabs.org>; Sun, 18 Oct 2020 11:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5m1S5sZujQt2BwrJwE08lEoVDm6unn9shH52UvLq8Pg=;
 b=eCP39ru/wgTWoNuwiKr05wbnzi+MNNugEbNjFFhzbv9bIlF4z0H41WAb7F4QFdrzUs
 3wApOFJXpSx7+78Xj1hxnR2j5WckIejtQxGjFSu6/frC7Px0NHZdr7s+cR+aVnqBAMZy
 L0pru/h6bvGuBNskG6WWNXhhERcHqmM0Ya6D7tREXWbwpbb8ked7joDGAyt2LB/uNhkv
 igmMotPA4vei9LB5S8fw9yuBKvoMeL1jnh7i4hoj4IlvXjn0CuTJS4dI4RAfo2vWHCyl
 luAzC2CT5EzaYE5fTWW6bfM6kXw4OtDs4OvbUeOXBWMgILs0ZaFG4zihUOnNsvQvL3Cr
 GAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5m1S5sZujQt2BwrJwE08lEoVDm6unn9shH52UvLq8Pg=;
 b=jTqko+1mHuUxHgJzOpXlCpHOOsTdvOSW5GHwT7r9DFviwnHSF3RqnhRKNU5kFbhLF3
 afiVz7K/Tltn0fVrlzUUYTBgbnsz3qECmeebKfOUbhXVhRb0tJfnyaoRnQo88azA4aow
 5Me5QYnKCMcQHw8qrL2jGJfCHKiQ3ET++efgsPx0Isod+p0cQj9C5MBx+3NeQeP5+YDL
 4faeKYNaunHD0+JcuLbcwtFRsunGHMsrji8KxkQLrIuBoC8kHxlwj2tLdaEh/M1pCoHL
 QhcHFtAd7M8AvlfYxOysD+Ucp89IcAiF15h7OKkkYpgiLo5PLvImpGKFFmq956SSH9Li
 rADQ==
X-Gm-Message-State: AOAM532Wen2cclL8UR8Vq4e+TF/ze50YrQLH7wJd0aluJQJRVokka5Oo
 VsF4ixaybWSI6VAOc68Jq43nKcwgXJelt5uB7TA=
X-Google-Smtp-Source: ABdhPJwGULC56yMeMCTuCfZOR7vq/3gi+527g6HGEFWCQUoYxjC3jZWMZspFWo8az4pMvmRQfXU/2rwfArpqJE7bIq4=
X-Received: by 2002:a65:47c2:: with SMTP id f2mr11362279pgs.4.1603045621632;
 Sun, 18 Oct 2020 11:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201013103245.16723-1-billy_tsai@aspeedtech.com>
 <20201013103245.16723-2-billy_tsai@aspeedtech.com>
 <20201018112249.44dd3bde@archlinux>
In-Reply-To: <20201018112249.44dd3bde@archlinux>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 18 Oct 2020 21:26:45 +0300
Message-ID: <CAHp75Vd4Sequmg_qLbtkk2JktM95bk+xg65P0gJNzPO3OQ7Vkg@mail.gmail.com>
Subject: Re: [PATCH 1/3] iio: adc: aspeed: Orgnaize and add the define of adc
To: Jonathan Cameron <jic23@kernel.org>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-iio <linux-iio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Peter Meerwald <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, Oct 18, 2020 at 1:32 PM Jonathan Cameron <jic23@kernel.org> wrote:
> On Tue, 13 Oct 2020 18:32:43 +0800
> Billy Tsai <billy_tsai@aspeedtech.com> wrote:

...

> > +/* [31:16] */

Useless comment.

> > +#define ASPEED_ADC_CTRL_CH_EN(n)     (1 << (16 + n))
> > +#define ASPEED_ADC_CTRL_CH_EN_ALL    GENMASK(31, 16)

But the main point is here.
First of all you may use BIT() in above.
Second, it's a good practice to put variables in the additional
parentheses in macros in case you are doing some operations with.

So, something like BIT(16 + (n)) would be nice to have at the end.

-- 
With Best Regards,
Andy Shevchenko
