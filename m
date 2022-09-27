Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8025EBC44
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Sep 2022 09:57:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McBmk3rf5z3c1W
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Sep 2022 17:57:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=PBPtVts4;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=PBPtVts4;
	dkim-atps=neutral
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McBmg2v1Kz3bbm
	for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Sep 2022 17:57:22 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id l8so5990081wmi.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Sep 2022 00:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=L7lzwl2ROYNxZkDiHQ7pKg/1Gs3z2fS+x1+GiBntGvI=;
        b=PBPtVts4kEOw5wKe5Y94V+6sgqGIUUFoKYZMUbUYVbEiyJuCrrz+eHEtyTlUw9kxC6
         FR1+WZWxXoYPqX7foSCNahG2/PswNQWFt26LTY5MO2v6pNrv8+DeLW2n76WFlKpKOlpq
         QTZSsqivAJVsjYPsS+Uv28oTdPtw2MWYA1SHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=L7lzwl2ROYNxZkDiHQ7pKg/1Gs3z2fS+x1+GiBntGvI=;
        b=UxrYwInkSiHFIX9Nr5wyyw1/tJZ0voI6cAim7j0+fbe6O439GTdwiq7uCRRZtTGgCl
         G6JTEGkm8jrTT/+13WYtleMTth/kq8JcvEea4GWjh/ntOjp3+yJ6OwI5o6RfZU/yyHos
         czE7x8nCPKTYom/69os/XuiYks5QsLPUOyQj6ouynEB4qsjiBQodDC/F6a/yvM7su4ET
         MaMi1SMcRUsG0iQe2/p5k3EjRPCMqcf5lkBVWq9H3ZdLbr+zN92NCNUjUC+jNN+xX/am
         fP7ejNcuaT1UEfkQ4NT2yESVRPXq2AXvCp6bmmQgPm0BYLK09GW1PgM4WCEI2G+7lkYG
         O66Q==
X-Gm-Message-State: ACrzQf3wMaj3TXZvLpA3ufRo4+Myw2sz5wWptNcEx16mObgg1yFklPEr
	ASk1z48HPog7bvo+Iu+sHhM72oeQ2GczvCzJJRw=
X-Google-Smtp-Source: AMsMyM7qHFHB+XTY4UMk5ab4ecNrg2RljaRASucq8apG47rSev717kTRZRhhAmP1W8Iap6GMajGd5uLyoozV3C/QwXE=
X-Received: by 2002:a05:600c:198a:b0:3b4:c06a:28b1 with SMTP id
 t10-20020a05600c198a00b003b4c06a28b1mr1643306wmq.72.1664265438160; Tue, 27
 Sep 2022 00:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220805090957.470434-1-j220584470k@gmail.com>
In-Reply-To: <20220805090957.470434-1-j220584470k@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 27 Sep 2022 07:57:06 +0000
Message-ID: <CACPK8Xc-kxwLS6Eb36Jig4mDiz_Z1ynEc127MUOsSsrC0z=xrQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] ARM: dts: aspeed-g6: enable more UART controllers
To: Ken Chen <j220584470k@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin.Lai@quantatw.com, Michael Garner <garnermic@fb.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Cosmo.Chou@quantatw.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 5 Aug 2022 at 09:13, Ken Chen <j220584470k@gmail.com> wrote:
>
> Setup the configuration of UART6, UART7, UART8, and UART9 in
> aspeed-g6.dtsi.
>
> Signed-off-by: Ken Chen <j220584470k@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 64 +++++++++++++++++++++++++++++++-
>  1 file changed, 62 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 8c0de3f27883b..fe7cef6b5e976 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -34,8 +34,12 @@ aliases {
>                 serial2 = &uart3;
>                 serial3 = &uart4;
>                 serial4 = &uart5;
> -               serial5 = &vuart1;
> -               serial6 = &vuart2;

As Andrew mentioned, this may be "ABI" for existing systems. They
expect the vuart to be ttyS5. However, since the beinning they also
have a udev rule that creates a symlink, so it may not be an issue:

bmc:~# ls -la /dev/ttyVUART0
lrwxrwxrwx    1 root     root             5 Jun 10 05:25 /dev/ttyVUART0 -> ttyS5

Can you test your patch with an existing userspace to verify?

I have applied the rest of the patch with the aliases part removed.

> +               serial5 = &uart6;
> +               serial6 = &uart7;
> +               serial7 = &uart8;
> +               serial8 = &uart9;
> +               serial9 = &vuart1;
> +               serial10 = &vuart2;
>         };
>
>
> @@ -745,6 +749,62 @@ uart4: serial@1e78f000 {
>                                 status = "disabled";
>                         };
>
> +                       uart6: serial@1e790000 {
> +                               compatible = "ns16550a";
> +                               reg = <0x1e790000 0x20>;
> +                               reg-shift = <2>;
> +                               reg-io-width = <4>;
> +                               interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> +                               clocks = <&syscon ASPEED_CLK_GATE_UART6CLK>;
> +                               no-loopback-test;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&pinctrl_uart6_default>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       uart7: serial@1e790100 {
> +                               compatible = "ns16550a";
> +                               reg = <0x1e790100 0x20>;
> +                               reg-shift = <2>;
> +                               reg-io-width = <4>;
> +                               interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
> +                               clocks = <&syscon ASPEED_CLK_GATE_UART7CLK>;
> +                               no-loopback-test;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&pinctrl_uart7_default>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       uart8: serial@1e790200 {
> +                               compatible = "ns16550a";
> +                               reg = <0x1e790200 0x20>;
> +                               reg-shift = <2>;
> +                               reg-io-width = <4>;
> +                               interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
> +                               clocks = <&syscon ASPEED_CLK_GATE_UART8CLK>;
> +                               no-loopback-test;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&pinctrl_uart8_default>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       uart9: serial@1e790300 {
> +                               compatible = "ns16550a";
> +                               reg = <0x1e790300 0x20>;
> +                               reg-shift = <2>;
> +                               reg-io-width = <4>;
> +                               interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
> +                               clocks = <&syscon ASPEED_CLK_GATE_UART9CLK>;
> +                               no-loopback-test;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&pinctrl_uart9_default>;
> +
> +                               status = "disabled";
> +                       };
> +
>                         i2c: bus@1e78a000 {
>                                 compatible = "simple-bus";
>                                 #address-cells = <1>;
> --
> 2.31.1
>
