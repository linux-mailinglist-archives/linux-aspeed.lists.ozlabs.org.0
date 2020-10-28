Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 016CE29CF94
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 11:51:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLlkP3lZYzDqTC
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 21:51:41 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Jvjs0f4G; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLlkF5DWPzDqQv
 for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Oct 2020 21:51:33 +1100 (AEDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5D529246B2
 for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Oct 2020 10:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603882290;
 bh=XD5uCtpl3RH4AtzDxzuSwg9nMZ9CWW/y+BW47Ovv5YE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Jvjs0f4GU5xPcFEX+arBoj4dPbl2k+y35xTfmIkjvcxncNAEsLcc9CSodhamqsqC/
 YTYcglv7d+fHoDGhSNFKLHcKMAuQO1fedEdBOPujdI5/37kc53fmidLLIrF/cld1GD
 k0M75a6De3R+MZZFo4VkbV+6YMvvoUp7S4HF1+Uo=
Received: by mail-qk1-f176.google.com with SMTP id a23so4004932qkg.13
 for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Oct 2020 03:51:30 -0700 (PDT)
X-Gm-Message-State: AOAM532pbezHV6+/gS10uJ3ScYZesNB56mFwrMEJma4T5+0r4ULyA8fP
 7DM7/NJyPEQ+KKeXMO9aKQVsSWZHdrIHXcDAkgc=
X-Google-Smtp-Source: ABdhPJxXLDkIXRHsZEA8pggrfhZxyfLSPo2Dozai4lxy3104l0nLlHTizCAdziThkmK1WgUgBbIuSfTWxKAsTNFlE/I=
X-Received: by 2002:a05:620a:74f:: with SMTP id
 i15mr6785871qki.352.1603882289279; 
 Wed, 28 Oct 2020 03:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <20201020220639.130696-1-joel@jms.id.au>
 <CAK8P3a3gz4rMSkvZZ+TPaBx3B1yHXcUVFDdMFQMGUtEi4xXzyg@mail.gmail.com>
 <428dc31828795ce0b010509c8c30bf0049ad9190.camel@kernel.crashing.org>
 <CACPK8XfHaGWcDf7vDHoPhqgWQ4LEwxq9EBtbkBngEpHEzJk2SA@mail.gmail.com>
In-Reply-To: <CACPK8XfHaGWcDf7vDHoPhqgWQ4LEwxq9EBtbkBngEpHEzJk2SA@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 28 Oct 2020 11:51:13 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1xxefNQqhZN6QWC0-uQ=b7hu4JzoidXt8TgemZFb0ykw@mail.gmail.com>
Message-ID: <CAK8P3a1xxefNQqhZN6QWC0-uQ=b7hu4JzoidXt8TgemZFb0ykw@mail.gmail.com>
Subject: Re: [PATCH] net: ftgmac100: Ensure tx descriptor updates are visible
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Networking <netdev@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Oct 28, 2020 at 5:47 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Thu, 22 Oct 2020 at 07:41, Benjamin Herrenschmidt
> <benh@kernel.crashing.org> wrote:
> > > >
> > > > +       /* Ensure the descriptor config is visible before setting the tx
> > > > +        * pointer.
> > > > +        */
> > > > +       smp_wmb();
> > > > +
> > >
> > > Shouldn't these be paired with smp_rmb() on the reader side?
> >
> > (Not near the code right now) I *think* the reader already has them
> > where it matters but I might have overlooked something when I quickly
> > checked the other day.
>
> Do we need a read barrier at the start of ftgmac100_tx_complete_packet?
>
>         pointer = priv->tx_clean_pointer;
> <--- here
>         txdes = &priv->txdes[pointer];
>
>         ctl_stat = le32_to_cpu(txdes->txdes0);
>         if (ctl_stat & FTGMAC100_TXDES0_TXDMA_OWN)
>                 return false;
>
> This was the only spot I could see that might require one.

No, I don't think this is the one, since tx_clean_pointer is not updated
in the other CPU, only this one. From what I can tell, you have
a communication between three concurrent threads in the TX
path:

a) one CPU runs start_xmit. It reads tx_clean_pointer
    from the second CPU, writes the descriptors for the hardware,
    notifies the hardware and updates tx_pointer.

b) the hardware gets kicked by start_xmit, it reads the
     descriptors, reads the data and updates the descriptors.
     it may send an interrupt, which is not important here.

c) a second CPU runs the poll() function. It reads the
    tx_pointer, reads the descriptors, updates the descriptors
    and updates tx_clean_pointer.

Things get a bit confusing because the tx_pointer and
tx_clean_pointer variables are hidden behind macros
and both sides repeatedly read and write them, with no
serialization.

This is what I would try to untangle it:

- mark both tx_pointer and tx_clean_pointer as
  ____cacheline_aligned_in_smp to avoid the cacheline
 pingpong between the two CPUs

- Use smp_load_acquire() to read a pointer that may have
  been updated by the other thread, and smp_store_release()
  to update the one the other side will read.

- pull these accesses into the callers and only do them
  once if possible

- reconsider the "keep poll() going as long as tx
  packets are queued" logic, and instead serialize
  against the packets that are actually completed
  by the hardware.

        Arnd
