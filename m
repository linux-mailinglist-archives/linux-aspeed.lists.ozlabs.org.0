Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF3F46B17F
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Dec 2021 04:30:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7Qm053SBz2yfZ
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Dec 2021 14:30:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=azUrlGXn;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=azUrlGXn; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7Qls12Y4z2xv8
 for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Dec 2021 14:29:58 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id m186so13381735qkb.4
 for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Dec 2021 19:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7roDkg3KrE7fLZXK82trfY03V59oVuH/SpXZx6lh9oQ=;
 b=azUrlGXnBPtCnMt/9o5J4bQPvIsW8BR0symPEnaaE4xgK/AuuiP1v8QBXxG8hH3TIS
 jOh9gIK+xKPgduYo/jzMVwMQSDFjPHb0bOogL3BL0ql+jzlT4pjf1ZAUkD3mjOBRSWNC
 qoZlnMdHb+wcOFSnWjjMr7YsHQTCjw7TOb3Ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7roDkg3KrE7fLZXK82trfY03V59oVuH/SpXZx6lh9oQ=;
 b=WPbkphWappl1BcYdlS69TnTMG8wWu8SsS6wTqPKjVNVeJ6KWhNOY+LTQ9beUoKItQ2
 8okKapbfsfkkp367dhsi4S6stvEkfi9zfEzJoPTQs4QDH9GCM2tGItQ0qTLkuRATN0Aw
 /D74pJk4os1dZKSdCDM5XxouKRbfsBEWr8Z3ObbESFFdbi4lk42L//sDdQebEFdw2oxO
 QZWI1UuW5GMSmK4D0des+yd1J1HhZm6wRXMwAxWtygwhBRvvEVJ42U0W3sQphcfB9B5a
 E8mljnXcK3lN+f+DDGeBhYffgaoA81onGMgUGbtrIwUWKZv4vZ3ttglje5nR7NSheJTJ
 yc0Q==
X-Gm-Message-State: AOAM532gDt8VpXk4N0DSq//B8Xnf73Ohi1T1ndwu2YHeN/NDNyZ44jjF
 Yv4sHbPqbzXfwvPInCKflq0+wIDR077mjDgBEi0=
X-Google-Smtp-Source: ABdhPJzqqZnGA8mDLqBmrvcztTUSfOqGT68qRSrRQy+N3lGeHB2yc7Q/8VaVw3Nd7JAGTZvPx56kgOqtko7zdRJuoss=
X-Received: by 2002:a05:620a:1004:: with SMTP id
 z4mr36775157qkj.243.1638847796330; 
 Mon, 06 Dec 2021 19:29:56 -0800 (PST)
MIME-Version: 1.0
References: <20211201033738.121846-1-howard.chiu@quantatw.com>
 <Ya5/v+VhOM9o9BtQ@heinlein>
 <CACPK8XdCjqB+HZ_g9O=gjnSne3=iV44i6jKP5M8yWcsjnttaog@mail.gmail.com>
 <HKAPR04MB40033D58E2C1F96DDF16C13C966E9@HKAPR04MB4003.apcprd04.prod.outlook.com>
In-Reply-To: <HKAPR04MB40033D58E2C1F96DDF16C13C966E9@HKAPR04MB4003.apcprd04.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Dec 2021 03:29:43 +0000
Message-ID: <CACPK8Xd93Kmvh7kT+4tbMO0+6LWa-2ORmt_KNB_hpqMYhso46A@mail.gmail.com>
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

On Tue, 7 Dec 2021 at 02:53, Howard Chiu (=E9=82=B1=E5=86=A0=E7=9D=BF) <How=
ard.Chiu@quantatw.com> wrote:
>
> Hi Joel
>
> Bletchley platform needs to support fan control.
> Since Billy's patch for upstream is still under review, I can't add pwm/t=
ach node into dts or the build would fail.
>
> As you know, I had committed the pwm/tach driver for ast26xx to OpenBMC l=
inux, could I commit the dts to OpenBMC linux instead of upstream for early=
 build?

I'd suggest no, omit those features for now, and you can add them in
once we have a driver. The device tree bindings for the tach/pwm need
some work before they can be approved.

When I asked you to fix the patch, I was referring to the usb-c
warnings that I posted about the other week.

>
> Howard
>
> > -----Original Message-----
> > From: Joel Stanley <joel@jms.id.au>
> > Sent: Tuesday, December 7, 2021 6:52 AM
> > To: Patrick Williams <patrick@stwcx.xyz>
> > Cc: Howard Chiu <howard10703049@gmail.com>; Arnd Bergmann
> > <arnd@arndb.de>; Olof Johansson <olof@lixom.net>; SoC Team
> > <soc@kernel.org>; Rob Herring <robh+dt@kernel.org>; Andrew Jeffery
> > <andrew@aj.id.au>; Linux ARM <linux-arm-kernel@lists.infradead.org>;
> > devicetree <devicetree@vger.kernel.org>; Linux Kernel Mailing List
> > <linux-kernel@vger.kernel.org>; linux-aspeed <linux-aspeed@lists.ozlabs=
.org>;
> > Howard Chiu (=E9=82=B1=E5=86=A0=E7=9D=BF) <Howard.Chiu@quantatw.com>
> > Subject: Re: [PATCH v6] ARM: dts: aspeed: Adding Facebook Bletchley BMC
> >
> > On Mon, 6 Dec 2021 at 21:25, Patrick Williams <patrick@stwcx.xyz> wrote=
:
> > >
> > > On Wed, Dec 01, 2021 at 11:37:38AM +0800, Howard Chiu wrote:
> > > > Initial introduction of Facebook Bletchley equipped with
> > > > Aspeed 2600 BMC SoC.
> > > >
> > > > Signed-off-by: Howard Chiu <howard.chiu@quantatw.com>
> > > >
> > >
> > > ...
> > >
> > > > Change since v2:
> > > > - Remove uart5 workaround
> > > > - Remove gpio nodes of pca9552/pca9539
> > > > - Modify gpio-line-name of led/power/presence pins with openbmc
> > pattern
> > >
> > > A number of the GPIOs do not have defined openbmc patterns for them y=
et.
> > The
> > > names you have chosen are ok for now, but we will be changing them as=
 we
> > refine
> > > development of this machine further.
> > >
> > > > +             gpio-line-names =3D
> > > > +
> > "SLED0_MS_DETECT1","SLED0_VBUS_BMC_EN","SLED0_INA230_ALERT","SLE
> > D0_P12V_STBY_ALERT",
> > > > +
> > "SLED0_SSD_ALERT","SLED0_MS_DETECT0","SLED0_RST_CCG5","SLED0_FUSB
> > 302_INT",
> > > > +
> > "SLED0_MD_STBY_RESET","SLED0_MD_IOEXP_EN_FAULT","SLED0_MD_DIR","
> > SLED0_MD_DECAY",
> > > > +
> > "SLED0_MD_MODE1","SLED0_MD_MODE2","SLED0_MD_MODE3","power-ho
> > st0";
> > >
> > > Such as these...
> > >
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > Otherwise,
> > >
> > > Reviewed-by: Patrick Williams <patrick@stwcx.xyz>
> >
> > Thanks for reviewing.
> >
> > Howard, I'm merging patches for v5.17 but I can't apply this until you
> > fix the warnings I mentioned.
> >
> > Cheers,
> >
> > Jeol
> > >
> > > --
> > > Patrick Williams
