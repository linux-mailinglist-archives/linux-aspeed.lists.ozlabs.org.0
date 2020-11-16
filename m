Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EBA2B3BFE
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Nov 2020 05:11:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZFxn243NzDqPm
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Nov 2020 15:11:25 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=FzAvqnDB; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=pMKEAPa+; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZFxg1H1CzDqNj
 for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Nov 2020 15:11:19 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id CBB0C5C0054;
 Sun, 15 Nov 2020 23:11:16 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 15 Nov 2020 23:11:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=L1/AgPHqizdnomLrXS0OIGSD6EAbY5E
 Ccvh31UQ1hJQ=; b=FzAvqnDBlcDPjSiXOE0YpM0321NTERJcxsExT/OH5hgXIav
 gGEK8B5HvIlj0RZFdyazkcarcbFqdHByITeqejOMxksowEasauDYCyHFIZhP9Bwk
 YYXYEfiIrmaGwb/ld0qQC4XQ9TrOtgA1hmPSV3/a8hzl39Wgr5RMnWuithc58Mqy
 2lC/dTl7qZTrf/3za5lPPbiXBrQYLmcrXEccQ1MQntFDUTAtNjxNbSd6NK1Q/3wE
 FvlWHD+z5ekWqWAiCUamTmwA+blIWf8+NYAqReVWK9qcHzsD1b+PLFPMsD7GM+W8
 yiO9xDSt5QlnGJhtqWV1dDe0yZ0ZOZkUmtNWSIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=L1/AgP
 HqizdnomLrXS0OIGSD6EAbY5ECcvh31UQ1hJQ=; b=pMKEAPa+Iwd4j16QUeU2Yi
 t3bFlSzGoM4qeHHZtNyN3XZ8NzFxwjzktTXVyFar2dbVCwZOCeUQrXeUwGpaYftd
 lwU+Txe4951P1pCxGqyaMp7UA6gpkhNYvA3ja0edyByvI9BhqpOrGHhm6hHAmzju
 g4PS8sKrLyc7ve/nxnarcKI2xBsIyVT34Jg/ULCgsfdwWM4Wg13LQbEQ1TV9IMSq
 ziyHVeqNyft+B6V76uWdHTxCuKpNCyxl8rnXrhClYSNtxzC77fQ4sH2f/NRcmiAz
 +qmkkc5Gxjb2FMZgCb8o3HewvdQDlAO6G0m0FhyAg5XhMGsPWYywxiHXUa7qyT0A
 ==
X-ME-Sender: <xms:5PuxX7NLxY2bO5Ludd_9Kuk7vewcBpTfVzaVfZaCEVJcghRpGy2Bvw>
 <xme:5PuxX18p_umOmFLUd4xmGgmGbb_wQGJ6IefvGhGBEyBrytVF1VHvj25pndhg-jOTE
 mDTg4sYIu-SKDyAnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeftddgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:5PuxX6RPV3da2DaxK6dTxnAleiTNZT9uD-U-RKtBU8_GA7rUSXO9Cw>
 <xmx:5PuxX_uszSmPZ9kfaDT_CNrg2ix3ocRUKzEFQlOZ1V5H13y42sjyVQ>
 <xmx:5PuxXzfto_O1lTEAmZcfwzgsdZEcyjQV_akUlOYAaFROgAJXSv8W6A>
 <xmx:5PuxX_6mbxYjCj7nWq8ZFoSgkCSQWBW90Gn2xkrUlPnNgzH8Ffq6dQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 18129E00A6; Sun, 15 Nov 2020 23:11:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-570-gba0a262-fm-20201106.001-gba0a2623
Mime-Version: 1.0
Message-Id: <07558590-438a-4347-820e-c117b19dac20@www.fastmail.com>
In-Reply-To: <20201113100850.GA168908@mwanda>
References: <20201113100850.GA168908@mwanda>
Date: Mon, 16 Nov 2020 14:40:55 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Dan Carpenter" <dan.carpenter@oracle.com>, "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH]_soc:_aspeed:_Fix_a_reference_leak_in_aspeed=5Fsoci?=
 =?UTF-8?Q?nfo=5Finit()?=
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
Cc: Tom Rix <trix@redhat.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 13 Nov 2020, at 20:38, Dan Carpenter wrote:
> This needs to call of_node_put(np) before returning if of_iomap() fails.
> 
> Fixes: e0218dca5787 ("soc: aspeed: Add soc info driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
