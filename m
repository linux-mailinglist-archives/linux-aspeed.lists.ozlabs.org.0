Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B76441212
	for <lists+linux-aspeed@lfdr.de>; Mon,  1 Nov 2021 03:07:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HjGdZ46jJz2yX8
	for <lists+linux-aspeed@lfdr.de>; Mon,  1 Nov 2021 13:07:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=Y9IbCLdR;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=mKTIx7Ol;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=Y9IbCLdR; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=mKTIx7Ol; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HjGdP3FMvz2xYJ
 for <linux-aspeed@lists.ozlabs.org>; Mon,  1 Nov 2021 13:07:36 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4A4EF58088F;
 Sun, 31 Oct 2021 22:07:33 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Sun, 31 Oct 2021 22:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=2Pa73OCvVZ6FCpJAmxpXhiTTNaL3ZPO
 i42kibXrMVvU=; b=Y9IbCLdROcwxWh1jDIoWKOIyGdzPYLLFSM8DiXhlY5C5i+M
 nOyktCddU5Ej8L2A/jJn37BDVcS1LMmiZffFrtLS6cOFIIQbZjZzWL/80ZhS++4T
 3Q14H2K9062jHz4Z0FkHseHNMup9iNYPf1n5AjotDwNBSu618pxcr7QWHfrv7XAq
 H7K/S0XrsWtiQ+982qdYcqHsXpgdd5Bw684eFz1nkGoivX/zGdHz00LeYFVUMamb
 GHgHIIENIzKW802c6FVx1eLW55nGtJZWtVHK1VhMf9AOpA2IJlqp/j7GJ5CPftDt
 k2V4TLFVXeQLJget719SHfSCEAN/Glg6aTYs5TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=2Pa73O
 CvVZ6FCpJAmxpXhiTTNaL3ZPOi42kibXrMVvU=; b=mKTIx7Ol1+aVcifYxXZ+x2
 HD+uOVKdjBkLLMTitUMMJ4xYu1ygA1N9IISW+MLLc7AVxLF8FxqK3/neNdQqrnfj
 vqWC5gLZYq87VZOUDZc2TqmH7uT6Rmo25uy1JkfmwHGcnq+AWFHQwGjxMitgJF4R
 uSfsr1DhHnbzKchkrsT5Pn6D3AocvA8ns6yj3rygn9Ug74dF+NqA3teenKvF72aJ
 GgyXpYC0ho5+zaVfiPqKmX07CK/6yaaN83Bz7HPq50etyy5n3BXZWoSkbBs0okFP
 oCLpyyLCgZt7/Jaq6eFZFpIGWtwn8jQlLvzEgDbNSqcqnJHzgRbb1jmDZrMMaSWA
 ==
X-ME-Sender: <xms:5Et_YdPm6QH7dx4vDb35FH-wCwJgzZzm12PvOBwB138nF35fYTK7sg>
 <xme:5Et_Yf_1cgLDUC0cTNh7jop3rslHPh1hiMpVBl1X-wxyI_4iUYtW4Qd3pQbAYDEgC
 FjKQOSlfKsEgANA6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdehuddggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:5Et_YcQvajSpH6r7M6_zHZpXIhPJdbXwTNu6F0StI1ndz_tT5CAZ_A>
 <xmx:5Et_YZvas_3AhWKqW939XzQBkWIh_j5XIPL0xJdc1pQzoQKh8EiVFQ>
 <xmx:5Et_YVcaI8ndX8KHSAm5EhODaHTLHaAvtxRYBSk85qAEJKNAmD-Qgg>
 <xmx:5Ut_YR7YsB3Qz0epng1dL9bcEaIeXz2nfq9Dr5LGDxTJ3OPcSFleYQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id EC830AC0DD1; Sun, 31 Oct 2021 22:07:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
Message-Id: <ea912be8-ad2d-4332-97b4-5626b19eac5f@www.fastmail.com>
In-Reply-To: <20210921043936.468001-2-andrew@aj.id.au>
References: <20210921043936.468001-1-andrew@aj.id.au>
 <20210921043936.468001-2-andrew@aj.id.au>
Date: Mon, 01 Nov 2021 12:37:11 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] leds: pca955x: Make the gpiochip always expose all
 pins
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Pavel Machek <pavel@ucw.cz>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 21 Sep 2021, at 14:09, Andrew Jeffery wrote:
> The devicetree binding allows specifying which pins are GPIO vs LED.
> Limiting the instantiated gpiochip to just these pins as the driver
> currently does requires an arbitrary mapping between pins and GPIOs, but
> such a mapping is not implemented by the driver. As a result,
> specifying GPIOs in such a way that they don't map 1-to-1 to pin indexes
> does not function as expected.
>
> Establishing such a mapping is more complex than not and even if we did,
> doing so leads to a slightly hairy userspace experience as the behaviour
> of the PCA955x gpiochip would depend on how the pins are assigned in the
> devicetree. Instead, always expose all pins via the gpiochip to provide
> a stable interface and track which pins are in use.
>
> Specifying a pin as `type = <PCA955X_TYPE_GPIO>;` in the devicetree
> becomes a no-op.
>
> I've assessed the impact of this change by looking through all of the
> affected devicetrees as of the tag leds-5.15-rc1:
>
> ```
> $ git grep -l 'pca955[0123]' $(find . -name dts -type d)
> arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts
> arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> ```
>
> These are all IBM-associated platforms. I've analysed both the
> devicetrees and schematics where necessary to determine whether any
> systems hit the hazard of the current broken behaviour. For the most
> part, the systems specify the pins as either all LEDs or all GPIOs, or
> at least do so in a way such that the broken behaviour isn't exposed.
>
> The main counter-point to this observation is the Everest system whose
> devicetree describes a large number of PCA955x devices and in some cases
> has pin assignments that hit the hazard. However, there does not seem to
> be any use of the affected GPIOs in the userspace associated with
> Everest.
>
> Regardless, any use of the hazardous GPIOs in Everest is already broken,
> so let's fix the interface and then fix any already broken userspace
> with it.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Hello LED maintainers,

Just checking in on the state of this as it hasn't appeared in for-next.

Andrew
