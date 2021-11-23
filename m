Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC6A45B31D
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Nov 2021 05:26:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzSdV08Ndz2x9M
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Nov 2021 15:26:54 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.169;
 helo=mail-qt1-f169.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyxss22BSz2xnb;
 Tue, 23 Nov 2021 19:20:48 +1100 (AEDT)
Received: by mail-qt1-f169.google.com with SMTP id v22so19103634qtx.8;
 Tue, 23 Nov 2021 00:20:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EqDPz0+moIASV8/u18qtwgFpVhcXgwVMGWtajI5MBd0=;
 b=D28KZ2Tieb1xKNdKJgUQTZ1SWsFbZHt68PbGmXKwT1/lLgL8zMegET3IoDGjwkqN+1
 hCPknhi27RKJ/F6LBRL54t5aY2YDlTm2MT7LngH5JE8TgNOr/KjnK+c7Htl9hvUfjTeA
 OzC6bv+LGeQPmUeXOBgFKR5CAEQRlgtW7ah4OrgxQ5tgEfxFf/PASHkEa69JUBO+twGs
 tOUXZizlL6MQrxhzTEz/jGCA1rCg+ouYvsMpSYTg9PF63/47g6BN2MTXb6Cujfsqs2I1
 8UMClCnUaW9D3LiBuIOXaRNwklQdH7/dMHjbIeuCYIcaNy9jGLYYflhicr+G2eHans2M
 KBeQ==
X-Gm-Message-State: AOAM5306pZLB5K5dpv3SpU6DkKI0RrwBoznn0/sBmHLOFeO+B2KIwmvT
 zFHxY2iQUDxxqo45FBP8OljlAyDcMp/poA==
X-Google-Smtp-Source: ABdhPJwBqTUoLCb+PPsQmlxEymW6ZDC1FiiPJQTngAZWWSRdUHDTGyFXnrf1wo+AufpFbSLkYDNtQQ==
X-Received: by 2002:ac8:5e08:: with SMTP id h8mr4093245qtx.204.1637655645340; 
 Tue, 23 Nov 2021 00:20:45 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170])
 by smtp.gmail.com with ESMTPSA id p18sm5809790qtk.54.2021.11.23.00.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 00:20:45 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id g17so57275641ybe.13;
 Tue, 23 Nov 2021 00:20:45 -0800 (PST)
X-Received: by 2002:a9f:248b:: with SMTP id 11mr5954157uar.14.1637655634916;
 Tue, 23 Nov 2021 00:20:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637592133.git.geert+renesas@glider.be>
 <YZvYW1ElW7ZYZNTC@piout.net>
In-Reply-To: <YZvYW1ElW7ZYZNTC@piout.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Nov 2021 09:20:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWKHoBWm2XQmKwB0q8Ya8KzpCgA29D0igXJrGY8=3e8_A@mail.gmail.com>
Message-ID: <CAMuHMdWKHoBWm2XQmKwB0q8Ya8KzpCgA29D0igXJrGY8=3e8_A@mail.gmail.com>
Subject: Re: [PATCH 00/17] Non-const bitfield helper conversions
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 24 Nov 2021 15:26:47 +1100
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-aspeed@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>, Tony Lindgren <tony@atomide.com>,
 linux-wireless@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Amit Kucheria <amitk@kernel.org>, alsa-devel@alsa-project.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-clk@vger.kernel.org,
 Ping-Ke Shih <pkshih@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>,
 openbmc@lists.ozlabs.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 linux-iio@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-media@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, linux-omap@vger.kernel.org,
 Benoit Parrot <bparrot@ti.com>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org, Eduardo Valentin <edubezval@gmail.com>,
 Paul Walmsley <paul@pwsan.com>, Rajendra Nayak <rnayak@codeaurora.org>,
 Tero Kristo <kristo@kernel.org>, Keerthy <j-keerthy@ti.com>,
 linux-pm@vger.kernel.org, linux-mmc@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Alexandre,

On Mon, Nov 22, 2021 at 6:50 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 22/11/2021 16:53:53+0100, Geert Uytterhoeven wrote:
> > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > constants.  However, it is very common to prepare or extract bitfield
> > elements where the bitfield mask is not a compile-time constant.
> > To avoid this limitation, the AT91 clock driver already has its own
> > field_{prep,get}() macros.
>
> My understanding was that this (being compile time only) was actually
> done on purpose. Did I misunderstand?

Yes, it was done on purpose, to maximize type safety.

However, this imposes a severe limitation: we cannot use them in case
the mask is non-const (i.e. stored in some data structure).  This
is a quite common use-case, given the examples I found and converted,
and given you added field_{get,prep}() to the AT91 clock driver.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
