Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C5AE856
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 19:08:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tB1Z5g6WzDqQ1
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Apr 2019 03:08:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lixom.net
 (client-ip=2a00:1450:4864:20::242; helo=mail-lj1-x242.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.b="SpTxWnNX"; 
 dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tB1P2ShLzDqDQ
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Apr 2019 03:07:51 +1000 (AEST)
Received: by mail-lj1-x242.google.com with SMTP id s7so7355365ljh.1
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 10:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YeKK3tAfy5x+3pFMDByyIL1i7Necl4Ot8V4uzh6dPdI=;
 b=SpTxWnNXCT+s7eNFLiBVrhtEPFWtmdu0QV5L9p4KNsv8soOLUaV7vq7TgE8vGgM+sc
 //ZqQu3TjxSrZycLZJXRoccECIY2xm9wxF92OvuZrTbZ7qqLlFjsp6LR5ixPsPAukXXw
 cWBjtTSRskVqm6pjgQsYuPUQ18Zw2ywbwr5mTOX2X/OXIqdRhKT/rR0QfvGYhF6/MA3P
 mfZ1+2b4XfT0zwXc/FzIlna+GiQ0pnsstcwAFj79OddVAskq1Y/vBPe3ghVRQjuRlAxD
 7KwSilnAsQjLlGU+5fxwimueGL8UCDf4rpFTDZRQhg9UvCwus5/SU6uK6iWjxQhq4Hxc
 9uQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YeKK3tAfy5x+3pFMDByyIL1i7Necl4Ot8V4uzh6dPdI=;
 b=dHtewvVxtoNpOsCueenIw68BKKN39em/2eQB1kVS/s2qRlXfbOLzUU+aDOQP047E7W
 pmA2QL7rxIkNFo1vk/3juDS3/RBfTZnAFocgS4MZ8VqRN0MQKmmIX53PpR2gIErrOCWV
 NtkdDyu24oNGmjbLewTgZdHbC04ImJeW1XcwvP/Y63/UPHvRtAjKlqR+rfzfdZUh0H+c
 ye3XvMK1tGUV7xdtA9iOW85C0mvKZTqsI723/NJf1EL1HK/AsLe4FEzSODZ4VgUbftcR
 bk7UYoE1nGfn2orV+lV/JE8tMuCuXGcD+IcVnS75xFrTbzWrWIGORawkLLyaUF8+On4s
 Vhmw==
X-Gm-Message-State: APjAAAW4Q2mwfI89fF86J7lVN9OFJRaelTOaAZoAg14AlO7IaXoddQ/T
 DkL8WR+E/pP2xhhm8xNfL4PHTQ==
X-Google-Smtp-Source: APXvYqxr2kAiL2bmKb1U2ragx5zvjsV94YGmZpTib0GYs7NAZyHDj9Or280CmF4buq1qXwRq5LKh4Q==
X-Received: by 2002:a2e:7503:: with SMTP id q3mr32471107ljc.190.1556557665256; 
 Mon, 29 Apr 2019 10:07:45 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id h14sm6902864ljg.10.2019.04.29.10.07.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 10:07:43 -0700 (PDT)
Date: Mon, 29 Apr 2019 09:31:27 -0700
From: Olof Johansson <olof@lixom.net>
To: Patrick Venture <venture@google.com>
Subject: Re: [PATCH] soc: add aspeed folder and misc drivers
Message-ID: <20190429163127.r6k7yfriz5ha5xul@localhost>
References: <20190422173838.182736-1-venture@google.com>
 <CAK8P3a0k_8+R9FeyZsL6Egvi1Z-G0VrvR0TWXzGHryqxTr6thg@mail.gmail.com>
 <CAO=notxuYsBzWBnNran5jH0RujSBeti6-HsjasCRP6Sq0MwGNA@mail.gmail.com>
 <CAK8P3a24h=0JLZnZWOmzRqM70uhw3QZ_HcYDXST7F6TgSuW6YA@mail.gmail.com>
 <CAO=noty2QN6H_x3RMjqOrY9b0xLLz=MBk6Fb6yCdW9+J0a-bSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO=noty2QN6H_x3RMjqOrY9b0xLLz=MBk6Fb6yCdW9+J0a-bSA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
 gregkh <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Apr 23, 2019 at 08:40:25AM -0700, Patrick Venture wrote:
> On Tue, Apr 23, 2019 at 8:33 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Tue, Apr 23, 2019 at 4:24 PM Patrick Venture <venture@google.com> wrote:
> > >
> > > On Tue, Apr 23, 2019 at 1:08 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > > >
> > > > On Mon, Apr 22, 2019 at 7:38 PM Patrick Venture <venture@google.com> wrote:
> > > > >
> > > > > Create a SoC folder for the ASPEED parts and place the misc drivers
> > > > > currently present into this folder.  These drivers are not generic part
> > > > > drivers, but rather only apply to the ASPEED SoCs.
> > > > >
> > > > > Signed-off-by: Patrick Venture <venture@google.com>
> > > >
> > > > Looks ok, but please resend to arm@kernel.org or soc@kernel.org
> > > > so we can track the submission and make sure it gets applied if
> > > > you want this to go through the arm-soc tree.
> > >
> > > Thanks, I didn't see those come up in the get_maintainers output.
> > >
> > > I had a longer question related to this patch progression -- if I am
> > > moving the aspeed gpio driver to the soc folder, the soc tree may have
> > > the soc/aspeed folder in their next, but the gpio tree wouldn't
> > > necessarily.  I know the branches sync up when things are merged at
> > > the top, but I wasn't sure if there was another mechanism for this?
> >
> > We can generally deal with merge conflicts like this, or you can ask
> > the respective maintainers about it and let us figure something out.
> 
> Thanks for explaining that.
> 
> >
> > In this particular case, why would you move the gpio driver into
> > the soc folder? If there is a proper subsystem for a driver, it should
> > not be in drivers/misc or drivers/soc.
> 
> Ok, that makes sense. I was trying to get a sense of what belonged in
> soc versus the subsystem folders.  My thinking from the limited
> reading was the purpose of a SoC folder was to contain the drivers
> that were only associated with a system-on-a-chip and not a part you
> could buy and place on any board.  A tmp421 sensor is just a generic
> part, versus the pwm controller, which is only for the specific SoCs.
> 
> That said, there are quite a few misc drivers associated with the
> Aspeed parts -- and there are two under review now, so there's a
> strong motivation to move those at least into the soc/aspeed folder.
> Thanks for these clarifying remarks.

drivers/soc is more about platform-level glue and SoC configuration, etc.
Specific IP blocks and drivers normally don't go into there, unless it's
a shared resource that a lot of drivers need access to.

So, for most of the small drivers around the SoC, other directories than
drivers/soc are still the best answer.


-Olof
