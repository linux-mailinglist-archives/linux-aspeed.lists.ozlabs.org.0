Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C3A50B739
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Apr 2022 14:26:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlDD26W0xz3bbk
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Apr 2022 22:26:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=r8a9Yh+H;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=r8a9Yh+H; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlDCz6sNTz3bWx
 for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Apr 2022 22:26:22 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7AAC2B82A99;
 Fri, 22 Apr 2022 12:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6671C385A4;
 Fri, 22 Apr 2022 12:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1650630377;
 bh=YWvN2GspVnHvlnte3uDLsyT/zdRooy5HOmSXH4ILyuc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r8a9Yh+Ht3Kz/97UlvVaAMk64r8KVfczuaCGO5oW4WhL0vrR+wdX3Iy9FNFL6vXgh
 5oHodwiiUfOQe0i8o2kTf4uxUnXASb0L3G11/qhY5mEzrLulbIZ4WTcKPnShqaFHSF
 Oz/J2vqFheMqLYwwu+IhZ/6pZ783fWKjvp6JaOr8=
Date: Fri, 22 Apr 2022 14:26:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 1/3] firmware: Add boot information to sysfs
Message-ID: <YmKe5sUIU4z6t0Hn@kroah.com>
References: <20220204072234.304543-1-joel@jms.id.au>
 <20220204072234.304543-2-joel@jms.id.au>
 <YmJPRPhfA4Cki85S@kroah.com>
 <CAK8P3a0G_xNQ6b2e71VXPVi+-j5L--SU37gFErwGYuh1QPrr1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0G_xNQ6b2e71VXPVi+-j5L--SU37gFErwGYuh1QPrr1A@mail.gmail.com>
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
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Apr 22, 2022 at 11:05:46AM +0200, Arnd Bergmann wrote:
> On Fri, Apr 22, 2022 at 8:46 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Fri, Feb 04, 2022 at 05:52:32PM +1030, Joel Stanley wrote:
> > > +What:                /sys/firmware/bootinfo/*
> > > +Date:                Jan 2022
> >
> > It isn't January anymore :)
> 
> The patch was sent on Feb 4, I would expect that to be close enough. Does this
> need to be the month of the kernel release it is merged into instead?

That's usually best, but at least the month the patch was sent in is
good.

Also I notice there's no "who is responsible for this" entry here.

> 
> > > +Description:
> > > +             A system can expose information about how it was started in
> > > +             this directory.
> >
> > I do not understand what you mean by "how it was started".
> >
> > > +             This information is agnostic as to the firmware implementation.
> >
> > How?  This should be very firmware specific.
> 
> The original patch was specific to a particular SoC vendor. Since the
> information provided here is fairly generic in the end, I asked for
> the interface
> to be generalized to the point that it can be reused across multiple
> vendors and architectures.

Ok, and is that what this interface provides?

thanks,

greg k-h
