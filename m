Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 846A04CB28D
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 23:49:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K88SG4MfKz3bcg
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 09:49:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=afkxXKmP;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::830;
 helo=mail-qt1-x830.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=afkxXKmP; dkim-atps=neutral
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K88S90VtXz306m
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Mar 2022 09:49:12 +1100 (AEDT)
Received: by mail-qt1-x830.google.com with SMTP id a1so3059832qta.13
 for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Mar 2022 14:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=w/QeTGizctCe/lCvmDH1b/DvToPpxOQCqRpfxZuWv28=;
 b=afkxXKmP4vgQGD2EE5HprQH2X5UgEcVUkXVmApWi5dntSCUUp3EaVbVDV9STJR8z59
 D5N0AieGgMKi3GyCkx2a8Ks2SsJ67PPkisdxWEQAXzqTvkVEz8JUwswyS6Dg/86N3JoF
 88bjGJMQTFVAibzkb8Gj7zZaqx9EHHkREazbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w/QeTGizctCe/lCvmDH1b/DvToPpxOQCqRpfxZuWv28=;
 b=6C6eGtPK4zrzV0n7GfWoFObtvSvp24RceHRwYry4m9v5PPInc46UI43JKBZmClt0cE
 F86Vv3AzbfEu7b0pYLbhrDmS94lxGDQmBdxqw15e8jAB9IPVYdC999/zoXGoW54BToCX
 D2oCQrSTux6tKTonqJhULi7Gv9k0enz6LaGKdOh18tmJhS5i5GJ/Y3njWQAbxGmHGUJE
 8Xa2JEG5HmyIygohn18Nq+Pxe8SKGIcczMa0HVYitBsjXg1lWRmHUcs0A0khc29kGtgP
 GuS52YzoTk2LaOZQpPJ6QWNwQ0JwsIlv63uSFmsuSLBu5EnwP5vDwvWJ9EVsUX/D/3Ho
 Cb+Q==
X-Gm-Message-State: AOAM5304nFpDerP0nCrBhefi1gAVZSFD6xmK84uDkc9xnC5O0sefzx4r
 RqFgh/+FCF9fKz9eM2l5MWvPpLUxrOnZ65mBvt4=
X-Google-Smtp-Source: ABdhPJwcRIUuSCOa0NIMdNnY7uIfvSl3sBRNTtNc09Jy3EHvdAiMXNhsdMI3cg/+3wWITyoi069ULAwsRr28IETf5DQ=
X-Received: by 2002:ac8:5b82:0:b0:2cf:232d:b1f8 with SMTP id
 a2-20020ac85b82000000b002cf232db1f8mr25803033qta.58.1646261351104; Wed, 02
 Mar 2022 14:49:11 -0800 (PST)
MIME-Version: 1.0
References: <20220302173114.927476-1-clg@kaod.org>
 <20220302173114.927476-11-clg@kaod.org>
 <CACPK8XeDBCMCEO4=w7qUQxsYiFUDKPAuBhXW5Sr6=UHM_GRsWA@mail.gmail.com>
In-Reply-To: <CACPK8XeDBCMCEO4=w7qUQxsYiFUDKPAuBhXW5Sr6=UHM_GRsWA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Mar 2022 22:48:58 +0000
Message-ID: <CACPK8Xd6VJLuWsvSjYrQ-y=yS+yR7vjdWECfsd2W9_J7e09K-A@mail.gmail.com>
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

On Wed, 2 Mar 2022 at 22:45, Joel Stanley <joel@jms.id.au> wrote:
>
> On Wed, 2 Mar 2022 at 17:31, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >
> > All these controllers support at least Dual SPI. Update the DTs.
> >
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> Thanks. I'll apply this to the aspeed tree now.
>
> Did you also have a patch to add a second flash chip to the AST2400 FMC?

That was a reference to the discussion on the openbmc list with Tao. I
was mistaken; the flash chips are there, but they lack the
spi-max-frequency property.

