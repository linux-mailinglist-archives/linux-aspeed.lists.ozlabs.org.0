Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F49A11372
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 08:40:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vly80XP2zDqQJ
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 16:40:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="T8p1ZpJp"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vly22KF7zDq99
 for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2019 16:40:26 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3ABF1208C4;
 Thu,  2 May 2019 06:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556779223;
 bh=VKRnFzqwCQEQEJ4Whj1x0Xu91tlu8JsLCBySle3yAbM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T8p1ZpJppNoJp7O4j75gUhtvC7VqfqcrSud4+QxpZ5Av0V6CcEwfq2CqR/sfp+a5r
 UXy7GLtsv0jhdmm0qAE/Kasgsaz4tTh4ayHBl14I4g9WPIPEk6IOBap7JOL2RH1Y1L
 l+05oYWOcBVWK9MorrgwN1u+pGDHMuSXGRmIncRg=
Date: Thu, 2 May 2019 08:40:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH] misc: aspeed-lpc-ctrl: Correct return values
Message-ID: <20190502064021.GA14911@kroah.com>
References: <20190501223836.1670096-1-vijaykhemka@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190501223836.1670096-1-vijaykhemka@fb.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: sdasari@fb.com, Arnd Bergmann <arnd@arndb.de>,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, May 01, 2019 at 03:38:36PM -0700, Vijay Khemka wrote:
> Corrected some of return values with appropriate meanings.
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> ---
>  drivers/misc/aspeed-lpc-ctrl.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/misc/aspeed-lpc-ctrl.c b/drivers/misc/aspeed-lpc-ctrl.c
> index 332210e06e98..97ae341109d5 100644
> --- a/drivers/misc/aspeed-lpc-ctrl.c
> +++ b/drivers/misc/aspeed-lpc-ctrl.c
> @@ -68,7 +68,6 @@ static long aspeed_lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
>  		unsigned long param)
>  {
>  	struct aspeed_lpc_ctrl *lpc_ctrl = file_aspeed_lpc_ctrl(file);
> -	struct device *dev = file->private_data;
>  	void __user *p = (void __user *)param;
>  	struct aspeed_lpc_ctrl_mapping map;
>  	u32 addr;

This change is not reflected in your changelog text :(

Please fix up, or break this up into multiple patches.

greg k-h
