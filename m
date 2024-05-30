Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BE995795F
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:57:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqJK1xWjz7BXl
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.50; helo=mail-qv1-f50.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vql9n3YMSz3cTf;
	Thu, 30 May 2024 21:57:33 +1000 (AEST)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6ab9d9f0ee2so2876506d6.3;
        Thu, 30 May 2024 04:57:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717070248; x=1717675048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UjHdVTNPfpZSE5mw/0S4dwLQIRvAN8JureryKLiLrHw=;
        b=CgtNtnMSjS9zHLEbDWGUr1SFs7XILrSNo4WTVQXvicIGE+tyeunFPi/HLzEXB+buSW
         HJ/wUnSyjSdVSDjqmmlsM3DyfpUmuaXw+kjrtMSBlQUGFtRmmU1V0O6RGxNj+iO5PAqF
         Gg+FRGzaUT06VsYs4qCVnmniNxePfaTRIFGGVP3DxlDV9ETuR3xXtPYrnFxlOy+5vizV
         w6wE7QlZvEUw//Z7+PokdZoNtb9SXoUNrEZxwSxajAfFVBpoyUKs2uldMnqaAeZsT6lp
         /KpkT9gX/TwLpYbW5rW3xel92vvav9w6ZJWbaeV2MXQQb4iKQLx/bGAZNDPOMILoSSyb
         UylQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdBbpB6BSvEJbAwi9Dd0sMyAGQQA28QztLgt1vLcmgHjI0n8xq7KwVhe5sIBnl6/S9zI+nxeI9sku0C/trGjSVVDQ2vOWQb7m7I66T/JcoqV7DiPM84gnqN82DdsVzWfDcdxBDDiNH
X-Gm-Message-State: AOJu0YzEjGldCFDiIQjQXgLrhci6sG/nYnrOl7qiLNygC/tAJGsojXUZ
	lserxLOzmJC38ALO92XY4Bdjn/hD1STwGrceNlAX6LGZbY4/bDOgM41bOSBe
X-Google-Smtp-Source: AGHT+IEYkR0XWvtagL3iJmQESOokNYOi9ac2R8ZDB/ZrJhMS6XbgAVJQjQxIvEX9v2H2Bodzzri+YQ==
X-Received: by 2002:ad4:584f:0:b0:6ae:279e:29f5 with SMTP id 6a1803df08f44-6ae279e2be5mr4978026d6.59.1717070247803;
        Thu, 30 May 2024 04:57:27 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad8040edc2sm39413786d6.12.2024.05.30.04.57.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 04:57:27 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-43fdc0bea19so4219381cf.0;
        Thu, 30 May 2024 04:57:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpTYSDPy6cgCAI8omqRslSm13xFQfjeH5aFO4hhgf17tVy7SK11PpI/M+dvkSoINiL8Yr+Rh5K16/C/3D2y67nZGa/G3PNjkA1spFNzk65U6Z6oWPoWclYQ90F9fB6Ihp8o+Bu97aa
X-Received: by 2002:a25:6842:0:b0:dfa:48f3:2253 with SMTP id
 3f1490d57ef6-dfa5a619bd3mr2110161276.32.1717070226150; Thu, 30 May 2024
 04:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 13:56:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVprgpjDP6PDn7appofJv8Tv30nRA4+7n4sR8n6n4qy+g@mail.gmail.com>
Message-ID: <CAMuHMdVprgpjDP6PDn7appofJv8Tv30nRA4+7n4sR8n6n4qy+g@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] pinctrl: Use scope based of_node_put() cleanups
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>, Peng Fan <peng.fan@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Hal Feng <hal.feng@starfivetech.com>, Fabio Estevam <festevam@gmail.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Dan Carpenter <dan.carpenter@linaro.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Chunyan Zhang <zhang.lyra@gmail.com>, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Ludovic Desroches <ludovic.desroches@microchip.com>, Jacky Bai <ping.bai@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Patrice Chotard <patrice.chotard@foss.st.com>, Chester Lin <chester62515@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Stephen Warren <swarren@wwwdotorg.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, soc@kernel.org, Damien Le Moal <dlemoal@kernel.org>, linux-mediatek@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <mbrugger@suse.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, Sean Wang <sean.wang@kernel.org>, linux-stm32@st-md-mailman.stormreply.com, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Jianlong Huang <jianlong.huang@starfivetech.com>, linux-riscv@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Peng,

On Sat, May 4, 2024 at 3:12=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
> Use scope based of_node_put() to simplify code. It reduces the chance
> of forgetting of_node_put(), and also simplifies error handling path.
> I not able to test the changes on all the hardwares, so driver owners,
> please help review when you have time.
>
> This patchset was inspired from Dan's comments on pinctrl-scmi-imx.c,
> thanks.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Andy's question about code generation on a related patch made me
wonder, too.

On arm32, a conversion to for_each_child_of_node_scoped() seems to
cost ca. 48 bytes of additional code, regardless of whether there were
explicit cleanups before or not.

I checked "pinctrl: renesas: Use scope based of_node_put() cleanups",
and all but the conversions in *_dt_node_to_map() cost 48 bytes each.

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
