Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA98392404
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 May 2021 02:58:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fr8ZH1lrLz2yhF
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 May 2021 10:58:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=cgLtwK0K;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=sHDLbR58;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=cgLtwK0K; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=sHDLbR58; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fr8Z82Zb0z2xv6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 27 May 2021 10:58:07 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id CED4E5804D2;
 Wed, 26 May 2021 20:58:02 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 26 May 2021 20:58:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=F/qifLq8yQh1az5Zwysk7y+47oJDirR
 vH4OiyQFYYzI=; b=cgLtwK0KLSeyC9oPpsRVpMHVer4QIWQNBhSHlFjKL1JVAon
 2JMsBkN+OW5KmdXJoM/tUAOwASMZ/gGXR7+56+VeL82x+hwj5Lg2Kz9+lcqOHRN+
 MIwE9aIa7AdpBuOGSZOn9qEFt2GhfgsaDddWdAIrWwqt9N0744+vn/0Ld5x19iQn
 vEnpIJA5PB9P8bM6P79e7xHEaPKSlWE/bxyKk9s//ldLflEsEkpe1L9PG5neDbFH
 jKfj21ObIWBxMt9wj22DhJpu4U3PAt3p8tvrN/8+3RfFfrJ5yO42gY7Vkh/Oe0Lp
 vZKTraMXVXBu5vXzSiIMbATh6rSNw17kLNbu1QQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=F/qifL
 q8yQh1az5Zwysk7y+47oJDirRvH4OiyQFYYzI=; b=sHDLbR58bET2rrmFXa3/6W
 prVsteoVnlf8HTsx2daI+12gwLkDqwdkfzQpu4bvtaVYoQXPN84IoS1Asj2fcTWr
 zkebpu+rS3KhnN4a3YAoBRsIKiB7C9dW+8mhPF9eY6SBRseVsKzF6PyvG7cT6nh/
 f/08COzhrFpW2JKzcgEmpM6G1Ll5LbUHUZKvuNTkXrwuGvp5FoCsTUQ7WC16g0sn
 N9AEu34zEX8rEOXW4Xh0mmoNup9IcLr+jHN5y8DPYxF7wgMd/eAKbQKQ7UxpXwV+
 zIePipYyxlf44gdsG73JkwLBdi7ithori8nHA6ZHE4Il2irXvMQAzG4+OICPMRXA
 ==
X-ME-Sender: <xms:me6uYBqdaxrKOtBWAogw44eIXD4ayATgEQGlcYDuKd_1Kmun4fTkUQ>
 <xme:me6uYDpc5ZaISSVe7CCqGeMEFk3M-yWzeUCZOjUq0gmuSrwP87kcCRRZOJNKiGfho
 NokK6jn6ivVc4DMog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekgedgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:me6uYOO4XJkfIk61exzEPB5dAcQdKKACGacWWoAX7I0CiDbLRJ15Kw>
 <xmx:me6uYM4WvipUEbgGP5F_DWo8MZXCYcoFxE0QiWONFmHXz4K2miICyg>
 <xmx:me6uYA6OmOGhTQjTk_eV5liDSGS-Etj1FU7vkWhmF0TVBBWbFhPARQ>
 <xmx:mu6uYNy_lqeszQo3wSgC-tI6BpEkcmc40wIP1qNWCJZkmbn4nlCVLw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5994EA00079; Wed, 26 May 2021 20:58:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-468-gdb53729b73-fm-20210517.001-gdb53729b
Mime-Version: 1.0
Message-Id: <5c0670b1-269c-4aae-8639-c0866ac90dc9@www.fastmail.com>
In-Reply-To: <20210526094609.14068-2-steven_lee@aspeedtech.com>
References: <20210526094609.14068-1-steven_lee@aspeedtech.com>
 <20210526094609.14068-2-steven_lee@aspeedtech.com>
Date: Thu, 27 May 2021 10:27:37 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Steven Lee" <steven_lee@aspeedtech.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list" <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?Q?Re:_[PATCH_v1_1/4]_dt-bindings:_aspeed-sgpio:_Convert_txt_bind?=
 =?UTF-8?Q?ings_to_yaml.?=
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
Cc: Hongwei Zhang <Hongweiz@ami.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Steven,

On Wed, 26 May 2021, at 19:16, Steven Lee wrote:
> SGPIO bindings should be converted as yaml format.
> In addition to the file conversion, a new property max-ngpios is
> added in the yaml file as well.
> The new property is required by the enhanced sgpio driver for
> making the configuration of the max number of gpio pins more flexible.

Please add the new property in a separate patch to the YAML conversion. 
Having changes to the properties in addition to switching to dt schema 
makes it harder to catch errors, and it seems Rob's bot has already 
picked up some.

Reviewing the changes as separate patches means its easier to give you 
a Reviewed-by tag on that patches I'm happy with.

Andrew
