Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2682B2B3CDB
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Nov 2020 07:14:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZJgL2PcvzDqPw
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Nov 2020 17:14:06 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=EltcBkTm; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZJgF4SFczDqLd
 for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Nov 2020 17:13:59 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id z3so8579638qtw.9
 for <linux-aspeed@lists.ozlabs.org>; Sun, 15 Nov 2020 22:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WKOjBlDK/Lz4Ub9TpRYGCAGqonPtxtyIwbLNf9AfxqA=;
 b=EltcBkTmqEBJnmajY77FtaV6uG0d3s83Q2D2hZ8vz6VZmCz/RM1/S6WdRs0q/wkWvK
 0Bfi/Y9/QcoEQF0c4D7DV9Ht5+QowBpv7UW9lsYKTqfrVNVLspbW2DA6crtd0+/gAZLo
 K4ojnUWF/LgkS2Zp2c1LRTR7hZohc7oWtsVZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WKOjBlDK/Lz4Ub9TpRYGCAGqonPtxtyIwbLNf9AfxqA=;
 b=g3d7yixDhK/F7G/xns1Iggl8KmZjDzFzZAU8BT1sd64BcP+NRwL0hRfI/TxlEAeA3f
 R86LKz3+qu4R8LUQy1/fG7H5YIOvs0q3IC9SYfqrIag1D2/+EPS+3BwnCNPR9QMfb3LE
 ugwPfoV/FdjHWAYqB+decSHUM95hTOBUNFA1Ckep8NVy6f6Pf9fP1dbfskjmBuqsiGl0
 zbCgDFqSkOMUrkQpUR30iPrzQzWzkTjgvO4e2qgF/OCeIrRW8doU6CQUSJzpKzJ0M6oq
 BO8JuRM5TaNCz/TUbhGkEcq/uBhhbLo9/krIxgdDb4D8NMtzXdHgaskCfrrZ2NgMWM4z
 N4gw==
X-Gm-Message-State: AOAM530GRjCaV5x6dZSYHFDvH4OPiu7Tj1JQ+Ns/5dU+Uu7j3czUNCQe
 k26LdqJmaGnyPy3kdVyLcaVbU4C3Lf9xzjACNp6wSwufWAU=
X-Google-Smtp-Source: ABdhPJxyI/NzoLy43TOTPSid5FX7fIXdywhFaNstLDLUyT8HXNdKHDsvRwtNqojKGMmRFlnw7OnQly5dftpIvWiqPfo=
X-Received: by 2002:ac8:4d5b:: with SMTP id x27mr12851506qtv.135.1605507236888; 
 Sun, 15 Nov 2020 22:13:56 -0800 (PST)
MIME-Version: 1.0
References: <1605247168-1028-1-git-send-email-vishwa@linux.vnet.ibm.com>
 <1605247168-1028-6-git-send-email-vishwa@linux.vnet.ibm.com>
In-Reply-To: <1605247168-1028-6-git-send-email-vishwa@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Nov 2020 06:13:43 +0000
Message-ID: <CACPK8XfttMptuYFsocBaj2v4z1vzNjDUfe18FeDcAbmZjWKjfQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] ARM: dts: aspeed: rainier: Add leds that are on
 optional PCI cable cards
To: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>,
 Eddie James <eajames@linux.ibm.com>, 
 Andrew Jeffery <andrew@aj.id.au>, Brad Bishop <bradleyb@fuzziesquirrel.com>
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 13 Nov 2020 at 05:59, Vishwanatha Subbanna
<vishwa@linux.vnet.ibm.com> wrote:
>
> These are LEDs on the cable cards that plug into PCIE slots.
> The LEDs are controlled by PCA9552 I2C expander
>
> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 288 +++++++++++++++++++++++++++
>  1 file changed, 288 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 67c8c40..7de5f76 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -696,6 +696,70 @@
>                         gpios = <&pca4 7 GPIO_ACTIVE_LOW>;
>                 };
>         };
> +
> +       leds-optional-cablecard0 {

Is it necessary to have separate nodes for each of the different GPIO devices?

Would it make sense to combine them, or is it better to be separate?

Andrew, Eddie, Brad: please review this one before I merge it.

> +               compatible = "gpio-leds";
> +
> +               cablecard0-cxp-top {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca5 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               cablecard0-cxp-bot {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca5 1 GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> +       leds-optional-cablecard3 {
> +               compatible = "gpio-leds";
> +
> +               cablecard3-cxp-top {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca6 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               cablecard3-cxp-bot {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca6 1 GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> +       leds-optional-cablecard4 {
> +               compatible = "gpio-leds";
> +
> +               cablecard4-cxp-top {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca7 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               cablecard4-cxp-bot {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca7 1 GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> +       leds-optional-cablecard10 {
> +               compatible = "gpio-leds";
> +
> +               cablecard10-cxp-top {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca8 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               cablecard10-cxp-bot {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca8 1 GPIO_ACTIVE_LOW>;
> +               };
> +       };
>  };
>
>  &ehci1 {
> @@ -1212,6 +1276,180 @@
>                 compatible = "atmel,24c64";
>                 reg = <0x52>;
>         };
> +
> +       pca5: pca9551@60 {
> +               compatible = "nxp,pca9551";
> +               reg = <0x60>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
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
> +       };
> +};
> +
> +&i2c5 {
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
> +       eeprom@50 {
> +               compatible = "atmel,24c64";
> +               reg = <0x50>;
> +       };
> +
> +       eeprom@51 {
> +               compatible = "atmel,24c64";
> +               reg = <0x51>;
> +       };
> +
> +       pca6: pca9551@60 {
> +               compatible = "nxp,pca9551";
> +               reg = <0x60>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
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
> +       };
> +
> +       pca7: pca9551@61 {
> +               compatible = "nxp,pca9551";
> +               reg = <0x61>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
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
> +       };
>  };
>
>  &i2c5 {
> @@ -2028,6 +2266,56 @@
>                 compatible = "atmel,24c64";
>                 reg = <0x51>;
>         };
> +
> +       pca8: pca9551@60 {
> +               compatible = "nxp,pca9551";
> +               reg = <0x60>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
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
> +       };
>  };
>
>  &i2c12 {
> --
> 1.8.3.1
>
