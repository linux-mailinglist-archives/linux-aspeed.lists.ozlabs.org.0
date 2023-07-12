Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91319755E29
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jul 2023 10:15:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jfEHyiWA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4FJf3Q8Qz2yGV
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jul 2023 18:15:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jfEHyiWA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com; envelope-from=seanpaul@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1RNW69Smz30hb
	for <linux-aspeed@lists.ozlabs.org>; Thu, 13 Jul 2023 04:39:21 +1000 (AEST)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3a1e6022b93so5584902b6e.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 12 Jul 2023 11:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689187155; x=1691779155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTThceHWQZD4Ac2XfATsHd8gywiOPtbGgdMtmxYrl6g=;
        b=jfEHyiWA9ZEaL7F+R3U9fthRsfRH8BDzBrgngGiNWr8cCidXImp04MyQYGh+BFA6Nn
         axTx1I8LOiOvTUNbB6kbT6pnoSYEgjnRLNSQVJGRsY7Ce1lz0X+mCgNOCoGZU0cVxTR6
         JcAV9HC0JEL5kCvNumF6cnPHUzvMXWS4s2W+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689187155; x=1691779155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTThceHWQZD4Ac2XfATsHd8gywiOPtbGgdMtmxYrl6g=;
        b=ZTgsTNmnWOGYmwJ8DGmWN/xjTcCZUplKMwDvu2U48nutnixDIfaTT6h5Dx5iAmolrU
         6E6nWbVCpd3NI9IM2vZVBJPKZesvL9V32SKLVgZOBbeyU61f5yEGhQga50cDCkqRE5uv
         pA0ilhA1DlSp3TJInhsBOCqMNl3U8IqO59aOBzLyPfLYr2BeG5mhnE+olajv6+MVVBn3
         hgV7wQ4T3QJ0iXIvMetCuRae0zF9L4iUyIX5T+H4ecMYIB0QtohNUKw6F+gqjjedg/En
         DH3sTNNdoWZlwJGgq61oRu96wmSBB5LIjCoRTagUA23yEaqDolCRAeKiquqb4Pbxu6sz
         ZADA==
X-Gm-Message-State: ABy/qLYRrYLbtYTbt5rm+Rj4oxEmTZi8SzMlKfmZ8LFnqEtZdoJfb+73
	h/awQTMoJxhUjqPvTMn5Dww/094+9jcDAbH7ot4brlpl
X-Google-Smtp-Source: APBJJlHPrjhg5y5L7aV2VxN2T/ThM0dIhaIhyHwha/AACErtii8fW33IqaX5Qsbft6YPn02VnBd6PA==
X-Received: by 2002:a05:6358:5e0c:b0:133:84c:a085 with SMTP id q12-20020a0563585e0c00b00133084ca085mr18888975rwn.1.1689187155153;
        Wed, 12 Jul 2023 11:39:15 -0700 (PDT)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com. [209.85.210.178])
        by smtp.gmail.com with ESMTPSA id x28-20020a656abc000000b00528da88275bsm3600511pgu.47.2023.07.12.11.39.14
        for <linux-aspeed@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 11:39:14 -0700 (PDT)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6687096c6ddso4441852b3a.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 12 Jul 2023 11:39:14 -0700 (PDT)
X-Received: by 2002:a25:50c9:0:b0:c6d:e3e3:5592 with SMTP id
 e192-20020a2550c9000000b00c6de3e35592mr13511834ybb.54.1689186698646; Wed, 12
 Jul 2023 11:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de> <87fs5tgpvv.fsf@intel.com>
In-Reply-To: <87fs5tgpvv.fsf@intel.com>
From: Sean Paul <seanpaul@chromium.org>
Date: Wed, 12 Jul 2023 14:31:02 -0400
X-Gmail-Original-Message-ID: <CAOw6vbLO_UaXDbTCtAQJgthXOUMPqEV+c2MQhP-1DuK44OhGxw@mail.gmail.com>
Message-ID: <CAOw6vbLO_UaXDbTCtAQJgthXOUMPqEV+c2MQhP-1DuK44OhGxw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH RFC v1 00/52] drm/crtc: Rename struct
 drm_crtc::dev to drm_dev
