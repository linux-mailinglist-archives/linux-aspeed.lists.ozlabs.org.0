Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB7D506134
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Apr 2022 02:51:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kj4y15t9nz2yhD
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Apr 2022 10:51:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=VpVfcbED;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=BjiYQvdc;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=VpVfcbED; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=BjiYQvdc; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kj4xs11M5z2xF8
 for <linux-aspeed@lists.ozlabs.org>; Tue, 19 Apr 2022 10:51:44 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 182C63201805;
 Mon, 18 Apr 2022 20:51:38 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Mon, 18 Apr 2022 20:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1650329497; x=1650415897; bh=YTGif1yY4d
 anJ4Q3Gd9k/F0/kwwvgJN1GNs1zSfH8R8=; b=VpVfcbEDFSmB+t6AoUjHi8OKvN
 bNhUU/dOaprPoSE6NMhU1uD5j/dkMfWUDWMXp8OkmqAuy/F6aY5xnQUmGylj7o5b
 jpUeTV5oiqSobPRN6XhlxI03dDpzhMZf8RJmKoEEYPEHNkye0dMs0vFZ4pBZhUXJ
 mQuVNLklH2yNglFQveQ43g6WEpKowPeJZhkzfcS7T6GmqaB8kQnREPe+8AJdbrCk
 EalrFKT8Wzkl5Gzi94gH8muOt8A+S+BEGQ7BzEIRrPA+oxYmBOkdM+0t5gMoGWQS
 zX4F90o4xgn4W0vPArVEAMVE2Qo2Fvr8Xap2UC29eGYtTCYf0BOH1xq1HaQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650329497; x=
 1650415897; bh=YTGif1yY4danJ4Q3Gd9k/F0/kwwvgJN1GNs1zSfH8R8=; b=B
 jiYQvdcMtJv2qtGGnxv05bWLoKmqM61S7z2lUvBcjss/vHhOtSJD/5zuxb9hemWk
 AeXbSu6pGgWy9lBVen1I8nxRi//b7T+K6OBo2M7IRy4Fek3bUpq1Nyfb9HInSJYW
 oqCX3h1mptBPBg4GA2Du7Ez1UGfNfYmvxFNtu8eaX1cuGBMltqtbidO/odpFscSB
 bXBMl09aIoltT3zsy8ux3t/cJkOd1TT3Uf//ZsRBh3E8JNUPuL2Mc08wr0Sw4axN
 bugaNjd0wciJHT0yRT9fioie0BXPvySS/8IxbRb4mCgKwipfB4McMkXfCwWTKV5l
 X7Sd9riFsgadOSYvxrSYg==
X-ME-Sender: <xms:mAdeYuMIvrVmTGDzbJMp3YzbyRZJNMzDLVKVw0-VhK7BNO_wQNNO8g>
 <xme:mAdeYs_WH3Gd0jLPFBFzN0oVIRU3BzHp-oRC5DNXrQdHUfmKPrQ6wZU-qsJynDlqo
 QBsl28NvE1oYE3QWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtvddggedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:mAdeYlTIwEXjdfj0U_cQUKb1pijIKwU6Km1lDvF_R3J6gBbe39w1JA>
 <xmx:mAdeYusvZLEnJ2VACloteuhlqW0qbkUjrypjKD9EadfZBdLqh6-mFg>
 <xmx:mAdeYmdNnb1QaJeSKH675c-m6cERHjKXDdlXsx-LsvbHvqsGGPHLGg>
 <xmx:mQdeYi8tUGvmPrK9LY73NzLIzVfLPiibEefluSwp96gXaN0D-B1I3A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5B51215A0069; Mon, 18 Apr 2022 20:51:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-387-g7ea99c4045-fm-20220413.002-g7ea99c40
Mime-Version: 1.0
Message-Id: <c4d4d135-7d52-455a-9623-4c7badb46f9d@www.fastmail.com>
In-Reply-To: <20220418014059.3054-2-dylan_hung@aspeedtech.com>
References: <20220418014059.3054-1-dylan_hung@aspeedtech.com>
 <20220418014059.3054-2-dylan_hung@aspeedtech.com>
Date: Tue, 19 Apr 2022 10:21:15 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Dylan Hung" <dylan_hung@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Andrew Lunn" <andrew@lunn.ch>, "Heiner Kallweit" <hkallweit1@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>, "David Miller" <davem@davemloft.net>, 
 "Jakub Kicinski" <kuba@kernel.org>, pabeni@redhat.com,
 "Philipp Zabel" <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, netdev <netdev@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>
Subject: Re: [PATCH net-next RESEND v5 1/3] dt-bindings: net: add reset
 property for aspeed, ast2600-mdio binding
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
Cc: BMC-SW@aspeedtech.com, Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Mon, 18 Apr 2022, at 11:10, Dylan Hung wrote:
> The AST2600 MDIO bus controller has a reset control bit and must be
> deasserted before manipulating the MDIO controller. By default, the
> hardware asserts the reset so the driver only need to deassert it.
>
> Regarding to the old DT blobs which don't have reset property in them,
> the reset deassertion is usually done by the bootloader so the reset
> property is optional to work with them.
>
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
