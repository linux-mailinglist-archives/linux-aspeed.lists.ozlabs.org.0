Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFE6957961
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:57:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqJK6qRXz3bfj
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.175; helo=mail-pf1-f175.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrDhG2jhVz30Tp;
	Fri, 31 May 2024 17:07:09 +1000 (AEST)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6f693fb0ad4so1511019b3a.1;
        Fri, 31 May 2024 00:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717139224; x=1717744024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ayp9OTJcx8xBTEOWGr76ffez+fesdX+4XqGBVIDxEaQ=;
        b=PRMruP+9VDGeslMNjSQEtqgmziweHpK/0dFwpvL1tT9G4az1JrCe7k3lP3ro7hGeac
         xKD8hs7wURH+4+k/R5Qc1Wv+d6OARlaltATM/rRnzLWKqv9kWNZqaZaNaiupTDlLjXXU
         S61l6gnk1m9xGyq9kPZRSVpi0Ss/RmDh3ZoMHwMgAdrd5qrxDVQYanFpYDMXpoF3/dWh
         CLIpGlwlhk9q/+eOrcE/NtVGtxnmUYN43Aw0sNEQ2jcB6x2bVLopG0EJ69NqBbAI/ESi
         H4r6FNT4c9w0s/OMhizeeZYmXic7uaMJM/Y9jiYpuv/rYUSNGIbFX/F8DbSu7xMwd7mQ
         DQTA==
X-Forwarded-Encrypted: i=1; AJvYcCXpGliRecPufBUxw/ewUgGR9zFowlsSSz3lZ+CdYYX5soa7bhQFgsWV3kk5aVSOqxfxIYpp0BMxyYiHcXojUyVsXXrL8TEGvI5FtAfKfxZ8aPDO6FgmOl4PUqVFL7GBwfCp/ww/yo1q
X-Gm-Message-State: AOJu0YztrHe3j3w20aG58pjPD73JBrujS+g7TYdg/kDwwKTNe+wt4zOi
	qdzk/1gUzjXXnq9eAfxBlS37mnrb+YUR7nCnGu1a/yJwbw1p11IFvzT142IW
X-Google-Smtp-Source: AGHT+IEz0P/L6La8j5qGAIV5BAQNd6LPUpQvC4JVv6mTZ1rNlDPlo8okClld9ijFBupqxNgJgAUt2Q==
X-Received: by 2002:a05:6a00:2da4:b0:6ec:da6c:fc2d with SMTP id d2e1a72fcca58-7024789b2d0mr1156208b3a.23.1717139224336;
        Fri, 31 May 2024 00:07:04 -0700 (PDT)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com. [209.85.210.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702425da465sm790539b3a.73.2024.05.31.00.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 00:07:04 -0700 (PDT)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6f693fb0ad4so1511003b3a.1;
        Fri, 31 May 2024 00:07:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9XH+Ln7vpTwTvkmgJRQ7LvVf7fTS8Yfhsl83Xi2WvmJF6MOx8jVfj31pJYBZaPzPiR3tBChyliEuTX7+sYKrL59Gj+ZJ6iVcpXtw9vYZ1ejN4yZ7QqYwTMJBS+a1Q+he6sJ9DmdXR
X-Received: by 2002:a25:5f46:0:b0:df4:f149:1fc7 with SMTP id
 3f1490d57ef6-dfa73dc4a2dmr974775276.58.1717139203004; Fri, 31 May 2024
 00:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <CAMuHMdVprgpjDP6PDn7appofJv8Tv30nRA4+7n4sR8n6n4qy+g@mail.gmail.com> <DU0PR04MB9417FF2632A278BF6605AE1F88FC2@DU0PR04MB9417.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB9417FF2632A278BF6605AE1F88FC2@DU0PR04MB9417.eurprd04.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 May 2024 09:06:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW01HtY7d+L=44czH_dqV6bresLeF=SRqyn9p=jk3MTAw@mail.gmail.com>
Message-ID: <CAMuHMdW01HtY7d+L=44czH_dqV6bresLeF=SRqyn9p=jk3MTAw@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] pinctrl: Use scope based of_node_put() cleanups
To: Peng Fan <peng.fan@nxp.com>
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
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, "Ghennadi Procopciuc \(OSS\)" <ghennadi.procopciuc@oss.nxp.com>, Hal Feng <hal.feng@starfivetech.com>, Fabio Estevam <festevam@gmail.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, Dan Carpenter <dan.carpenter@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Chunyan Zhang <zhang.lyra@gmail.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, Jacky Bai <ping.bai@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Patrice Chotard <patrice.chotard@foss.st.com>, Chester Lin <chester62515@gmail.com>, "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>, Stephen Warren <swarren@wwwdotorg.org>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "soc@kernel.org" <soc@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, Matthias Brugger <matthias.bgg@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Aisheng Dong <aisheng.dong@nxp.com>, Matthias Brugger <mbrugger@suse.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, Sean Wang <sean.wang@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Jianlong Huang <jianlong.huang@starfivetech.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Peng,

On Fri, May 31, 2024 at 5:07=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
> > Subject: Re: [PATCH v2 00/20] pinctrl: Use scope based of_node_put()
> > cleanups
> > On Sat, May 4, 2024 at 3:12=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com>
> > wrote:
> > > Use scope based of_node_put() to simplify code. It reduces the chance
> > > of forgetting of_node_put(), and also simplifies error handling path.
> > > I not able to test the changes on all the hardwares, so driver owners=
,
> > > please help review when you have time.
> > >
> > > This patchset was inspired from Dan's comments on pinctrl-scmi-imx.c,
> > > thanks.
> > >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >
> > Andy's question about code generation on a related patch made me wonder=
,
> > too.
> >
> > On arm32, a conversion to for_each_child_of_node_scoped() seems to cost=
 ca.
> > 48 bytes of additional code, regardless of whether there were explicit
> > cleanups before or not.
> >
> > I checked "pinctrl: renesas: Use scope based of_node_put() cleanups", a=
nd all
> > but the conversions in *_dt_node_to_map() cost 48 bytes each.
>
> I am not sure this is an issue or else. What would you suggest me to do?
> If you think extra 48bytes consumption is not good here, feel free to dro=
p the
> patch.

I suggest doing nothing about this.  I just wanted people to be aware
of the impact.  I guess it's just part of the slow but steady increase
of kernel size (ca. 20-30 KiB/release)... ;-)

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
