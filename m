Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2AC1352D8
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jan 2020 06:51:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tZxk4h21zDqXP
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jan 2020 16:51:54 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=diHuBgVZ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=TQ8ocAj5; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tZxR1tx8zDqWg
 for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Jan 2020 16:51:38 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7C83E20E7B;
 Thu,  9 Jan 2020 00:51:35 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 09 Jan 2020 00:51:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=4zXEEaU/iHCBgeNnCaboaE/AlWcMHkM
 DqFYgDBdtbUQ=; b=diHuBgVZnWPZiT2Ba54JsvJWRUAmj4qmtiDriFXiELUc593
 nsbkpqt3KU1Hi1qz3qpgIb5O5R3mfLQwFFw3GY5eYeKfIl2b+1T7VuWjAytaOZ3M
 dLpxN8XP21Lz+rPn1sYKY9cZ38Sj5vDN3pG500w4pN2DtYt98y76pUUrd5JF98oR
 9EvqueCRKhPZK4CJ6r4duw9Ra/V17k5UtssDZG0s4ZBdv214yGjNT9cg2DqjnQ1+
 lsT5c3qOTYUelOGSYaeToAmv8h0bncC8vMk4cAyGn6neWOOaVmLbwxBMrzLt9M1k
 73D0cnKLPzEEC4bv9EVvwuC95YTHXQaEB2rzX+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=4zXEEa
 U/iHCBgeNnCaboaE/AlWcMHkMDqFYgDBdtbUQ=; b=TQ8ocAj5yh2l/ATiGsNMrM
 fSqYK+585dUyT16gah8mEzVazgEUK91g6H3tHMmCbtUsf37EmADVb29g406oYpnM
 jQeJw1F1vAorMgRS0P8cGDwIsJhaX57O5r9oe+o/80ioT4gn8+Br30ktG8Ueq2V2
 mRb9GDZRD5HjiVZbqURBbBJYFMglz9aZl+GRXfWTR7bG7c3eoS6dnPCp0wCQ8JcS
 1MvcXtl7IznrOe3o7L63DFQ4xiLm4N4XwePJbyGj3Uee1eed5E8QZ890+P0PCIDT
 esSuQBhjyAAclMUNHc43Ts+myUXrzggR6SvoOjL4ZrmZWMRuPSXygiR030lRKkOw
 ==
X-ME-Sender: <xms:Zr8WXigmlZE-ZMvpHgjYbPG1wc6QPfNFAg4M-s0SrYb5pfrHikO-tA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehledgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:Zr8WXvUbVJv7wt70ZsBHNbZSScGOcT3AwUrudf18kZfVc9HF4E6tqw>
 <xmx:Zr8WXs0Oyf4BNnfPF1noxpQlD_G_UH7dDPEszFJQ6r63WiSApU2ihA>
 <xmx:Zr8WXtEad2I9ZZ93YAxX_1LiY8jFL12jTsbFNaekBDJJwYpjicMKrg>
 <xmx:Z78WXhcldj2QgPlAta08d9LgZel7nLCGMuO-1hYAixy3QGLb66tqyQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7235BE00A2; Thu,  9 Jan 2020 00:51:34 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-740-g7d9d84e-fmstable-20200109v1
Mime-Version: 1.0
Message-Id: <4a8922c3-4062-4c57-bf2a-33b8f9b965f7@www.fastmail.com>
In-Reply-To: <1577993276-2184-8-git-send-email-eajames@linux.ibm.com>
References: <1577993276-2184-1-git-send-email-eajames@linux.ibm.com>
 <1577993276-2184-8-git-send-email-eajames@linux.ibm.com>
Date: Thu, 09 Jan 2020 16:23:34 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v4 07/12] soc: aspeed: xdma: Add user interface
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 tglx@linutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 3 Jan 2020, at 05:57, Eddie James wrote:
> +static ssize_t aspeed_xdma_write(struct file *file, const char __user *buf,
> +				 size_t len, loff_t *offset)
> +{
> +	int rc;
> +	struct aspeed_xdma_op op;
> +	struct aspeed_xdma_client *client = file->private_data;
> +	struct aspeed_xdma *ctx = client->ctx;
> +
> +	if (len != sizeof(op))
> +		return -EINVAL;
> +
> +	rc = copy_from_user(&op, buf, len);
> +	if (rc)
> +		return rc;
> +
> +	if (!op.len || op.len > client->size ||
> +	    op.direction > ASPEED_XDMA_DIRECTION_UPSTREAM)
> +		return -EINVAL;
> +
> +	if (file->f_flags & O_NONBLOCK) {
> +		if (!mutex_trylock(&ctx->file_lock))
> +			return -EAGAIN;
> +
> +		if (READ_ONCE(ctx->current_client)) {
> +			mutex_unlock(&ctx->file_lock);
> +			return -EBUSY;
> +		}
> +	} else {
> +		mutex_lock(&ctx->file_lock);
> +
> +		rc = wait_event_interruptible(ctx->wait, !ctx->current_client);
> +		if (rc) {
> +			mutex_unlock(&ctx->file_lock);
> +			return -EINTR;
> +		}
> +	}
> +
> +	aspeed_xdma_start(ctx, &op, client->phys, client);

As aspeed_xdma_start() has to take start_lock, if O_NONBLOCK is set we will
potentially violate its contract if the engine is currently being reset. We could
avoid this by adding

    if (READ_ONCE(ctx->in_reset))
        return -EBUSY;

before mutex_trylock(&ctx->file_lock) in the O_NONBLOCK path.

Anyway, I think I've convinced myself the locking isn't wrong. It's possible
that it could be improved, but I think we're hitting the point of diminishing
returns.

Andrew
