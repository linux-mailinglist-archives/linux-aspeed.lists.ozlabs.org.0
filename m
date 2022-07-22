Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1050858389B
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 08:16:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtgQn0Czcz2xjq
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 16:16:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kBc+EnEO;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kBc+EnEO;
	dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LqGMs2vDRz2xjh
	for <linux-aspeed@lists.ozlabs.org>; Sat, 23 Jul 2022 03:17:26 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id p11so3814465lfu.5
        for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Jul 2022 10:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kKlkNDy7IkULxlqR/cm5H8XjRPA1VC1UXnLKGJxFlME=;
        b=kBc+EnEOjMvGg2ZacnNtByBS5zqpdyDA3715FeJnzHEz8i7uQ3YazW37ESeq6Bt/Xs
         xfZxUKs2P9eMWf6y8K6/VFe7VOybuL/G6VLN3AIKAgqfVnwnDcWIaWqMeBD90b1cHJEm
         CrGy0+PfYoICbO7lBsY1q6kAKWV6HYUaZI6Pxj9bQK+3VRbuFAmNR6timpbiAbfNAD1h
         RgrdIYtHkCLgg+QKCKOKx3J8mbJQ8vlMXmwgS5nuRcsGKH/WiePo8hsKWsIvPjTXvgG5
         74rE/woUGUEcCuZI9zWfuFtnmKLvL6vpUJWmdAEsEulykLv048QBWoQr4lEKzl+ShQ0H
         hidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kKlkNDy7IkULxlqR/cm5H8XjRPA1VC1UXnLKGJxFlME=;
        b=xkeGBYQqalkc5XV7FOpnm82zkj4ZQr1/XOd0VadyhbytNAXC0Z7uql5Mx+UYj8Kuna
         Tuowf2vnuRggG4rPMAvh1dIcFL9fx0PrMbSdAkwcTUiVYSw+q2jkaObPJP8q1NE3ngml
         fduaNnWFnAJQB9OfhA2Srdq25AxG7FO2b+Ge658W0RdhbS8B5R/MQ2LXcKThra6mlJeQ
         i5Fk8GUo0+WNm/xREJ0JSgZlYlW4M1MAqRxRejfw8mefx1LXF2CjWPlPTcBLHGO98EhK
         QFZiVewBhEA4AUQpW7iGdO7IDA2FAfO2aOAYFXN7BkqUgPGFQJhgF12YDHOtse/1Xfiw
         NqRQ==
X-Gm-Message-State: AJIora/Ayxar6WcC+LqzRK+7cuswy1MCj6zxhPxmPEkmfIsRUowhUF1v
	88FWKGWqUP91o0KjwNMce7OkyA==
X-Google-Smtp-Source: AGRyM1tCkKIh7mn6CioEd8be2QKiJ6B5weamVHcEf6LV7UC4qd+9bgwV6JWvuVCeXL6DaArFJ0VqEA==
X-Received: by 2002:a05:6512:b84:b0:48a:7d72:407c with SMTP id b4-20020a0565120b8400b0048a7d72407cmr183405lfv.537.1658510238975;
        Fri, 22 Jul 2022 10:17:18 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id e6-20020a05651236c600b0048a72437127sm962811lfs.42.2022.07.22.10.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 10:17:18 -0700 (PDT)
Message-ID: <3c3bccc2-786f-45f2-fe30-3e0c9f95da63@linaro.org>
Date: Fri, 22 Jul 2022 19:17:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/6] ARM: defconfig: address renamed CONFIG_DEBUG_INFO=y
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>
References: <20220721141325.2413920-1-arnd@kernel.org>
 <20220721141325.2413920-5-arnd@kernel.org>
 <e83c98f9-f32a-6bfd-71b6-9aba22aa7abb@linaro.org>
 <CAK8P3a0yc_iZ1dqbReckvune6KszCPvysCX9okYoaU-by+YRhQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAK8P3a0yc_iZ1dqbReckvune6KszCPvysCX9okYoaU-by+YRhQ@mail.gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Neil Armstrong <narmstrong@baylibre.com>, Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Florian Fainelli <f.fainelli@gmail.com>, Alexander Shiyan <shc_work@mail.ru>, Aaro Koskinen <aaro.koskinen@iki.fi>, Will Deacon <will@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Linux-sh list <linux-sh@vger.kernel.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Chen
 -Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Takao Orito <orito.takao@socionext.com>, Vladimir Zapolskiy <vz@mleia.com>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, linux-omap <linux-omap@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Scott Branden <sbranden@broadcom.com>, Taichi Sugaya <sugaya.taichi@socionext.com>, Samuel Holland <samuel@sholland.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Dinh Nguyen <dinguyen@kernel.org>, Pengutronix Kernel
  Team <kernel@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>, linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 21/07/2022 22:43, Arnd Bergmann wrote:

> I'd rather keep them together: while removing the DEBUG_INFO is
> now a NOP, keeping the two changes together explains much better
> why this is done and is atomically needed based on the single patch
> that caused the change.
> 
> It's the same with the LEDS patch that replaces the CONFIG_LEDS
> option with CONFIG_NEW_LEDS.

OK,

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
