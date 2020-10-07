Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B48BB285E01
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Oct 2020 13:18:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5sKR5RDczDqFh
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Oct 2020 22:18:51 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Bush+Zj2; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5sKD0RmDzDqFC
 for <linux-aspeed@lists.ozlabs.org>; Wed,  7 Oct 2020 22:18:39 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id c62so2222288qke.1
 for <linux-aspeed@lists.ozlabs.org>; Wed, 07 Oct 2020 04:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m0TJyDw8pHKeWaSkHO/BVcTTfMOs02xp0NKBXo8b3/c=;
 b=Bush+Zj2rlmUi6ZvW1H7C+ez/6tku7Hg2dNDO2tDqZHw3SyNtzOk0phkW+0o1NY3mE
 ZL4n7GZ1Lf/NfZwhaQdjVNmUPOerWziz3rkoIuE4yY9MhSScpF1c6su7v3xw87gwqcUw
 WuzY7rpERimb6mQl1sL59QDsNSQrNVUl/Tk/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m0TJyDw8pHKeWaSkHO/BVcTTfMOs02xp0NKBXo8b3/c=;
 b=MV3jb+wKk1XBffQSFnArqFzNO1Y6LyK8AsQAFhjeQioBn/q7TdR97eUpAZvXJPp9xa
 zep1F7nHi1oHZAZRPCiJy8KnFYNPTEHVHQeTK9INLcTF/D5bHgiQJ5qDTom8FwSEFSCw
 4X8q3DPIo5t0MsjgGzleb0JOPlQGg1lb1etKUWY4PFLfEkRrNBEWjcsn7SjqCdxq46YG
 lyrQ0kg+7aRsWvMzuTtT9qcQAzufzqSsCckrxe5q0GnnMFHs8j47IupU7jKHbZBmO57u
 QQCo8e1LDhnv3M+bMjlFB5dGC3fyn1PCrHKNc0F6vRU2c9RtyqpxF7bSs0n6EDA6gMty
 npvw==
X-Gm-Message-State: AOAM532Opn3vVFKQrScdWM5PQlcfZj1wcQ79tnGWwjbRDahq68lIduPm
 C1bMmlzN5qLsG4T27JCWgDzb9FsLOzCO6y39jsE=
X-Google-Smtp-Source: ABdhPJyu+lraaF+d16qvB8DczfxkzI7tNIX1GqMCmPrMVON/TomPC2McTHmOzDhtTyE0PjD/6JNpxaTb2mD9ATb3QTw=
X-Received: by 2002:a37:c404:: with SMTP id d4mr2134169qki.273.1602069515056; 
 Wed, 07 Oct 2020 04:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XcP_j7q+jWN6_JGaEcfPy=zSQHyizp1LOw05zFB4L9iGQ@mail.gmail.com>
 <20201003201352.GI8203@lx2k>
In-Reply-To: <20201003201352.GI8203@lx2k>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Oct 2020 11:18:22 +0000
Message-ID: <CACPK8XcLOopkx0k14k25puD3YkwHzZS0+3TLcEL43xbxCZBphA@mail.gmail.com>
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

On Sat, 3 Oct 2020 at 20:31, Olof Johansson <olof@lixom.net> wrote:
>
> Hi Joel,
>
> On Fri, Sep 25, 2020 at 06:31:28AM +0000, Joel Stanley wrote:
> > Hello Soc maintainers,
> >
> > Here are some ASPEED changes for the 5.10 merge window.
> >
> > The following changes since commit e55f541e51b5136fc0ced0bdf2b33ee3cca3bc96:
> >
> >   soc: aspeed: xdma: Add reset ioctl (2020-09-25 15:32:57 +0930)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
> > tags/aspeed-5.10-soc
> >
> > for you to fetch changes up to e55f541e51b5136fc0ced0bdf2b33ee3cca3bc96:
> >
> >   soc: aspeed: xdma: Add reset ioctl (2020-09-25 15:32:57 +0930)
> >
> > ----------------------------------------------------------------
> > ASPEED soc driver updates for 5.10
> >
> > New drivers:
> >
> >  - XDMA driver for the BMC to host PCIe DMA device
>
> I don't think this driver belongs in drivers/soc, it's not "soc glue
> logic", and it has a userspace interface. Some of the commits even
> references it as a "misc driver". Mind resubmitting it for drivers/misc
> instead?

(Argh I missed this mail)

We used to have the various little drivers in drivers/misc, but
somewhere along the line we decided to move them to drivers/soc. I
think that was Arnd asking Patrick Venture?

https://lore.kernel.org/linux-arm-kernel/CAK8P3a3CK4o8KnD6M084ULEmm+6_CtNFqYHjSqE5vp+U9YAmkA@mail.gmail.com/

The existing drivers have userspace interfaces for misc parts of the
aspeed chip, mostly relating to the strange (from a traditional
Linux/host perspective) interfaces it exposes to the host. This XDMA
driver should go alongside those other drivers.

With that context, how would you like to proceed?

Cheers,

Joel
