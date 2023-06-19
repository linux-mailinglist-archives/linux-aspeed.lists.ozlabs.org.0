Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EC77394C4
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Jun 2023 03:41:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qmjkr6czrz30N3
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Jun 2023 11:41:08 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.175; helo=mail-pf1-f175.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ql9Wk4VBZz30Px
	for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Jun 2023 23:26:08 +1000 (AEST)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-666e916b880so1146317b3a.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Jun 2023 06:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687181165; x=1689773165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEGefi/onIC0eCyepJlH8hSgTT8IMaedG+S+Kvs9SIU=;
        b=b7XvRMdiXqc/HkIbaBOD9L+k7O8HQhXUiCJyq6b9BCVe14xnSXn3C+sNagkIRPLOSO
         jQsds0LzOwJ3besKtbRmZhk3UrMlC2l1ncjDRfVxQ0tndyjE4uw+CXiiV/KSHL/7o+mL
         P6EIggKFl+1SUqOvfjPYYClrLusXoO5yj7tG1iTol5v6WnRdpGlwQSr+e/lmFR4Slvnc
         6WEESEMJFjLhxvWzYQe9hhv0rHrSdF8SVaDZGgQuyN1TnGz0fAftZEinVvnSViBh/7u0
         GQXPjMCh82yIohpB4H4537WyDwzlSgr257dA7VcV3ZDFJPiUQbd5jTRPOfrecTvqO1kV
         MQVA==
X-Gm-Message-State: AC+VfDyzd6DPpScYvms2MKF8FLgFo4UagS245zpit4Lo71ZBk2tQFG7d
	ZsXrKrXyPfbLuQZ/K+kC849lyRbkeWQZd/B7
X-Google-Smtp-Source: ACHHUZ71QMoj+VkkWbgKYlJqNxN01OqRzQSPhfiTIYNAkdpKdK6H6L8d4qBWLsZQkQodm1kXwfRbAA==
X-Received: by 2002:a05:6a00:2d8d:b0:663:83ad:4809 with SMTP id fb13-20020a056a002d8d00b0066383ad4809mr1034721pfb.27.1687181164918;
        Mon, 19 Jun 2023 06:26:04 -0700 (PDT)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com. [209.85.216.50])
        by smtp.gmail.com with ESMTPSA id fe26-20020a056a002f1a00b006579b062d5dsm3498285pfb.21.2023.06.19.06.26.02
        for <linux-aspeed@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 06:26:03 -0700 (PDT)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-25ea3a6d714so1468521a91.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Jun 2023 06:26:02 -0700 (PDT)
X-Received: by 2002:a25:cb88:0:b0:bc6:5d71:f820 with SMTP id
 b130-20020a25cb88000000b00bc65d71f820mr932905ybg.55.1687181141903; Mon, 19
 Jun 2023 06:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de> <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230617161222.wy55pbomnrrlfy5u@pengutronix.de> <CAD=FV=U5gbMUNteyyFcTvHVBDWzfthM0aDirJC+yXGovDwMOBA@mail.gmail.com>
 <20230618123915.hmy66z7e532jhwgk@pengutronix.de> <jlq2xayh4dxfigfsh2fms2kt4hlrqcwxblffmqq7czbhqhhvz7@hsvol72f5i3y>
 <20230618162950.6th2yo66baqay5mv@pengutronix.de> <vxjp5c4wojcvbnp3ghsspwkgrc4mjmskzl56jkuxlgfhcji7kx@m3hg525p7y6a>
 <20230619105342.ugf5gz26gcalcsi6@pengutronix.de> <a6ex232lwyovzzazfh6jfvlwszppr2624czgcc5sa4nthkgecf@asauiw3rf4vi>
