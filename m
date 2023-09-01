Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4212979378E
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Sep 2023 10:58:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AXJh68X/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rgbqx0V2dz2yD4
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Sep 2023 18:58:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AXJh68X/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rcvfk4TLwz3bY3
	for <linux-aspeed@lists.ozlabs.org>; Sat,  2 Sep 2023 09:40:46 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-27183f4ccc1so1770272a91.2
        for <linux-aspeed@lists.ozlabs.org>; Fri, 01 Sep 2023 16:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693611644; x=1694216444; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n/wC93ts+Uw6CTnKmnF0FM5HAH/s/Jjcati4UEbYR+M=;
        b=AXJh68X/LGJbC2Iu0glY5P473J+xmUwEaXiZO4W9D4YwWG0LFD+R01Wb2s8gACLDph
         M/cs5kmCAlFw/IXL60R0BB9V1PCGKJY44nAXmLpqj87jnJO5AcqWIKIljdTdQRsLgH+k
         Pf+liR216qNApTiNixE2oYj2sshLdvjaYToV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693611644; x=1694216444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/wC93ts+Uw6CTnKmnF0FM5HAH/s/Jjcati4UEbYR+M=;
        b=NrwrppMoTL6nr+tuTPq8rgABhhQpZF14mgXo7ZVucbtmL1xlmhaIwKUpiGuOHmZ/Py
         voDRh0oOVvBR7r3zilf6isGgAEkoRBd/JRbfa2HMEv+Qyn4eTNiVhUpr/K7YXdyTYN7B
         WVHStCzJaKIQmI3mLKLCHYx1PXVRdT8T3+llfxgPJq0+o5BrLJWQtg3ECecVloVxh590
         2GMB0nGlJqwdqLvV4nlIYUSvXjfAACkdwO2n3/yCVcYsfD/CKKYJTvoFI0ZC3ws+tsCI
         OJhStZgvZ+hdJgO6cfS8WQygjEAoq17XZW09EORcB3ql+MpsgtBDDbyV0zKe+axzw9mN
         7zNw==
X-Gm-Message-State: AOJu0Yx77fZvwAl15efhxWefwPv9PioevVjUGutLdDPWBTB/tNzVeoNc
	yjdfPQjHKm0SFJOtysLu1yIkEA==
X-Google-Smtp-Source: AGHT+IGvD6INAbenp2grAfWcBj4pkX0Rwdi+mFd4l74epgbtZUP930lbGB/73TFpiWMGlrv965H/4A==
X-Received: by 2002:a17:90a:a58f:b0:267:7743:9857 with SMTP id b15-20020a17090aa58f00b0026777439857mr4020109pjq.17.1693611643599;
        Fri, 01 Sep 2023 16:40:43 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
        by smtp.gmail.com with ESMTPSA id 5-20020a17090a1a4500b0026b4ca7f62csm3773488pjl.39.2023.09.01.16.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 16:40:43 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH 0/6] drm: drm-misc drivers call drm_atomic_helper_shutdown() at the right times
