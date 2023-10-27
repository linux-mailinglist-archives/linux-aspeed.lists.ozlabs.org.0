Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3F37D8F83
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Oct 2023 09:17:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0nGMnJTi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGv9k4Tfxz3cC3
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Oct 2023 18:16:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0nGMnJTi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGv9Y4T88z2xl6
	for <linux-aspeed@lists.ozlabs.org>; Fri, 27 Oct 2023 18:16:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3E88BCE444F;
	Fri, 27 Oct 2023 07:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A3EC433C8;
	Fri, 27 Oct 2023 07:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698391004;
	bh=CBkxV/uFvpzCOvXq/7DVXjOGLxxi3GTw/t/A+HTWNJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0nGMnJTiNrrl2+rN9XPzMH2IcacHjDqVSv6UlJ/cULBbI+YiCV5QLG5YHCkoLKuZK
	 eeItrfl/qeCk8SU0jS7rudj7Bw5yKwjE7UVm1sMMjxhAuaTUyeUJGdRosPS0Nhtjfx
	 hoafJV4TNcsIqxE1mhrXswdKwYOML9x0OuA/Xw6c=
Date: Fri, 27 Oct 2023 09:16:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] soc: aspeed: lpc: Fix impossible judgment condition
Message-ID: <2023102730-outmatch-rising-14f0@gregkh>
References: <20231027020703.1231875-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231027020703.1231875-1-suhui@nfschina.com>
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
Cc: robh@kernel.org, linux-aspeed@lists.ozlabs.org, arnd@arndb.de, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, roblip@gmail.com, andrew@codeconstruct.com.au, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Oct 27, 2023 at 10:07:04AM +0800, Su Hui wrote:
> smatch error：
> drivers/soc/aspeed/aspeed-lpc-snoop.c:169
> aspeed_lpc_snoop_config_irq() warn: platform_get_irq() does not return zero
> 
> platform_get_irq() return non-zero IRQ number or negative error code,
> change '!lpc_snoop->irq' to 'lpc_snoop->irq < 0' to fix this.
> 
> Fixes: 9f4f9ae81d0a ("drivers/misc: add Aspeed LPC snoop driver")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
