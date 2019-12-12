Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4274E11C51C
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Dec 2019 06:01:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YM7x2zJrzDqv4
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Dec 2019 16:01:01 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cnFUZ0Ze"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="KC/7LfJs"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YM7k5gm0zDqv4
 for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Dec 2019 16:00:50 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E201A2245B;
 Thu, 12 Dec 2019 00:00:47 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 12 Dec 2019 00:00:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=VvHehYcJTV2U7Yt+Z/LgcU3zIcaVlk2
 0N9lTk/I0iE0=; b=cnFUZ0ZeOJN+c+hgvl6PLP6hGO/c4siINbrl4shIs4Vn0g2
 jcbYWipS5Ln5qP+8pzMqRkVKbUT+HZzMaLcDDo1q67nBH36hxuivO5OJ0X3HN/2T
 bE0lxljVqhjVafinlhgP+MqR4APxEOmBDjKPP/eaQv/OK6k5QmWbhPaAFfs7Amn8
 je40H52KR2GAH3HIVOFBG7XfhNd03s2zAFKDf1cS3uQz1MER0vsv+g1ZQlOFn/aM
 /YGjV1jby6MQCqemunnamiK/x4bvMjzRHNTO3wIw1inutD1PUhCO2vUF/lDUMwSe
 zC41NeOO9OYNKhY7FUBrh9q2dUdTeg86PzXfCCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=VvHehY
 cJTV2U7Yt+Z/LgcU3zIcaVlk20N9lTk/I0iE0=; b=KC/7LfJsHwJ15TWkCIwjKy
 E3gps055vLlIWBBa6mha9xlvaW5Yr2Fegfa4jWgpydSxZgrHPnIPbsHUJ5lAfGkq
 h7SFuD6vFgusvusDBCI1CZKigLtrLzB3DMIlwzThjVAgtTXJEn8KF3C3zD212ur1
 Zu3gVQfWuPBzwqII0nGsHetouFT1yfDGHLyi7plXB8lcsS6vjg6K1gviv/ixq7ST
 lKRs4uFZ7MqewdsjUp/77jrL15UhnCmQ8rlcOdQnqoRhgw7SQoYFkA+U6zPR7DsA
 gHuCGh5eZQ3sfrAj72f3PqDX4YUno8prS60xRU12g2aJ9wvsZrsJYKD9T16VGzPg
 ==
X-ME-Sender: <xms:fsnxXaMmQ9dd74Crag1bhhV1PWSQBqURkIjZn-b5ARHLfZpgQ-jTng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeliedgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:fsnxXfgI70VJkS_F0tNs31-Ibwrj6qCq-TYZopq1VeKa13257GDOVw>
 <xmx:fsnxXeVd5BKAsOVHmzmli9NL8w4e-qh8Xef7DBC8QUUsPbzYpM-11Q>
 <xmx:fsnxXer7Z7XndpStvZv3iej3UvwKhCef6FCmdsm7Byoa5iVKCZcfhg>
 <xmx:f8nxXXD08UQXTHVRYMaARYJsV2E-JeuFCQ1qlbvp_-Jc6er9TGUUvQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C6411E00B9; Thu, 12 Dec 2019 00:00:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-679-g1f7ccac-fmstable-20191210v1
Mime-Version: 1.0
Message-Id: <2fca83fb-b83a-4adb-9ff2-0658db1b2c66@www.fastmail.com>
In-Reply-To: <d5eee648-fc35-5f9e-9c73-5fa76a6e04c9@linux.ibm.com>
References: <1575566112-11658-1-git-send-email-eajames@linux.ibm.com>
 <1575566112-11658-8-git-send-email-eajames@linux.ibm.com>
 <d97de592-d3c6-4683-ab36-4ea2e8bd27b7@www.fastmail.com>
 <d5eee648-fc35-5f9e-9c73-5fa76a6e04c9@linux.ibm.com>
Date: Thu, 12 Dec 2019 15:32:25 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/12] drivers/soc: xdma: Add user interface
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
 Jason Cooper <jason@lakedaemon.net>, linux-aspeed@lists.ozlabs.org,
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 tglx@linutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 12 Dec 2019, at 07:13, Eddie James wrote:
> 
> On 12/10/19 9:48 PM, Andrew Jeffery wrote:
> >
> > On Fri, 6 Dec 2019, at 03:45, Eddie James wrote:
> >> +		}
> >> +	} else {
> >> +		mutex_lock(&ctx->file_lock);
> >> +
> >> +		rc = wait_event_interruptible(ctx->wait, !ctx->current_client);
> >> +		if (rc) {
> >> +			mutex_unlock(&ctx->file_lock);
> >> +			return -EINTR;
> >> +		}
> >> +	}
> >> +
> >> +	aspeed_xdma_start(ctx, &op, ctx->vga_phys + offs, client);
> >> +
> >> +	mutex_unlock(&ctx->file_lock);
> > You've used file_lock here to protect aspeed_xdma_start() but start_lock
> > above to protect aspeed_xdma_reset(), so it seems one client can disrupt
> > another by resetting the engine while a DMA is in progress?
> 
> 
> That's correct, that is the intention. In case the transfer hangs, 
> another client needs to be able to reset and clear up a blocking transfer.

Ah. Can we log a noisy warning about resetting the engine while a DMA is
in progress then? I'd hate to debug this otherwise. The more information
we can log about both clients the better.

We still need to make sure we're using consistent locking, even if we wind
up with nested locking.

> >> +
> >> +static int aspeed_xdma_release(struct inode *inode, struct file *file)
> >> +{
> >> +	struct aspeed_xdma_client *client = file->private_data;
> >> +
> >> +	if (client->ctx->current_client == client)
> >> +		client->ctx->current_client = NULL;
> > Shouldn't we also cancel the DMA op? This seems like a DoS risk: set up
> > a non-blocking, large downstream transfer then close the client. Also risks
> > scribbling on memory we no-longer own given we don't cancel/wait for
> > completion in vm close callback?
> 
> 
> Right, better wait for completion. There's no way to cancel a transfer.

Right, that's handy context.

Cheers,

Andrew
