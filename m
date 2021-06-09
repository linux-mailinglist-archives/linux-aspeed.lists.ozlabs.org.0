Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3001D3A088C
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Jun 2021 02:45:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G07gY4lmkz305v
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Jun 2021 10:45:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=XCXV6r+9;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=huFl0Z5c;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=XCXV6r+9; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=huFl0Z5c; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G07gV1VXqz2xYt
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Jun 2021 10:45:26 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id F0C8C58080A;
 Tue,  8 Jun 2021 20:45:22 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Tue, 08 Jun 2021 20:45:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=KfiDffVkxnvv11SVkb8pJKMihOr1O/9
 5B4gsVfnBBxA=; b=XCXV6r+9f1y3gqQ87+s0KLkMLNLuo4LfKIribKkQy6QjBj6
 uHAmQcegdDoEPYut3wrfVTWHYhW6OwVA6wvehmkLUgTroz3kV3eiWnK2/QnLayxT
 uGEnslC379SjxKLvCXf/Nhrjcc3mPRAhX0jmTvpSIWduvXgnRgIyFTAfgzm5j9ZM
 tgkVnrOKHD42koAi7pLR+NpZwXi7mftcYT/jHvck/bU08ZcjopCG+Lskpz0hwyNZ
 czASmqeHel4TI7a0yKZC73IFJPg5OjeSz5dSR1EGIUFcmalp3R5/1pxBEBp2ymev
 CSsOZ2Evd5kyBz6kiVMlJ0ScjY6fAdv1pCuUgZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KfiDff
 Vkxnvv11SVkb8pJKMihOr1O/95B4gsVfnBBxA=; b=huFl0Z5c4zKitSf4xVD/ZQ
 5ZMdZErE1FyvSRmezEmu792rY/XURKTVeKQ0eb/hWys87X35prIIsP9bj/SEO8B0
 gPJCs3Is2N6vKxXvIZ4i9tfZwZeMOHq5+FCRvUhPCsEwCZfpvamRBdZtkdB3rjbt
 btQHgd3TADHEdgsLVS6Q3LP2U2TioZECZMdIbDmQnGpaNvBubm3Iq9ST4gtsnv0S
 sYHcN9eqBUA5eXv2TuOC8/OdSxwM+iKoDnphEnNLoHw7jM3Qt5wi/mY1TYfBuDsk
 oaL/8nE3NSm8WR4VsKiXgjwgA34/d8zeT8o+50ZI0ssb2oHGRLUfEr/Lm972OClA
 ==
X-ME-Sender: <xms:IQ_AYIXAZvDBUbgZqGYVF_W0APL5ilIgQG-YssoaIdJBrHUETJy9ug>
 <xme:IQ_AYMmSScUXjhHo5FEqDZ04zbSVAewkpftSyd0Rwg_D9BQUXwICUKIwnpinO5tYt
 aHYj1wLcL_w1oMYfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedutddgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:IQ_AYMZt4LCO-cY6rLYvQrm59Dw56uQOywsz1_CaHD65cTDUFCC-8A>
 <xmx:IQ_AYHUNmh34-Hesxq4yrSglXNGXPhDTsbD98RcuRX27NiQ6w0fYkw>
 <xmx:IQ_AYCmdzhzBQcoYiPwiY9SiDlQcL79wHn83FMqO2R7jCm5F0DuXLw>
 <xmx:Ig_AYLfLqhSsKoW1n1G_ChvrT7xjg1m5UkUMBS5BP4ffkdtmPdI6cA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CBD3DAC0062; Tue,  8 Jun 2021 20:45:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <fb3ea3b6-8af1-4ad8-880d-acc296ad8160@www.fastmail.com>
In-Reply-To: <20210608102547.4880-5-steven_lee@aspeedtech.com>
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
 <20210608102547.4880-5-steven_lee@aspeedtech.com>
Date: Wed, 09 Jun 2021 10:15:01 +0930
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
Subject: =?UTF-8?Q?Re:_[PATCH_v5_04/10]_ARM:_dts:_aspeed-g5:_Remove_ngpios_from_s?=
 =?UTF-8?Q?gpio_node.?=
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



On Tue, 8 Jun 2021, at 19:55, Steven Lee wrote:
> Remove ngpios property from sgpio node as it should be defined in the
> platform dts.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

I guess someone will make some noise if this breaks them.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
