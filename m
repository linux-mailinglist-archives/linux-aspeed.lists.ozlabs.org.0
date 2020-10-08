Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEA5286D47
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Oct 2020 05:49:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6HJK6kJJzDqSn
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Oct 2020 14:49:21 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f44;
 helo=mail-qv1-xf44.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=RyOc7pV/; dkim-atps=neutral
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6HJB3DmXzDqRL
 for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Oct 2020 14:49:12 +1100 (AEDT)
Received: by mail-qv1-xf44.google.com with SMTP id t20so2397162qvv.8
 for <linux-aspeed@lists.ozlabs.org>; Wed, 07 Oct 2020 20:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FVJncJVhajMM+zp4d3/XAEaHEfJTdN0+V5FUwMuQ9sU=;
 b=RyOc7pV/OYTjY/fogETjGmoiNnDrS8W9E6YXApXC7XW1ZA+UoOpLwWOiBlZwgSBovC
 yqmlWZrxBs6HsqiXY13rc44ydIhvzWz5qeIZKMTjaB8RNP6HGDQuE8MUo3IGrNsS1ibU
 n0VY0hQ67h/ujanJb4gRNMZXxC6bck/3vD+7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FVJncJVhajMM+zp4d3/XAEaHEfJTdN0+V5FUwMuQ9sU=;
 b=oPW8rvMd4WVO2A2I+zNExU5XuORy4Sl8gg+T+vlGWO6Vlw1TtMeM1q5Fl5ZxeazLzt
 uIvX7Hd0hVAAXUz7dCleyRqIk7ktspwi3QY26DzJqBWZb3tbkZlwnYa4TeBFsQR6rZ0O
 zkHvHnW2qyjXD5adZOONrrAVNY/MZ/xTd8qH8BUzWrbscIiLf996SdY1rIrnWgyW9I4J
 azZ0l6eer9jjLk39HN0up37donB3SDRe5CBbVNp+cr51b6xIZUnVyjaZjM1v+6ogoedP
 G0K+ktBByrH/nJ2jdLgEvjA5mGL4oZWHfLZUxmib1A+fYUDOPEEx0Q4G48g4Zut+fZTM
 f7Gg==
X-Gm-Message-State: AOAM53324YirsOq8T+ilNFlSo909vhj/qyE2e7LiTEgM0+ak3i/vRss+
 v1kKAnLBEsHrLOfILUByoo32TgW3XbqX7ioCvxEDjCJ1/UpazA==
X-Google-Smtp-Source: ABdhPJwNd4oKjFNRb0MZYBt/9Q30e+i/OvwE7T9wT8behFer7cuyDRNaFzUGTsGGoEoyO3yTC97LaH6FD/+8+FMfMu0=
X-Received: by 2002:a0c:90f1:: with SMTP id p104mr6340263qvp.16.1602128948654; 
 Wed, 07 Oct 2020 20:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201008015106.3198-1-billy_tsai@aspeedtech.com>
 <20201008015106.3198-3-billy_tsai@aspeedtech.com>
In-Reply-To: <20201008015106.3198-3-billy_tsai@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 8 Oct 2020 03:48:56 +0000
Message-ID: <CACPK8XeKdmvVB_CTND7mSRvtTRz8i+Zw1=E06OP-=r3=pnh9gw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Arm: dts: aspeed-g6: Add sgpio node and pinctrl
 setting
To: Billy Tsai <billy_tsai@aspeedtech.com>, Jeremy Kerr <jk@ozlabs.org>, 
 Andrew Jeffery <andrew@aj.id.au>
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 8 Oct 2020 at 01:51, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
> This patch is used to add sgpiom and sgpios nodes and add pinctrl setting
> for sgpiom1

The code looks good Billy.

Please split the change in two: device tree changes (arch/arm/dts) in
one, and pinctrl in the second, as they go through different
maintainers.

You also need to update the device tree bindings in Documentation with
the new compatible strings:

 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt

That should go in it's own patch too.

> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -366,6 +366,58 @@
>                                 #interrupt-cells = <2>;
>                         };
>
> +                       sgpiom0: sgpiom@1e780500 {
> +                               #gpio-cells = <2>;
> +                               gpio-controller;
> +                               compatible = "aspeed,ast2600-sgpiom";

This is interesting. I didn't realise the sgpio driver we have in the
mainline kernel tree (drivers/gpio/gpio-aspeed-sgpio.c) is for the
sgpio master device. It might be best to update the naming of the
ast2400/ast2500 compatible in the future.

> +                               reg = <0x1e780500 0x100>;
> +                               interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> +                               ngpios = <128>;
> +                               clocks = <&syscon ASPEED_CLK_APB2>;
> +                               interrupt-controller;
> +                               bus-frequency = <12000000>;
> +
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&pinctrl_sgpm1_default>;
> +                               status = "disabled";
> +                       };

>                         gpio1: gpio@1e780800 {
>                                 #gpio-cells = <2>;
>                                 gpio-controller;
> @@ -377,6 +429,7 @@
>                                 clocks = <&syscon ASPEED_CLK_APB1>;
>                                 interrupt-controller;
>                                 #interrupt-cells = <2>;
> +                               status = "disabled";

This should be in a different patch set, as it will break all of the
systems that expect GPIO to be enabled (which is all of them).

Considering all of them expect this gpio bank to be enabled, should we
leave it enabled here?


>                         };
>
>                         rtc: rtc@1e781000 {
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> index 34803a6c7664..b673a44ffa3b 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> @@ -46,8 +46,10 @@
>  #define SCU620         0x620 /* Disable GPIO Internal Pull-Down #4 */
>  #define SCU634         0x634 /* Disable GPIO Internal Pull-Down #5 */
>  #define SCU638         0x638 /* Disable GPIO Internal Pull-Down #6 */
> +#define SCU690         0x690 /* Multi-function Pin Control #24 */
>  #define SCU694         0x694 /* Multi-function Pin Control #25 */
>  #define SCU69C         0x69C /* Multi-function Pin Control #27 */
> +#define SCU6D0         0x6D0 /* Multi-function Pin Control #28 */
>  #define SCUC20         0xC20 /* PCIE configuration Setting Control */
>
>  #define ASPEED_G6_NR_PINS 256
> @@ -81,13 +83,21 @@ FUNC_GROUP_DECL(I2C12, L26, K24);
>  #define K26 4
>  SIG_EXPR_LIST_DECL_SESG(K26, MACLINK1, MACLINK1, SIG_DESC_SET(SCU410, 4));
>  SIG_EXPR_LIST_DECL_SESG(K26, SCL13, I2C13, SIG_DESC_SET(SCU4B0, 4));
> -PIN_DECL_2(K26, GPIOA4, MACLINK1, SCL13);
> +/*SGPM2 is A1 Only */
> +SIG_EXPR_LIST_DECL_SESG(K26, SGPM2CLK, SGPM2, SIG_DESC_SET(SCU6D0, 4),
> +                         SIG_DESC_CLEAR(SCU410, 4), SIG_DESC_CLEAR(SCU4B0, 4),
> +                         SIG_DESC_CLEAR(SCU690, 4));
> +PIN_DECL_3(K26, GPIOA4, SGPM2CLK, MACLINK1, SCL13);
>  FUNC_GROUP_DECL(MACLINK1, K26);
>
>  #define L24 5
>  SIG_EXPR_LIST_DECL_SESG(L24, MACLINK2, MACLINK2, SIG_DESC_SET(SCU410, 5));
>  SIG_EXPR_LIST_DECL_SESG(L24, SDA13, I2C13, SIG_DESC_SET(SCU4B0, 5));
> -PIN_DECL_2(L24, GPIOA5, MACLINK2, SDA13);
> +/*SGPM2 is A1 Only */
> +SIG_EXPR_LIST_DECL_SESG(L24, SGPM2LD, SGPM2, SIG_DESC_SET(SCU6D0, 5),
> +                         SIG_DESC_CLEAR(SCU410, 5), SIG_DESC_CLEAR(SCU4B0, 5),
> +                         SIG_DESC_CLEAR(SCU690, 5));
> +PIN_DECL_3(L24, GPIOA5, SGPM2LD, MACLINK2, SDA13);
>  FUNC_GROUP_DECL(MACLINK2, L24);
>
>  FUNC_GROUP_DECL(I2C13, K26, L24);
> @@ -95,16 +105,26 @@ FUNC_GROUP_DECL(I2C13, K26, L24);
>  #define L23 6
>  SIG_EXPR_LIST_DECL_SESG(L23, MACLINK3, MACLINK3, SIG_DESC_SET(SCU410, 6));
>  SIG_EXPR_LIST_DECL_SESG(L23, SCL14, I2C14, SIG_DESC_SET(SCU4B0, 6));
> -PIN_DECL_2(L23, GPIOA6, MACLINK3, SCL14);
> +/*SGPM2 is A1 Only */
> +SIG_EXPR_LIST_DECL_SESG(L23, SGPM2O, SGPM2, SIG_DESC_SET(SCU6D0, 6),
> +                         SIG_DESC_CLEAR(SCU410, 6), SIG_DESC_CLEAR(SCU4B0, 6),
> +                         SIG_DESC_CLEAR(SCU690, 6));
> +PIN_DECL_3(L23, GPIOA6, SGPM2O, MACLINK3, SCL14);
>  FUNC_GROUP_DECL(MACLINK3, L23);
>
>  #define K25 7
>  SIG_EXPR_LIST_DECL_SESG(K25, MACLINK4, MACLINK4, SIG_DESC_SET(SCU410, 7));
>  SIG_EXPR_LIST_DECL_SESG(K25, SDA14, I2C14, SIG_DESC_SET(SCU4B0, 7));
> -PIN_DECL_2(K25, GPIOA7, MACLINK4, SDA14);
> +/*SGPM2 is A1 Only */
> +SIG_EXPR_LIST_DECL_SESG(K25, SGPM2I, SGPM2, SIG_DESC_SET(SCU6D0, 7),
> +                         SIG_DESC_CLEAR(SCU410, 7), SIG_DESC_CLEAR(SCU4B0, 7),
> +                         SIG_DESC_CLEAR(SCU690, 7));
> +PIN_DECL_3(K25, GPIOA7, SGPM2I, MACLINK4, SDA14);
>  FUNC_GROUP_DECL(MACLINK4, K25);
>
>  FUNC_GROUP_DECL(I2C14, L23, K25);
> +/*SGPM2 is A1 Only */
> +FUNC_GROUP_DECL(SGPM2, K26, L24, L23, K25);
>
>  #define J26 8
>  SIG_EXPR_LIST_DECL_SESG(J26, SALT1, SALT1, SIG_DESC_SET(SCU410, 8));
> @@ -2060,6 +2080,7 @@ static const struct aspeed_pin_group aspeed_g6_groups[] = {
>         ASPEED_PINCTRL_GROUP(EMMCG4),
>         ASPEED_PINCTRL_GROUP(EMMCG8),
>         ASPEED_PINCTRL_GROUP(SGPM1),
> +       ASPEED_PINCTRL_GROUP(SGPM2),
>         ASPEED_PINCTRL_GROUP(SGPS1),
>         ASPEED_PINCTRL_GROUP(SIOONCTRL),
>         ASPEED_PINCTRL_GROUP(SIOPBI),
> @@ -2276,6 +2297,7 @@ static const struct aspeed_pin_function aspeed_g6_functions[] = {
>         ASPEED_PINCTRL_FUNC(SD1),
>         ASPEED_PINCTRL_FUNC(SD2),
>         ASPEED_PINCTRL_FUNC(SGPM1),
> +       ASPEED_PINCTRL_FUNC(SGPM2),
>         ASPEED_PINCTRL_FUNC(SGPS1),
>         ASPEED_PINCTRL_FUNC(SIOONCTRL),
>         ASPEED_PINCTRL_FUNC(SIOPBI),
> --
> 2.17.1
>
