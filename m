Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9559C4A58A8
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Feb 2022 09:43:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jnz3930K6z3bSl
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Feb 2022 19:43:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=dwBuy8Y8;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=dwBuy8Y8; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jnz346f0Lz2xsd
 for <linux-aspeed@lists.ozlabs.org>; Tue,  1 Feb 2022 19:42:56 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A7414B82D10;
 Tue,  1 Feb 2022 08:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAFA7C340EB;
 Tue,  1 Feb 2022 08:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643704973;
 bh=tuTz/4vnnYgcufzTAZfha7A80BzViBwYZlGg6z5D0gU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dwBuy8Y8eSxQ0fFRIa2HthV6Wp4eIxVaObH7hIS3OOWLNJQ2CnsTYnNbL5pn2OLbk
 p+T9Ob1r/ZYG/SlB5E/HwTfh/aOvkLeGcNRS0XK7qheSTBEjHPh/kFEFa3V1Bh7+sg
 tTizMeZmKJyK3NjuIeLTGxUbc3Ez7sw3vzCmSCzo=
Date: Tue, 1 Feb 2022 09:42:50 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 0/2] firmware: Add boot information to sysfs
Message-ID: <YfjyiuWBeJeHCg7q@kroah.com>
References: <20220201050501.182961-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220201050501.182961-1-joel@jms.id.au>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org,
 "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Feb 01, 2022 at 03:34:59PM +1030, Joel Stanley wrote:
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
> This is implemented as a sysfs attribute group registration to be called
> at boot, with the properties described in the ABI document.
> 
> Alternatively we could put the properties in the driver core, and have
> platforms register callbacks for each supported property. This would
> make it harder to insert non-standard properties, with the trade off of
> more code to selectively show supported properties.

It is trivial to selectively show properties in sysfs, the is_visible()
callback is there for this very reason.

So yes, this should be in the driver core so that we do not have random
platform values and fields that have no relation to each other at all.

For example, you could provide these fields for UEFI today, right?  That
would be a good proof if this really can work for multiple systems or
not.

thanks,

greg k-h
