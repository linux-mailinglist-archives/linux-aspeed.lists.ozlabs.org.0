Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FA734FAB4
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Mar 2021 09:48:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9JN92ftZz30B7
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Mar 2021 18:48:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=FJiZz4Zm;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f31;
 helo=mail-qv1-xf31.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=FJiZz4Zm; dkim-atps=neutral
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9JN71DXsz2yx5
 for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Mar 2021 18:48:38 +1100 (AEDT)
Received: by mail-qv1-xf31.google.com with SMTP id j17so9473395qvo.13
 for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Mar 2021 00:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TcHTMg2iLIDJnGDB9Kaft4m85Uo8IfdtBj6klXtJpyE=;
 b=FJiZz4ZmH/G2Zr1F54iy3Jk5XSEWTppjpzEhglogAQpCbZhRhgxHSryf7yrAq/6fEQ
 hulNxBUeYQ251Hz6HWH2ceizKsDnY+YMdamrZjyXoSXYVAsu+rW/JGZXycpLNRAL2hGC
 0vjiE8sJb8k04bajmkrFyh1bFirqDHAtUOvCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TcHTMg2iLIDJnGDB9Kaft4m85Uo8IfdtBj6klXtJpyE=;
 b=CQ54wMISP7f0cAdULXFirBLnLpXyzZLIinwoIGxvTLKt67+ToHbgihi/65zY3kflFR
 ki8eWRznd7R6zSLY4PK3vZnFh0jhfwj14RETUIzEoKe8FsU4LRGblNuo5k9mFo7bPRdz
 CSCpCAlhrWRcBtgjPwvZjxsaxf5UWK51PWdstf/j8EngWl/B59gCgcAQvt95XH1J/5hD
 dF55tqWKyJaF038D5TAWkwe7WA+CcKi+vhfBIVvZlaHtBBJqEQKfsIVCYKyNdFpLwE1R
 1lQpWbhN5FtRwQwJGRRujPbFzLMSbW5S0zXLQHxyRM3FUEtdY2q0+orm0aDoUWFRK+ar
 gIWQ==
X-Gm-Message-State: AOAM531ntk1UpZAARpH9CcEEmdEmKIcRdMxc9+KEzGJbpTF7PVfFizNt
 dmIVFCRFNk2xkS0138006zRw61bqzosRLuUCXZA=
X-Google-Smtp-Source: ABdhPJzT05GGq7j0qfFdXN+Ja7au989BTKlLZwclCpPbapyscqqlvve47u3FSHQH5b2onjQ2Y/8kGB/3Zw2/b9QOeqg=
X-Received: by 2002:ad4:58e3:: with SMTP id di3mr1771117qvb.43.1617176915285; 
 Wed, 31 Mar 2021 00:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210329094255.347713-1-rashmica.g@gmail.com>
In-Reply-To: <20210329094255.347713-1-rashmica.g@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 Mar 2021 07:48:23 +0000
Message-ID: <CACPK8XchKxK9zbogk2rix6Hq5RW+XJuTq4YS4rBhdg+Uw_18Jg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: rainier: Update to access sensors via iio-hwmon
To: Rashmica Gupta <rashmica.g@gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 29 Mar 2021 at 09:43, Rashmica Gupta <rashmica.g@gmail.com> wrote:
>

Can you add a brief message about why we're adding a iio-hwmon bridge
for these sensors?

> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index fefb0b8fd6d5..2dc72de07906 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -173,6 +173,16 @@ i2c2mux3: i2c@3 {
>                 };
>         };
>
> +       iio-hwmon-dps310 {
> +               compatible = "iio-hwmon";
> +               io-channels = <&dps 0>;
> +       };
> +
> +       iio-hwmon-si7020 {
> +               compatible = "iio-hwmon";
> +               io-channels = <&si 1>;
> +       };
> +
>         leds {
>                 compatible = "gpio-leds";
>
> @@ -1972,9 +1982,10 @@ &i2c7 {
>         multi-master;
>         status = "okay";
>
> -       si7021-a20@20 {
> +       si:si7021-a20@20 {

That's a very short name. How about we call it humidity (or something else)?

Convention is to put a space after the colon.

>                 compatible = "silabs,si7020";
>                 reg = <0x20>;
> +               #io-channel-cells = <1>;
>         };
>
>         tmp275@48 {
> --
> 2.26.3
>