To: Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 17 Jul 2023 18:11:37 +1000
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
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Marian Cichy <m.cichy@pengutronix.de>, Xinliang Liu <xinliang.liu@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Alexey Kodanev <aleksei.kodanev@bell-sw.com>, dri-devel@lists.freedesktop.org, Vandita Kulkarni <vandita.kulkarni@intel.com>, Alim Akhtar <alim.akhtar@samsung.com>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Marijn Suijten <marijn.suijten@somainline.org>, Jonathan Hunter <jonathanh@nvidia.com>, Arun R Murthy <arun.r.murthy@intel.com>, Jerome Brunet <jbrunet@baylibre.com>, Liu Shixin <liushixin2@huawei.com>, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Matt Roper <matthew.d.roper@intel.com>, Wenjing Liu <wenjing.liu@amd.com>, Javier Martinez Canillas <javierm@redhat.com>, Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, Danilo Krummrich <dakr@redhat.com>, NXP Linux Team <
 linux-imx@nxp.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, spice-devel@lists.freedesktop.org, Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, linux-sunxi@lists.linux.dev, Stylon Wang <stylon.wang@amd.com>, Tim Huang <Tim.Huang@amd.com>, Suraj Kandpal <suraj.kandpal@intel.com>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, Andi Shyti <andi.shyti@linux.intel.com>, Yifan Zhang <yifan1.zhang@amd.com>, Leo Li <sunpeng.li@amd.com>, Sascha Hauer <s.hauer@pengutronix.de>, Lucas De Marchi <lucas.demarchi@intel.com>, Inki Dae <inki.dae@samsung.com>, Hersen Wu <hersenxs.wu@amd.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>, Radhakrishna Sripada <radhakrishna.sripada@intel.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Manasi Navare <manasi.d.navare@intel.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nne
 s?= <noralf@tronnes.org>, kernel@pengutronix.de, Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@microchip.com>, Zack Rusin <zackr@vmware.com>, Gerd Hoffmann <kraxel@redhat.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>, Edmund Dea <edmund.j.dea@intel.com>, =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, virtualization@lists.linux-foundation.org, Thierry Reding <thierry.reding@gmail.com>, Yongqin Liu <yongqin.liu@linaro.org>, Mario Limonciello <mario.limonciello@amd.com>, Fei Yang <fei.yang@intel.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, David Lechner <david@lechnology.com>, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>, David Francis <David.Francis@amd.com>, Aaron Liu <aaron.liu@amd.com>, Patrik Jakobsson <p
 atrik.r.jakobsson@gmail.com>, Vinod Polimera <quic_vpolimer@quicinc.com>, linux-rockchip@lists.infradead.org, Fangzhi Zuo <jerry.zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>, VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>, Ben Skeggs <bskeggs@redhat.com>, =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>, Dave Airlie <airlied@redhat.com>, linux-mips@vger.kernel.org, Graham Sider <Graham.Sider@amd.com>, Gurchetan Singh <gurchetansingh@chromium.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, Animesh Manna <animesh.manna@intel.com>, linux-renesas-soc@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>, Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org, Evan Quan <evan.quan@amd.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro
 .org>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Boris Brezillon <bbrezillon@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, Sandy Huang <hjc@rock-chips.com>, Swati Sharma <swati2.sharma@intel.com>, John Stultz <jstultz@google.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Kyungmin Park <kyungmin.park@samsung.com>, Drew Davenport <ddavenport@chromium.org>, Kevin Hilman <khilman@baylibre.com>, Hawking Zhang <Hawking.Zhang@amd.com>, Haneen Mohammed <hamohammed.sa@gmail.com>, Anusha Srivatsa <anusha.srivatsa@intel.com>, Dan Carpenter <error27@gmail.com>, Karol Herbst <kherbst@redhat.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, linux-hyperv@vger.kernel.org, Stefan Agner <stefan@agner.ch>, Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, Luca Coelho <luciano.coelho@intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Likun Gao 
 <Likun.Gao@amd.com>, Sam Ravnborg <sam@ravnborg.org>, Alain Volmat <alain.volmat@foss.st.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Deepak Rawat <drawat.floss@gmail.com>, Chen-Yu Tsai <wens@csie.org>, xurui <xurui@kylinos.cn>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Harry Wentland <harry.wentland@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>, Alan Liu <haoping.liu@amd.com>, Philip Yang <Philip.Yang@amd.com>, Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org, Alison Wang <alison.wang@nxp.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Gustavo Sousa <gustavo.sousa@intel.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, Mikko Perttunen <mperttunen@nvidia.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Tomi Valkeinen <tomba@kernel.o
 rg>, Deepak R Varma <drv@mailo.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, Chia-I Wu <olvaffe@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Khaled Almahallawy <khaled.almahallawy@intel.com>, linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Imre Deak <imre.deak@intel.com>, Liviu Dudau <liviu.dudau@arm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Roman Li <roman.li@amd.com>, Paul Cercueil <paul@crapouillou.net>, Rob Clark <robdclark@gmail.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>, David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, xen-devel@lists.xenproject.org, Guchun Chen <guchun.chen@amd.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Raph
 ael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Russell King <linux@armlinux.org.uk>, Uma Shankar <uma.shankar@intel.com>, Mika Kahola <mika.kahola@intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jiasheng Jiang <jiasheng@iscas.ac.cn>, Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>, Vinod Govindapillai <vinod.govindapillai@intel.com>, linux-tegra@vger.kernel.org, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>, Melissa Wen <mwen@igalia.com>, Hans de Goede <hdegoede@redhat.com>, linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, David Tadokoro <davidbtadokoro@usp.br>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Orson Zh
 ai <orsonzhai@gmail.com>, amd-gfx@lists.freedesktop.org, Jyri Sarha <jyri.sarha@iki.fi>, Yannick Fertre <yannick.fertre@foss.st.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Philippe Cornu <philippe.cornu@foss.st.com>, Daniel Vetter <daniel@ffwll.ch>, Wayne Lin <Wayne.Lin@amd.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Nirmoy Das <nirmoy.das@intel.com>, Lang Yu <Lang.Yu@amd.com>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jul 12, 2023 at 10:52=E2=80=AFAM Jani Nikula <jani.nikula@intel.com=
