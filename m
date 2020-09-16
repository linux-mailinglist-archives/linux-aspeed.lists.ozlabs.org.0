Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ABB26C4AD
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 17:57:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bs4Vx6NHXzDqJt
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Sep 2020 01:57:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=i3Sqamwn; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bs4Vm3XmVzDqGl
 for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Sep 2020 01:57:36 +1000 (AEST)
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 720CD22211;
 Wed, 16 Sep 2020 15:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600271853;
 bh=yWzQ6WPjC8rItrDgfGhWQlUAtGLsaZ/R1keRvnf9UxY=;
 h=From:To:Cc:Subject:Date:From;
 b=i3SqamwnKOkrcTX1RAKNjivJMdEvwdYD85f3vO+d19vaDDdbvRewgc78OLqj/HMO6
 tMP6KzAaZgPvEpuNQPo8El740umS7geCOGv8WLOwEXpGnKajjyF/ZfpMxJq5PK8/t0
 oFPYzFa4hY2ewOq9WDIqWOVBRkg8/oRiQhpVN+oE=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Jason Cooper <jason@lakedaemon.net>,
 Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Tero Kristo <t-kristo@ti.com>,
 Nishanth Menon <nm@ti.com>, Michal Simek <michal.simek@xilinx.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 00/15] ARM: dts: / gpio: Add dtschema for NXP PCA953x and
 correct dts
Date: Wed, 16 Sep 2020 17:57:00 +0200
Message-Id: <20200916155715.21009-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
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


Hi,

Changes since v2:
1. Add Rob's review,
2. Minor fixup in patch #1,
3. Add acks to 11 and 13.

Changes since v1:
1. Patch 1: Use additionalProperties, Add wakeup-source, Add hogs, Extend example with hogs.
2. New patches: 3, 4, 5, 6, 7, 9, 10, 12, 14 and 15.

The patches could be picked up independently if dtschema makes sense.
The fixes for pins make sense anyway, regardless of dtschema.

Best regards,
Krzysztof


Krzysztof Kozlowski (15):
  dt-bindings: gpio: convert bindings for NXP PCA953x family to dtschema
  dt-bindings: gpio: convert bindings for Maxim MAX732x family to
    dtschema
  arm64: dts: mediatek: fix tca6416 reset GPIOs in pumpkin
  arm64: dts: mediatek: align GPIO hog names with dtschema
  arm64: dts: renesas: align GPIO hog names with dtschema
  arm64: dts: ti: align GPIO hog names with dtschema
  arm64: dts: xilinx: align GPIO hog names with dtschema
  ARM: dts: am335x: lxm: fix PCA9539 GPIO expander properties
  ARM: dts: am335x: t335: align GPIO hog names with dtschema
  ARM: dts: am3874: iceboard: fix GPIO expander reset GPIOs
  ARM: dts: aspeed: fix PCA95xx GPIO expander properties on Portwell
  ARM: dts: aspeed: align GPIO hog names with dtschema
  ARM: dts: dove: fix PCA95xx GPIO expander properties on A510
  ARM: dts: armada: align GPIO hog names with dtschema
  ARM: dts: imx6q: align GPIO hog names with dtschema

 .../devicetree/bindings/gpio/gpio-max732x.txt |  58 -----
 .../devicetree/bindings/gpio/gpio-pca953x.txt |  90 -------
 .../bindings/gpio/gpio-pca95xx.yaml           | 232 ++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |   4 -
 arch/arm/boot/dts/am335x-lxm.dts              |   4 +
 arch/arm/boot/dts/am335x-sbc-t335.dts         |   4 +-
 arch/arm/boot/dts/am3874-iceboard.dts         |   8 +-
 arch/arm/boot/dts/armada-388-clearfog.dts     |   4 +-
 arch/arm/boot/dts/armada-388-clearfog.dtsi    |  10 +-
 arch/arm/boot/dts/armada-388-helios4.dts      |   6 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  |   2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts   |  16 +-
 .../boot/dts/aspeed-bmc-portwell-neptune.dts  |   2 +
 arch/arm/boot/dts/dove-sbc-a510.dts           |   1 +
 arch/arm/boot/dts/imx6q-b450v3.dts            |  14 +-
 arch/arm/boot/dts/imx6q-b650v3.dts            |  12 +-
 arch/arm/boot/dts/imx6q-b850v3.dts            |   4 +-
 arch/arm/boot/dts/imx6q-bx50v3.dtsi           |  12 +-
 .../boot/dts/mediatek/pumpkin-common.dtsi     |  28 +--
 .../boot/dts/renesas/r8a77951-salvator-xs.dts |   2 +-
 .../boot/dts/renesas/r8a77965-salvator-xs.dts |   2 +-
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi      |  14 +-
 .../dts/ti/k3-j721e-common-proc-board.dts     |   4 +-
 .../boot/dts/xilinx/zynqmp-zcu102-revA.dts    |   8 +-
 24 files changed, 314 insertions(+), 227 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-max732x.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml

-- 
2.17.1

