Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C13AB579337
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Jul 2022 08:29:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ln87f4s5sz3dsx
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Jul 2022 16:29:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LcxkuQlc;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com; envelope-from=bjorn.andersson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LcxkuQlc;
	dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LbFWj2n7cz3051
	for <linux-aspeed@lists.ozlabs.org>; Sun,  3 Jul 2022 13:57:35 +1000 (AEST)
Received: by mail-oi1-x233.google.com with SMTP id be10so8929076oib.7
        for <linux-aspeed@lists.ozlabs.org>; Sat, 02 Jul 2022 20:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S2PQt3HxkBxUYjC+VtlXEq4NoCpstcc7waq7Ie+ZSSw=;
        b=LcxkuQlcBom6K7cYz2cObFcKqvmFziGvIewxr5CVdQDXpiVs4Qe1p9/ma3MjpEBl0m
         LdiaLTeEwxUPT1iylGK2uBRwa96fvGW0y6QRWq5F+NZCFL6N1e6TXJlkAQCGEx5XaKBZ
         bMXT/f+ogoq6vs4TCzgBdramsCAz0nmWRD4br2nzTC8FHRTsVjgo15di4+fdqYbsWQIV
         4/vga7HK3myEs7r2HcBsoYeS5QL/sXXpo879hazt2tPiyyJMP+yzm9vvBM9i2od8IqAh
         LSpFzHsWhZD+5n1ToMnLkj0S4zSlSFpghH27+UmeVqnGiX+vxJHJBYAk1fLnQfBbxsFF
         J2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S2PQt3HxkBxUYjC+VtlXEq4NoCpstcc7waq7Ie+ZSSw=;
        b=jta2UI7K5451Vv16xIN89QOBpb2GVXlh/a/chKmkFjo3XxFkqf1fvXYBMldaLH5amw
         LKNHRqSSIxKTHEEhs0rZJAzbv/BMrGeh4MYfFbbWiqiIVb1etvGRAN5zS8P1aFVOhuwP
         FTgr4w6/b9dj6aB06hVW0kZbrWE7QzvsGpEugs1pvl25EMOLlZbU/SKfoZ4BcxYGt4RI
         y6N3ZY8YEuDMMSYinqINCNRhJ9Vee7Xdf6JNLeG3IBJjiRVUWp05r8+wRaPrH8sVu/Sl
         qzyKEvePDzHZOM065QvEcBuaT3iFf+BKOlAnd2RuTIJf1eoojXFdyASjQA8lwYwi62cu
         ScQA==
X-Gm-Message-State: AJIora+7o5Y6VI9JXWw61aHI2NDHU4XxTH7NA+2Uy3Xd4Wyze8gerlme
	5aer8FkBtF+AyQSjeVmmS0Y+nQ==
X-Google-Smtp-Source: AGRyM1vPsLVLSd2YTyZeBHDlHn82rVPH0GlTr+Bdo5oMuTiVoQgn60DY/3PL3sh3O2ct5ts3e02W/w==
X-Received: by 2002:a05:6808:1b25:b0:32e:e59c:3901 with SMTP id bx37-20020a0568081b2500b0032ee59c3901mr13881725oib.186.1656820650648;
        Sat, 02 Jul 2022 20:57:30 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:29 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org
Subject: Re: (subset) [PATCH v2 00/48] dt-bindings: input: gpio-keys: rework matching children
Date: Sat,  2 Jul 2022 22:56:25 -0500
Message-Id: <165682055971.445910.5189932421143220440.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 19 Jul 2022 16:26:55 +1000
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
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, linux-aspeed@lists.ozlabs.org, Neil Armstrong <narmstrong@baylibre.com>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Wei Xu <xuwei5@hisilicon.com>, Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Khuong Dinh <khuong@os.amperecomputing.com>, Florian Fainelli <f.fainelli@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, openbmc@lists.ozlabs.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.i
 nfradead.org, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-arm-msm@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, linux-sunxi@lists.linux.dev, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, Gregory Clement <gregory.clement@bootlin.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Sascha Hauer <s.hauer@pengutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org, linux-input@vger.kernel.org, linux-samsung-soc@vger.kernel.org
 , linux-arm-kernel@lists.infradead.org, Tero Kristo <kristo@kernel.org>, Scott Branden <sbranden@broadcom.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Li Yang <leoyang.li@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Peter Rosin <peda@axentia.se>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 9 Jun 2022 13:37:21 +0200, Krzysztof Kozlowski wrote:
> Merging
> =======
> 1. dt-bindings: rebased on top of Rob's:
>    https://lore.kernel.org/all/20220608211207.2058487-1-robh@kernel.org/
> 
> 2. DTS patches are independent. They can be picked up directly by sub-arch
>    maintainers, by Arnd or Olof, or eventually by me (if you wish).
> 
> [...]

Applied, thanks!

[27/48] arm64: dts: qcom: align gpio-key node names with dtschema
        commit: b08f5cbd69dcd25f5ab2a0798fe3836a97a9d7c6
[28/48] arm64: dts: qcom: correct gpio-keys properties
        commit: 5a4b0b853a2914403746b0a1decab695202ff242
[29/48] arm64: dts: qcom: sdm630-sony-xperia-nile: drop unneeded status from gpio-keys
        commit: 9d8840f6ee426b6dfcb65bdf39e2898652e2b1e5
[30/48] arm64: dts: qcom: align led node names with dtschema
        commit: 3cfe94d660a8ebc19e78ea0a4781d7e9a1054c65

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
