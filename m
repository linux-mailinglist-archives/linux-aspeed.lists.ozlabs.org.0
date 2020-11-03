Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9271E2A3D93
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Nov 2020 08:23:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQLq50Q3dzDqWK
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Nov 2020 18:23:13 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chin-ting_kuo@aspeedtech.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQLpW5QH2zDqVc
 for <linux-aspeed@lists.ozlabs.org>; Tue,  3 Nov 2020 18:22:41 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 0A37Id5x008355;
 Tue, 3 Nov 2020 15:18:39 +0800 (GMT-8)
 (envelope-from chin-ting_kuo@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 Nov
 2020 15:22:11 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <clg@kaod.org>, <bbrezillon@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-spi@vger.kernel.org>
Subject: [v2 0/4] Porting ASPEED FMC/SPI memory controller driver
Date: Tue, 3 Nov 2020 15:21:58 +0800
Message-ID: <20201103072202.24705-1-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0A37Id5x008355
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
Cc: BMC-SW@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This patch series aims to porting ASPEED FMC/SPI memory controller
driver with spi-mem interface. Adjust device tree setting of SPI NOR
flash in order to fit real AST2600 EVB and new SPI memory controller
driver. Also, this patch has been verified on AST2600-A1 EVB.

v2: Fix sparse warnings reported by kernel test robot <lkp@intel.com>.

Chin-Ting Kuo (4):
  dt-bindings: spi: Add binding file for ASPEED FMC/SPI memory
    controller
  ARM: dts: aspeed: ast2600: Update FMC/SPI controller setting for
    spi-aspeed.c
  ARM: dts: aspeed: ast2600-evb: Adjust SPI flash configuration
  spi: aspeed: Add ASPEED FMC/SPI memory controller driver

 .../bindings/spi/aspeed,spi-aspeed.yaml       |  66 ++
 arch/arm/boot/dts/aspeed-ast2600-evb.dts      |  26 +-
 arch/arm/boot/dts/aspeed-g6.dtsi              |  18 +-
 drivers/spi/Kconfig                           |  10 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-aspeed.c                      | 969 ++++++++++++++++++
 6 files changed, 1080 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/aspeed,spi-aspeed.yaml
 create mode 100644 drivers/spi/spi-aspeed.c

-- 
2.17.1

