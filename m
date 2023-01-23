Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD66678BC4
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Jan 2023 00:06:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P15M11FcTz3bYw
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Jan 2023 10:06:21 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.41; helo=mail-oa1-f41.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P11Yb41Fhz2yfg;
	Tue, 24 Jan 2023 07:15:13 +1100 (AEDT)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-15085b8a2f7so15349921fac.2;
        Mon, 23 Jan 2023 12:15:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9JOc294Un2/0rB0FUKryYqic16naXseJPC92bOtRF0=;
        b=f1u8sv/bId8JNtD3VsDKBQKVz5EAI1ckSBClYUQpq/HTuBbkGhJ2WXSQV9VIVZ/mpm
         C0Dc4B7My+e3WKD6oyPqtOMpnsGsVPzX+/MwgBL2Y6OWNNEVFw8eIYYsps6qz2A4Gmps
         8KT2LC9rTzKdU7KtLAuMJKVyzCsXqwncHRY3hOvP0lEy4OCLcnVICrLj7cLrgoAZoHvD
         aloEtsDnJNZOpIomSF6+qEHHHdXci91tb3lx1eeDEl921lDKZT3vuyZtH4u+d9oofnfX
         KxD6sr4Y/7iKIjTwr1dsK1fXFI2je+lAVDoYUnNMa49ukSG79z5PtjXVM8L3eWpYEuBW
         TURA==
X-Gm-Message-State: AFqh2kqgqKlnrmjLD6hKoDDVUS/k81JI7qm4v5rdKSy4JauMNqzXZUWo
	oM3YwdU5GRTTaLNBuc85MA==
X-Google-Smtp-Source: AMrXdXv7/0UWYAVSm7F28zXqx2erH3WvlYts86KO/fBElTBfrToCx8V4nVQwijpoo96jnpY39d8zVA==
X-Received: by 2002:a05:6871:4506:b0:154:988a:d32d with SMTP id nj6-20020a056871450600b00154988ad32dmr14480326oab.27.1674504910165;
        Mon, 23 Jan 2023 12:15:10 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b10-20020a056870390a00b001435fe636f2sm25818920oap.53.2023.01.23.12.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 12:15:09 -0800 (PST)
Received: (nullmailer pid 2450508 invoked by uid 1000);
	Mon, 23 Jan 2023 20:15:07 -0000
Date: Mon, 23 Jan 2023 14:15:07 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] spi: dt-bindings: drop unneeded quotes
Message-ID: <167450490674.2450465.12158974323906034097.robh@kernel.org>
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
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
Cc: Erwan Leray <erwan.leray@foss.st.com>, Bert Vermeulen <bert@biot.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>, Michal Simek <michal.simek@xilinx.com>, Gabor Juhos <juhosg@openwrt.org>, Thierry Reding <thierry.reding@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>, Marek Vasut <marex@denx.de>, Linus Walleij <linus.walleij@linaro.org>, linux-aspeed@lists.ozlabs.org, Anson Huang <Anson.Huang@nxp.com>, Samuel Holland <samuel@sholland.org>, Leilk Liu <leilk.liu@mediatek.com>, C
 hunyan Zhang <zhang.lyra@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, linux-sunxi@lists.linux.dev, Birger Koblitz <mail@birger-koblitz.de>, devicetree@vger.kernel.org, Kuldeep Singh <singh.kuldeep87k@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Parshuram Thombare <pthombar@cadence.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, Vaishnav Achath <vaishnav.a@ti.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-mediatek@lists.infradead.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, Paul Walmsley <pau
 l.walmsley@sifive.com>, linux-tegra@vger.kernel.org, Han Xu <han.xu@nxp.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Christophe Kerello <christophe.kerello@foss.st.com>, Li-hao Kuo <lhjeff911@gmail.com>, Bjorn Andersson <andersson@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Yogesh Gaur <yogeshgaur.83@gmail.com>, Chris Packham <chris.packham@alliedtelesis.co.nz>, Palmer Dabbelt <palmer@dabbelt.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, openbmc@lists.ozlabs.org, Pragnesh Patel <pragnesh.patel@sifive.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Wed, 18 Jan 2023 18:39:31 +0100, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/spi/allwinner,sun4i-a10-spi.yaml  |  2 +-
>  .../bindings/spi/allwinner,sun6i-a31-spi.yaml  |  2 +-
>  .../bindings/spi/amlogic,meson-gx-spicc.yaml   |  6 +++---
>  .../bindings/spi/amlogic,meson6-spifc.yaml     |  6 +++---
>  .../bindings/spi/aspeed,ast2600-fmc.yaml       |  2 +-
>  .../devicetree/bindings/spi/cdns,qspi-nor.yaml |  2 +-
>  .../devicetree/bindings/spi/cdns,xspi.yaml     |  6 +++---
>  .../bindings/spi/fsl,spi-fsl-qspi.yaml         |  2 +-
>  .../devicetree/bindings/spi/fsl-imx-cspi.yaml  |  2 +-
>  .../bindings/spi/mediatek,spi-mt65xx.yaml      |  2 +-
>  .../spi/mediatek,spi-slave-mt27xx.yaml         |  2 +-
>  .../bindings/spi/mikrotik,rb4xx-spi.yaml       |  2 +-
>  .../bindings/spi/mxicy,mx25f0a-spi.yaml        |  2 +-
>  .../devicetree/bindings/spi/mxs-spi.yaml       |  2 +-
>  .../bindings/spi/nvidia,tegra210-quad.yaml     |  2 +-
>  .../bindings/spi/qcom,spi-qcom-qspi.yaml       |  5 ++---
>  .../bindings/spi/realtek,rtl-spi.yaml          |  2 +-
>  .../bindings/spi/snps,dw-apb-ssi.yaml          |  2 +-
>  .../devicetree/bindings/spi/spi-cadence.yaml   |  2 +-
>  .../devicetree/bindings/spi/spi-fsl-lpspi.yaml |  2 +-
>  .../devicetree/bindings/spi/spi-gpio.yaml      |  4 ++--
>  .../devicetree/bindings/spi/spi-mux.yaml       |  4 ++--
>  .../devicetree/bindings/spi/spi-nxp-fspi.yaml  |  2 +-
>  .../devicetree/bindings/spi/spi-pl022.yaml     | 18 +++++++++---------
>  .../devicetree/bindings/spi/spi-rockchip.yaml  |  2 +-
>  .../devicetree/bindings/spi/spi-sifive.yaml    |  6 +++---
>  .../bindings/spi/spi-sunplus-sp7021.yaml       |  2 +-
>  .../devicetree/bindings/spi/spi-xilinx.yaml    |  2 +-
>  .../bindings/spi/spi-zynqmp-qspi.yaml          |  2 +-
>  .../devicetree/bindings/spi/sprd,spi-adi.yaml  |  5 ++---
>  .../devicetree/bindings/spi/st,stm32-qspi.yaml |  2 +-
>  .../devicetree/bindings/spi/st,stm32-spi.yaml  |  2 +-
>  .../bindings/spi/xlnx,zynq-qspi.yaml           |  2 +-
>  33 files changed, 53 insertions(+), 55 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
