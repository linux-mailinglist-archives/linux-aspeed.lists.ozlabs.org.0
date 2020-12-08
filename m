Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1182D20B9
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 03:21:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqkSM6lCkzDqbs
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 13:21:07 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=CuiuUZ7c; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqkSG0jpzzDqZb
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Dec 2020 13:21:01 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id y18so14725932qki.11
 for <linux-aspeed@lists.ozlabs.org>; Mon, 07 Dec 2020 18:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tRTmRR6i5ldsnDvLccKv0+2Lb/JpoYzM8sB3u0+LQeA=;
 b=CuiuUZ7cRzFVO+dKyyJQyf5ZHldpCmyxXrYWWL6lsEzQY2wslizR1rDI+AF6q4277L
 ixAreq4zBPDp3igSHHfdLP/YL6WtVuz8hh7uWrKiXZ812wu1hzrh+5Hcw3o5DTh3M3JB
 edRA4LLoiXWYh9drK4Cr+LTjjRzDxwRZf8+tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tRTmRR6i5ldsnDvLccKv0+2Lb/JpoYzM8sB3u0+LQeA=;
 b=he2JyxFs+TudMCm3b48yLIH24UJiTPiJ+Xy+WzhBrPBSjohMWk3e9H9KmWpTtjICQF
 RrVUYWvtWrBIsffqMc/sCdtCgCQMBCqsNwLhtE7yyXgupi4GICQdYrtO8IGXW3cxjTAe
 0SQxRHGC6YtvqHmOEJm3R2JgXBpoYxUxsWVSZtkTuDNEMJhnv0pqf5fJa17JFJzGTcRR
 1olcYgcoatXc/1lMaHfeRg3qc0anp/D4MQ6efQI9ImFMWvqDV6FMhGGWxTrUeBHq+KHZ
 w4/ESw5O+nDuZpSSG+yvrrdz+5xJY1xQHXmJofC9dgAsFgWxn68uAlvgz+tQCrwFRk00
 8NjA==
X-Gm-Message-State: AOAM532q68dUQH1lv3gpfJUew47foqc8VYuoVt1tJ6ZKoqnJYR9sOi4Y
 uSOsla5BTnx+goOjFkd4IJ6wyUE344PDb9s7yHo=
X-Google-Smtp-Source: ABdhPJw2ud19QUIg0leAoNjEpRtpBSdzoxEzw3u5EdIlzVd2mY+5KlLyp1VjqJyVAMszDwkqz31ae+WntOV9qGaODIQ=
X-Received: by 2002:a05:620a:7e8:: with SMTP id
 k8mr27038811qkk.273.1607394057671; 
 Mon, 07 Dec 2020 18:20:57 -0800 (PST)
MIME-Version: 1.0
References: <20201202051634.490-1-wangzhiqiang.bj@bytedance.com>
 <20201202051634.490-2-wangzhiqiang.bj@bytedance.com>
In-Reply-To: <20201202051634.490-2-wangzhiqiang.bj@bytedance.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Dec 2020 02:20:45 +0000
Message-ID: <CACPK8XfVGSy=ST8afmcA-VTRZEdf-5-LSbXbd5DZ7LQ999mcxA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add LCLK to lpc-snoop
To: John Wang <wangzhiqiang.bj@bytedance.com>
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
 =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 xuxiaohan@bytedance.com, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2 Dec 2020 at 05:16, John Wang <wangzhiqiang.bj@bytedance.com> wrote:
>

Can you add a note here about why we are adding these so it's clear is
a fix/enhancement?

Also add a Fixes line for both patches.

> Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>


Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi | 1 +
>  arch/arm/boot/dts/aspeed-g5.dtsi | 1 +
>  arch/arm/boot/dts/aspeed-g6.dtsi | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index f606fc01ff13..2364b660f2e4 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -370,6 +370,7 @@ lpc_snoop: lpc-snoop@10 {
>                                                 compatible = "aspeed,ast2400-lpc-snoop";
>                                                 reg = <0x10 0x8>;
>                                                 interrupts = <8>;
> +                                               clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
>                                                 status = "disabled";
>                                         };
>
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index 19288495f41a..30bbf7452b90 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -496,6 +496,7 @@ lpc_snoop: lpc-snoop@10 {
>                                                 compatible = "aspeed,ast2500-lpc-snoop";
>                                                 reg = <0x10 0x8>;
>                                                 interrupts = <8>;
> +                                               clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
>                                                 status = "disabled";
>                                         };
>
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 97ca743363d7..4b1013870fb1 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -520,6 +520,7 @@ lpc_snoop: lpc-snoop@0 {
>                                                 compatible = "aspeed,ast2600-lpc-snoop";
>                                                 reg = <0x0 0x80>;
>                                                 interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
> +                                               clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
>                                                 status = "disabled";
>                                         };
>
> --
> 2.25.1
>
