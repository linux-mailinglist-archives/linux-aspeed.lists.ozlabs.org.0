Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52802E897
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 19:16:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tBCQ3w7MzDqRX
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Apr 2019 03:16:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="iybmumts"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tBCJ5rP4zDq5W
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Apr 2019 03:16:28 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id f36so5378075plb.5
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 10:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yrQv2na9LmyqY09k2tODdC7kNnteQ3ci4lABBeEBPE4=;
 b=iybmumtskaFi13rXf1HJRNM75LC2gfNuVub4KnqHpyiL1nlJvVY3GB8TV+dD9oOuZ/
 Td7MWHJw+K+QcGrg31mzACAPWwL4QK9TNjJ/ke111sr1d6+dXa8wfFcmqkVEQ6DMpUyq
 UDIdWqryCSjDq1vJx3c4OPWD5jKhI6QNy+NbuuddJiWkbWQfziJkYKWaWQk9eRmu5BGL
 tA6a2KN3eeEtZIrlb/5HLrHkP34M29XvN9uPMLtrhrrvUWhIloFTve17Vd4coUsZuKJ/
 l7fFWpeSldhasZPzT8tsU8zGgA2c2eUqXxBeZAbDkI/I02SU6AHbOF1tONzMazP3TBHe
 qLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yrQv2na9LmyqY09k2tODdC7kNnteQ3ci4lABBeEBPE4=;
 b=m8buAZlEpAlUmhabuve4Af+/b7IDJyW6X4S6W29h0Pfvwh7yP8SAwj8GG7377n6zu1
 gzwVKw7iW1bW01sYpm1s/Q6OhAg0T3B5FWCm9IWfmv36nguSIlWpvASs6RJTnQ0MT61Q
 mGO2sVhKi2JkgCsr9NOqRTnvcy8FVMzlNMv9G2fnATi3g7zsSzXNtzuc4pf7fjuK4s2k
 HrDVbgozQk9YQtd3PrSCirrXXApewDOtXojlKo76Sr47zNNVYWCbJxJmPhwzwEb0nyiW
 UaJFD+t+hBxWMGc4TP5P7//pW8wQUsDnK4+v3lunmLQLMUEda3u89HXdavuQKsrCS4gH
 p20Q==
X-Gm-Message-State: APjAAAV49v0hiCAUcN7b9NMbBZwPlw8M6/aCch4NV7SXreWpfowsurWP
 7zTaxokXcS2BL0FKQdWzmP3xzdJlUpl4EpYTdDckNw==
X-Google-Smtp-Source: APXvYqymDIPfBTHbfoLNX9Aw7ZzXqqRyg7AuW+O8cV1ErDsGXn5m1e6K5s0jN81AsooOh/W/UWJLePjyEP9rPiD6dPU=
X-Received: by 2002:a17:902:e183:: with SMTP id
 cd3mr23254341plb.233.1556558186240; 
 Mon, 29 Apr 2019 10:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190423142629.120717-1-venture@google.com>
 <CAO=notzjzpt0WHfJEWXMGgkoJU8UiLnqZnrGrPs-dRH5GNdJyQ@mail.gmail.com>
 <CAO=notz9QVoqKLrhJ3kx9FHja5+Mh68f36O36+1ewLG+SanmOA@mail.gmail.com>
 <20190425172549.GA12376@kroah.com> <20190429165137.mwj4ehhwerunbef4@localhost>
 <CAOesGMg49z4Gip-bLK-h7+LSLa4Fu68r11gT2EV8E8xMCPGDxg@mail.gmail.com>
In-Reply-To: <CAOesGMg49z4Gip-bLK-h7+LSLa4Fu68r11gT2EV8E8xMCPGDxg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 29 Apr 2019 10:16:14 -0700
Message-ID: <CAO=notwVyTqvxfYRU1XJTwzSNCUAMgYCVpXVvqaN62uSiWyYCQ@mail.gmail.com>
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

On Mon, Apr 29, 2019 at 10:13 AM Olof Johansson <olof@lixom.net> wrote:
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
> >
> > Patrick: Follow up with incremental patch in case there's any difference.
> > Meanwhile, please keep in mind that you're adding a lot of work for people when
> > you respin patches without following up on the previous version. Thanks!
>
> Not only that, but subthreads were cc:d to arm@kernel.org and some
> were not, so I missed the overnight conversation on the topic.
>
> If this email thread is any indication of how the code will be
> flowing, there's definitely need for more structure. Joel, I'm hoping
> you'll coordinate.

To be honest, this patchset thread was a bit less clear than anyone
prefers.  I use get_maintainers to get the initial list, and so adding
arm@ or soc@ per a request tells me that perhaps those should be
output via that script.

>
> I'm with Arnd on whether the code should be in drivers/soc or not --
> most of it likely should not.

I think the misc drivers for a SoC that are a single user interface
that is focused on the use-case that belongs to that SoC only belong
in soc/, while if there is something we can do in common -- different
story.  If it makes sense to just have misc/aspeed/ instead of
soc/aspeed -- would that align more?

>
>
> -Olof
