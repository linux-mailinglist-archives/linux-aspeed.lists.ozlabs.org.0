Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF2645B324
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Nov 2021 05:27:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzSds1TTGz2yn9
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Nov 2021 15:27:13 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.177;
 helo=mail-oi1-f177.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hz8n05FXjz2yPm;
 Wed, 24 Nov 2021 03:32:20 +1100 (AEDT)
Received: by mail-oi1-f177.google.com with SMTP id r26so45693918oiw.5;
 Tue, 23 Nov 2021 08:32:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V9TIRszl8dgvuwgR6nhL0A0nOi/JDggQAeXQjF3xH3Y=;
 b=ZLpCYLE75iYiS5Slfw9GjY2LXJcInv5oUN6+wiECCuSLX5u30ZoBIybXJ8MTGi7n7s
 XjiO7qo1rPdjqtHp/ODVLIUOyKH5VkCtHoPkR7An9j5sjKhqBCdksZTvXOM9MUuH1HAI
 byrCjsH7kUGPG/rFr+15oQ34JZnNy9iTqloYu5pmG37iWl6jmAt0adSXZvOZswS6uXQ6
 6O2YwVsX2zAOx16rfO1RneruBU4UljXI5iR3qh938d1IFiALXfxCeZV42tPjX7lT+AXu
 zlr2Y5cJTN5jQrlk/oAV41u33VtNWMll3P0aBnuUABwVa710TuaK1SxiBVCVrr+4drZc
 QnCQ==
X-Gm-Message-State: AOAM531waoRy2pOp86ar9Ll+UDefFNc535UoTtli/EvYoaAnrf3/UnZE
 1zXMz6uS/C/r1MKvu05DY2BkS8//doZgIqgS
X-Google-Smtp-Source: ABdhPJxoimEunpXVa4AqheBFDr2YYNQqHbhqPdwMyDaN3A1WNuxk608potbgVLDegfCN7D+ClN4Buw==
X-Received: by 2002:a05:6808:11c1:: with SMTP id
 p1mr3902947oiv.113.1637685136663; 
 Tue, 23 Nov 2021 08:32:16 -0800 (PST)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com.
 [209.85.210.52])
 by smtp.gmail.com with ESMTPSA id g9sm2257918otr.18.2021.11.23.08.32.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 08:32:16 -0800 (PST)
Received: by mail-ot1-f52.google.com with SMTP id
 47-20020a9d0332000000b005798ac20d72so16098778otv.9; 
 Tue, 23 Nov 2021 08:32:16 -0800 (PST)
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr10338972uai.89.1637685125903; 
 Tue, 23 Nov 2021 08:32:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637592133.git.geert+renesas@glider.be>
 <3a54a6703879d10f08cf0275a2a69297ebd2b1d4.1637592133.git.geert+renesas@glider.be>
 <01b44b38c087c151171f8d45a2090474c2559306.camel@sipsolutions.net>
 <CAMuHMdUnBgFpqhgjf5AA0LH9MZOFALeC=YinZ4Tv_V+Y9hkRSg@mail.gmail.com>
 <12825803045d1cec0df968f72a9ef2724a2548fb.camel@sipsolutions.net>
In-Reply-To: <12825803045d1cec0df968f72a9ef2724a2548fb.camel@sipsolutions.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Nov 2021 17:31:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwhO30gy42tfGSsEgJAjDOAkQ_cUXMMiSBjMsUj0nqaA@mail.gmail.com>
Message-ID: <CAMuHMdXwhO30gy42tfGSsEgJAjDOAkQ_cUXMMiSBjMsUj0nqaA@mail.gmail.com>
Subject: Re: [PATCH 01/17] bitfield: Add non-constant field_{prep,
 get}() helpers
To: Johannes Berg <johannes@sipsolutions.net>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-aspeed@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>, Tony Lindgren <tony@atomide.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Amit Kucheria <amitk@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-clk <linux-clk@vger.kernel.org>, Ping-Ke Shih <pkshih@realtek.com>,
 Lars-Peter Clausen <lars@metafoo.de>, openbmc@lists.ozlabs.org,
 "Rafael J . Wysocki" <rafael@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-iio@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 "open list:TI ETHERNET SWITCH DRIVER \(CPSW\)" <linux-omap@vger.kernel.org>,
 Benoit Parrot <bparrot@ti.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Eduardo Valentin <edubezval@gmail.com>, Paul Walmsley <paul@pwsan.com>,
 Rajendra Nayak <rnayak@codeaurora.org>, Tero Kristo <kristo@kernel.org>,
 Keerthy <j-keerthy@ti.com>, Linux PM list <linux-pm@vger.kernel.org>,
 Linux MMC List <linux-mmc@vger.kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, netdev <netdev@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Johannes,

On Tue, Nov 23, 2021 at 5:21 PM Johannes Berg <johannes@sipsolutions.net> wrote:
> On Tue, 2021-11-23 at 09:30 +0100, Geert Uytterhoeven wrote:
> > > We have the upper-case (constant) versions, and already
> > > {u32,...}_get_bits()/etc.
> >
> > These don't work for non-const masks.
>
> Obviously, I know that. Still, just saying.
>
> I'm actually in the opposite camp to you I guess - I much prefer the
> typed versions (u32_get_bits() and friends) over the FIELD_GET() macros
> that are more magic.
>
> Mostly though that's because the typed ones also have le32_/be32_/...
> variants, which are tremendously useful, and so I prefer to use them all
> across. In fact, I have considered in the past to just remove the upper-
> case macros entirely but ... no time I guess.

OK, I have to think a bit about this.
FTR, initially I didn't like the FIELD_{GET,PREP}() macros neither ;-)

> In fact, you have e.g. code in drivers/usb/chipidea/udc.c that does
> things like cpu_to_le32(mul << __ffs(...)) - though in those cases it's
> actually constant today, so you could already write it as
> le32_encode_bits(...).

Yeah, there are lots of opportunities for improvement for
drivers/usb/chipidea/.  I didn't include a conversion patch for that
driver, as it led me too deep into the rabbit hole, and I wanted to
get something posted rather sooner than later...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
