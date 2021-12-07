Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF52A46B2FF
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Dec 2021 07:37:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7Vw85lVSz2ygC
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Dec 2021 17:37:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=XP94ejYt;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82b;
 helo=mail-qt1-x82b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=XP94ejYt; dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7Vw46XNHz2xXC
 for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Dec 2021 17:37:23 +1100 (AEDT)
Received: by mail-qt1-x82b.google.com with SMTP id t11so13369619qtw.3
 for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Dec 2021 22:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BuPbZ3VtbSIjqnE4li/0FsndAvm28ZetgFRErcRuEKc=;
 b=XP94ejYtBoGp3CPNwPRTtjZAJDYGpC7q3UhIlavb3Qy5UG6U2a5g+ZmxpCvrAmpepg
 H8r4Y2hVq52rVahyvO7ktsq9NOplyDQfcH4Q1q61qcpK0HbK9bT2SFFbiRM8COUUJxdv
 S9iYakIZiJOflzwrxN/gN9hmQFeeK6S7ryrrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BuPbZ3VtbSIjqnE4li/0FsndAvm28ZetgFRErcRuEKc=;
 b=ttcVv4IUeDyrvvLWoWxfRTs8OElT75KUKl5Pu+3Y0QUPaEsHAlLdsu178sba8IR3d5
 KGngM8Yr4Zehn3Y/ncSZ62snW9fr0oZ61/s4nxzPAYyUTkTEx8Xi9kpiKSz3L3PHfzYf
 2cxJaO+PNYALTDOOn2Q/Hu/O+rEKwB8uNezOpyVuZ3M31hs3O5Ng2NHY7atvgqEGbGAS
 YRAeU2XCWxSUF2Mfl1pJiI+r813ShcTu3CMZo/zGKrkghuhT8pFKq1pr+hmFCZBqbNxk
 6KqbyvM+AY43NOWOsnhBluxwdRN6C157rQt3E/O3w10/iT78DpNoTexfaLWdYYfnLPJW
 uaiw==
X-Gm-Message-State: AOAM532NQmPfbhQES4BKX3a3MM8892onRYr2y3TZNdBE7XlsRwhGCitn
 JwGfRGM+UJStj2pinhG88mjDTZG9O8vl02Tyq1A=
X-Google-Smtp-Source: ABdhPJwobWKCEjWiDe29bOj06oYLkQcx6GatlI2ptGP1TEfsNFjVDXsxHLouFqQM/ML7vXh1iILGWrI6spNE5ksGE5g=
X-Received: by 2002:a05:622a:38d:: with SMTP id
 j13mr45726900qtx.159.1638859040480; 
 Mon, 06 Dec 2021 22:37:20 -0800 (PST)
MIME-Version: 1.0
References: <20211201033738.121846-1-howard.chiu@quantatw.com>
 <Ya5/v+VhOM9o9BtQ@heinlein>
 <CACPK8XdCjqB+HZ_g9O=gjnSne3=iV44i6jKP5M8yWcsjnttaog@mail.gmail.com>
 <HKAPR04MB40033D58E2C1F96DDF16C13C966E9@HKAPR04MB4003.apcprd04.prod.outlook.com>
 <CACPK8Xd93Kmvh7kT+4tbMO0+6LWa-2ORmt_KNB_hpqMYhso46A@mail.gmail.com>
 <HKAPR04MB4003DBD7D21B59723CDC5718966E9@HKAPR04MB4003.apcprd04.prod.outlook.com>
In-Reply-To: <HKAPR04MB4003DBD7D21B59723CDC5718966E9@HKAPR04MB4003.apcprd04.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Dec 2021 06:37:07 +0000
Message-ID: <CACPK8XduCFo-LdvL7ung8QksCsuyQypaXC_E-i5obC3SZ00AYg@mail.gmail.com>
Subject: Re: [PATCH v6] ARM: dts: aspeed: Adding Facebook Bletchley BMC
To: =?UTF-8?B?SG93YXJkIENoaXUgKOmCseWGoOedvyk=?= <Howard.Chiu@quantatw.com>
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Howard Chiu <howard10703049@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Patrick Williams <patrick@stwcx.xyz>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 7 Dec 2021 at 06:34, Howard Chiu (=E9=82=B1=E5=86=A0=E7=9D=BF) <How=
ard.Chiu@quantatw.com> wrote:
>
> Hi Joel
>
> > I'd suggest no, omit those features for now, and you can add them in
> > once we have a driver. The device tree bindings for the tach/pwm need
> > some work before they can be approved.
>
> The driver you mentioned is for OpenBMC Linux or upstream?
> If it is for OpenBMC, the upstream robot will reject my DTS because the a=
speed-g6.dtsi did not contain pwm/tach node.
>
> If it is for upstream, it will be a long time that OpenBMC Linux won't ha=
ve tach driver for ast2600 series, and my patch to commit with Billy's earl=
y driver for OpenBMC Linux is also meaningless.

Once we've fixed the issues with the bindings, we can put the driver
in the openbmc tree. Let's spend our effort fixing that.

