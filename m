Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2924596AE
	for <lists+linux-aspeed@lfdr.de>; Mon, 22 Nov 2021 22:29:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HygPw1PXhz2yp4
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Nov 2021 08:29:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iF32sjGr;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::335;
 helo=mail-ot1-x335.google.com; envelope-from=larry.finger@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=iF32sjGr; dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HybdT6ZDBz2xCX;
 Tue, 23 Nov 2021 05:38:53 +1100 (AEDT)
Received: by mail-ot1-x335.google.com with SMTP id
 x43-20020a056830246b00b00570d09d34ebso30164532otr.2; 
 Mon, 22 Nov 2021 10:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UHFB4okDolhXrN2KtXNKGXY4xx9A6ENlJZJpcpYJSa4=;
 b=iF32sjGrzSvaDDiDrzm4Jn8+gNbGxPrbBxZFxi4uCknK7CkuUHGcqoOD65h4RyWxyF
 y+wOmbGDPKkCG8jIqPGxKaFK0D3GvGCi7E7vj/rSSTElZKQ4I+sO6sAsXlhvWm4LJdnp
 2KvDVCusXICAOU/8p8E70quXduhRoLziMS5wtCLJdF0xE54KuxD1Hx/LXZJoPAM3DNL1
 BkvRF4pmS6od3lYRUbwlZMx97PcjFnI9HdmkEczPsl3ta8bzsAye+LybTN6gfUn7gNW8
 MLS92ARh+GguAjdL9uq+LetI8B96GaD9Vc3Ip4BN7Uy3BSXQIu3jgX7O1p5U0Obaav48
 V51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UHFB4okDolhXrN2KtXNKGXY4xx9A6ENlJZJpcpYJSa4=;
 b=fgMZHCuT7uxC7pfeAAjRd3nF6x0xCYltVueJOG7PruHML7biSPuQsjzGAFWwtw1TRZ
 LS6sPxw99DKjiHhn7BtUw/trmxGo73LTFCjHWeBJor6QfNB1B0hGN81mTm6FGDAzRUYb
 QJIMgbA8fP47k/zMSTfinT/jqLDTDslyBe8PmIFZk9nYzLNUIH5uM4j5tKoV0csDD8SY
 Wy1OnPVK4BCxa5oqp5Hcimf4KNuBIPpdwI4/yzGJPtu9mGDBHNP9NdAnGBVGcY5LcMOL
 wZ74bFF8CLp6EEwm9TEEPrJk6aV8m/iCoa0KfQiiQgRMWAkecPzcqloyrAGOzxtTZNev
 0mBg==
X-Gm-Message-State: AOAM533sclrL2Uxigm8iT3nvt3F6/wXkuP/vOTkOskk5JHUVRHMph/gA
 wbAzuXfGkqJfIvv32azJIek=
X-Google-Smtp-Source: ABdhPJwfr5gWpFAYZtUOP0l+WeTUOCLuMHjoxvBl19lgRYsYRNjGQbRkBWj0P0bUDebnG/bzTCmu0Q==
X-Received: by 2002:a9d:5190:: with SMTP id y16mr27309322otg.364.1637606329228; 
 Mon, 22 Nov 2021 10:38:49 -0800 (PST)
Received: from [10.62.118.101] (cpe-24-31-246-181.kc.res.rr.com.
 [24.31.246.181])
 by smtp.gmail.com with ESMTPSA id f18sm1729016otl.28.2021.11.22.10.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 10:38:48 -0800 (PST)
Message-ID: <a18f44bf-e590-0ebe-00c0-5658f3a51d86@lwfinger.net>
Date: Mon, 22 Nov 2021 12:38:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH/RFC 17/17] rtw89: Use bitfield helpers
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
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
 <f7b81122f7596fa004188bfae68f25a68c2d2392.1637592133.git.geert+renesas@glider.be>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <f7b81122f7596fa004188bfae68f25a68c2d2392.1637592133.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 23 Nov 2021 08:28:20 +1100
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

