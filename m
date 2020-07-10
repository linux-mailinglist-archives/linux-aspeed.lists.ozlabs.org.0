Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 237DB21AC6D
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jul 2020 03:14:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2w7M390KzDrFd
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jul 2020 11:14:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=nbX6FxWq; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Yitk5wyJ; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2w784BN4zDr9T
 for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Jul 2020 11:14:27 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 4DCFA2E3;
 Thu,  9 Jul 2020 21:14:22 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 09 Jul 2020 21:14:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=yw9HbxmYVrUStuFGG15xWYmuHOEp4mb
 rjs7zPres9Ds=; b=nbX6FxWqm7xH1s8bcJ6VKQgvibPNZwzXHk8GeKQam5IJfH3
 ES5IjDIFHNeB39MXXAKRPDPz3xXczt133heBRVoonQ/A4Due0kGY3Kqj7nejT/1T
 DmzSz8LOSNuN0LKxdpUoMzLfH8pfXL+3TFTM/YJ+wcQnMtWWsYPtLkbvh9g16Qz6
 579Zce5dihAC1CZDT2QuEHrdRUSLHp+QI4G8fxfrZvBkuI29vLbDHmrFtL2GFZlX
 q4QscgnDOSJUifKAGnxNyUTKD/4r4UctcEc+/A9ul+lI6Zwv9WBJfTUL9zIwDxSW
 rr81A6x1Y4MQhge32sC+Y4vwaXBVkCUxsZIAENQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=yw9Hbx
 mYVrUStuFGG15xWYmuHOEp4mbrjs7zPres9Ds=; b=Yitk5wyJCWnlKpxOnjf389
 XMJK0dnGDNDYEBOF7FQ7ScdS7N5jhUxjE0FNoB9V7iTsUbIPlCgBfrkO5duA/s0O
 /WMeCuYTKM2nYBoQQfxRxjv7y7nEUc2ED/vVbbzT/I0iYNsIiNGSij5DcmIa1kJz
 6frLO+jGYiSUvpHZi/Omqv1OuabKj1raUQNk6txvr/OMZsngpRHQrskjMK8HYgGg
 G1evBDieb24xQo1Fs7HaiLIuElFEoQx2hAEcw4MdUUYb8Q7sdcUr74LPy/3mkJKq
 xxB7oPOR6A5TNV2fFRJR574O4aIW8seyhqRUAG9Anflu3VpFux+AkX345gvxXbTg
 ==
X-ME-Sender: <xms:7MAHX3p7Xk6KCv6dP_qJlFhK4jUdkn9BhUN_nSgBL7ccOVNkPRsnFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrvddtgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:7MAHXxpLmClJpfh_ZhbV5ne9AjsSlX2WZQDxmmsookPsNe_j6S1Zaw>
 <xmx:7MAHX0OuqUgry6xIxGDFQp_Xpm-jHqy1Bb4aUbpM9b-NnkjXaCHgmA>
 <xmx:7MAHX67Qdmft9mSv_RLQ9YBr_ADv2Ys1pK-UP8ZONFDTcK2akC9Rog>
 <xmx:7cAHXzuzqQHp5TtKVCGo7e6MnlF71RaqakwCZqFV7Jo0ATosZlopyw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 77FD0E00AA; Thu,  9 Jul 2020 21:14:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-613-g8a73ad6-fm-20200709.001-g8a73ad6e
Mime-Version: 1.0
Message-Id: <4acad452-33c7-4fb2-ba90-19a824558b94@www.fastmail.com>
In-Reply-To: <20200709195706.12741-3-eajames@linux.ibm.com>
References: <20200709195706.12741-1-eajames@linux.ibm.com>
 <20200709195706.12741-3-eajames@linux.ibm.com>
Date: Fri, 10 Jul 2020 10:43:59 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] mmc: sdhci-of-aspeed: Fix clock divider calculation
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-aspeed@lists.ozlabs.org,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-mmc <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 10 Jul 2020, at 05:27, Eddie James wrote:
> When calculating the clock divider, start dividing at 2 instead of 1.
> The divider is divided by two at the end of the calculation, so starting
> at 1 may result in a divider of 0, which shouldn't happen.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
