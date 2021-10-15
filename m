Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D1D42E989
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Oct 2021 08:58:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVxtT5RDrz308m
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Oct 2021 17:58:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=YIVVfacz;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=YIVVfacz; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVxtM5rKVz2ypD
 for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Oct 2021 17:58:02 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9625B6108B;
 Fri, 15 Oct 2021 06:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1634281079;
 bh=aV5aNS+CjapJRcawRhUEtxjrkQRFiQpiNmzl1k0dNDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YIVVfaczpV+gPuxwxTblzQqiuGIfk9twnF9CbPcNzd8XoXgQqWeKzETUPr7ACRoBl
 rL48+jXZO3fkrX1d+M1WAuHZ312TkKJTXxcc8PeqmR3vm5lSxJZyYGO2Er3t/bYNga
 zMKHSCSmt80l7ieaTLz2W7bcO5c5JokTs06sIP8A=
Date: Fri, 15 Oct 2021 08:57:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Qing Wang <wangqing@vivo.com>
Subject: Re: [PATCH] tty: 8250: replace snprintf in show functions with
 sysfs_emit
Message-ID: <YWkmdELuWa6ITIIR@kroah.com>
References: <1634280682-5002-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1634280682-5002-1-git-send-email-wangqing@vivo.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Oct 14, 2021 at 11:51:22PM -0700, Qing Wang wrote:
> show() must not use snprintf() when formatting the value to be
> returned to user space.

Why must it not?  What is broken in the existing code?

> 
> Fix the coccicheck warnings:
> WARNING: use scnprintf or sprintf.
> 
> Signed-off-by: Qing Wang <wangqing@vivo.com>
> ---
>  drivers/tty/serial/8250/8250_aspeed_vuart.c | 6 +++---
>  drivers/tty/serial/8250/8250_port.c         | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> index 2350fb3..082b9bd 100644
> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> @@ -82,7 +82,7 @@ static ssize_t lpc_address_show(struct device *dev,
>  	addr = (aspeed_vuart_readb(vuart, ASPEED_VUART_ADDRH) << 8) |
>  		(aspeed_vuart_readb(vuart, ASPEED_VUART_ADDRL));
>  
> -	return snprintf(buf, PAGE_SIZE - 1, "0x%x\n", addr);
> +	return sysfs_emit(buf - 1, "0x%x\n", addr);

what is the buf-1 thing here for?

Doing a tree-wide change for this type of thing might not be wanted by
many maintainers, especially if you introduce bugs like this :(

greg k-h