Date: Fri,  1 Sep 2023 16:39:51 -0700
Message-ID: <20230901234015.566018-1-dianders@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 06 Sep 2023 18:57:56 +1000
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
Cc: sumit.semwal@linaro.org, alexandre.belloni@bootlin.com, emma@anholt.net, xinliang.liu@linaro.org, tomi.valkeinen@ideasonboard.com, linus.walleij@linaro.org, liviu.dudau@arm.com, alexandre.torgue@foss.st.com, stefan@agner.ch, linux-kernel@vger.kernel.org, wens@csie.org, jstultz@google.com, kraxel@redhat.com, airlied@gmail.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, yongqin.liu@linaro.org, linux-aspeed@lists.ozlabs.org, samuel@sholland.org, sam@ravnborg.org, javierm@redhat.com, jernej.skrabec@gmail.com, steven.price@arm.com, drawat.floss@gmail.com, kong.kongxinwei@hisilicon.com, u.kleine-koenig@pengutronix.de, alain.volmat@foss.st.com, spice-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, nicolas.ferre@microchip.com, suijingfeng@loongson.cn, mcoquelin.stm32@gmail.com, linux-hyperv@vger.kernel.org, raphael.gallais-pou@foss.st.com, alison.wang@nxp.com, maarten.lankhorst@linux.intel.com, hdegoede@redhat.com, airlied@redhat.com, virtualization@lists.linux-
 foundation.org, linux-arm-kernel@lists.infradead.org, jfalempe@redhat.com, bbrezillon@kernel.org, tzimmermann@suse.de, yannick.fertre@foss.st.com, Douglas Anderson <dianders@chromium.org>, christian.koenig@amd.com, paul.kocialkowski@bootlin.com, philippe.cornu@foss.st.com, daniel@ffwll.ch, alexander.deucher@amd.com, tiantao6@hisilicon.com, jyri.sarha@iki.fi, claudiu.beznea@microchip.com, zackr@vmware.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


NOTE: in order to avoid email sending limits on the cover letter, I've
split this patch series in two. Patches that target drm-misc and ones
that don't. The cover letter of the two is identical other than this note.

This patch series came about after a _long_ discussion between me and
Maxime Ripard in response to a different patch I sent out [1]. As part
of that discussion, we realized that it would be good if DRM drivers
consistently called drm_atomic_helper_shutdown() properly at shutdown
and driver remove time as it's documented that they should do. The
eventual goal of this would be to enable removing some hacky code from
panel drivers where they had to hook into shutdown themselves because
the DRM driver wasn't calling them.

It turns out that quite a lot of drivers seemed to be missing
drm_atomic_helper_shutdown() in one or both places that it was
supposed to be. This patch series attempts to fix all the drivers that
I was able to identify.

NOTE: fixing this wasn't exactly cookie cutter. Each driver has its
own unique way of setting itself up and tearing itself down. Some
drivers also use the component model, which adds extra fun. I've made
my best guess at solving this and I've run a bunch of compile tests
(specifically, allmodconfig for amd64, arm64, and powerpc). That being
said, these code changes are not totally trivial and I've done zero
real testing on them. Making these patches was also a little mind
numbing and I'm certain my eyes glazed over at several points when
writing them. What I'm trying to say is to please double-check that I
didn't do anything too silly, like cast your driver's drvdata to the
wrong type. Even better, test these patches!

I've organized this series like this:
1. One patch for all simple cases of just needing a call at shutdown
   time for drivers that go through drm-misc.
2. A separate patch for "drm/vc4", even though it goes through
   drm-misc, since I wanted to leave an extra note for that one.
3. Patches for drivers that just needed a call at shutdown time for
   drivers that _don't_ go through drm-misc.
4. Patches for the few drivers that had the call at shutdown time but
   lacked it at remove time.
5. One patch for all simple cases of needing a call at shutdown and
   remove (or unbind) time for drivers that go through drm-misc.
6. A separate patch for "drm/hisilicon/kirin", even though it goes
   through drm-misc, since I wanted to leave an extra note for that
   one.
7. Patches for drivers that needed a call at shutdown and remove (or
   unbind) time for drivers that _don't_ go through drm-misc.

I've labeled this patch series as RFT (request for testing) to help
call attention to the fact that I didn't personally test any of these
patches.

