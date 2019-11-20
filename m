Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD0C1033FF
	for <lists+linux-aspeed@lfdr.de>; Wed, 20 Nov 2019 06:43:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hs6f3fxKzDqw1
	for <lists+linux-aspeed@lfdr.de>; Wed, 20 Nov 2019 16:43:06 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="o3qGQUUe"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="RnqnHsG5"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Hs6Q4YbQzDq8g
 for <linux-aspeed@lists.ozlabs.org>; Wed, 20 Nov 2019 16:42:53 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id DCCF544D;
 Wed, 20 Nov 2019 00:42:49 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 20 Nov 2019 00:42:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=Lnorfs1rp+zeMCoeD57/2AmXPyjOL0H
 a6BaQrOFchsU=; b=o3qGQUUe6InpOAYfXy8pZ4Aqs4r7RB1G35quGiCXZDIklgV
 45j60gck2g/zQszAqi8c5Za9uuFa5OToie9TG5wKf3NeoRnlvwagMRfc//Pk0rYF
 Kp0HVwjVqIUqToU3xq5+rXif9s6UpACLMZAkRRCmwD5Si7rJP0tbTT2QE/WFQrE7
 7VuKvrMKtD2juGIk6FP0krdUfbgTJezKfvtUjqvYGxLAtovkGV5Fv0pyKDa660Cj
 Ydmasn6PPM9s6FrItrawAHkv4na+e4PssTrh1Gw5Rd4NjOJbUIlskIlSnVJTjx/H
 VKAqBkMlAYYu2/hW2uhZSv5Mfm4ySiVTzwVC4hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Lnorfs
 1rp+zeMCoeD57/2AmXPyjOL0Ha6BaQrOFchsU=; b=RnqnHsG5F6inIIh5Q4zjgm
 jhT8HWunrIhBUgPDBTzdY+IWPi5/RIUCil/IMKaxvwJStupYTq2x4Nfai/529Ew/
 CbSkQXByeHdM9Zn9jr6Aak2WeoWvz+zCIOzdEPis/Pj43NpTZUhzrAU2LCvEg5At
 Ob90D1o6vVMxq6i6iLhSYOClZhVI0j7bZhnyhTpVnypYpe18cS/iSanEk2EGNsZU
 AFX9JbHLDzBuSM31HA/uwhdD+4JNEcbxRUFMZCSRKl1zORz/LfrqUMtZ3Wzhm/Zk
 MBlSniBn3RO6TNRZe4c4wMYGd6vAKtX7P7U6oQ8s2CnSsm20lmILh0INSbO5RmPw
 ==
X-ME-Sender: <xms:WNLUXd5dG-U05OpUaPC8cDUivrbL-UkP-j5oBZigZG7yxrksdLol1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudegledgkeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:WNLUXYdH6Bp1flxoNbpZ8YDkEmHnwesdNblqUanSOJZ-bRbxk1gwqA>
 <xmx:WNLUXa4sTbaCEh-VU67y0PE8UnuxPOeusrNXs3iPMY6JbKmDg61jvQ>
 <xmx:WNLUXXsuHVHcWuFeLHbTN3Gi0uEOdZYdoqVQiWJ_vZauzx_GrbfTuA>
 <xmx:WdLUXagf4JLSbPkH13VJVF-BQk5VeeoCdyLYgpw_B1BF0InArSF1gQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C89EFE00A3; Wed, 20 Nov 2019 00:42:48 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-578-g826f590-fmstable-20191119v1
Mime-Version: 1.0
Message-Id: <787e54c2-2fe3-4afc-a69b-94771726194b@www.fastmail.com>
In-Reply-To: <20191120000647.30551-1-luc.vanoostenryck@gmail.com>
References: <20191120000647.30551-1-luc.vanoostenryck@gmail.com>
Date: Wed, 20 Nov 2019 16:14:12 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Luc Van Oostenryck" <luc.vanoostenryck@gmail.com>,
 linux-kernel@vger.kernel.org, "Robert Lippert" <rlippert@google.com>,
 "Patrick Venture" <venture@google.com>
Subject: Re: [PATCH] aspeed: fix snoop_file_poll()'s return type
Content-Type: text/plain
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
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 20 Nov 2019, at 10:36, Luc Van Oostenryck wrote:
> snoop_file_poll() is defined as returning 'unsigned int' but the
> .poll method is declared as returning '__poll_t', a bitwise type.
> 
> Fix this by using the proper return type and using the EPOLL
> constants instead of the POLL ones, as required for __poll_t.
> 
> CC: Joel Stanley <joel@jms.id.au>
> CC: Andrew Jeffery <andrew@aj.id.au>
> CC: linux-aspeed@lists.ozlabs.org
> CC: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c 
> b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> index 48f7ac238861..f3d8d53ab84d 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -97,13 +97,13 @@ static ssize_t snoop_file_read(struct file *file, 
> char __user *buffer,
>  	return ret ? ret : copied;
>  }
>  
> -static unsigned int snoop_file_poll(struct file *file,
> +static __poll_t snoop_file_poll(struct file *file,
>  				    struct poll_table_struct *pt)
>  {
>  	struct aspeed_lpc_snoop_channel *chan = snoop_file_to_chan(file);
>  
>  	poll_wait(file, &chan->wq, pt);
> -	return !kfifo_is_empty(&chan->fifo) ? POLLIN : 0;
> +	return !kfifo_is_empty(&chan->fifo) ? EPOLLIN : 0;

Looks fine to me as POLLIN and EPOLLIN evaluate to the same value despite
the type difference.

Patrick, Rob: can you take a look / test?

Andrew
