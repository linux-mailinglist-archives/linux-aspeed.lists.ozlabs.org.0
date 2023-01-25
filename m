Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E26986804F2
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Jan 2023 05:21:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P4w3K5YG2z3cK6
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Jan 2023 15:21:01 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.48; helo=mail-oa1-f48.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2FFk2zR4z3bYW;
	Thu, 26 Jan 2023 07:05:45 +1100 (AEDT)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-142b72a728fso22713671fac.9;
        Wed, 25 Jan 2023 12:05:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kqCnvG5HfBYMdFzmIrllsGYjZVwDWefqF05Cmky4HA=;
        b=dQvkEiqJ/QlykD2eNy80pgbREuoYW7I6zKmgMOutrVIhClyuE0ANaiZZJ4JiTwLh/q
         NlMzElrn27pjdo7amBr8A+Z+F9rbDT527khGwdtAbzb+idPRTRD2KxrGhWBlB3KCJZem
         tpN2+wGhgNp6SPNTgZQONQ/PiA0xSNYJidjFOWQusqHtNLpAqLS6LxWOXM3S/fXrnkrS
         yfgTYpnx3XqoPpq4OP1XP4EYFhAOHmfIYgOVi1VT/keo/sFSAKEd8JQefF+Gt6HR8phk
         eSypIj4h3kmamiwisfduqxUGMyNVahHbTcntnWWK+HeJaTDHOqPLzECh2SNYQZgJvEjE
         j+hg==
X-Gm-Message-State: AO0yUKWIywf+X6X7mBwP4nPYDUGfMyzut7a2EYNlPcRdgRJh4gcLyLyZ
	Z7gF1rhic9Ii+JVWHsLmkA==
X-Google-Smtp-Source: AK7set+KlYA9hOhKxY3yXbw1+jJFui+axb/K8qUGpNYSrXD6fL93Qjufe/ZRHNh9bIxZbHxYbUPr4A==
X-Received: by 2002:a05:6870:14d5:b0:163:45a2:e276 with SMTP id l21-20020a05687014d500b0016345a2e276mr684576oab.9.1674677142691;
        Wed, 25 Jan 2023 12:05:42 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n20-20020a056870559400b0010d7242b623sm2325869oao.21.2023.01.25.12.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:05:42 -0800 (PST)
Received: (nullmailer pid 2768672 invoked by uid 1000);
	Wed, 25 Jan 2023 20:05:39 -0000
Date: Wed, 25 Jan 2023 14:05:39 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 2/2] spi: dt-bindings: cleanup examples - indentation,
 lowercase hex
Message-ID: <167467713905.2768614.7865748447151198568.robh@kernel.org>
References: <20230124083342.34869-1-krzysztof.kozlowski@linaro.org>
 <20230124083342.34869-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124083342.34869-2-krzysztof.kozlowski@linaro.org>
X-Mailman-Approved-At: Mon, 30 Jan 2023 15:19:32 +1100
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
Cc: Erwan Leray <erwan.leray@foss.st.com>, ", Bert Vermeulen" <bert@biot.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, linux-riscv@lists.infradead.org, ", Fabio Estevam" <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>, Marek Vasut <marex@denx.de>, linux-aspeed@lists.ozlabs.org, Anson Huang <Anson.Huang@nxp.com>, Kamal Dasu <kdasu.kdev@gmail.com>, Leilk Liu <leilk.liu@mediatek.com>, Chunyan Zhang <zhang.lyra@gmail.com>, openbmc@lists.ozlabs.org, Michal Simek <michal.simek@xilinx.com>, Haibo Chen <haib
 o.chen@nxp.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, ", Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, Birger Koblitz <mail@birger-koblitz.de>, Orson Zhai <orsonzhai@gmail.com>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Kuldeep Singh <singh.kuldeep87k@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Parshuram Thombare <pthombar@cadence.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, Chris Packham <chris.packham@alliedtelesis.co.nz>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-mediatek@lists.infradead.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org, Han Xu <han.xu@nxp.com>, lin
 ux-arm-kernel@lists.infradead.org, Patrice Chotard <patrice.chotard@foss.st.com>, Neil Armstrong <neil.armstrong@linaro.org>, ", Christophe Kerello" <christophe.kerello@foss.st.com>, Li-hao Kuo <lhjeff911@gmail.com>, Gabor Juhos <juhosg@openwrt.org>, Vaishnav Achath <vaishnav.a@ti.com>, Bjorn Andersson <andersson@kernel.org>, Samuel Holland <samuel@sholland.org>, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, linux-spi@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Yogesh Gaur <yogeshgaur.83@gmail.com>, Mark Brown <broonie@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Pragnesh Patel <pragnesh.patel@sifive.com>, NXP Linux Team <linux-imx@nxp.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Tue, 24 Jan 2023 09:33:42 +0100, Krzysztof Kozlowski wrote:
> Cleanup examples:
>  - use 4-space indentation (for cases when it is neither 4 not 2 space),
>  - drop redundant blank lines,
>  - use lowercase hex.
> 
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au> # aspeed
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org> # meson
> 
> ---
> 
> Changes since v1:
> 1. Adjust indentation in two more examples (cdns,qspi-nor, st,stm32-spi)
> 2. Add tags
> ---
>  .../bindings/spi/amlogic,meson-gx-spicc.yaml  |  26 +--
>  .../bindings/spi/amlogic,meson6-spifc.yaml    |  22 +--
>  .../bindings/spi/aspeed,ast2600-fmc.yaml      |  24 +--
>  .../bindings/spi/brcm,spi-bcm-qspi.yaml       | 156 +++++++++---------
>  .../bindings/spi/cdns,qspi-nor.yaml           |  34 ++--
>  .../bindings/spi/nvidia,tegra210-quad.yaml    |  42 ++---
>  .../bindings/spi/qcom,spi-qcom-qspi.yaml      |   1 -
>  .../devicetree/bindings/spi/renesas,rspi.yaml |  22 +--
>  .../bindings/spi/spi-sunplus-sp7021.yaml      |   4 +-
>  .../devicetree/bindings/spi/st,stm32-spi.yaml |  23 ++-
>  10 files changed, 176 insertions(+), 178 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
