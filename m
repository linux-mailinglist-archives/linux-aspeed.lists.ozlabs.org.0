Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2045A957945
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:57:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqJ90Y4qz3vx3
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.177; helo=mail-yw1-f177.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vdmpc4QRwz2xTN;
	Tue, 14 May 2024 16:36:23 +1000 (AEST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-61be674f5d1so56891617b3.2;
        Mon, 13 May 2024 23:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715668578; x=1716273378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SyXm2XZJp7cQccvVHsZwFRorrc4lUY+2faX/WPeRScc=;
        b=ESCv4BL6btyZ3zYeNl00BMQR0mSKnkFu4PRnD5EqWM+Hm4fSqPlspuroem07CxYYRc
         T3c/zWxorlk29vmgBKkLBxstmcGm6NAGctHsdLck3t6h8ExIPH192jjqKwGTP6I0onAI
         64tCfpmrgXRWl1J5+BwTROINgKRPhLuWZrvARSho4tDOKgHP/qcRiMTcMQX4yDh2CJhl
         X6nPahuokbDHM8KGV/oiMdTgFWSdqhsxJVUKBRSMNszDdmxOWrSK7sT1RcizxCy+Oy/h
         RMCU5Qd2oyHBjKjeX+EurOHeVvC5PUM4LhT3FIfz8Vzgs6CJDFOrA5EtFv5avFU8xXNh
         pLkQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9BCaViNRF10yo58vwIy1OTPk3H0aM88kA1MadTVzt6HRKBBLa7L9W+omulmWQjxbrx9JWitauE0LWsbV+mcff7gBS1+AJ15isbKRm6ANu4lMZ3fOH2HRRcq3QfxZi+cGhZebcXM4e
X-Gm-Message-State: AOJu0Yz+oErd7y5ojU1Gyjln2Oc4nhLS2xPCjOCv8ug1VMIFFKdsFHIi
	BiVn1H2BKEl0qIn4Q33cgdgtMdOz1/X19sYzkLxWhr6BHGojcyJG+IRBbM+3
X-Google-Smtp-Source: AGHT+IEpOr0U2ZpAQNGV7hOTSUj7a2qKE1rZ0dVNdTlu9CNc+C1zhl9/rhAzzEY/tNybqkjCHCTK0w==
X-Received: by 2002:a05:690c:610b:b0:622:cf30:821a with SMTP id 00721157ae682-622cf308d0amr100985407b3.52.1715668577938;
        Mon, 13 May 2024 23:36:17 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e257fd7sm24465217b3.48.2024.05.13.23.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 23:36:17 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-de60a51fe21so5198100276.0;
        Mon, 13 May 2024 23:36:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxP6iGzSLgzWJz/0flZyzmkI+4bqU1KbUgqsU2Sb3jVo7PjK4yL0PM2N2vXl4WNfBuRpiH6Q0wMTWPid7BmBCeCfBCxo1qBRXucbuUxRC/r1ftsWgLE4DFN3fq1kb3cd8R5chxy3fP
X-Received: by 2002:a5b:f48:0:b0:de5:567b:88f with SMTP id 3f1490d57ef6-dee4f31a205mr14563293276.10.1715668557234;
 Mon, 13 May 2024 23:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com> <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
 <CACRpkdaUecnwvHFdtGkuM80SObvXpXZkWGYoUMgnNHcvObYF0g@mail.gmail.com>
In-Reply-To: <CACRpkdaUecnwvHFdtGkuM80SObvXpXZkWGYoUMgnNHcvObYF0g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 May 2024 08:35:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCD+k8=iX8+tcK76DU_m9quR8BV+K68K73SygJzCz5VA@mail.gmail.com>
Message-ID: <CAMuHMdWCD+k8=iX8+tcK76DU_m9quR8BV+K68K73SygJzCz5VA@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put() cleanups
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>, Peng Fan <peng.fan@nxp.com>, Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Hal Feng <hal.feng@starfivetech.com>, Fabio Estevam <festevam@gmail.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Dan Carpenter <dan.carpenter@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Chunyan Zhang <zhang.lyra@gmail.com>, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Ludovic Desroches <ludovic.desroches@microchip.com>, Jacky Bai <ping.bai@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Patrice Chotard <patrice.chotard@foss.st.com>, Chester Lin <chester62515@gmail.com>, "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>, Stephen Warren <swarren@wwwdotorg.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, soc@kernel.org, Damien Le Moal <dlemoal@kernel.org>, linux-mediatek@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Matthias Brugger <matthias.bgg@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <mbrugger@suse.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, Sean Wang <sean.wang@kernel.org>, linux-stm32@st-md-mailman.stormreply.com, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Jianlong Huang <jianlong.huang@starfivetech.com>, linux-riscv@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Linus,

On Mon, May 13, 2024 at 10:51=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> On Mon, May 13, 2024 at 1:59=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Sat, May 4, 2024 at 3:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > Use scope based of_node_put() cleanup to simplify code.
> > >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >
> > Thanks for your patch!
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Does this go into the Renesas patch stack?
>
> I think the patch stands fine without the rest of the series.

Sure, I can do that.
From your positive response to v1, I thought that perhaps you just
wanted to take the full series yourself?

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
