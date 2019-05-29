Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B19E2D33C
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 May 2019 03:22:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DCd36rC8zDqNL
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 May 2019 11:22:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="hOV871nm"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="nYZSZa2j"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DCcx3crBzDqD2
 for <linux-aspeed@lists.ozlabs.org>; Wed, 29 May 2019 11:22:41 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 084352203E;
 Tue, 28 May 2019 21:22:39 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 28 May 2019 21:22:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=O3Xkv3EI6y00AB2M6iUlJwWyBdvRoMi
 nM2rnAHW1aYg=; b=hOV871nmAdvpcLrcayvkgFn0OV342CHDmf9kRVh6YDNmapN
 fJb/O6F+9R4mH5T2vUaw/G/lAjwe1k35zu/KVu376BtR7EMzdjcWH9srREK6cmwe
 mPrU+UuN9nSCLzEJr5KwObQEP8qgH+qWdsIZR6O1ksL5VoRb/APcKCGZyciXMzAg
 0bK5svhKSY/ZUx7jCipcmflg+MfIxXSDVXKcMeEJ2S9T2O2EB/WV+vrFDtTZeniQ
 9uocJZZ2+5sX1XfbDZ6pcoVIaL+v3nfWlbRrfT4MzCd05XZKk7rAdvwqJ3NqcUC3
 cjPOVgfq29rA/oq50mMHOJvpVP8ev72bcJDVCmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=O3Xkv3
 EI6y00AB2M6iUlJwWyBdvRoMinM2rnAHW1aYg=; b=nYZSZa2jMoyk0fHbHbePYC
 GFW/9W5yQC4kMgPoLN7SlHkfxWroFiLVNRyPRcoktMVkSYZyKyIzP5oBKRJTHBcu
 X3Tg4xxvy0eKxst8OKBpCV6NXhuN+E33sZrKPK5EhTd6z0OY3K4JYsbXhn0MOjv5
 TxK6JQMn/5/pfeOiyEMFoy/aud+7JIoqWVCKROVlJypkLRvbdxnaaOwnk7bWlb5Z
 2LrABS+yVXintxlj6vOBljfKpnsaLgscHaCtgTTnT6fkfMVIvfJOUDnC8aoZTQuV
 jHATHUB5AGUFHD8qsSFFA/FYZ+tx8uogNEBWUOvWZRUJXgRTNskpf3R/Wk4Szy/Q
 ==
X-ME-Sender: <xms:3d7tXKQ_mHmvNk8LYkpIljRURpmhytPa06O4NBRV1egLyXIuEyolqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddviedggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:3d7tXFQHu7jR7Vh8F975N4hdkfE8Jvw6GtZjT_KasakbDHkvaP8hsw>
 <xmx:3d7tXG5opnSsYQh9XuURjuUhGMxzAXlIFfjMNM_ddsDKtU5zNJEtyw>
 <xmx:3d7tXKVYrp-nVot3T4GLSTfXXoqv8Scjl8fGLSdSu2wmvFXXYIETBA>
 <xmx:3t7tXL14R3RvaZCn_gnQ2MRGOzKNMaHfplYh8XlawYvBZGEjy61q4A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 42D6FE00A2; Tue, 28 May 2019 21:22:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-555-g49357e1-fmstable-20190528v2
Mime-Version: 1.0
Message-Id: <c0e01b11-5ea2-42d1-be67-2998809e310c@www.fastmail.com>
In-Reply-To: <20190527112753.1681-1-a.filippov@yadro.com>
References: <20190527112753.1681-1-a.filippov@yadro.com>
Date: Wed, 29 May 2019 10:52:36 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Alexander A. Filippov" <a.filippov@yadro.com>,
 linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH] ARM: dts: aspeed: g4: add video engine support
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



On Mon, 27 May 2019, at 20:58, Alexander Filippov wrote:
> Add a node to describe the video engine and VGA scratch registers on
> AST2400.
> 
> These changes were copied from aspeed-g5.dtsi
> 
> Signed-off-by: Alexander Filippov <a.filippov@yadro.com>

Ugh, I should really sort out the bmc-misc stuff, I don't like to see it propagate
in its current form. That's not your problem though, and I hope to address it in
the near future.

For the OpenBMC kernel tree:

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi | 62 ++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index 6011692df15a..adc1804918df 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -168,6 +168,10 @@
>  					compatible = "aspeed,g4-pinctrl";
>  				};
>  
> +				vga_scratch: scratch {
> +					compatible = "aspeed,bmc-misc";
> +				};
> +
>  				p2a: p2a-control {
>  					compatible = "aspeed,ast2400-p2a-ctrl";
>  					status = "disabled";
> @@ -195,6 +199,16 @@
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
> @@ -1408,6 +1422,54 @@
>  	};
>  };
>  
> +&vga_scratch {
> +	dac_mux {
> +		offset = <0x2c>;
> +		bit-mask = <0x3>;
> +		bit-shift = <16>;
> +	};
> +	vga0 {
> +		offset = <0x50>;
> +		bit-mask = <0xffffffff>;
> +		bit-shift = <0>;
> +	};
> +	vga1 {
> +		offset = <0x54>;
> +		bit-mask = <0xffffffff>;
> +		bit-shift = <0>;
> +	};
> +	vga2 {
> +		offset = <0x58>;
> +		bit-mask = <0xffffffff>;
> +		bit-shift = <0>;
> +	};
> +	vga3 {
> +		offset = <0x5c>;
> +		bit-mask = <0xffffffff>;
> +		bit-shift = <0>;
> +	};
> +	vga4 {
> +		offset = <0x60>;
> +		bit-mask = <0xffffffff>;
> +		bit-shift = <0>;
> +	};
> +	vga5 {
> +		offset = <0x64>;
> +		bit-mask = <0xffffffff>;
> +		bit-shift = <0>;
> +	};
> +	vga6 {
> +		offset = <0x68>;
> +		bit-mask = <0xffffffff>;
> +		bit-shift = <0>;
> +	};
> +	vga7 {
> +		offset = <0x6c>;
> +		bit-mask = <0xffffffff>;
> +		bit-shift = <0>;
> +	};
> +};
> +
>  &sio_regs {
>  	sio_2b {
>  		offset = <0xf0>;
> -- 
> 2.20.1
> 
>
