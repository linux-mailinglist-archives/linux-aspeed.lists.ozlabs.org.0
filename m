Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC94311A00B
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Dec 2019 01:35:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XdHt5GDrzDqdv
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Dec 2019 11:35:22 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="I8fMm6JG"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="lD4FxQjn"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (unknown [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XdHm4YnLzDq8X
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Dec 2019 11:35:16 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C95E622629;
 Tue, 10 Dec 2019 19:35:03 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 10 Dec 2019 19:35:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=NI44Wa9n9XY9sVpFNNGT2BAwDse+De5
 /jHraPGHHLz8=; b=I8fMm6JGaKDu+9ncpgFK4AXBl3Z+crBkaNb444ZbkinmghR
 uv8QUKBykuELhcthzfcBuJsGi8x4Gw0/VHIkLvYKmi7Bzv+6xS4jIMQJE5gIlUj/
 QhbnSrq6A74yB2F9ERcUD2na/vMYZln7layKkpEU7qsfo+ldVEfNbk3kUnwA+zPF
 tDo+dIxaNaNdKnyaoUVN+GJ2oh7lWxveP37wb0Z61CN7iSn1NWx59vlIQdgXO6XM
 /MUgYxQGDnHWchPz6Xbn82wn1IJLCrSMXTWl1p/UQr2z6tsbxkGEdL4uxxObHZ17
 vFNHtL/XlPecmRE3D3ouX4DfiOH4rMFdS6gkYmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=NI44Wa
 9n9XY9sVpFNNGT2BAwDse+De5/jHraPGHHLz8=; b=lD4FxQjnHOM6XgeemnR14e
 NseT9zSu+5wqozw6FRA0IQuWf6CuIItq2YnlY8VOqxd0UNJb7gkDvY9C3wIemkGa
 +SheZvskq9wq0kYfalBaLHG0cTLJwcF9hoxHabk9tNAh3z1sPazte3/nspANqn/d
 UIAiDD+grKt8jbbGg3FGR+z6GiPtzMMIMstxjP7osGubt/sFElN94C98z9SKwKS/
 YzkfkN9/LvqeBWjjSsipJuLEhPWt9A6XVHORGKvYztmGPwZV/t8NvYANuAezTkXL
 A9Xy1yhi6+x3/5mFVJ1JDRviNpUboIr++gRC7Gojg5N2oyGVfjytV3dKbdnZ0dQA
 ==
X-ME-Sender: <xms:tjnwXR5zVMJzXzPfiOE3Yy4dz-Q40r1gT0BKJLfA7Qcy9UWw-1sFfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:tjnwXfSrGIsprKvmqsWjpQ7rkQgzaLd33RwNo9W7V03pwWDukWPZDA>
 <xmx:tjnwXZl8qP9wOwdNkm73WDUNTi3gsdgG0T_zmlvtVMOCEqgQUsuS4Q>
 <xmx:tjnwXWI0jGMj7TSp31wWNxYi9KnBBf4p6nhZVFZ7tBm0yD4oIx5b6w>
 <xmx:tznwXeILkJOA0ji12SVaBaPutOphOwKe_LGkcAPmtXrYpeh3nlJl7g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BB4F4E00AF; Tue, 10 Dec 2019 19:35:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-679-g1f7ccac-fmstable-20191210v1
Mime-Version: 1.0
Message-Id: <beb61d28-7284-44bb-8da8-2fb0b8a4ab5a@www.fastmail.com>
In-Reply-To: <1575566112-11658-4-git-send-email-eajames@linux.ibm.com>
References: <1575566112-11658-1-git-send-email-eajames@linux.ibm.com>
 <1575566112-11658-4-git-send-email-eajames@linux.ibm.com>
Date: Wed, 11 Dec 2019 11:06:42 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: =?UTF-8?Q?Re:_[PATCH_v2_03/12]_ARM:_dts:_aspeed:_ast2500:_Add_SCU_interr?=
 =?UTF-8?Q?upt_controller?=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>, linux-aspeed@lists.ozlabs.org,
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 tglx@linutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 6 Dec 2019, at 03:45, Eddie James wrote:
> Add a node for the interrupt controller provided by the SCU.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-g5.dtsi | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index a259c63..df44022 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -216,8 +216,9 @@
>  			syscon: syscon@1e6e2000 {
>  				compatible = "aspeed,ast2500-scu", "syscon", "simple-mfd";
>  				reg = <0x1e6e2000 0x1a8>;
> +				ranges = <0 0x1e6e2000 0x1a8>;
>  				#address-cells = <1>;
> -				#size-cells = <0>;
> +				#size-cells = <1>;

You're no-longer adding a reg property to the interrupt controller node below so the
hunk above is unnecessary.

Andrew

>  				#clock-cells = <1>;
>  				#reset-cells = <1>;
>  
> @@ -231,6 +232,13 @@
>  					compatible = "aspeed,ast2500-p2a-ctrl";
>  					status = "disabled";
>  				};
> +
> +				scu_ic: interrupt-controller@18 {
> +					#interrupt-cells = <1>;
> +					compatible = "aspeed,ast2500-scu-ic";
> +					interrupts = <21>;
> +					interrupt-controller;
> +				};
>  			};
>  
>  			rng: hwrng@1e6e2078 {
> -- 
> 1.8.3.1
> 
>
