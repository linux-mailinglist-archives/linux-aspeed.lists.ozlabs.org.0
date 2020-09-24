Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2434D276A76
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Sep 2020 09:17:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxmZV26sszDqjX
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Sep 2020 17:17:06 +1000 (AEST)
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
 header.s=fm3 header.b=Lz2CZiRW; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=ek16syZq; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxlw76wg4zDqgd
 for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Sep 2020 16:47:18 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 784AC5C010E;
 Thu, 24 Sep 2020 02:47:06 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 24 Sep 2020 02:47:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=rJ5TWhXsKR3LmVAixhr5K4x2OrsQCYZ
 KGBIccrKZL3o=; b=Lz2CZiRWbjQyPEbKkioXN5mPBHiFrcsRIjDB1v8P/jWaLtF
 JOLaeoxayzjrZmA+ypKcrErWysdVhLpGaw7Q/w2GX3X2a/lCOkDgixARANtPYU40
 aGVxBaja3TyCngJYYJP6ayeiQQ2uliQb5LsxlLIDR7Vqyj1HyfCGGeMpArGJYG+F
 YPPSv66bxhAs/zaIGzLXoGXXF9RsSqkEmJJicsUEUwmQ9d9UNH3sprnFkSES1JHh
 yebca7Kz42nfegWyIrSITvYbryb3OaJ1Voh1VQWlsx6K6M880pVePgMaBfpeYyQL
 OFiKzI7xzetR9AgPyz1/aIWhyOY7h/HgD/bk6nA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=rJ5TWh
 XsKR3LmVAixhr5K4x2OrsQCYZKGBIccrKZL3o=; b=ek16syZqmpA2GK7ZM1IqkW
 Ftp7qmTPcejxAW7WF5+uT8DVsNE5C7U2gya+i+b1mtoVPwwQRgW2xJKMF9FfbzVb
 P8weMoeKgBYnnL6wPcP68we0x5KjgfjkaLteuao9IlQskQLnDimIR3TXrIVPMRfY
 AFm7a6Dj5MKZgQEYhTSHliqlckEJcStP7loBil6N8Qt5JHPujJRcYZK9VCP2AS7R
 uYRUZidhRppUI3QBRG8rAaqiKVAEa9flU8Q3riomTUskvPmIwfoV+IFXfwBnb52s
 AJSlXNFhwKyRLYF4d4odTBjqDXf6JgmOep3slDg/WGrk9PCc7CkU2n5C0aeVCuDg
 ==
X-ME-Sender: <xms:6UBsX4zOOI_friN6uoCVAXuiJiml-WfiOv55zq7Srtc6nmlQ6wfNqg>
 <xme:6UBsX8TVxx3XJpoZmy3Lsrv838_CctE13Ngq3lPxHk2DyZDL2JlkGLPaKmCvp2RMT
 tYsBPxOA5r3V9pQhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:6UBsX6V0NDgRES9KnCy4j6F5WTNix4Xj-gAgdrDbkW9NhlqHl6ysNw>
 <xmx:6UBsX2hUIfLpMvZw2z0cJC5gNReo9hWItQuZAsHzoiLSUVeICoT3oQ>
 <xmx:6UBsX6AkKkYsB-KmItuljpw_YQXRfbBqu1gXD6WLlHu7oQIVO-vesg>
 <xmx:6kBsX76EF9CWG5evJmUGUYmKKpZqL9EFQq22BdhBw8Nh_4S4wum5rQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id ADC04E010F; Thu, 24 Sep 2020 02:47:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-355-g3ece53b-fm-20200922.004-g3ece53b9
Mime-Version: 1.0
Message-Id: <54735c6a-f9bb-4296-8ce5-219d26e6199c@www.fastmail.com>
In-Reply-To: <20200921091644.133107-2-joel@jms.id.au>
References: <20200921091644.133107-1-joel@jms.id.au>
 <20200921091644.133107-2-joel@jms.id.au>
Date: Thu, 24 Sep 2020 16:16:45 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Rob Herring" <robh+dt@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: aspeed: Add silicon id node to SCU
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
> Different ASPEED families have various unique hardware silicon
> identifiers within the SoC.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
