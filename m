Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9028072D883
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Jun 2023 06:24:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cphNCpck;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgFn22P21z2yJQ
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Jun 2023 14:24:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cphNCpck;
	dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcVdd45Drz3cft
	for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Jun 2023 02:53:07 +1000 (AEST)
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-777b4c9e341so35409339f.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Jun 2023 09:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686243182; x=1688835182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmEOm3Skn8Jl/sRC6hqqJWkitptFK5F761thwbnVCkg=;
        b=cphNCpck4LVMkYF0Bezdr8E0wJ1ptzt7X6eaT0Pw4NpWYmnLenZKReeajX5yspeDN7
         357fCOUUStIs7sOK6OkocTF00tT/9qOqiU94kccxfeaCtRWAKY4si5A13ADzJW7777f2
         OJmMC8rR74ms+kpehxiXAtP8OD1affsmrtyYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686243182; x=1688835182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hmEOm3Skn8Jl/sRC6hqqJWkitptFK5F761thwbnVCkg=;
        b=Cu8SwW+QYTX2PXPyxkJkitogOnRmS6OIS8jOWHSAlaSJ7sE6fytpu0iFpx5CMJMk7X
         ixub7Hchx7PF/ETc+pSZyDQ5gpp2o66HP0c8oOJP3iQNkBHo0WnOdhrcAEnIt9bn5iAR
         UteZaqrZMeTMZ0uk9zj/N9xmyoV/lSZdk/sigtw/PUxmszwlToa2YUP0JLjq08zLQb3a
         uNbZeC+1uNIEfgMf0b5o8Lwn7QATTw0VS10uEUdacAE2Ac7yD+LbcYd6zoKtJ+hfVGwX
         JduGH04It9Lc3L7zHa0ObDaUx2F39xjfutgibNfFH23/sJjzg3XyYh33mtTkkAFxG7O0
         +9Ow==
X-Gm-Message-State: AC+VfDzfYFgDcEumVHdZmJfJFdaTTMx0s12BiRlHSObowCjoHlSdQopM
	Ijx9tH1S6aAjiODBhhoQxLgH4XiLWtgS+yJie+dMZQ==
X-Google-Smtp-Source: ACHHUZ5w1mt9IVRI34xaXRcqpJG5P+J6KwO0Ee/YLnEnJKj1LgQ62M7gBzLKHU5D3v9qJ1Enjs9Xew==
X-Received: by 2002:a5e:880c:0:b0:774:7cdb:1fe4 with SMTP id l12-20020a5e880c000000b007747cdb1fe4mr12690974ioj.13.1686243182341;
        Thu, 08 Jun 2023 09:53:02 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com. [209.85.166.181])
        by smtp.gmail.com with ESMTPSA id u13-20020a6be90d000000b0076c750dc780sm460065iof.29.2023.06.08.09.53.00
        for <linux-aspeed@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 09:53:01 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-33d928a268eso145065ab.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Jun 2023 09:53:00 -0700 (PDT)
X-Received: by 2002:a05:6e02:18ca:b0:33b:68fb:ea0 with SMTP id
 s10-20020a056e0218ca00b0033b68fb0ea0mr145479ilu.26.1686242834959; Thu, 08 Jun
 2023 09:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de> <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230608162642.GA23400@pendragon.ideasonboard.com>
