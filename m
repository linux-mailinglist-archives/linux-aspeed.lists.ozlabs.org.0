Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CB06AD169
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Mar 2023 23:20:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVtLV3Qdvz3bjj
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Mar 2023 09:20:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WQLXFgm2;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WQLXFgm2;
	dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVtLP5xXLz2xG9
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Mar 2023 09:20:13 +1100 (AEDT)
Received: by mail-yb1-xb29.google.com with SMTP id x12so9731691ybt.7
        for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Mar 2023 14:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678141211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pOqDJttcohXKj1RSFtrNisdNxjQPQ9b/aoMKjMVgTM=;
        b=WQLXFgm2cskHChBbeJjnWfHzLaVEexVQKOQ4rB9cRG3lQA3qPXuomhUFMa1bPJaV+O
         elX+AVtcktbnW0u6KZFFrMz/uVu6DNtCdgp7AOhijqFyjyBI6havk1pXij2OauQZ92qg
         TP7BYf+epbi5+Fb8EdRlsu8DoxuCo/2SVjKw2HJW8WDIUgzdaxomEvmi9CQMcj+Gtg/u
         AWdSzRJdlgO45NCMRtVrCRZOSi4bGROwqVtYX+0cJKot3gy/M2pkyUPeu9oLPYu3Bo7A
         haB/pNnDt3IxCUNKe7BAbGoTTF32+chnWsq932lhwVWXjK9AljFmPq2wHMNt9iZXwgl3
         6/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678141211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0pOqDJttcohXKj1RSFtrNisdNxjQPQ9b/aoMKjMVgTM=;
        b=dyt8MLEB9AhtIFh9+t+EhiQtE087zMn8KnjzdxRekmMN+BalwVqjRtAmRChmSW/c1R
         QDj5MAIDG5dphR0CeANF4SOE3QJhK5nelU0dPAvNgtamyIEOVSYGrX5JwvndTiHeZqcy
         Sc+IHjX16MniqST4mm76wHVAO+l5vTi5sSQd/awNxf/kV+paM5QRGV6dVNH2IhDzCtYo
         FQwDBFQHKwA0V8cgjPWkUcfL+FsUmm3A/bjdw7IYD2YqvjkMLRbcv+WmSH/T+5ds5pSW
         rSMDNk2CL59ic84RjfJ1S4SwuiGxXx+wLErAdUH+YEAZh6fpk1VLDmm2yfNYNp7SReqP
         Rz3g==
X-Gm-Message-State: AO0yUKVQ6p+jg0oTMKXpTk10gHuBZpMH2W0Vdv2Na2du5MTVhX5EAXpp
	irWO3V78iREZ8SELbR5OK1iMS6asIj2wuvMdIWNo/w==
X-Google-Smtp-Source: AK7set+xwxOTuAGUH2F4JBk51moW8y8vFCxjzdcMEe6q9xVEyLeKbxDfeAXuirvD55r2Rwjk4zMOQZkWM/2/groUae8=
X-Received: by 2002:a05:6902:4c2:b0:ab8:1ed9:cfd6 with SMTP id
 v2-20020a05690204c200b00ab81ed9cfd6mr7198831ybs.5.1678141211227; Mon, 06 Mar
 2023 14:20:11 -0800 (PST)
MIME-Version: 1.0
References: <20230301153101.4282-1-tzimmermann@suse.de>
In-Reply-To: <20230301153101.4282-1-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Mar 2023 23:19:59 +0100
Message-ID: <CACRpkdawSQsNqKJkSSoSw3HmMHyNXFUywxkdszpTC-a_uZA+tQ@mail.gmail.com>
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

On Wed, Mar 1, 2023 at 4:31=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:

> Add fbdev emulation that is optimized for DMA helpers, as used by most
> drivers. It operates directly on GEM DMA buffers in system memory.
> Memory pages are mmap'ed directly to userspace. No implicit shadow
> buffers need to be allocated; as can happen with the generic fbdev
> emulation. Convert drivers that fulfil the requirements.
>
> Tested with fbcon and IGT on vc4.
>
> Future direction: providing a dedicated fbdev emulation for GEM DMA
> helpers will allow us to remove this case from the generic fbdev code.
> The latter can then be simplified.

1) I love your work.

2) Why isn't this DRM driver changed?
drivers/gpu/drm/mcde/mcde_drv.c
AFAICT it also uses GEM buffers in system memory.

3) This one:
drivers/gpu/drm/pl111/pl111_drv.c
is also very similar, but can sometimes use a dedicated
RAM memory for allocations using CMA, does that make
it not a candidate?

They aren't much different in how they work from the TVE200.

Yours,
Linus Walleij
