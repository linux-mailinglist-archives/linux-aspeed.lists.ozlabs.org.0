Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B44707A4136
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Sep 2023 08:31:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MAFuoQVe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rpw0f4VP3z3c2t
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Sep 2023 16:30:58 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MAFuoQVe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm8FX3TC4z3c1H
	for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Sep 2023 04:32:30 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9aa2c6f0806so18319466b.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 11:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694629946; x=1695234746; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+kAAaz8DPw8hDMu58WJTq8XnZOBUPzC1oE9LVRkCzk=;
        b=MAFuoQVeJVJrmw5g33vndcAS/Nq/Yq5Udj48CMyJYD5khZnc7NLeEbAnFONJ33PSnp
         3f/wDLkvb/EsvHja6g9Z9uyL305s31tE81L/7f2RIYEOScvtRJ4tkDZIYP099Q4KkMFh
         QnLVr0yXuwYAu970UHhRHNY/hhsVrtASld5IQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694629946; x=1695234746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z+kAAaz8DPw8hDMu58WJTq8XnZOBUPzC1oE9LVRkCzk=;
        b=MMq5JCHfdg26+ZvNtsbn+huAJ+zFGByjUdBmFU+cYzzEI4+ky3nYAfvP3qkRsIxRPO
         yvPTq1JX7+c8JOuMDE/byHF0IXzZlcd2JMSC0b2PNBw6ewIVPLCLFlPE66njBd44VvYf
         jfQLkEfvUTeysN9RQ76xnntV75HhhYqR63dDxnyu3SQ4+zcCwd0TijhP/uZdYRaYbST3
         U3I4ZqrcUXEs0sUZuVInXIL8oNy+oxXzozgIBuuQTl84f5UT9kAAkPPjVoPWuTQkFsQR
         XEDyb29VLaSfaY1n4lLloTgXlqCCSOhRV1D+jsgFt3Zilngw1/IbFl6anXPyv2W9DXDO
         gEPA==
X-Gm-Message-State: AOJu0YybYrjQF+ALy7mOfCh8jbEy53rb9cmkpRSmbbG0+kxg3NZ/6264
	cnQhxmsjWj0PTbISYaEcf1nuw7YyQ2glMqsg2w+BnexV
X-Google-Smtp-Source: AGHT+IGd9Ift2+ZrZfBT4WLGEVvaw2MDabVV0O2CP//AD7t45VXkFh7IwT/1lYxDOcjp0DLtBNk3UQ==
X-Received: by 2002:a17:907:7742:b0:9a5:d657:47ee with SMTP id kx2-20020a170907774200b009a5d65747eemr2839779ejc.58.1694629946690;
        Wed, 13 Sep 2023 11:32:26 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id n3-20020a1709061d0300b0099bd046170fsm8844123ejh.104.2023.09.13.11.32.26
        for <linux-aspeed@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 11:32:26 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-52fa364f276so2125a12.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 11:32:26 -0700 (PDT)
X-Received: by 2002:a05:600c:1c24:b0:401:a494:2bbb with SMTP id
 j36-20020a05600c1c2400b00401a4942bbbmr161937wms.5.1694629925852; Wed, 13 Sep
 2023 11:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234015.566018-1-dianders@chromium.org>
