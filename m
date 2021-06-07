Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2820639EA71
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Jun 2021 01:52:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzVXv4TX1z2yyQ
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Jun 2021 09:52:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=pUjets1H;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=gWBvIsFy;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=pUjets1H; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=gWBvIsFy; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzVXp74ctz2yhd
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Jun 2021 09:52:26 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 541F9580367;
 Mon,  7 Jun 2021 19:52:24 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Mon, 07 Jun 2021 19:52:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=Io+5A3KYyFWZtuyNO5Wohgf1Bbj7cm2
 Abaeore9IIG8=; b=pUjets1HcJ55Z0xQOES1O/7rhClrWHvPpB3qFiqhDnL3ZzA
 T43ECWICdquwdwfFQW6gzHelWTh6g4UNbfhlDd51aarVAEnQkttG6qfxqx8fkmlN
 T145+Ul3GF4Ncu+QRLoGiV1Y2Ad+VODe2QRQPMrKrwqfLC0FdYZIJuYpEdRqnTdL
 7436Lk9tA6aevC9MtOoRKHl9ikOLZPrE2sZQPPd+7EiEqT8Zf3INNrqp1+LlMY1G
 XIYRhUVN6yC0CFkePJtwdqmsj6uft6FYXG7IOVjzJde+GoUzOsT9T7vxwsbBpDj5
 R7zAuHe3TaUveSm2FhvWpO2f9gu6/140BWdfX/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Io+5A3
 KYyFWZtuyNO5Wohgf1Bbj7cm2Abaeore9IIG8=; b=gWBvIsFyn+1bxsUkDUEHIp
 2WwT66eB9zEhiAorPkK0Oo5D03E9XJwNkgeFYYmqbhKAxRYGOH8ceE311IGen7ZD
 0uoXzb4l2FU1dVbLeUI3bd0rcfv56VLnj/5aDSkZ2k9e+6jSDHfgfFHgvyU5+urh
 oFfe0tgyxItSDFdYsf76FV5ECflS26vDSnxMhq6z8GNDa+6j4/Jhyn9A9b8d59fy
 1rsVpjWCvJE8nINZjfQJIWRKr+X6sIxTli9qfjfrXrttz91GoSKgcbpYJsTdmAKC
 k0yEFeug7kLmlKceoMA7aM4KXZaNByh1qKSzA1fn+c884iWNi/drK/KG1zCY2qKw
 ==
X-ME-Sender: <xms:NrG-YKVTLlfXYr8o09vMXzGlqfsKWScwo3aWg6osmNkKfgV8UtnPeQ>
 <xme:NrG-YGn38Tf4E8wt9010-Y41tQJWbtF6gtmhpfSfoJhArNuW_-MFv8d9N6eYC4kS_
 UVGzQ_gpcNbDYcf_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtkedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:NrG-YOYFe1DaslDg2hYLzEnkFZuHQ4BB0zHD-4OmJt7U3xmcXQFjdA>
 <xmx:NrG-YBWTmfR9XSvk9mmJqwo1AWwTqZOq-NonRLcVAXLNLFZUaeJj-A>
 <xmx:NrG-YElCKCl8quTENqBdVmIl4OlBk-QBmyQMf9yEdYVEm0_Y-7M6uQ>
 <xmx:OLG-YNf4N73cBZ2CtvjY2LOVLf3ruiUve8bwiK7xU1DFkYULBFpetA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 38640AC0062; Mon,  7 Jun 2021 19:52:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <84a19429-a4ee-48d1-be5e-c20069277d42@www.fastmail.com>
In-Reply-To: <20210607071514.11727-8-steven_lee@aspeedtech.com>
References: <20210607071514.11727-1-steven_lee@aspeedtech.com>
 <20210607071514.11727-8-steven_lee@aspeedtech.com>
Date: Tue, 08 Jun 2021 09:22:02 +0930
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
Subject: =?UTF-8?Q?Re:_[PATCH_v4_7/7]_gpio:_gpio-aspeed-sgpio:_Use_generic_device?=
 =?UTF-8?Q?_property_APIs?=
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



On Mon, 7 Jun 2021, at 16:45, Steven Lee wrote:
> Replace all of_property_read_u32() with device_property_read_u32().
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
