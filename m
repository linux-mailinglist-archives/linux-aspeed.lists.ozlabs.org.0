Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA2A445DB7
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 02:58:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlkF404F9z2xX2
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 12:58:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=dJsQFa/d;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82d;
 helo=mail-qt1-x82d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=dJsQFa/d; dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlkF111MJz2xSH
 for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Nov 2021 12:58:28 +1100 (AEDT)
Received: by mail-qt1-x82d.google.com with SMTP id u7so6007336qtc.1
 for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Nov 2021 18:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AeKwDr457TEy1j7kjVV2jCK6h090tNYB4LhZy/b7ri8=;
 b=dJsQFa/dJTSnRPc9y2iFjuO/OIOPV0z4tsmcTmYxo2vTs+LEAYjYbJTd6ccKl/fJe9
 STDdGnd3TCRLV/69vP9cUgnroTmStJ3Y884WDftrN0Jy3RtC+zfAQD8gyz8u9t9rTZ7L
 USusRtWg7DziqDNW5kWP81SqKFYB4hvdKaYPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AeKwDr457TEy1j7kjVV2jCK6h090tNYB4LhZy/b7ri8=;
 b=oUri5ZKDRgwrjXzxutK2Y6NNkSoW6VkN8K7RJqwq01gi4QGZsrubPti2MBqM8FQ1Yl
 XGEXjFVqgMwnkLxciDJOjtY5nOPjAu2obpk90jyHjXU06YjyyLtuuuBG0pKo0M+xm1CJ
 65lRloII7O+9/o3rrNwH86udnmya1b4tpJr02MNxwVOJSj7mHUeK/isZFM6yBDmiCrSZ
 JEflUJvNAEY1YoH3otQEfQKuGcHg02VeMJJ5aCXUohdW29d9if6qncG4HJwZMvx0bzAt
 oFxx2o/yt/3WkSzPoVIKTGPUX0HwZvA9/AIqFS1hXStHTaV4pvvkQv+5KdH+l+gB3+WM
 bUkA==
X-Gm-Message-State: AOAM530rOQQg5Om8hTqyQaebFNQntWyObO2iIAZpAaMzIypEBcEhfvkj
 LGRPvVAui9AHC7fxUfLy6E6mI/KpzJeHnkcF8Ck=
X-Google-Smtp-Source: ABdhPJwvj9CTW1q5TyiaSF+P3VtUT2HVTx4qLOVyun3i3huquNri6xChl0ILjGXXWjkgSGVeSuRnKaUKz2JYSU1g2sY=
X-Received: by 2002:a05:622a:1006:: with SMTP id
 d6mr57856637qte.259.1636077505009; 
 Thu, 04 Nov 2021 18:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211105005955.107419-1-osk@google.com>
 <CACPK8XcXR=V5-Q+sC4MniNJZJgvbiysFD-5yu6v30_2BwDRTSA@mail.gmail.com>
 <CABoTLcS=s0XuM9jiisYW3=1gXtiwP8WeopqTOeBwnTX1XCky9Q@mail.gmail.com>
In-Reply-To: <CABoTLcS=s0XuM9jiisYW3=1gXtiwP8WeopqTOeBwnTX1XCky9Q@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 5 Nov 2021 01:58:13 +0000
Message-ID: <CACPK8XebNsSr3wiMdMxDwQuMGX3p0g2Kid91dekUc6TGcHqfYQ@mail.gmail.com>
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

On Fri, 5 Nov 2021 at 01:47, Oskar Senft <osk@google.com> wrote:
>
> Hi Joel
>
> Oh man, this is embarrassing!

Don't worry about it. I'm a bit confused as to why I didn't see it
this morning; I thought I did a build test then.

>
> > I applied this and tried comple testing, and got this warning:
> >
> >   DTC     arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dtb
> > ../arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts:217.4-14: Warning
> > (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@40/nct7802@28/channel@0:reg:
> > property has invalid length (4 bytes) (#address-cells == 2,
> > #size-cells == 1)
> > [...]
> > You need to add this to the nct node:
> >
> > #address-cells = <1>;
> > #size-cells = <0>;
> Oh yeah, of course. It's even in the example in the binding that I wrote.
>
> > Did you see this with your testing? I'm building on top of v5.15 and
> > my distro's dtc is 1.6.0.
> I built (as part of OpenBMC) and ran (on actual HW), but these
> warnings don't make it out to the console. In my "defense", I did run
> checkpatch.pl, though.
>
> Is there an easy way for me to see these types of warnings? Or should
> they really come out as errors?

Good question. v5.15 adds -Werror to the top level makefile, but as
these warnings come from the device tree compiler they won't cause the
build to fail. We should probably fix that, as I consider any dtc
warning cause to rework the patch.

I test the kernels independently of yocto; I recommend doing that with
a cross compiler when submitting patches upstream. My flow looks like
this:

CROSS_COMPILE="ccache arm-linux-gnueabi-" ARCH=arm make
O=aspeed-g5-dev aspeed_g5_defconfig
CROSS_COMPILE="ccache arm-linux-gnueabi-" ARCH=arm make -j8 O=aspeed-g5-dev -s
qemu-system-arm -M rainier-bmc -nographic -net nic -kernel
aspeed-g5-dev/arch/arm/boot/zImage -dtb
aspeed-g5-dev/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dtb -initrd
/home/joel/dev/kernels/misc/broomstick.cpio.xz -append
'console=ttyS4,115200n8 quiet' -no-reboot

A few notes:
 - I use the cross compiler from my distro. Debian unstable has GCC
11.2.0, which is the same as openbmc. You can use the compiler from
your openbmc build tree if you aren't able to install a modern
compiler

 - Using ccache is optional

 - building with -s means warnings stand out

 - if you're working on device trees and want to ensure your binary is
being built each time, omit the -s and build the 'dtbs' target

 - booting in qemu is a quick smoke test. You don't need to your board
supported in qemu to test it (although it does help to avoid warnings
from eg. i2c devices that won't probe if the hardware isn't present)

 - adding 'quiet' to the qemu command line again makes it easier to
pick out warnings

That's a bit about how I work. You don't have to follow my work flow,
but feel free to cherry pick bits that are useful.

>
> I'll fix and send a PATCH v3.
>
> I'm really sorry, this shouldn't be so much work for you!

No problem at all. Good work on iterating quickly.

Cheers,

Joel

>
> Oskar.
