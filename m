Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF741EAF4
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 21:35:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tFJ641xSzDqNT
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Apr 2019 05:35:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="SnHph24t"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tFHz2kQjzDqDl
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Apr 2019 05:35:42 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id b3so5551728plr.7
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 12:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MA2pxeJanvGEmBWrFqMsmgG7gA6LwvD5zhcslNBuoIs=;
 b=SnHph24tl5THldKuujF5MGi0qGSD2Z736RK0rifb2SRwsvTKnasXAsbjtzKJzg5S7U
 jOT3KGue0g86zHFGOFzm8oJ8l7Bfvxk6nB6Ued+/HMZMTJXZsFbjfzrkCRSLqNlAoIuG
 C16zq20doJV/Wed3YovXDqnKRnWlMz2aV/CtwoECXDX4Hkfb3O3cb6Qy7wXOj12mXbUO
 UlMlNKu0Gr/kSS1Buv4lMeq4kR7TIFQWt7ZlWApCzht7eyDDE+/U+Xle7iiVfeJQPW29
 31gKQV31tNORj9GOHXyeL1n54sfp2gKRkwxyr1FgescX732CvJdnjwd5HAQbAQDDu7rg
 7T9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MA2pxeJanvGEmBWrFqMsmgG7gA6LwvD5zhcslNBuoIs=;
 b=mB3TUR7t6eZGdLaYHNZfoN7ApfHK8xQluF2rrr7Mlc9Ej/vi8ekRR+Zu5nK5dlJDVo
 HMuMZcYf3By9S/vaA4uDQO5kOxs/yvJuijYnsNvGnMYFh8h8YuRoQj0GGsyNRDRCUhQ3
 8mZ1HQ+Z/w/a6Jr00CexIEsZrOcjPQzthfn1Pe9VntmaiHkh3Ih7ArVp0KQ0BS6UKPXN
 u2anqy6/6QTjIGszR6sdNw0wkqlS50vrRNd7AQEM/ucltEQKG6xZoWWVL5iJo8mSiN47
 +7mncTYPqBUMa0d5027ON/84/+o0GCMC4oDO5lcGUI8S1hGOi/JhVFmVUkpKGFtlptiQ
 wEqQ==
X-Gm-Message-State: APjAAAWUVkcXN+ivIvVxNVOjHHbDYsBh7bLZVvxC2TNHswHgv2G5SfYw
 bMc34SC4OW3Zxj70i4xLpMpquijrVxS6kOuGyIetMw==
X-Google-Smtp-Source: APXvYqwpxgFfPjwuWB0owzgyoxf/HEeCo7aYxdc70jVF+oVqns/qMamafl4p2sSkZ9gHdZ6mqsJ1rHDNwpTTb6m4W/8=
X-Received: by 2002:a17:902:864b:: with SMTP id
 y11mr60477895plt.1.1556566538642; 
 Mon, 29 Apr 2019 12:35:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190423142629.120717-1-venture@google.com>
 <CAO=notzjzpt0WHfJEWXMGgkoJU8UiLnqZnrGrPs-dRH5GNdJyQ@mail.gmail.com>
 <CAO=notz9QVoqKLrhJ3kx9FHja5+Mh68f36O36+1ewLG+SanmOA@mail.gmail.com>
 <20190425172549.GA12376@kroah.com> <20190429165137.mwj4ehhwerunbef4@localhost>
 <CAO=notwewAeeLz=LsOcSj=DakLGW0KjeDHALP5Nv2ckgkRqnFA@mail.gmail.com>
 <CAOesGMipoKED=XLg+VtEVG0Os_MUzsPgOfBFJ+qoJs_fNmP+3g@mail.gmail.com>
In-Reply-To: <CAOesGMipoKED=XLg+VtEVG0Os_MUzsPgOfBFJ+qoJs_fNmP+3g@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 29 Apr 2019 12:35:27 -0700
Message-ID: <CAO=notwU7LzEiBmzb6AJrgP3RGXE+66OwZVU8CqVE6RSKRvo1w@mail.gmail.com>
Subject: Re: [PATCH v2] soc: add aspeed folder and misc drivers
To: Olof Johansson <olof@lixom.net>
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

On Mon, Apr 29, 2019 at 12:27 PM Olof Johansson <olof@lixom.net> wrote:
>
> On Mon, Apr 29, 2019 at 10:12 AM Patrick Venture <venture@google.com> wrote:
> >
> > On Mon, Apr 29, 2019 at 10:08 AM Olof Johansson <olof@lixom.net> wrote:
> > >
> > > On Thu, Apr 25, 2019 at 07:25:49PM +0200, Greg KH wrote:
> > > > On Tue, Apr 23, 2019 at 08:28:14AM -0700, Patrick Venture wrote:
> > > > > On Tue, Apr 23, 2019 at 8:22 AM Patrick Venture <venture@google.com> wrote:
> > > > > >
> > > > > > On Tue, Apr 23, 2019 at 7:26 AM Patrick Venture <venture@google.com> wrote:
> > > > > > >
> > > > > > > Create a SoC folder for the ASPEED parts and place the misc drivers
> > > > > > > currently present into this folder.  These drivers are not generic part
> > > > > > > drivers, but rather only apply to the ASPEED SoCs.
> > > > > > >
> > > > > > > Signed-off-by: Patrick Venture <venture@google.com>
> > > > > >
> > > > > > Accidentally lost the Acked-by when re-sending this patchset as I
> > > > > > didn't see it on v1 before re-sending v2 to the larger audience.
> > > > >
> > > > > Since there was a change between v1 and v2, Arnd, I'd appreciate you
> > > > > Ack this version of the patchset since it changes when the soc/aspeed
> > > > > Makefile is followed.
> > > >
> > > > I have no objection for moving stuff out of drivers/misc/ so the SOC
> > > > maintainers are free to take this.
> > > >
> > > > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > >
> > > I'm totally confused. This is the second "PATCH v2" of this patch that I came
> > > across, I already applied the first.
> >
> > I think the issue here was that I added to the CC list another email
> > and so you may see the v2  without that mailing list, and a v2 with it
> > --
> >
> > Does this require a v3?  I honestly didn't think so, but this was the
> > first time I had to add more people without needing other changes.
>
> Well, v2 doesn't build. I'll fix it up locally by adding an 'endmenu'
> to drivers/soc/aspeed/Kconfig. But... brings up questions how this was
> tested before submitting?

That's a lost change issue. I'll try to be more diligent in the
future.  My dev workspace  is disconnected from the kernel used for
upstreaming patches, so if i make a change in one it isn't always
reflected in the other.  I'm working on rectifying the underlying
build space issue to let me use the same repo.

>
> scripts/kconfig/conf  --allnoconfig Kconfig
> drivers/soc/Kconfig:24: 'menu' in different file than 'menu'
> drivers/soc/aspeed/Kconfig:1: location of the 'menu'
> drivers/Kconfig:233: 'menu' in different file than 'menu'
> drivers/soc/aspeed/Kconfig:1: location of the 'menu'
> <none>:34: syntax error
>
> > >
> > > Patrick: Follow up with incremental patch in case there's any difference.
> > > Meanwhile, please keep in mind that you're adding a lot of work for people when
> > > you respin patches without following up on the previous version. Thanks!
> >
> > w.r.t this patch series.  I found an issue with v1, and released a v2
> > with the detail of what changed.  I thought that was the correct
> > approach.  I apologize for creating extra work, that's something
> > nobody needs.
>
> It's ok to submit newer versions, but it's convenient when they get
> threaded also in non-gmail mail readers (by using in-reply-to).

Roger that.

>
>
> -Olof
