Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0FB4CB279
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 23:45:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K88NJ4GvHz3bfL
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 09:45:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JKKK4ZKr;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::829;
 helo=mail-qt1-x829.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=JKKK4ZKr; dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K88NC2XqHz2xsc
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Mar 2022 09:45:47 +1100 (AEDT)
Received: by mail-qt1-x829.google.com with SMTP id f18so3106307qtb.3
 for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Mar 2022 14:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wLxQSWkpzXF5tY/7dhFq7NegATh4JOWyJEkhfbTW4Mk=;
 b=JKKK4ZKr4cwCdWc1nw3VxKtFXOQrTDf6OBiW5+7nS3JjIQwwd0rolyMVPH5WA3VibD
 LaZc7QbqPQsaq3ayoK7I8Gf8inwR2aXZcEqDR7Pv4+fCNsQrOCH9KMlb1p/O3LO1zd8H
 klXo7j+oEJXwt7YaV/uVVDbo86vBVuvZfGdj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wLxQSWkpzXF5tY/7dhFq7NegATh4JOWyJEkhfbTW4Mk=;
 b=kOoUzmyk0Frf92R2TB3kFiC0AHMWRSFlu63i+qNr3MsRjQeyYIu2f4Or3vbymShIIp
 lkK5M8DF/v8NqwpQayWVYaZFuUG1TthgftsrA8ra3eDVhCnh2PJ7X/McWObbe2+wKSA4
 bVIqZYCGjsruyGjQTyZw37pgCe9mBs7sKOPJ255sVjGy+dBZdDeNf4w2tqFw3Cx6zClS
 TPZAJXUZwAyfkNk6puySTCH26CDFcgh6cNJkk5+OvtIUPsde3euhTaq1mZd4Ft/Fa5jC
 xeVrnZjkCZJrL7lVrDlJ18KMbp2Rh8wEyhGG6epGQjrbTiV4vvE24wDruUA6s1YuaNJo
 lzOw==
X-Gm-Message-State: AOAM533gzS9ikNNwtnydrN5io/pEkBvvrvUHbQpG6eCe9bfW/jXxuZGZ
 n7c5XfyUHEhInGyLSSL/LZr6rzaGV7A1ZYZQtpM=
X-Google-Smtp-Source: ABdhPJymvDCH6PF2srWw9pDWgGtnV5XoPV5xFh1ZDzmH6/M1lw30F42PT45weIxU8j+zOpLU9We9ISprqvrjqkeLYQ4=
X-Received: by 2002:a05:622a:283:b0:2de:b3a2:b52d with SMTP id
 z3-20020a05622a028300b002deb3a2b52dmr22291580qtw.625.1646261144434; Wed, 02
 Mar 2022 14:45:44 -0800 (PST)
MIME-Version: 1.0
References: <20220302173114.927476-1-clg@kaod.org>
 <20220302173114.927476-11-clg@kaod.org>
In-Reply-To: <20220302173114.927476-11-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Mar 2022 22:45:31 +0000
Message-ID: <CACPK8XeDBCMCEO4=w7qUQxsYiFUDKPAuBhXW5Sr6=UHM_GRsWA@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] ARM: dts: aspeed: Enable Dual SPI RX transfers
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

On Wed, 2 Mar 2022 at 17:31, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> All these controllers support at least Dual SPI. Update the DTs.
>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks. I'll apply this to the aspeed tree now.

Did you also have a patch to add a second flash chip to the AST2400 FMC?

> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi | 6 ++++++
>  arch/arm/boot/dts/aspeed-g5.dtsi | 7 +++++++
>  arch/arm/boot/dts/aspeed-g6.dtsi | 8 ++++++++
>  3 files changed, 21 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
> index 9ae67e83cf60..31e6569db97e 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -64,27 +64,32 @@ fmc: spi@1e620000 {
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
> @@ -100,6 +105,7 @@ flash@0 {
>                                 reg =3D < 0 >;
>                                 compatible =3D "jedec,spi-nor";
>                                 spi-max-frequency =3D <50000000>;
> +                               spi-rx-bus-width =3D <2>;
>                                 status =3D "disabled";
>                         };
>                 };
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index c3e0a8e13c8a..29bf017899b6 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -66,18 +66,21 @@ flash@0 {
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
> @@ -93,12 +96,14 @@ flash@0 {
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
> @@ -114,12 +119,14 @@ flash@0 {
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
> index 1ad05dde19d2..ce93c56a21a7 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -106,18 +106,21 @@ flash@0 {
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
> @@ -133,12 +136,14 @@ flash@0 {
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
> @@ -154,18 +159,21 @@ flash@0 {
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
