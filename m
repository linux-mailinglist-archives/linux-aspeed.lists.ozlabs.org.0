Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 133946C5C4E
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Mar 2023 02:50:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhpF36BWdz3bZx
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Mar 2023 12:49:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LoyXTmuT;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LoyXTmuT;
	dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PfZYF069tz3bZv
	for <linux-aspeed@lists.ozlabs.org>; Sun, 19 Mar 2023 21:56:15 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id z21so36456259edb.4
        for <linux-aspeed@lists.ozlabs.org>; Sun, 19 Mar 2023 03:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679223369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zjQK98wMTvC2q3E7fdiQTGy4CfE9nib0P1aeqr32BDM=;
        b=LoyXTmuTmKGgTLGBo0qYnX6Jp8bEDf17eVvP7XGO2qhfRemxtwJtrRH9Ep1JHhGnQk
         DM7G/ianKOJTy+onrcx5K+rasN1+P/5phdjTikcBfSCvls5VoUEtU19R0HbCgCF7aobg
         40WRU2UHhFcDZODehVDDkwN/snWgAt/4QDmupCFnR47uQEZePsVew0+rLxSDOdDvvAwp
         3JMq8P2tanxmPYuvLeuCmLNfn9yRr7Dfe9NF+r536JdXbCdxebQX1OVjBpyJ7mUDvRMU
         iVtQ2+uN79keOw++o+t+UG4w2ddZnZ5CBm+iLIx5uFLx+Pf3+PRu53Jz68pAER7B1gdw
         MxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679223369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zjQK98wMTvC2q3E7fdiQTGy4CfE9nib0P1aeqr32BDM=;
        b=RWE8YCZyxZfFZGei2Z0wGIa6mgnR0phW8K3iKuaBQassMmlQVvX5otTCgCKK3aWMd+
         yQ0QKKwAQjg3V/GUtqGOu8C/wHc+TMONP7vdgOJksf6B4OGEqGOqPwsntUKbvmG7c7NQ
         EntVIO0Vs/TIdXE06V1CjXH75VC4IvDKeQecLzB9TGCtIsLSw5cCXcjwD0OCT0feFrpN
         otWqQnZCfNS//tgcn04rP6SpUNcahPNCcizRn6pZrGj4Qm17NMDqvImdBUW5FAMXu9tq
         lA4kpc+ULiUHxedXea8fNSnt1CkgjwunK3jsOL/xh9V0hq2A1NDqEDwUHULoQtTTJeMX
         /GJg==
X-Gm-Message-State: AO0yUKW0pKkB0nP/UrQpHU1KkOYVmtxsgfJvnQzOiPlDZyO1SJwcndHQ
	tWXSatA12jbvJ8ZgDHwa8rmvSw==
X-Google-Smtp-Source: AK7set8aBKLZuOSLuGkgBgWSIN+Nyo0cQB4QbrQUYK+fT1WnG6tZns0BtbZAKs7jswp9C0GRLAkphg==
X-Received: by 2002:a17:906:7fc6:b0:923:812c:a5d3 with SMTP id r6-20020a1709067fc600b00923812ca5d3mr5250858ejs.25.1679223369254;
        Sun, 19 Mar 2023 03:56:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id 21-20020a170906319500b008d68d018153sm3115271ejy.23.2023.03.19.03.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 03:56:08 -0700 (PDT)
Message-ID: <23036bfc-cceb-2ac5-85fb-5e2d0bc0cbb5@linaro.org>
Date: Sun, 19 Mar 2023 11:56:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
 <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Michal Simek <michal.simek@xilinx.com>
References: <20230317233623.3968172-1-robh@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317233623.3968172-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 23 Mar 2023 12:49:29 +1100
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-rockchip@lists.infradead.org, patches@opensource.cirrus.com, openbmc@lists.ozlabs.org, linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 18/03/2023 00:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