>
> > ---
> >  arch/arm/boot/dts/aspeed-g4.dtsi | 6 ++++++
> >  arch/arm/boot/dts/aspeed-g5.dtsi | 7 +++++++
> >  arch/arm/boot/dts/aspeed-g6.dtsi | 8 ++++++++
> >  3 files changed, 21 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspee=
d-g4.dtsi
> > index 9ae67e83cf60..31e6569db97e 100644
> > --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> > @@ -64,27 +64,32 @@ fmc: spi@1e620000 {
> >                         flash@0 {
> >                                 reg =3D < 0 >;
> >                                 compatible =3D "jedec,spi-nor";
> > +                               spi-rx-bus-width =3D <2>;
> >                                 spi-max-frequency =3D <50000000>;
> >                                 status =3D "disabled";
> >                         };
> >                         flash@1 {
> >                                 reg =3D < 1 >;
> >                                 compatible =3D "jedec,spi-nor";
> > +                               spi-rx-bus-width =3D <2>;
> >                                 status =3D "disabled";
> >                         };
> >                         flash@2 {
> >                                 reg =3D < 2 >;
> >                                 compatible =3D "jedec,spi-nor";
> > +                               spi-rx-bus-width =3D <2>;
> >                                 status =3D "disabled";
> >                         };
> >                         flash@3 {
> >                                 reg =3D < 3 >;
> >                                 compatible =3D "jedec,spi-nor";
> > +                               spi-rx-bus-width =3D <2>;
> >                                 status =3D "disabled";
> >                         };
> >                         flash@4 {
> >                                 reg =3D < 4 >;
> >                                 compatible =3D "jedec,spi-nor";
> > +                               spi-rx-bus-width =3D <2>;
> >                                 status =3D "disabled";
> >                         };
> >                 };
> > @@ -100,6 +105,7 @@ flash@0 {
> >                                 reg =3D < 0 >;
> >                                 compatible =3D "jedec,spi-nor";
> >                                 spi-max-frequency =3D <50000000>;
> > +                               spi-rx-bus-width =3D <2>;
> >                                 status =3D "disabled";
> >                         };
> >                 };
> > diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspee=
d-g5.dtsi
> > index c3e0a8e13c8a..29bf017899b6 100644
> > --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> > @@ -66,18 +66,21 @@ flash@0 {
> >                                 reg =3D < 0 >;
> >                                 compatible =3D "jedec,spi-nor";
> >                                 spi-max-frequency =3D <50000000>;
> > +                               spi-rx-bus-width =3D <2>;
> >                                 status =3D "disabled";
> >                         };
> >                         flash@1 {
> >                                 reg =3D < 1 >;
> >                                 compatible =3D "jedec,spi-nor";
> >                                 spi-max-frequency =3D <50000000>;
> > +                               spi-rx-bus-width =3D <2>;
> >                                 status =3D "disabled";
> >                         };
> >                         flash@2 {
> >                                 reg =3D < 2 >;
> >                                 compatible =3D "jedec,spi-nor";
> >                                 spi-max-frequency =3D <50000000>;
> > +                               spi-rx-bus-width =3D <2>;
> >                                 status =3D "disabled";
> >                         };
> >                 };
> > @@ -93,12 +96,14 @@ flash@0 {
> >                                 reg =3D < 0 >;
> >                                 compatible =3D "jedec,spi-nor";
> >                                 spi-max-frequency =3D <50000000>;
> > +                               spi-rx-bus-width =3D <2>;
> >                                 status =3D "disabled";
> >                         };
> >                         flash@1 {
> >                                 reg =3D < 1 >;
> >                                 compatible =3D "jedec,spi-nor";
> >                                 spi-max-frequency =3D <50000000>;
> > +                               spi-rx-bus-width =3D <2>;
> >                                 status =3D "disabled";
> >                         };
> >                 };
> > @@ -114,12 +119,14 @@ flash@0 {
> >                                 reg =3D < 0 >;
> >                                 compatible =3D "jedec,spi-nor";
> >                                 spi-max-frequency =3D <50000000>;
> > +                               spi-rx-bus-width =3D <2>;
> >                                 status =3D "disabled";
> >                         };
> >                         flash@1 {
> >                                 reg =3D < 1 >;
> >                                 compatible =3D "jedec,spi-nor";
> >                                 spi-max-frequency =3D <50000000>;
> > +                               spi-rx-bus-width =3D <2>;
> >                                 status =3D "disabled";
> >                         };
> >                 };
> > diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspee=
d-g6.dtsi
> > index 1ad05dde19d2..ce93c56a21a7 100644
> > --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> > @@ -106,18 +106,21 @@ flash@0 {
> >                                 reg =3D < 0 >;
> >                                 compatible =3D "jedec,spi-nor";
> >                                 spi-max-frequency =3D <50000000>;
> > +                               spi-rx-bus-width =3D <2>;
> >                                 status =3D "disabled";
> >                         };
> >                         flash@1 {
> >                                 reg =3D < 1 >;
> >                                 compatible =3D "jedec,spi-nor";
> >                                 spi-max-frequency =3D <50000000>;
> > +                               spi-rx-bus-width =3D <2>;
> >                                 status =3D "disabled";
> >                         };
> >                         flash@2 {
> >                                 reg =3D < 2 >;
> >                                 compatible =3D "jedec,spi-nor";
> >                                 spi-max-frequency =3D <50000000>;
> > +                               spi-rx-bus-width =3D <2>;
> >                                 status =3D "disabled";
> >                         };
> >                 };
> > @@ -133,12 +136,14 @@ flash@0 {
> >                                 reg =3D < 0 >;
> >                                 compatible =3D "jedec,spi-nor";
> >                                 spi-max-frequency =3D <50000000>;
> > +                               spi-rx-bus-width =3D <2>;
> >                                 status =3D "disabled";
> >                         };
> >                         flash@1 {
> >                                 reg =3D < 1 >;
> >                                 compatible =3D "jedec,spi-nor";
> >                                 spi-max-frequency =3D <50000000>;
> > +                               spi-rx-bus-width =3D <2>;
> >                                 status =3D "disabled";
> >                         };
> >                 };
> > @@ -154,18 +159,21 @@ flash@0 {
> >                                 reg =3D < 0 >;
> >                                 compatible =3D "jedec,spi-nor";
> >                                 spi-max-frequency =3D <50000000>;
> > +                               spi-rx-bus-width =3D <2>;
> >                                 status =3D "disabled";
> >                         };
> >                         flash@1 {
> >                                 reg =3D < 1 >;
> >                                 compatible =3D "jedec,spi-nor";
> >                                 spi-max-frequency =3D <50000000>;
> > +                               spi-rx-bus-width =3D <2>;
> >                                 status =3D "disabled";
> >                         };
> >                         flash@2 {
> >                                 reg =3D < 2 >;
> >                                 compatible =3D "jedec,spi-nor";
> >                                 spi-max-frequency =3D <50000000>;
> > +                               spi-rx-bus-width =3D <2>;
> >                                 status =3D "disabled";
> >                         };
> >                 };
> > --
> > 2.34.1
> >
