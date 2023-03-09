Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7666B1DB0
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 09:17:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXMVt66FTz3cMc
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 19:17:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zHNKNBYR;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zHNKNBYR;
	dkim-atps=neutral
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXMVk3jRCz3bbD
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 19:17:32 +1100 (AEDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-536af432ee5so21973247b3.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 00:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678349848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2l5Id5YkQHVcDPnMRyRmnfI/ab4qev+27T/LcA5p4xY=;
        b=zHNKNBYRp8ZMtYES6iOOJZdPs+/VrS4r4YOJIdMcn27ttfxXw+5AQLOM553VKzbfnu
         vLHmIOaLbVGba0VsvH1A00WV2qAWWgRg6OCdzr0CGE6bztDfQMn/g9Y5OsP9YhvR9IvQ
         MBPkKaiastTwTZvY+KgDfsVknQjxIsmsmH17UUOwZlFCPeT099gAT1AvqRLyWYGb78VF
         buB27vSGCDqka04+hzRqEy0gBl5mSK5NjjfTzm/G9U23TwZT1xq5DqboEq5enhwfaKIC
         YzzD9CYsGf0djIqiap2rDOQQywTt+nLUZAXM8IkxeeJ6AXIvCT0l3gLpZjJP6pzCZ/ff
         Vvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678349848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2l5Id5YkQHVcDPnMRyRmnfI/ab4qev+27T/LcA5p4xY=;
        b=pKUG6CdiToobHnqofsmYdbz+0/1tB0wzjXFR2i2mH6NIXJ8D0Sp9jdShoCcwYWJa27
         Yxm2RNA74IQ0iyGTy35IlC4gW+VApDxxz62xVEgEovq6F8+KeFXV3soqm6uw7xXAgsqR
         +HqvwhW7n+EgAwHDm71OYraZvgPphipsgBHdYsotSZRV73lvKPEH9UE9raiSZSmiHv8T
         VWnKWfs1iCzzelzRpsAcfkif+5cR8kqYTb/BU8jt8m3Iri9WX5facX28ECH2TLVVebks
         14J6BkNPTzZbOEbjw5cOPNqHM29oYScJwizPoKNGwAXOiefzRlTsIW2h1NzRXs+2Afw4
         wkBQ==
X-Gm-Message-State: AO0yUKXnjmV84NOwK/aEoGEJX9A3SIUtBpGntxENwR8vSbdQkzviVzvp
	cw6TSEg7h4touyrAjutoWdCJQo1z/qdZjXsESxJ2UQ==
X-Google-Smtp-Source: AK7set9NqrT7RUuXgHnInuqDO8U0SE1ojud6SJk/FpmB3GQVriAzuG0269C9t+4xeg2JU5VBcDK6EbBkG9E/pM7QunM=
X-Received: by 2002:a81:4312:0:b0:52e:b718:24d5 with SMTP id
 q18-20020a814312000000b0052eb71824d5mr13477522ywa.9.1678349847927; Thu, 09
 Mar 2023 00:17:27 -0800 (PST)
MIME-Version: 1.0
References: <20230301153101.4282-1-tzimmermann@suse.de> <CACRpkdawSQsNqKJkSSoSw3HmMHyNXFUywxkdszpTC-a_uZA+tQ@mail.gmail.com>
 <0e789778-03ca-e3cb-9c94-e8b55573894c@suse.de>
In-Reply-To: <0e789778-03ca-e3cb-9c94-e8b55573894c@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 9 Mar 2023 09:17:16 +0100
Message-ID: <CACRpkdYUVBq_-iZxtoe65eh3ruUOprF_JEG-sZfUSNVhjacVLA@mail.gmail.com>
Subject: Re: [PATCH 00/22] drm/dma-helper: Add dedicated fbdev emulation
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-aspeed@lists.ozlabs.org, edmund.j.dea@intel.com, alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com, anitha.chrisanthus@intel.com, festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com, samuel@sholland.org, airlied@gmail.com, javierm@redhat.com, jernej.skrabec@gmail.com, linux-imx@nxp.com, alain.volmat@foss.st.com, linux-sunxi@lists.linux.dev, p.zabel@pengutronix.de, daniel@ffwll.ch, raphael.gallais-pou@foss.st.com, martin.blumenstingl@googlemail.com, s.hauer@pengutronix.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org, laurentiu.palcu@oss.nxp.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, hyun.kwon@xilinx.com, tomba@kernel.org, jyri.sarha@iki.fi, yannick.fertre@foss.st.com, philippe.cornu@foss.st.com, kernel@pengutronix.de, khilman@baylibre.com, shawnguo@kernel.org, l.stach@pengutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Mar 7, 2023 at 9:55=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Am 06.03.23 um 23:19 schrieb Linus Walleij:

> > 2) Why isn't this DRM driver changed?
> > drivers/gpu/drm/mcde/mcde_drv.c
> > AFAICT it also uses GEM buffers in system memory.
>
> This driver requires damage handling
> https://elixir.bootlin.com/linux/v6.2/source/drivers/gpu/drm/mcde/mcde_dr=
v.c#L97
>
> for which we have to call the framebuffer's dirty callback

Oh that one is on me ... I no longer remember exactly why I used
drm_gem_fb_create_with_dirty() but I think it was because I had the
ambition that the driver would only send out updates to DSI command
displays whenever something changed, so as to minimize traffic.

It turns out this ambition with command mode isn't working in
practice because all the MCDE does is to create a continuous stream
of DSI commands and while it is possible to send single frame
updates with it, it's not working in practice. So we are just setting
up continuous updates. We turn of the VBLANK IRQs a bit, but I
guess the DRM framework does that for us when nothing goes on.

I tested to replace this with drm_gem_fb_create and it works just
fine. I'll send out a patch so you can make this change also to the
MCDE driver.

Yours,
Linus Walleij
