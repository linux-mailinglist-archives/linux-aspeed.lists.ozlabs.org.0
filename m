Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF5B265653
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 03:07:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnczq5CgxzDqjp
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 11:07:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=1/dJz17P; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnRSH065RzDrQy
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 03:57:50 +1000 (AEST)
Received: from localhost.localdomain (unknown [194.230.155.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3808820BED;
 Thu, 10 Sep 2020 17:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599760667;
 bh=muQ6zjVn/mf+iXsfCUdXzl3dZG6B8J8l8bbNbkMxaHs=;
 h=From:To:Cc:Subject:Date:From;
 b=1/dJz17PLrZMeRIjQd6sFEAce0o7eu4K+r0dL+zosiqq0luiYlHoWB51FielsPqaO
 Wa3TSJxOyAyZi6SExx28ze23dGlUmJasReiKbjSU4S7it/I5rb2rMggP0mkbcOPGUV
 cSry5a/sdkrgJlogKXiGfjplhGDzzPpiCOwVMjVI=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Tero Kristo <t-kristo@ti.com>,
 Nishanth Menon <nm@ti.com>, Michal Simek <michal.simek@xilinx.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 00/15] ARM: dts: / gpio: Add dtschema for NXP PCA953x and
 correct dts
Date: Thu, 10 Sep 2020 19:57:18 +0200
Message-Id: <20200910175733.11046-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 11 Sep 2020 11:07:01 +1000
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
 .../bindings/gpio/gpio-pca95xx.yaml           | 234 ++++++++++++++++++
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
 24 files changed, 316 insertions(+), 227 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-max732x.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml

-- 
2.17.1

