Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1B839AEB0
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Jun 2021 01:29:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fx2Cv6X8vz300T
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Jun 2021 09:29:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=twZFJbyJ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Xv4LXDx1;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=twZFJbyJ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Xv4LXDx1; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fx2Cq43fRz2yX9
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Jun 2021 09:29:11 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id EE75458094B;
 Thu,  3 Jun 2021 19:29:08 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Thu, 03 Jun 2021 19:29:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=SS47D6i5AoLtCZF7DyB9f7Neb7i88hC
 t48l4KG4kK0E=; b=twZFJbyJLreY2lNfy+IHtzRd3XvHjVAZ1I+Aeg3ydGw/t/+
 cYCFNQqD2LYZY5fjMKFDSFF4+U3nOs5bjfTO3UGw1ejVv3h8VaJHcL6M/Nl5TSvz
 25wClq4IjNonW+3OHket4nn4zAmMzQF0x0NL6Ryd9jZx7HPUz9PBApgM+U+c3txo
 477VothgPkoFmNkyM81x2NxetYsOzCmGrYEEIM1NC32sf4CiN7QmaM87M3DAbFnJ
 3kEh/vOMk+vPEqF/kuzjBImdN7rHBiGhn3AjzxvablMvXbTxtevPwNzkRg7DjFoV
 4DaJN8EZMrXDoJWyVDw4gUOpnW2JWfQFd36VeKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=SS47D6
 i5AoLtCZF7DyB9f7Neb7i88hCt48l4KG4kK0E=; b=Xv4LXDx1AlvdBsuhlk8nXw
 c4LenjKvbfYOrKA0PUbYnrn8+mPSrU3ey0GMmBeXavSuCSf5ntE/Qp6qlza+ganl
 i711JMjno9nY5lft2NUskGJGfoGLwiEUWrSWa2g4AW83u4KmomS3Q0aPPVYza4Gt
 LmiHimMAQ0mOxrDv7zALM18XRmiS9E0iby+Wj71e4p9VNld1YaESj6SXYArZgIX+
 wDu0Y6gobOv1gxBeu6FEarEpnyve6TC8eorLL/Iqhhb/aaJ7SQ74EP0XtLYM7m5b
 scRRzv3XF9QGGoN1/XTjNBN2HRifajIoMhLa3xPtkX1wk1gHPz+oNEzfazGhJ9eA
 ==
X-ME-Sender: <xms:w2W5YOVg0C7244BiyOUjaqfQWIZICqXs9osL7ldMAtXj7Xcyxddk6g>
 <xme:w2W5YKkb2VbWpKaPe869BECM_oDpEPB9Ch6NnHDb0UCO8IBKvAIbP20RyWK0EedtG
 JNuM0JkfbvanAjxrw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedttddgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:w2W5YCb1dg5rauJpS1ybtOZgq7ZNo0ySK3xcE3LPVIj8BfpkB6ARvQ>
 <xmx:w2W5YFXx0UCXVzXJCQju74_KnIqMZxB3tlBgDrXux-Or1jMjEXuUWw>
 <xmx:w2W5YInj1aSwn5GkQRP53Pm4x1Lnh9yK9SpiqWahPv_mZWiGTKpgvA>
 <xmx:xGW5YBdqkJDP525feyKgAH4_HJ9LjEKVeRRFlevv1rhJpum3qIWC4g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A4F85AC0062; Thu,  3 Jun 2021 19:29:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <c93cd6b7-229d-4f82-acc5-f85a9c66587f@www.fastmail.com>
In-Reply-To: <20210603101822.9645-6-steven_lee@aspeedtech.com>
References: <20210603101822.9645-1-steven_lee@aspeedtech.com>
 <20210603101822.9645-6-steven_lee@aspeedtech.com>
Date: Fri, 04 Jun 2021 08:58:46 +0930
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
Subject: =?UTF-8?Q?Re:_[PATCH_v3_5/5]_gpio:_gpio-aspeed-sgpio:_Move_irq=5Fchip_to?=
 =?UTF-8?Q?_aspeed-sgpio_struct?=
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



On Thu, 3 Jun 2021, at 19:48, Steven Lee wrote:
> The current design initializes irq->chip from a global irqchip struct,
> which causes multiple sgpio devices use the same irq_chip.
> The patch moves irq_chip to aspeed_sgpio struct for initializing
> irq_chip from their private gpio struct.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
