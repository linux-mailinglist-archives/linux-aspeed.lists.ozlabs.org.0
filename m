Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C263A08D1
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Jun 2021 02:56:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G07wQ34dlz305v
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Jun 2021 10:56:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=TCl987RP;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LpY8IeH5;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=TCl987RP; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=LpY8IeH5; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G07wL75FXz2yxX
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Jun 2021 10:56:34 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 032DA580922;
 Tue,  8 Jun 2021 20:56:32 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Tue, 08 Jun 2021 20:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=UEXUkaEiFQLjUvGmFiXJYNKYLn4GSKf
 Tv6e4CZYJsGQ=; b=TCl987RPTWC88e5PPQSgE+1qbePmZ/8iS6PC3qlnAMVXwGb
 ypLi0vQyfxhS4QW0Ya9NpzGB1C/UQ6JjgJCvfYnl0S157z+nPod0VRiYfF5ioeV9
 n/FtqPmGqrlSwR/14hPpX86Ji2iCOt5Q7GvlsMW179xr4sPCfMjnTinvvdh4HY08
 RClDdQck+TLWsNgYMcoPZFHJaamZBUVcuzjNV1FiftvY32vgmoMb5Tg+MBHY0M6q
 ldJD3VCm7r0M7jeypdo4ZeuMb7614S/NHVrS216JTPj3Dh3V0xlW4CxAthe2pQuQ
 U+1T4JTCfHfhyPXdoTCLYimwGvseovIAUfk/JVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=UEXUka
 EiFQLjUvGmFiXJYNKYLn4GSKfTv6e4CZYJsGQ=; b=LpY8IeH51vX0Ts4LZ5c7h0
 TU2+6aHMRaxlx2pzZ2fIOivdgUbyPGcdO9SXrrEybJuL024+LKteiMrBUL4lhlzo
 F+FOoQIkFeluyxqhVnau2Nv9TAeJv/eZ9YFi68DZnxZ1nl986EFaD1JpUvufSkAc
 MBNxo6CpPPSO8Tt1tIjVodi4jye2WM1ZYKEc5ALQ6lvMvjxMfNxZiAk9auqquAfz
 JNEEDdR7k8MZ8XUR0KoZ06ZfTwtO806w24Bee8ee1GDoWffNzP3RRfdj332EakGC
 vZOFVBfPcRGJkwlQhfEeHtTtRwy+RTwRBIMao0f9do1+4WfiUeerNid9BTCDYkHQ
 ==
X-ME-Sender: <xms:vxHAYFhxctgAA3C4xcXS4ppQsJcn4-jv1El4ucwQfLjhFWlD2Zq66g>
 <xme:vxHAYKBupQ_RU5g-KVQm4FKlBUWivq8vPR7pQyVOsm4gtj6laIt3F0HAMRelhH2VA
 Cf_xVvxMmkyAP7EAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedutddgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:vxHAYFEytP3CrsE9oyllP_AFL-UakUpXq0Y808ZD7b8Gshzx9zeCKg>
 <xmx:vxHAYKSefdA0tah_-C2awatNP-9wfRJmtcWYAL1EsLTxI6Iys-0y4g>
 <xmx:vxHAYCyod1UvLXhPm-9alWmlAEcO_IXxRs8gfGffvXMJTJ5tY3ZQ6Q>
 <xmx:wBHAYHqdCOfNkdNosTpvUcQqEvibNwtSvfxmQESAUPaLLsvXieGWPg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D6CB9AC0062; Tue,  8 Jun 2021 20:56:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <311d0c03-06f3-4c68-aa5a-877a592b6975@www.fastmail.com>
In-Reply-To: <20210608102547.4880-11-steven_lee@aspeedtech.com>
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
 <20210608102547.4880-11-steven_lee@aspeedtech.com>
Date: Wed, 09 Jun 2021 10:26:11 +0930
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
Subject: =?UTF-8?Q?Re:_[PATCH_v5_10/10]_gpio:_gpio-aspeed-sgpio:_Return_error_if_?=
 =?UTF-8?Q?ngpios_is_not_multiple_of_8.?=
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
> Add an else-if condition in the probe function to check whether ngpios is
> multiple of 8.
> Per AST datasheet, numbers of available serial GPIO pins in Serial GPIO
> Configuration Register must be n bytes. For instance, if n = 1, it means
> AST SoC supports 8 GPIO pins.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
