Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAE343C835
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Oct 2021 12:59:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfQgx5kcNz2yNT
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Oct 2021 21:59:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HVlZRtxA;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HVlZRtxA; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfQgs2k6Yz2xCN
 for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Oct 2021 21:59:52 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id bp15so5319864lfb.4
 for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Oct 2021 03:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zsf5W6YqowSseyvuTUMml4+bgTU62PWsyrp4oNO1xMk=;
 b=HVlZRtxATzTeW9s77vFDU1/2HETT9Vc8F/2vUCf47K4QJbtvN1amTS5v97H6uQ9m5L
 hVgobVhWgmmJNor2lCPhE1GX6grKq6E1GRGsCSxIBo1iXLAyZ6ARA3n5JLWgohMWhcvn
 qz+kuyYksI8LPtBnpJXcZ37BHI7XjlHMUaJJepBjIHmNhUkeOdY23NYCq9VtJ5CzCpFQ
 2swWDx+TQ9eEQpc4yTEEh4+FODH9EPqQofcacFdqEIIwKmbcCgi8EovuLA/DqGoxtHIm
 m/bhGdtcz50fA2UdUVqIjZwUXV8cOt1K4IXtmGwlnVrPJH1UVhUFneEdi4qKsnTodh81
 OIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zsf5W6YqowSseyvuTUMml4+bgTU62PWsyrp4oNO1xMk=;
 b=UWxnyvhhPaN8tuFFHMiCD5SIyc1TktrJgd1sAHqmRdMvCVXXcdUOVugk5Pw7rtUOti
 bYp6m4LTfv63ZMxsNXc6kJ12x92BCLUYrmWrJ+Jhp/EJT9D2DUHAUBPnBqOod6LIMJtj
 Wpokq9eEg9QQT5YE74gN/mJezzWZ5xFdjwXRpZibmawGDlSMJxJ3B5rAfvWOiUsJFaBU
 qmB4lTa8oC0ajj55hIP+891JGiTcTaLRHU0O+0ROCUghLiQHG84zKjRAcRtTngQ4KwmL
 U4ePAbAsBAQbMDuCpPPXPrvn2N573URj/QMQem856EvOf5yeSqFsdAEtnU2ENuKI7fbx
 Yb6A==
X-Gm-Message-State: AOAM531egoWtlAgkeLFB2upT1EtBOE6ejuTSjOqgHur9+jCPqKr81twC
 vkqYqI0HVwfNe1OS0zmIZfdvd2ktQj87f7hsPZY=
X-Google-Smtp-Source: ABdhPJw2RtAnvTTu8eKJ1Gu5xdiQKMCSymgMHX2aBMj3kskaGPm2Lg7bnH1qL2p+8Qq1exiko2TgCjBz58gOBrLcDXs=
X-Received: by 2002:ac2:5d4b:: with SMTP id w11mr29074118lfd.676.1635332388998; 
 Wed, 27 Oct 2021 03:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211026200058.2183-1-aladyshev22@gmail.com>
 <CACPK8Xd5eYpsFNw1jEjv3NaShgzE3zC_Ct29pJM34TfrqRTNtQ@mail.gmail.com>
In-Reply-To: <CACPK8Xd5eYpsFNw1jEjv3NaShgzE3zC_Ct29pJM34TfrqRTNtQ@mail.gmail.com>
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Wed, 27 Oct 2021 14:05:45 +0300
Message-ID: <CACSj6VVTFa0t9WK=R2TucG7eFqUzBsWYFzvsaRt6eXOiFuQORA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add AMD DaytonaX BMC
To: Joel Stanley <joel@jms.id.au>
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
 Supreeth Venkatesh <supreeth.venkatesh@amd.com>, geissonator@yahoo.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Thanks for the comments. Can I ask you some questions about this
`device-tree-gpio-naming.md`?

1) First of all in my naming I've tried to use naming scheme the same
as the EthanolX CRB DTS currently has
(https://github.com/torvalds/linux/blob/d25f27432f80a800a3592db128254c8140bd71bf/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts#L102).
Do you want me to change GPIO naming in the EthanolX CRB as well?
2) Also this naming comes from the signal names in the board
schematics. This way it is clear to check schematics vs DTS. If we use
this OpenBMC naming style, we will lose that correspondence. Is it
really good?
3) In the initial version of the DTS file I've supplied only a minimal
set of GPIO, that are used by OpenBMC. GPIOs for x86-power-control app
and led id/fault gpios. With renaming these GPIOs I'm only sure about
these GPIOs:

FAULT_LED                  - led-fault
CHASSIS_ID_BTN        - led-identify

What about the rest? For example the document doesn't really state
what the *-button postfix states? Is it for asserting or monitoring
buttons? How should I name these signals?

ASSERT_BMC_READY
ASSERT_RST_BTN
ASSERT_PWR_BTN

MON_P0_RST_BTN
MON_P0_PWR_BTN
MON_P0_PWR_GOOD
MON_PWROK

Can you help me with those?

4) And what should I do to the board GPIO signals that OpenBMC doesn't
use? If you look at the EthanolX CRB DTS
(https://github.com/torvalds/linux/blob/d25f27432f80a800a3592db128254c8140bd71bf/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts#L102)
it has a ton of GPIOs. Should they be renamed to this OpenBMC style as
well? Or can they be named exactly like in the schematics?

I've also CCed original author of the `device-tree-gpio-naming.md`
document Andrew Geissler. Andrew, can you please provide your opinion
on the subject?

Best regards,
Konstantin Aladyshev

On Wed, Oct 27, 2021 at 12:03 AM Joel Stanley <joel@jms.id.au> wrote:
>
> Hello Konstantin,
>
> On Tue, 26 Oct 2021 at 20:01, Konstantin Aladyshev
> <aladyshev22@gmail.com> wrote:
> >
> > Add initial version of device tree for the BMC in the AMD DaytonaX
> > platform.
> >
> > AMD DaytonaX platform is a customer reference board (CRB) with an
> > Aspeed ast2500 BMC manufactured by AMD.
> >
> > Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
>
> This looks good. I have one comment about the GPIOs below.
>
> > +&gpio {
> > +       status = "okay";
> > +       gpio-line-names =
> > +       /*A0-A7*/       "","","FAULT_LED","","","","","",
> > +       /*B0-B7*/       "","","","","","","","",
> > +       /*C0-C7*/       "CHASSIS_ID_BTN","","","","","","","",
> > +       /*D0-D7*/       "","","ASSERT_BMC_READY","","","","","",
> > +       /*E0-E7*/       "MON_P0_RST_BTN","ASSERT_RST_BTN","MON_P0_PWR_BTN","ASSERT_PWR_BTN","",
> > +                       "MON_P0_PWR_GOOD","MON_PWROK","",
>
> For systems that will run openbmc, we try to use naming conventions
> from this document:
>
> https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md
>
> If a GPIO is missing from that doc I encourage you to add it.
