Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5C96733A8
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Jan 2023 09:28:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyG453xGWz3fDN
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Jan 2023 19:28:37 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=atomide.com (client-ip=72.249.23.125; helo=muru.com; envelope-from=tony@atomide.com; receiver=<UNKNOWN>)
X-Greylist: delayed 598 seconds by postgrey-1.36 at boromir; Thu, 19 Jan 2023 19:28:33 AEDT
Received: from muru.com (muru.com [72.249.23.125])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyG4142Gxz3c8d;
	Thu, 19 Jan 2023 19:28:33 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id CE64480F1;
	Thu, 19 Jan 2023 08:18:30 +0000 (UTC)
Date: Thu, 19 Jan 2023 10:18:29 +0200
From: Tony Lindgren <tony@atomide.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 01/11] ARM: dts: ti: Fix pca954x i2c-mux node names
Message-ID: <Y8j81dFnDQjpAorw@atomide.com>
References: <cover.1669999298.git.geert+renesas@glider.be>
 <bc964109db8a5f29124580165e925bd3bfe36661.1669999298.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc964109db8a5f29124580165e925bd3bfe36661.1669999298.git.geert+renesas@glider.be>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Tomer Maimon <tmaimon77@gmail.com>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, Stefan Agner <stefan@agner.ch>, Tali Perry <tali.perry1@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Li Yang <leoyang.li@nxp.com>, Michael Ellerman <mpe@ellerman.id.au>, Gregory Clement <gregory.clement@bootlin.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nancy Yuen <yuenn@google.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Patrick Venture <ventur
 e@google.com>, linux-mips@vger.kernel.org, UNGLinuxDriver@microchip.com, linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, openbmc@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

* Geert Uytterhoeven <geert+renesas@glider.be> [221202 18:50]:
> "make dtbs_check":
> 
>     arch/arm/boot/dts/am3874-iceboard.dtb: pca9548@70: $nodename:0: 'pca9548@70' does not match '^(i2c-?)?mux'
> 	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>     arch/arm/boot/dts/am3874-iceboard.dtb: pca9548@70: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3', 'i2c@4', 'i2c@5', 'i2c@6', 'i2c@7' were unexpected)
> 	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>     ...
> 
> Fix this by renaming PCA954x nodes to "i2c-mux", to match the I2C bus
> multiplexer/switch DT bindings and the Generic Names Recommendation in
> the Devicetree Specification.

Applying this patch into omap-for-v6.3/dt thanks.

Tony
