Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 369EB4CB226
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 23:18:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K87mX1ynVz3bcX
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 09:18:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=kKssYOal;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82f;
 helo=mail-qt1-x82f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=kKssYOal; dkim-atps=neutral
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K87mR3Pcyz2yb5
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Mar 2022 09:18:15 +1100 (AEDT)
Received: by mail-qt1-x82f.google.com with SMTP id t28so3020970qtc.7
 for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Mar 2022 14:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2JRE6tbH9Jchu709JG4dssWGKFhyKl3gMsPnj2zX+PA=;
 b=kKssYOalX/FXhhqROEbcNxZ1Xddce0m3w13wsWFdcHHXL+HS5ZulI1OyHuKUp6bDlo
 Z/YGveSc8kPzpploW3uii7UvJwBRhXAO8FZR9fMfes3JHn0N6Q+he2swoS8YiW+Rchpo
 ocKtuGRvBEXB90CPMVjaIv0uBqWcVElO9/IuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2JRE6tbH9Jchu709JG4dssWGKFhyKl3gMsPnj2zX+PA=;
 b=ZF3yvQrUqpUtWCyNPB3HZZfBVTlE8dbX11V/8pARg33GBmZq0cKC4ZsrOoJrVWgcsF
 LT6TGaYTcSzGpNR47NjJz3JUFaeGmVRDPa5zFc5RdueQNiYAUQyPa53LhpE04rlUWtvu
 U8ikEVk04CtR9MZ23JfzFk1b8BRnCFfyYI8fksuvGsmMHSy8CCTaKdMnfpZOz5OiONcD
 tQ5HwArZQtapEa0thV/3MOGA+luThWWqpRPmrwhPjVKXAQxRzI9ozLmeMvdndVDADQ8l
 A0BF2BwHrPZkC7OXOmut86mGU89Vt0WOkLYyo7okdbYerQwJq3eQBSXjPQkK98Gkbcvy
 2/fQ==
X-Gm-Message-State: AOAM531DHK/RDmY8CBeQJH+wP93dQPX0nenmL6ByQpSKM8Yk81m4vl63
 B7q4GiOX5FVIhC3p3FUqn9XBJ0EBdRrPZ8eYlEg=
X-Google-Smtp-Source: ABdhPJxRlFb0AT7SCyWwi+w7C/nNOeB3qsPtkPJA5AY8m0O88pSi5Hia8/814ex0IlxYX3s0CwkZASyT+/WE78Emhfs=
X-Received: by 2002:a05:622a:283:b0:2de:b3a2:b52d with SMTP id
 z3-20020a05622a028300b002deb3a2b52dmr22224392qtw.625.1646259492771; Wed, 02
 Mar 2022 14:18:12 -0800 (PST)
MIME-Version: 1.0
References: <20220302173114.927476-1-clg@kaod.org>
 <20220302173114.927476-3-clg@kaod.org>
In-Reply-To: <20220302173114.927476-3-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Mar 2022 22:18:00 +0000
Message-ID: <CACPK8XdqYJeRkGN3j0qKfSnbYHgAsogKhv7e1PGTY+MBy=N=Rg@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] ARM: dts: aspeed: Adjust "reg" property of
 FMC/SPI controllers
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2 Mar 2022 at 17:32, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> This is compatible with the current driver and addresses issues when
> running 'make dt_binding_check'.

Hey Rob, why does the checking rule complain about this style of reg proper=
ty?

>
> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi | 6 ++----
>  arch/arm/boot/dts/aspeed-g5.dtsi | 9 +++------
>  arch/arm/boot/dts/aspeed-g6.dtsi | 9 +++------
>  3 files changed, 8 insertions(+), 16 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
> index f14dace34c5a..9ae67e83cf60 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -54,8 +54,7 @@ ahb {
>                 ranges;
>
>                 fmc: spi@1e620000 {
> -                       reg =3D < 0x1e620000 0x94
> -                               0x20000000 0x10000000 >;
> +                       reg =3D <0x1e620000 0x94>, <0x20000000 0x10000000=
>;
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         compatible =3D "aspeed,ast2400-fmc";
> @@ -91,8 +90,7 @@ flash@4 {
>                 };
>
>                 spi: spi@1e630000 {
> -                       reg =3D < 0x1e630000 0x18
> -                               0x30000000 0x10000000 >;
> +                       reg =3D <0x1e630000 0x18>, <0x30000000 0x10000000=
>;
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         compatible =3D "aspeed,ast2400-spi";
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index 7495f93c5069..c3e0a8e13c8a 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -55,8 +55,7 @@ ahb {
>                 ranges;
>
>                 fmc: spi@1e620000 {
> -                       reg =3D < 0x1e620000 0xc4
> -                               0x20000000 0x10000000 >;
> +                       reg =3D <0x1e620000 0xc4>, <0x20000000 0x10000000=
>;
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         compatible =3D "aspeed,ast2500-fmc";
> @@ -84,8 +83,7 @@ flash@2 {
>                 };
>
>                 spi1: spi@1e630000 {
> -                       reg =3D < 0x1e630000 0xc4
> -                               0x30000000 0x08000000 >;
> +                       reg =3D <0x1e630000 0xc4>, <0x30000000 0x08000000=
>;
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         compatible =3D "aspeed,ast2500-spi";
> @@ -106,8 +104,7 @@ flash@1 {
>                 };
>
>                 spi2: spi@1e631000 {
> -                       reg =3D < 0x1e631000 0xc4
> -                               0x38000000 0x08000000 >;
> +                       reg =3D <0x1e631000 0xc4>, <0x38000000 0x08000000=
>;
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         compatible =3D "aspeed,ast2500-spi";
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-=
g6.dtsi
> index c32e87fad4dc..1ad05dde19d2 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -95,8 +95,7 @@ gic: interrupt-controller@40461000 {
>                         };
>
>                 fmc: spi@1e620000 {
> -                       reg =3D < 0x1e620000 0xc4
> -                               0x20000000 0x10000000 >;
> +                       reg =3D <0x1e620000 0xc4>, <0x20000000 0x10000000=
>;
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         compatible =3D "aspeed,ast2600-fmc";
> @@ -124,8 +123,7 @@ flash@2 {
>                 };
>
>                 spi1: spi@1e630000 {
> -                       reg =3D < 0x1e630000 0xc4
> -                               0x30000000 0x10000000 >;
> +                       reg =3D <0x1e630000 0xc4>, <0x30000000 0x10000000=
>;
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         compatible =3D "aspeed,ast2600-spi";
> @@ -146,8 +144,7 @@ flash@1 {
>                 };
>
>                 spi2: spi@1e631000 {
> -                       reg =3D < 0x1e631000 0xc4
> -                               0x50000000 0x10000000 >;
> +                       reg =3D <0x1e631000 0xc4>, <0x50000000 0x10000000=
>;
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         compatible =3D "aspeed,ast2600-spi";
> --
> 2.34.1
>
