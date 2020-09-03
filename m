Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 704ED260C64
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Sep 2020 09:49:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bly334fC6zDqRX
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Sep 2020 17:49:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=atomide.com
 (client-ip=72.249.23.125; helo=muru.com; envelope-from=tony@atomide.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=atomide.com
X-Greylist: delayed 516 seconds by postgrey-1.36 at bilbo;
 Thu, 03 Sep 2020 18:39:37 AEST
Received: from muru.com (muru.com [72.249.23.125])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BhvPP2Y67zDr4m
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Sep 2020 18:39:36 +1000 (AEST)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 988F880F1;
 Thu,  3 Sep 2020 08:30:54 +0000 (UTC)
Date: Thu, 3 Sep 2020 11:31:29 +0300
From: Tony Lindgren <tony@atomide.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/6] ARM: dts: am335x: lxm: Fix PCA9539 GPIO expander
 properties
Message-ID: <20200903083129.GA2782@atomide.com>
References: <20200829094024.31842-1-krzk@kernel.org>
 <20200829094024.31842-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200829094024.31842-3-krzk@kernel.org>
X-Mailman-Approved-At: Tue, 08 Sep 2020 17:49:01 +1000
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Andrew Lunn <andrew@lunn.ch>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jason Cooper <jason@lakedaemon.net>, linux-aspeed@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

* Krzysztof Kozlowski <krzk@kernel.org> [200829 09:40]:
> The PCA9539 GPIO expander requires GPIO controller properties to operate
> properly.

Best to merge this with the rest of the series:

Acked-by: Tony Lindgren <tony@atomide.com>
