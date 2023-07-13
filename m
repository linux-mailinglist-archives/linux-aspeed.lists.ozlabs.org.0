Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1372755E37
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jul 2023 10:16:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cEdjmfeX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4FKV4SVmz2yVv
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jul 2023 18:16:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cEdjmfeX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::c2f; helo=mail-oo1-xc2f.google.com; envelope-from=seanpaul@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1y584mpxz3bVS
	for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jul 2023 00:42:51 +1000 (AEST)
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-56661fe27cbso581167eaf.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 13 Jul 2023 07:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689259367; x=1691851367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKItIj72hAMISxrHuiptAazhKs3+4zy1JRueUjGy5Ew=;
        b=cEdjmfeXKzDbcqzPoSZKqks0O9vBufmVYGyXs8K915ZjnTB0q3a5GLkkGXVL79AT5h
         EXB0SNLqveAElGZ97mva7RkFcmBTRCT90QNjR+3Z3YZm8l3QyWNocPuBXK5HY77Y/gC/
         snzkwo51wu5ffcidU2FnbuTwjI52zHeDJtAH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689259367; x=1691851367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKItIj72hAMISxrHuiptAazhKs3+4zy1JRueUjGy5Ew=;
        b=kE9CsoO/TXZEmKj/OTR/1pMkKCzHLXnLMZqBDCFbnGX3vU16xVDqjbmBlf8wQNVV+a
         yqRjHAOUjuwW4rzGPM8ZCR9frX+dCn7kUTH4JPmT6aRq7PX0PRtyCi8lOGLfasaJoB87
         haKiQfV5aio/4GAj7GqSy7jlkAbHmdEBnOPjA07P3SpTgICurj6hDrxWRwjDikv7kJvD
         PLryoB32CBuQkcBLcXpY6TVJX+5O0AwzaJpRVe20IeLih8USFk5+cZGDVxG0UMvmJRuL
         Q3Li1JqQfT0hrqK3C4xvImV3V+jrz8fTE25OyPyWqp6xV4wtv24I9stMU/B9s/JOWaDP
         W1xA==
X-Gm-Message-State: ABy/qLZie3jchV6m22xNdbTNre1ItJcHaWAiyqkF3d4UmIMxGYRK/G34
	d/n3W7+mP9RbJpCzMGNU5cUiyVpSk9jyv8HFVl98mvYx
X-Google-Smtp-Source: APBJJlH8tfC3IhjNepKqGF2Sovirf13OOXvZ1d+ZffHopBhu0U19ziXAPdeNowec5yXJgs8JhziB0g==
X-Received: by 2002:a4a:2517:0:b0:566:fd47:eb5 with SMTP id g23-20020a4a2517000000b00566fd470eb5mr1573568ooa.0.1689259366942;
        Thu, 13 Jul 2023 07:42:46 -0700 (PDT)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com. [209.85.161.48])
        by smtp.gmail.com with ESMTPSA id x17-20020a4a97d1000000b0054f85f67f31sm2924318ooi.46.2023.07.13.07.42.43
        for <linux-aspeed@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 07:42:46 -0700 (PDT)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-565f8e359b8so585463eaf.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 13 Jul 2023 07:42:43 -0700 (PDT)
X-Received: by 2002:a05:6902:211:b0:c8b:3:e399 with SMTP id
 j17-20020a056902021100b00c8b0003e399mr1398441ybs.44.1689259342555; Thu, 13
 Jul 2023 07:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <87fs5tgpvv.fsf@intel.com> <CAOw6vbLO_UaXDbTCtAQJgthXOUMPqEV+c2MQhP-1DuK44OhGxw@mail.gmail.com>
 <20230713130337.fd2l67r23g2irifx@pengutronix.de>
