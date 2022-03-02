Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1734C9BD0
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 04:09:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7fGp0yWpz3bp5
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 14:09:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=dPwC/rmw;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=dPwC/rmw; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7fGj3Vmmz30gk
 for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Mar 2022 14:09:17 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id 185so305519qkh.1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 01 Mar 2022 19:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HT+Mtr5Nff2ageK7dbN94vU/EQesBvLqX1yuZAcRck0=;
 b=dPwC/rmwjWPNXK0t7BJJ6dux5/N4QJAp73A5BHoQ0+Jun3fMu1eTDALAhU/Kej566l
 5mmW8OoScc5wlCGRRZ0A/w+ktM2veKscRQZ+SkcbGcxf/XtnnHPEMYmXhA6kfSOXV5lw
 3lUH9hcra2VpuWd1zOOxPJuC/ZY1W9dmgH0GU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HT+Mtr5Nff2ageK7dbN94vU/EQesBvLqX1yuZAcRck0=;
 b=VDJ2xQijBWt6pMDUViPfpx0OEyr2vGAtFWYiALzCWgQSu7kxHWYuCrsjlVf0pnESfY
 VOz+aP/EMpTeXEdxYWI9PVaWltRYXzOGTzhDgSrlTqejpiJvGADVER8MVbOvnPwMk9Uy
 eBuF4iF/neewGoTU/xlCHUyC5+0TSCytH6HsyoQjqJDe0QZCqLLFKSUHisT9z8Zfc1JE
 ZeRQ16i2vkIVdRN/CHiTGrqUQ6FdTjpIqhnAPGvhndDmHkoRymmaaKsCFT+fDet0x2CK
 /d5Fg1aTZRhSKfJf3W3B7m8ScVr7IPRjwKeZRe4Y1uSQJHQVJdfkFmPJzr361Pm2Y0WQ
 73ng==
X-Gm-Message-State: AOAM5321k6K5/MSTcQuuW1yp+kzatKbuQl3XfnFnRs5E1qYUl1wKdKN5
 0XRtBPkadj9+ZduJ+ocoOHPJ9H+k0iO33W3U5OI=
X-Google-Smtp-Source: ABdhPJxa0POJ5iMZchDS1hHP6nIyKRmvr9j5KH1/LsFO7CsMjnlOEqfR/0MoiiOCu3HDY273CUfvvjunpBaZrCv9ql0=
X-Received: by 2002:a37:a4d1:0:b0:508:19df:7093 with SMTP id
 n200-20020a37a4d1000000b0050819df7093mr15260167qke.346.1646190554732; Tue, 01
 Mar 2022 19:09:14 -0800 (PST)
MIME-Version: 1.0
References: <20220302024930.18758-1-tommy_huang@aspeedtech.com>
In-Reply-To: <20220302024930.18758-1-tommy_huang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Mar 2022 03:09:02 +0000
Message-ID: <CACPK8XdKH5BaGC9mtgg17ndiJyOneuzzUbrLmxYZKmi6RRzzpg@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Add Aspeed AST2600 soc display support
To: Tommy Haung <tommy_huang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, BMC-SW <BMC-SW@aspeedtech.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2 Mar 2022 at 02:49, Tommy Haung <tommy_huang@aspeedtech.com> wrote:
>
> v6:
>   Remove some unnecessary reset patch.
>   Refine patch format.
>   Add detail explain of SOC display reset bits.
>
> v5:
>   Add lost reset define.
>
> v4:
>   Add necessary reset control for ast2600.
>   Add chip caps for futher use.
>   These code are test on AST2500 and AST2600 by below steps.
>
>   1. Add below config to turn VT and LOGO on.
>
>         CONFIG_TTY=y
>         CONFIG_VT=y
>         CONFIG_CONSOLE_TRANSLATIONS=y
>         CONFIG_VT_CONSOLE=y
>         CONFIG_VT_CONSOLE_SLEEP=y
>         CONFIG_HW_CONSOLE=y
>         CONFIG_VT_HW_CONSOLE_BINDING=y
>         CONFIG_UNIX98_PTYS=y
>         CONFIG_LDISC_AUTOLOAD=y
>         CONFIG_DEVMEM=y
>         CONFIG_DUMMY_CONSOLE=y
>         CONFIG_FRAMEBUFFER_CONSOLE=y
>         CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
>         CONFIG_LOGO=y
>         CONFIG_LOGO_LINUX_CLUT224=y
>
>   2. The Linux logo will be shown on the screen, when the BMC boot in Linux.
>
> v3:
>   Refine the patch for clear separate purpose.
>   Skip to send devicetree patch

Looks good! Thanks Tommy.

Reviewed-by: Joel Stanley <joel@jms.id.au>

I'll apply this once I've tested it on hardware.

>
> v2:
>   Remove some unnecessary patch.
>   Refine for reviwer request.
>
> v1:
>   First add patch.
>
> Joel Stanley (2):
>   ARM: dts: aspeed: Add GFX node to AST2600
>   ARM: dts: aspeed: ast2600-evb: Enable GFX device
>
> Tommy Haung (3):
>   drm/aspeed: Update INTR_STS handling
>   drm/aspeed: Add AST2600 chip support
>   ARM: dtsi: aspeed: Modified gfx reset control
>
>  arch/arm/boot/dts/aspeed-ast2600-evb.dts | 18 ++++++++++++++++++
>  arch/arm/boot/dts/aspeed-g6.dtsi         | 11 +++++++++++
>  drivers/gpu/drm/aspeed/aspeed_gfx.h      |  1 +
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 15 ++++++++++++++-
>  4 files changed, 44 insertions(+), 1 deletion(-)
>
> --
> 2.17.1
>
