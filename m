Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4878647FA86
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Dec 2021 07:29:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMnng0yHPz2yw5
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Dec 2021 17:29:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ABAPlhry;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=ABAPlhry; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMnnW2D5Nz2xBK;
 Mon, 27 Dec 2021 17:29:18 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B3957B808C2;
 Mon, 27 Dec 2021 06:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F29C36AEA;
 Mon, 27 Dec 2021 06:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1640586552;
 bh=nfs9cY8hI68fJLHPs5Fa7P0ypNV+LDUhpthBrDIFF8E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ABAPlhryXS4apdou9GUXwJ8i5FQcKWPhWFsKp7W0eJWH4AMZRiTk0eGETSG0DstwF
 84NvaMBh07x3inS0s2BeTyjeaglKmONOOBYVNDTjwo5M006tzcriXVb+OkSmba8D9/
 dbk303EYzmi5XnWPJJQaYoe70dl6LR7fAjpV0GNQ=
Date: Mon, 27 Dec 2021 07:29:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] fsi: Aspeed: Fix a potential double free
Message-ID: <YcldM9sgYdjMYMtH@kroah.com>
References: <2cafa0607ca171ebd00ac6c7e073b46808e24f00.1640537669.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cafa0607ca171ebd00ac6c7e073b46808e24f00.1640537669.git.christophe.jaillet@wanadoo.fr>
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
Cc: kernel-janitors@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 alistair@popple.id.au, linux-kernel@vger.kernel.org, jk@ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, Dec 26, 2021 at 05:56:02PM +0100, Christophe JAILLET wrote:
> 'aspeed' is a devm_alloc'ed, so there is no need to free it explicitly or
> there will be a double free().

A struct device can never be devm_alloced for obvious reasons.  Perhaps
that is the real problem here?

> Remove the 'release' function that is wrong and unneeded.
> 
> Fixes: 606397d67f41 ("fsi: Add ast2600 master driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is completely theoretical. It looks good to me, but there is a
> little too much indirections for me. I'm also not that familiar with
> fixing issue related to 'release' function...
> 
> ... So review with care :)
> ---
>  drivers/fsi/fsi-master-aspeed.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> index 8606e55c1721..4a745ccb60cf 100644
> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -373,14 +373,6 @@ static int aspeed_master_break(struct fsi_master *master, int link)
>  	return aspeed_master_write(master, link, 0, addr, &cmd, 4);
>  }
>  
> -static void aspeed_master_release(struct device *dev)
> -{
> -	struct fsi_master_aspeed *aspeed =
> -		to_fsi_master_aspeed(dev_to_fsi_master(dev));
> -
> -	kfree(aspeed);
> -}
> -
>  /* mmode encoders */
>  static inline u32 fsi_mmode_crs0(u32 x)
>  {
> @@ -603,7 +595,6 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
>  	dev_info(&pdev->dev, "hub version %08x (%d links)\n", reg, links);
>  
>  	aspeed->master.dev.parent = &pdev->dev;
> -	aspeed->master.dev.release = aspeed_master_release;

Odd, then what deletes this device structure when the release function
wants to be called?  You should have gotten a big warning from the
kernel when removing the device from the system at runtime, did you test
this somehow?

This does not look correct at all.

greg k-h