In-Reply-To: <20230713130337.fd2l67r23g2irifx@pengutronix.de>
From: Sean Paul <seanpaul@chromium.org>
Date: Thu, 13 Jul 2023 10:41:45 -0400
X-Gmail-Original-Message-ID: <CAOw6vbKtjyUm+OqO7LSV1hDOMQATwkEWP4GzBbbXib0i5EviUQ@mail.gmail.com>
Message-ID: <CAOw6vbKtjyUm+OqO7LSV1hDOMQATwkEWP4GzBbbXib0i5EviUQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH RFC v1 00/52] drm/crtc: Rename struct
 drm_crtc::dev to drm_dev
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Xinliang Liu <xinliang.liu@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Alexey Kodanev <aleksei.kodanev@bell-sw.com>, dri-devel@lists.freedesktop.org, Vandita Kulkarni <vandita.kulkarni@intel.com>, Alim Akhtar <alim.akhtar@samsung.com>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Marijn Suijten <marijn.suijten@somainline.org>, Jonathan Hunter <jonathanh@nvidia.com>, Arun R Murthy <arun.r.murthy@intel.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Matt Roper <matthew.d.roper@intel.com>, Wenjing Liu <wenjing.liu@amd.com>, Javier Martinez Canillas <javierm@redhat.com>, Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, Danilo Krummrich <dakr@redhat.com>, NXP Linux Team <linux-imx@nxp.com>, spice-devel@lists.freedesktop.org, Niranjana Vishwanathapura <niranjana.vi
 shwanathapura@intel.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-sunxi@lists.linux.dev, Matthias Brugger <matthias.bgg@gmail.com>, Stylon Wang <stylon.wang@amd.com>, Tim Huang <Tim.Huang@amd.com>, Suraj Kandpal <suraj.kandpal@intel.com>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, Mika Kahola <mika.kahola@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Leo Li <sunpeng.li@amd.com>, Sascha Hauer <s.hauer@pengutronix.de>, Lucas De Marchi <lucas.demarchi@intel.com>, Inki Dae <inki.dae@samsung.com>, Hersen Wu <hersenxs.wu@amd.com>, Dave Airlie <airlied@redhat.com>, Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>, Radhakrishna Sripada <radhakrishna.sripada@intel.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de, Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedeskt
 op.org, Claudiu Beznea <claudiu.beznea@microchip.com>, Zack Rusin <zackr@vmware.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>, =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, virtualization@lists.linux-foundation.org, Thierry Reding <thierry.reding@gmail.com>, Yongqin Liu <yongqin.liu@linaro.org>, Mario Limonciello <mario.limonciello@amd.com>, Fei Yang <fei.yang@intel.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, David Francis <David.Francis@amd.com>, Vinod Govindapillai <vinod.govindapillai@intel.com>, Aaron Liu <aaron.liu@amd.com>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Vinod Polimera <quic_vpolimer@quicinc.com>, linux-rockchip@lists.infradead.org, Fangzhi Zuo <jerr
 y.zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>, VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>, Ben Skeggs <bskeggs@redhat.com>, =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, Animesh Manna <animesh.manna@intel.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Maxime Ripard <mripard@kernel.org>, Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>, Tian Tao <tiantao6@hisilicon.com>, Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org, Evan Quan <evan.quan@amd.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Boris Brezillon <bbrezillon@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>, Sandy Huang <hjc@roc
 k-chips.com>, Swati Sharma <swati2.sharma@intel.com>, linux-renesas-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Hawking Zhang <Hawking.Zhang@amd.com>, Haneen Mohammed <hamohammed.sa@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Anusha Srivatsa <anusha.srivatsa@intel.com>, Dan Carpenter <error27@gmail.com>, Karol Herbst <kherbst@redhat.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, linux-hyperv@vger.kernel.org, Stefan Agner <stefan@agner.ch>, Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, Luca Coelho <luciano.coelho@intel.com>, Gerd Hoffmann <kraxel@redhat.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Likun Gao <Likun.Gao@amd.com>, "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>, Emma Anholt <emma@anholt.net>, Alain Volmat <alain.volmat@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Deepak
  Rawat <drawat.floss@gmail.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Orson Zhai <orsonzhai@gmail.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Harry Wentland <harry.wentland@amd.com>, Chia-I Wu <olvaffe@gmail.com>, Alan Liu <haoping.liu@amd.com>, Philip Yang <Philip.Yang@amd.com>, Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org, Alison Wang <alison.wang@nxp.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Gustavo Sousa <gustavo.sousa@intel.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Daniel Vetter <daniel@ffwll.ch>, Mikko Perttunen <mperttunen@nvidia.com>, Yifan Zhang <yifan1.zhang@amd.com>, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Tomi Valkeinen <tomba@kernel.org>, Deepak R Varma <drv@mailo.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Joh
 n Stultz <jstultz@google.com>, Roman Li <roman.li@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Khaled Almahallawy <khaled.almahallawy@intel.com>, linux-stm32@st-md-mailman.stormreply.com, Sam Ravnborg <sam@ravnborg.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Imre Deak <imre.deak@intel.com>, Liviu Dudau <liviu.dudau@arm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Gurchetan Singh <gurchetansingh@chromium.org>, Liu Shixin <liushixin2@huawei.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Hamza Mahfooz <hamza.mahfooz@amd.com>, David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Lang Yu <Lang.Yu@amd.com>, xen-devel@lists.xenproject.org, Guchun Chen <guchun.chen@amd.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Russell 
 King <linux@armlinux.org.uk>, Jani Nikula <jani.nikula@intel.com>, Uma Shankar <uma.shankar@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>, Jiasheng Jiang <jiasheng@iscas.ac.cn>, Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, David Lechner <david@lechnology.com>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>, Melissa Wen <mwen@igalia.com>, Hans de Goede <hdegoede@redhat.com>, linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org, David Tadokoro <davidbtadokoro@usp.br>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, Yannick Fertre <yannick.fertre@foss.st.com>, linux-mips@vger.kernel.org, Rob Clark <robdclark@
 gmail.com>, Philippe Cornu <philippe.cornu@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, Wayne Lin <Wayne.Lin@amd.com>, Drew Davenport <ddavenport@chromium.org>, Nirmoy Das <nirmoy.das@intel.com>, Jyri Sarha <jyri.sarha@iki.fi>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Jul 13, 2023 at 9:04=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> hello Sean,
