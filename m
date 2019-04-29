Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF097DD62
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 10:07:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sy2L3KShzDqHK
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 18:07:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.160.194; helo=mail-qt1-f194.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sy2C6MtTzDq7k
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 18:07:46 +1000 (AEST)
Received: by mail-qt1-f194.google.com with SMTP id g4so10885045qtq.10
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 01:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uYi43Lpb2eQY3E2rRqP8+5ua3fkv4oukhSpEYQDHTQo=;
 b=mmuYl0X9c47foIWmAzwBr4CTHOYCuEgnMBznWQvQobYSIbDTp+EBC1AGjyq0OCZD4N
 DjB5vkGXWISm4kbJ6TkytyNU77HcDC7crEfbx4oAourML9Nc1ygLD5Xs2mO2YKMhVZK8
 EjvEE2Z2+ZYufv4BbAzlaODkyqvENPH55PpBUQvX246a/m/7e7owaHa2GtE+AGHg/0Iv
 1d01AANFZfrTAZLfzXQYVrrH20slJXrf0P2NrQ2E4wXpnFYljhatoaGDpY7QtF6T54K6
 6VeV5ZQb0MmQlJ3JUWrNYrcMccl/kjlPregIxF4EclX+0t+9GhsFbuTSPamDbd6/O3Ob
 N1eg==
X-Gm-Message-State: APjAAAW77LRbZPa8p6Gt+gZ4FydI38a9K2/FY/D2+MPYCajHryDQzGFN
 BPosMa40tE+dhFaqGHRdgzGU0fKvlmiwlnIVajc=
X-Google-Smtp-Source: APXvYqznLxAna8C15dPs0Tu0zfUGa9/s0iQusViY1zaVgjjMaAT5ZmuIBABc+Ta4YiLYA4AYCPD1RNBQJKoW0whh8qs=
X-Received: by 2002:ac8:8cd:: with SMTP id y13mr36383548qth.96.1556525264286; 
 Mon, 29 Apr 2019 01:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190423142629.120717-1-venture@google.com>
 <CAO=notzjzpt0WHfJEWXMGgkoJU8UiLnqZnrGrPs-dRH5GNdJyQ@mail.gmail.com>
 <CAO=notz9QVoqKLrhJ3kx9FHja5+Mh68f36O36+1ewLG+SanmOA@mail.gmail.com>
 <20190425172549.GA12376@kroah.com>
 <CACPK8XemgKvM38wDSUJsXXeK51dwmeUoKWn+e3ZNHd9v5VBZHA@mail.gmail.com>
In-Reply-To: <CACPK8XemgKvM38wDSUJsXXeK51dwmeUoKWn+e3ZNHd9v5VBZHA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 29 Apr 2019 10:07:28 +0200
Message-ID: <CAK8P3a3CK4o8KnD6M084ULEmm+6_CtNFqYHjSqE5vp+U9YAmkA@mail.gmail.com>
Subject: Re: [PATCH v2] soc: add aspeed folder and misc drivers
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
Cc: linux-aspeed@lists.ozlabs.org, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, soc@kernel.org,
 arm-soc <arm@kernel.org>, Patrick Venture <venture@google.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Apr 29, 2019 at 9:49 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Thu, 25 Apr 2019 at 17:25, Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Apr 23, 2019 at 08:28:14AM -0700, Patrick Venture wrote:
> > > On Tue, Apr 23, 2019 at 8:22 AM Patrick Venture <venture@google.com> wrote:
> > > >
> > > > On Tue, Apr 23, 2019 at 7:26 AM Patrick Venture <venture@google.com> wrote:
> > > > >
> > > > > Create a SoC folder for the ASPEED parts and place the misc drivers
> > > > > currently present into this folder.  These drivers are not generic part
> > > > > drivers, but rather only apply to the ASPEED SoCs.
> > > > >
> > > > > Signed-off-by: Patrick Venture <venture@google.com>
> > > >
> > > > Accidentally lost the Acked-by when re-sending this patchset as I
> > > > didn't see it on v1 before re-sending v2 to the larger audience.
> > >
> > > Since there was a change between v1 and v2, Arnd, I'd appreciate you
> > > Ack this version of the patchset since it changes when the soc/aspeed
> > > Makefile is followed.
> >
> > I have no objection for moving stuff out of drivers/misc/ so the SOC
> > maintainers are free to take this.
>
> I was on the fence about this. The downside of moving drivers out of
> drivers/misc is it allows SoCs to hide little drivers away from
> scrutiny, when in fact they could be sharing a common userspace API
> with other BMCs.  (Keep an eye out for the coming Nuvoton "bios post
> code" driver which is very similar to
> drivers/misc/aspeed-lpc-snoop.c).

Things like this should usually find a different home: drivers/misc
tends to be for one-of-a-kind stuff with a user interface, not for things
where you have multiple chips doing the same thing.

If you think there are going to be additional cases where you have
more than one bmc in need of a user interface for the same
functionality, we could introduce a drivers/bmc/ subsystem and
have a set of user interfaces backed by a set of chip specific
drivers.

> However, in the effort to move away from BMC that are full of shell
> scripts that bash on /dev/mem, we are going to see a collection of
> small, very SoC specific, drivers and it doesn't make sense to clutter
> up drivers/misc.
>
> Acked-by: Joel Stanley <joel@jms.id.au>
>
> The p2a driver has been merged by Greg. We should move that one over
> too. Arnd, can you advise Patrick on how to proceed? We could have him
> spin a v3 that includes the p2a driver, but it would depend on Greg's
> char-misc-next branch.

I don't think there is a rush here, so let's do that for the following
merge window.

      Arnd
