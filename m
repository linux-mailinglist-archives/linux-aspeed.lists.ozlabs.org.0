Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB3F4B8148
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Feb 2022 08:21:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jz8XZ3bFCz3c9d
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Feb 2022 18:21:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=XIlpY2Ci;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e;
 helo=mail-qt1-x82e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=XIlpY2Ci; dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jz8XS2syyz2xBL
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Feb 2022 18:21:44 +1100 (AEDT)
Received: by mail-qt1-x82e.google.com with SMTP id r14so1306877qtt.5
 for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Feb 2022 23:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0OJpzZG2s6Ox5c2MteDuzD1t6oUEsSxi/uYhG05ln+o=;
 b=XIlpY2CijHAufToCwE90Tw8Ji+c/jA0OZ+YYf3jN6xLY8wO4iqaaamGGULGGLcTUFH
 fEnBSXHyCWr5aMej08c+2Dr5c86wncICv1QmdjgAx6q+aYC506EzL/BNvEg6ceMvjGRa
 sKK4r39DL5tMTLBU/D5j9z9yaWYERTG15IWI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0OJpzZG2s6Ox5c2MteDuzD1t6oUEsSxi/uYhG05ln+o=;
 b=YjTirt54Iyp5b9w69U7Fs/XuM/d1p/KwVPtUD1K/ZAZIj0UbCcZPKH07mJPcy6Xzyf
 lSS9eg+TuW2p5ViXrA9bOOi4oyYxAs8/enX4/g8AbNeH7fWy2xKGqD09gbCHy1DCTwcf
 c0OLXBfULt+RMp6aGtHdAtFLC9s0xDP6EfxKhk6xA8FrmiC6LP19JrcN7v/p5VWq9Ymm
 N4SItjQcLRqP1GhVvEl+bjgVvSDvXRcmUW5SM2+zk1h4RbEA2XkQMSeIqb0GodPSKdp1
 N9b0ZWXPM6TDIjVX/+p4yj35MQ6hQqiLdna58TsmsacnFwNbfM8aBlh6SWII8QeB4S2G
 MtWg==
X-Gm-Message-State: AOAM531DNdFNlkWGCojug5iryjGaRXrqi7re6oNMwRzUK5tA6sHhr6au
 tCivQFiRpybF6sXZ/vXWXXXc48+b4Bd+45z1aXs=
X-Google-Smtp-Source: ABdhPJzA6l0C3w5nIyZqmUOGDNvMpQfSG2jJhyTSmE/2H0f84Ix2EkssFZZW204yIEa9skj6uTX2l/o+YpyukE86AmI=
X-Received: by 2002:ac8:5b82:0:b0:2cf:232d:b1f8 with SMTP id
 a2-20020ac85b82000000b002cf232db1f8mr1115201qta.58.1644996102080; Tue, 15 Feb
 2022 23:21:42 -0800 (PST)
MIME-Version: 1.0
References: <20220214094231.3753686-1-clg@kaod.org>
 <20220214094231.3753686-10-clg@kaod.org>
