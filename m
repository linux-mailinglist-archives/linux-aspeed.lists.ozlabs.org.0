Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D842D7394BB
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Jun 2023 03:40:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmjkG5gH0z30Nm
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Jun 2023 11:40:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.178; helo=mail-lj1-f178.google.com; envelope-from=wens213@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qk2LV42hhz30GP
	for <linux-aspeed@lists.ozlabs.org>; Sun, 18 Jun 2023 02:59:12 +1000 (AEST)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2b45b6adffbso22113111fa.3
        for <linux-aspeed@lists.ozlabs.org>; Sat, 17 Jun 2023 09:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687021147; x=1689613147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IIAlmExRE6EbIYR/X1OU/hkRy+rZ5PC7Pr91ssHegm8=;
        b=X4Wkyt38RJ0z/8I8sTyi56SlFUXTCkUkFOFUFrnuPdKAoJlAjGTC3bqqiMZBjoeZyv
         YIZOo9aLe8oNgtCkLqvWjcfoVHBUunZlZ0ypQU+qqgetYC2Sc7oPhPkQ3dkbcjgWHqCA
         2f7Rf+Un7fH73XdWQmFhqciqc5ITfjfDr2QIsZlf2fWu7JPrQufPuOvOibvOQlu38YYQ
         U/QVpue66e/Jv8B15GGpdLvlhQ/G6dmWggkq7n0yMIRWq0ntyHtenQiOWza080Lf/k5O
         5xc5OEfkJ1AFzj+DaD5QXbzO96gFtnJowKTWE6FY793oaAAbSINvoyMYSQki7eDA6gMw
         7iqg==
X-Gm-Message-State: AC+VfDxftpenlplX3cjooITXJwrHO8tjqfdbRg5uZNDV9WJQELUMsq0K
	xFcqnZ7IewvkWW/vMjVTlbiFu6833S6idkC70Gc=
X-Google-Smtp-Source: ACHHUZ6INjqBO0cYJLJGsQQDsGYe8xFeBgIgLumyxx63ayDSGytgPeIMfbaWjJuKu9uGNPaqecqg3w==
X-Received: by 2002:a19:711c:0:b0:4f6:3000:4d5a with SMTP id m28-20020a19711c000000b004f630004d5amr3032191lfc.38.1687021147334;
        Sat, 17 Jun 2023 09:59:07 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id g23-20020a19ee17000000b004f4b3e9e0cesm3482280lfb.297.2023.06.17.09.59.07
        for <linux-aspeed@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 09:59:07 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b45c289615so21255911fa.1
        for <linux-aspeed@lists.ozlabs.org>; Sat, 17 Jun 2023 09:59:07 -0700 (PDT)
X-Received: by 2002:a2e:9896:0:b0:2ad:8380:770d with SMTP id
 b22-20020a2e9896000000b002ad8380770dmr3881903ljj.21.1687020704207; Sat, 17
 Jun 2023 09:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de> <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
