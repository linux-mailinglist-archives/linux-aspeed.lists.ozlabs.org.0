Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C65452A5B
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Nov 2021 07:08:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtbGB1m5Hz2xvf
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Nov 2021 17:08:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=E9OjszSm;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72f;
 helo=mail-qk1-x72f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=E9OjszSm; dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtbG618Tpz2x9V
 for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Nov 2021 17:08:12 +1100 (AEDT)
Received: by mail-qk1-x72f.google.com with SMTP id g28so15071269qkk.9
 for <linux-aspeed@lists.ozlabs.org>; Mon, 15 Nov 2021 22:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I3oQyh1i67EI9sCW3pQlUFVmFFrrPdE1dpx1lb+xR2U=;
 b=E9OjszSmwpNQ1taXDWq1P1iNQZBuIsSmoMRgF0L3fgDwV+ydKR63vsHfTocvsPlpHU
 DYTeHToo4XaVlAnMH9jqGnJNBI6qDg9pxEbGd8Z7noiXjXn3jsqqBNKljPRI1Y1YkaXE
 t0+1CZ0sZ42qgvHtea/vCOFqvA+ArkYy9zFPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I3oQyh1i67EI9sCW3pQlUFVmFFrrPdE1dpx1lb+xR2U=;
 b=QzRal2JF5B2M4J3u+wIO8u/Ij0Qurol5HRjcbXpO5muOc7eYUMvdadqAK4y4EfU/12
 XXad5TpVLSELtCflJ1tf0XKazcMT5wwMfUwsWkj8mNRfQeGhaOdPXIeIxPe3B3Eh7dkJ
 1Hx3lE2WpjjilAN+TYeXjcd4kql8zijA2mYAQY2PBjrKsWkZE9DSDQFrSxWHM5d59eNd
 iutRxnhppQC2YfKi5UjoAyLckjVwUl/FMmBaCq4v7z11JHCC/kqenClahSgfDWGhV5bn
 AgoRe5a0EgB30DZha4pjNdL1b63RqlCuYp9+XiOEWIG69YUXJk3zGqW6CAQjuk9FOi9j
 4URA==
X-Gm-Message-State: AOAM532lmySGjzHi60WzFJsvQVPFq23Lgv/15e7EkGkOT+uEcpHqS2rs
 /exH/Y56Khfn/cGCRyKETg0loN08g136UYjtoKk=
X-Google-Smtp-Source: ABdhPJxg2WkPIsuOSay/GYggygOyktUFgy0Tfd4Ccq6kw0J8FhevHPTHEN5D5sp3cEHRxaqlDRsubd6rTcg2+5hU1BQ=
X-Received: by 2002:a37:a8e:: with SMTP id 136mr4211384qkk.395.1637042887509; 
 Mon, 15 Nov 2021 22:08:07 -0800 (PST)
MIME-Version: 1.0
References: <20211026200058.2183-1-aladyshev22@gmail.com>
 <CACPK8Xd5eYpsFNw1jEjv3NaShgzE3zC_Ct29pJM34TfrqRTNtQ@mail.gmail.com>
 <CACSj6VVTFa0t9WK=R2TucG7eFqUzBsWYFzvsaRt6eXOiFuQORA@mail.gmail.com>
In-Reply-To: <CACSj6VVTFa0t9WK=R2TucG7eFqUzBsWYFzvsaRt6eXOiFuQORA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 Nov 2021 06:07:55 +0000
Message-ID: <CACPK8Xcc6Nem00zZdGmHF=U4T2O90aL+_vKO4YmAqSW9wKeegA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add AMD DaytonaX BMC
To: Konstantin Aladyshev <aladyshev22@gmail.com>,
 Patrick Williams <patrick@stwcx.xyz>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Supreeth Venkatesh <supreeth.venkatesh@amd.com>,
 Andrew Geissler <geissonator@yahoo.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 27 Oct 2021 at 10:59, Konstantin Aladyshev
