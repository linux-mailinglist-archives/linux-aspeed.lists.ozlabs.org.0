Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 703AE677464
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 04:30:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0bG81nVyz3c34
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 14:30:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LyOB+NUS;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=neil.armstrong@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LyOB+NUS;
	dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyDZQ3Npkz3c6f
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Jan 2023 18:21:18 +1100 (AEDT)
Received: by mail-wr1-x432.google.com with SMTP id i4so278387wrs.9
        for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Jan 2023 23:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sOs8bQD9F6vMUPoMMlH0+D1lAaueC4ZgIBokJQnOoEo=;
        b=LyOB+NUS2loSPGvywS6q2JTxx+QV/V7RAlJ1e2rlqx9t3Ekf+fP0SKHqB4UBF1Alcb
         +9jHjYipwJSvsZgt9CoSAzkUJuTTXWQ09jEntTema1BIcZethpG+tMxX7X9aAkolenah
         DLrdIJmcSmEIF6vdYgXBV2FeYGIx5vZ2gurB9SeTci839nqNyRWN2sEiDR5MEyF2ltFL
         zh8gOEY/JyjmU3jNfppcc+SoutySEK/QzJqLnd3pFDIzlZ9CAoRCIBGEq9ug3Ps7StLA
         k+ZiQy+qM+CwiihdmGqh5xgqnYtd9E4Ad3CfUn+P57GgQI/X4lL1DHGu6oYtOZ6TFy5e
         bCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOs8bQD9F6vMUPoMMlH0+D1lAaueC4ZgIBokJQnOoEo=;
        b=sXd8bLTofbb/XWUI7v9ZI8olBcCv3FO9oaROsNRamlWpidpJGDQIInDFzruw5qlplb
         nbfcykRhoPJmKdEtCY8+BJrh3LtWq/r9Ohv5Cz00M/spbB3501o1i1bcREBHle9To0Ik
         6KBxCB2jlMBzSeEAU+QFLxg0jNvf3rC2vTaNtTq9fnenWWehmE4NDqAaZJhPGg81n/3z
         CKL1EjUZfJ87+QdO042/wzlDRUZUe7QneoMT93P3LkyAM++exuMh3wTQIXdhtgILoZOs
         wIyy2RcahYI8y2cQat4vX/G+5u6WCEtOGmVdRidgdK9Gq2uR+sWXHoMY/gcY+cfX1JjJ
         19dQ==
X-Gm-Message-State: AFqh2kqsKYW/bO+8JMV9UEfhhbyLm59Vh7dkqwZ5y5c5pBFFxr4H2/DD
	5TzsJVYwlL1b0qWQQVOExezeZw==
X-Google-Smtp-Source: AMrXdXsVXFK6J3FI/oNC9B2qh8iRRbulOB/J3Gh4vyDVzfdXvWdeQZr51O5qsgmn1ZDrVvMY0QWzVA==
X-Received: by 2002:adf:f70d:0:b0:2bc:7d67:90e with SMTP id r13-20020adff70d000000b002bc7d67090emr7926446wrp.32.1674112875116;
        Wed, 18 Jan 2023 23:21:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3936:d49c:4a01:ee1e? ([2a01:e0a:982:cbb0:3936:d49c:4a01:ee1e])
        by smtp.gmail.com with ESMTPSA id f16-20020a5d50d0000000b002755e301eeasm15178119wrt.100.2023.01.18.23.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 23:21:14 -0800 (PST)