In-Reply-To: <20220214094231.3753686-10-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Feb 2022 07:21:29 +0000
Message-ID: <CACPK8Xd5peBdJ2MYH6OcT+vWyjdmKaOpNFw=eHKp6=RPjc6X=g@mail.gmail.com>
Subject: Re: [PATCH 09/10] ARM: dts: aspeed: Enable Dual SPI RX transfers
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 14 Feb 2022 at 09:43, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> All these controllers support at least Dual SPI. Update the DTs.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi | 6 ++++++
>  arch/arm/boot/dts/aspeed-g5.dtsi | 7 +++++++
>  arch/arm/boot/dts/aspeed-g6.dtsi | 8 ++++++++
>  3 files changed, 21 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
> index f14dace34c5a..da211fbd8658 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -65,27 +65,32 @@ fmc: spi@1e620000 {
>                         flash@0 {
>                                 reg =3D < 0 >;
>                                 compatible =3D "jedec,spi-nor";
> +                               spi-rx-bus-width =3D <2>;
>                                 spi-max-frequency =3D <50000000>;
>                                 status =3D "disabled";
>                         };
>                         flash@1 {
>                                 reg =3D < 1 >;
>                                 compatible =3D "jedec,spi-nor";
> +                               spi-rx-bus-width =3D <2>;
>                                 status =3D "disabled";
>                         };
>                         flash@2 {
>                                 reg =3D < 2 >;
>                                 compatible =3D "jedec,spi-nor";
> +                               spi-rx-bus-width =3D <2>;
>                                 status =3D "disabled";
>                         };
>                         flash@3 {
>                                 reg =3D < 3 >;
>                                 compatible =3D "jedec,spi-nor";
> +                               spi-rx-bus-width =3D <2>;
>                                 status =3D "disabled";
>                         };
>                         flash@4 {
>                                 reg =3D < 4 >;
>                                 compatible =3D "jedec,spi-nor";
> +                               spi-rx-bus-width =3D <2>;
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -102,6 +107,7 @@ flash@0 {
>                                 reg =3D < 0 >;
>                                 compatible =3D "jedec,spi-nor";
>                                 spi-max-frequency =3D <50000000>;
> +                               spi-rx-bus-width =3D <2>;
>                                 status =3D "disabled";
>                         };
>                 };
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index 7495f93c5069..804b66d32127 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -67,18 +67,21 @@ flash@0 {
>                                 reg =3D < 0 >;
>                                 compatible =3D "jedec,spi-nor";
>                                 spi-max-frequency =3D <50000000>;
> +                               spi-rx-bus-width =3D <2>;
>                                 status =3D "disabled";
>                         };
>                         flash@1 {
>                                 reg =3D < 1 >;
>                                 compatible =3D "jedec,spi-nor";
>                                 spi-max-frequency =3D <50000000>;
> +                               spi-rx-bus-width =3D <2>;
>                                 status =3D "disabled";
>                         };
>                         flash@2 {
>                                 reg =3D < 2 >;
>                                 compatible =3D "jedec,spi-nor";
>                                 spi-max-frequency =3D <50000000>;
> +                               spi-rx-bus-width =3D <2>;
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -95,12 +98,14 @@ flash@0 {
>                                 reg =3D < 0 >;
>                                 compatible =3D "jedec,spi-nor";
>                                 spi-max-frequency =3D <50000000>;
> +                               spi-rx-bus-width =3D <2>;
>                                 status =3D "disabled";
>                         };
>                         flash@1 {
>                                 reg =3D < 1 >;
>                                 compatible =3D "jedec,spi-nor";
>                                 spi-max-frequency =3D <50000000>;
> +                               spi-rx-bus-width =3D <2>;
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -117,12 +122,14 @@ flash@0 {
>                                 reg =3D < 0 >;
>                                 compatible =3D "jedec,spi-nor";
>                                 spi-max-frequency =3D <50000000>;
> +                               spi-rx-bus-width =3D <2>;
>                                 status =3D "disabled";
>                         };
>                         flash@1 {
>                                 reg =3D < 1 >;
>                                 compatible =3D "jedec,spi-nor";
>                                 spi-max-frequency =3D <50000000>;
> +                               spi-rx-bus-width =3D <2>;
>                                 status =3D "disabled";
>                         };
>                 };
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-=
g6.dtsi
> index c32e87fad4dc..542714c61a85 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -107,18 +107,21 @@ flash@0 {
>                                 reg =3D < 0 >;
>                                 compatible =3D "jedec,spi-nor";
>                                 spi-max-frequency =3D <50000000>;
> +                               spi-rx-bus-width =3D <2>;
>                                 status =3D "disabled";
>                         };
>                         flash@1 {
>                                 reg =3D < 1 >;
>                                 compatible =3D "jedec,spi-nor";
>                                 spi-max-frequency =3D <50000000>;
> +                               spi-rx-bus-width =3D <2>;
>                                 status =3D "disabled";
>                         };
>                         flash@2 {
>                                 reg =3D < 2 >;
>                                 compatible =3D "jedec,spi-nor";
>                                 spi-max-frequency =3D <50000000>;
> +                               spi-rx-bus-width =3D <2>;
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -135,12 +138,14 @@ flash@0 {
>                                 reg =3D < 0 >;
>                                 compatible =3D "jedec,spi-nor";
>                                 spi-max-frequency =3D <50000000>;
> +                               spi-rx-bus-width =3D <2>;
>                                 status =3D "disabled";
>                         };
>                         flash@1 {
>                                 reg =3D < 1 >;
>                                 compatible =3D "jedec,spi-nor";
>                                 spi-max-frequency =3D <50000000>;
> +                               spi-rx-bus-width =3D <2>;
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -157,18 +162,21 @@ flash@0 {
>                                 reg =3D < 0 >;
>                                 compatible =3D "jedec,spi-nor";
>                                 spi-max-frequency =3D <50000000>;
> +                               spi-rx-bus-width =3D <2>;
>                                 status =3D "disabled";
>                         };
>                         flash@1 {
>                                 reg =3D < 1 >;
>                                 compatible =3D "jedec,spi-nor";
>                                 spi-max-frequency =3D <50000000>;
> +                               spi-rx-bus-width =3D <2>;
>                                 status =3D "disabled";
>                         };
>                         flash@2 {
>                                 reg =3D < 2 >;
>                                 compatible =3D "jedec,spi-nor";
>                                 spi-max-frequency =3D <50000000>;
> +                               spi-rx-bus-width =3D <2>;
>                                 status =3D "disabled";
>                         };
>                 };
> --
> 2.34.1
>
