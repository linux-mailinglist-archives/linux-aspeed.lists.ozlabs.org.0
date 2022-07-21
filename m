Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A73D358388F
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 08:16:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtgQ24KSzz2xmk
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 16:16:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GCw16Kpa;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GCw16Kpa;
	dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lpc9m14Ggz3c4S
	for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Jul 2022 01:36:27 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id d17so1227217lfa.12
        for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Jul 2022 08:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hfKsdhQQt9tQ595I9ds8b/DPqZVDcCzjVcrK9iWT3ts=;
        b=GCw16KpafXB+y2e+gFPayJKLMhyZMkVvIg00xSfR0J6zmap4XUiw74QYrBPZojxqnG
         nlMigEvmPTJqX2BUwSdZ4mJxx8kFZTXQJaOIndmhXWmnsZmilUJXncDHi2uKE8pGuWVL
         znA3Smzdfbdkc8qVWjZ7RHlZu4leucipgnhrY3cduU0fYTHFS3staPx9+XFkY/ZjtM2h
         117KpUbzALp8IYmM0wdGGHbqPzb9abAasZ2Y4vFeXAUqeWHw9qTJ0dR/mA5YE4OC5PTw
         ZVK2616IlVs5qLNNTIINaLS39Wgp/5PWsi2sSjQEOqP4IsbdopLcNcEJfX1/nxCnsqxR
         Lwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hfKsdhQQt9tQ595I9ds8b/DPqZVDcCzjVcrK9iWT3ts=;
        b=VdFjz0auxdh+zUueaFGNfMbpv9jcwJx5D3OZ7W566Bwv1ixSLbg3C6I5re+LhcCq+f
         sOBK89QwBS/ayeJt152XcqH9wW6HGa/aICJ+buN3cvKXo2Q3whQtJ6hHlJ+HQxyfHOXy
         /rxhZ/FNDhh437t+5A6idOh2yYN8Ggu3l0Hfr6l43EtRsFZXUY38th96SWgL1EvG/zCg
         5o/7LgWfSTBqBnQOe9qV2AD9vU61URg8cyOCLMlA6DD04PtquPHCGfmYUmKGTwVKQKCs
         tJgI9BKgvLZqUTCsYpgnUib5s4F29n5l6/2lSmufhpY/oNlThoBRIsDJA4wC1pbQTYtB
         h4Iw==
X-Gm-Message-State: AJIora871EDxLAl13xKVHVEjj5/EtYn/wOXIXWHdn0kH2L+oQ6O57xpc
	QEbwXJWD4vBKgaFsQxWyzmgVzA==
X-Google-Smtp-Source: AGRyM1uYyhdhJ+K6lLI/9qjAZeU/e9ueK5AuTfFuX6OK/DbxDxlvM3z4hS4HgQhwQusCJCfVoUBo3A==
X-Received: by 2002:a05:6512:1506:b0:47f:79c6:eb36 with SMTP id bq6-20020a056512150600b0047f79c6eb36mr24308198lfb.168.1658417780731;
        Thu, 21 Jul 2022 08:36:20 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id w17-20020a05651234d100b00478f1e04655sm511718lfr.14.2022.07.21.08.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 08:36:20 -0700 (PDT)
Message-ID: <9e872a00-966a-aaf8-7bb9-6627fcb0cf83@linaro.org>
Date: Thu, 21 Jul 2022 17:36:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/6] ARM: refresh defconfig files
Content-Language: en-US
To: Scott Branden <scott.branden@broadcom.com>,
 Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20220721141325.2413920-1-arnd@kernel.org>
 <20220721141325.2413920-2-arnd@kernel.org>
 <9321ce6c-7565-a7eb-2bfe-dac144ab7733@broadcom.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9321ce6c-7565-a7eb-2bfe-dac144ab7733@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 28 Jul 2022 16:15:35 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Neil Armstrong <narmstrong@baylibre.com>, Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Florian Fainelli <f.fainelli@gmail.com>, Alexander Shiyan <shc_work@mail.ru>, Aaro Koskinen <aaro.koskinen@iki.fi>, Will Deacon <will@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-sh@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom
 .com, NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Takao Orito <orito.takao@socionext.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-samsung-soc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, Taichi Sugaya <sugaya.taichi@socionext.com>, Samuel Holland <samuel@sholland.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Dinh Nguyen <dinguyen@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>, linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 21/07/2022 17:33, Scott Branden wrote:
> Hi Arnd,
> 
> On 2022-07-21 07:13, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> A lot of Kconfig options have changed over the years, and we tend
>> to not do a blind 'make defconfig' to refresh the files, to ensure
>> we catch options that should not have gone away.
>>
>> I used some a bit of scripting to only rework the bits where an
>> option moved around in any of the defconfig files, without also
>> dropping any of the other lines, to make it clearer which options
>> we no longer have.
> Resync is fine.  But, it would be great if the defconfig files were kept 
> in sync. Almost every kernel version kconfig options change which affect 
> these files. Could we put in place a defconfig refresh per kernel 
> version to keep them all in sync going forward?
>

Not entirely, because some Kconfig changes are causing symbols to
disappear. Also defconfig is expected to include user-visible options,
even if savedefconfig would drop them.

This is why blind savedefconfig is not acceptable.

Best regards,
Krzysztof
