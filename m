Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 349AD3FF853
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Sep 2021 02:20:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0z2Z11k6z2yKF
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Sep 2021 10:20:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ZewuFdMS;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ZewuFdMS; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0ynD73ltz2xr0
 for <linux-aspeed@lists.ozlabs.org>; Fri,  3 Sep 2021 10:08:32 +1000 (AEST)
Received: by mail-qk1-x72e.google.com with SMTP id a10so4135597qka.12
 for <linux-aspeed@lists.ozlabs.org>; Thu, 02 Sep 2021 17:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mM3U+7r66Zh9ElDVdaw9HIMXvz1Ce8MroHsdnVxjXrM=;
 b=ZewuFdMS7skAMAC86b8if3UvFLVvMuGTDX1PDzEG9L+LbFbKiDdQN0GAFqY/u0EZP/
 y9PiODRvmCa753yLEg5WC2bcjAztVskZKDCi9WBX4wQGFWHths+XoVvRjSeY2qHZLYOf
 X2hPdycDbtmN2vZE4HXwZ3VgNifKO3nAN3jvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mM3U+7r66Zh9ElDVdaw9HIMXvz1Ce8MroHsdnVxjXrM=;
 b=BhVFHP3xKOsZ5DbhCtN7vDtkJUDdO35YUEZE8fHwyUj+jDGbddX5O5LlGIWozdckIe
 BhRd/CTuUBfVeml5MzhwUWkAUIcs60QbBAy29ZvJ9n8oE4wUby+1ZYdnzpuvoe8At8jr
 RP14bhIpPbXYWyObHfEuntaCaCutLhlDyGZlWkWRci/b5N+gh8H+DhH532+eARaj/CUF
 wKNjbEBeQEUqn2bVxbpkwoEReRqpLVfq8saj90V77+iT1b7u2wH837lFj1dfT9M/K0bn
 uDE1dxEGEPdH5t6yIKExujVLtcYD5vErdmLZejeg5dIj8IR+Xx2U+8L8jhiUGQ50T1EF
 Ey9Q==
X-Gm-Message-State: AOAM5319ofe7tIeS9GfCAmR+MQ6WSFAgi5XBsDAeBiDrPbhR4naM0rsw
 i8zoYW+R9xEiRH1bbliQPYrNGQXoW5YHyNNz3uo=
X-Google-Smtp-Source: ABdhPJyaYBSyREyFP8Hut+oB5O6XAReuL9BEXu35vblGh885heen5hriJGw0gVBDcS+H2V24ltVmg6Vf/ToOQwv0XJc=
X-Received: by 2002:a37:40d3:: with SMTP id n202mr768274qka.357.1630627708349; 
 Thu, 02 Sep 2021 17:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210830214644.58539-1-eajames@linux.ibm.com>
In-Reply-To: <20210830214644.58539-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 3 Sep 2021 00:08:15 +0000
Message-ID: <CACPK8XcR-=ThNZy6sFtr1kNiEx2BKCNH2gfZKZaFXqQ0_-26uQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: aspeed: rainier: Add system LEDs
To: Eddie James <eajames@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 03 Sep 2021 10:20:03 +1000
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 30 Aug 2021 at 21:46, Eddie James <eajames@linux.ibm.com> wrote:
>
> Add all the missing system LEDs. These are all connected by GPIO
> expanders.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Can you resend this with --minimal added to your git-format-patch
line? It creates a much better diff that is easier to review.

Please cc linux-arm-kernel so it ends up on lore.kernel.org.

It would be good if you could cc some of the people involved in LEDs
so they can review the patch for us. Andrew J and Ravindra perhaps?

Cheers,

Joel


> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 1541 +++++++++++++++---
>  1 file changed, 1325 insertions(+), 216 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index d1467d5163f2..f222aea91b2e 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -1126,6 +1126,62 @@ tmp275@4a {
>                 reg = <0x4a>;
>         };
>
> +       pca9551@60 {
> +               compatible = "nxp,pca9551";
> +               reg = <0x60>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               led@0 {
> +                       label = "cablecard0-cxp-top";
> +                       reg = <0>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@1 {
> +                       label = "cablecard0-cxp-bot";
> +                       reg = <1>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               gpio@2 {
> +                       reg = <2>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@3 {
> +                       reg = <3>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@4 {
> +                       reg = <4>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@5 {
> +                       reg = <5>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@6 {
> +                       reg = <6>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@7 {
> +                       reg = <7>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +       };
> +
>         pca9546@70 {
>                 compatible = "nxp,pca9546";
>                 reg = <0x70>;
> @@ -1182,6 +1238,118 @@ tmp275@49 {
>                 reg = <0x49>;
>         };
>
> +       pca9551@60 {
> +               compatible = "nxp,pca9551";
> +               reg = <0x60>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               led@0 {
> +                       label = "cablecard3-cxp-top";
> +                       reg = <0>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@1 {
> +                       label = "cablecard3-cxp-bot";
> +                       reg = <1>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               gpio@2 {
> +                       reg = <2>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@3 {
> +                       reg = <3>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@4 {
> +                       reg = <4>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@5 {
> +                       reg = <5>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@6 {
> +                       reg = <6>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@7 {
> +                       reg = <7>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +       };
> +
> +       pca9551@61 {
> +               compatible = "nxp,pca9551";
> +               reg = <0x61>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               led@0 {
> +                       label = "cablecard4-cxp-top";
> +                       reg = <0>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@1 {
> +                       label = "cablecard4-cxp-bot";
> +                       reg = <1>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               gpio@2 {
> +                       reg = <2>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@3 {
> +                       reg = <3>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@4 {
> +                       reg = <4>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@5 {
> +                       reg = <5>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@6 {
> +                       reg = <6>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@7 {
> +                       reg = <7>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +       };
> +
>         pca9546@70 {
>                 compatible = "nxp,pca9546";
>                 reg = <0x70>;
> @@ -1290,101 +1458,69 @@ &i2c7 {
>         multi-master;
>         status = "okay";
>
> -       si7021-a20@40 {
> -               compatible = "silabs,si7020";
> -               reg = <0x40>;
> -       };
> -
> -       tmp275@48 {
> -               compatible = "ti,tmp275";
> -               reg = <0x48>;
> -       };
> -
> -       max: max31785@52 {
> -               compatible = "maxim,max31785a";
> -               reg = <0x52>;
> -               #address-cells = <1>;
> -               #size-cells = <0>;
> -
> -               fan0: fan@0 {
> -                       compatible = "pmbus-fan";
> -                       reg = <0>;
> -                       tach-pulses = <2>;
> -               };
> -
> -               fan1: fan@1 {
> -                       compatible = "pmbus-fan";
> -                       reg = <1>;
> -                       tach-pulses = <2>;
> -               };
> -
> -               fan2: fan@2 {
> -                       compatible = "pmbus-fan";
> -                       reg = <2>;
> -                       tach-pulses = <2>;
> -               };
> -
> -               fan3: fan@3 {
> -                       compatible = "pmbus-fan";
> -                       reg = <3>;
> -                       tach-pulses = <2>;
> -               };
> -
> -               fan4: fan@4 {
> -                       compatible = "pmbus-fan";
> -                       reg = <4>;
> -                       tach-pulses = <2>;
> -               };
> -
> -               fan5: fan@5 {
> -                       compatible = "pmbus-fan";
> -                       reg = <5>;
> -                       tach-pulses = <2>;
> -               };
> -       };
> -
> -       pca0: pca9552@61 {
> -               compatible = "nxp,pca9552";
> -               reg = <0x61>;
> +       pca9552@30 {
> +               compatible = "ibm,pca9552";
> +               reg = <0x30>;
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
>                 gpio-controller;
>                 #gpio-cells = <2>;
>
> -               gpio@0 {
> +               led@0 {
> +                       label = "pcieslot0";
>                         reg = <0>;
> -                       type = <PCA955X_TYPE_GPIO>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
>                 };
>
> -               gpio@1 {
> +               led@1 {
> +                       label = "pcieslot1";
>                         reg = <1>;
> -                       type = <PCA955X_TYPE_GPIO>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
>                 };
>
> -               gpio@2 {
> +               led@2 {
> +                       label = "pcieslot2";
>                         reg = <2>;
> -                       type = <PCA955X_TYPE_GPIO>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
>                 };
>
> -               gpio@3 {
> +               led@3 {
> +                       label = "pcieslot3";
>                         reg = <3>;
> -                       type = <PCA955X_TYPE_GPIO>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
>                 };
>
> -               gpio@4 {
> +               led@4 {
> +                       label = "pcieslot4";
>                         reg = <4>;
> -                       type = <PCA955X_TYPE_GPIO>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
>                 };
>
> -               gpio@5 {
> +               led@5 {
> +                       label = "cpu1";
>                         reg = <5>;
> -                       type = <PCA955X_TYPE_GPIO>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
>                 };
>
> -               gpio@6 {
> +               led@6 {
> +                       label = "cpu-vrm1";
>                         reg = <6>;
> -                       type = <PCA955X_TYPE_GPIO>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
>                 };
>
>                 gpio@7 {
> @@ -1392,9 +1528,12 @@ gpio@7 {
>                         type = <PCA955X_TYPE_GPIO>;
>                 };
>
> -               gpio@8 {
> +               led@8 {
> +                       label = "lcd-russel";
>                         reg = <8>;
> -                       type = <PCA955X_TYPE_GPIO>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
>                 };
>
>                 gpio@9 {
> @@ -1433,116 +1572,955 @@ gpio@15 {
>                 };
>         };
>
> -       ibm-panel@62 {
> -               compatible = "ibm,op-panel";
> -               reg = <(0x62 | I2C_OWN_SLAVE_ADDRESS)>;
> -       };
> +       pca9552@31 {
> +               compatible = "ibm,pca9552";
> +               reg = <0x31>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
>
> -       dps: dps310@76 {
> -               compatible = "infineon,dps310";
> -               reg = <0x76>;
> -               #io-channel-cells = <0>;
> -       };
> +               gpio-controller;
> +               #gpio-cells = <2>;
>
> -       eeprom@50 {
> -               compatible = "atmel,24c64";
> -               reg = <0x50>;
> -       };
> +               led@0 {
> +                       label = "ddimm0";
> +                       reg = <0>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
>
> -       eeprom@51 {
> -               compatible = "atmel,24c64";
> -               reg = <0x51>;
> -       };
> -};
> +               led@1 {
> +                       label = "ddimm1";
> +                       reg = <1>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
>
> -&i2c8 {
> -       status = "okay";
> +               led@2 {
> +                       label = "ddimm2";
> +                       reg = <2>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
>
> -       ucd90320@11 {
> -               compatible = "ti,ucd90320";
> -               reg = <0x11>;
> -       };
> +               led@3 {
> +                       label = "ddimm3";
> +                       reg = <3>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
>
> -       rtc@32 {
> -               compatible = "epson,rx8900";
> -               reg = <0x32>;
> -       };
> +               led@4 {
> +                       label = "ddimm4";
> +                       reg = <4>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
>
> -       tmp275@48 {
> -               compatible = "ti,tmp275";
> -               reg = <0x48>;
> -       };
> +               led@5 {
> +                       label = "ddimm5";
> +                       reg = <5>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
>
> -       tmp275@4a {
> -               compatible = "ti,tmp275";
> -               reg = <0x4a>;
> -       };
> +               led@6 {
> +                       label = "ddimm6";
> +                       reg = <6>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@7 {
> +                       label = "ddimm7";
> +                       reg = <7>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@8 {
> +                       label = "ddimm8";
> +                       reg = <8>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@9 {
> +                       label = "ddimm9";
> +                       reg = <9>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@10 {
> +                       label = "ddimm10";
> +                       reg = <10>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@11 {
> +                       label = "ddimm11";
> +                       reg = <11>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@12 {
> +                       label = "ddimm12";
> +                       reg = <12>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@13 {
> +                       label = "ddimm13";
> +                       reg = <13>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@14 {
> +                       label = "ddimm14";
> +                       reg = <14>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@15 {
> +                       label = "ddimm15";
> +                       reg = <15>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +       };
> +
> +       pca9552@32 {
> +               compatible = "ibm,pca9552";
> +               reg = <0x32>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               led@0 {
> +                       label = "ddimm16";
> +                       reg = <0>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@1 {
> +                       label = "ddimm17";
> +                       reg = <1>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@2 {
> +                       label = "ddimm18";
> +                       reg = <2>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@3 {
> +                       label = "ddimm19";
> +                       reg = <3>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@4 {
> +                       label = "ddimm20";
> +                       reg = <4>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@5 {
> +                       label = "ddimm21";
> +                       reg = <5>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@6 {
> +                       label = "ddimm22";
> +                       reg = <6>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@7 {
> +                       label = "ddimm23";
> +                       reg = <7>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@8 {
> +                       label = "ddimm24";
> +                       reg = <8>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@9 {
> +                       label = "ddimm25";
> +                       reg = <9>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@10 {
> +                       label = "ddimm26";
> +                       reg = <10>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@11 {
> +                       label = "ddimm27";
> +                       reg = <11>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@12 {
> +                       label = "ddimm28";
> +                       reg = <12>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@13 {
> +                       label = "ddimm29";
> +                       reg = <13>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@14 {
> +                       label = "ddimm30";
> +                       reg = <14>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@15 {
> +                       label = "ddimm31";
> +                       reg = <15>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +       };
> +
> +       pca9552@33 {
> +               compatible = "ibm,pca9552";
> +               reg = <0x33>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               led@0 {
> +                       label = "planar";
> +                       reg = <0>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@1 {
> +                       label = "cpu0";
> +                       reg = <1>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               gpio@2 {
> +                       reg = <2>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               led@3 {
> +                       label = "dasd-pyramid0";
> +                       reg = <3>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@4 {
> +                       label = "dasd-pyramid1";
> +                       reg = <4>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@5 {
> +                       label = "dasd-pyramid2";
> +                       reg = <5>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@6 {
> +                       label = "cpu0-vrm0";
> +                       reg = <6>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@7 {
> +                       label = "rtc-battery";
> +                       reg = <7>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@8 {
> +                       label = "base-blyth";
> +                       reg = <8>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@9 {
> +                       label = "pcieslot6";
> +                       reg = <9>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@10 {
> +                       label = "pcieslot7";
> +                       reg = <10>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@11 {
> +                       label = "pcieslot8";
> +                       reg = <11>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@12 {
> +                       label = "pcieslot9";
> +                       reg = <12>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@13 {
> +                       label = "pcieslot10";
> +                       reg = <13>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@14 {
> +                       label = "pcieslot11";
> +                       reg = <14>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@15 {
> +                       label = "tpm-wilson";
> +                       reg = <15>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +       };
> +
> +       si7021-a20@40 {
> +               compatible = "silabs,si7020";
> +               reg = <0x40>;
> +       };
> +
> +       tmp275@48 {
> +               compatible = "ti,tmp275";
> +               reg = <0x48>;
> +       };
> +
> +       max: max31785@52 {
> +               compatible = "maxim,max31785a";
> +               reg = <0x52>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               fan0: fan@0 {
> +                       compatible = "pmbus-fan";
> +                       reg = <0>;
> +                       tach-pulses = <2>;
> +               };
> +
> +               fan1: fan@1 {
> +                       compatible = "pmbus-fan";
> +                       reg = <1>;
> +                       tach-pulses = <2>;
> +               };
> +
> +               fan2: fan@2 {
> +                       compatible = "pmbus-fan";
> +                       reg = <2>;
> +                       tach-pulses = <2>;
> +               };
> +
> +               fan3: fan@3 {
> +                       compatible = "pmbus-fan";
> +                       reg = <3>;
> +                       tach-pulses = <2>;
> +               };
> +
> +               fan4: fan@4 {
> +                       compatible = "pmbus-fan";
> +                       reg = <4>;
> +                       tach-pulses = <2>;
> +               };
> +
> +               fan5: fan@5 {
> +                       compatible = "pmbus-fan";
> +                       reg = <5>;
> +                       tach-pulses = <2>;
> +               };
> +       };
> +
> +       pca0: pca9552@61 {
> +               compatible = "nxp,pca9552";
> +               reg = <0x61>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               led@0 {
> +                       label = "fan0";
> +                       reg = <0>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@1 {
> +                       label = "fan1";
> +                       reg = <1>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@2 {
> +                       label = "fan2";
> +                       reg = <2>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@3 {
> +                       label = "fan3";
> +                       reg = <3>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@4 {
> +                       label = "fan4";
> +                       reg = <4>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@5 {
> +                       label = "fan5";
> +                       reg = <5>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               gpio@6 {
> +                       reg = <6>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@7 {
> +                       reg = <7>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@8 {
> +                       reg = <8>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@9 {
> +                       reg = <9>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@10 {
> +                       reg = <10>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@11 {
> +                       reg = <11>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@12 {
> +                       reg = <12>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@13 {
> +                       reg = <13>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@14 {
> +                       reg = <14>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@15 {
> +                       reg = <15>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +       };
> +
> +       ibm-panel@62 {
> +               compatible = "ibm,op-panel";
> +               reg = <(0x62 | I2C_OWN_SLAVE_ADDRESS)>;
> +       };
> +
> +       dps: dps310@76 {
> +               compatible = "infineon,dps310";
> +               reg = <0x76>;
> +               #io-channel-cells = <0>;
> +       };
> +
> +       eeprom@50 {
> +               compatible = "atmel,24c64";
> +               reg = <0x50>;
> +       };
> +
> +       eeprom@51 {
> +               compatible = "atmel,24c64";
> +               reg = <0x51>;
> +       };
> +};
> +
> +&i2c8 {
> +       status = "okay";
> +
> +       ucd90320@11 {
> +               compatible = "ti,ucd90320";
> +               reg = <0x11>;
> +       };
> +
> +       rtc@32 {
> +               compatible = "epson,rx8900";
> +               reg = <0x32>;
> +       };
> +
> +       tmp275@48 {
> +               compatible = "ti,tmp275";
> +               reg = <0x48>;
> +       };
> +
> +       tmp275@4a {
> +               compatible = "ti,tmp275";
> +               reg = <0x4a>;
> +       };
>
>         eeprom@50 {
>                 compatible = "atmel,24c64";
>                 reg = <0x50>;
>         };
>
> -       eeprom@51 {
> +       eeprom@51 {
> +               compatible = "atmel,24c64";
> +               reg = <0x51>;
> +       };
> +
> +       pca_pres2: pca9552@61 {
> +               compatible = "nxp,pca9552";
> +               reg = <0x61>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio-line-names =
> +                       "SLOT6_PRSNT_EN_RSVD", "SLOT7_PRSNT_EN_RSVD",
> +                       "SLOT8_PRSNT_EN_RSVD", "SLOT9_PRSNT_EN_RSVD",
> +                       "SLOT10_PRSNT_EN_RSVD", "SLOT11_PRSNT_EN_RSVD",
> +                       "SLOT6_EXPANDER_PRSNT_N", "SLOT7_EXPANDER_PRSNT_N",
> +                       "SLOT8_EXPANDER_PRSNT_N", "SLOT9_EXPANDER_PRSNT_N",
> +                       "SLOT10_EXPANDER_PRSNT_N", "SLOT11_EXPANDER_PRSNT_N",
> +                       "", "", "", "";
> +
> +               gpio@0 {
> +                       reg = <0>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@1 {
> +                       reg = <1>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@2 {
> +                       reg = <2>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@3 {
> +                       reg = <3>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@4 {
> +                       reg = <4>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@5 {
> +                       reg = <5>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@6 {
> +                       reg = <6>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@7 {
> +                       reg = <7>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@8 {
> +                       reg = <8>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@9 {
> +                       reg = <9>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@10 {
> +                       reg = <10>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@11 {
> +                       reg = <11>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@12 {
> +                       reg = <12>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@13 {
> +                       reg = <13>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@14 {
> +                       reg = <14>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@15 {
> +                       reg = <15>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +       };
> +
> +};
> +
> +&i2c9 {
> +       status = "okay";
> +
> +       tmp423a@4c {
> +               compatible = "ti,tmp423";
> +               reg = <0x4c>;
> +       };
> +
> +       tmp423b@4d {
> +               compatible = "ti,tmp423";
> +               reg = <0x4d>;
> +       };
> +
> +       eeprom@50 {
> +               compatible = "atmel,24c128";
> +               reg = <0x50>;
> +       };
> +};
> +
> +&i2c10 {
> +       status = "okay";
> +
> +       tmp423a@4c {
> +               compatible = "ti,tmp423";
> +               reg = <0x4c>;
> +       };
> +
> +       tmp423b@4d {
> +               compatible = "ti,tmp423";
> +               reg = <0x4d>;
> +       };
> +
> +       eeprom@50 {
> +               compatible = "atmel,24c128";
> +               reg = <0x50>;
> +       };
> +};
> +
> +&i2c11 {
> +       status = "okay";
> +
> +       tmp275@48 {
> +               compatible = "ti,tmp275";
> +               reg = <0x48>;
> +       };
> +
> +       tmp275@49 {
> +               compatible = "ti,tmp275";
> +               reg = <0x49>;
> +       };
> +
> +       pca9551@60 {
> +               compatible = "nxp,pca9551";
> +               reg = <0x60>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               led@0 {
> +                       label = "cablecard10-cxp-top";
> +                       reg = <0>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@1 {
> +                       label = "cablecard10-cxp-bot";
> +                       reg = <1>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               gpio@2 {
> +                       reg = <2>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@3 {
> +                       reg = <3>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@4 {
> +                       reg = <4>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@5 {
> +                       reg = <5>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@6 {
> +                       reg = <6>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@7 {
> +                       reg = <7>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +       };
> +
> +       pca9546@70 {
> +               compatible = "nxp,pca9546";
> +               reg = <0x70>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               status = "okay";
> +               i2c-mux-idle-disconnect;
> +
> +               i2c11mux0chn0: i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +
> +                       eeprom@50 {
> +                               compatible = "atmel,24c64";
> +                               reg = <0x50>;
> +                       };
> +               };
> +
> +               i2c11mux0chn1: i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +
> +                       eeprom@51 {
> +                               compatible = "atmel,24c64";
> +                               reg = <0x51>;
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c12 {
> +       status = "okay";
> +};
> +
> +&i2c13 {
> +       status = "okay";
> +
> +       eeprom@50 {
>                 compatible = "atmel,24c64";
> -               reg = <0x51>;
> +               reg = <0x50>;
>         };
>
> -       pca_pres2: pca9552@61 {
> +       pca9552@60 {
>                 compatible = "nxp,pca9552";
> -               reg = <0x61>;
> +               reg = <0x60>;
>                 #address-cells = <1>;
>                 #size-cells = <0>;
> +
>                 gpio-controller;
>                 #gpio-cells = <2>;
>
> -               gpio-line-names =
> -                       "SLOT6_PRSNT_EN_RSVD", "SLOT7_PRSNT_EN_RSVD",
> -                       "SLOT8_PRSNT_EN_RSVD", "SLOT9_PRSNT_EN_RSVD",
> -                       "SLOT10_PRSNT_EN_RSVD", "SLOT11_PRSNT_EN_RSVD",
> -                       "SLOT6_EXPANDER_PRSNT_N", "SLOT7_EXPANDER_PRSNT_N",
> -                       "SLOT8_EXPANDER_PRSNT_N", "SLOT9_EXPANDER_PRSNT_N",
> -                       "SLOT10_EXPANDER_PRSNT_N", "SLOT11_EXPANDER_PRSNT_N",
> -                       "", "", "", "";
> -
> -               gpio@0 {
> +               led@0 {
> +                       label = "nvme0";
>                         reg = <0>;
> -                       type = <PCA955X_TYPE_GPIO>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
>                 };
>
> -               gpio@1 {
> +               led@1 {
> +                       label = "nvme1";
>                         reg = <1>;
> -                       type = <PCA955X_TYPE_GPIO>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
>                 };
>
> -               gpio@2 {
> +               led@2 {
> +                       label = "nvme2";
>                         reg = <2>;
> -                       type = <PCA955X_TYPE_GPIO>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
>                 };
>
> -               gpio@3 {
> +               led@3 {
> +                       label = "nvme3";
>                         reg = <3>;
> -                       type = <PCA955X_TYPE_GPIO>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
>                 };
>
> -               gpio@4 {
> +               led@4 {
> +                       label = "nvme4";
>                         reg = <4>;
> -                       type = <PCA955X_TYPE_GPIO>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
>                 };
>
> -               gpio@5 {
> +               led@5 {
> +                       label = "nvme5";
>                         reg = <5>;
> -                       type = <PCA955X_TYPE_GPIO>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
>                 };
>
> -               gpio@6 {
> +               led@6 {
> +                       label = "nvme6";
>                         reg = <6>;
> -                       type = <PCA955X_TYPE_GPIO>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
>                 };
>
> -               gpio@7 {
> +               led@7 {
> +                       label = "nvme7";
>                         reg = <7>;
> -                       type = <PCA955X_TYPE_GPIO>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
>                 };
>
>                 gpio@8 {
> @@ -1585,111 +2563,128 @@ gpio@15 {
>                         type = <PCA955X_TYPE_GPIO>;
>                 };
>         };
> -
>  };
>
> -&i2c9 {
> +&i2c14 {
>         status = "okay";
>
> -       tmp423a@4c {
> -               compatible = "ti,tmp423";
> -               reg = <0x4c>;
> -       };
> -
> -       tmp423b@4d {
> -               compatible = "ti,tmp423";
> -               reg = <0x4d>;
> -       };
> -
>         eeprom@50 {
> -               compatible = "atmel,24c128";
> +               compatible = "atmel,24c64";
>                 reg = <0x50>;
>         };
> -};
>
> -&i2c10 {
> -       status = "okay";
> +       pca9552@60 {
> +               compatible = "nxp,pca9552";
> +               reg = <0x60>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
>
> -       tmp423a@4c {
> -               compatible = "ti,tmp423";
> -               reg = <0x4c>;
> -       };
> +               gpio-controller;
> +               #gpio-cells = <2>;
>
> -       tmp423b@4d {
> -               compatible = "ti,tmp423";
> -               reg = <0x4d>;
> -       };
> +               led@0 {
> +                       label = "nvme8";
> +                       reg = <0>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
>
> -       eeprom@50 {
> -               compatible = "atmel,24c128";
> -               reg = <0x50>;
> -       };
> -};
> +               led@1 {
> +                       label = "nvme9";
> +                       reg = <1>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
>
> -&i2c11 {
> -       status = "okay";
> +               led@2 {
> +                       label = "nvme10";
> +                       reg = <2>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
>
> -       tmp275@48 {
> -               compatible = "ti,tmp275";
> -               reg = <0x48>;
> -       };
> +               led@3 {
> +                       label = "nvme11";
> +                       reg = <3>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
>
> -       tmp275@49 {
> -               compatible = "ti,tmp275";
> -               reg = <0x49>;
> -       };
> +               led@4 {
> +                       label = "nvme12";
> +                       reg = <4>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
>
> -       pca9546@70 {
> -               compatible = "nxp,pca9546";
> -               reg = <0x70>;
> -               #address-cells = <1>;
> -               #size-cells = <0>;
> -               status = "okay";
> -               i2c-mux-idle-disconnect;
> +               led@5 {
> +                       label = "nvme13";
> +                       reg = <5>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
>
> -               i2c11mux0chn0: i2c@0 {
> -                       #address-cells = <1>;
> -                       #size-cells = <0>;
> -                       reg = <0>;
> +               led@6 {
> +                       label = "nvme14";
> +                       reg = <6>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
>
> -                       eeprom@50 {
> -                               compatible = "atmel,24c64";
> -                               reg = <0x50>;
> -                       };
> +               led@7 {
> +                       label = "nvme15";
> +                       reg = <7>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
>                 };
>
> -               i2c11mux0chn1: i2c@1 {
> -                       #address-cells = <1>;
> -                       #size-cells = <0>;
> -                       reg = <1>;
> +               gpio@8 {
> +                       reg = <8>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
>
> -                       eeprom@51 {
> -                               compatible = "atmel,24c64";
> -                               reg = <0x51>;
> -                       };
> +               gpio@9 {
> +                       reg = <9>;
> +                       type = <PCA955X_TYPE_GPIO>;
>                 };
> -       };
> -};
>
> -&i2c12 {
> -       status = "okay";
> -};
> +               gpio@10 {
> +                       reg = <10>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
>
> -&i2c13 {
> -       status = "okay";
> +               gpio@11 {
> +                       reg = <11>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
>
> -       eeprom@50 {
> -               compatible = "atmel,24c64";
> -               reg = <0x50>;
> -       };
> -};
> +               gpio@12 {
> +                       reg = <12>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
>
> -&i2c14 {
> -       status = "okay";
> +               gpio@13 {
> +                       reg = <13>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
>
> -       eeprom@50 {
> -               compatible = "atmel,24c64";
> -               reg = <0x50>;
> +               gpio@14 {
> +                       reg = <14>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@15 {
> +                       reg = <15>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
>         };
>  };
>
> @@ -1700,6 +2695,120 @@ eeprom@50 {
>                 compatible = "atmel,24c64";
>                 reg = <0x50>;
>         };
> +
> +       pca9552@60 {
> +               compatible = "nxp,pca9552";
> +               reg = <0x60>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               led@0 {
> +                       label = "nvme16";
> +                       reg = <0>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@1 {
> +                       label = "nvme17";
> +                       reg = <1>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@2 {
> +                       label = "nvme18";
> +                       reg = <2>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@3 {
> +                       label = "nvme19";
> +                       reg = <3>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@4 {
> +                       label = "nvme20";
> +                       reg = <4>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@5 {
> +                       label = "nvme21";
> +                       reg = <5>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@6 {
> +                       label = "nvme22";
> +                       reg = <6>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               led@7 {
> +                       label = "nvme23";
> +                       reg = <7>;
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +
> +               gpio@8 {
> +                       reg = <8>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@9 {
> +                       reg = <9>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@10 {
> +                       reg = <10>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@11 {
> +                       reg = <11>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@12 {
> +                       reg = <12>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@13 {
> +                       reg = <13>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@14 {
> +                       reg = <14>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@15 {
> +                       reg = <15>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +       };
>  };
>
>  &vuart1 {
> --
> 2.27.0
>
