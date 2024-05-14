Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B759A957948
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:57:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqJ95Zq8z3w2r
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.51; helo=mail-qv1-f51.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdpqY1FGnz2xjP;
	Tue, 14 May 2024 18:07:19 +1000 (AEST)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6a05f376effso43681456d6.0;
        Tue, 14 May 2024 01:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715674035; x=1716278835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mAZGt+1Rc/qtuBUqNnzX2rBGCR5XoalBEqWaRtcOihM=;
        b=FOsePyPY9qvnBTfyXQSDDVikQpnSy6RWvwi8fmWjMn/xjbQpKYABczO/uZYs6cRmG3
         wdOFsLiLcF4OL/cjHu3VIrm3im1h4iwHLisx20lWYyrTxLYx24gylGv6Rz/IMKYWl7vH
         89fPT6i7ODCPCrs+O+jSJiUeyxLt9R4288Wbtjq8p96m+W8axyBvLVZmFORKD9tRNPQp
         C/LWRvRQdSsYZz39eBZzlmTpFF51rliGSodDPVEIlGZ2WKTB/URROuRVxFo+VVFJ26NH
         ut+EejdB1xyHpXK64xDbEYuVfR0kbRyYmHidiIDcRSfyMHV/Ym4XuoSymsXCfDsMICx3
         T/dA==
X-Forwarded-Encrypted: i=1; AJvYcCWrPqhlHQzWXLf3girto8GRWikZQvo0tFZCYHxTZ8P6tmSKsWVc5VAqCCiFtfSKmsCUQXZFRQLN1pelGdw5LrRd46Ct7oD3caPsZQL8d00HPLbKsX652LSdGc4B0hUxf29YdTOU8peW
X-Gm-Message-State: AOJu0Yz5qsO8lTFn7hPJuL7L3qwGZqm2bz+TGJHCg9RoIp9k3M93yX6Y
	FItMixGWxhIikqGEaloe/h1WRB72080hD6A1jIXM0HguloDhVdflLccJqLPS
X-Google-Smtp-Source: AGHT+IHs1sfNKHAqLakEv7PlJGFvamkXrokggIbCRVErCcDpzG8imVYxDFWwB792jptNOTv7gZqywA==
X-Received: by 2002:a05:6214:4b10:b0:6a0:83a5:deaf with SMTP id 6a1803df08f44-6a168197513mr129423266d6.29.1715674035043;
        Tue, 14 May 2024 01:07:15 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f194945sm50601036d6.61.2024.05.14.01.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 01:07:14 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-43e12244dc9so15033581cf.2;
        Tue, 14 May 2024 01:07:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWfmnfqH3gSpszhwdf/KSzX/+J8q/DxE6NPlRVPLtJ7R+7OjCVeDFEVmnUHd+wo3b0CZyyGBjP3533zg38Ee1hy4HhF/sL5HfyfDAMA6qaE//Q02IIAtZEsD2iBvA40xvUk856v0Hwf
X-Received: by 2002:a05:690c:fd0:b0:611:7132:e6ba with SMTP id
 00721157ae682-622b0147778mr138786587b3.40.1715674014345; Tue, 14 May 2024
 01:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com> <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
 <CACRpkdaUecnwvHFdtGkuM80SObvXpXZkWGYoUMgnNHcvObYF0g@mail.gmail.com>
 <CAMuHMdWCD+k8=iX8+tcK76DU_m9quR8BV+K68K73SygJzCz5VA@mail.gmail.com> <CACRpkdYS8=cHT=7tGbzWZ73jbLhjqdpssbaHH-qREe=bcHYe2A@mail.gmail.com>
In-Reply-To: <CACRpkdYS8=cHT=7tGbzWZ73jbLhjqdpssbaHH-qREe=bcHYe2A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 May 2024 10:06:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUucOu-c7tbeBBCMaoouFcUnJi0aRU--pc2Gk9QWNrANg@mail.gmail.com>
Message-ID: <CAMuHMdUucOu-c7tbeBBCMaoouFcUnJi0aRU--pc2Gk9QWNrANg@mail.gmail.com>
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

On Tue, May 14, 2024 at 9:33=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Tue, May 14, 2024 at 8:36=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > > Does this go into the Renesas patch stack?
> > > I think the patch stands fine without the rest of the series.
> >
> > Sure, I can do that.
>
> Please apply it!

OK, will queue in renesas-pinctrl for v6.11.

> > From your positive response to v1, I thought that perhaps you just
> > wanted to take the full series yourself?
>
> Sorry, I always prefer submaintainers to pick their stuff, they
> know what they are doing and they can test the entire patch
> stack properly.

OK, will (try to ;-) remember...

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
