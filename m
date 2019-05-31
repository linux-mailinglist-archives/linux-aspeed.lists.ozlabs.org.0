Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFF6309C3
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 May 2019 10:00:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FcLm5WknzDqgX
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 May 2019 18:00:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ZZYrGWUU"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Ve1EEkjJ"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FcLW6G3NzDqg3
 for <linux-aspeed@lists.ozlabs.org>; Fri, 31 May 2019 18:00:03 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A7DFD21E90;
 Fri, 31 May 2019 04:00:00 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Fri, 31 May 2019 04:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=Vt88uEygPIcGWjDilRhdbj1DAz7EhM7
 E+LtWenHZ1O0=; b=ZZYrGWUUAz2vapErJCAJ4ZmletpYCqHknQtpEUb+h1fc026
 G5nvCaCk8jLoLeFNJreiXFtg84DxRbcdHgdkkraHqAwBZyqm9paXl9YSDuiWsD8v
 JdCdZezsjdhATbCXsp0MY2Q6qjp9ox/XaS2tFKl/9CqXGB4pQ2jO+HMEttwjJCxC
 1SY4kZ6xAKU8rMHxLz9ExAevcwdIGBVfuRdq4xjz7qilVyMjwoqWkJToGC8FlBbr
 hV1ey7bjOdayPsVJLhFgCk+W4YZrqrIcSvy1haZuOqk4Uuu/4j1t/GOOnELcoGnA
 GrrSZkOTOXcOM6aF3PG+lNz8PPLrAEte1slsQWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Vt88uE
 ygPIcGWjDilRhdbj1DAz7EhM7E+LtWenHZ1O0=; b=Ve1EEkjJpwz8q1Iz8lT+Mc
 VucTu7d03lo5+5+xgcOu6iKgdtdd46Qgw5PeDLSHihSYZXfj/y51wRtIQit5GjJV
 rScXa40dShDcp8IJxvQctEVpflI/tJSlxJNu8s9RXcU0FWQ0WRaO7g1A6N4RPi+3
 SpnjneAKmt87yVvgKwZ58jPQhlOPE1OP+bodaEQvi+OGuB+oM0PdOkR/4nwfzXO2
 W72mRaKz+FQXBszHoMnr98CMOQHMuH7gh9hEXP4OWrXHfaUjMJE1dfTzbNDOMx95
 mhIaOj0AQHBmtrhxtgsg8GfoiQiutTn3PDJziWguT+oe3RKsqPgVKVoRKYgcKNVA
 ==
X-ME-Sender: <xms:_t7wXI4mJrbZtDPpUcAO99yNhOrs8BgfuPiQZkzPI31h5RjEgtvgKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeftddguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrg
 hrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushht
 vghrufhiiigvpedt
X-ME-Proxy: <xmx:_t7wXOLz7iSkzy0OmvZjy7v5Or6mbBRqYAGF6gKSBFztJBNA6q_0jQ>
 <xmx:_t7wXCfQ3fqbeejk0d8YbBdxC2L9PM4nGHCmJteRuTM9NHl_x6f0_w>
 <xmx:_t7wXBe0Z94-Nax48W4uyERu_iT9ddofTJYWC8oxirvIIW2aSqCN7g>
 <xmx:AN_wXDrdEg5grihZAGO7MhqlPB682nuhUMwj8qSe3NO3DhBRnpZiLw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7CD0FE00A2; Fri, 31 May 2019 03:59:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-555-g49357e1-fmstable-20190528v2
Mime-Version: 1.0
Message-Id: <af088bbb-d55f-4477-a564-ef9fcc306433@www.fastmail.com>
In-Reply-To: <20190530093544.12215-1-a.filippov@yadro.com>
References: <20190530093544.12215-1-a.filippov@yadro.com>
Date: Fri, 31 May 2019 17:29:58 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Alexander A. Filippov" <a.filippov@yadro.com>,
 linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v2] ARM: dts: aspeed: g4: add video engine support
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 30 May 2019, at 19:06, Alexander Filippov wrote:
> Add a node to describe the video engine on AST2400.
> 
> These changes were copied from aspeed-g5.dtsi
> 
> Signed-off-by: Alexander Filippov <a.filippov@yadro.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index 6011692df15a..5a9e3f684359 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -195,6 +195,16 @@
>  				reg = <0x1e720000 0x8000>;	// 32K
>  			};
>  
> +			video: video@1e700000 {
> +				compatible = "aspeed,ast2400-video-engine";
> +				reg = <0x1e700000 0x1000>;
> +				clocks = <&syscon ASPEED_CLK_GATE_VCLK>,
> +					 <&syscon ASPEED_CLK_GATE_ECLK>;
> +				clock-names = "vclk", "eclk";
> +				interrupts = <7>;
> +				status = "disabled";
> +			};
> +
>  			gpio: gpio@1e780000 {
>  				#gpio-cells = <2>;
>  				gpio-controller;
> -- 
> 2.20.1
> 
>
