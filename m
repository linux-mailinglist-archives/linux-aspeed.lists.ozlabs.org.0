Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2464F72D880
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Jun 2023 06:23:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XMKuq593;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgFmr6ltBz2ykB
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Jun 2023 14:23:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XMKuq593;
	dkim-atps=neutral
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcTms59pXz3cNF
	for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Jun 2023 02:14:19 +1000 (AEST)
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-77703f20aa9so28123839f.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Jun 2023 09:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686240856; x=1688832856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZrPvXOaXEQPKsXtUpbfz4WhJ7pTJywi1kpaIctsmkU=;
        b=XMKuq59311bigM17iCFQWhOMp0G04Iena9ommtxIPq+zvqK6456+kpgkbrprJapUBA
         0pYWmJEPqUqkiDojK0kvbqCFg7DM2rXt3NkjVvHNnWbtCwTs+dwLilWV9ErX1NwslpMu
         oamO8yzZ4WL6+HQ+24T31si9CTRKa6RC0ZPfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686240856; x=1688832856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZrPvXOaXEQPKsXtUpbfz4WhJ7pTJywi1kpaIctsmkU=;
        b=bbc3wM8jIN3G85cxC78s+qls2gEbxpadnVAi5h4iyLj7ENorcCG5umXs3WrUFI3l5r
         uXRWNGqg+XaQ69mXLi2x37qwzoMJe3VdmOgxX0zOqzioI0tqFV60s5Tvdnv1LU+w5Yzi
         jzBEUWl7Pllyui8RprGuHHG+Tmo8lur+XMztvp/4bVTuCAkzgKpUr+ixDP6lvMQFbYu3
         k8rrxa6b/mCkcFoyRIQnPlrEU9W1N2Lg+5cNADa9rwP4CID+7E7sl/76b59yxBfBF/Gx
         fcBCVwK1PSAmR3+c05ZQrsMf3TdbwQgSxSOiptaIvrlLOKcfqFZLJ+o6kejuIkpve/tK
         Axtw==
X-Gm-Message-State: AC+VfDy1nFPfJxAD8ijRSRZ0EFIVO+ndnRVc/+A06VVuFmSqGHFT3sWJ
	5NT/52OMxeeOVCBQDGk9gMV1d0Qq3yNSN3zel8EF1g==
X-Google-Smtp-Source: ACHHUZ6tCTpTDW5y+b3BQI3YR5hiEB20zNWKoTK+hWEGwnwwQ6j4wKaaE7ioiBfwKqAvLbhA3nZwmg==
X-Received: by 2002:a6b:f219:0:b0:777:b377:b225 with SMTP id q25-20020a6bf219000000b00777b377b225mr10534678ioh.11.1686240856408;
        Thu, 08 Jun 2023 09:14:16 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id z20-20020a029f14000000b00408b3bc8061sm363584jal.43.2023.06.08.09.14.15
        for <linux-aspeed@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 09:14:15 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-33bf12b5fb5so110705ab.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Jun 2023 09:14:15 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a22:b0:330:af65:de3d with SMTP id
 g2-20020a056e021a2200b00330af65de3dmr115540ile.11.1686240508041; Thu, 08 Jun
 2023 09:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de> <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
In-Reply-To: <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Jun 2023 09:08:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
Message-ID: <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
Subject: Re: [PATCH 00/53] drm: Convert to platform remove callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 13 Jun 2023 14:20:29 +1000
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
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Xinliang Liu <xinliang.liu@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>, Alim Akhtar <alim.akhtar@samsung.com>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Marijn Suijten <marijn.suijten@somainline.org>, Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>, Karol Herbst <kherbst@redhat.com>, Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, Javier Martinez Canillas <javierm@redhat.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, Akhil P Oommen <quic_akhilpo@quicinc.com>, Danilo Krummrich <dakr@redhat.com>, NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev, Rahul T R <r-ravikumar@ti.com>, Raphael Gallais-Pou <raphael.gallais-pou@foss.st
 .com>, Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, etnaviv@lists.freedesktop.org, Yuan Can <yuancan@huawei.com>, Inki Dae <inki.dae@samsung.com>, Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>, Hyun Kwon <hyun.kwon@xilinx.com>, Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de, Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>, Mihail Atanassov <mihail.atanassov@arm.com>, Liang He <windhl@126.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, lima@lists.freedesktop.org, Chunyan Zhang <zhang.lyra@gmail.com>, Alexey Brodkin <abrodkin@syno
 psys.com>, Minghao Chi <chi.minghao@zte.com.cn>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Ben Skeggs <bskeggs@redhat.com>, Russell King <linux+etnaviv@armlinux.org.uk>, Alain Volmat <alain.volmat@foss.st.com>, Liu Ying <victor.liu@nxp.com>, linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, Sandy Huang <hjc@rock-chips.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Kyungmin Park <kyungmin.park@samsung.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Brian Starkey <brian.starkey@arm.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Miaoqian Lin <linmq006@gmail.com>, Stefan Agner <stefan@agner.ch>, Michal Simek <michal.simek@xilinx.com>, linux-tegra@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
  Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Mali DP Maintainers <malidp@foss.arm.com>, nouveau@lists.freedesktop.org, Orson Zhai <orsonzhai@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Lyude Paul <lyude@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Guo Zhengkui <guozhengkui@vivo.com>, Konrad Dybcio <konrad.dybcio@somainline.org>, Alison Wang <alison.wang@nxp.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Christian Gmeiner <christian.gmeiner@gmail.com>, Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>, Baolin Wang <baolin.wang@linux.alibaba.com>, Daniel Vetter <daniel@ffwll.ch>, Liu Shixin <liushixin2@huawei.com>, Tomi Valkeinen <tomba@kernel.org>, Deepak R Varma <drv@mailo.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Ricardo Ribalda <ribalda@chromium.org>, Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <
 shawnguo@kernel.org>, Yannick Fertre <yannick.fertre@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>, Liviu Dudau <liviu.dudau@arm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>, linux-renesas-soc@vger.kernel.org, Yongqin Liu <yongqin.liu@linaro.org>, Jayshri Pawar <jpawar@cadence.com>, Jonas Karlman <jonas@kwiboo.se>, Rob Clark <robdclark@gmail.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Philippe Cornu <philippe.cornu@foss.st.com>, Thomas Zimmermann <tzimmermann@suse.de>, Melissa Wen <mwen@igalia.com>, linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <swboyd@chromium.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <andersson
 @kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Qiang Yu <yuq825@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jyri Sarha <jyri.sarha@iki.fi>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi,