On 11/22/21 09:54, Geert Uytterhoeven wrote:
> Use the field_{get,prep}() helpers, instead of open-coding the same
> operations.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.
> Marked RFC, as this depends on [PATCH 01/17], but follows a different
> path to upstream.
> ---
>   drivers/net/wireless/realtek/rtw89/core.h | 38 ++++-------------------
>   1 file changed, 6 insertions(+), 32 deletions(-)

Tested-by: Larry Finger <Larry,Finger@lwfinger.net>

Larry

> 
> diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wireless/realtek/rtw89/core.h
> index c2885e4dd882f045..f9c0300ec373aaf2 100644
> --- a/drivers/net/wireless/realtek/rtw89/core.h
> +++ b/drivers/net/wireless/realtek/rtw89/core.h
> @@ -2994,81 +2994,55 @@ rtw89_write32_clr(struct rtw89_dev *rtwdev, u32 addr, u32 bit)
>   static inline u32
>   rtw89_read32_mask(struct rtw89_dev *rtwdev, u32 addr, u32 mask)
>   {
> -	u32 shift = __ffs(mask);
> -	u32 orig;
> -	u32 ret;
> -
> -	orig = rtw89_read32(rtwdev, addr);
> -	ret = (orig & mask) >> shift;
> -
> -	return ret;
> +	return field_get(mask, rtw89_read32(rtwdev, addr));
>   }
>   
>   static inline u16
>   rtw89_read16_mask(struct rtw89_dev *rtwdev, u32 addr, u32 mask)
>   {
> -	u32 shift = __ffs(mask);
> -	u32 orig;
> -	u32 ret;
> -
> -	orig = rtw89_read16(rtwdev, addr);
> -	ret = (orig & mask) >> shift;
> -
> -	return ret;
> +	return field_get(mask, rtw89_read16(rtwdev, addr));
>   }
>   
>   static inline u8
>   rtw89_read8_mask(struct rtw89_dev *rtwdev, u32 addr, u32 mask)
>   {
> -	u32 shift = __ffs(mask);
> -	u32 orig;
> -	u32 ret;
> -
> -	orig = rtw89_read8(rtwdev, addr);
> -	ret = (orig & mask) >> shift;
> -
> -	return ret;
> +	return field_get(mask, rtw89_read8(rtwdev, addr));
>   }
>   
>   static inline void
>   rtw89_write32_mask(struct rtw89_dev *rtwdev, u32 addr, u32 mask, u32 data)
>   {
> -	u32 shift = __ffs(mask);
>   	u32 orig;
>   	u32 set;
>   
>   	WARN(addr & 0x3, "should be 4-byte aligned, addr = 0x%08x\n", addr);
>   
>   	orig = rtw89_read32(rtwdev, addr);
> -	set = (orig & ~mask) | ((data << shift) & mask);
> +	set = (orig & ~mask) | field_prep(mask, data);
>   	rtw89_write32(rtwdev, addr, set);
>   }
>   
>   static inline void
>   rtw89_write16_mask(struct rtw89_dev *rtwdev, u32 addr, u32 mask, u16 data)
>   {
> -	u32 shift;
>   	u16 orig, set;
>   
>   	mask &= 0xffff;
> -	shift = __ffs(mask);
>   
>   	orig = rtw89_read16(rtwdev, addr);
> -	set = (orig & ~mask) | ((data << shift) & mask);
> +	set = (orig & ~mask) | field_prep(mask, data);
>   	rtw89_write16(rtwdev, addr, set);
>   }
>   
>   static inline void
>   rtw89_write8_mask(struct rtw89_dev *rtwdev, u32 addr, u32 mask, u8 data)
>   {
> -	u32 shift;
>   	u8 orig, set;
>   
>   	mask &= 0xff;
> -	shift = __ffs(mask);
>   
>   	orig = rtw89_read8(rtwdev, addr);
> -	set = (orig & ~mask) | ((data << shift) & mask);
> +	set = (orig & ~mask) | field_prep(mask, data);
>   	rtw89_write8(rtwdev, addr, set);
>   }
>   
> 

