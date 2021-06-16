Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CEA3AA72C
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Jun 2021 01:04:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G51346kkTz30Fm
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Jun 2021 09:04:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=YuogiRdx;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=b5PnAMLV;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=YuogiRdx; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=b5PnAMLV; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G512w1drXz2xYf
 for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Jun 2021 09:04:07 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E563819B7;
 Wed, 16 Jun 2021 19:03:59 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 16 Jun 2021 19:04:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=PO02j9SYy4Fuys7DY1CucmNO5PH1IkV
 Pa73qEXnyVUk=; b=YuogiRdx2QXF1ySvr2xrBPfLQns/DMRgUb9Y/wZf4OHqi5g
 zwNoGKiFQ2hYUmNYRa8KHKtOXrT2cPdDD0AxzEfv7XLoAMBc+9nHsSIJhz9CXilM
 GhwM9Qg2Ssbo4mdZvwIweD1QVcQ5MIJpDWxdMPgdFemBBl/XZUBF+A8KXkj0eJpk
 pJSd+WN6Vm2xoNPkTsNDCP9Q7jjyItBY3C0ZKu5maBGV+1H1n2crdI0BGwkzFP+x
 OJIwPqQzQYXK0Ax6JxcSGLjZ4acHN1Q6gGu/lHR/0M3v70TQTUkR5KcxgPSkeMJg
 H+2dVZdal1BSXbnOSrTz9vJqYihW9bhupa0VAYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=PO02j9
 SYy4Fuys7DY1CucmNO5PH1IkVPa73qEXnyVUk=; b=b5PnAMLVWSDKdbEo8EWUN8
 V+8i8a1QdMNW4fWXRIXlWsfVwLiVhrOWCPnO2bE8w0phO3HnQF4ah3UQj70xyhKe
 B23XpcduqyABKgba3swsYDCls+vi1bbxTRQ6dYbwgnncxKAG5mjHRulJJUXTHInn
 l5g3ggi68Kr1KcxRcRReuBk4UxjY6tcCBl/DX+rSfIPthCL1gtb02+MhjrEtjVsH
 rPLZ+0Y1VeLarLAFFNvLjVcMOBw94bOmzt0zRcKBNe4/Wus1VbF+LgUgOI/4LPYW
 lzwRex7Ph5w8oRKeDT2p3F/D+iR6IyEzsyAsbJ4UZDELZaiOz+HCb73Ctn4Ym5zg
 ==
X-ME-Sender: <xms:XoPKYBJpH2jtt7pDG71yvrzoJd4nhGdpOYF9Ow4bI_UvJeFbkgJ6fw>
 <xme:XoPKYNIEVE4GnGSjYKQ3v2ZRxEhDmjrW5qUMHAIlNWMC27b7FG8O0y1DjDekBLLU2
 vtm86RWEJggeGUtBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeftddgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:XoPKYJsRE1vyMZI2WKvrt9dNizdy3lKOiAYzapsHGXKgb0Yd2wZGMQ>
 <xmx:XoPKYCYtt9IBBtNCfnITaXWBEMLsM930c_RWAeuFmmMDSShT0Rx2sQ>
 <xmx:XoPKYIYh2hk82XCAXK0sRpJ4p2HimScYIdb49pqqLMvj_Q-lSSHn7Q>
 <xmx:X4PKYHz1pVOmPlTrK-xyOMUnlzcEgUkIkMzYHBwunJYpOiiCIjI6pQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CAA02A00079; Wed, 16 Jun 2021 19:03:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-526-gf020ecf851-fm-20210616.001-gf020ecf8
Mime-Version: 1.0
Message-Id: <9902c945-4651-4023-bede-6833392b3811@www.fastmail.com>
In-Reply-To: <20210616162913.15259-1-colin.king@canonical.com>
References: <20210616162913.15259-1-colin.king@canonical.com>
Date: Thu, 17 Jun 2021 08:33:38 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Colin King" <colin.king@canonical.com>,
 "Corey Minyard" <minyard@acm.org>, "Joel Stanley" <joel@jms.id.au>,
 openipmi-developer@lists.sourceforge.net,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH][next]_ipmi:_kcs=5Fbmc=5Faspeed:_Fix_less_than_zero?=
 =?UTF-8?Q?_comparison_of_a_unsigned_int?=
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 17 Jun 2021, at 01:59, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The comparisons of the unsigned int hw_type to less than zero always
> false because it is unsigned. Fix this by using an int for the
> assignment and less than zero check.
> 

> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: 9d2df9a0ad80 ("ipmi: kcs_bmc_aspeed: Implement KCS SerIRQ configuration")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks for catching that.

Andrew
