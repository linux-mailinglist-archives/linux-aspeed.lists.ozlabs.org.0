Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60294957966
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:57:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqJM27fTz7Bcp
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tm5TiJzy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8HLV435bz30VT
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 20:02:24 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-52cdc4d221eso4932203e87.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 03:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719396141; x=1720000941; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIal9mSNuB7WVuajAQysXy9I34dokLqqKQSl/SD8Ip0=;
        b=tm5TiJzy7lxomJsfpvvMfD+EjJhnYILc74De35f1zI3WlLOUkVkG5BfZ5Hr5ZvNYfj
         w/CrhXHrC5p4hSfEOa9zuPha8uW6Ke6KNKf/Ybp4wncGFUAXEEkmYUToZx5QY2I+lue6
         1Aw9pHdR9l6ryJfKO0bpxrCkqrZj5tT9P2bchQ31YRxb3EU2Fi3x+Ph3TrovCX8NxWFp
         KrbbYVIf5WvGg4X0sPrkls6nwKLuCPYm4jRsJ8v0+Rh6t7b0fCdDD4T1Ik48YmSDThBW
         pjtyTF4q+ahtS14CzgXILSOocWB6Y/YXm6w86ugHOqFUDoaQdv0ahvW8dt/aXygjZ+e6
         8wqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396141; x=1720000941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIal9mSNuB7WVuajAQysXy9I34dokLqqKQSl/SD8Ip0=;
        b=skQ2rwWwLnjkyOkFJXeESXtO+DDMmUjxO68S9fKyCtMaPVFVPMWAMS179ZGKP7ZdYr
         so/FZ7S2LwOH+I3GiJK38Icb4DfY73rk+6xN6mUiTOheASmORrPZIqRa6nujH4B6Yptf
         TVANkg/EdvWRZCBoBsF4ADCXZRknvJK1jj51KwkEo43mOoyleBKLn/WhHGEFRydtNcB9
         zvKfQi+qWUtuYULZ61UpNbLevuoK2Et8Aj3b4eKwjQ+ZX3PG4j2F/IwJJ1cGCVszPXum
         pr8iW0Gxcr8ZOAJG2Oe7YdFxFgkzI7TtCJEV4KRnXEdk6/gXGuQ7BOIp9YBS42y47zcC
         6r5A==
X-Forwarded-Encrypted: i=1; AJvYcCXKODAoP5FEChOnxAK8YqJpVpUOgJco96goDUi+deUN+0ggDySOdH2er7SpV4lDUgj1jdPqjsqfftYRLrb04zFVNKfgWjqmXWPtiCFVpA==
X-Gm-Message-State: AOJu0YwjN1jzMBszvhO0rjniK7KiF59av74ghitNvLg5CpTHjId8Zf1x
	zEr9mnCkm4UkGSI2w1JQh8FQY1r2pnR1KKmi9fJorQiCGLAZ9UTiXtepXSz37wI2RvrfnvN10Ar
	7tGGcfcbwcpwoxmZqfE95GPuOBoiE/0YrZH64QA==
X-Google-Smtp-Source: AGHT+IEEH1F7Tv7LomODsunYV84Dtc4zLrPpgRRnnl78k+rzuBYmNhragIOzGe8Zi41e1oTPofFlhnZh4uvVT5y70J8=
X-Received: by 2002:a05:6512:2254:b0:52c:8fd7:2252 with SMTP id
 2adb3069b0e04-52ce18324cdmr7591081e87.11.1719396141307; Wed, 26 Jun 2024
 03:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com> <AM6PR04MB594163BAB898D8689A94056F88CE2@AM6PR04MB5941.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB594163BAB898D8689A94056F88CE2@AM6PR04MB5941.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:02:09 +0200
Message-ID: <CACRpkdb17buPQVupCRDthvAgMKpvKvRWEN5GbA7pyF9NxymGEg@mail.gmail.com>
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
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Hal Feng <hal.feng@starfivetech.com>, Fabio Estevam <festevam@gmail.com>, "Ghennadi Procopciuc \(OSS\)" <ghennadi.procopciuc@oss.nxp.com>, Dan Carpenter <dan.carpenter@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Chunyan Zhang <zhang.lyra@gmail.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, Jacky Bai <ping.bai@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Patrice Chotard <patrice.chotard@foss.st.com>, Chester Lin <chester62515@gmail.com>, "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>, Stephen Warren <swarren@wwwdotorg.org>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "soc@kernel.org" <soc@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, Matthias Brugger <matthias.bgg@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Aisheng Dong <aisheng.dong@nxp.com>, Matthias Brugger <mbrugger@suse.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, Sean Wang <sean.wang@kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Jianlong Huang <jianlong.huang@starfivetech.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Jun 18, 2024 at 1:52=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:

> > Subject: [PATCH v2 00/20] pinctrl: Use scope based of_node_put()
> > cleanups
>
> st/stm32/renesas patches are picked. Would you handle the remaining
> ones?

Hm right, I applied all that apply cleanly:
971c8b4c08e7 (HEAD -> devel) pinctrl: samsung: Use scope based
of_node_put() cleanups
3a882554a3bb pinctrl: k210: Use scope based of_node_put() cleanups
7f500f2011c0 pinctrl: freescale: mxs: Fix refcount of child
d7f5120a944a pinctrl: pinconf-generic: Use scope based of_node_put() cleanu=
ps
240c5f238d59 pinctrl: bcm: bcm63xx: Use scope based of_node_put() cleanups
3a0278cfb448 pinctrl: mediatek: Use scope based of_node_put() cleanups
c957ae7e7e68 pinctrl: nomadik: Use scope based of_node_put() cleanups
3dcc01b36f18 pinctrl: s32cc: Use scope based of_node_put() cleanups
7c2aabb56f92 pinctrl: at91: Use scope based of_node_put() cleanups
56c42f6c7b2c pinctrl: rockchip: Use scope based of_node_put() cleanups
8c5dc2a5b3a7 pinctrl: spear: Use scope based of_node_put() cleanups
794e5dc533b0 pinctrl: sprd: Use scope based of_node_put() cleanups
8fa99c00351c pinctrl: starfive: Use scope based of_node_put() cleanups
11eefc0ac884 pinctrl: tegra: Use scope based of_node_put() cleanups

Can you look into rebasing the remaining ones?

I am a bit unsure about Samsung, Krzysztof usually pick these, but no big
deal I guess, if he objects I can just take it out again.

Yours,
Linus Walleij
