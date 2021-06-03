Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6EA399ECC
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Jun 2021 12:19:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwhhM6hw2z3021
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Jun 2021 20:19:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=steven_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwhhC3zrxz2yxS
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Jun 2021 20:19:05 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 153A4udU044855;
 Thu, 3 Jun 2021 18:04:56 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from slee-VirtualBox.localdomain (192.168.100.253) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Jun 2021 18:18:23 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, "open list:GPIO
 SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/5] ASPEED sgpio driver enhancement.
Date: Thu, 3 Jun 2021 18:18:16 +0800
Message-ID: <20210603101822.9645-1-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 153A4udU044855
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
Cc: steven_lee@aspeedtech.com, Hongweiz@ami.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
with 80 pins, AST2500/AST2400 SoC has 1 SGPIO master interface that
supports up to 80 pins.
In the current driver design, the max number of sgpio pins is hardcoded
in macro MAX_NR_HW_SGPIO and the value is 80.

For supporting sgpio master interfaces of AST2600 SoC, the patch series
contains the following enhancement:
- Convert txt dt-bindings to yaml.
- Update aspeed-g6 dtsi to support the enhanced sgpio.
- Define max number of gpio pins in ast2600 platform data. Old chip
  uses the original hardcoded value.
- Support muiltiple SGPIO master interfaces.
- Support up to 128 pins.
- Support wdt reset tolerance.
- Fix irq_chip issues which causes multiple sgpio devices use the same
  irq_chip data.

Changes from v2:
* Remove maximum/minimum of ngpios from bindings.
* Remove max-ngpios from bindings and dtsi.
* Remove ast2400-sgpiom and ast2500-sgpiom compatibles from dts and
  driver.
* Add ast2600-sgpiom1 and ast2600-sgpiom2 compatibles as their max
  number of available gpio pins are different.
* Modify functions to pass aspeed_sgpio struct instead of passing
  max_ngpios.
* Split sgpio driver patch to 3 patches

Changes from v1:
* Fix yaml format issues.
* Fix issues reported by kernel test robot.

Please help to review.

Thanks,
Steven

Steven Lee (5):
  dt-bindings: aspeed-sgpio: Convert txt bindings to yaml.
  ARM: dts: aspeed-g6: Add SGPIO node.
  gpio: gpio-aspeed-sgpio: Add AST2600 sgpio support
  gpio: gpio-aspeed-sgpio: Add set_config function
  gpio: gpio-aspeed-sgpio: Move irq_chip to aspeed-sgpio struct

 .../bindings/gpio/aspeed,sgpio.yaml           |  78 ++++++++
 .../devicetree/bindings/gpio/sgpio-aspeed.txt |  46 -----
 arch/arm/boot/dts/aspeed-g6.dtsi              |  30 +++
 drivers/gpio/gpio-aspeed-sgpio.c              | 182 +++++++++++++-----
 4 files changed, 243 insertions(+), 93 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt

-- 
2.17.1