In-Reply-To: <a6ex232lwyovzzazfh6jfvlwszppr2624czgcc5sa4nthkgecf@asauiw3rf4vi>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jun 2023 15:25:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWERLXOa4bQvsb7=gx+Q=Hn8v=XJZxahV0j3Vw1xKUYiQ@mail.gmail.com>
Message-ID: <CAMuHMdWERLXOa4bQvsb7=gx+Q=Hn8v=XJZxahV0j3Vw1xKUYiQ@mail.gmail.com>
Subject: Re: patches dropped from drm-misc-next [Was: Re: [PATCH 00/53] drm:
 Convert to platform remove callback returning] void
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Raymond Tan <raymond.tan@intel.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Akhil P Oommen <quic_akhilpo@quicinc.com>, Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Alim Akhtar <alim.akhtar@samsung.com>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Marijn Suijten <marijn.suijten@somainline.org>, Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>, Karol Herbst <kherbst@redhat.com>, Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, Javier Martinez Canillas <javierm@redhat.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, Xinliang Liu <xinliang.liu@linaro.org>, Danilo Krummrich <dakr@redhat.com>, NXP Linux Team <linux-imx@nxp.com>, Miaoqian Lin <linmq006@gmail.com>, =?UTF-8?Q?Uwe_Kleine
 =2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-sunxi@lists.linux.dev, Rob Clark <robdclark@gmail.com>, Rahul T R <r-ravikumar@ti.com>, Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, etnaviv@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, Inki Dae <inki.dae@samsung.com>, Alain Volmat <alain.volmat@foss.st.com>, Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>, Hyun Kwon <hyun.kwon@xilinx.com>, Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de, Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.c
 om>, Mihail Atanassov <mihail.atanassov@arm.com>, Liang He <windhl@126.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, lima@lists.freedesktop.org, Chunyan Zhang <zhang.lyra@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>, Minghao Chi <chi.minghao@zte.com.cn>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Ben Skeggs <bskeggs@redhat.com>, Russell King <linux+etnaviv@armlinux.org.uk>, Jessica Zhang <quic_jesszhan@quicinc.com>, linux-mips@vger.kernel.org, Liu Ying <victor.liu@nxp.com>, linux-arm-msm@vger.kernel.org, Wang Jianzheng <wangjianzheng@vivo.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, Sandy Huang <hjc@rock-chips.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Kyungmin Park <kyungmin.park@samsung.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-med
 iatek@lists.infradead.org, Brian Starkey <brian.starkey@arm.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Yuan Can <yuancan@huawei.com>, Stefan Agner <stefan@agner.ch>, Michal Simek <michal.simek@xilinx.com>, linux-tegra@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Mali DP Maintainers <malidp@foss.arm.com>, nouveau@lists.freedesktop.org, Orson Zhai <orsonzhai@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Lyude Paul <lyude@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Guo Zhengkui <guozhengkui@vivo.com>, Konrad Dybcio <konrad.dybcio@somainline.org>, Alison Wang <alison.wang@nxp.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Christian Gmeiner <christian.gmeiner@gmail.com>, Mark Brown <broonie@kernel.org>, Baolin Wang <b
 aolin.wang@linux.alibaba.com>, Daniel Vetter <daniel@ffwll.ch>, Liu Shixin <liushixin2@huawei.com>, Tomi Valkeinen <tomba@kernel.org>, Deepak R Varma <drv@mailo.com>, Karol Wachowski <karol.wachowski@linux.intel.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Ricardo Ribalda <ribalda@chromium.org>, Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>, Yannick Fertre <yannick.fertre@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>, Liviu Dudau <liviu.dudau@arm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Doug Anderson <dianders@chromium.org>, Paul Cercueil <paul@crapouillou.net>, Laura Nao <laura.nao@collabora.com>, David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>, linux-renesas-soc@vger.kernel.org, Yongqin Liu <yongqin.liu@linaro.org>, Jayshri Pawar <jpawar@cadence.com>, Jonas Karlman <jonas@kwiboo.se>, Russell King <linux@armlinux.org.uk>, Martin Blumenstingl <martin.blumenstingl@googlemail.co
 m>, Philippe Cornu <philippe.cornu@foss.st.com>, Thomas Zimmermann <tzimmermann@suse.de>, Melissa Wen <mwen@igalia.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Fabio Estevam <festevam@gmail.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <andersson@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Qiang Yu <yuq825@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jyri Sarha <jyri.sarha@iki.fi>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Maxime,

CC sfr

