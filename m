Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B05A26D01E
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Sep 2020 02:45:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsJCF5CG7zDr5n
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Sep 2020 10:44:57 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=nohf1Mjy; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=skj0rCXp; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsHvX1YmnzDqCD
 for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Sep 2020 10:31:13 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 643015C0B67;
 Wed, 16 Sep 2020 19:52:31 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 16 Sep 2020 19:52:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=NeXjMHnHLgrSaVlcEGkc0JBrainqEtp
 kI5e2sV+hLTQ=; b=nohf1MjyDYddP6HdxGxErtt0DJWz0y3c35+uXHFMd0uWxs1
 6bbAbnkpPpYQlDHqOr3Pc/5IxGGeTmCsK+JajjFklBnGbE9zGOzLW3LpjgR8C4er
 y//wqnIf2xI+NkZH68pxnUdlKh8mTX0fpzLZJ9cV4YLcrWGICqNbP41LlRXVmSY2
 aowV8Stoizp66eJ9rrrU09k5X5KdUQil4WBUwYRpGS+hE8RAqt3k8L1pu3Aaxbef
 U6kTCl/qYPoRDbvJUGM+cN/pY7UZVP3OdOpR+w1/DvJtB0bGYy9/nDQO4QBrNeVi
 DIcYvhn5qR2w+ecxsH/yI4nLceWMV96FPTmoOMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=NeXjMH
 nHLgrSaVlcEGkc0JBrainqEtpkI5e2sV+hLTQ=; b=skj0rCXpIxZFexFIyk9plz
 OGz00HpBB43CHe63vmRx99Sywa6WtmB+EfCxZQFH1wo+Qqqnlze2qS7OBZDVSJVV
 SYPyuIS1IaCnv6TNyETWgw/O5LdqJsJiGqk90x2p90IOG9KLPnCK0ExKs928w0YQ
 5blH5j0cxyGtSBgzI3Si0M+UqpOFgqQmNFI4obKgHhke16xsg0m7OkC/MUXZq0++
 v0ajcDTTShrPb8VPN0k8n0euLw6Dm3w1YSyOVSk3L83rJ0cs89ifl/uFCYwGO2TL
 BZIeDf7Nob60dlJ0ar5gH6iaed7s4vyw82o4ZNmGITs2fvOGkxvIuOHCwG+4Zeww
 ==
X-ME-Sender: <xms:PqViX3018gkHFVeEwpBs-B9DvkhckxVBDJaKzXFwI51sS2zyLRoz6A>
 <xme:PqViX2EwYdXANkKmjd7bo0KM2BNAuO-XqoyQLZrR8mGNHNZGXEt8juQmAqpJzT3Lq
 5Gk4lTdXBPrsn8RIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdefgddvjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:PqViX34XpdpLZbe7Uhkk9EY9dthjNP43rE_T6TVcVokoAzMyQQ22Zw>
 <xmx:PqViX82gcZyH8uj9ZghLqVGCde8iaWpnPGECNogvZuOiqd9Fd4ywqg>
 <xmx:PqViX6FpGfJTLj0bWVoNKeqxNDzV8I5gMS0zEq72tlBItPlfZC018A>
 <xmx:P6ViX8MYfWnylo0EK9jaxF_1MH3OG5fwwY6vJe8bj6THhzPpqXJjYA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D393EE00D1; Wed, 16 Sep 2020 19:52:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-324-g0f99587-fm-20200916.004-g0f995879
Mime-Version: 1.0
Message-Id: <7e4e6a63-80a3-431b-a10c-a757fd1af2ad@www.fastmail.com>
In-Reply-To: <20200916084703.778386-4-joel@jms.id.au>
References: <20200916084703.778386-1-joel@jms.id.au>
 <20200916084703.778386-4-joel@jms.id.au>
Date: Thu, 17 Sep 2020 09:22:10 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Rob Herring" <robh+dt@kernel.org>
Subject: Re: [PATCH 3/3] ARM: dts: aspeed: Add silicon id node
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



On Wed, 16 Sep 2020, at 18:17, Joel Stanley wrote:
> This register describes the silicon id and chip unique id. It varies
> between CPU revisions, but is always part of the SCU.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi | 5 +++++
>  arch/arm/boot/dts/aspeed-g5.dtsi | 5 +++++
>  arch/arm/boot/dts/aspeed-g6.dtsi | 5 +++++
>  3 files changed, 15 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index 82f0213e3a3c..bc580b75f801 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -192,6 +192,11 @@ p2a: p2a-control@2c {
>  					status = "disabled";
>  				};
>  
> +                                silicon-id@7c {
> +                                        compatible = 
> "aspeed,ast2400-silicon-id", "aspeed,silicon-id";
> +					reg = <0x7c 0x4>;

Looks like a whitespace/alignment issue here.

> +                                };
> +
>  				pinctrl: pinctrl@80 {
>  					reg = <0x80 0x18>, <0xa0 0x10>;
>  					compatible = "aspeed,ast2400-pinctrl";
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi 
> b/arch/arm/boot/dts/aspeed-g5.dtsi
> index 9c91afb2b404..c6862182313a 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -239,6 +239,11 @@ p2a: p2a-control@2c {
>  					status = "disabled";
>  				};
>  
> +				silicon-id@7c {
> +					compatible = "aspeed,ast2500-silicon-id", "aspeed,silicon-id";
> +					reg = <0x7c 0x4 0x150 0x8>;

I think `reg = <0x7c 0x4>, <0x150 0x8>;` can be used here? I think it's a 
readability improvement, but I'm not fussed. If you decide to change it
then also fix the g6 devicetree.

Andrew


> +				};
> +
>  				pinctrl: pinctrl@80 {
>  					compatible = "aspeed,ast2500-pinctrl";
>  					reg = <0x80 0x18>, <0xa0 0x10>;
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index b58220a49cbd..1ce3a1f06f7f 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -311,6 +311,11 @@ pinctrl: pinctrl {
>  					compatible = "aspeed,ast2600-pinctrl";
>  				};
>  
> +				silicon-id@14 {
> +					compatible = "aspeed,ast2600-silicon-id", "aspeed,silicon-id";
> +					reg = <0x14 0x4 0x5b0 0x8>;
> +				};
> +
>  				smp-memram@180 {
>  					compatible = "aspeed,ast2600-smpmem";
>  					reg = <0x180 0x40>;
> -- 
> 2.28.0
> 
>
