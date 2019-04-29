Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8A8E867
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 19:08:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tB2Y0r1DzDqQ1
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Apr 2019 03:08:53 +1000 (AEST)
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
 header.i=@lixom-net.20150623.gappssmtp.com header.b="0bHW5AZL"; 
 dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tB1l1TVczDqSr
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Apr 2019 03:08:11 +1000 (AEST)
Received: by mail-lj1-x242.google.com with SMTP id r72so5707270ljb.9
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 10:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zy1ZS8ulMtFMg+xrXQSuG8tddrlOp8I6pRjuYcFgB6Q=;
 b=0bHW5AZLT82AmnNrU4T39kTTQRWvld2M59GqqrGav4xpXB/fwMn++vk3QI0E/Nei/e
 bzB5n4CqDIuvJPh/0gDm7QExicaSz4s0GCkRKB6k+f/yIVR/7RE2DWZ9Id4Erf2LUQTe
 ePHayxatb/Upr6CMgEiPnunDYfzhB4wJu2MxPgEUUANl096R/p9BZ35rqSZp5Zti1sVc
 9F/sC9kauTiax5lRnGNDC7NyJ2uSNOo04eijqona9stJwEIt2sM+n17iX3uby2V3sdKs
 0ZXdU2vvIjVS4KLclSxfUjDiNHhGysY4Bq6BYoAkAtCkjcHydRyUI5zo86CqLGnCJPcN
 HPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zy1ZS8ulMtFMg+xrXQSuG8tddrlOp8I6pRjuYcFgB6Q=;
 b=pRUeri+xzzjkMFKVxDon1AJ5dQWdjtd4hQw2uFN7wAAIlM91A7Qw3NmRlfXQKdbvCl
 e9HdAGfo3cD8bB0yu2mcChvvZzaiehBb+YczRJ1jtvuJQFbhk2a3mJneJSIiMChqGVRm
 G7XuaXNGZ+l5PisirXcibcI3FUwUa3I0FzU5qqZK9ytSbuuQJzt/L4800fqLB/NVjg6r
 yLzVN/ObaZhoVwI2srEuz+0dnUtNtkAztSr1LZCnm5VV0XRed/Fv+vfBDv5Yoq3svTgb
 XdnN1xiCLCo25lPXQ7kOEJgRoJvucHReKQeV4qCw9q+4HORbRztOb2zvA8FpRDIvf/iS
 +QlQ==
X-Gm-Message-State: APjAAAXuprnJ2r/Cwv/cDqprY5Sys/TC4DNFcZjAv7Vw8CgLwOlHv/83
 /Iml/eA+Zr89b4Heul2CLD7ZVg==
X-Google-Smtp-Source: APXvYqxNCs6DbQu37ZInG0rcBLjzcvest/ipCGkv0dyIbljMc3Tt2hEnU8TkkujXFMd+T0/DBrD/pg==
X-Received: by 2002:a2e:8905:: with SMTP id d5mr30146595lji.59.1556557688315; 
 Mon, 29 Apr 2019 10:08:08 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id v141sm7367069lfa.52.2019.04.29.10.08.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 10:08:06 -0700 (PDT)
Date: Mon, 29 Apr 2019 09:51:37 -0700
From: Olof Johansson <olof@lixom.net>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] soc: add aspeed folder and misc drivers
Message-ID: <20190429165137.mwj4ehhwerunbef4@localhost>
References: <20190423142629.120717-1-venture@google.com>
 <CAO=notzjzpt0WHfJEWXMGgkoJU8UiLnqZnrGrPs-dRH5GNdJyQ@mail.gmail.com>
 <CAO=notz9QVoqKLrhJ3kx9FHja5+Mh68f36O36+1ewLG+SanmOA@mail.gmail.com>
 <20190425172549.GA12376@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190425172549.GA12376@kroah.com>
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
 Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, soc@kernel.org,
 arm-soc <arm@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Apr 25, 2019 at 07:25:49PM +0200, Greg KH wrote:
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
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I'm totally confused. This is the second "PATCH v2" of this patch that I came
across, I already applied the first.

Patrick: Follow up with incremental patch in case there's any difference.
Meanwhile, please keep in mind that you're adding a lot of work for people when
you respin patches without following up on the previous version. Thanks!


-Olof
