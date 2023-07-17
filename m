Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C199755E4C
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jul 2023 10:17:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4FLc3k6mz2yW5
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jul 2023 18:17:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.214.180; helo=mail-pl1-f180.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4DYS26b6z2yFF
	for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jul 2023 17:41:46 +1000 (AEST)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b89d47ffb6so22195255ad.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jul 2023 00:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689579703; x=1692171703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUvC4vvxIfMz+5toOkjqLhwq7X8FXptFWezRZuPzIyE=;
        b=gsnTsf/+SF3SuzaSFn65uMOfqRg//SuQrmnveD18o6qaiwXblaQBneC/+dyXk2l+4I
         oji4uISndTHfdvns7pT05N06DGw9L38N8KBIXnS4k2Up7YufaObJ5bkze7g/IjRNPsGI
         pnzAyUFSZG3sAfp1lGIcRXyGJ7yeFPAR0PiUxptpJ+FQf0onpD8tiYf7+0GeNX6Un8HJ
         UkZSTLzuen/hGbLlnyqqVWf42zC2ObcqQIKNy+vXbTmqJn9BHg5t84dpb8Y8YrtU7cdI
         tiJq8pMMCkcmvy5XZcxSV/inYy9xG5VkxklmRC8OF1d4u51ygTSbOpyA4jI0FsD/ovmc
         MqKQ==
X-Gm-Message-State: ABy/qLbsGmWEScmLpcZl1S2T2js0uqOYqA+OZStrzuODRL4VyH9fIhOK
	9wVxbuwioYm6JaNtVehimr5/0x3AjmtsEg==
X-Google-Smtp-Source: APBJJlHt1ghfG7J4Ffn1stPmx0FBTUOI6OAKvpZDdlkHaH6Gm0183/qAW365XoKSfzKw92gtXYgJeg==
X-Received: by 2002:a17:902:ee91:b0:1b7:f98d:5570 with SMTP id a17-20020a170902ee9100b001b7f98d5570mr8759515pld.56.1689579702626;
        Mon, 17 Jul 2023 00:41:42 -0700 (PDT)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com. [209.85.216.49])
        by smtp.gmail.com with ESMTPSA id b14-20020a170902b60e00b001b042c0939fsm12006192pls.99.2023.07.17.00.41.42
        for <linux-aspeed@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 00:41:42 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-262cc036fa4so1935359a91.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jul 2023 00:41:42 -0700 (PDT)
X-Received: by 2002:a81:65d6:0:b0:571:11ea:b2dd with SMTP id
 z205-20020a8165d6000000b0057111eab2ddmr11237476ywb.32.1689579681652; Mon, 17
 Jul 2023 00:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174342.4052882-1-robh@kernel.org>
In-Reply-To: <20230714174342.4052882-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jul 2023 09:41:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUWy3Knk6Jqao12KULam_3XpYc=cGqRXe4reH7FPVZsg@mail.gmail.com>
Message-ID: <CAMuHMdUUWy3Knk6Jqao12KULam_3XpYc=cGqRXe4reH7FPVZsg@mail.gmail.com>
Subject: Re: [PATCH] clk: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 17 Jul 2023 18:11:36 +1000
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
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>, Peng Fan <peng.fan@nxp.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Paul Walmsley <paul.walmsley@sifive.com>, Tomasz Figa <tomasz.figa@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-riscv@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Florian Fainelli <florian.fainelli@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, Kevin Hilman <khilman@baylibre.com
 >, Gregory Clement <gregory.clement@bootlin.com>, linux-tegra@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Hal Feng <hal.feng@starfivetech.com>, Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Jerome Brunet <jbrunet@baylibre.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-sunxi@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, Manivannan Sadhasivam <mani@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, soc@kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-k
 ernel@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Santosh Shilimkar <ssantosh@kernel.org>, Alex Helms <alexander.helms.jy@renesas.com>, linux-amlogic@lists.infradead.org, Michal Simek <michal.simek@amd.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Cristian Marussi <cristian.marussi@arm.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, linux-oxnas@groups.io, Tero Kristo <kristo@kernel.org>, Scott Branden <sbranden@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Bjorn Andersson <andersson@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sudeep Holla <sudeep.h
 olla@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Jul 14, 2023 at 7:44=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  drivers/clk/renesas/rcar-usb2-clock-sel.c        | 1 -
>  drivers/clk/renesas/renesas-cpg-mssr.c           | 1 -
>  drivers/clk/renesas/rzg2l-cpg.c                  | 3 +--

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
