Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 377C6EAD6
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 21:27:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tF6N4jJVzDqNS
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Apr 2019 05:27:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lixom.net
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.b="mkOtiQnY"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tF6F23DCzDqDl
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Apr 2019 05:27:16 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id v9so9991932iol.10
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 12:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yM+qItkSV7cyOzrR0XusuAc8CsANFg6gCkRKBVgtPLc=;
 b=mkOtiQnY+tvJCO67zt0OTJfLIOW19SiBik3Jn1sSE0wipaqZ4CuUeTsZTMJ8OfKmOW
 TnmafCROZ1COEoBVSrZCsHNaJ7QZXwp5eB8BBM/hfmstC0gRXW6S8gsAkVtyY/kOIquE
 Z7k2wQEx4eQzDuFCenwXp4/9+Rl+u+8YBV1uuk1Xh4XfsYnjPNngdzNjJhUWkDzZQI/M
 uLziucGwmZhjK81QF8kp9SbfjaUM3w+UTTDKt+bcsT0E5mLLnraryYmsqs0slNft/vGM
 F7nVVva4kjQdHT48m4TjAgelo2XBZRYTjLjzqxT1XaqfN3vq1sCvSHzZfPft1sbJ0fGS
 cfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yM+qItkSV7cyOzrR0XusuAc8CsANFg6gCkRKBVgtPLc=;
 b=LRRgmOAQA7wJskT09QdaspBF4lUYy2EzgDmf0yTWT1adhd/qJ76YOFuKGTTysg4h/K
 Shq19Ry9181Od1OrUBAzl4ay6SdQQec1gj4a251NDZrLIimM8G4xkFRBWjW/I6rJNRt+
 KnN/5e/Jqs7TeopT2EXER7W2suigCmSfhfR+Ede4bmKbCQv/fnn7x4+KFWXRpmRGE3Ct
 1Us+dzPli5pKoOkX2K2GtzuCrrsWkQ0UXufgiafj290bcLeSTi2C1Noe+NVjW5//Inj7
 aMhII4yrTrH/Sx/Qz+3GnlRs0ZnuKMr1xqnxcf37lQ+rer52b/4AFhSz8JVTwJTkhHZ+
 USFQ==
X-Gm-Message-State: APjAAAUT/JqhJvg51JciRff4J2+dCN7MvQLqswZ2OxyuaFBEb8iAq2a6
 oNr8XufcWE98tE+JIqCCeJeaIBg96CXdPT76hY96uw==
X-Google-Smtp-Source: APXvYqxnpM22Us/BjZc44Va9fpbRb6KCGDpMRCGC9vemv4K7V0RFwjfmFcku2NXR+S4Uf3aARtyunnitr8/59FB8k+M=
X-Received: by 2002:a5e:9307:: with SMTP id k7mr12222114iom.155.1556566033384; 
 Mon, 29 Apr 2019 12:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190423142629.120717-1-venture@google.com>
 <CAO=notzjzpt0WHfJEWXMGgkoJU8UiLnqZnrGrPs-dRH5GNdJyQ@mail.gmail.com>
 <CAO=notz9QVoqKLrhJ3kx9FHja5+Mh68f36O36+1ewLG+SanmOA@mail.gmail.com>
 <20190425172549.GA12376@kroah.com> <20190429165137.mwj4ehhwerunbef4@localhost>
 <CAO=notwewAeeLz=LsOcSj=DakLGW0KjeDHALP5Nv2ckgkRqnFA@mail.gmail.com>
In-Reply-To: <CAO=notwewAeeLz=LsOcSj=DakLGW0KjeDHALP5Nv2ckgkRqnFA@mail.gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Mon, 29 Apr 2019 12:27:02 -0700
Message-ID: <CAOesGMipoKED=XLg+VtEVG0Os_MUzsPgOfBFJ+qoJs_fNmP+3g@mail.gmail.com>
Subject: Re: [PATCH v2] soc: add aspeed folder and misc drivers
To: Patrick Venture <venture@google.com>
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
Cc: linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, soc@kernel.org,
 arm-soc <arm@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Apr 29, 2019 at 10:12 AM Patrick Venture <venture@google.com> wrote:
>
> On Mon, Apr 29, 2019 at 10:08 AM Olof Johansson <olof@lixom.net> wrote:
> >
> > On Thu, Apr 25, 2019 at 07:25:49PM +0200, Greg KH wrote:
> > > On Tue, Apr 23, 2019 at 08:28:14AM -0700, Patrick Venture wrote:
> > > > On Tue, Apr 23, 2019 at 8:22 AM Patrick Venture <venture@google.com> wrote:
> > > > >
> > > > > On Tue, Apr 23, 2019 at 7:26 AM Patrick Venture <venture@google.com> wrote:
> > > > > >
> > > > > > Create a SoC folder for the ASPEED parts and place the misc drivers
> > > > > > currently present into this folder.  These drivers are not generic part
> > > > > > drivers, but rather only apply to the ASPEED SoCs.
> > > > > >
> > > > > > Signed-off-by: Patrick Venture <venture@google.com>
> > > > >
> > > > > Accidentally lost the Acked-by when re-sending this patchset as I
> > > > > didn't see it on v1 before re-sending v2 to the larger audience.
> > > >
> > > > Since there was a change between v1 and v2, Arnd, I'd appreciate you
> > > > Ack this version of the patchset since it changes when the soc/aspeed
> > > > Makefile is followed.
> > >
> > > I have no objection for moving stuff out of drivers/misc/ so the SOC
> > > maintainers are free to take this.
> > >
> > > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >
> > I'm totally confused. This is the second "PATCH v2" of this patch that I came
> > across, I already applied the first.
>
> I think the issue here was that I added to the CC list another email
> and so you may see the v2  without that mailing list, and a v2 with it
> --
>
> Does this require a v3?  I honestly didn't think so, but this was the
> first time I had to add more people without needing other changes.

Well, v2 doesn't build. I'll fix it up locally by adding an 'endmenu'
to drivers/soc/aspeed/Kconfig. But... brings up questions how this was
tested before submitting?

scripts/kconfig/conf  --allnoconfig Kconfig
drivers/soc/Kconfig:24: 'menu' in different file than 'menu'
drivers/soc/aspeed/Kconfig:1: location of the 'menu'
drivers/Kconfig:233: 'menu' in different file than 'menu'
drivers/soc/aspeed/Kconfig:1: location of the 'menu'
<none>:34: syntax error

> >
> > Patrick: Follow up with incremental patch in case there's any difference.
> > Meanwhile, please keep in mind that you're adding a lot of work for people when
> > you respin patches without following up on the previous version. Thanks!
>
> w.r.t this patch series.  I found an issue with v1, and released a v2
> with the detail of what changed.  I thought that was the correct
> approach.  I apologize for creating extra work, that's something
> nobody needs.

It's ok to submit newer versions, but it's convenient when they get
threaded also in non-gmail mail readers (by using in-reply-to).


-Olof
