Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D31656804EE
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Jan 2023 05:20:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P4w304ckwz3cMt
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Jan 2023 15:20:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rz5WOHaN;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rz5WOHaN;
	dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1KbR4g8Hz3045
	for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Jan 2023 19:17:55 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id e19-20020a05600c439300b003db1cac0c1fso10743261wmn.5
        for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Jan 2023 00:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OiP0gZn/cpqwNmZsHPi77/HmJt+0GSm02rEXJE0mZuc=;
        b=rz5WOHaNNlWgEXLRbetKeX7R0dRN7zSC9YmNQarI9o4w7Tq5jxfXRqxTsxgHzpx4I9
         0yCwad4pvGwH35vsywIACFAKq4+tmuXHMABvAo0ziD9anYJtCqDdCdcshYllGX+jL33S
         V2jUHNwZjihkw5PkuVs6JSLbPqas8jVCHD1eRQgn0qmI9O5z3akmD8e0KxYGOkHPcExc
         Fs2kH8M96BLXC3Qw6sek5qgvA/pZtumGefcPFbod9+08KQP1qc8bRANz9r4AuZ40tlvZ
         UWZ75isPIPXvR1YDxyxT4wsID9oqc6K65nm1U6AzoDk60eiCoeQHwjb7C+rjvLNcASJE
         as0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OiP0gZn/cpqwNmZsHPi77/HmJt+0GSm02rEXJE0mZuc=;
        b=asJ8aifc9eQjjCJbNnjMLJ/8zHNxmPAyLRcKFPzed8o6AjYj/dFz/aS2UAdMCnoM4O
         pobd9WalkYvrPbIX89urqaKz6Wh4IVQyhTdt24LWM59eQgGnj1dS1fEe2k6L4nfjxQ1h
         Lcq4qxPkZCuKYi+TpsDeNpD9AZj8aaMzTFhXDjciJFRKzbzDJ8DNncg/+dkHp+4OSOx0
         T9ok6VoLghYDnM1dD+XP5T6NEmGSN1Mhe4GaYi6Lak2P/FUhR5DPlpHkOtX6bDWNrKLJ
         l0Ll1BLCVpn/3uvio5njp5/W++YLwpAh832j4tnyt2NNsWPFlCOVXrZTP0ghGCmGAgQF
         /fbQ==
X-Gm-Message-State: AFqh2krapY8qx0mhD44WEdTXC+Xdh9W1saNNXfZcSAbhlDp5k3qGHy8p
	+i+4NfQ3Poo3EVnqfyv+ySweTQ==
X-Google-Smtp-Source: AMrXdXunRvOxaqJzjCgh5gUlJhksZxNRxnNWUPvYFTObnizcuMzYRwgIcDkar5wVJKqfvWoZ4n/TQw==
X-Received: by 2002:a1c:6a10:0:b0:3da:f665:5b66 with SMTP id f16-20020a1c6a10000000b003daf6655b66mr27262779wmc.6.1674548268129;
        Tue, 24 Jan 2023 00:17:48 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g16-20020adffc90000000b002882600e8a0sm1298395wrr.12.2023.01.24.00.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 00:17:47 -0800 (PST)
Message-ID: <934be0a4-3639-5f72-cf54-b796b32df484@linaro.org>
Date: Tue, 24 Jan 2023 09:17:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/2] spi: dt-bindings: cleanup examples - indentation,
 lowercase hex
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
 <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
 <20230123201751.GA2450665-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230123201751.GA2450665-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 30 Jan 2023 15:19:26 +1100
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
 s.infradead.org, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>, linux-amlogic@lists.infradead.org, Patrice Chotard <patrice.chotard@foss.st.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, Kuldeep Singh <singh.kuldeep87k@gmail.com>, linux-tegra@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Parshuram Thombare <pthombar@cadence.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, openbmc@lists.ozlabs.org, Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, Vaishnav Achath <vaishnav.a@ti.com>, Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, =?UTF-8?Q?C=c3=a9dric_Le_Goat?= =?UTF-8?Q?er?= <clg@kaod.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, Paul Walmsley <paul.walmsley@sifive.com>, Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <ha
 n.xu@nxp.com>, linux-arm-kernel@lists.infradead.org, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Neil Armstrong <neil.armstrong@linaro.org>, Christophe Kerello <christophe.kerello@foss.st.com>, Li-hao Kuo <lhjeff911@gmail.com>, Birger Koblitz <mail@birger-koblitz.de>, Bjorn Andersson <andersson@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, linux-spi@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Yogesh Gaur <yogeshgaur.83@gmail.com>, Chris Packham <chris.packham@alliedtelesis.co.nz>, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>, linux-sunxi@lists.linux.dev, Pragnesh Patel <pragnesh.patel@sifive.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 23/01/2023 21:17, Rob Herring wrote:
> On Wed, Jan 18, 2023 at 06:39:32PM +0100, Krzysztof Kozlowski wrote:
>> Cleanup examples:
>>  - use 4-space indentation (for cases when it is neither 4 not 2 space),
>>  - drop redundant blank lines,
>>  - use lowercase hex.
>>
>> No functional impact except adjusting to preferred coding style.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/spi/amlogic,meson-gx-spicc.yaml  |  26 +--
>>  .../bindings/spi/amlogic,meson6-spifc.yaml    |  22 +--
>>  .../bindings/spi/aspeed,ast2600-fmc.yaml      |  24 +--
>>  .../bindings/spi/brcm,spi-bcm-qspi.yaml       | 156 +++++++++---------
>>  .../bindings/spi/cdns,qspi-nor.yaml           |   4 +-
>>  .../bindings/spi/nvidia,tegra210-quad.yaml    |  42 ++---
>>  .../bindings/spi/qcom,spi-qcom-qspi.yaml      |   1 -
>>  .../devicetree/bindings/spi/renesas,rspi.yaml |  22 +--
>>  .../bindings/spi/spi-sunplus-sp7021.yaml      |   4 +-
>>  .../devicetree/bindings/spi/st,stm32-spi.yaml |   1 -
>>  10 files changed, 150 insertions(+), 152 deletions(-)
> 
> [...]
> 
>> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
>> index d35c6f7e2dd5..18afdaab946d 100644
>> --- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
>> @@ -95,7 +95,6 @@ examples:
>>               <&dmamux1 1 40 0x400 0x05>;
>>        dma-names = "rx", "tx";
>>        cs-gpios = <&gpioa 11 0>;
> 
> Looks like the indentation needs adjusting here.
> 

Ack

Best regards,
Krzysztof

