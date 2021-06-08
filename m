Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E42F83A07F9
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Jun 2021 01:44:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G06Jd0WYvz305r
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Jun 2021 09:44:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=piGJdYue;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=X5rnHYM2;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=piGJdYue; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=X5rnHYM2; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G06JT2WcRz2yxB
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Jun 2021 09:43:52 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 1336A1FBF;
 Tue,  8 Jun 2021 19:43:48 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Tue, 08 Jun 2021 19:43:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=13jS4hTvwyWtxHJi1YAsp/J0CrlA/wW
 pPja/ie/jIwM=; b=piGJdYue3+OT/oqw/7ZK4yde2WIhXwhHnP/RSthnyf/yLnT
 g/iTzFH1IrIWztwJzOUqKmGEo7U95gmEVAOcWqCN/LQSyyBDjnfi6sZT7HLz+n6U
 RMFBVmalXV/N5Lq0ccd7fCTRRCQuU7dx+q/l0qphawJI1PwSZH97L17sgmP3qUL+
 Q+1Km+ynlpA6N0Lf8fvCmra7RxS+ypKlqUF5bwYUiZ5EDA0haWTkh2D/4paoDWxE
 5hIOT5gx8V5892MRI8w73AsfuJ6ThRs3f2uK4xfRGeXRu9Wn+3eig/Ta1pI9Wgf8
 pvqPiqa5tUeeXJQhvvAqIB0GpbhYNopWd3bzQfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=13jS4h
 TvwyWtxHJi1YAsp/J0CrlA/wWpPja/ie/jIwM=; b=X5rnHYM2AVWSflm06hW8us
 tPQtFy/twCbKAdh6d3o0t20QJuL3Nc4S9mUEkSPpu4lBOVeKWtnpvrXO+HZasyuU
 CE29bwT/jbjOsae5uuxvGUjaYzA2IAXaKlAJVZEg0HCgVWhOydxC7PAORg8azOAZ
 QhLAIFi5X/FsIUQ4W4Jd9q4CMqWA2MAhj9A/q4IXW4RWbkjDebdGP8LDVU9ZS50/
 whpAkwLZrEXN+9snafw/WLVzUTej8GSbhBhNHlrpm+owDpFa/MXvwX/OBpSuutx8
 GsxXGqQGm7FC0j9hEOV8xe1t77cxyZviD0A8KYnI1m3TnymTEwj7UXdP5Iefn31g
 ==
X-ME-Sender: <xms:swDAYCRSxtQfX_NAyF4jbJpNhAY9lfjUyYNUAbxcCJfQXr9itcImsg>
 <xme:swDAYHxtY_95DAwe6wWcOutGftntLw_60ha7yjR6pgzjv0yjAArv9TFpI9yh1Y28b
 NboYxxgcA9VVaNn-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedutddgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:swDAYP1dY39e9wi-h1Eid7XMuxpXcXuHIMbuDtRjYgjIvqVIQChXyA>
 <xmx:swDAYOC-39PkAB5UAOL3UY68H3cWlMRk1jfR9dvma7u7EQ-8OUIWoA>
 <xmx:swDAYLhJha6dtRCCTnvg91jNf-hD4F4B6jbkxmIfrXO9vkdEe89o1Q>
 <xmx:swDAYDbGGxndEl8-iEPIEvko8UA8Gz3DT4Giw8EZu9S5lLo6eA6ZSA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0B94CAC0062; Tue,  8 Jun 2021 19:43:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <88e0e13a-1497-49b9-8518-f3f94a92ba71@www.fastmail.com>
In-Reply-To: <20210608220247.2237139-1-sudeep.holla@arm.com>
References: <20210608220247.2237139-1-sudeep.holla@arm.com>
Date: Wed, 09 Jun 2021 09:13:26 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Sudeep Holla" <sudeep.holla@arm.com>, linux-aspeed@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH]_ARM:_dts:_aspeed:_Drop_wrong_and_inconsistent_"sdh?=
 =?UTF-8?Q?ci"_compatible?=
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
Cc: Rob Herring <robh+dt@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Wed, 9 Jun 2021, at 07:32, Sudeep Holla wrote:
> As per mmc/aspeed,sdhci.yaml, "sdhci" is not a valid compatible. In fact,
> it is not documented at all(including old txt bindings). Also it is
> pretty inconsistent within the same dtsi. Once instance of controller
> refers to it while the other doesn't.
> 
> Fix it by dropping the wrong "sdhci" compatible.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

No idea what happened there. Thanks for the cleanup.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
