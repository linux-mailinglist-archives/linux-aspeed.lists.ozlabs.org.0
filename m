Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE96276A78
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Sep 2020 09:17:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxmZc6YW1zDqnf
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Sep 2020 17:17:12 +1000 (AEST)
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
 header.s=fm3 header.b=lO71Dyg4; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=ceNeyj9t; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxm7L1DVRzDqnK
 for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Sep 2020 16:57:01 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D04645C00D4;
 Thu, 24 Sep 2020 02:56:58 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 24 Sep 2020 02:56:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=QRuWYPevCj4nozR25VUG34/Q1P8+l7X
 Prm/DpLYeIdw=; b=lO71Dyg45QsJFp/W6eGvhaazUxLlsRXYBmRh+Q6TWfE7OUc
 KCxRowKjYrh/bgDu3YIyp+F6BLYfiQcZgT3O2ML3YaXDhtoQjLWigqDAcHhZBed7
 fhK1XYTXRT6/7b0eI9OvP4dSRLZIvWYOHSE+3LJVy1cX/nGALfGNYkvC+akxwW5m
 1l8rJpZEtROI84lVCp7rck98xnN/OXrsK5qTeSk8GBKQCQmgF/FDcTuKYixvCJ6a
 MeHLl+h/sjj7I5XNitz2+a2XUTY7V+PThMi+2QuN1pgv9UXNTAVRFtXGeVHEgsBF
 bD/wPBr3z4Rfwbl216oi1m3XBSl0H0eKWVeB9QA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=QRuWYP
 evCj4nozR25VUG34/Q1P8+l7XPrm/DpLYeIdw=; b=ceNeyj9tHgTSbr+9yz0bIG
 1XIAa7AW5HTMTiOjOMrdyXiWOJ+eEhw4TP/4awfJJlnZus1ONVqqOPEckfzABhkH
 T7w44ZJMXSilzBKDGVgkmsYBihFDjPkHc2div7popdMpnJwhafU3aSOS3ljIj49Q
 WhwC4BxU3Mr0fxXSc3pm4SbrTCSHXCuHRu5JNg4JreIRBA/T7KCMw3ZidH31jDg4
 zbF1JihIpc1/gifmuKSi6baP6VNN0odqWdNXpPUVDb9mA1bMd4IUWowGsu0xLDwo
 JwN4oIBKiZVYx1SXvdyhWk2ImqMpkwMONSqDlFL84RC50sF6S18ymN8UPj6DZQwQ
 ==
X-ME-Sender: <xms:OUNsXyo4ZuIECT8voW94mFqnQPxnFStrgcH415ecTOWIyPm_sC6fyA>
 <xme:OUNsXwrCqbartT_g1FInZzpUF5J7FvTt8QHpxZfRfyaeHMaOvdNEX2cLHvFd4HAq-
 UhYpYJh8-1UNlAIhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgdduuddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:OUNsX3PyNM8TBzjxeRpXSjYV4wb6YpzorukHiQgYtlUpDWH4T8mtPQ>
 <xmx:OUNsXx75RUwWFZ-GI4lhs-kQI2q-E7w08tyvu9dm6hGzL5t9KfVEgQ>
 <xmx:OUNsXx7Khz-FuLZq_O1O6ajwq7Di-zXUKii33d5YoAwK3KJZJoQIhQ>
 <xmx:OkNsXzTKawlslUwdTsT6hN0io--9sLTMP4rh2D9gH5mrOI_ZJNjYPw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CD9C7E0169; Thu, 24 Sep 2020 02:56:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-355-g3ece53b-fm-20200922.004-g3ece53b9
Mime-Version: 1.0
Message-Id: <eaa6ddb0-476a-4e6e-be52-26dd6a02dba0@www.fastmail.com>
In-Reply-To: <20200921091644.133107-3-joel@jms.id.au>
References: <20200921091644.133107-1-joel@jms.id.au>
 <20200921091644.133107-3-joel@jms.id.au>
Date: Thu, 24 Sep 2020 16:26:37 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Rob Herring" <robh+dt@kernel.org>
Subject: Re: [PATCH v3 2/3] soc: aspeed: Add soc info driver
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Mon, 21 Sep 2020, at 18:46, Joel Stanley wrote:
> This adds a SOC_BUS info driver for the ASPEED platform.
> 
> The full ID table is preserved in this commit message in case someone
> finds a need to change the implemntation in the future.
> 
> 	{ "AST1100-A0", 0x00000200 },
> 	{ "AST1100-A1", 0x00000201 },
> 	{ "AST1100-A2", 0x00000202 },
> 	{ "AST1100-A3", 0x00000202 },
> 
> 	{ "AST2050-A0", 0x00000200 },
> 	{ "AST2050-A1", 0x00000201 },
> 	{ "AST2050-A2", 0x00000202 },
> 	{ "AST2050-A3", 0x00000202 },
> 
> 	{ "AST2100-A0", 0x00000300 },
> 	{ "AST2100-A1", 0x00000301 },
> 	{ "AST2100-A2", 0x00000302 },
> 	{ "AST2100-A3", 0x00000302 },
> 
> 	{ "AST2150-A0", 0x00000202 },
> 	{ "AST2150-A1", 0x00000202 },
> 
> 	{ "AST2200-A0", 0x00000102 },
> 	{ "AST2200-A1", 0x00000102 },
> 
> 	{ "AST2300-A0", 0x01000003 },
> 	{ "AST2300-A1", 0x01010303 },
> 
> 	{ "AST1300-A1", 0x01010003 },
> 	{ "AST1050-A1", 0x01010203 },
> 
> 	{ "AST2400-A0", 0x02000303 },
> 	{ "AST2400-A1", 0x02010303 },
> 	{ "AST1400-A1", 0x02010103 },
> 	{ "AST1250-A1", 0x02010303 },
> 
> 	{ "AST2500-A0", 0x04000303 },
> 	{ "AST2510-A0", 0x04000103 },
> 	{ "AST2520-A0", 0x04000203 },
> 	{ "AST2530-A0", 0x04000403 },
> 	{ "AST2500-A1", 0x04010303 },
> 	{ "AST2510-A1", 0x04010103 },
> 	{ "AST2520-A1", 0x04010203 },
> 	{ "AST2530-A1", 0x04010403 },
> 	{ "AST2500-A2", 0x04030303 },
> 	{ "AST2510-A2", 0x04030103 },
> 	{ "AST2520-A2", 0x04030203 },
> 	{ "AST2530-A2", 0x04030403 },
> 
> 	{ "AST2600-A0", 0x05000303 },
> 	{ "AST2600-A1", 0x05010303 },
> 	{ "AST2600-A2", 0x05020303 },
> 	{ "AST2620-A1", 0x05010203 },
> 	{ "AST2620-A2", 0x05020203 },
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

I didn't rigorously check the list above, but it looks reasonable at a glance. 
The code looks good to me this time, so:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
