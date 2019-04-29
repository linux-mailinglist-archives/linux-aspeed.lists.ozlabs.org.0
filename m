Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC98CE8A9
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 19:19:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tBGk4mlhzDqSj
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Apr 2019 03:19:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lixom.net
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.b="WJtEtPJw"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tBGd4c5xzDqL2
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Apr 2019 03:19:20 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id m188so9642811ioa.9
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 10:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TcHWiD1mzC1uHmKop2kWHjOyjfjQjqGRJXvrFO4NZ0M=;
 b=WJtEtPJw0ligOQLTkD1wdJpW0Xya6+Usnixo6qM6RCmaVuRB6Sw6wj0oxCImo1LiSU
 19ZpSQb6bgjljTeQNsMfJ+Dkk6kINsP22ZduO9o3JEefbuBit3tCiV16cve3eLhpO5td
 V8a7R8RsMk5Yk3qj9DVxD6ISwW+9YBSsNeDXoi264fxd29BQM1fdcUVUufbMTl8f8fcE
 98rFyJ+pJy0G8gcajIbrpNypKbFgTJ7t8QCLvYVwV6WWr61DbX04g2oDc58uLlWTRWvx
 FW0GZFyaO5zbqVX6Hw+8yJxE8cYkhp3fCI/Ox3LRQ2puDTOC3dkRvSZhNkSB+oK8Tzgm
 RuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TcHWiD1mzC1uHmKop2kWHjOyjfjQjqGRJXvrFO4NZ0M=;
 b=HFwITr037xkd5Vi0knGUY3TnuGr9IuaMh/DS1hGxi4SupMcibPvaWkk9HXxXayyA9Z
 7jnQlyr1EL4dgnCy2A+Nxw5ZsDEZLa4/HJ2krJUnI9Y6KXZlNa2cBVy8p93Pgn1N01le
 9w39IQ1f3p3S45aqREFGLuCrj/rM4/Kq3Q1yP4Y+X2yMiS7BkZdVUDs4LqGJw5sIKZ/Z
 qeT/vsgDaQ7jv944fofFKWlEkb65LOe6za6Hth+eILbgqvY79M77koSy6EI4SRTfvfw5
 /NWWRN607IWI5dgAxESWCdrpXe2nHUg6ebyBifFuClSiUs9+oPnJGHF47o9wa7/eWK3p
 rdbw==
X-Gm-Message-State: APjAAAUNYeOaK7iOroIOxrggAHYsNFrVlRODkJG+ZvWF+UyDPJTg5DZ3
 OG8WeiCooNom1FvP9ewJJXmhCPLPDUYyEoBZPTOcLw==
X-Google-Smtp-Source: APXvYqwr2b6ak9dkpcvCh4y3y7IhGFDCOLPWZnc8qygdB7THWWCzrsfb52Z9YiShfN4rx8ZPHnDzMPYVrnL0fFrmwzc=
X-Received: by 2002:a6b:5910:: with SMTP id n16mr16081346iob.140.1556558356559; 
 Mon, 29 Apr 2019 10:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190423142629.120717-1-venture@google.com>
 <CAO=notzjzpt0WHfJEWXMGgkoJU8UiLnqZnrGrPs-dRH5GNdJyQ@mail.gmail.com>
 <CAO=notz9QVoqKLrhJ3kx9FHja5+Mh68f36O36+1ewLG+SanmOA@mail.gmail.com>
 <20190425172549.GA12376@kroah.com> <20190429165137.mwj4ehhwerunbef4@localhost>
 <CAOesGMg49z4Gip-bLK-h7+LSLa4Fu68r11gT2EV8E8xMCPGDxg@mail.gmail.com>
 <CAO=notwVyTqvxfYRU1XJTwzSNCUAMgYCVpXVvqaN62uSiWyYCQ@mail.gmail.com>
In-Reply-To: <CAO=notwVyTqvxfYRU1XJTwzSNCUAMgYCVpXVvqaN62uSiWyYCQ@mail.gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Mon, 29 Apr 2019 10:19:04 -0700
Message-ID: <CAOesGMjShorZmVeLL1nJNPVOP+vNTVzcA=arU3qW8ZUDYCtjaQ@mail.gmail.com>
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

On Mon, Apr 29, 2019 at 10:16 AM Patrick Venture <venture@google.com> wrote:
>
> On Mon, Apr 29, 2019 at 10:13 AM Olof Johansson <olof@lixom.net> wrote:
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
> > >
> > > Patrick: Follow up with incremental patch in case there's any difference.
> > > Meanwhile, please keep in mind that you're adding a lot of work for people when
> > > you respin patches without following up on the previous version. Thanks!
> >
> > Not only that, but subthreads were cc:d to arm@kernel.org and some
> > were not, so I missed the overnight conversation on the topic.
> >
> > If this email thread is any indication of how the code will be
> > flowing, there's definitely need for more structure. Joel, I'm hoping
> > you'll coordinate.
>
> To be honest, this patchset thread was a bit less clear than anyone
> prefers.  I use get_maintainers to get the initial list, and so adding
> arm@ or soc@ per a request tells me that perhaps those should be
> output via that script.

The tools are working as expected, we normally don't take patches
directly to arm@kernel.org, we let them go in through platform
maintainers who then send it on to us.

> >
> > I'm with Arnd on whether the code should be in drivers/soc or not --
> > most of it likely should not.
>
> I think the misc drivers for a SoC that are a single user interface
> that is focused on the use-case that belongs to that SoC only belong
> in soc/, while if there is something we can do in common -- different
> story.  If it makes sense to just have misc/aspeed/ instead of
> soc/aspeed -- would that align more?

Those views are how the "board file hell" started on 32-bit ARM too,
so we're definitely hesitant to jump to that conclusion without
knowing more about what's actually anticipated.


Do you happen to have an estimate on what kind of drivers are
needed/anticipated?


-Olof
