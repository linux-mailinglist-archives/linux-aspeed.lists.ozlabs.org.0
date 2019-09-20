Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97892B8BB5
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Sep 2019 09:43:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZQgX3J7GzF3Dt
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Sep 2019 17:43:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.222.193; helo=mail-qk1-f193.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZQgM1XBWzF3CG
 for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Sep 2019 17:43:10 +1000 (AEST)
Received: by mail-qk1-f193.google.com with SMTP id y189so6388912qkc.3
 for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Sep 2019 00:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3lKk+zwO3ztRJxmFWZdj4M4We36PKrcFNdQxMw/wFCw=;
 b=gjaUBEOy28RqeCc16VDHmd4kvlWOVj4w++pimPj8YVP5TzoWDDoBuVuYhvn/gEDb5J
 vQFhYuwqj9tNNGFJUb+LvTJG00n8CYDcMCMh4JCtLikNgRNGZkHYKKdEuY+CNY9rjs+B
 O9fF1scOLWidSeUYnfdv+CbgpBNcM8GSQonqkXXAh7sqNz3Atqz0wkdnKhw/Rw68NVfR
 6BssjwAIbEv5ZWdtgmlMKDW9pSIiC6IxkjuZAJpvlb3Fmd0LZkV84sRgl97IbXWyOdML
 l8EgsNxIbbHUnefQbKUYaHqC7zjIAjpNyjU2WU5vX6JMkBxMTSzVy0uKr45BQtlK3HUm
 WnlQ==
X-Gm-Message-State: APjAAAUjiEHYQKigBNziExP8S9xdTuDFxhcR/4DTqzgvcQibmdBcMjz3
 tB+WSZ3CrSvqLupiWnGZvXFccEqJnNutVZbA3CE=
X-Google-Smtp-Source: APXvYqzBHupHID5t8krankJiBM+2cD1x69FWvFH32XCalJNyUJQ3f3NQ0ko9RSVCp48Pj9I3P/V020rv8gspzcooDJE=
X-Received: by 2002:a37:a858:: with SMTP id r85mr2318323qke.394.1568965387375; 
 Fri, 20 Sep 2019 00:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190919142654.1578823-1-arnd@arndb.de>
 <CACPK8XcsegR5R0nkiZ-UEMgCqNMggCXjAr2N-6J1S6mEhGLrBQ@mail.gmail.com>
In-Reply-To: <CACPK8XcsegR5R0nkiZ-UEMgCqNMggCXjAr2N-6J1S6mEhGLrBQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 20 Sep 2019 09:42:51 +0200
Message-ID: <CAK8P3a17ReGKk70YoS72OvV=9KfDJBwDQkFDKx_1imdEbTboZQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: aspeed: ast2500 is ARMv6K
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Sep 20, 2019 at 7:51 AM Joel Stanley <joel@jms.id.au> wrote:
> On Thu, 19 Sep 2019 at 14:27, Arnd Bergmann <arnd@arndb.de> wrote:

> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  arch/arm/mach-aspeed/Kconfig | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
> > index a293137f5814..163931a03136 100644
> > --- a/arch/arm/mach-aspeed/Kconfig
> > +++ b/arch/arm/mach-aspeed/Kconfig
> > @@ -26,7 +26,6 @@ config MACH_ASPEED_G4
> >  config MACH_ASPEED_G5
> >         bool "Aspeed SoC 5th Generation"
> >         depends on ARCH_MULTI_V6
> > -       select CPU_V6
> >         select PINCTRL_ASPEED_G5 if !CC_IS_CLANG
>
> I can't find any trees with !CC_IS_CLANG here. Is there a problem
> building our pinmux driver with Clang?

This was an unrelated change from my local randconfig tree.

Your driver uncovered a bug in clang that is now fixed, the driver
itself is fine, see https://bugs.llvm.org/show_bug.cgi?id=43243

> I tested with this patch:
> --- a/arch/arm/mach-aspeed/Kconfig
> +++ b/arch/arm/mach-aspeed/Kconfig
> @@ -25,8 +25,8 @@ config MACH_ASPEED_G4
>
>  config MACH_ASPEED_G5
>         bool "Aspeed SoC 5th Generation"
> +       # This implies ARMv6K which covers the ARM1176
>         depends on ARCH_MULTI_V6
> -       select CPU_V6
>         select PINCTRL_ASPEED_G5
>         select FTTMR010_TIMER
>         help
>
> If you want to apply that as a fix for 5.4 I would be happy with that.
>
> Fixes: 8c2ed9bcfbeb ("arm: Add Aspeed machine")
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Applied to arm/fixes now.

      Arnd
