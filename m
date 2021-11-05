Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A85445EFD
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 05:03:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hln1M72qJz2yb3
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 15:03:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=hUefx7gu;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e;
 helo=mail-qt1-x82e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=hUefx7gu; dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hln1G3wwgz2xBP
 for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Nov 2021 15:03:30 +1100 (AEDT)
Received: by mail-qt1-x82e.google.com with SMTP id g13so5741488qtk.12
 for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Nov 2021 21:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fc58r/t2jY2c5ky17n3aPeo946grK/8InB/YHBMFXg0=;
 b=hUefx7guT4tDLT5XGyklHCcGIW1VPdCcQRBzE6azcgWKgPGaTSkv59UR+HbKaPenbu
 1RyaykiT3gGeHfV3KsAlZ9NxHLs0aBizgSnItZFCaj1LtoBMjwUKWNAur0B5z0BSOlUa
 F2FW0XwYGf8OHQ3G2cunukrvXQuvqj41QWCDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fc58r/t2jY2c5ky17n3aPeo946grK/8InB/YHBMFXg0=;
 b=yLIUhFK6OMYHv7JL5ZjlP0XYz+7j3U5nmdwmCj3X63eCKrCKiReD0/QaIESbb0X513
 7kEoIKig9Ifpa9q2QIdilgxOvXszMOOCL9cNve7vRcZYP9vRS3KhNoW2F5wXdWUJNkwE
 0OhDZWzMC2h20xO+oxMGTdpAYRCRn9xf432accTd30KV1m/gnzZgsAFlHoB62FE1u4Rn
 MEt9Dpih4Cps51ed0h4pDAVvV0xIaUj5gBvoTdCNTMmdPZtI4C5x/dOD55AVyaXu/CKV
 72K04CDnZHYncsKCPxfANQ7err2xVDiRLEVui9CCdD3wAZgC8tEsxWAexqyDsBvpycyz
 f+rA==
X-Gm-Message-State: AOAM533OW98jvm14B7ekg3j41zR/ewBlTHTSkyg1TdzLdLmZiXogzrdt
 Od7DRRWiK1dAcRhuvvksEYKg45CgU8v7oisF+uI=
X-Google-Smtp-Source: ABdhPJzfPavatG8fz8XDOwBDZsLLephzECNg76r7i3JlbR1TwNWIDvIl3n5RB+4ILqhQIz7sZl7ZobnqnfcA0TeT/hM=
X-Received: by 2002:ac8:5812:: with SMTP id g18mr668756qtg.392.1636085008050; 
 Thu, 04 Nov 2021 21:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211105005955.107419-1-osk@google.com>
 <CACPK8XcXR=V5-Q+sC4MniNJZJgvbiysFD-5yu6v30_2BwDRTSA@mail.gmail.com>
 <CABoTLcS=s0XuM9jiisYW3=1gXtiwP8WeopqTOeBwnTX1XCky9Q@mail.gmail.com>
 <CACPK8XebNsSr3wiMdMxDwQuMGX3p0g2Kid91dekUc6TGcHqfYQ@mail.gmail.com>
 <CABoTLcTb5uGABwe9FG4haj1888NA4mdZqJFTeQcSotBnq1aZVg@mail.gmail.com>
In-Reply-To: <CABoTLcTb5uGABwe9FG4haj1888NA4mdZqJFTeQcSotBnq1aZVg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 5 Nov 2021 04:03:15 +0000
Message-ID: <CACPK8Xc0cmgDqOwGDWu4H+x9ySEvwwPVr0M+vJZ=hTOCj3VxiA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: tyan-s7106: Update nct7802 config
To: Oskar Senft <osk@google.com>
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
Cc: Rob Herring <robh+dt@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 5 Nov 2021 at 03:29, Oskar Senft <osk@google.com> wrote:
>
> Hi Joel
>
> > I test the kernels independently of yocto; I recommend doing that with
> > a cross compiler when submitting patches upstream. My flow looks like
> > this:
> > [...]
> > A few notes:
> >  - I use the cross compiler from my distro. Debian unstable has GCC
> > 11.2.0, which is the same as openbmc. You can use the compiler from
> > your openbmc build tree if you aren't able to install a modern
> > compiler
> I couldn't figure out how to use the compiler from the OpenBMC tree.
> The biggest issue is that it has "openbmc" in its name and Linux build
> was getting confused by it. I gave up on that approach and found how
> to install the right cross compiler in our environment. That worked
> well. Thanks for the hints!

Cool. For reference, you should be able to do this:

CROSS_COMPILE="openbmc/build/p10bmc/tmp/sysroots-components/x86_64/gcc-cross-arm/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-"

>
> >  - building with -s means warnings stand out
> Excellent idea, thank you!
>
> >  - if you're working on device trees and want to ensure your binary is
> > being built each time, omit the -s and build the 'dtbs' target
> Ack.
>
> I'll send a PATCH v3 now.
>
> Oskar.
