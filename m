Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB9F45B31C
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Nov 2021 05:26:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzSdR37p0z2x9M
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Nov 2021 15:26:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=EMJHfp61;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ieee.org (client-ip=2607:f8b0:4864:20::d32;
 helo=mail-io1-xd32.google.com; envelope-from=elder@ieee.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256
 header.s=google header.b=EMJHfp61; dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HynGJ2pmxz2yKN
 for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Nov 2021 12:52:52 +1100 (AEDT)
Received: by mail-io1-xd32.google.com with SMTP id 14so25779084ioe.2
 for <linux-aspeed@lists.ozlabs.org>; Mon, 22 Nov 2021 17:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ieee.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7Oi7YYe6mXZ9qFhiItC3cT+zBCj+1FGQIOXFSu9z5Og=;
 b=EMJHfp61byAPVM0d+YSPglX9cQhq+7ayPyr9zRTzuSPcvvgnxyLMG1ltK8vjfaD0FU
 tlPYxbO7NtBZeDgMPNcJJoHVx+Je8+bWQnN+DVWW1NrLrqmC5gQjAph9/LWH4uiuxcYY
 wd41pmLNfefVdVvVpoPO9twaon39sVO4IspOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7Oi7YYe6mXZ9qFhiItC3cT+zBCj+1FGQIOXFSu9z5Og=;
 b=NHdeDlCKKkHM2zUW2gvxaEEvfjrpm7FY23pE6XfWhlorVu1UY8BIm+XNF6F17jyccj
 tim1gvrj7FUhkW+qypzHykn6v4Iqg0pvVPtVJ8mGj/2DSufKtKLBGOiguOR+g7ZrMo8v
 3BolVcTtG0VGZiJ251vE1Y2/8ocY6E3gwgVjznvUIoVyhjSYr4QR1LIJ9lG8TSQdngPR
 VVv7Xcw6W7T/jOKGg6skTKfJnVoYAIc+OfcnkG8ciTHF023yzIkppfh9KoWjnqVVAoKz
 QhRoRdAkFLkO8oV2keMz5LeIb4Eh6PqsMOebGi15A+cSl/emy2j1zujKCCVDXelC6NHt
 gbIQ==
X-Gm-Message-State: AOAM533C7O39Ir6gUs/DfpQq2zAh0O5bOLqoZeCD08EfcggyfnSb4q4W
 JIIM+A3ZUZ38G64yyUnqS5PW8A==
X-Google-Smtp-Source: ABdhPJwFYEXqq9O3YpMuHp49czIlbhiXDJHljcLoM+vErOaDm/O2cJ+JlOI+DmxoJkJ4K5f7Ve5+nA==
X-Received: by 2002:a05:6638:14ca:: with SMTP id
 l10mr1120728jak.107.1637632367373; 
 Mon, 22 Nov 2021 17:52:47 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id d137sm6102931iof.16.2021.11.22.17.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 17:52:47 -0800 (PST)
Message-ID: <5936f811-fa48-33e9-2a1a-66c68f74aa5e@ieee.org>
Date: Mon, 22 Nov 2021 19:52:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 01/17] bitfield: Add non-constant field_{prep,get}()
 helpers
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Rajendra Nayak <rnayak@codeaurora.org>, Paul Walmsley <paul@pwsan.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Tero Kristo <kristo@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Benoit Parrot <bparrot@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Ulf Hansson <ulf.hansson@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Eduardo Valentin <edubezval@gmail.com>,
 Keerthy <j-keerthy@ti.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <cover.1637592133.git.geert+renesas@glider.be>
 <3a54a6703879d10f08cf0275a2a69297ebd2b1d4.1637592133.git.geert+renesas@glider.be>
 <01b44b38c087c151171f8d45a2090474c2559306.camel@sipsolutions.net>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <01b44b38c087c151171f8d45a2090474c2559306.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 netdev@vger.kernel.org, linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 11/22/21 10:32 AM, Johannes Berg wrote:
> On Mon, 2021-11-22 at 16:53 +0100, Geert Uytterhoeven wrote:
>> The existing FIELD_{GET,PREP}() macros are limited to compile-time
>> constants.  However, it is very common to prepare or extract bitfield
>> elements where the bitfield mask is not a compile-time constant.
>>
> 
> I'm not sure it's really a good idea to add a third API here?
> 
> We have the upper-case (constant) versions, and already
> {u32,...}_get_bits()/etc.

I've used these a lot (and personally prefer the lower-case ones).

Your new macros don't do anything to ensure the field mask is
of the right form, which is basically:  (2 ^ width - 1) << shift

I really like the property that the field mask must be constant.

That being said, I've had to use some strange coding patterns
in order to adhere to the "const only" rule in a few cases.
So if you can come up with a satisfactory naming scheme I'm
all for it.

					-Alex



> Also, you're using __ffs(), which doesn't work for 64-bit on 32-bit
> architectures (afaict), so that seems a bit awkward.
> 
> Maybe we can make {u32,...}_get_bits() be doing compile-time only checks
> if it is indeed a constant? The __field_overflow() usage is already only
> done if __builtin_constant_p(v), so I guess we can do the same with
> __bad_mask()?
> 
> johannes
> 