<aladyshev22@gmail.com> wrote:
>
> Thanks for the comments. Can I ask you some questions about this
> `device-tree-gpio-naming.md`?
>
> 1) First of all in my naming I've tried to use naming scheme the same
> as the EthanolX CRB DTS currently has
> (https://github.com/torvalds/linux/blob/d25f27432f80a800a3592db128254c8140bd71bf/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts#L102).
> Do you want me to change GPIO naming in the EthanolX CRB as well?

Yeah, that would make sense.

> 2) Also this naming comes from the signal names in the board
> schematics. This way it is clear to check schematics vs DTS. If we use
> this OpenBMC naming style, we will lose that correspondence. Is it
> really good?

This is a good point. The preference is to use human readable names
over the schematic net. I can see cases where this would be worse, but
hopefully on balance it results in consistent naming between machines.

> 3) In the initial version of the DTS file I've supplied only a minimal
> set of GPIO, that are used by OpenBMC. GPIOs for x86-power-control app
> and led id/fault gpios. With renaming these GPIOs I'm only sure about
> these GPIOs:
>
> FAULT_LED                  - led-fault
> CHASSIS_ID_BTN        - led-identify
>
> What about the rest? For example the document doesn't really state
> what the *-button postfix states? Is it for asserting or monitoring
> buttons? How should I name these signals?
>
> ASSERT_BMC_READY
> ASSERT_RST_BTN
> ASSERT_PWR_BTN
>
> MON_P0_RST_BTN
> MON_P0_PWR_BTN
> MON_P0_PWR_GOOD
> MON_PWROK
>
> Can you help me with those?

Patrick, do you have thoughts here?

>
> 4) And what should I do to the board GPIO signals that OpenBMC doesn't
> use? If you look at the EthanolX CRB DTS
> (https://github.com/torvalds/linux/blob/d25f27432f80a800a3592db128254c8140bd71bf/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts#L102)
> it has a ton of GPIOs. Should they be renamed to this OpenBMC style as
> well? Or can they be named exactly like in the schematics?

That's up to you.

>
> I've also CCed original author of the `device-tree-gpio-naming.md`
> document Andrew Geissler. Andrew, can you please provide your opinion
> on the subject?

I've also added Patrick, who is helping review this document.

Cheers,

Joel

>
> Best regards,
> Konstantin Aladyshev
>
> On Wed, Oct 27, 2021 at 12:03 AM Joel Stanley <joel@jms.id.au> wrote:
> >
> > Hello Konstantin,
> >
> > On Tue, 26 Oct 2021 at 20:01, Konstantin Aladyshev
> > <aladyshev22@gmail.com> wrote:
> > >
> > > Add initial version of device tree for the BMC in the AMD DaytonaX
> > > platform.
> > >
> > > AMD DaytonaX platform is a customer reference board (CRB) with an
> > > Aspeed ast2500 BMC manufactured by AMD.
> > >
> > > Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
> >
> > This looks good. I have one comment about the GPIOs below.
> >
> > > +&gpio {
> > > +       status = "okay";
> > > +       gpio-line-names =
> > > +       /*A0-A7*/       "","","FAULT_LED","","","","","",
> > > +       /*B0-B7*/       "","","","","","","","",
> > > +       /*C0-C7*/       "CHASSIS_ID_BTN","","","","","","","",
> > > +       /*D0-D7*/       "","","ASSERT_BMC_READY","","","","","",
> > > +       /*E0-E7*/       "MON_P0_RST_BTN","ASSERT_RST_BTN","MON_P0_PWR_BTN","ASSERT_PWR_BTN","",
> > > +                       "MON_P0_PWR_GOOD","MON_PWROK","",
> >
> > For systems that will run openbmc, we try to use naming conventions
> > from this document:
> >
> > https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md
> >
> > If a GPIO is missing from that doc I encourage you to add it.
