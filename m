Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EC84C6627
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Feb 2022 10:53:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6bKy2ThVz30NC
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Feb 2022 20:53:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=LNzfZAX5;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=LNzfZAX5; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6bKs1Vjvz2yPY
 for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Feb 2022 20:53:20 +1100 (AEDT)
Received: by mail-qk1-x72d.google.com with SMTP id bm39so9927037qkb.0
 for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Feb 2022 01:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pc2xTazJcGjIwl7ZnhXxuCZmmMzULOqgCvZj3IlaMMY=;
 b=LNzfZAX5hieB9FG9FLsPTrIanGwIyMKmJnXN/c610bQayVeDntvgfS92u1OMqT5EPE
 y9Kx3Kd2H9XDu5uKrY/5hzx9MjcZUfKRWf/cDhEiK1rfoH6DQ6RTrSk0yxkASPnHujy9
 L7f2UJFZ/hIrFNXgGWbU5ySh13EaWvCsdP0wY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pc2xTazJcGjIwl7ZnhXxuCZmmMzULOqgCvZj3IlaMMY=;
 b=DgUDCJXvKe+DiEE3JBFGZI3HJ2+P3GoNfK8lEcEhXC/Dy6bo1jxSjOy20p0z1jvv1M
 fed/xPJqDlhIJ1V/gztag+GuyaA7lAZeupQDv9hNXEmzWonMLWFYo6dSjUzTQZ1GEyRG
 KHQMeWS+LdjI/vuLL9gIMZEgZzCPdnslgAHx0rxg0HQdnS9K1lRaq6dZkNVHG4GQRSRD
 nbOsbvfUNBvaRddXO3lLkRV6Mk3sJpJYTvmDbJRgBEw9rQ03cN+B5ZSXK4CrbII6K0WY
 VdwQkBqqA1uXbCyopZzQYn1NzJIBGrBlGzGkKkCnuktDGcmZqxAb1gqmC/kKMuiTOktr
 C9Cg==
X-Gm-Message-State: AOAM530KGCoucPxg2XAwsp+OWA9vSb+VOMCt96kgfY9ji5uHZcAjlfuV
 8S5aNQiOxjbLxFDEvIDKDK9ALxqXOjLYFLaN8Dk=
X-Google-Smtp-Source: ABdhPJzMUyYueL8jtRtjblWTAghUCWnWt1dd02X0kcufstS2QoUPX8Pj046KPyailSEuY0MJAUQBLTTjgurg5sosZGs=
X-Received: by 2002:ae9:e841:0:b0:508:1f6e:f020 with SMTP id
 a62-20020ae9e841000000b005081f6ef020mr10495084qkg.243.1646041998337; Mon, 28
 Feb 2022 01:53:18 -0800 (PST)
MIME-Version: 1.0
References: <20211208013337.13806-1-tommy_huang@aspeedtech.com>
In-Reply-To: <20211208013337.13806-1-tommy_huang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Feb 2022 09:53:06 +0000
Message-ID: <CACPK8XcTDUt8q+5s44nnFFK1XiisXw=PBoGaNZowGS7M-j=Phg@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] Add Aspeed AST2600 soc display support
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

Hi Tommy,

On Wed, 8 Dec 2021 at 01:34, Tommy Haung <tommy_huang@aspeedtech.com> wrote:
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

Sorry for the long delay. I have tested your patches on an ast2600a3
evb and they worked. I have some questions about the reset lines that
I couldn't answer by reading the datasheet, so once they are cleared
up we can go ahead with merging your patches.

When you re-send, you will need to fix your git configuration so your
name appears correctly:

git config --global user.name "Tommy Haung"

And then for each patch, do this to fix up the authorship and the s-o-b line:

git commit --amend --reset-author -s

Cheers,

Joel



>
> v3:
>   Refine the patch for clear separate purpose.
>   Skip to send devicetree patch
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
> Tommy Haung (1):
>   dt-bindings:ast2600-clock Add CRT reset define
>
> tommy-huang (4):
>   drm/aspeed: Update INTR_STS handling
>   drm/aspeed: Add AST2600 chip support
>   drm/aspeed: Add reset and clock for AST2600
>   arm:boot:dts:aspeed-g6 Add more gfx reset control
>
>  arch/arm/boot/dts/aspeed-ast2600-evb.dts  | 18 +++++++
>  arch/arm/boot/dts/aspeed-g6.dtsi          | 13 +++++
>  drivers/gpu/drm/aspeed/aspeed_gfx.h       | 17 +++++-
>  drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c  | 16 ++++++
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c   | 65 +++++++++++++++++++++--
>  include/dt-bindings/clock/ast2600-clock.h |  1 +
>  6 files changed, 124 insertions(+), 6 deletions(-)
>
> --
> 2.17.1
>
