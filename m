Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C63360C57F
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Oct 2022 09:39:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxP2l6C5gz3c1K
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Oct 2022 18:39:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Q+aAp3bi;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Q+aAp3bi;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxP2b3dZfz30Mn
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Oct 2022 18:39:02 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 44A7361771;
	Tue, 25 Oct 2022 07:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D26C4314B;
	Tue, 25 Oct 2022 07:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666683535;
	bh=RqosCf/BhmAt5jmMkGgng+kBPtHT3kKyioYvrugSluM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q+aAp3bi30UcqwKg/b/d/6YOPj2ZXOS8hqkWGXr4V6KFJZEEnUt0ieJ4MBy80uIfq
	 2eR2JLevIpTdNv05uJ+59BTyhFvugMp24WZaQfShLw8nnLBdzi1uMiADUt5O0k2P13
	 /0m7Kt2lGjzJQDkOhO8K35oCcc0MMTYAW8emRrt0=
Date: Tue, 25 Oct 2022 09:39:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] MAINTAINERS: Add Ben as a reviewer for ASPEED UCD
Message-ID: <Y1eSxJE+0T68I5CW@kroah.com>
References: <20221025020856.744202-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025020856.744202-1-joel@jms.id.au>
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
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Neal Liu <neal_liu@aspeedtech.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Oct 25, 2022 at 12:38:56PM +1030, Joel Stanley wrote:
> He wrote the vhub driver and would like to be cc'd on patches.

You also added more files to the entry, but did not document that here
:(

> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  MAINTAINERS | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3bb30c0d1cb4..637beabc70f1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3232,12 +3232,15 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/aspeed-video.txt
>  F:	drivers/media/platform/aspeed/
>  
> -ASPEED USB UDC DRIVER
> +ASPEED USB UDC DRIVERS
>  M:	Neal Liu <neal_liu@aspeedtech.com>
> +R:	Benjamin Herrenschmidt <benh@kernel.crashing.org>

I would need Ben's ack before accepting this.

thanks,

greg k-h
