Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC0B583891
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 08:16:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtgQ90ngFz2xHv
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 16:16:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bUbA0eHh;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bUbA0eHh;
	dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpcFS1kKPz3054
	for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Jul 2022 01:39:38 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id z13so1884009ljj.6
        for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Jul 2022 08:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oqVQwNQbcwLQWg6kfm6rj9WKvgY4OIEgQOzUXlpBlmg=;
        b=bUbA0eHhlHZLz/7ERfxE+ujHsrXIi/1BLF0UUgCTGD2Op4a9uPqxE8PfjDUnh0vkrM
         NoiNYlMDhoMOEIMth1a4LodxokvPtNEiBNqvhrTtMsiqk5AvOOTWVvtkX0vcdar+TZ9P
         cuHmDRDRj/iCTgpFnlWFwejofmUcNLUdW+0FeB/h2HYA1p1jGTJseRZ/c1Dk0fKehi12
         XzY95w37ZgrMXEVRmU96gkg5e/DspC1gFPZ/ekbdgflGdDWjEXquopvsQwGp1I4qEgn7
         d7QKdgpNbpN8vahcEQWCFuFNkozJDOmGqU5v/udTFpQ1oOJ+f117PzP28vOHlt71WwUc
         35AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oqVQwNQbcwLQWg6kfm6rj9WKvgY4OIEgQOzUXlpBlmg=;
        b=KK8COhU/1uAYc6CmTAJOf1nUSu2us2YwsrplpiHo8HaWH8Fv3yFuqv3Qn650scMjEx
         b1lCsS0eFLpiI1iCrv8WAPWs+iYn0yoKjwv9Feqr0UVsv34gSYn+Oz7r9nsgpbwihpfU
         k0TA4zFel9SxA0MJ7qekwiQFmikd86jOFj8ZO1dCu/WcAaeuggpcqeOWhOAUPENGOnIr
         Q2Qlb5HI/z/ysK/wU/z+jYnSQsJSLg588Gjn13AGRYtVP1m9jaNvBuwgQhVaa7JdSA7m
         WajU4VnFuZLVymabm5/F6lFj6CP15dbYggu2MU4ZH/gYquZ0tskfA4hiU6mgTt4GQsaj
         E9lw==
X-Gm-Message-State: AJIora9S3bRZa4QBHG521tZXlNZloHh+W7e5uv9mqeQXCU/+/qp/MS/p
	mckAX9HcjegDBT9njC0EVIRShA==
X-Google-Smtp-Source: AGRyM1u1EiuENGOYTFtFOFvt+gosoK/tppAX7Zpo5TZqB7ckZKOx3LwixuugOACtM48KFq3goni/DQ==
X-Received: by 2002:a2e:953:0:b0:25d:5c20:2265 with SMTP id 80-20020a2e0953000000b0025d5c202265mr18734344ljj.348.1658417974213;
        Thu, 21 Jul 2022 08:39:34 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id o23-20020a05651205d700b0048a35b93b24sm504903lfo.181.2022.07.21.08.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 08:39:33 -0700 (PDT)
Message-ID: <e3b0a57b-e987-9be0-75e5-40c0d7e41310@linaro.org>
Date: Thu, 21 Jul 2022 17:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/6] ARM: defconfig: remove stale CONFIG_ZBOOT_ROM entries
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20220721141325.2413920-1-arnd@kernel.org>
 <20220721141325.2413920-4-arnd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220721141325.2413920-4-arnd@kernel.org>
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

On 21/07/2022 16:13, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The default is always 0x0 after commit 39c3e304567a ("ARM: 8984/1:
> Kconfig: set default ZBOOT_ROM_TEXT/BSS value to 0x0"), so any
> defconfig file that has these two lines can now drop them to reduce
> the diff against the 'make savedefconfig' version.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
