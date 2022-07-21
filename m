Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CCF583892
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 08:16:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtgQD35qxz2xkZ
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 16:16:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hvMY/wKg;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hvMY/wKg;
	dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpcJR2drdz3054
	for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Jul 2022 01:42:14 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id d17so1252409lfa.12
        for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Jul 2022 08:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DbAlny0t1Z1mEp76q3Ok9AdQU6F9gRBoHTbQLXF/2lk=;
        b=hvMY/wKgqNkLwMGAA1veSwXkHAGy+A6V3WOkfUKYAdhYB8ptxzUPD7n35rsO9Jcvr7
         6UDVHo0V37fnqX2S0c15nIq3n4z6ArkAWtF+lGEg9BC5qQf+mEDT2UuywuO/+AFrwg6P
         jFuYVRrXQ21UhwdbV388q5sUMCQU465XKUyiSp0BPn/vBPSJN9lK2KzWUZE7tRuBCkcF
         ewxg0NMWAaa3d+T2QRhzgxExRIc5ACCOcQ3/ppkPQ5wo0swP5SjDLy8L+XwpArxrJ0Q/
         eeAmdqXFlUazj++UKjdRTrln8X4SOrsW3BodSCOU0+mbJsZrrBRXQKEnIdrhHN8un0RW
         grAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DbAlny0t1Z1mEp76q3Ok9AdQU6F9gRBoHTbQLXF/2lk=;
        b=K2X7jxVwJsKcJOxn/UrtdmTkl2o69HmXKwLmkr7ujqUF2/byCjRUMHCZMoG1KE354F
         u8ZrgwvgcU3DeR7h8obwhNZKM8sXX+iihfrH4yWIJxS1I5+4omaejrLqKWGGkKQb3uZ/
         FWfEGr4cVd6NiaCV8RINFQBg5GqQWdFghoAexC2Rb2VkahEhpXyBdogrX1Dznza/BOwo
         IbgTfGtvmrcAFeH1BBR2/bdpMXRoqdNftzIr5FLM1OGStgT+LPBF72yOi+zAbz1P39hu
         EgMP/KkDKcYtY/XqXyhjP4Y7rUEiMP0Y7+y/CXvHw0WH91vEVIQW4zIW8zxfvId6PxBY
         v5ng==
X-Gm-Message-State: AJIora+6yBuU26IaNZKrzznRfBA+ebo6gEqKh3JxMjBy4Zyzx5gT9cDC
	AALw+d4WYKOfF4JK0kQHQOyZVQ==
X-Google-Smtp-Source: AGRyM1uH+KevGsKWyG8Df61xvPgqfo29eVC+LR/aED9QzOXzzbztIiUFTSzFYEZjDIchb6h/N4lCSg==
X-Received: by 2002:a05:6512:3409:b0:489:c549:4693 with SMTP id i9-20020a056512340900b00489c5494693mr21503245lfr.26.1658418131160;
        Thu, 21 Jul 2022 08:42:11 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id s4-20020a056512314400b00488333b6515sm499662lfi.305.2022.07.21.08.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 08:42:10 -0700 (PDT)
Message-ID: <e83c98f9-f32a-6bfd-71b6-9aba22aa7abb@linaro.org>
Date: Thu, 21 Jul 2022 17:42:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/6] ARM: defconfig: address renamed CONFIG_DEBUG_INFO=y
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20220721141325.2413920-1-arnd@kernel.org>
 <20220721141325.2413920-5-arnd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220721141325.2413920-5-arnd@kernel.org>
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
> CONFIG_DEBUG_INFO is now implicitly selected if one picks one of the
> explicit options that could be DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT,
> DEBUG_INFO_DWARF4, DEBUG_INFO_DWARF5.
> 
> This was actually not what I had in mind when I suggested making
> it a 'choice' statement, but it's too late to change again now,
> and the Kconfig logic is more sensible in the new form.
> 
> Change any defconfig file that had CONFIG_DEBUG_INFO enabled
> but did not pick DWARF4 or DWARF5 explicitly to now pick the toolchain
> default.

I think this should be split - into remove DEBUG_INFO (noop) and into
selecting CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT (a fix).

Best regards,
Krzysztof