In-Reply-To: <20230901234015.566018-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 13 Sep 2023 11:31:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=US2G_s8_UtaRMBDLgOJqJzDzxMpg0C0wJ3TabUsuZsGg@mail.gmail.com>
Message-ID: <CAD=FV=US2G_s8_UtaRMBDLgOJqJzDzxMpg0C0wJ3TabUsuZsGg@mail.gmail.com>
Subject: Re: [RFT PATCH 0/6] drm: drm-misc drivers call drm_atomic_helper_shutdown()
 at the right times
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 18 Sep 2023 16:30:23 +1000
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
Cc: sumit.semwal@linaro.org, alexandre.belloni@bootlin.com, emma@anholt.net, xinliang.liu@linaro.org, tomi.valkeinen@ideasonboard.com, linus.walleij@linaro.org, liviu.dudau@arm.com, alexandre.torgue@foss.st.com, stefan@agner.ch, nicolas.ferre@microchip.com, wens@csie.org, jstultz@google.com, kraxel@redhat.com, airlied@gmail.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, yongqin.liu@linaro.org, linux-aspeed@lists.ozlabs.org, samuel@sholland.org, sam@ravnborg.org, javierm@redhat.com, jernej.skrabec@gmail.com, steven.price@arm.com, drawat.floss@gmail.com, kong.kongxinwei@hisilicon.com, u.kleine-koenig@pengutronix.de, alain.volmat@foss.st.com, spice-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, suijingfeng@loongson.cn, mcoquelin.stm32@gmail.com, linux-hyperv@vger.kernel.org, raphael.gallais-pou@foss.st.com, alison.wang@nxp.com, maarten.lankhorst@linux.intel.com, hdegoede@redhat.com, airlied@redhat.com, virtualization@lists.linux-foundation.org, linux-arm-kern
 el@lists.infradead.org, jfalempe@redhat.com, bbrezillon@kernel.org, tzimmermann@suse.de, yannick.fertre@foss.st.com, linux-kernel@vger.kernel.org, christian.koenig@amd.com, paul.kocialkowski@bootlin.com, philippe.cornu@foss.st.com, daniel@ffwll.ch, alexander.deucher@amd.com, tiantao6@hisilicon.com, jyri.sarha@iki.fi, claudiu.beznea@microchip.com, zackr@vmware.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi,

