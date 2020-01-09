Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B00381352E5
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jan 2020 06:58:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tb4w6w9MzDqXM
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jan 2020 16:58:08 +1100 (AEDT)
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
 header.s=fm1 header.b=EYJ8qXOp; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Xs3rnUen; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tb4p3JdZzDqWg
 for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Jan 2020 16:58:02 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E833321F18;
 Thu,  9 Jan 2020 00:57:59 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 09 Jan 2020 00:57:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=EsMKsMKI6HhF0F0RtD4RD5a7b8gvE2C
 1Qv6MEtScRc0=; b=EYJ8qXOpV4/5J8MYiMmaa8eIayd6/H1HHxWVnf/tlbBRNto
 fm3Q4Fh9cgfTPSjK9rNLBrbApDVyxe12FJ6FoZMKKIfI/o35oYFzeLu6sT3doOGF
 rcFXwT1B87faUViSKpFIk5dp7w9b6b1ZbDQ4lcHqWbsPGsGFCNIi50of4Bw6cWKU
 ekZNyPTwr+pi3KXXZta4A2ce3LNLVAaV0OFbWJcyw2t1UHsHCXy3s2gDwynYWvRX
 khyCdm6jNGvzlO5JxDtVtSxAqmv3uvntP1ADUTyt4LTp4CGPiTFl2pqOWJz6EZGB
 mR5+2YEur68wjgp6AuSFr0OGMqhiZkdVDAWLygQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=EsMKsM
 KI6HhF0F0RtD4RD5a7b8gvE2C1Qv6MEtScRc0=; b=Xs3rnUenGEIz7PHXDH/03Y
 bensMd8MOXuP70PFSP5rGOVCtoYjI+24kyTIhCofx5Aqx37f1gC8jDgU15/oRQUd
 LdgzprFRmP6YgEaSB6lLnuNbfNW3pO09P62Hu6WmhW9NKc/2G8ZMhDDh4NcyD/kc
 x/+D9ZQL1v3ELOxcigJB7vzlM8ZdqvIWhKBpyhdUa+QF/ftdqx4EOa1zwJm00Q42
 rnYIihXXh7Brqo2zg998zDTNBBSQRzqkqmKrzKUPyx0xfIhNmeVai8XZihgMrY0F
 ZPtGCB8EsSjwlYlgGNE3ykKDD1Hf0eQZ7hORs5R/cBp4zp/GOxtnCeIiucAwzsDw
 ==
X-ME-Sender: <xms:5sAWXqSUlHYgKeyBAM34X3wt_YQWCvCZVjGTSY5TXCy87amJcWywmw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:5sAWXsGOqfvR6Phd36-p-3SnwtH8TSSKIX3Rmt3T9d1006Y7MkK_mw>
 <xmx:5sAWXqk3XoSaA_SeoBMr0RsoC56Drn_goMsUKLUjsyJUFe72GHz8ng>
 <xmx:5sAWXn0of7jeys2u1opLc6hpZ4gTFaloF-tefoSgxIkX7eh0ckpCpw>
 <xmx:58AWXpMqXvEOp__CoPwm3O8ewgPsyAqYxgS_SfH0SUTGJEdmdW4OHg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BD6ACE00A2; Thu,  9 Jan 2020 00:57:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-740-g7d9d84e-fmstable-20200109v1
Mime-Version: 1.0
Message-Id: <cb602d43-7e00-4d7b-8f05-6b774d573901@www.fastmail.com>
In-Reply-To: <1577993276-2184-9-git-send-email-eajames@linux.ibm.com>
References: <1577993276-2184-1-git-send-email-eajames@linux.ibm.com>
 <1577993276-2184-9-git-send-email-eajames@linux.ibm.com>
Date: Thu, 09 Jan 2020 16:29:57 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v4 08/12] soc: aspeed: xdma: Add reset ioctl
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
> Users of the XDMA engine need a way to reset it if something goes wrong.
> Problems on the host side, or user error, such as incorrect host
> address, may result in the DMA operation never completing and no way to
> determine what went wrong. Therefore, add an ioctl to reset the engine
> so that users can recover in this situation.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
