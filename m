Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A345C45B320
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Nov 2021 05:27:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzSdb4FSBz304j
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Nov 2021 15:26:59 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.181;
 helo=mail-oi1-f181.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyyH82z7Vz2xXg;
 Tue, 23 Nov 2021 19:39:16 +1100 (AEDT)
Received: by mail-oi1-f181.google.com with SMTP id n66so43265336oia.9;
 Tue, 23 Nov 2021 00:39:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YD9+CLUS5Xv902/pEfqOtiLcZyXas3B/t1a2ZRr+mI0=;
 b=Z4v/2e2F8dOftVjY36D6n/KxFD9vlHTYGaFjDWl3N31UrN6ijdnWxh39yR0wkr7Z9T
 lTswJsGedRjuVHF4A67bg7j0zoSP/BbRfSrIFFv3wUnU0SSgKAyzwqSNW39dZQFMx8hN
 fiNdipGmapcSH0bXesGuxJUEaDNGtJoZ3q3jnyi9JmUZCA2ELUYPLWGxgv0qzAzxJTxd
 p70bKFVpYcgk41s08q46552nr0LVMM1kQbXrvxWw/9kWgZICKX/NGPOgYjcAuN6MMGh4
 8yOTZ3uJkIJjY7COxsAknfcvddtCb87pT0DFuq+rxMm/XBGQEkzQC+T8OWu+rj2P4day
 VE3g==
X-Gm-Message-State: AOAM5333Ss/xSFHEgrkhTuvPq0Hi/eDeVgAmESe825u3XSrbIU++QCqQ
 D7ELElH8fkSfUKgmwRrbaM1JA6U+Bami4Q==
X-Google-Smtp-Source: ABdhPJwveDdertywQNcRGK2jZ2ZSmqOWzJqIsXLkQu7vTPDuBllnKmumANBnVUhNbunrDkemcTZOig==
X-Received: by 2002:a05:6808:1152:: with SMTP id
 u18mr621957oiu.73.1637656753552; 
 Tue, 23 Nov 2021 00:39:13 -0800 (PST)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com.
 [209.85.210.53])
 by smtp.gmail.com with ESMTPSA id g26sm2109690ots.25.2021.11.23.00.39.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 00:39:13 -0800 (PST)
Received: by mail-ot1-f53.google.com with SMTP id
 x43-20020a056830246b00b00570d09d34ebso32809995otr.2; 
 Tue, 23 Nov 2021 00:39:13 -0800 (PST)
X-Received: by 2002:a9f:2431:: with SMTP id 46mr6012282uaq.114.1637656742896; 
 Tue, 23 Nov 2021 00:39:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637592133.git.geert+renesas@glider.be>
 <3a54a6703879d10f08cf0275a2a69297ebd2b1d4.1637592133.git.geert+renesas@glider.be>
 <01b44b38c087c151171f8d45a2090474c2559306.camel@sipsolutions.net>
 <5936f811-fa48-33e9-2a1a-66c68f74aa5e@ieee.org>
In-Reply-To: <5936f811-fa48-33e9-2a1a-66c68f74aa5e@ieee.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Nov 2021 09:38:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4C0EgkGXR=MwSuBOFoj7O9xx8xwH5dP8rWzN1ckejQA@mail.gmail.com>
Message-ID: <CAMuHMdX4C0EgkGXR=MwSuBOFoj7O9xx8xwH5dP8rWzN1ckejQA@mail.gmail.com>
Subject: Re: [PATCH 01/17] bitfield: Add non-constant field_{prep,
 get}() helpers
To: Alex Elder <elder@ieee.org>
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
 netdev@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>,
 "David S . Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Alex,

On Tue, Nov 23, 2021 at 2:52 AM Alex Elder <elder@ieee.org> wrote:
> On 11/22/21 10:32 AM, Johannes Berg wrote:
> > On Mon, 2021-11-22 at 16:53 +0100, Geert Uytterhoeven wrote:
> >> The existing FIELD_{GET,PREP}() macros are limited to compile-time
> >> constants.  However, it is very common to prepare or extract bitfield
> >> elements where the bitfield mask is not a compile-time constant.
> >
> > I'm not sure it's really a good idea to add a third API here?
> >
> > We have the upper-case (constant) versions, and already
> > {u32,...}_get_bits()/etc.
>
> I've used these a lot (and personally prefer the lower-case ones).
>
> Your new macros don't do anything to ensure the field mask is
> of the right form, which is basically:  (2 ^ width - 1) << shift

> I really like the property that the field mask must be constant.

That's correct. How to enforce that in the non-const case?
BUG()/WARN() is not an option ;-)

> That being said, I've had to use some strange coding patterns
> in order to adhere to the "const only" rule in a few cases.
> So if you can come up with a satisfactory naming scheme I'm
> all for it.

There are plenty of drivers that handle masks stored in a data
structure, so it would be good if they can use a suitable helper,
as open-coding is prone to errors.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
