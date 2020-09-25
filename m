Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21804278608
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Sep 2020 13:37:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ByVJC1j9gzDqmX
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Sep 2020 21:37:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=atomide.com
 (client-ip=72.249.23.125; helo=muru.com; envelope-from=tony@atomide.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=atomide.com
Received: from muru.com (muru.com [72.249.23.125])
 by lists.ozlabs.org (Postfix) with ESMTP id 4ByVHw6xH4zDqk5
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Sep 2020 21:36:58 +1000 (AEST)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id DBB9C80B0;
 Fri, 25 Sep 2020 11:36:52 +0000 (UTC)
Date: Fri, 25 Sep 2020 14:36:46 +0300
From: Tony Lindgren <tony@atomide.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 08/15] ARM: dts: am335x: lxm: fix PCA9539 GPIO
 expander properties
Message-ID: <20200925113646.GJ9471@atomide.com>
References: <20200916155715.21009-1-krzk@kernel.org>
 <20200916155715.21009-9-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916155715.21009-9-krzk@kernel.org>
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
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>, Fabio Estevam <festevam@gmail.com>,
 linux-renesas-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

* Krzysztof Kozlowski <krzk@kernel.org> [200916 18:58]:
> The PCA9539 GPIO expander requires GPIO controller properties to operate
> properly.

I'm picking this patch into omap-for-v5.10/dt thanks.

Tony