In-Reply-To: <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 18 Jun 2023 00:51:32 +0800
X-Gmail-Original-Message-ID: <CAGb2v676WBuHeN5cLNZEF0FHRu=jsNhVxN50pnZCMbqGFPYmLw@mail.gmail.com>
Message-ID: <CAGb2v676WBuHeN5cLNZEF0FHRu=jsNhVxN50pnZCMbqGFPYmLw@mail.gmail.com>
Subject: Re: patches dropped from drm-misc-next [Was: Re: [PATCH 00/53] drm:
 Convert to platform remove callback returning] void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 22 Jun 2023 11:40:07 +1000
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
Reply-To: wens@csie.org
Cc: Raymond Tan <raymond.tan@intel.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Xinliang Liu <xinliang.liu@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Alim Akhtar <alim.akhtar@samsung.com>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Marijn Suijten <marijn.suijten@somainline.org>, Jonathan Hunter <jonathanh@nvidia.com>, Sumit Semwal <sumit.semwal@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, Javier Martinez Canillas <javierm@redhat.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, Akhil P Oommen <quic_akhilpo@quicinc.com>, Danilo Krummrich <dakr@redhat.com>, NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev, Rahu
 l T R <r-ravikumar@ti.com>, Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, etnaviv@lists.freedesktop.org, Yuan Can <yuancan@huawei.com>, Inki Dae <inki.dae@samsung.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>, Hyun Kwon <hyun.kwon@xilinx.com>, Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de, Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@microchip.com>, Miaoqian Lin <linmq006@gmail.com>, linux-aspeed@lists.ozlabs.org, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>, Mihail Atanassov <mihail.atanassov@arm.com>, Liang He <windhl@126.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.inte
 l.com>, lima@lists.freedesktop.org, Chunyan Zhang <zhang.lyra@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>, Minghao Chi <chi.minghao@zte.com.cn>, Steven Price <steven.price@arm.com>, linux-rockchip@lists.infradead.org, Ben Skeggs <bskeggs@redhat.com>, Russell King <linux+etnaviv@armlinux.org.uk>, Alain Volmat <alain.volmat@foss.st.com>, Liu Ying <victor.liu@nxp.com>, linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Wang Jianzheng <wangjianzheng@vivo.com>, Maxime Ripard <mripard@kernel.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, Sandy Huang <hjc@rock-chips.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Kyungmin Park <kyungmin.park@samsung.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Brian Starkey <brian.starkey@arm.com>, Karol Herbst <kherbst@redhat.com>, Alexandre B
 elloni <alexandre.belloni@bootlin.com>, Stefan Agner <stefan@agner.ch>, Michal Simek <michal.simek@xilinx.com>, Matthias Brugger <matthias.bgg@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Mali DP Maintainers <malidp@foss.arm.com>, nouveau@lists.freedesktop.org, Orson Zhai <orsonzhai@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Lyude Paul <lyude@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Guo Zhengkui <guozhengkui@vivo.com>, Liviu Dudau <liviu.dudau@arm.com>, Alison Wang <alison.wang@nxp.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Christian Gmeiner <christian.gmeiner@gmail.com>, Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>, Baolin Wang <baolin.wang@linux.alibaba.com>, Paul Cercueil <paul@crapouillou.
 net>, Tomi Valkeinen <tomba@kernel.org>, Deepak R Varma <drv@mailo.com>, Karol Wachowski <karol.wachowski@linux.intel.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Ricardo Ribalda <ribalda@chromium.org>, Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>, Konrad Dybcio <konrad.dybcio@somainline.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Doug Anderson <dianders@chromium.org>, Liu Shixin <liushixin2@huawei.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Laura Nao <laura.nao@collabora.com>, David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>, linux-renesas-soc@vger.kernel.org, Yongqin Liu <yongqin.liu@linaro.org>, Jayshri Pawar <jpawar@cadence.com>, Jonas Karlman <jonas@kwiboo.se>, Russell King <linux@armlinux.org.uk>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Qiang Yu <yuq825@gmail.com>, Tho
 mas Zimmermann <tzimmermann@suse.de>, Melissa Wen <mwen@igalia.com>, linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yannick Fertre <yannick.fertre@foss.st.com>, linux-mips@vger.kernel.org, Rob Clark <robdclark@gmail.com>, Philippe Cornu <philippe.cornu@foss.st.com>, Daniel Vetter <daniel@ffwll.ch>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jyri Sarha <jyri.sarha@iki.fi>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, Jun 18, 2023 at 12:13=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> [expanding recipents by the other affected persons]
>
> On Thu, Jun 08, 2023 at 09:08:15AM -0700, Doug Anderson wrote:
> > On Thu, Jun 1, 2023 at 8:40=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > >
> > > Hello,
> > >
> > > On Sun, May 07, 2023 at 06:25:23PM +0200, Uwe Kleine-K=C3=B6nig wrote=
:
> > > > this patch series adapts the platform drivers below drivers/gpu/drm
> > > > to use the .remove_new() callback. Compared to the traditional .rem=
ove()
> > > > callback .remove_new() returns no value. This is a good thing becau=
se
> > > > the driver core doesn't (and cannot) cope for errors during remove.=
 The
