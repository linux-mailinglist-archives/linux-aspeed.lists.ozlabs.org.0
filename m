Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A6C98932F
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 Sep 2024 08:03:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XGYXy420yz2ymr
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 Sep 2024 16:03:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727589807;
	cv=none; b=ows6ZPhPhSOkKlwBHD+lGDhS2X1oKeYp4LnwdCaYzrLvsg29KDbfsXLWUa2pV5QICD7jwMgDi5HBfcWGshHTtOv42SyVDgXySfiS2ztb/LvRmB18oBLVuf/7yJiQg2yXE1q89PMAfeTTtpa4q0WNaCjC7nnHKHcdaquMw40XqHdQAlt0x+iDj7bYfQLFMLV6I5OFvfZ2t5t7tFtmwNUEvo8DVn2+PEHX8dSW0cC/F5eyfqaTLN+PlUCiXcFBW5JIRdqft8sWI7UonsHLn2npjt4yJfRq+xrrvhznzRphh4Y4rDwBg6+j/MW8K49cr9FH4vOmTG6cgjaqWP6zi10QSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727589807; c=relaxed/relaxed;
	bh=o9uURvKc1DY6QUuJ6VpJxSC9OU5W8i9mLSnBb157Bto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQKMVGXsw8seWvamRNYcMXkXgalcXU+63SNLcBsDmwOxB4RBMr6D1GEaqPHGiT4Q+bUResgVueAhmFPG5jQGLpDKTdtXISqxnw+aQDHg3TkZbEZHuyPGYpJ1CLvEGPSZaJTookvPDamGVc6LROsuYvMuJbeQwg4w06Y51sGkFqpE89IYu6181liwKg7aTAjcI5QJVxXd2nSpmofHhvcxU0AX1kSxqmreOchMbwY7rkm6itiWuwP8ayJ3k4g8/mhF52spWl8E3O3xO1zj9omwca4GBQ8IsqSB1c7oIHWy4aVYTddKiX/h7v3HRF9pgOBfIy9PTtUKaFLOC4mzKj2YNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=HjYfikJZ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=HjYfikJZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XGYXv2KxVz2xDM
	for <linux-aspeed@lists.ozlabs.org>; Sun, 29 Sep 2024 16:03:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C7B015C0FCD;
	Sun, 29 Sep 2024 06:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1342DC4CEC5;
	Sun, 29 Sep 2024 06:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727589802;
	bh=fptU/tf3ymT2YXXOyY8VUkt+TUn1oikY1WV66tiihFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HjYfikJZgwpNHTcLhh4TWxtZ9dQMZRBqOpej47zST26rNLK2Al4uCt6rlFCci0pQJ
	 tGawINOTN174qMD0pgUHgQOYMld6IHBUJ3B/1vydH0Y9jdkhUe5l0ypXOhVgdhErvo
	 t2lCPVXgufLTCM2NfmtG+3Z4QRQZXaJmpXyO5NtE=
Date: Sun, 29 Sep 2024 08:03:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Charles Han <hanchunchao@inspur.com>
Subject: Re: [PATCH] soc: aspeed: Add check devm_kasprintf() returned value
Message-ID: <2024092910-mobility-waking-758f@gregkh>
References: <20240929012503.18636-1-hanchunchao@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240929012503.18636-1-hanchunchao@inspur.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: rlippert@google.com, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, u.kleine-koenig@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, Sep 29, 2024 at 09:25:03AM +0800, Charles Han wrote:
> devm_kasprintf() can return a NULL pointer on failure in
> aspeed_lpc_enable_snoop()  but this returned value is not checked.
> 
> Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc chardev")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 3 +++
>  1 file changed, 3 insertions(+)

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