>
> On Wed, Jul 12, 2023 at 02:31:02PM -0400, Sean Paul wrote:
> > I'd really prefer this patch (series or single) is not accepted. This
> > will cause problems for everyone cherry-picking patches to a
> > downstream kernel (LTS or distro tree). I usually wouldn't expect
> > sympathy here, but the questionable benefit does not outweigh the cost
> > IM[biased]O.
>
> I agree that for backports this isn't so nice. However with the split
> approach (that was argumented against here) it's not soo bad. Patch #1
> (and similar changes for the other affected structures) could be
> trivially backported and with that it doesn't matter if you write dev or
> drm (or whatever name is chosen in the end); both work in the same way.

Patch #1 avoids the need to backport the entire set, however every
change occuring after the rename patches will cause conflicts on
future cherry-picks. Downstream kernels will have to backport the
whole set. Backporting the entire set will create an epoch in
downstream kernels where cherry-picking patches preceding this set
will need to undergo conflict resolution as well. As mentioned in my
previous email, I don't expect sympathy here, it's part of maintaining
a downstream kernel, but there is a real cost to kernel consumers.

>
> But even with the one-patch-per-rename approach I'd consider the
> renaming a net win, because ease of understanding code has a big value.
> It's value is not so easy measurable as "conflicts when backporting",
> but it also matters in say two years from now, while backporting
> shouldn't be an issue then any more.

You've rightly identified the conjecture in your statement. I've been
on both sides of the argument, having written/maintained drm code
upstream and cherry-picked changes to a downstream kernel. Perhaps
it's because drm's definition of dev is ingrained in my muscle memory,
or maybe it's because I don't do a lot of upstream development these
days, but I just have a hard time seeing the benefit here.

I appreciate your engagement on the topic, thank you!

Sean

>
> Thanks for your input, best regards
> Uwe
>
> --
> Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig       =
     |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ =
|
