Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0671B392451
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 May 2021 03:28:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fr9FC0sjfz2yhd
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 May 2021 11:28:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=ShbfusHb;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=O57hhZ27;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=ShbfusHb; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=O57hhZ27; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fr9F76vBHz2xv1
 for <linux-aspeed@lists.ozlabs.org>; Thu, 27 May 2021 11:28:27 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id CC55C5805E5;
 Wed, 26 May 2021 21:28:25 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 26 May 2021 21:28:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=QugCToE2oD/Akw5181hdEz10jkbZriJ
 +fq6eWbXxrco=; b=ShbfusHb2jQRdrZ4WtIJPdk34pieGO5nJI88/AnOM1NrEXH
 mxxVr739gJoOcnpgcIfvGpavhJ/rzH5ynFWmziD7Sdd9QEM60CPQUyjthUscd+Ao
 g5WJHjn6UVVrks0qs9h75p03IhEKNRhQBJ0zw8tRsbazhaNPG1ZwSVefr7WRPzAW
 ZkcOtX4oAIa/YJEm+VlRkaMtu12mZ+XDUXgUeUdzMWVp8Qudidqs96dHp7wbqfEG
 +mg7nDDE6CUP16N1GN9fjteKN0LKbEF1UM55izrJ0MWAOFDmMza5gjQm7BPkaOIz
 7WxeK756xHVS3X9Z4A4UYzMXy+gvOiahEztNz0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=QugCTo
 E2oD/Akw5181hdEz10jkbZriJ+fq6eWbXxrco=; b=O57hhZ27gBq5/8Pf+kfZwf
 jyReChV75Usqb3IXGA4x7xP0PjN8Pam0CeyWMpwQpfx4VVh3ImlSE8SscUfxL0lJ
 y3lhjSqS4O8Pk1m3zOZfvACCp7teGQzQcFl6QvRGaV5TVoMO2oXJnh20dhuRG8WZ
 71DlFvD5NyQm/KtqrB1FA/MRnFFEcOYxzi5aOcGy2Wot8fWYBaMcgRL01usYPPEP
 H7fBf+LKAZD71mnTOogNJ/1J3B4qWkBgQnRzLX46S55WOj/AnWI6S1lYhUqCl6YD
 g1GkfnW5JmVq5e01VQLU8nXHQJrgdcliH852k2RN4gRrW4MvGiF1qwFIBliHJrSQ
 ==
X-ME-Sender: <xms:uPWuYNHXi0w5BmP6bqSOUeJdgJmJfG3ad_39EYd0YiWrCU96h1ux1w>
 <xme:uPWuYCXGErZGIn27dshwhB1wPARFBNMq0Ap4Xd3WMbm7WIkrnh05SkxUq9eP5FhV9
 Hl_iQP0o8DQqLpB1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekgedggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:uPWuYPLzfxsxLkof8NqAH2S60FJeAH8qnHWK6hzsG2oRqy7krdAPcQ>
 <xmx:uPWuYDG2oa7wYPYiL8emwsggs7nfOWUwmkWVlLMi6GU2nWUNceeoJw>
 <xmx:uPWuYDVd-lNbSJ6WxC63lZTbrktc-ZAuUMmPmx4gA7UXj3cL7F4rdA>
 <xmx:ufWuYMOmtvPVzk96d2q2vndB3wP1QUwRzovt1Xqq4u3qaf-6ohPurQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7D234A00079; Wed, 26 May 2021 21:28:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-468-gdb53729b73-fm-20210517.001-gdb53729b
Mime-Version: 1.0
Message-Id: <69b31043-957c-40af-9ab9-6bcc63ccdc85@www.fastmail.com>
In-Reply-To: <20210526094609.14068-3-steven_lee@aspeedtech.com>
References: <20210526094609.14068-1-steven_lee@aspeedtech.com>
 <20210526094609.14068-3-steven_lee@aspeedtech.com>
Date: Thu, 27 May 2021 10:57:43 +0930
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
Subject: Re: [PATCH v1 2/4] ARM: dts: aspeed-g6: Add SGPIO node.
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
> AST2600 supports 2 SGPIO master interfaces one with 128 pins another one
> with 80 pins.

Is there any chance the serial GPIO controllers can be explicitly 
listed in the Memory Space Allocation Table of the datasheet? Currently 
they're covered by the entry for "GPIO Controller (Parallel GPIO)" 
which is listed as ranging from 0x1e780000-0x1e7807ff.

Admittedly the details are listed in chapter 41 for the GPIO 
Controller, but it would be handy to not have to dig.

> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index f96607b7b4e2..556ce9535c22 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -377,6 +377,38 @@
>  				#interrupt-cells = <2>;
>  			};
>  
> +			sgpiom0: sgpiom@1e780500 {
> +				#gpio-cells = <2>;
> +				gpio-controller;
> +				compatible = "aspeed,ast2600-sgpiom";
> +				reg = <0x1e780500 0x100>;
> +				interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> +				max-ngpios = <128>;

I need to think more about this one.

Andrew
