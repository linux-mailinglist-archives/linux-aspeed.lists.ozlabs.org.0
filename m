Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1929B55E18
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2019 04:04:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YRCq2fRDzDqZy
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2019 12:04:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="RQc6Aiej"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YRCj4cVwzDqYq
 for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2019 12:04:01 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id h21so666241qtn.13
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2019 19:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d8pVeLPdHk2oTXC+KppJWuWHBrcymZj+Ve80HyFGwuM=;
 b=RQc6Aiej+ibrcj8EnhRUFYW0CF95hEqo6UNcmr93VE/NI/oXiPks1VSCIaE4wdPToX
 nryHkPqN8pKSU/Gqy4tldvjj0848xviRF/IEyWEtjmxS+61vchdVDDhJ0105O1CAe+Ct
 3u9NEFdmU0vp4WNonMSTjdqv3SK0WNv4aDjYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d8pVeLPdHk2oTXC+KppJWuWHBrcymZj+Ve80HyFGwuM=;
 b=akxlf6BW/cGbhqehTPDaNd+oe8EqKshT12TAKr9OJx5jkQEPzFv+mn62AeGtPfqSIu
 tJIcsqeKEFHBm9TPc4PcI+3jlbhdwNWnZHNVHFo4NCIv4+KR0ppyRHCqg2j2zk4wCF6r
 C98qgPBypvTH4blwi6j+cNohZbwtpL6VqY49CadjTf1aAM1proFuZJ23oRhIp8PFWJ0+
 4ltuLRxCinzCO2D5rwUGRCsQ0C65sCWKel871Q/0cbD/pCFQ+E7nlcV+of7a7cjcLoSu
 ElHrmXPwmSOTfjMpqQw+lo4NX3ds53bOhFE7m9Qn/inHtfpXhTNKlf97i/HBGGamIw8M
 sBxQ==
X-Gm-Message-State: APjAAAVrXTQs5C6+lP3L8AOoEj6wsIkose6ok7Bj2cjaumIcAeCzrlzZ
 0f+MmjEL3bzntoqYiHxZXb012Lw7VLyJ45skmQY=
X-Google-Smtp-Source: APXvYqxXm5H989j0lfUgETt85cMUgy6FEEBsU+i07r9Fll+zG+PORZk240DXvqfxbhcz+L8wFu+jyMYANdteoO+UkCY=
X-Received: by 2002:ac8:264a:: with SMTP id v10mr1353396qtv.255.1561514637307; 
 Tue, 25 Jun 2019 19:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XfL-U-BeynGQNBp5rPiv1gzD=7DVzyvrgtoL3njU1Kr_A@mail.gmail.com>
 <CAOesGMjTBazjfMYEKww_dGuFAZYa7f6JBZDoyyCNaWKvKdpbQw@mail.gmail.com>
In-Reply-To: <CAOesGMjTBazjfMYEKww_dGuFAZYa7f6JBZDoyyCNaWKvKdpbQw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 26 Jun 2019 02:03:45 +0000
Message-ID: <CACPK8Xf=vb4To_fxpJiaT-is3BBGg1SUsAc1qtFrBd-FwmPXRA@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: aspeed: defconfig changes for 5.3
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
Cc: arm <arm@kernel.org>, linux-aspeed@lists.ozlabs.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 25 Jun 2019 at 13:18, Olof Johansson <olof@lixom.net> wrote:
>
> Hi,
>
> Looks like the multi_v5_defconfig changes aren't producing the results
> you're probably expecting -- unless the drivers are pending in
> linux-next?
>
> arch/arm/configs/multi_v5_defconfig:257:warning: override: reassigning
> to symbol ASPEED_LPC_CTRL
> arch/arm/configs/multi_v5_defconfig:258:warning: override: reassigning
> to symbol ASPEED_LPC_SNOOP

Oops, sorry. I made a mistake when preparing the change and missed the
warning when testing. We now have two copies of each of these options
in the defconfig (they moved around due to misc -> soc movement).

I've sent a follow up patch for you to apply directly. Let me know if
that's okay, otherwise I can do a new tag.

Cheers,

Joel

>
>
> -Olof
>
> On Sat, Jun 22, 2019 at 9:59 AM Joel Stanley <joel@jms.id.au> wrote:
> >
> > Hi ARM maintainers,
> >
> > Here are some defconfig updates for the ASPEED machines. I haven't
> > sent one for a while, so there's a nice collection of drivers to add.
> >
> > The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> >
> >   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git \
> >     tags/aspeed-5.3-defconfig
> >
> > for you to fetch changes up to 2d8bf3404bb0e65dffb7326f7fb6e96fa3cee418:
> >
> >   ARM: configs: multi_v5: Add more ASPEED devices (2019-06-22 17:12:17 +0930)
> >
> > ----------------------------------------------------------------
> > ASPEED device tree updates for 5.3
> >
> > Add new drivers to the ASPEED G4 and G5 defconfigs, and to the armv5
> > multi defconfig.
> >
> > ----------------------------------------------------------------
> > Joel Stanley (2):
> >       ARM: configs: aspeed: Add new drivers
> >       ARM: configs: multi_v5: Add more ASPEED devices
> >
> >  arch/arm/configs/aspeed_g4_defconfig | 10 ++++++++--
> >  arch/arm/configs/aspeed_g5_defconfig | 14 ++++++++++++--
> >  arch/arm/configs/multi_v5_defconfig  |  8 ++++++++
> >  3 files changed, 28 insertions(+), 4 deletions(-)