>
> > When I asked you to fix the patch, I was referring to the usb-c
> > warnings that I posted about the other week.
> I will fix it and others you mentioned in the v7 patch.
>
> Howard
>
> > -----Original Message-----
> > From: Joel Stanley <joel@jms.id.au>
> > Sent: Tuesday, December 7, 2021 11:30 AM
> > To: Howard Chiu (=E9=82=B1=E5=86=A0=E7=9D=BF) <Howard.Chiu@quantatw.com=
>
> > Cc: Patrick Williams <patrick@stwcx.xyz>; Howard Chiu
> > <howard10703049@gmail.com>; Arnd Bergmann <arnd@arndb.de>; Olof
> > Johansson <olof@lixom.net>; SoC Team <soc@kernel.org>; Rob Herring
> > <robh+dt@kernel.org>; Andrew Jeffery <andrew@aj.id.au>; Linux ARM
> > <linux-arm-kernel@lists.infradead.org>; devicetree
> > <devicetree@vger.kernel.org>; Linux Kernel Mailing List
> > <linux-kernel@vger.kernel.org>; linux-aspeed <linux-aspeed@lists.ozlabs=
.org>
> > Subject: Re: [PATCH v6] ARM: dts: aspeed: Adding Facebook Bletchley BMC
> >
> > On Tue, 7 Dec 2021 at 02:53, Howard Chiu (=E9=82=B1=E5=86=A0=E7=9D=BF)
> > <Howard.Chiu@quantatw.com> wrote:
> > >
> > > Hi Joel
> > >
> > > Bletchley platform needs to support fan control.
> > > Since Billy's patch for upstream is still under review, I can't add p=
wm/tach
> > node into dts or the build would fail.
> > >
> > > As you know, I had committed the pwm/tach driver for ast26xx to OpenB=
MC
> > linux, could I commit the dts to OpenBMC linux instead of upstream for =
early
> > build?
> >
> > I'd suggest no, omit those features for now, and you can add them in
> > once we have a driver. The device tree bindings for the tach/pwm need
> > some work before they can be approved.
> >
> > When I asked you to fix the patch, I was referring to the usb-c
> > warnings that I posted about the other week.
> >
> > >
> > > Howard
> > >
> > > > -----Original Message-----
> > > > From: Joel Stanley <joel@jms.id.au>
> > > > Sent: Tuesday, December 7, 2021 6:52 AM
> > > > To: Patrick Williams <patrick@stwcx.xyz>
> > > > Cc: Howard Chiu <howard10703049@gmail.com>; Arnd Bergmann
> > > > <arnd@arndb.de>; Olof Johansson <olof@lixom.net>; SoC Team
> > > > <soc@kernel.org>; Rob Herring <robh+dt@kernel.org>; Andrew Jeffery
> > > > <andrew@aj.id.au>; Linux ARM <linux-arm-kernel@lists.infradead.org>=
;
> > > > devicetree <devicetree@vger.kernel.org>; Linux Kernel Mailing List
> > > > <linux-kernel@vger.kernel.org>; linux-aspeed
> > <linux-aspeed@lists.ozlabs.org>;
> > > > Howard Chiu (=E9=82=B1=E5=86=A0=E7=9D=BF) <Howard.Chiu@quantatw.com=
>
> > > > Subject: Re: [PATCH v6] ARM: dts: aspeed: Adding Facebook Bletchley=
 BMC
> > > >
> > > > On Mon, 6 Dec 2021 at 21:25, Patrick Williams <patrick@stwcx.xyz> w=
rote:
> > > > >
> > > > > On Wed, Dec 01, 2021 at 11:37:38AM +0800, Howard Chiu wrote:
> > > > > > Initial introduction of Facebook Bletchley equipped with
> > > > > > Aspeed 2600 BMC SoC.
> > > > > >
> > > > > > Signed-off-by: Howard Chiu <howard.chiu@quantatw.com>
> > > > > >
> > > > >
> > > > > ...
> > > > >
> > > > > > Change since v2:
> > > > > > - Remove uart5 workaround
> > > > > > - Remove gpio nodes of pca9552/pca9539
> > > > > > - Modify gpio-line-name of led/power/presence pins with openbmc
> > > > pattern
> > > > >
> > > > > A number of the GPIOs do not have defined openbmc patterns for th=
em
> > yet.
> > > > The
> > > > > names you have chosen are ok for now, but we will be changing the=
m as
> > we
> > > > refine
> > > > > development of this machine further.
> > > > >
> > > > > > +             gpio-line-names =3D
> > > > > > +
> > > >
> > "SLED0_MS_DETECT1","SLED0_VBUS_BMC_EN","SLED0_INA230_ALERT","SLE
> > > > D0_P12V_STBY_ALERT",
> > > > > > +
> > > >
> > "SLED0_SSD_ALERT","SLED0_MS_DETECT0","SLED0_RST_CCG5","SLED0_FUSB
> > > > 302_INT",
> > > > > > +
> > > >
> > "SLED0_MD_STBY_RESET","SLED0_MD_IOEXP_EN_FAULT","SLED0_MD_DIR","
> > > > SLED0_MD_DECAY",
> > > > > > +
> > > >
> > "SLED0_MD_MODE1","SLED0_MD_MODE2","SLED0_MD_MODE3","power-ho
> > > > st0";
> > > > >
> > > > > Such as these...
> > > > >
> > > > > > --
> > > > > > 2.25.1
> > > > > >
> > > > >
> > > > > Otherwise,
> > > > >
> > > > > Reviewed-by: Patrick Williams <patrick@stwcx.xyz>
> > > >
> > > > Thanks for reviewing.
> > > >
> > > > Howard, I'm merging patches for v5.17 but I can't apply this until =
you
> > > > fix the warnings I mentioned.
> > > >
> > > > Cheers,
> > > >
> > > > Jeol
> > > > >
> > > > > --
> > > > > Patrick Williams
