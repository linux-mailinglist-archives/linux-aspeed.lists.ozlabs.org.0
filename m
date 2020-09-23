Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BC827A676
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Sep 2020 06:28:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C08f71K1fzDqW9
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Sep 2020 14:28:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.178.242;
 helo=mslow2.mail.gandi.net; envelope-from=gregory.clement@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=bootlin.com
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxLT30NBNzDqHZ
 for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Sep 2020 00:40:47 +1000 (AEST)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id C23593B2814
 for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Sep 2020 14:39:37 +0000 (UTC)
X-Originating-IP: 90.65.92.90
Received: from localhost (lfbn-lyo-1-1913-90.w90-65.abo.wanadoo.fr
 [90.65.92.90]) (Authenticated sender: gregory.clement@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id DB6D0FF80F;
 Wed, 23 Sep 2020 14:39:02 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt?=
 Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Jason
 Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Tero
 Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>, Michal Simek
 <michal.simek@xilinx.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 14/15] ARM: dts: armada: align GPIO hog names with
 dtschema
In-Reply-To: <20200916155715.21009-15-krzk@kernel.org>
References: <20200916155715.21009-1-krzk@kernel.org>
 <20200916155715.21009-15-krzk@kernel.org>
Date: Wed, 23 Sep 2020 16:39:02 +0200
Message-ID: <87a6xgimm1.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 28 Sep 2020 14:28:26 +1000
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

> The convention for node names is to use hyphens, not underscores.
> dtschema for pca95xx expects GPIO hogs to end with 'hog' prefix.


Applied on mvebu/dt

Thanks,

Gregory

>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/armada-388-clearfog.dts  |  4 ++--
>  arch/arm/boot/dts/armada-388-clearfog.dtsi | 10 +++++-----
>  arch/arm/boot/dts/armada-388-helios4.dts   |  6 +++---
>  3 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/boot/dts/armada-388-clearfog.dts b/arch/arm/boot/dts/armada-388-clearfog.dts
> index 20f8d4667753..4140a5303b48 100644
> --- a/arch/arm/boot/dts/armada-388-clearfog.dts
> +++ b/arch/arm/boot/dts/armada-388-clearfog.dts
> @@ -73,13 +73,13 @@
>  	 * 14-SFP_TX_DISABLE
>  	 * 15-SFP_MOD_DEF0
>  	 */
> -	pcie2_0_clkreq {
> +	pcie2-0-clkreq-hog {
>  		gpio-hog;
>  		gpios = <4 GPIO_ACTIVE_LOW>;
>  		input;
>  		line-name = "pcie2.0-clkreq";
>  	};
> -	pcie2_0_w_disable {
> +	pcie2-0-w-disable-hog {
>  		gpio-hog;
>  		gpios = <7 GPIO_ACTIVE_LOW>;
>  		output-low;
> diff --git a/arch/arm/boot/dts/armada-388-clearfog.dtsi b/arch/arm/boot/dts/armada-388-clearfog.dtsi
> index a0aa1d188f0c..f8a06ae4a3c9 100644
> --- a/arch/arm/boot/dts/armada-388-clearfog.dtsi
> +++ b/arch/arm/boot/dts/armada-388-clearfog.dtsi
> @@ -141,31 +141,31 @@
>  		#gpio-cells = <2>;
>  		reg = <0x20>;
>  
> -		pcie1_0_clkreq {
> +		pcie1-0-clkreq-hog {
>  			gpio-hog;
>  			gpios = <0 GPIO_ACTIVE_LOW>;
>  			input;
>  			line-name = "pcie1.0-clkreq";
>  		};
> -		pcie1_0_w_disable {
> +		pcie1-0-w-disable-hog {
>  			gpio-hog;
>  			gpios = <3 GPIO_ACTIVE_LOW>;
>  			output-low;
>  			line-name = "pcie1.0-w-disable";
>  		};
> -		usb3_ilimit {
> +		usb3-ilimit-hog {
>  			gpio-hog;
>  			gpios = <5 GPIO_ACTIVE_LOW>;
>  			input;
>  			line-name = "usb3-current-limit";
>  		};
> -		usb3_power {
> +		usb3-power-hog {
>  			gpio-hog;
>  			gpios = <6 GPIO_ACTIVE_HIGH>;
>  			output-high;
>  			line-name = "usb3-power";
>  		};
> -		m2_devslp {
> +		m2-devslp-hog {
>  			gpio-hog;
>  			gpios = <11 GPIO_ACTIVE_HIGH>;
>  			output-low;
> diff --git a/arch/arm/boot/dts/armada-388-helios4.dts b/arch/arm/boot/dts/armada-388-helios4.dts
> index fb49df2a3bce..b3728de3bd3f 100644
> --- a/arch/arm/boot/dts/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/armada-388-helios4.dts
> @@ -166,19 +166,19 @@
>  					interrupt-controller;
>  					#interrupt-cells = <2>;
>  
> -					board_rev_bit_0 {
> +					board-rev-bit-0-hog {
>  						gpio-hog;
>  						gpios = <0 GPIO_ACTIVE_LOW>;
>  						input;
>  						line-name = "board-rev-0";
>  					};
> -					board_rev_bit_1 {
> +					board-rev-bit-1-hog {
>  						gpio-hog;
>  						gpios = <1 GPIO_ACTIVE_LOW>;
>  						input;
>  						line-name = "board-rev-1";
>  					};
> -					usb3_ilimit {
> +					usb3-ilimit-hog {
>  						gpio-hog;
>  						gpios = <5 GPIO_ACTIVE_HIGH>;
>  						input;
> -- 
> 2.17.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
