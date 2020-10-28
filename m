Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C54729CE53
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 07:10:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLdTs3hfyzDqQv
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 17:10:25 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Z9RiTZ12; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLdTn0SFPzDqKT
 for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Oct 2020 17:10:19 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id a23so3573231qkg.13
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Oct 2020 23:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kvImdiH6czkphg2OF50hgs4sxH0A/WGXwk6w/dwg2pA=;
 b=Z9RiTZ12YjLXpu9kNybaZ5m/TsNRo+dIpu5te7/rkKoPL4facGIMlo0+chdtJ2SK01
 vSGyll/QzrnkHt3r4i5vj5jiHOx9suJB51RHpDxulZnKcRv1T69VcNp1QjK1Kyu1mdTa
 KBOXBja7MLbG4roJJQvEVhFQ9+xBM+5ud04n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kvImdiH6czkphg2OF50hgs4sxH0A/WGXwk6w/dwg2pA=;
 b=FcxB7rDYCCq21w6u9iwNYkQ7iKXwRwv2uWM6kZEegWrAvZjBkgsjarPDt2cIVbITCk
 EtK2mwq4Mwpl5SyrhRH9wi73qcez60BZ6gaC4VNUnGjdJ4dNxGHuSopZBCxnlkJfHv09
 meY6n2uZgtveNf8CFlGl5ZMwND8ZzTDxT68c02KVSEKKT6+nXhgeoOXcBa6Oj+Zgs1jE
 yoqHzwXkB/n/pXFYtk8sh+KiG8K9Hy4cA8V53o3++BcGvJm4LVzQNuKLplM47Ac0X5Qb
 u8k9U1wNLcAC0KqCQViH0J9H82HU5CCmSQHg8IxoBL/g9LtYL6nQpvDZCmPkxRqk9C4q
 pDBg==
X-Gm-Message-State: AOAM531IPdNS0/CoPuGrw9cpHQr6FSf57R6gonuClEh8Ld1h2PXCWlGn
 K1MnDbfLjNQRlcNkuMQzKdb0MDBlcI9M6wCaopI=
X-Google-Smtp-Source: ABdhPJxRhtByiRpQro7alnw3rwV8CDXOozlXAmur9xPXVX4I91ZMeUn1k2lpokmzsq7wCpq0UEtvXm5rfzuZWJYfsCk=
X-Received: by 2002:a05:620a:1303:: with SMTP id
 o3mr5989730qkj.66.1603865415753; 
 Tue, 27 Oct 2020 23:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XcP_j7q+jWN6_JGaEcfPy=zSQHyizp1LOw05zFB4L9iGQ@mail.gmail.com>
 <20201003201352.GI8203@lx2k>
 <CACPK8XcLOopkx0k14k25puD3YkwHzZS0+3TLcEL43xbxCZBphA@mail.gmail.com>
In-Reply-To: <CACPK8XcLOopkx0k14k25puD3YkwHzZS0+3TLcEL43xbxCZBphA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Oct 2020 06:10:03 +0000
Message-ID: <CACPK8XfWfvCBW2WET8WknZFkROSDX3WtQ39ie5wbn0eRJfb1UQ@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: aspeed: soc changes for 5.10
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 Patrick Venture <venture@google.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, SoC Team <soc@kernel.org>,
 arm <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 7 Oct 2020 at 11:18, Joel Stanley <joel@jms.id.au> wrote:
>
> On Sat, 3 Oct 2020 at 20:31, Olof Johansson <olof@lixom.net> wrote:
> >
> > Hi Joel,
> >
> > On Fri, Sep 25, 2020 at 06:31:28AM +0000, Joel Stanley wrote:
> > > Hello Soc maintainers,
> > >
> > > Here are some ASPEED changes for the 5.10 merge window.
> > >
> > > The following changes since commit e55f541e51b5136fc0ced0bdf2b33ee3cca3bc96:
> > >
> > >   soc: aspeed: xdma: Add reset ioctl (2020-09-25 15:32:57 +0930)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
> > > tags/aspeed-5.10-soc
> > >
> > > for you to fetch changes up to e55f541e51b5136fc0ced0bdf2b33ee3cca3bc96:
> > >
> > >   soc: aspeed: xdma: Add reset ioctl (2020-09-25 15:32:57 +0930)
> > >
> > > ----------------------------------------------------------------
> > > ASPEED soc driver updates for 5.10
> > >
> > > New drivers:
> > >
> > >  - XDMA driver for the BMC to host PCIe DMA device
> >
> > I don't think this driver belongs in drivers/soc, it's not "soc glue
> > logic", and it has a userspace interface. Some of the commits even
> > references it as a "misc driver". Mind resubmitting it for drivers/misc
> > instead?
>
> (Argh I missed this mail)
>
> We used to have the various little drivers in drivers/misc, but
> somewhere along the line we decided to move them to drivers/soc. I
> think that was Arnd asking Patrick Venture?
>
> https://lore.kernel.org/linux-arm-kernel/CAK8P3a3CK4o8KnD6M084ULEmm+6_CtNFqYHjSqE5vp+U9YAmkA@mail.gmail.com/
>
> The existing drivers have userspace interfaces for misc parts of the
> aspeed chip, mostly relating to the strange (from a traditional
> Linux/host perspective) interfaces it exposes to the host. This XDMA
> driver should go alongside those other drivers.
>
> With that context, how would you like to proceed?

Arnd, Olof, what would you like to do here?

Cheers,

Joel
