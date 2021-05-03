Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DDA37112A
	for <lists+linux-aspeed@lfdr.de>; Mon,  3 May 2021 07:08:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYWFv2RgMz2yxR
	for <lists+linux-aspeed@lfdr.de>; Mon,  3 May 2021 15:08:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=RnbzLX1S;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MjRnYEdN;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=RnbzLX1S; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=MjRnYEdN; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYWFn1CPvz2xZF
 for <linux-aspeed@lists.ozlabs.org>; Mon,  3 May 2021 15:08:12 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 274F15C018B;
 Mon,  3 May 2021 01:08:10 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 03 May 2021 01:08:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=eKcsIACmrK4wAg4OAkYo77TNYonA7V1
 j6yg8h3K+bwg=; b=RnbzLX1SFivCa36c8XPklHIzndeRpbPVxkEvtI5OuB1y3Mj
 1ogruIaQchXUWnjuqqMqYCr6WOO1+K3bGxZyvOzmbNIieDfhZtkG66DD8W7iVF36
 LczfsuP1yXGB5OTk37Ip2HjSzl7HdK6Cvk6R3/L02uM6+tFOdgfsn9Mcy24hYCyu
 4sOgACozIYjWDMR6eH1dsT8hcfei9SK0Ocbv+dHMBFgwqS9FKwcOIdZnyY11wUfd
 nYnFDZHX/cn182W7FaibvBQOWdqq/M4rY16glNl1KGsAKjaJxSVgNzbq5zp2CCCX
 e08Zc2rlBAAchzPgeIbE3C4M8mf1E9n2H4vw0vA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=eKcsIA
 CmrK4wAg4OAkYo77TNYonA7V1j6yg8h3K+bwg=; b=MjRnYEdNFY0f5JJgv8Sj0E
 77nXxGpl+L3XH1u4msaoMmRVL/DX/CL5q6n8ALdEDdobzPOVGm1fBnFOOvG9ajtO
 iYh8oYsWHtH7QiMbjQ/E/KiHNLXMMhZYPoodoEAHZZyfhcpTcuuwEBIvsgb+uMkO
 j2CF8F0eteoGJEsYWLC6CH7D4lI0+T4vyDi7zwGjlaXFfS4RjslzFdNGFNeUBazq
 lU3ZOQ8avKZHZqZtcDlwJfkqdb9zcEFaCr5/YvcqDxugwo6k3EKQSThThuMysQsL
 rv7v6T5HCrf9iDhnRE6WnszQMvlK5TXihXe8Xi0Gjg2TC0kr9wAI4h8z090+h1JQ
 ==
X-ME-Sender: <xms:OIWPYIheEL-K2-8n6PujesqIqSPQYY2vByDrI5x_DIykwLTQBSlMEQ>
 <xme:OIWPYBCMPGwpP6TYj4YSCxP8t8riNA7j6wPEu83UUJ46xCxzKwr_XR9Kb1z7vg8oP
 iOgBpw5sUUWPBPaAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeffedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:OIWPYAFbvnHlNC--BcDHp0tY2yVFgKarY0vnqZtzwtdpC8Qr1k6lmQ>
 <xmx:OIWPYJQRn3uauxFoFfS62utu_Sm6HXRQCGBLLbG2bmGLzEBuIYjzeg>
 <xmx:OIWPYFw4OVXW0I3AAaxMreP-ODDVihFqVdaRVX8wcKePfQMTgYodjQ>
 <xmx:OoWPYEw6IV5kb6uGK6-OQccqtf-14si--YGTedFmcqLw1XO15WyCMg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8A94CA00079; Mon,  3 May 2021 01:08:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-403-gbc3c488b23-fm-20210419.005-gbc3c488b
Mime-Version: 1.0
Message-Id: <f237a53e-ad61-469a-a19f-8a1e52c6cfba@www.fastmail.com>
In-Reply-To: <20210503014336.20256-3-steven_lee@aspeedtech.com>
References: <20210503014336.20256-1-steven_lee@aspeedtech.com>
 <20210503014336.20256-3-steven_lee@aspeedtech.com>
Date: Mon, 03 May 2021 14:37:47 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Steven Lee" <steven_lee@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list" <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_2/3]_ARM:_dts:_aspeed:_ast2600evb:_Add_timing-ph?=
 =?UTF-8?Q?ase_property_for_eMMC_controller?=
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

On Mon, 3 May 2021, at 11:13, Steven Lee wrote:
> Set eMMC input clock phase to 3, which is more stable on AST2600 EVBs.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed-ast2600-evb.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts 
> b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> index 2772796e215e..7a93317e27dc 100644
> --- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> @@ -102,6 +102,7 @@
>  
>  &emmc_controller {
>  	status = "okay";
> +	timing-phase = <0x300FF>;

Please use the existing binding for phase corrections. The existing 
binding is already supported by the driver (added in v5.12).

Andrew
