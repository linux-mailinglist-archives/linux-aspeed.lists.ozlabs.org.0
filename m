Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBE8DD1B
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 09:49:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sxcl4j70zDqMM
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 17:49:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="UujbU0fa"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sxcf4Y91zDqKs
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 17:49:06 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id j6so10925211qtq.1
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 00:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0qeY97UX3qPR9mVn0ASslox/fHOez69lznk44IZQyJw=;
 b=UujbU0faikIxS++cH5j5UD1NhEIoggeoWj8ogOT52YaPJGsXef74ROHkAS6lFTVKul
 /CEwbKNYgZQIGON7B3EkfWKkF/i9yfWGNwYOKPG0Rtmy9DX3ol87CFrpTIoOfMexKfOZ
 JZ5iQdbtbOe66KvS8wQGKrJ1Hzz7G/Pl6OdNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0qeY97UX3qPR9mVn0ASslox/fHOez69lznk44IZQyJw=;
 b=uDjF7qwrnLi/Kbmmpw9lw1LnChwRy28yDTFl7Encz08c06UKUrvj6m0IBlfP2UtQ7e
 lginVF/g5n9VK3tGAalX5tCTgiFJizNjZ/A7Oo2e/yxLi3wQ/jbNtHZUMg17vyyqYv3g
 fCGOoSxCaiNyid8Zi1MhWDZ32nu12L1yvF4Ck9DW/c6G6Dcj6LV+7B7eerK7MAW3Ydyp
 rJTkLQ0h61K0qMaVaLKF8g95XrWiYMbn1DmlbaRx/ZUy/0BYSp6PJkmsT8T2CwC6pW8k
 ZJSrOuZ1OqGbmoZeLbXS2colRiDqouhCLMaHjC1PrJDslPN+U8sQNnAJnb4nphbiJ1Y5
 YDvw==
X-Gm-Message-State: APjAAAXGOSUfaR0dBPh5aQAT5BOC7SAjjFyEc8BCIigh/lpMzUwRNmWe
 ijUtKOh4vos5f4HlWu12L/fqnCh+pqep6dsa3dg=
X-Google-Smtp-Source: APXvYqzsVaFHI1mpvrMv9BhEk+TvbyuiHJPC8oNa5muwf3tjYXiBtUjwDtoUocY+KZOatuMT5qEd4Xcwx7ENT9rnVds=
X-Received: by 2002:a0c:948e:: with SMTP id j14mr17683473qvj.245.1556524143870; 
 Mon, 29 Apr 2019 00:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190423142629.120717-1-venture@google.com>
 <CAO=notzjzpt0WHfJEWXMGgkoJU8UiLnqZnrGrPs-dRH5GNdJyQ@mail.gmail.com>
 <CAO=notz9QVoqKLrhJ3kx9FHja5+Mh68f36O36+1ewLG+SanmOA@mail.gmail.com>
 <20190425172549.GA12376@kroah.com>
In-Reply-To: <20190425172549.GA12376@kroah.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Apr 2019 07:48:52 +0000
Message-ID: <CACPK8XemgKvM38wDSUJsXXeK51dwmeUoKWn+e3ZNHd9v5VBZHA@mail.gmail.com>
Subject: Re: [PATCH v2] soc: add aspeed folder and misc drivers
To: Greg KH <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>
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
Cc: linux-aspeed@lists.ozlabs.org, Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, soc@kernel.org,
 arm-soc <arm@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 25 Apr 2019 at 17:25, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Apr 23, 2019 at 08:28:14AM -0700, Patrick Venture wrote:
> > On Tue, Apr 23, 2019 at 8:22 AM Patrick Venture <venture@google.com> wrote:
> > >
> > > On Tue, Apr 23, 2019 at 7:26 AM Patrick Venture <venture@google.com> wrote:
> > > >
> > > > Create a SoC folder for the ASPEED parts and place the misc drivers
> > > > currently present into this folder.  These drivers are not generic part
> > > > drivers, but rather only apply to the ASPEED SoCs.
> > > >
> > > > Signed-off-by: Patrick Venture <venture@google.com>
> > >
> > > Accidentally lost the Acked-by when re-sending this patchset as I
> > > didn't see it on v1 before re-sending v2 to the larger audience.
> >
> > Since there was a change between v1 and v2, Arnd, I'd appreciate you
> > Ack this version of the patchset since it changes when the soc/aspeed
> > Makefile is followed.
>
> I have no objection for moving stuff out of drivers/misc/ so the SOC
> maintainers are free to take this.

I was on the fence about this. The downside of moving drivers out of
drivers/misc is it allows SoCs to hide little drivers away from
scrutiny, when in fact they could be sharing a common userspace API
with other BMCs.  (Keep an eye out for the coming Nuvoton "bios post
code" driver which is very similar to
drivers/misc/aspeed-lpc-snoop.c).

However, in the effort to move away from BMC that are full of shell
scripts that bash on /dev/mem, we are going to see a collection of
small, very SoC specific, drivers and it doesn't make sense to clutter
up drivers/misc.

Acked-by: Joel Stanley <joel@jms.id.au>

The p2a driver has been merged by Greg. We should move that one over
too. Arnd, can you advise Patrick on how to proceed? We could have him
spin a v3 that includes the p2a driver, but it would depend on Greg's
char-misc-next branch.

Cheers,

Joel