On Mon, Jun 19, 2023 at 2:51=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Mon, Jun 19, 2023 at 12:53:42PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > On Mon, Jun 19, 2023 at 11:45:37AM +0200, Maxime Ripard wrote:
> > > On Sun, Jun 18, 2023 at 06:29:50PM +0200, Uwe Kleine-K=C3=B6nig wrote=
:
> > > > On Sun, Jun 18, 2023 at 04:32:55PM +0200, Maxime Ripard wrote:
> > > > > On Sun, Jun 18, 2023 at 02:39:15PM +0200, Uwe Kleine-K=C3=B6nig w=
rote:
> > > > > > On Sat, Jun 17, 2023 at 10:57:23AM -0700, Doug Anderson wrote:
> > > > > > > On Sat, Jun 17, 2023 at 9:15=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > > > > > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > > > > > Together with the patches that were applied later the topmo=
st commit
> > > > > > > > from this series is c2807ecb5290 ("drm/omap: Convert to pla=
tform remove
> > > > > > > > callback returning void"). This commit was part for the fol=
lowing next
> > > > > > > > tags:
> > > > > > > >
> > > > > > > >         $ git tag -l --contains c2807ecb5290
> > > > > > > >         next-20230609
> > > > > > > >         next-20230613
> > > > > > > >         next-20230614
> > > > > > > >         next-20230615
> > > > > > > >
> > > > > > > > However in next-20230616 they are missing. In next-20230616
> > > > > > > > drm-misc/for-linux-next was cf683e8870bd4be0fd6b98639286700=
a35088660.
> > > > > > > > Compared to c2807ecb5290 this adds 1149 patches but drops 3=
7 (that are
> > > > > > > > also not included with a different commit id). The 37 patch=
es dropped
> > > > > > > > are 13cdd12a9f934158f4ec817cf048fcb4384aa9dc..c2807ecb5290:
> > > > > > > >
> > > > > > > >         $ git shortlog -s 13cdd12a9f934158f4ec817cf048fcb43=
84aa9dc..c2807ecb5290
> > > > > > > >              1  Christophe JAILLET
> > > > > > > >              2  Jessica Zhang
> > > > > > > >              5  Karol Wachowski
> > > > > > > >              1  Laura Nao
> > > > > > > >             27  Uwe Kleine-K=C3=B6nig
> > > > > > > >              1  Wang Jianzheng
> > > > > > > >
> > > > > > > >
> > > > > > > > I guess this was done by mistake because nobody told me abo=
ut dropping
> > > > > > > > my/these patches? Can c2807ecb5290 please be merged into dr=
m-misc-next
> > > > > > > > again?
> > > > > > >
> > > > > > > Actually, it was probably a mistake that these patches got me=
rged to
> > > > > > > linuxnext during the 4 days that you noticed. However, your p=
atches
> > > > > > > aren't dropped and are still present in drm-misc-next.
> > > > > > >
> > > > > > > drm-misc has a bit of a unique model and it's documented fair=
ly well here:
> > > > > > >
> > > > > > > https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.h=
tml
> > > > > >
> > > > > > Is there a flaw then in this unique model (or its implementatio=
n) when
> > > > > > drm-misc/for-linux-next moves in a non-fast-forward manner? Thi=
s isn't
> > > > > > expected, is it?
> > > > >
> > > > > There's no expectation afaik. Any tree merged in linux-next can b=
e
> > > > > rebased, drop a patch, amend one, etc. without any concern.
> > > >
> > > > I agree that there are no rules broken for a tree that is included =
in
> > > > next and a maintainer is free to rewrite their tree independant of =
the
> > > > tree being included in next.
> > > >
> > > > Still I think that shouldn't be used as an excuse.
> > >
> > > As an excuse for what?
> >
> > Just because the rules for trees in next allow the merged branch to be
> > rewritten, shouldn't be used to justify rewriting the branch.
> >
> > IMHO you still should ensure that only commits make it into any next
> > snapshot via your tree before X-rc1 for some X (e.g. v6.5) that you
> > intend to be included in X-rc1.
>
> That's never been a next rule either. Rust support has been in next for
> almost a year without being sent as a PR for example.

https://elixir.bootlin.com/linux/latest/source/Documentation/process/2.Proc=
ess.rst#L297

   "The linux-next tree is, by design, a snapshot of what the mainline
    is expected to look like after the next merge window closes."

The general rule for linux-next is that its contents are intended to end
up in the next kernel release, and that it should not contain commits
that are intended for the next-next release, cfr. what Stephen sends
out to new trees:

   "You will need to ensure that the patches/commits in your tree/series ha=
ve
    been:
            [...]
         * destined for the current or next Linux merge window."

and what he requests regularly in his announces, e.g.:

   "Please do not add any v6.4 related commits to your linux-next included
    branches until after v6.3-rc1 has been released."

AFAIU, the exception to the rule is new, self-contained, and sometimes
controversial development, which may have to cook for a few more cycles,
if it ends up in a PR at all.

> > > > For me, if a maintainer puts some patch into next that's a statemen=
t
> > > > saying (approximately) "I think this patch is fine and I intend to
> > > > send it to Linus during the next merge window.".
> > >
> > > I mean, that's what we're saying and doing?
> >
> > No, on 2023-06-09 I assumed that my patches will go into v6.5-rc1 (as i=
t
> > was part of next-20230609). A few days later however the patches were
> > dropped.
> >
> > The two options that would have made the experience smoother for me are=
:
> >
> >  a) keep c2807ecb5290 in next and send it for v6.5-rc1; or
>
> That's not an option. You were simply too late for v6.5-rc1, unless you
> expect us to get rid of timezones and work on week-ends. But surely you
> don't.

