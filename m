Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22011957947
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:57:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqJ93Hstz3vyW
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w5YZWlBR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vdp4M5prTz301T
	for <linux-aspeed@lists.ozlabs.org>; Tue, 14 May 2024 17:33:22 +1000 (AEST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-620314aa1d7so55616047b3.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 14 May 2024 00:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715671995; x=1716276795; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4wW5aa4W2kv01Iu3rTlOfBD8ed5XWvkaDVuJNLIYTA=;
        b=w5YZWlBRe+z4X1tMUjGvdzEdfMowigp20j6gaNKZaQH3noX/REtabSHUjGTkJ6mpBN
         JDbl4+BqVUdC6erWHLEvZgrLy01BnijpRH4Wu+v9acMZEI+T5ahD9XnoK9BHQ/UexVjn
         m8znVms8AAUVMOzs4gjq2bYPTGW6GjSf+zLBOkt6OIeqrl9NCIdsNLHUqbU8QcZMn8Es
         MhOv3GMGYHvqWAqQD2T6pqmEZvLzuMrqklsynH3jEjWKXgJPkfLawI1e5iljzC1Yjene
         TJi/y1yngo4mJ6Zck5aOn64Mu647Wt33LbePp58T/CVA1ldM4BPTw4bsJzjkWwsqIhs0
         PE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715671995; x=1716276795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4wW5aa4W2kv01Iu3rTlOfBD8ed5XWvkaDVuJNLIYTA=;
        b=XjNjXfmf3EjPfKZbfkuTDeL3Svelm9krlkNjyYWuiY+NsSsB/uBrVNoGoiauewiRII
         kORA3pqNHOd8JpvW3Aj4+Ffm1jHPze9gtkrkUOfBU0VD8vtxPgXNt6mI7Vy+a71IAceq
         QOwqSSGV7sqMOFA7XH5Yc6Zsg1mBJUeEMxR+Iz+kqXFrjpWd5sgt6gRPNOtNCYpQ7NVz
         ZcQyQC+wUWGXp/47Ue+fu9OmXqdfTH8eyi5lB9ziDDqo85vMH1glnIoLRPX9v14sHY4H
         zU32kPJlAfGgnIsHuFj9LUeYWKDxSRU/M/Vx9iBBkWHWhknYOzgyfgSXJkZ4GuVJFDt5
         ytGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1mzyfHPOrCA1TZOWVk+FAZiCdN7nnmFTifrjUF1XIv/BPhu46dqDXN2WrfLC6szHVSZRfYOWQWZFs4NJPzqTUN4VjnnemMZfR7WcmJw==
X-Gm-Message-State: AOJu0YwN6VlxEx9dxqzLWjuLwIb3+q61gNHvdIM5/HicmWXq6gqCbW5b
	/F2UkcMNvXcl3P8DhhkiE/M5D8IYAiP9VdzbLx2XRcC66pJUNvaNMWZnkLDW2PR59nCd+HUtUOt
	UpzyIKpO1Gb1g2hKdfWzluzeF+5SAgPBN26nyVQ==
X-Google-Smtp-Source: AGHT+IEj9rSUWA94F6VFaCC7a26gta7P6jlgI2cpDV7q9j/kgYnlADA3j4AJ721URmKt02c8jgw6oM4ErSC0l+EyUGQ=
X-Received: by 2002:a0d:cbd1:0:b0:61b:3356:d28c with SMTP id
 00721157ae682-622aff92355mr116464607b3.2.1715671995199; Tue, 14 May 2024
 00:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com> <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
 <CACRpkdaUecnwvHFdtGkuM80SObvXpXZkWGYoUMgnNHcvObYF0g@mail.gmail.com> <CAMuHMdWCD+k8=iX8+tcK76DU_m9quR8BV+K68K73SygJzCz5VA@mail.gmail.com>
In-Reply-To: <CAMuHMdWCD+k8=iX8+tcK76DU_m9quR8BV+K68K73SygJzCz5VA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 May 2024 09:33:03 +0200
Message-ID: <CACRpkdYS8=cHT=7tGbzWZ73jbLhjqdpssbaHH-qREe=bcHYe2A@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put() cleanups
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

On Tue, May 14, 2024 at 8:36=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:

> > Does this go into the Renesas patch stack?
> >
> > I think the patch stands fine without the rest of the series.
>
> Sure, I can do that.

Please apply it!

> From your positive response to v1, I thought that perhaps you just
> wanted to take the full series yourself?

Sorry, I always prefer submaintainers to pick their stuff, they
know what they are doing and they can test the entire patch
stack properly.

Yours,
Linus Walleij
