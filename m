Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA73E6C5C4C
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Mar 2023 02:49:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhpDs5myQz3chp
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Mar 2023 12:49:49 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.172; helo=mail-oi1-f172.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pdv8m61cyz3c41;
	Sat, 18 Mar 2023 19:21:10 +1100 (AEDT)
Received: by mail-oi1-f172.google.com with SMTP id c11so5476329oiw.2;
        Sat, 18 Mar 2023 01:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679127667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ok0/fcUUjYf3VJvre1cNZ96FcwH4JhSJwBxsOnlRNhc=;
        b=cfs5ATKIT2y2g2eCHvDy9PRV3d0areLdlXhRkhuyHCOkjWEVbjbhgvmWD/JcCizRwW
         ciKXRHjTWakpa165uf6vmZHTv15w/F2xM5jidbWAZMUc1GBC1FjPcpAIiRkTjLaWb7L/
         /Ustyfma1fUBlh0AMA9y8M3In0/W7cRHGD4hnuVIDSKJ6lhWh0b6PNSfKYJZb874MhgZ
         yjG/R988m/HNHeCRz0MhhW3gh8Mnjqmb2Ua4qioBTdsytL+lQOPx4A7S0hvP5sU2B17E
         b73LB6suRlEiqRlPH9ZVDHMV+e+0e40lkVRVbIOlipXfv1OXZtpYUG4X9cbTlBHJpzX6
         RysA==
X-Gm-Message-State: AO0yUKWzVpNlAB/2Wu7Xaw+8bV0WLSmJu42H9hdgwMccgtgzekCSpY8z
	T9Nng/lMijADyXzc6kisf1Em3R/cJ2P1Ug==
X-Google-Smtp-Source: AK7set+vdPj148A4NYzFh0rl7rNbBggx6RCHZ7Y6qnpiINxDNXUD4AMuThTgF8oquS2utS+hh0SFNg==
X-Received: by 2002:a05:6808:141:b0:386:e3f8:2c6b with SMTP id h1-20020a056808014100b00386e3f82c6bmr742677oie.11.1679127667704;
        Sat, 18 Mar 2023 01:21:07 -0700 (PDT)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com. [209.85.160.42])
        by smtp.gmail.com with ESMTPSA id r184-20020a4a4ec1000000b005251e3f92ecsm1639481ooa.47.2023.03.18.01.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Mar 2023 01:21:07 -0700 (PDT)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-17997ccf711so8175859fac.0;
        Sat, 18 Mar 2023 01:21:06 -0700 (PDT)
X-Received: by 2002:a5b:c47:0:b0:b56:1f24:7e9f with SMTP id
 d7-20020a5b0c47000000b00b561f247e9fmr897441ybr.12.1679127645593; Sat, 18 Mar
 2023 01:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230317233623.3968172-1-robh@kernel.org>
In-Reply-To: <20230317233623.3968172-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 18 Mar 2023 09:20:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU8uu=2EZ1dmtY-eGj+ORGdepsKgpNcL7qKfW3FkVJw7g@mail.gmail.com>
Message-ID: <CAMuHMdU8uu=2EZ1dmtY-eGj+ORGdepsKgpNcL7qKfW3FkVJw7g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: alsa-devel@alsa-project.org, Sean Wang <sean.wang@kernel.org>, Jacky Bai <ping.bai@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, linux-aspeed@lists.ozlabs.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, asahi@lists.linux.dev, Sylwester Nawrocki <s.nawrocki@samsung.com>, Fabio Estevam <festevam@gmail.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Heiko Stuebner <heiko@sntech.de>, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Samuel Holland <samuel@sholland.org>, openbmc@lists.ozlabs.org, Manivannan Sadhasivam <mani@kernel.org>, Michal Simek <michal.simek@xilinx.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Alim 
 Akhtar <alim.akhtar@samsung.com>, linux-sunxi@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sven Peter <sven@svenpeter.dev>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Dong Aisheng <aisheng.dong@nxp.com>, Damien Le Moal <damien.lemoal@wdc.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Jianlong Huang <jianlong.huang@starfivetech.com>, linux-riscv@lists.i
 nfradead.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com, Wells Lu <wellslutw@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, Mar 18, 2023 at 12:37=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  .../devicetree/bindings/pinctrl/renesas,pfc.yaml       |  2 +-
>  .../bindings/pinctrl/renesas,rza1-ports.yaml           |  2 +-
>  .../bindings/pinctrl/renesas,rza2-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml        |  2 +-
>  .../bindings/pinctrl/renesas,rzn1-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/renesas,rzv2m-pinctrl.yaml        |  2 +-

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
