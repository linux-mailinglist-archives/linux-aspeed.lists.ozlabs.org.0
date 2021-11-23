Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B320B45B31F
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Nov 2021 05:26:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzSdY4Mjwz2ynt
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Nov 2021 15:26:57 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.215.180;
 helo=mail-pg1-f180.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyyDJ5Yylz2yN1;
 Tue, 23 Nov 2021 19:36:46 +1100 (AEDT)
Received: by mail-pg1-f180.google.com with SMTP id 28so17656210pgq.8;
 Tue, 23 Nov 2021 00:36:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FgjXJ8P5x6753ZmnEdNgxnrYu2hwLrUsYessbs9ojVo=;
 b=E6bz3RYnmLGzuAh08ZRqmwQr2XLnPkQciIpEr39BPrS8OTn4uct0nasnB6v14f/fhv
 zf8zZ3fUNI3Ycs0q+b+GfJQ25BhmSd285oPitjfRwhsyNGhm8wSHdwOkJerjz8uLd3W2
 zTJD5tKfrR8RqRIkOfFWN+T4TkkE51hfW6UmP4xsvAVBjsMxQ2FyWPZRzCWCV/x9nvny
 3QHxYB1BqJZvuiZmkkdFEkM9LyVR67VBF4LJWOqFALaAHs0bVRz055VsuCwuAobCcWrC
 TpxsHVw/GOFYwGYCpBwX3+3KEhm1CGXKSyLvrkWs/k3btDjSpyww5xtvfSl65zHK9hnR
 YFvw==
X-Gm-Message-State: AOAM533kM7OqQTm/wtsI0GrhBaZZQFF7mMNyV14GpRfV4XgQohvw2vM7
 X5aFMXDMrWPgZN3NOzOMPFGS5z6fkEd0hg==
X-Google-Smtp-Source: ABdhPJzfOgDzCEutEjIOBSKgj6d2nFC7y5bCFuFvtrf4H/Wju0PUkkQ/dzL9L1naEJq4mI/kGgpLHA==
X-Received: by 2002:a63:1125:: with SMTP id g37mr2642865pgl.118.1637656604287; 
 Tue, 23 Nov 2021 00:36:44 -0800 (PST)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com.
 [209.85.210.174])
 by smtp.gmail.com with ESMTPSA id f21sm12361816pfe.69.2021.11.23.00.36.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 00:36:44 -0800 (PST)
Received: by mail-pf1-f174.google.com with SMTP id c4so18793431pfj.2;
 Tue, 23 Nov 2021 00:36:43 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr6604777vsj.50.1637656593105; 
 Tue, 23 Nov 2021 00:36:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637592133.git.geert+renesas@glider.be>
 <3a54a6703879d10f08cf0275a2a69297ebd2b1d4.1637592133.git.geert+renesas@glider.be>
 <01b44b38c087c151171f8d45a2090474c2559306.camel@sipsolutions.net>
 <20211122171739.03848154@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211122171739.03848154@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Nov 2021 09:36:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWAAGrQUZN18cnDTDUUhuPNTZTFkRMe2Sbf+s7CedPSxA@mail.gmail.com>
Message-ID: <CAMuHMdWAAGrQUZN18cnDTDUUhuPNTZTFkRMe2Sbf+s7CedPSxA@mail.gmail.com>
Subject: Re: [PATCH 01/17] bitfield: Add non-constant field_{prep,
 get}() helpers
To: Jakub Kicinski <kuba@kernel.org>
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
 Zhang Rui <rui.zhang@intel.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-media@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
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
 netdev@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>,
 "David S . Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Jakub,

On Tue, Nov 23, 2021 at 2:17 AM Jakub Kicinski <kuba@kernel.org> wrote:
> On Mon, 22 Nov 2021 17:32:43 +0100 Johannes Berg wrote:
> > On Mon, 2021-11-22 at 16:53 +0100, Geert Uytterhoeven wrote:
> > > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > > constants.  However, it is very common to prepare or extract bitfield
> > > elements where the bitfield mask is not a compile-time constant.
> >
> > I'm not sure it's really a good idea to add a third API here?
>
> +1

Yeah, a smaller API is better.

> > We have the upper-case (constant) versions, and already
> > {u32,...}_get_bits()/etc.

TBH, I don't like the *_get_bits() API: in general, u32_get_bits() does
the same as FIELD_GET(), but the order of the parameters is different?
(*_replace_bits() seems to be useful, though)

That's why I picked field_{get,prep}().

> > Also, you're using __ffs(), which doesn't work for 64-bit on 32-bit
> > architectures (afaict), so that seems a bit awkward.
> >
> > Maybe we can make {u32,...}_get_bits() be doing compile-time only checks
> > if it is indeed a constant? The __field_overflow() usage is already only
> > done if __builtin_constant_p(v), so I guess we can do the same with
> > __bad_mask()?
>
> Either that or add decomposition macros. Are compilers still really bad
> at passing small structs by value?

Sorry, I don't get what you mean by adding decomposition macros.
Can you please elaborate?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