I don't think anyone expects you to do that...

> >  b) keep c2807ecb5290 in a branch that doesn't result it entering next
> >     before v6.5-rc1.
>
> All the drm-misc committers use dim. If that's a concern for you, feel
> free to send a patch addressing this to dim.

So you say this is an issue with the tooling? ;-)
If the tooling breaks the rules, perhaps the tooling should be fixed?

> > > > So my expectation is that if a patch is dropped again from next, th=
ere
> > > > was a problem and it would be fair if the maintainer tells the
> > > > author/submitter about this problem and that the patch was dropped.
> > >
> > > But it wasn't dropped,
> >
> > From my POV it was dropped from next as it was part of next between
> > next-20230609 and next-20230615 but not any more since next-20230616.
> > You talk about (not) being dropped from some branch in drm-misc, that's
> > irrelevant for the thing I'm complaining about.
>
> You were never told that they were merged in linux-next, but in
> drm-misc-next. If they did, it's mostly an unfortunate artifact.
>
> We have a documentation that explains the process and how drm-misc-next
> works. If that's still confusing somehow, feel free to amend it to make
> it clearer.

Why that document may apply to drm-misc-next, everything that appears
in linux-next should follow the linux-next process
https://elixir.bootlin.com/linux/latest/source/Documentation/process/2.Proc=
ess.rst#L256

> > > it's still very much to be sent to Linus during the next merge window=
.
> >
> > "next merge window" as in the one leading to 6.5-rc1? Either we mean
> > different things when we say "next merge window", or there is a
> > misunderstanding I don't see yet.
>
> Linus doesn't want to receive in a PR patches that haven't been in
> linux-next for at least two weeks. In most cases that's rc6, which means
> that by the time we send our last PR before rc6, the
> next-merge-window-while-still-meeting-Linus-requirements is 6.6.
>
> The rule applies to all trees, and it's why the soc tree also requires
> its submaintainers to submit their PR before -rc6.

Unless there's a very good reason to deviate from that (e.g. a bug fix).

> So yeah, sorry if it was confusing. At the end of the day, it's a
> compromise, and I can't find a better one for everyone involved
> (maintainers, contributors and committers alike) off the top of my head.

As I understand, the main issue Uwe is objecting to, is that his
patches ended up in linux-next first, only to be dropped again from
linux-next later, and that there was no communication about the
latter.

If you're not constantly working on a subsystem, it can be very hard
to keep track of the status of your own drive-by patches. When patches
get applied, appear in linux-next, and disappear from linux-next again
later, it's worse...

Thanks for your understanding!

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