If you're a maintainer of one of these drivers and you think that the
patch for your driver looks fabulous, you've tested it, and you'd like
to land it right away then please do. For non-drm-misc drivers there
are no dependencies here. Some of the drm-misc drivers depend on the
first patch, AKA ("drm/atomic-helper: drm_atomic_helper_shutdown(NULL)
should be a noop"). I've tried to call this out but it also should be
obvious once you know to look for it.

I'd like to call out a few drivers that I _didn't_ fix in this series
and why. If any of these drivers should be fixed then please yell.
- DRM driers backed by usb_driver (like gud, gm12u320, udl): I didn't
add the call to drm_atomic_helper_shutdown() at shutdown time
because there's no ".shutdown" callback for them USB drivers. Given
that USB is hotpluggable, I'm assuming that they are robust against
this and the special shutdown callback isn't needed.
- ofdrm and simpledrm: These didn't have drm_atomic_helper_shutdown()
in either shutdown or remove, but I didn't add it. I think that's OK
since they're sorta special and not really directly controlling
hardware power sequencing.
- virtio, vkms, vmwgfx, xen: I believe these are all virtual (thus
they wouldn't directly drive a panel) and adding the shutdown
didn't look straightforward, so I skipped them.

I've let each patch in the series get CCed straight from
get_maintainer. That means not everyone will have received every patch
but everyone should be on the cover letter. I know some people dislike
this but when touching this many drivers there's not much
choice. dri-devel and lkml have been CCed and lore/lei exist, so
hopefully that's enough for folks. I'm happy to add people to the
whole series for future posts.

[1] https://lore.kernel.org/lkml/20230804140605.RFC.4.I930069a32baab6faf46d6b234f89613b5cec0f14@changeid


Douglas Anderson (6):
  drm/atomic-helper: drm_atomic_helper_shutdown(NULL) should be a noop
  drm: Call drm_atomic_helper_shutdown() at shutdown time for misc
    drivers
  drm/vc4: Call drm_atomic_helper_shutdown() at shutdown time
  drm/ssd130x: Call drm_atomic_helper_shutdown() at remove time
  drm: Call drm_atomic_helper_shutdown() at shutdown/remove time for
    misc drivers
  drm/hisilicon/kirin: Call drm_atomic_helper_shutdown() at
    shutdown/unbind time

 .../gpu/drm/arm/display/komeda/komeda_drv.c   |  9 +++++
 .../gpu/drm/arm/display/komeda/komeda_kms.c   |  7 ++++
 .../gpu/drm/arm/display/komeda/komeda_kms.h   |  1 +
 drivers/gpu/drm/arm/hdlcd_drv.c               |  6 ++++
 drivers/gpu/drm/arm/malidp_drv.c              |  6 ++++
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  7 ++++
 drivers/gpu/drm/ast/ast_drv.c                 |  6 ++++
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  6 ++++
 drivers/gpu/drm/drm_atomic_helper.c           |  3 ++
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  8 +++++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  6 ++++
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  9 +++++
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c       |  6 ++++
 drivers/gpu/drm/logicvc/logicvc_drm.c         |  9 +++++
 drivers/gpu/drm/loongson/lsdc_drv.c           |  6 ++++
 drivers/gpu/drm/mcde/mcde_drv.c               |  9 +++++
 drivers/gpu/drm/mgag200/mgag200_drv.c         |  8 +++++
 drivers/gpu/drm/omapdrm/omap_drv.c            |  8 +++++
 drivers/gpu/drm/pl111/pl111_drv.c             |  7 ++++
 drivers/gpu/drm/qxl/qxl_drv.c                 |  7 ++++
 drivers/gpu/drm/solomon/ssd130x.c             |  1 +
 drivers/gpu/drm/sti/sti_drv.c                 |  7 ++++
 drivers/gpu/drm/stm/drv.c                     |  7 ++++
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  6 ++++
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           | 11 +++++-
 drivers/gpu/drm/tiny/bochs.c                  |  6 ++++
 drivers/gpu/drm/tiny/cirrus.c                 |  6 ++++
 drivers/gpu/drm/tve200/tve200_drv.c           |  7 ++++
 drivers/gpu/drm/vboxvideo/vbox_drv.c          | 10 ++++++
 drivers/gpu/drm/vc4/vc4_drv.c                 | 36 ++++++++++++-------
 30 files changed, 217 insertions(+), 14 deletions(-)

-- 
2.42.0.283.g2d96d420d3-goog

