Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE9427A677
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Sep 2020 06:28:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C08fD34h4zDqW9
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Sep 2020 14:28:36 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxLT65xm6zDqS4
 for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Sep 2020 00:40:53 +1000 (AEST)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id C29D93B2817
 for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Sep 2020 14:39:37 +0000 (UTC)
X-Originating-IP: 90.65.92.90
Received: from localhost (lfbn-lyo-1-1913-90.w90-65.abo.wanadoo.fr
 [90.65.92.90]) (Authenticated sender: gregory.clement@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 024DBFF80C;
 Wed, 23 Sep 2020 14:38:52 +0000 (UTC)
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
Subject: Re: [PATCH v3 13/15] ARM: dts: dove: fix PCA95xx GPIO expander
 properties on A510
In-Reply-To: <20200916155715.21009-14-krzk@kernel.org>
References: <20200916155715.21009-1-krzk@kernel.org>
 <20200916155715.21009-14-krzk@kernel.org>
Date: Wed, 23 Sep 2020 16:38:52 +0200
Message-ID: <87blhwimmb.fsf@BL-laptop>
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

> The PCA95xx GPIO expander requires GPIO controller properties to operate
> properly.

Applied on mvebu/dt

Thanks,

Gregory
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/boot/dts/dove-sbc-a510.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/dove-sbc-a510.dts b/arch/arm/boot/dts/dove-sbc-a510.dts
> index 2bb85a9b7614..df021f9b0117 100644
> --- a/arch/arm/boot/dts/dove-sbc-a510.dts
> +++ b/arch/arm/boot/dts/dove-sbc-a510.dts
> @@ -143,6 +143,7 @@
>  	gpio_ext: gpio@20 {
>  		compatible = "nxp,pca9555";
>  		reg = <0x20>;
> +		gpio-controller;
>  		#gpio-cells = <2>;
>  	};
>  };
> -- 
> 2.17.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