On Fri, Sep 1, 2023 at 4:40=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:
>
>
> NOTE: in order to avoid email sending limits on the cover letter, I've
> split this patch series in two. Patches that target drm-misc and ones
> that don't. The cover letter of the two is identical other than this note=
.
>
> This patch series came about after a _long_ discussion between me and
> Maxime Ripard in response to a different patch I sent out [1]. As part
> of that discussion, we realized that it would be good if DRM drivers
> consistently called drm_atomic_helper_shutdown() properly at shutdown
> and driver remove time as it's documented that they should do. The
> eventual goal of this would be to enable removing some hacky code from
> panel drivers where they had to hook into shutdown themselves because
> the DRM driver wasn't calling them.
>
> It turns out that quite a lot of drivers seemed to be missing
> drm_atomic_helper_shutdown() in one or both places that it was
> supposed to be. This patch series attempts to fix all the drivers that
> I was able to identify.
>
> NOTE: fixing this wasn't exactly cookie cutter. Each driver has its
> own unique way of setting itself up and tearing itself down. Some
> drivers also use the component model, which adds extra fun. I've made
> my best guess at solving this and I've run a bunch of compile tests
> (specifically, allmodconfig for amd64, arm64, and powerpc). That being
> said, these code changes are not totally trivial and I've done zero
> real testing on them. Making these patches was also a little mind
> numbing and I'm certain my eyes glazed over at several points when
> writing them. What I'm trying to say is to please double-check that I
> didn't do anything too silly, like cast your driver's drvdata to the
> wrong type. Even better, test these patches!
>
> I've organized this series like this:
> 1. One patch for all simple cases of just needing a call at shutdown
>    time for drivers that go through drm-misc.
> 2. A separate patch for "drm/vc4", even though it goes through
>    drm-misc, since I wanted to leave an extra note for that one.
> 3. Patches for drivers that just needed a call at shutdown time for
>    drivers that _don't_ go through drm-misc.
> 4. Patches for the few drivers that had the call at shutdown time but
>    lacked it at remove time.
> 5. One patch for all simple cases of needing a call at shutdown and
>    remove (or unbind) time for drivers that go through drm-misc.
> 6. A separate patch for "drm/hisilicon/kirin", even though it goes
>    through drm-misc, since I wanted to leave an extra note for that
>    one.
> 7. Patches for drivers that needed a call at shutdown and remove (or
>    unbind) time for drivers that _don't_ go through drm-misc.
>
> I've labeled this patch series as RFT (request for testing) to help
> call attention to the fact that I didn't personally test any of these
> patches.
>
> If you're a maintainer of one of these drivers and you think that the
> patch for your driver looks fabulous, you've tested it, and you'd like
> to land it right away then please do. For non-drm-misc drivers there
> are no dependencies here. Some of the drm-misc drivers depend on the
> first patch, AKA ("drm/atomic-helper: drm_atomic_helper_shutdown(NULL)
> should be a noop"). I've tried to call this out but it also should be
> obvious once you know to look for it.
>
> I'd like to call out a few drivers that I _didn't_ fix in this series
> and why. If any of these drivers should be fixed then please yell.
> - DRM driers backed by usb_driver (like gud, gm12u320, udl): I didn't
> add the call to drm_atomic_helper_shutdown() at shutdown time
> because there's no ".shutdown" callback for them USB drivers. Given
> that USB is hotpluggable, I'm assuming that they are robust against
> this and the special shutdown callback isn't needed.
> - ofdrm and simpledrm: These didn't have drm_atomic_helper_shutdown()
> in either shutdown or remove, but I didn't add it. I think that's OK
> since they're sorta special and not really directly controlling
> hardware power sequencing.
> - virtio, vkms, vmwgfx, xen: I believe these are all virtual (thus
> they wouldn't directly drive a panel) and adding the shutdown
> didn't look straightforward, so I skipped them.
>
> I've let each patch in the series get CCed straight from
> get_maintainer. That means not everyone will have received every patch
> but everyone should be on the cover letter. I know some people dislike
> this but when touching this many drivers there's not much
> choice. dri-devel and lkml have been CCed and lore/lei exist, so
> hopefully that's enough for folks. I'm happy to add people to the
> whole series for future posts.
>
> [1] https://lore.kernel.org/lkml/20230804140605.RFC.4.I930069a32baab6faf4=
6d6b234f89613b5cec0f14@changeid
>
>
> Douglas Anderson (6):
>   drm/atomic-helper: drm_atomic_helper_shutdown(NULL) should be a noop
>   drm: Call drm_atomic_helper_shutdown() at shutdown time for misc
>     drivers
>   drm/vc4: Call drm_atomic_helper_shutdown() at shutdown time
>   drm/ssd130x: Call drm_atomic_helper_shutdown() at remove time
>   drm: Call drm_atomic_helper_shutdown() at shutdown/remove time for
>     misc drivers
>   drm/hisilicon/kirin: Call drm_atomic_helper_shutdown() at
>     shutdown/unbind time
>
>  .../gpu/drm/arm/display/komeda/komeda_drv.c   |  9 +++++
>  .../gpu/drm/arm/display/komeda/komeda_kms.c   |  7 ++++
>  .../gpu/drm/arm/display/komeda/komeda_kms.h   |  1 +
>  drivers/gpu/drm/arm/hdlcd_drv.c               |  6 ++++
>  drivers/gpu/drm/arm/malidp_drv.c              |  6 ++++
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  7 ++++
>  drivers/gpu/drm/ast/ast_drv.c                 |  6 ++++
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  6 ++++
>  drivers/gpu/drm/drm_atomic_helper.c           |  3 ++
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  8 +++++
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  6 ++++
>  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  9 +++++
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c       |  6 ++++
>  drivers/gpu/drm/logicvc/logicvc_drm.c         |  9 +++++
>  drivers/gpu/drm/loongson/lsdc_drv.c           |  6 ++++
>  drivers/gpu/drm/mcde/mcde_drv.c               |  9 +++++
>  drivers/gpu/drm/mgag200/mgag200_drv.c         |  8 +++++
>  drivers/gpu/drm/omapdrm/omap_drv.c            |  8 +++++
>  drivers/gpu/drm/pl111/pl111_drv.c             |  7 ++++
>  drivers/gpu/drm/qxl/qxl_drv.c                 |  7 ++++
>  drivers/gpu/drm/solomon/ssd130x.c             |  1 +
>  drivers/gpu/drm/sti/sti_drv.c                 |  7 ++++
>  drivers/gpu/drm/stm/drv.c                     |  7 ++++
>  drivers/gpu/drm/sun4i/sun4i_drv.c             |  6 ++++
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c           | 11 +++++-
>  drivers/gpu/drm/tiny/bochs.c                  |  6 ++++
>  drivers/gpu/drm/tiny/cirrus.c                 |  6 ++++
>  drivers/gpu/drm/tve200/tve200_drv.c           |  7 ++++
>  drivers/gpu/drm/vboxvideo/vbox_drv.c          | 10 ++++++
>  drivers/gpu/drm/vc4/vc4_drv.c                 | 36 ++++++++++++-------
>  30 files changed, 217 insertions(+), 14 deletions(-)

Just a heads up to keep folks in the loop: I've landed the first patch
in the drm-misc series, AKA ("drm/atomic-helper:
drm_atomic_helper_shutdown(NULL) should be a noop"), but I haven't
landed any of the others yet. I'm going to give them another ~week
just to be sure there are no objections.

-Doug
