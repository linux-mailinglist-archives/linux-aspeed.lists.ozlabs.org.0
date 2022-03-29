Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C874EA527
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Mar 2022 04:28:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSD4x35ZXz3c1N
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Mar 2022 13:28:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=XFkdhraQ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ll4aACnB;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=XFkdhraQ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=ll4aACnB; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSD4s07v2z2xDM
 for <linux-aspeed@lists.ozlabs.org>; Tue, 29 Mar 2022 13:28:12 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 011495C01FC;
 Mon, 28 Mar 2022 22:28:11 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute5.internal (MEProxy); Mon, 28 Mar 2022 22:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=Tg9t/nSNCv1cymBb9h1DbMyvjS3EsvJEQGzQp2
 TOyM8=; b=XFkdhraQUwYLP4o4yQoWxpA4KPNvgAs2MZq5+h6OpbYKgarMR4XyAq
 eG954aYjmlj8D2qo8GV/K665oRn6qcrLy1ZbDcfjin8++CdViVHiXBeFEGy16Age
 YdaQXEW/CF8BBxVa16ceFrWcYrlpsGnPhjyhMTzW5VrJU8K5nc6QXadF9VbKXR5x
 LXE1RgCvGYE4TgQb3RwT/b76aKSXiGYC6OJz/p+Yd0fdVi25dpT95casX3VTTGAl
 mFWYEESn1vqThBiSwqFQkYHV2J5lb//emdr4G4JpxYwDs8eEv1Mguex0xjZD+Z1c
 o6NDTk+UVfKg6m+fhtwlY2YvN9ALrkbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Tg9t/nSNCv1cymBb9
 h1DbMyvjS3EsvJEQGzQp2TOyM8=; b=ll4aACnB0xXdqAGPRtbi6xARgqY3/Dv6v
 +P6I5Nha/DNjDpYCXI/weghAkDyzJS9w4tn8KIom47b7WZlcPLwtC/414LGdtKfZ
 D96ceFgosXG/PtyVWM7kLWsvRWao0fZGFk9S4CuikDiFy4LjdU1o6fdh8RMxUJXb
 LwVOWEFkq4S18j1cSy/jn9iHtzFh7kJXf9ZyWCEyXNbP1x/6zjdESpu/1G+m0lLQ
 jMgAmdqHBtCcJGN4Zf1SV7gifBLgKz9ONov5rkJvQubwrHdCgWk1P71EUReQTgei
 Dyn+ZQ9RLZzOM1zEv1+1/VHVuXT8p1BsrOtugf492fJ5Hy/lZDeDw==
X-ME-Sender: <xms:um5CYtqHueWV6efmC-OBJvze6gUG7EBH6CFW0E-50WHHCaM0CSNK7w>
 <xme:um5CYvrP-hBHlkLJr6TkTf2Ch8ro_QFAxnWLaYKu0buKpSccTfVJJRZW9ApRsKgu7
 lQJnW6VNZSjwCpigQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehkedgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:um5CYqOBfQ-x1__xLH4NlEf1l47wv63yRB3L3qlfl8RwL2n6DimrZg>
 <xmx:um5CYo4QEHytI7S8Voa_ow5KlGjquqc3T-Lq1zZm8IBKwi5HL8QfNA>
 <xmx:um5CYs5k4uSD81iBMtu1LLNVYGGgE0m9xUdm_eYTT7pJebiFScFaYQ>
 <xmx:um5CYmT8LXX0P0z4fz6woyc_MUlXI5iaqfkOjVYMlrKY095hRoDefA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 76362F6043F; Mon, 28 Mar 2022 22:28:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <8de31099-3695-4d9c-a656-525ff1945112@www.fastmail.com>
In-Reply-To: <SG2PR06MB2315BF301B03A52EE0D8BB56E61E9@SG2PR06MB2315.apcprd06.prod.outlook.com>
References: <SG2PR06MB2315BF301B03A52EE0D8BB56E61E9@SG2PR06MB2315.apcprd06.prod.outlook.com>
Date: Tue, 29 Mar 2022 12:57:39 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Howard Chiu" <howard_chiu@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] ARM: dts: aspeed: Add video engine
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Howard,

On Tue, 29 Mar 2022, at 12:08, Howard Chiu wrote:
> The ast2600 SoC has an embedded video engine
> This node was removed by commit 645afe7

The summary line of the commit should follow the commit ID (which 
should also be 12 characters not 7) here, so:

645afe73f951 ("ARM: dts: aspeed: ast2600: Update XDMA engine node")

>

And then you also need a fixes tag:

Fixes: 645afe73f951 ("ARM: dts: aspeed: ast2600: Update XDMA engine node")


> Signed-off-by: Howard Chiu <howard_chiu@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index c32e87fad4dc..aac55b3aeded 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -389,6 +389,16 @@ sbc: secure-boot-controller@1e6f2000 {
>  				reg = <0x1e6f2000 0x1000>;
>  			};
> 
> +			video: video@1e700000 {
> +				compatible = "aspeed,ast2600-video-engine";
> +				reg = <0x1e700000 0x1000>;
> +				clocks = <&syscon ASPEED_CLK_GATE_VCLK>,
> +					 <&syscon ASPEED_CLK_GATE_ECLK>;
> +				clock-names = "vclk", "eclk";
> +				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +
>  			gpio0: gpio@1e780000 {
>  				#gpio-cells = <2>;
>  				gpio-controller;
> -- 
> 2.25.1

Cheers,

Andrew
