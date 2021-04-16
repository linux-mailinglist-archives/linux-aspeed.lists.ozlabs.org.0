Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FC03617F6
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Apr 2021 05:03:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM1J1486Cz30L8
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Apr 2021 13:03:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Eyr7g0DX;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2c;
 helo=mail-qv1-xf2c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Eyr7g0DX; dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM1Hz4fPdz2ywx
 for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Apr 2021 13:03:41 +1000 (AEST)
Received: by mail-qv1-xf2c.google.com with SMTP id d1so1222927qvy.11
 for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Apr 2021 20:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q26+v9m6OHwgu5yJO9W58aHk+91HmRzWJqWAxjmAjYg=;
 b=Eyr7g0DXodj0YWyiHAZQvIHMwU0PVbUa4XiJJaYRoMR1fz/x6N15b6AglJ/HyiI0Nw
 R53FNij7DbgHDMAwyiggIBuiiGvIobBsKLX9p/LP4Q190TKIKqJI3XntLvkiasHGB/GM
 OpjCvykQFFbeGC+W6jiisQeZIGpu6utfnPIcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q26+v9m6OHwgu5yJO9W58aHk+91HmRzWJqWAxjmAjYg=;
 b=jy6kuVtXQ6trkU1VDma2WuicoMpzla53OVDrmpKN7ElF7PPNpm+mdht535ZXsNhtSB
 e5WMR4m5/2+WUdT1b3eENlqUEBXF3FXPr74fAQWRpglrrQCo/c8N5IVZ2lARj5x6bu3j
 G2e7onTiKhU5r4Fz7r6FbeBx64SLIyAwnQGz2nEqO0/8zfqri4sj/8IzWzWJr8KKl482
 rZk7e6D9N3CJxUmwFHBsYJ+I5FSaL9JDWCmqfD5rZb17XHpIRbrONYPPxS09GRnw5peq
 YOMS7J8h3SqT6xm3Gr81a5LWYzBKT5cQXcfN9jpjWDevI4dqKC/5JyicS1wDL8Bgc5/x
 2OFA==
X-Gm-Message-State: AOAM533NTfjcQ+DVC66CfMahVKvSsUM97Au0mtwQwrtaNybopmM4mD12
 W/2On2zLEwE/6Cw0ZUMIcJaYmqbn3FdHRIPG4/g=
X-Google-Smtp-Source: ABdhPJxsDfazEoAzmRD7FlKhlHPECMQcCoMQ1AW1TfMq+yhvzo+OtyjUw7EkrvsL1LWKEEylHKzYzXAlfCRCBWIHjNs=
X-Received: by 2002:a0c:eb06:: with SMTP id j6mr6422476qvp.10.1618542218062;
 Thu, 15 Apr 2021 20:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210316085932.2601-1-troy_lee@aspeedtech.com>
In-Reply-To: <20210316085932.2601-1-troy_lee@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Apr 2021 03:03:25 +0000
Message-ID: <CACPK8XeYtaLLWDMR8xZhERrQ_WCUJ2RM_JZmZNQ6oZSvgSDM_w@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: dts: Fix 64MiB OpenBMC flash layout and
 aspeed-ast2600-evb.dts
To: Troy Lee <troy_lee@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 leetroy@gmail.com, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 16 Mar 2021 at 08:59, Troy Lee <troy_lee@aspeedtech.com> wrote:
>
> Aspeed AST2600 u-boot requires 600KiB+ flash space. Sharing the same
> openbmc-flash-layout-64.dtsi requires to resize the flash partition.
>
> The updated flash layout as follows:
> - u-boot: 896 KiB
> - u-boot-env: 128 KiB
> - kernel: 9MiB
> - rofs: 32 MiB
> - rwfs: 22 MiB

Changing the 64MB layout will break the systems that are already using
this layout. I'll get the Bytedance people to chime in, as theirs is
the only system using this layout so far.

John, Lei?

>
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed-ast2600-evb.dts      | 32 +------------------
>  .../arm/boot/dts/openbmc-flash-layout-64.dtsi | 18 +++++------
>  2 files changed, 10 insertions(+), 40 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> index 89be13197780..2cfae9cfed3a 100644
> --- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> @@ -121,37 +121,7 @@ flash@0 {
>                 m25p,fast-read;
>                 label = "bmc";
>                 spi-max-frequency = <50000000>;
> -
> -               partitions {
> -                       compatible = "fixed-partitions";
> -                       #address-cells = <1>;
> -                       #size-cells = <1>;
> -
> -                       u-boot@0 {
> -                               reg = <0x0 0xe0000>; // 896KB
> -                               label = "u-boot";
> -                       };
> -
> -                       u-boot-env@e0000 {
> -                               reg = <0xe0000 0x20000>; // 128KB
> -                               label = "u-boot-env";
> -                       };
> -
> -                       kernel@100000 {
> -                               reg = <0x100000 0x900000>; // 9MB
> -                               label = "kernel";
> -                       };
> -
> -                       rofs@a00000 {
> -                               reg = <0xa00000 0x2000000>; // 32MB
> -                               label = "rofs";
> -                       };
> -
> -                       rwfs@6000000 {
> -                               reg = <0x2a00000 0x1600000>; // 22MB
> -                               label = "rwfs";
> -                       };
> -               };
> +#include "openbmc-flash-layout-64.dtsi"
>         };
>  };
>
> diff --git a/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi b/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
> index 91163867be34..31f59de5190b 100644
> --- a/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
> +++ b/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
> @@ -9,27 +9,27 @@ partitions {
>         #size-cells = <1>;
>
>         u-boot@0 {
> -               reg = <0x0 0x60000>; // 384KB
> +               reg = <0x0 0xe0000>; // 896KB
>                 label = "u-boot";
>         };
>
> -       u-boot-env@60000 {
> -               reg = <0x60000 0x20000>; // 128KB
> +       u-boot-env@e0000 {
> +               reg = <0xe0000 0x20000>; // 128KB
>                 label = "u-boot-env";
>         };
>
> -       kernel@80000 {
> -               reg = <0x80000 0x500000>; // 5MB
> +       kernel@100000 {
> +               reg = <0x100000 0x900000>; // 9MB
>                 label = "kernel";
>         };
>
> -       rofs@580000 {
> -               reg = <0x580000 0x2a80000>; // 42.5MB
> +       rofs@a00000 {
> +               reg = <0xa00000 0x2000000>; // 32MB
>                 label = "rofs";
>         };
>
> -       rwfs@3000000 {
> -               reg = <0x3000000 0x1000000>; // 16MB
> +       rwfs@6000000 {
> +               reg = <0x2a00000 0x1600000>; // 22MB
>                 label = "rwfs";
>         };
>  };
> --
> 2.25.1
>