> wrote:
>
> On Wed, 12 Jul 2023, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.d=
e> wrote:
> > Hello,
> >
> > while I debugged an issue in the imx-lcdc driver I was constantly
> > irritated about struct drm_device pointer variables being named "dev"
> > because with that name I usually expect a struct device pointer.
> >
> > I think there is a big benefit when these are all renamed to "drm_dev".
> > I have no strong preference here though, so "drmdev" or "drm" are fine
> > for me, too. Let the bikesheding begin!
> >
> > Some statistics:
> >
> > $ git grep -ohE 'struct drm_device *\* *[^ (),;]*' v6.5-rc1 | sort | un=
iq -c | sort -n
> >       1 struct drm_device *adev_to_drm
> >       1 struct drm_device *drm_
> >       1 struct drm_device          *drm_dev
> >       1 struct drm_device        *drm_dev
> >       1 struct drm_device *pdev
> >       1 struct drm_device *rdev
> >       1 struct drm_device *vdev
> >       2 struct drm_device *dcss_drv_dev_to_drm
> >       2 struct drm_device **ddev
> >       2 struct drm_device *drm_dev_alloc
> >       2 struct drm_device *mock
> >       2 struct drm_device *p_ddev
> >       5 struct drm_device *device
> >       9 struct drm_device * dev
> >      25 struct drm_device *d
> >      95 struct drm_device *
> >     216 struct drm_device *ddev
> >     234 struct drm_device *drm_dev
> >     611 struct drm_device *drm
> >    4190 struct drm_device *dev
> >
> > This series starts with renaming struct drm_crtc::dev to drm_dev. If
> > it's not only me and others like the result of this effort it should be
> > followed up by adapting the other structs and the individual usages in
> > the different drivers.
>
> I think this is an unnecessary change. In drm, a dev is usually a drm
> device, i.e. struct drm_device *. As shown by the numbers above.
>

I'd really prefer this patch (series or single) is not accepted. This
will cause problems for everyone cherry-picking patches to a
downstream kernel (LTS or distro tree). I usually wouldn't expect
sympathy here, but the questionable benefit does not outweigh the cost
IM[biased]O.

Sean

> If folks insist on following through with this anyway, I'm firmly in the
> camp the name should be "drm" and nothing else.
>
>
> BR,
> Jani.
>
>
> --
> Jani Nikula, Intel Open Source Graphics Center