In-Reply-To: <20230608162642.GA23400@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Jun 2023 09:47:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vwz9+jhZ94DvagVyAq=4TtWLMEVLRi8rTKaishoPQEfw@mail.gmail.com>
Message-ID: <CAD=FV=Vwz9+jhZ94DvagVyAq=4TtWLMEVLRi8rTKaishoPQEfw@mail.gmail.com>
Subject: Re: [PATCH 00/53] drm: Convert to platform remove callback returning void
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Xinliang Liu <xinliang.liu@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>, Alim Akhtar <alim.akhtar@samsung.com>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Marijn Suijten <marijn.suijten@somainline.org>, Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>, Karol Herbst <kherbst@redhat.com>, Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, Javier Martinez Canillas <javierm@redhat.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, Akhil P Oommen <quic_akhilpo@quicinc.com>, Danilo Krummrich <dakr@redhat.com>, NXP Linux Team <linux-imx@nxp.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-sunxi@lists.linux.dev, Rahul T R 
 <r-ravikumar@ti.com>, Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, etnaviv@lists.freedesktop.org, Yuan Can <yuancan@huawei.com>, Inki Dae <inki.dae@samsung.com>, Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>, Hyun Kwon <hyun.kwon@xilinx.com>, Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de, Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>, Mihail Atanassov <mihail.atanassov@arm.com>, Liang He <windhl@126.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, lima@lists.freedesktop.or
 g, Chunyan Zhang <zhang.lyra@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>, Minghao Chi <chi.minghao@zte.com.cn>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Ben Skeggs <bskeggs@redhat.com>, Russell King <linux+etnaviv@armlinux.org.uk>, Alain Volmat <alain.volmat@foss.st.com>, Liu Ying <victor.liu@nxp.com>, linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, Sandy Huang <hjc@rock-chips.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Kyungmin Park <kyungmin.park@samsung.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Brian Starkey <brian.starkey@arm.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Miaoqian Lin <linmq006@gmail.com>, Stefan Agner <stefan@agner.ch>, Michal Simek <michal.simek@xilinx.com>, linux-tegra@vger.kernel.org, Andrzej Hajda <andrzej.h
 ajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Mali DP Maintainers <malidp@foss.arm.com>, nouveau@lists.freedesktop.org, Orson Zhai <orsonzhai@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Lyude Paul <lyude@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Guo Zhengkui <guozhengkui@vivo.com>, Konrad Dybcio <konrad.dybcio@somainline.org>, Alison Wang <alison.wang@nxp.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Christian Gmeiner <christian.gmeiner@gmail.com>, Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>, Baolin Wang <baolin.wang@linux.alibaba.com>, Daniel Vetter <daniel@ffwll.ch>, Liu Shixin <liushixin2@huawei.com>, Tomi Valkeinen <tomba@kernel.org>, Deepak R Varma <drv@mailo.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Ricardo Ribalda <ribalda@chromium.org>, Tian Tao <tiantao6@hisilicon.c
 om>, Shawn Guo <shawnguo@kernel.org>, Yannick Fertre <yannick.fertre@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>, Liviu Dudau <liviu.dudau@arm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>, linux-renesas-soc@vger.kernel.org, Yongqin Liu <yongqin.liu@linaro.org>, Jayshri Pawar <jpawar@cadence.com>, Jonas Karlman <jonas@kwiboo.se>, Rob Clark <robdclark@gmail.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Philippe Cornu <philippe.cornu@foss.st.com>, Thomas Zimmermann <tzimmermann@suse.de>, Melissa Wen <mwen@igalia.com>, linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <swboyd@chromium.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Ande
 rsson <andersson@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Qiang Yu <yuq825@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jyri Sarha <jyri.sarha@iki.fi>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi,

On Thu, Jun 8, 2023 at 9:26=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> > The following ones appeared to apply to the top of drm-misc-next, but
> > I didn't apply them since get_maintainer didn't say they were part of
> > drm-misc-next:
> >
> > drm/tiny: Convert to platform remove callback returning void
> > drm/tilcdc: Convert to platform remove callback returning void
> > drm/sprd: Convert to platform remove callback returning void
> > drm/shmobile: Convert to platform remove callback returning void
> > drm/rcar-du: Convert to platform remove callback returning void
>
> If you don't mind, could you take the rcar-du patch through drm-misc too
> ? I don't plan to send another pull request for v6.5.

Done.

2510a2579324 drm/rcar-du: Convert to platform remove callback returning voi=
d
