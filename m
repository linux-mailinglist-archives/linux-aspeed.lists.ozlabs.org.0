Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E49EF957959
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:57:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqJH2fQHz7BQP
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.222.180; helo=mail-qk1-f180.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqgkH1xVtz3cJl;
	Thu, 30 May 2024 19:21:57 +1000 (AEST)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-792b8d989e8so42244985a.0;
        Thu, 30 May 2024 02:21:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717060911; x=1717665711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWN78EB24MX6Q0HZqErBr8t9tcr4nbKt3etlWVHkE68=;
        b=BKzNixA/kITzLXAgkFmUEen0swboIN7Zf7y+Ee+g8a7aMb/EyqlHMndHiyOv+vf2we
         NbBRLknv10oOQVuszZSL7oHBNs25/TZIWWSL/O6/YNMDAdqe3NIUrMyhKGauzjcbtG5F
         wFTVFooltYj8H103z5dM0Guc4EBjQfKLq4foYIXDrbBEMH/YMDJsQJJPrR0x62+k9ro9
         EQWo0e3kZ2Od7NzRfFS/ymHTRwyfL/kzo6gMrnWyKUzNtyU2VFdxw33DCUQsAoqErWgY
         j7dVUL26Al9EHqyLkF2Smisgpcft8pJ/G9lZ+gF+zDIsKza2hR8F0jjdVFCH45g/fX4j
         9OtA==
X-Forwarded-Encrypted: i=1; AJvYcCUOVhr9Bb+X7ZOfImutd88/m5JjkPyCflVbRm0v1Wfyx4E4MRiXJ2869XZFX6gosC1d/wsTeQGv97vakkMtbC7PTjfPN7Fim6CoDIuY3v6B5X8oWNm5XDahNrcdWC4/7IJ/X+9zyRgH
X-Gm-Message-State: AOJu0YxKkovVZvLV0hHc2xYXQ8Ut8PQsllpxj5pgCDLbaysY7PIWL571
	pL8AL+FIhHp1tlFxcJnZLOL6EfpwuKGnL83GdZhYS2UB5GIkwBBySL469FWZ
X-Google-Smtp-Source: AGHT+IGQZ0Qp+1Rh6hdRNoHvT2PBqAbMxgqmgScww+bcwAu29dli5d2DQGus6tMQhzWsEpukBn7pJw==
X-Received: by 2002:a05:620a:1911:b0:792:cf01:9eb9 with SMTP id af79cd13be357-794eaf046e9mr248994685a.22.1717060911039;
        Thu, 30 May 2024 02:21:51 -0700 (PDT)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794abd46ab7sm537753185a.136.2024.05.30.02.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 02:21:50 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-792bdf626beso58529585a.1;
        Thu, 30 May 2024 02:21:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCY7dak+/fI73jUvIQ71wqZSo11mspktSs1VfIFz0yXtvKqyD0bAVvv1ku02F2M0TSiORB92scGZlHhzRQd0pfAxGj9USZ2snUbKydmgjSyaKe7FxqSmGobKAaOH0uprfXYeZITzc4
X-Received: by 2002:a25:8c84:0:b0:dd1:6cad:8fd3 with SMTP id
 3f1490d57ef6-dfa5dcdc800mr946343276.27.1717060889311; Thu, 30 May 2024
 02:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com> <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
 <ZlhAm-giX6jNaUKr@surfacebook.localdomain>
In-Reply-To: <ZlhAm-giX6jNaUKr@surfacebook.localdomain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 11:21:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXqXVT3Y7N8pTb_68E23RkLGi=ySOSDkAWX4MOpP09Q4g@mail.gmail.com>
Message-ID: <CAMuHMdXqXVT3Y7N8pTb_68E23RkLGi=ySOSDkAWX4MOpP09Q4g@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put() cleanups
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>, Peng Fan <peng.fan@nxp.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Hal Feng <hal.feng@starfivetech.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Dan Carpenter <dan.carpenter@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Chunyan Zhang <zhang.lyra@gmail.com>, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Ludovic Desroches <ludovic.desroches@microchip.com>, Jacky Bai <ping.bai@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Patrice Chotard <patrice.chotard@foss.st.com>, Chester Lin <chester62515@gmail.com>, "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>, Stephen Warren <swarren@wwwdotorg.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, soc@kernel.org, Damien Le Moal <dlemoal@kernel.org>, linux-mediatek@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Matthias Brugger <matthias.bgg@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <mbrugger@suse.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, Sean Wang <sean.wang@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Jianlong Huang <jianlong.huang@starfivetech.com>, linux-riscv@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Andy,

On Thu, May 30, 2024 at 11:03=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> Mon, May 13, 2024 at 01:59:03PM +0200, Geert Uytterhoeven kirjoitti:
> > On Sat, May 4, 2024 at 3:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:
> > You missed one trivial conversion, presumably because no error handling
> > and thus no of_node_put() is involved?
>
> Nothing is missed. The below is a redundant change.
>
> ...
>
> > -       for_each_child_of_node(np, child) {
> > +       for_each_child_of_node_scoped(np, child) {
> >                 if (of_property_count_u32_elems(child, RZN1_PINS_PROP) =
> 0)
> >                         count++;
> >         }
> >
> > If you prefer not to include this
>
> I prefer this not to be included as it will give a misleading signals to =
the
> use of the original API(s).

Thank you for reminding me to send this out as a separate patch :-)

https://lore.kernel.org/r/c0a28f466c42d5d59c7fadfa1fd05fd512d43b6f.17170607=
08.git.geert+renesas@glider.be

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