Message-ID: <a9059443-f125-f6dc-4686-8212165cd431@linaro.org>
Date: Thu, 19 Jan 2023 08:21:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] spi: dt-bindings: cleanup examples - indentation,
 lowercase hex
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goat?=
 =?UTF-8?Q?er?= <clg@kaod.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Han Xu <han.xu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
 Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Li-hao Kuo <lhjeff911@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?77+9ZWNraQ==?=
 <rafal@milecki.pl>, Vaishnav Achath <vaishnav.a@ti.com>,
 Parshuram Thombare <pthombar@cadence.com>, Leilk Liu
 <leilk.liu@mediatek.com>, Gabor Juhos <juhosg@openwrt.org>,
 Bert Vermeulen <bert@biot.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Marek Vasut <marex@denx.de>, Birger Koblitz <mail@birger-koblitz.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Anson Huang <Anson.Huang@nxp.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Kuldeep Singh <singh.kuldeep87k@gmail.com>,
 Pragnesh Patel <pragnesh.patel@sifive.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Erwan Leray <erwan.leray@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
 <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 23 Jan 2023 14:29:55 +1100
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
Reply-To: neil.armstrong@linaro.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 18/01/2023 18:39, Krzysztof Kozlowski wrote:
> Cleanup examples:
>   - use 4-space indentation (for cases when it is neither 4 not 2 space),
>   - drop redundant blank lines,
>   - use lowercase hex.
> 
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/spi/amlogic,meson-gx-spicc.yaml  |  26 +--
>   .../bindings/spi/amlogic,meson6-spifc.yaml    |  22 +--

For meson changes:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

>   .../bindings/spi/aspeed,ast2600-fmc.yaml      |  24 +--
>   .../bindings/spi/brcm,spi-bcm-qspi.yaml       | 156 +++++++++---------
>   .../bindings/spi/cdns,qspi-nor.yaml           |   4 +-
>   .../bindings/spi/nvidia,tegra210-quad.yaml    |  42 ++---
>   .../bindings/spi/qcom,spi-qcom-qspi.yaml      |   1 -
>   .../devicetree/bindings/spi/renesas,rspi.yaml |  22 +--
>   .../bindings/spi/spi-sunplus-sp7021.yaml      |   4 +-
>   .../devicetree/bindings/spi/st,stm32-spi.yaml |   1 -
>   10 files changed, 150 insertions(+), 152 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> index e5eca3a6f132..4e28e6e9d8e0 100644
> --- a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> +++ b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> @@ -100,17 +100,17 @@ unevaluatedProperties: false
>   examples:
>     - |
>       spi@c1108d80 {
> -          compatible = "amlogic,meson-gx-spicc";
> -          reg = <0xc1108d80 0x80>;
> -          interrupts = <112>;
> -          clocks = <&clk81>;
> -          clock-names = "core";
> -          #address-cells = <1>;
> -          #size-cells = <0>;
> -
> -          display@0 {
> -              compatible = "lg,lg4573";
> -              spi-max-frequency = <1000000>;
> -              reg = <0>;
> -          };
> +        compatible = "amlogic,meson-gx-spicc";
> +        reg = <0xc1108d80 0x80>;
> +        interrupts = <112>;
> +        clocks = <&clk81>;
> +        clock-names = "core";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        display@0 {
> +            compatible = "lg,lg4573";
> +            spi-max-frequency = <1000000>;
> +            reg = <0>;
> +        };
>       };
> diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
> index 806043fed4d1..8e769ccda97f 100644
> --- a/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
> +++ b/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
> @@ -40,15 +40,15 @@ unevaluatedProperties: false
>   examples:
>     - |
>       spi@c1108c80 {
> -          compatible = "amlogic,meson6-spifc";
> -          reg = <0xc1108c80 0x80>;
> -          clocks = <&clk81>;
> -          #address-cells = <1>;
> -          #size-cells = <0>;
> -
> -          flash: flash@0 {
> -              compatible = "spansion,m25p80", "jedec,spi-nor";
> -              reg = <0>;
> -              spi-max-frequency = <40000000>;
> -          };
> +        compatible = "amlogic,meson6-spifc";
> +        reg = <0xc1108c80 0x80>;
> +        clocks = <&clk81>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        flash: flash@0 {
> +            compatible = "spansion,m25p80", "jedec,spi-nor";
> +            reg = <0>;
> +            spi-max-frequency = <40000000>;
> +        };
>       };

<snip>

