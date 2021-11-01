Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5727244240E
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 00:33:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hjq9c248Tz2y7W
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 10:33:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=YO88VLC4;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=YO88VLC4; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hjq9X0JjQz2xB5
 for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Nov 2021 10:33:51 +1100 (AEDT)
Received: by mail-qk1-x72d.google.com with SMTP id r8so4318011qkp.4
 for <linux-aspeed@lists.ozlabs.org>; Mon, 01 Nov 2021 16:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bzFhFp5jwj6oxpHBZmdG5bSxzTQ5DH20gHG8+yrM+zo=;
 b=YO88VLC4ltN8sRPtQnd98iOlONFJf8prHHr1jQdwsIyXtSntx2eSmpWr3dhpykK+YT
 Fiphj7V0Qw1L8Qs3BVhxzj7B3cN/YGGjT6j4JW3cSX/EiBHZrxagV9jSUSmOaLDHHNLm
 00KMGqV5Mtm3hIfUzDZYQfJTFGoiPqVGqLhPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bzFhFp5jwj6oxpHBZmdG5bSxzTQ5DH20gHG8+yrM+zo=;
 b=hXwX89mUf6A9VxqeGd/KtTZcf6Hw2LaCVzX5yvJU6cv9ijp6FBSz8mpaTcv3NqGPz5
 qmaXrNuXlHPVddQ4xD7DDOZvWTSh8O+XvAg9X7v3m7UPOulrrzqkkI3ASB16xKctWOWP
 YTsW+kHKWZjQEC1BYPlTdrkMoECnddckv0Z42rSvLaog1fOWAzTKaaZQwwCG1+RveMEh
 Oq3sfQBiIZ8TrEVQEBdonTCrf+9GSE5fi0pzcOIEApdiPzB1o0qSLduCE8+fBTN9qUlB
 62OKPoZkH3NFac9YyWOwIiOjh72b1Tr8WuWnSXGqGjTJnMIzrr2vIcdotqA2YAdH8MFs
 RQFw==
X-Gm-Message-State: AOAM530aaWtLZSq8C29Wu29sbQUevvsQguqV59rl1NTYyKqkBYttbuq9
 8HHDLXOzbujm1YSl7HVgFTgi/9e3uZKMnIZA5SE=
X-Google-Smtp-Source: ABdhPJxX2WRQaCU+xpjvX+wOKI7BJJwhAz0DomOJX8odLbZsNSqnqkDe8+QXRWmcZYjvfc4gTD6vFsn57A6IgFtLdiM=
X-Received: by 2002:a05:620a:818:: with SMTP id
 s24mr26017694qks.395.1635809629623; 
 Mon, 01 Nov 2021 16:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211101233751.49222-1-jae.hyun.yoo@intel.com>
 <20211101233751.49222-2-jae.hyun.yoo@intel.com>
In-Reply-To: <20211101233751.49222-2-jae.hyun.yoo@intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 1 Nov 2021 23:33:37 +0000
Message-ID: <CACPK8XcAN-SsKDS2E_Cnv=5-Rq=9sAWYyb88i2Ub-iX0WH6aZw@mail.gmail.com>
Subject: Re: [PATCH -next 1/4] ARM: dts: aspeed: add LCLK setting into LPC IBT
 node
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
> Add LCLK clock setting into LPC IBT node to enable the LCLK by
> individual LPC sub drivers.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Do you need to update the bindings too?

> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi | 1 +
>  arch/arm/boot/dts/aspeed-g5.dtsi | 1 +
>  arch/arm/boot/dts/aspeed-g6.dtsi | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index b313a1cf5f73..f14dace34c5a 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -381,6 +381,7 @@ ibt: ibt@140 {
>                                         compatible = "aspeed,ast2400-ibt-bmc";
>                                         reg = <0x140 0x18>;
>                                         interrupts = <8>;
> +                                       clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
>                                         status = "disabled";
>                                 };
>
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index c7049454c7cb..d0cc4be2de59 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -507,6 +507,7 @@ ibt: ibt@140 {
>                                         compatible = "aspeed,ast2500-ibt-bmc";
>                                         reg = <0x140 0x18>;
>                                         interrupts = <8>;
> +                                       clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
>                                         status = "disabled";
>                                 };
>                         };
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 5106a424f1ce..465c3549fdc3 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -581,6 +581,7 @@ ibt: ibt@140 {
>                                         compatible = "aspeed,ast2600-ibt-bmc";
>                                         reg = <0x140 0x18>;
>                                         interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
> +                                       clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
>                                         status = "disabled";
>                                 };
>                         };
> --
> 2.25.1
>
