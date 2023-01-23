Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D281B678BC5
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Jan 2023 00:06:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P15M35Zl3z3bXQ
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Jan 2023 10:06:23 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.182; helo=mail-oi1-f182.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P11cj1Xbkz2yg5;
	Tue, 24 Jan 2023 07:17:57 +1100 (AEDT)
Received: by mail-oi1-f182.google.com with SMTP id i9so7642781oif.4;
        Mon, 23 Jan 2023 12:17:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EY7We4I2hSyd2pZ0VulkHT4dyOP0LEqk/GnlS4AQK4k=;
        b=cuiiTZy/NR3Dg3NoZqc5QUK51S0bVHWRYJiD1xfo5/tt/y3h3TmH73vClK5AycFc++
         /t6pEIrZzlymITPlw4tUsRigNCj6WQJyLIPrJm7B9bYkYC5QQZ5CHbH7WsIqXzGijgMo
         BPIbs1VXYN79/VkqJei9s6r/NV7o7RQjFd6yrpxImLHG3DYCpN6Qi+WEpFsyjwDlV0fZ
         FeBF5La7jSz2vEfBLjsfOSriuevagqzVxjK+CtiFNOu/XMLghRRNF4dEPsvT2FcdJsBD
         894g4fcEqe2AE1cAF7fpCz3gLs7CbR2h7M+wpUQurA6813rdfsBGWZuIAXfndDbKR+b9
         Jxfw==
X-Gm-Message-State: AFqh2kq2q++qEotubn/a3LmQ2rHYmAIBMWeNY2pwYYif7Og6rCvVajBG
	m5k9rcbn++2F2MAzoeobHg==
X-Google-Smtp-Source: AMrXdXuvPUKWyC8RGNKpvhdFpfXGmbs7xnQ1zVyMxDHfPRH77j6ghKDaBa0O8cM4huncdcgY7ZWv7g==
X-Received: by 2002:a05:6808:f14:b0:364:e9f4:9dd with SMTP id m20-20020a0568080f1400b00364e9f409ddmr15059505oiw.47.1674505074502;
        Mon, 23 Jan 2023 12:17:54 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i11-20020aca2b0b000000b00369a721732asm124660oik.41.2023.01.23.12.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 12:17:54 -0800 (PST)
Received: (nullmailer pid 2454148 invoked by uid 1000);
	Mon, 23 Jan 2023 20:17:51 -0000
Date: Mon, 23 Jan 2023 14:17:51 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/2] spi: dt-bindings: cleanup examples - indentation,
 lowercase hex
Message-ID: <20230123201751.GA2450665-robh@kernel.org>
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
 <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
X-Mailman-Approved-At: Tue, 24 Jan 2023 10:05:29 +1100
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
Cc: Bert Vermeulen <bert@biot.com>, Erwan Leray <erwan.leray@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Gabor Juhos <juhosg@openwrt.org>, Thierry Reding <thierry.reding@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>, Marek Vasut <marex@denx.de>, linux-aspeed@lists.ozlabs.org, Anson Huang <Anson.Huang@nxp.com>, Samuel Holland <samuel@sholland.org>, Leilk Liu <leilk.liu@mediatek.com>, Kevin Hilman <khilman@baylibre.com>, Michal Simek <michal.simek@xilinx.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@list
 s.infradead.org, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>, linux-amlogic@lists.infradead.org, Patrice Chotard <patrice.chotard@foss.st.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, Kuldeep Singh <singh.kuldeep87k@gmail.com>, linux-tegra@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Parshuram Thombare <pthombar@cadence.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, openbmc@lists.ozlabs.org, Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, Vaishnav Achath <vaishnav.a@ti.com>, Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, Paul Walmsley <paul.walmsley@sifive.com>, Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>
 , linux-arm-kernel@lists.infradead.org, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Neil Armstrong <neil.armstrong@linaro.org>, Christophe Kerello <christophe.kerello@foss.st.com>, Li-hao Kuo <lhjeff911@gmail.com>, Birger Koblitz <mail@birger-koblitz.de>, Bjorn Andersson <andersson@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, linux-spi@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Yogesh Gaur <yogeshgaur.83@gmail.com>, Chris Packham <chris.packham@alliedtelesis.co.nz>, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>, linux-sunxi@lists.linux.dev, Pragnesh Patel <pragnesh.patel@sifive.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jan 18, 2023 at 06:39:32PM +0100, Krzysztof Kozlowski wrote:
> Cleanup examples:
>  - use 4-space indentation (for cases when it is neither 4 not 2 space),
>  - drop redundant blank lines,
>  - use lowercase hex.
> 
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/spi/amlogic,meson-gx-spicc.yaml  |  26 +--
>  .../bindings/spi/amlogic,meson6-spifc.yaml    |  22 +--
>  .../bindings/spi/aspeed,ast2600-fmc.yaml      |  24 +--
>  .../bindings/spi/brcm,spi-bcm-qspi.yaml       | 156 +++++++++---------
>  .../bindings/spi/cdns,qspi-nor.yaml           |   4 +-
>  .../bindings/spi/nvidia,tegra210-quad.yaml    |  42 ++---
>  .../bindings/spi/qcom,spi-qcom-qspi.yaml      |   1 -
>  .../devicetree/bindings/spi/renesas,rspi.yaml |  22 +--
>  .../bindings/spi/spi-sunplus-sp7021.yaml      |   4 +-
>  .../devicetree/bindings/spi/st,stm32-spi.yaml |   1 -
>  10 files changed, 150 insertions(+), 152 deletions(-)

[...]

> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> index d35c6f7e2dd5..18afdaab946d 100644
> --- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> @@ -95,7 +95,6 @@ examples:
>               <&dmamux1 1 40 0x400 0x05>;
>        dma-names = "rx", "tx";
>        cs-gpios = <&gpioa 11 0>;

Looks like the indentation needs adjusting here.

> -
>      };
>  
>  ...
> -- 
> 2.34.1
> 
