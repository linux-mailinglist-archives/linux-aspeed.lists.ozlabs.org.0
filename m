Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5013AB00E
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Jun 2021 11:45:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5HGy6f8kz3bsW
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Jun 2021 19:45:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=jamin_lin@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5HGv3BRhz30Ff
 for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Jun 2021 19:45:24 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 15H9U8Ja024573;
 Thu, 17 Jun 2021 17:30:08 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 17 Jun
 2021 17:44:31 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@aj.id.au>, Philipp Zabel <p.zabel@pengutronix.de>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, Jean Delvare
 <jdelvare@suse.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@canonical.com>, Khalil Blaiech
 <kblaiech@mellanox.com>, Yicong Yang <yangyicong@hisilicon.com>,
 =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>, Mike Rapoport
 <rppt@kernel.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ASPEED MACHINE
 SUPPORT" <linux-aspeed@lists.ozlabs.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] *** Support ASPEED AST2600 I2C ***
Date: Thu, 17 Jun 2021 17:43:37 +0800
Message-ID: <20210617094424.27123-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 15H9U8Ja024573
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
Cc: steven_lee@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Support I2C controller of ASPEED AST2600 and
enable the new register set

Jamin Lin (3):
  dts: aspeed: Add node for AST2600 I2C and I2CS
  dt-bindings: i2c-new: Add bindings for AST2600 I2C
  i2c:support new register set for ast2600

 .../bindings/i2c/aspeed,new-i2c.yaml          |  107 +
 arch/arm/boot/dts/aspeed-g6.dtsi              |  150 +-
 drivers/i2c/busses/Kconfig                    |   11 +
 drivers/i2c/busses/Makefile                   |    1 +
 drivers/i2c/busses/ast2600-i2c-global.c       |  205 ++
 drivers/i2c/busses/ast2600-i2c-global.h       |   25 +
 drivers/i2c/busses/i2c-new-aspeed.c           | 1796 +++++++++++++++++
 7 files changed, 2263 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,new-i2c.yaml
 create mode 100644 drivers/i2c/busses/ast2600-i2c-global.c
 create mode 100644 drivers/i2c/busses/ast2600-i2c-global.h
 create mode 100644 drivers/i2c/busses/i2c-new-aspeed.c

-- 
2.17.1

