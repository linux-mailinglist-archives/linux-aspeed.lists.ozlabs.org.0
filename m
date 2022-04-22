Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F5A50B0D5
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Apr 2022 08:48:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kl4k31JfFz3bZY
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Apr 2022 16:48:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=kgcKhRLn;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=kgcKhRLn; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kl4jz0k4nz2x9X
 for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Apr 2022 16:48:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 487BA61B74;
 Fri, 22 Apr 2022 06:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077D5C385A4;
 Fri, 22 Apr 2022 06:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1650610098;
 bh=gISDvz+D8qTMQ5Gp5PJQM46yJh6C9L4liYxsGrNBnKw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kgcKhRLnA244Wn4UbJjktxAmaZtk7y5n4z/WkITGoHr888a7zSvTs8WVDspEYoSOL
 lkrlZfuEeFN6V9GTnoYBf8goHmYMx7UzmOWUdpCozkSrgwxY3tCNi3Af1cdVAzEK+F
 j8Lj3f0q5CdC8OZjm6dI9M52+JUVzCRJJDS06jWA=
Date: Fri, 22 Apr 2022 08:48:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v3 0/3] firmware: Add boot information to sysfs
Message-ID: <YmJPrxB8x/zE4Vy7@kroah.com>
References: <20220204072234.304543-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220204072234.304543-1-joel@jms.id.au>
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
 "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Feb 04, 2022 at 05:52:31PM +1030, Joel Stanley wrote:
> v3 resolves Greg's review for the bootinfo header and macros, and drops
> uart_boot as it's unlikely to be common across platforms.
> 
> v2 reworks the series to put the sysfs properties in the core, and
> optionally show them with the is_visible() callback.
> 
> This is the second iteration of this idea. The first used socinfo
> custom attribute groups, but Arnd suggested we make this something
> standardised under /sys/firmware instead:
> 
>  http://lore.kernel.org/all/CAK8P3a3MRf0aGt1drkgsuZyBbeoy+S7Ha18SBM01q+3f33oL+Q@mail.gmail.com
> 
> Some ARM systems have a firmware that provides a hardware root of
> trust. It's useful for the system to know how this root of trust has
> been configured, so provide a standardised interface that expose this
> information to userspace.
> 
> This is implemented as a sysfs attribute group registration in the
> driver core, with platforms populating values obtained from firmware at
> kernel boot time.
> 
> Patch 2 provides a user of the properties on an ARM system.
> 
> Patch 3 is new in v2 and is an example of populating bootinfo with the
> EFI secure boot status.

I would like arch maintainers to review this before it going any
further.

thanks,

greg k-h