> > > > only effect of a non-zero return value in .remove() is that the dri=
ver
> > > > core emits a warning. The device is removed anyhow and an early ret=
urn
> > > > from .remove() usually yields a resource leak.
> > > >
> > > > By changing the remove callback to return void driver authors canno=
t
> > > > reasonably (but wrongly) assume any more that there happens some ki=
nd of
> > > > cleanup later.
> > >
> > > I wonder if someone would volunteer to add the whole series to
> > > drm-misc-next?!
> >
> > It looks as if Neil applied quite a few of them already, so I looked
> > at what was left...
> >
> > I'm a little hesitant to just apply the whole kit-and-caboodle to
> > drm-misc-next since there are specific DRM trees for a bunch of them
> > and it would be better if they landed there. ...so I went through all
> > the patches that still applied to drm-misc-next, then used
> > 'scripts/get_maintainer.pl --scm' to check if they were maintained
> > through drm-misc. That still left quite a few patches. I've applied
> > those ones and pushed to drm-misc-next:
> >
> > 71722685cd17 drm/xlnx/zynqmp_dpsub: Convert to platform remove
> > callback returning void
> > 1ed54a19f3b3 drm/vc4: Convert to platform remove callback returning voi=
d
> > b957812839f8 drm/v3d: Convert to platform remove callback returning voi=
d
> > e2fd3192e267 drm/tve200: Convert to platform remove callback returning =
void
> > 84e6da7ad553 drm/tiny: Convert to platform remove callback returning vo=
id
> > 34cdd1f691ad drm/tidss: Convert to platform remove callback returning v=
oid
> > d665e3c9d37a drm/sun4i: Convert to platform remove callback returning v=
oid
> > 0c259ab19146 drm/stm: Convert to platform remove callback returning voi=
d
> > 9a865e45884a drm/sti: Convert to platform remove callback returning voi=
d
> > 3c855610840e drm/rockchip: Convert to platform remove callback returnin=
g void
> > e41977a83b71 drm/panfrost: Convert to platform remove callback returnin=
g void
> > cef3776d0b5a drm/panel: Convert to platform remove callback returning v=
oid
> > bd296a594e87 drm/mxsfb: Convert to platform remove callback returning v=
oid
> > 38ca2d93d323 drm/meson: Convert to platform remove callback returning v=
oid
> > fd1457d84bae drm/mcde: Convert to platform remove callback returning vo=
id
> > 41a56a18615c drm/logicvc: Convert to platform remove callback returning=
 void
> > 980ec6444372 drm/lima: Convert to platform remove callback returning vo=
id
> > 82a2c0cc1a22 drm/hisilicon: Convert to platform remove callback returni=
ng void
> > c3b28b29ac0a drm/fsl-dcu: Convert to platform remove callback returning=
 void
> > a118fc6e71f9 drm/atmel-hlcdc: Convert to platform remove callback retur=
ning void
> > 9a32dd324c46 drm/aspeed: Convert to platform remove callback returning =
void
> > 2c7d291c498c drm/arm/malidp: Convert to platform remove callback return=
ing void
> > a920028df679 drm/arm/hdlcd: Convert to platform remove callback returni=
ng void
> > 1bf3d76a7d15 drm/komeda: Convert to platform remove callback returning =
void
>
> Together with the patches that were applied later the topmost commit
> from this series is c2807ecb5290 ("drm/omap: Convert to platform remove
> callback returning void"). This commit was part for the following next
> tags:
>
>         $ git tag -l --contains c2807ecb5290
>         next-20230609
>         next-20230613
>         next-20230614
>         next-20230615
>
> However in next-20230616 they are missing. In next-20230616
> drm-misc/for-linux-next was cf683e8870bd4be0fd6b98639286700a35088660.
> Compared to c2807ecb5290 this adds 1149 patches but drops 37 (that are
> also not included with a different commit id). The 37 patches dropped
> are 13cdd12a9f934158f4ec817cf048fcb4384aa9dc..c2807ecb5290:
>
>         $ git shortlog -s 13cdd12a9f934158f4ec817cf048fcb4384aa9dc..c2807=
ecb5290
>              1  Christophe JAILLET
>              2  Jessica Zhang
>              5  Karol Wachowski
>              1  Laura Nao
>             27  Uwe Kleine-K=C3=B6nig
>              1  Wang Jianzheng
>
>
> I guess this was done by mistake because nobody told me about dropping
> my/these patches? Can c2807ecb5290 please be merged into drm-misc-next
> again?

AFAIK drm-misc/for-linux-next cuts off at -rc6, at which point any patches
merged get queued up for -next-next. I think that's what happened to your
patches?


ChenYu
