Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FF167746D
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 04:31:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0bGr4qD8z3bZh
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 14:31:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a/g9O4xy;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=fancer.lancer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a/g9O4xy;
	dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NySdP5DBsz3bTq;
	Fri, 20 Jan 2023 03:24:40 +1100 (AEDT)
Received: by mail-lf1-x134.google.com with SMTP id y25so3965739lfa.9;
        Thu, 19 Jan 2023 08:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8lVOvMoIQ2x2Wf6zy8frHnpB0eXV9ve1xBd2DqHKd8Y=;
        b=a/g9O4xy606aS7gTGUOYByXG9qF6KTMWOZA30DBpya3y/ma8wWSWbZ0GhEnw/5Dd56
         SwWKUvve09j1o3F73iD1XSqxXcz9bXivs5oPpAd58vaExY7Ut/gg8J5SySYtOKeJp85Y
         xmSrmvNHPLNYd+qGYEno2szmpyk9kL3REN4AGFML0pKUuvB9xnBoYaDYyqhUn2RKO/PI
         lFHQZLGbsqrirm06txrQIW/ebbIiz59ba6eAsRY5KjrWXIZ73jywqljunaP/ghJHB5A9
         uKyEtu3Zvgig66EC5x+MjGQiTGePO5AKzyatccaZUr2ktzAcgc0H0B/UBMut22jZ1DsG
         EBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lVOvMoIQ2x2Wf6zy8frHnpB0eXV9ve1xBd2DqHKd8Y=;
        b=k4MLvWYao82hrzg7rFoAF8cv9xHeUdrywAavlYSaejs7jGpMceC2bsA7aFf6bif3Kq
         Z70vSuzzILL+ItyfYNuMeHgIs+pE5YVRdL2H33pCBR/N6V0V1fptanHkvLd7c0umpv7P
         /2uzwr9PHmrcbUHGb+PA+QKr4Ui+1p35qUvKigTIK0WdQDu+OqXZH/9n2goKcWY0NZJy
         wCXWcStjfVjEVFJDJ+4hAETWww3D4pcYV834aXbPzf+TskXSG+pGQLB8K4ykgzLdbC0/
         aHNWmccUXNolZwW8MNuJ6fzy/3wGUi4gLGyAXxcRuDyrYxLqwctLV3OAtOSXGqUiXy5u
         +QWg==
X-Gm-Message-State: AFqh2kouYB9lZzk5ZseWtXaThhHPpaP2/Ntx7Cng4/OSf18UdKbHQtLz
	DN57YPDjLy68QFtN5gSCVbU=
X-Google-Smtp-Source: AMrXdXv7/blNpjVnMJiMaPKfEdqpiTFTh3jtjnRI+SUuGsVsK9TsgKmt9RRC03LAK7v7xiQAHH0RHA==
X-Received: by 2002:a05:6512:25a5:b0:4b5:7338:e2c7 with SMTP id bf37-20020a05651225a500b004b57338e2c7mr3358360lfb.53.1674145476128;
        Thu, 19 Jan 2023 08:24:36 -0800 (PST)
Received: from mobilestation ([95.79.133.202])
        by smtp.gmail.com with ESMTPSA id s9-20020ac24649000000b004cb41b43c25sm5884147lfo.197.2023.01.19.08.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 08:24:35 -0800 (PST)
Date: Thu, 19 Jan 2023 19:24:31 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] spi: dt-bindings: drop unneeded quotes
Message-ID: <20230119162431.mepdze3xibqjgwsi@mobilestation>
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
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
Cc: Bert Vermeulen <bert@biot.com>, Erwan Leray <erwan.leray@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Gabor Juhos <juhosg@openwrt.org>, Thierry Reding <thierry.reding@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, =?utf-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>, Marek Vasut <marex@denx.de>, linux-aspeed@lists.ozlabs.org, Anson Huang <Anson.Huang@nxp.com>, Samuel Holland <samuel@sholland.org>, Leilk Liu <leilk.liu@mediatek.com>, Kevin Hilman <khilman@baylibre.com>, Michal Simek <michal.simek@xilinx.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@list
 s.infradead.org, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>, linux-amlogic@lists.infradead.org, Patrice Chotard <patrice.chotard@foss.st.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, Kuldeep Singh <singh.kuldeep87k@gmail.com>, linux-tegra@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Parshuram Thombare <pthombar@cadence.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, openbmc@lists.ozlabs.org, Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, Vaishnav Achath <vaishnav.a@ti.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, Paul Walmsley <paul.walmsley@sifive.com>, Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com
 >, linux-arm-kernel@lists.infradead.org, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Neil Armstrong <neil.armstrong@linaro.org>, Christophe Kerello <christophe.kerello@foss.st.com>, Li-hao Kuo <lhjeff911@gmail.com>, Birger Koblitz <mail@birger-koblitz.de>, Bjorn Andersson <andersson@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>, Chris Packham <chris.packham@alliedtelesis.co.nz>, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Yogesh Gaur <yogeshgaur.83@gmail.com>, Mark Brown <broonie@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>, linux-sunxi@lists.linux.dev, Pragnesh Patel <pragnesh.patel@sifive.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jan 18, 2023 at 06:39:31PM +0100, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

[nip]

>  .../bindings/spi/snps,dw-apb-ssi.yaml          |  2 +-

[nip]

> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> index d33b72fabc5d..a132b5fc56e0 100644
> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> @@ -10,7 +10,7 @@ maintainers:
>    - Mark Brown <broonie@kernel.org>
>  
>  allOf:
> -  - $ref: "spi-controller.yaml#"
> +  - $ref: spi-controller.yaml#
>    - if:
>        properties:
>          compatible:

For the Synopsys DW SSI bindings:
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Thanks
-Serge(y)

