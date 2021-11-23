Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CED3B45B31E
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Nov 2021 05:26:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzSdW4twQz2yxV
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Nov 2021 15:26:55 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.171;
 helo=mail-vk1-f171.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyy5D5zJKz2xsX;
 Tue, 23 Nov 2021 19:30:38 +1100 (AEDT)
Received: by mail-vk1-f171.google.com with SMTP id s17so11929274vka.5;
 Tue, 23 Nov 2021 00:30:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tcMJT0SWmBGQBJ3SmOjoPLUb8FZNAvYeGhtoSVPIc5Y=;
 b=yNGay4TaVBZlncpiOCSrZcijlH6bHBI+bqf9VhH3yj57aFwN2xqVK4SzjddE4SF1VB
 uEGL8lDvwxyfTgqrWtxyrOezqc+YrZJ86ZNr6SXBTagmMo+pdI84mAPmFAaBnobwF0gg
 QxBpxzaZFyvhBtZ4i4LhibOCQijR8v+lraC7O0Lhzuqq3gtr4azxY3IjrYFn1sQj4NNL
 4b1HeaeomocR4RxQjmEOP4bbO+k5Bc863og4ZbloFiptfzJvIFmAsHp3pV5NUK1XJf0D
 aA5lQfL7hzwl7Wl1M6cuV6Oby3ct/MC0YJSUGDLcWrjaAac9SM5dFJDkc0JXbabye6Iw
 2R0Q==
X-Gm-Message-State: AOAM530xZhvWNzs476l6ZtZINGtDcQtzcIiV2aXRYnYgCysXqy9Xrq/p
 ywH7WeoENPvnZgFPxYlRctvau17LP6n1Gw==
X-Google-Smtp-Source: ABdhPJyDampFYdpHJOokST2DGFDpvKplXh5cucZjtfLaE0o4hFigW4ArVWU3o+axBr1dC9M6u9SD1Q==
X-Received: by 2002:a05:6122:1350:: with SMTP id
 f16mr7162049vkp.10.1637656235852; 
 Tue, 23 Nov 2021 00:30:35 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54])
 by smtp.gmail.com with ESMTPSA id p3sm6405217vsr.3.2021.11.23.00.30.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 00:30:35 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id p37so42082415uae.8;
 Tue, 23 Nov 2021 00:30:35 -0800 (PST)
X-Received: by 2002:a67:af0a:: with SMTP id v10mr5521182vsl.35.1637656225413; 
 Tue, 23 Nov 2021 00:30:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637592133.git.geert+renesas@glider.be>
 <3a54a6703879d10f08cf0275a2a69297ebd2b1d4.1637592133.git.geert+renesas@glider.be>
 <01b44b38c087c151171f8d45a2090474c2559306.camel@sipsolutions.net>
In-Reply-To: <01b44b38c087c151171f8d45a2090474c2559306.camel@sipsolutions.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Nov 2021 09:30:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUnBgFpqhgjf5AA0LH9MZOFALeC=YinZ4Tv_V+Y9hkRSg@mail.gmail.com>
Message-ID: <CAMuHMdUnBgFpqhgjf5AA0LH9MZOFALeC=YinZ4Tv_V+Y9hkRSg@mail.gmail.com>
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
 linux-wireless@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Amit Kucheria <amitk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-clk@vger.kernel.org,
 Ping-Ke Shih <pkshih@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>,
 openbmc@lists.ozlabs.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 linux-iio@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-media@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 linux-omap@vger.kernel.org, Benoit Parrot <bparrot@ti.com>,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
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

Hi Johannes,

On Mon, Nov 22, 2021 at 5:33 PM Johannes Berg <johannes@sipsolutions.net> wrote:
> On Mon, 2021-11-22 at 16:53 +0100, Geert Uytterhoeven wrote:
> > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > constants.  However, it is very common to prepare or extract bitfield
> > elements where the bitfield mask is not a compile-time constant.
> >
>
> I'm not sure it's really a good idea to add a third API here?
>
> We have the upper-case (constant) versions, and already
> {u32,...}_get_bits()/etc.

These don't work for non-const masks.

> Also, you're using __ffs(), which doesn't work for 64-bit on 32-bit
> architectures (afaict), so that seems a bit awkward.

That's a valid comment. Can be fixed by using a wrapper macro
that checks if typeof(mask) == u64, and uses an __ffs64() version when
needed.

> Maybe we can make {u32,...}_get_bits() be doing compile-time only checks
> if it is indeed a constant? The __field_overflow() usage is already only
> done if __builtin_constant_p(v), so I guess we can do the same with
> __bad_mask()?

Are all compilers smart enough to replace the division by
field_multiplier(field) by a shift?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
