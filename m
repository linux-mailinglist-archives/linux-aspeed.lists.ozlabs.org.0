Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4D4583893
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 08:16:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtgQH3BFhz2xTb
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 16:16:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wfl3g/vR;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wfl3g/vR;
	dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpcKq0hcRz2xjs
	for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Jul 2022 01:43:26 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id n18so3443459lfq.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Jul 2022 08:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tk1DYU/BipOe/ykhrE+uY+ooU5Pb7mB25/yNG8lTcfE=;
        b=wfl3g/vRkmVmlH69jDqxAlRnmvZUFAn0fafUutbXTYDpLsG8Pb+wt+a7RBPTTkIeAv
         RTA1J3Qz8g58ZqKaZFGcfmZoiK5L3wvZnMlJImcTLgNb+ldG2lCPymk8BkG9ehlB0xoG
         6h/kCT9Muj89aPsxnGQE2taw2N9Id53CXH1TBhOx3DaVlqzhvPDKzR4lMgdoo8EdHX9y
         gDiQ7Ozw9bbiMJhjlNnpYcBKWyzHzzfSEgaRaxT3b+Gqd8C2TJ8X8ryAyEr+SXyHNfaX
         YlDbi4hbRJ2ceGpQOt2JP8zBnTDt95lIKLw81bA5NGb3sE9IcntSJch4r301U++1U29V
         fOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tk1DYU/BipOe/ykhrE+uY+ooU5Pb7mB25/yNG8lTcfE=;
        b=cB6NpBykZKzkKC3al5YElt7euvOSroE/T6L8bnqAM5hU/BjfXlRlXVujlDbdPqEDyV
         TMDUvgBo4y5obssRnlfEJ/okIkWbi8o+wr6Ty56Iz3IsSAWP7w7lvTpvGJH/1RVoFYmd
         /nZRLJrZGdFoXQDeza7j6mgoEKoAeYZ4UhMgF+6Nl42fYczK9bcfLeTv+FOBQfKQuJ9s
         3UAUU/kIr9orBd/Y4bdEecp9OVmR83k2xy5LkvB1m9M88wJKnZ4vRzS4UwNbGzHKiUw8
         /LPvFK+C3qUvZsq+InsC/a40S/B1wVB//eOO3Yu3i2dtsN5w1BqrlDQjpMj1o2elwEDv
         Ge2A==
X-Gm-Message-State: AJIora+dCWx8Gm0aFXEO5jqxKNQJFb5VCnvgHI9QktfYgm+VIGsXq4H7
	rEQW27od4xQMrDru1TP/qxWwjQ==
X-Google-Smtp-Source: AGRyM1ucvLSRgQ3vWLF4H0bcarGzsvXB0TIajUEBtz3KiyNKgTBVHkKnKs5eHbjxAH0RAjhN7ZfcTw==
X-Received: by 2002:a19:6510:0:b0:47f:baaf:e3be with SMTP id z16-20020a196510000000b0047fbaafe3bemr23855009lfb.139.1658418203026;
        Thu, 21 Jul 2022 08:43:23 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id w9-20020ac254a9000000b0047f8d7c08e4sm506524lfk.166.2022.07.21.08.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 08:43:22 -0700 (PDT)
Message-ID: <ba87edff-6e2c-884f-1afb-cf4b721b6893@linaro.org>
Date: Thu, 21 Jul 2022 17:43:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/6] ARM: defconfig: remove broken CONFIG_THUMB disables
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20220721141325.2413920-1-arnd@kernel.org>
 <20220721141325.2413920-6-arnd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220721141325.2413920-6-arnd@kernel.org>
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
> Since commit 1515b186c235 ("ARM: make configuration of userspace
> Thumb support an expert option"), CONFIG_THUMB cannot be disabled
> unless one turns on CONFIG_EXPERT first.
> 
> This is probably for the better, so remove the statements that
> turn it off.
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
