Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 419FD442411
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 00:34:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HjqBG0lmlz2y7P
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 10:34:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=nPMvyvjF;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2c;
 helo=mail-qv1-xf2c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=nPMvyvjF; dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HjqBB4Vhjz2xB5
 for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Nov 2021 10:34:26 +1100 (AEDT)
Received: by mail-qv1-xf2c.google.com with SMTP id u25so12283760qve.2
 for <linux-aspeed@lists.ozlabs.org>; Mon, 01 Nov 2021 16:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=76RMjnoXPjwirFsKHB7iHBCUdiCcGHMsVhyPA6k+egA=;
 b=nPMvyvjF0zj2silLmqDM2HS7695J3dZCiwA/l6z8FVmixdi/W1xDj18O1zPLh4LUFz
 27K99x4FpYngSCP4NBmNfFEfYIaVDTm1/2Bg25xXvgqjRqGPcSjSLxpxANXBuT2iM+8y
 JP2KzpBfOINB/0q9P8RFBD3QLIvosqGiPKP7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=76RMjnoXPjwirFsKHB7iHBCUdiCcGHMsVhyPA6k+egA=;
 b=xDe4waSwqv2mI0agde6k/G1KcOdcf3ii8UFNGr36tuGPAo7/IkV3mrm67ZJQsAto5m
 mb7Sjedp43X+FqfHyCkfaKrM9SLushT6NDZReWTYKZ4gzjYub1nRHVpPP+K393KBmmd2
 mG3otQjjW3j7tksjUm+uvuP8f/vWhZAm9buYw+kzutZZUd5BBvnxBNqEYg/oc+GD9VUv
 +0T1sYNz/dcIAF+xF02i1Exc+AsL/DlZGgYVyotyXXXJ9QSXYLZj29CH2t0RuBH7/WDt
 W7uQwCiJSWEmGT4D4715TWy0GGyGoVLGFT/hfymVgl3cA87NHuPCjhLvLbRwLIMWDBCO
 1uCA==
X-Gm-Message-State: AOAM5300ZHMVmCpjAZnpqL290j6nwjmrytWeOjqSUqkWs0RsW0r5J6Sz
 8sHhbkTfkLVG09VUYhgKyW5prev45wbVsZA7L7E=
X-Google-Smtp-Source: ABdhPJxQlLMMwkddOTL4uZwYA9UAhQj8QLRlH7FrNeXHAwJM6ieVXUOUzBUep+EV7fOQx6XZeAYTXN2ge3VwRihdW0E=
X-Received: by 2002:a05:6214:5002:: with SMTP id
 jo2mr31550933qvb.27.1635809663240; 
 Mon, 01 Nov 2021 16:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211101233751.49222-1-jae.hyun.yoo@intel.com>
 <20211101233751.49222-4-jae.hyun.yoo@intel.com>
In-Reply-To: <20211101233751.49222-4-jae.hyun.yoo@intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 1 Nov 2021 23:34:11 +0000
Message-ID: <CACPK8XcVUEdxjJTOQDf2S-VL3rbwMctQH=v3teyrEgCk__1MVg@mail.gmail.com>
Subject: Re: [PATCH -next 3/4] ARM: dts: aspeed: add LCLK setting into LPC KCS
 nodes
To: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Corey Minyard <minyard@acm.org>,
 Rob Herring <robh+dt@kernel.org>, Cedric Le Goater <clg@kaod.org>,
 openipmi-developer@lists.sourceforge.net,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 1 Nov 2021 at 23:18, <jae.hyun.yoo@intel.com> wrote:
>
> From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>
> Add LCLK clock setting into LPC KCS nodes to enable the LCLK by
> individual LPC sub drivers.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-g5.dtsi | 4 ++++
>  arch/arm/boot/dts/aspeed-g6.dtsi | 4 ++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index d0cc4be2de59..7495f93c5069 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -446,6 +446,7 @@ kcs1: kcs@24 {
>                                         compatible = "aspeed,ast2500-kcs-bmc-v2";
>                                         reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
>                                         interrupts = <8>;
> +                                       clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
>                                         status = "disabled";
>                                 };
>
> @@ -453,6 +454,7 @@ kcs2: kcs@28 {
>                                         compatible = "aspeed,ast2500-kcs-bmc-v2";
>                                         reg = <0x28 0x1>, <0x34 0x1>, <0x40 0x1>;
>                                         interrupts = <8>;
> +                                       clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
>                                         status = "disabled";
>                                 };
>
> @@ -460,6 +462,7 @@ kcs3: kcs@2c {
>                                         compatible = "aspeed,ast2500-kcs-bmc-v2";
>                                         reg = <0x2c 0x1>, <0x38 0x1>, <0x44 0x1>;
>                                         interrupts = <8>;
> +                                       clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
>                                         status = "disabled";
>                                 };
>
> @@ -467,6 +470,7 @@ kcs4: kcs@114 {
>                                         compatible = "aspeed,ast2500-kcs-bmc-v2";
>                                         reg = <0x114 0x1>, <0x118 0x1>, <0x11c 0x1>;
>                                         interrupts = <8>;
> +                                       clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
>                                         status = "disabled";
>                                 };
>
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 465c3549fdc3..891b862363a7 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -520,6 +520,7 @@ kcs1: kcs@24 {
>                                         compatible = "aspeed,ast2500-kcs-bmc-v2";
>                                         reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
>                                         interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> +                                       clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
>                                         kcs_chan = <1>;
>                                         status = "disabled";
>                                 };
> @@ -528,6 +529,7 @@ kcs2: kcs@28 {
>                                         compatible = "aspeed,ast2500-kcs-bmc-v2";
>                                         reg = <0x28 0x1>, <0x34 0x1>, <0x40 0x1>;
>                                         interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
> +                                       clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
>                                         status = "disabled";
>                                 };
>
> @@ -535,6 +537,7 @@ kcs3: kcs@2c {
>                                         compatible = "aspeed,ast2500-kcs-bmc-v2";
>                                         reg = <0x2c 0x1>, <0x38 0x1>, <0x44 0x1>;
>                                         interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> +                                       clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
>                                         status = "disabled";
>                                 };
>
> @@ -542,6 +545,7 @@ kcs4: kcs@114 {
>                                         compatible = "aspeed,ast2500-kcs-bmc-v2";
>                                         reg = <0x114 0x1>, <0x118 0x1>, <0x11c 0x1>;
>                                         interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
> +                                       clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
>                                         status = "disabled";
>                                 };
>
> --
> 2.25.1
>