On Thu, Jun 1, 2023 at 8:40=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello,
>
> On Sun, May 07, 2023 at 06:25:23PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > this patch series adapts the platform drivers below drivers/gpu/drm
> > to use the .remove_new() callback. Compared to the traditional .remove(=
)
> > callback .remove_new() returns no value. This is a good thing because
> > the driver core doesn't (and cannot) cope for errors during remove. The
> > only effect of a non-zero return value in .remove() is that the driver
> > core emits a warning. The device is removed anyhow and an early return
> > from .remove() usually yields a resource leak.
> >
> > By changing the remove callback to return void driver authors cannot
> > reasonably (but wrongly) assume any more that there happens some kind o=
f
> > cleanup later.
>
> I wonder if someone would volunteer to add the whole series to
> drm-misc-next?!

It looks as if Neil applied quite a few of them already, so I looked
at what was left...

I'm a little hesitant to just apply the whole kit-and-caboodle to
drm-misc-next since there are specific DRM trees for a bunch of them
and it would be better if they landed there. ...so I went through all
the patches that still applied to drm-misc-next, then used
'scripts/get_maintainer.pl --scm' to check if they were maintained
through drm-misc. That still left quite a few patches. I've applied
those ones and pushed to drm-misc-next:

71722685cd17 drm/xlnx/zynqmp_dpsub: Convert to platform remove
callback returning void
1ed54a19f3b3 drm/vc4: Convert to platform remove callback returning void
b957812839f8 drm/v3d: Convert to platform remove callback returning void
e2fd3192e267 drm/tve200: Convert to platform remove callback returning void
84e6da7ad553 drm/tiny: Convert to platform remove callback returning void
34cdd1f691ad drm/tidss: Convert to platform remove callback returning void
d665e3c9d37a drm/sun4i: Convert to platform remove callback returning void
0c259ab19146 drm/stm: Convert to platform remove callback returning void
9a865e45884a drm/sti: Convert to platform remove callback returning void
3c855610840e drm/rockchip: Convert to platform remove callback returning vo=
id
e41977a83b71 drm/panfrost: Convert to platform remove callback returning vo=
id
cef3776d0b5a drm/panel: Convert to platform remove callback returning void
bd296a594e87 drm/mxsfb: Convert to platform remove callback returning void
38ca2d93d323 drm/meson: Convert to platform remove callback returning void
fd1457d84bae drm/mcde: Convert to platform remove callback returning void
41a56a18615c drm/logicvc: Convert to platform remove callback returning voi=
d
980ec6444372 drm/lima: Convert to platform remove callback returning void
82a2c0cc1a22 drm/hisilicon: Convert to platform remove callback returning v=
oid
c3b28b29ac0a drm/fsl-dcu: Convert to platform remove callback returning voi=
d
a118fc6e71f9 drm/atmel-hlcdc: Convert to platform remove callback returning=
 void
9a32dd324c46 drm/aspeed: Convert to platform remove callback returning void
2c7d291c498c drm/arm/malidp: Convert to platform remove callback returning =
void
a920028df679 drm/arm/hdlcd: Convert to platform remove callback returning v=
oid
1bf3d76a7d15 drm/komeda: Convert to platform remove callback returning void

The following ones appeared to apply to the top of drm-misc-next, but
I didn't apply them since get_maintainer didn't say they were part of
drm-misc-next:

drm/tiny: Convert to platform remove callback returning void
drm/tilcdc: Convert to platform remove callback returning void
drm/sprd: Convert to platform remove callback returning void
drm/shmobile: Convert to platform remove callback returning void
drm/rcar-du: Convert to platform remove callback returning void
drm/omap: Convert to platform remove callback returning void
drm/nouveau: Convert to platform remove callback returning void
drm/mediatek: Convert to platform remove callback returning void
drm/kmb: Convert to platform remove callback returning void
drm/ingenic: Convert to platform remove callback returning void
drm/imx/ipuv3: Convert to platform remove callback returning void
drm/imx/dcss: Convert to platform remove callback returning void
drm/etnaviv: Convert to platform remove callback returning void
drm/armada: Convert to platform remove callback returning void

-Doug
