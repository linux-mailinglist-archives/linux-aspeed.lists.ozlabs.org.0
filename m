Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6787327F6CC
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Oct 2020 02:36:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1vMS4DnHzDqTv
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Oct 2020 10:36:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=Aog4yJOx; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=W18IL9tI; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1vMJ5CL8zDqSy
 for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Oct 2020 10:36:44 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 272555C0140;
 Wed, 30 Sep 2020 20:36:42 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 30 Sep 2020 20:36:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=06pnMJ4ySgrR3zE2veXLevcnyQj0lWc
 d++eStXNSg1c=; b=Aog4yJOxWHUIdns67r9LYv+XkJAwb8pOR5Onlp08+awFaVQ
 qew0hYLCc6vzzaQ2xXldxtzOEib9UU3GlebbtT5s3RWmdfW+3VwtxKb5tN78A17U
 sCa1scmhP7epAZBhBslpHDUTqcdBfCTWYlFo/a94pN5E7hlFxNlWslqFAeqIce3z
 fPvBGf3Y8xPHEWBd80R8vLgRy9Bneb3UydjHdhH4kTQM8S357sgoiFRpsei5nQzY
 4bTrZukk1cFIcXdoGF41Ly9CZ61XhD5YD84NsHyTXgmJb8qqBQxX8kmjnnKOptQy
 8zTmM/5f3QvGySRCU0qudk/ucffcQXNTxI25FLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=06pnMJ
 4ySgrR3zE2veXLevcnyQj0lWcd++eStXNSg1c=; b=W18IL9tIpICdtp1ksfSx7G
 g//5j74iOFQ1KT0VH87Qm5MWF7jKkycw19OPnIiEniZrjkxPdWiJ3TfPXxHjPrTd
 sMBBhyhHLS1IxTr/GjdpojnzfbDJ4DPShKZRkLLf6WKglSuoD5PkFw+Mkm1Bv81L
 KklfxlyW4YCDKHbPf/hM1p2fLpDxZBKDrGlDuBUPlR0JzCFRy4OidviRVMwkJWjK
 IM4VWIRtG5k2z/M0iuj5IBz3dkJJXdmGFBO8K+Xf9d0zsA/xHlizht9WqZKj25qf
 VwfcNYODqSVBfRRPepbcRRhLb5BP9x/UxI2hdFxd2RZDMftS52nJZFWq1AqaDYhA
 ==
X-ME-Sender: <xms:mCR1X-_E6qEcX4YynjhFOS6dRl2zwSYIot-RarN41PcZLZBBa2h-EA>
 <xme:mCR1X-uvLvSse5KO3u0wIB6RCOI4Wk8dq_8P2MNFIh3VS8uqIl0LJDY-SLBJQ5h9J
 vNxUYMOpJe9NWnEmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdefkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:mCR1X0Bh8tdoFB07gLuf1a6kETGgeneoqjQd-MEiOUTX8WQLEQB_qg>
 <xmx:mCR1X2dUdiFgP6Ewcrsh7Xm6opGU6lcQ3-T0OcYfbjl_xKmOIVriIw>
 <xmx:mCR1XzM-buy3w0I7LvnEp8OHZeo51JnVCN0Gi9EheEyqzmrPCwcuvg>
 <xmx:miR1X-1IWYTN3IiERWOIzaNQZe2QRh4t6k83qs-DIRztZgWt7ptwQQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6D6B9E0181; Wed, 30 Sep 2020 20:36:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-382-ge235179-fm-20200928.002-ge2351794
Mime-Version: 1.0
Message-Id: <6bc40a50-8c21-4642-ad9e-e92f756aac25@www.fastmail.com>
In-Reply-To: <20200930051113.32465-1-billy_tsai@aspeedtech.com>
References: <20200930051113.32465-1-billy_tsai@aspeedtech.com>
Date: Thu, 01 Oct 2020 10:06:20 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Billy Tsai" <billy_tsai@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: aspeed-g6: Add sgpiom/sgpios node
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
Cc: BMC-SW@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Billy,

On Wed, 30 Sep 2020, at 14:41, Billy Tsai wrote:
> This commit add two sgpiom and two sgpios node into aspeed-g6.dtsi
> and change the register range of gpio0 to fix the hardware design.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 51 +++++++++++++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 97ca743363d7..00237daec2a1 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -357,7 +357,7 @@
>  				#gpio-cells = <2>;
>  				gpio-controller;
>  				compatible = "aspeed,ast2600-gpio";
> -				reg = <0x1e780000 0x800>;
> +				reg = <0x1e780000 0x500>;
>  				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
>  				gpio-ranges = <&pinctrl 0 0 208>;
>  				ngpios = <208>;
> @@ -365,6 +365,55 @@
>  				interrupt-controller;
>  				#interrupt-cells = <2>;
>  			};
> +			sgpiom0: sgpiom@1e780500 {
> +				#gpio-cells = <2>;
> +				gpio-controller;
> +				compatible = "aspeed,ast2600-sgpiom";
> +				reg = <0x1e780500 0x100>;
> +				interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> +				ngpios = <128>;
> +				clocks = <&syscon ASPEED_CLK_APB2>;
> +				interrupt-controller;
> +				bus-frequency = <12000000>;
> +
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_sgpm1_default>;
> +				status = "disabled";
> +			};
> +
> +			sgpiom1: sgpiom@1e780600 {
> +				#gpio-cells = <2>;
> +				gpio-controller;
> +				compatible = "aspeed,ast2600-sgpiom";
> +				reg = <0x1e780600 0x100>;
> +				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +				ngpios = <80>;
> +				clocks = <&syscon ASPEED_CLK_APB2>;
> +				interrupt-controller;
> +				bus-frequency = <12000000>;
> +
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_sgpm2_default>;

Have you tried building this on top of upstream? Because neither sgpm2 nor 
sgps2 are supported by the pinctrl driver. If you have patches that implement 
both mux configurations, can you post them too?

Andrew
