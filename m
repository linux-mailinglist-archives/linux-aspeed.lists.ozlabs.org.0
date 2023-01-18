Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4087677460
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 04:30:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0bFp56FYz3cFm
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 14:30:06 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.170; helo=mail-yb1-f170.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxwF12ntJz3fCb;
	Thu, 19 Jan 2023 06:05:08 +1100 (AEDT)
Received: by mail-yb1-f170.google.com with SMTP id l139so39327306ybl.12;
        Wed, 18 Jan 2023 11:05:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TOwQfemle8oAtk5HhkSGbIU5cG/VOJmaf2KabL9UxvM=;
        b=1YHUFjxCYpdjVkrdY0yp34zKc5roypjC1zuQMQRfyRzgJWZZZSkn4NexlaDf0Crhf2
         pL7/0tBpvd6bGh26SXZ4qk8zBegNMmRBeNf/AHQ4ys2YFPGTyGFjIOx2bYBeQ8X279OI
         qg1ELb8r6aD8zzqcqLnF6RtEFKXyY7wLfr1r4vKfaeFX0lv976kTH85nTKZrKllB28/j
         IROdvhXENvaS1kHWDAy+2YqlkIs7fMyvz/Edc4NiIst4a0t24eccpUXtWCZrC1e5DjWn
         fxAAB6eVIqS9NXNJ+FFcCfK+gghum9H3wNk+GaejSBRi+yG8yS2kG5QeMZrQLL52s+eF
         cCHw==
X-Gm-Message-State: AFqh2kqLd9mkUssqYuCtOnw+ItNyH9OsN1Hdsw/6a1dfrgzqSI/cnbAA
	XGM1hrVlXk1aNMB5bVrki7c134bnwBJB8LolgpY=
X-Google-Smtp-Source: AMrXdXusXm3rzBBkCEM6cQaZbI2iL/fPi4HLsvh6WPXCIv3tYq3Wap+cuvj2Ee+WstPW+2oGSKxbwg==
X-Received: by 2002:a25:118a:0:b0:7cd:331d:69f with SMTP id 132-20020a25118a000000b007cd331d069fmr2625496ybr.44.1674068705877;
        Wed, 18 Jan 2023 11:05:05 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id p18-20020a056102125200b003d0ee923cd6sm2139472vsg.23.2023.01.18.11.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 11:05:05 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id g25so4338143uaw.8;
        Wed, 18 Jan 2023 11:05:05 -0800 (PST)
X-Received: by 2002:a25:d88c:0:b0:77a:b5f3:d0ac with SMTP id
 p134-20020a25d88c000000b0077ab5f3d0acmr846222ybg.202.1674068694405; Wed, 18
 Jan 2023 11:04:54 -0800 (PST)
MIME-Version: 1.0
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org> <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Jan 2023 20:04:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZOsrBwJrST=49v6JFqCyq_gT0kfA-QS7TS4oigZtM-w@mail.gmail.com>
Message-ID: <CAMuHMdWZOsrBwJrST=49v6JFqCyq_gT0kfA-QS7TS4oigZtM-w@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: dt-bindings: cleanup examples - indentation,
 lowercase hex
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Bert Vermeulen <bert@biot.com>, Erwan Leray <erwan.leray@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Gabor Juhos <juhosg@openwrt.org>, Thierry Reding <thierry.reding@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, =?UTF-8?B?4oCaZWNraQ==?= <rafal@milecki.pl>, linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>, Marek Vasut <marex@denx.de>, linux-aspeed@lists.ozlabs.org, Anson Huang <Anson.Huang@nxp.com>, Samuel Holland <samuel@sholland.org>, Leilk Liu <leilk.liu@mediatek.com>, Kevin Hilman <khilman@baylibre.com>, Michal Simek <michal.simek@xilinx.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@list
 s.infradead.org, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>, linux-amlogic@lists.infradead.org, Patrice Chotard <patrice.chotard@foss.st.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, Kuldeep Singh <singh.kuldeep87k@gmail.com>, linux-tegra@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Parshuram Thombare <pthombar@cadence.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, openbmc@lists.ozlabs.org, Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, Vaishnav Achath <vaishnav.a@ti.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, Paul Walmsley <paul.walmsley@sifive.com>, Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com
 >, linux-arm-kernel@lists.infradead.org, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Neil Armstrong <neil.armstrong@linaro.org>, Christophe Kerello <christophe.kerello@foss.st.com>, Li-hao Kuo <lhjeff911@gmail.com>, Birger Koblitz <mail@birger-koblitz.de>, Bjorn Andersson <andersson@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>, Chris Packham <chris.packham@alliedtelesis.co.nz>, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, linux-spi@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Yogesh Gaur <yogeshgaur.83@gmail.com>, Mark Brown <broonie@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>, linux-sunxi@lists.linux.dev, Pragnesh Patel <pragnesh.patel@sifive.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jan 18, 2023 at 6:39 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Cleanup examples:
>  - use 4-space indentation (for cases when it is neither 4 not 2 space),
>  - drop redundant blank lines,
>  - use lowercase hex.
>
> No functional impact except adjusting to preferred coding style.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

>  .../devicetree/bindings/spi/renesas,rspi.yaml |  22 +--

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
