Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D76CB9D0
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Oct 2019 14:05:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46l7qH2Q5zzDqf1
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Oct 2019 22:05:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.75.26; helo=8.mo179.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 297 seconds by postgrey-1.36 at bilbo;
 Fri, 04 Oct 2019 22:05:08 AEST
Received: from 8.mo179.mail-out.ovh.net (8.mo179.mail-out.ovh.net
 [46.105.75.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46l7q83YKtzDqd7
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Oct 2019 22:05:05 +1000 (AEST)
Received: from player792.ha.ovh.net (unknown [10.109.146.173])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 6BB651446B5
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Oct 2019 13:59:47 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id DB408AA655F6;
 Fri,  4 Oct 2019 11:59:29 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 00/16] mtd: spi-nor: aspeed: AST2600 support and extensions
Date: Fri,  4 Oct 2019 13:59:03 +0200
Message-Id: <20191004115919.20788-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3761068641438567347
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrhedugdegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

This series first extends the support for the Aspeed AST2500 and
AST2400 SMC driver. It adds Dual Data support and read training giving
the best read settings for a given chip. Support for the new AST2600
SoC is added at the end.

I understand that a new spi_mem framework exists and I do have an
experimental driver using it. But unfortunately, it is difficult to
integrate the read training. The Aspeed constraints are not compatible
and i haven't had the time to extend the current framework.

This patchset has been in use for some time in the OpenBMC kernel on
these systems :

 * OpenPOWER Palmetto (AST2400)
 * Evaluation board (AST2500) 
 * OpenPOWER Witherspoon (AST2500)
 * OpenPOWER Romulus (AST2500)
 * OpenPOWER Zaius (AST2500)
   and many others
 
and it is now in use on these boards with the new SoC :

 * Evaluation board (AST2600) 
 * Tacoma board (AST2600) 

Thanks,

C.

Alexander Soldatov (1):
  mtd: spi-nor: fix options for mx66l51235f

Cédric Le Goater (15):
  mtd: spi-nor: aspeed: Use command mode for reads
  mtd: spi-nor: aspeed: Add support for SPI dual IO read mode
  mtd: spi-nor: aspeed: Link controller with the ahb clock
  mtd: spi-nor: aspeed: Add read training
  mtd: spi-nor: aspeed: Limit the maximum SPI frequency
  mtd: spi-nor: aspeed: Add support for the 4B opcodes
  mtd: spi-nor: Add support for w25q512jv
  mtd: spi-nor: aspeed: Introduce a field for the AHB physical address
  mtd: spi-nor: aspeed: Introduce segment operations
  dt-bindings: mtd: aspeed-smc: Add new comptatible for AST2600
  mtd: spi-nor: aspeed: Add initial support for the AST2600
  mtd: spi-nor: aspeed: Check for disabled segments on the AST2600
  mtd: spi-nor: aspeed: Introduce training operations per platform
  mtd: spi-nor: aspeed: Introduce a HCLK mask for training
  mtd: spi-nor: aspeed: Add read training support for the AST2600

 drivers/mtd/spi-nor/aspeed-smc.c              | 593 ++++++++++++++++--
 drivers/mtd/spi-nor/spi-nor.c                 |   5 +-
 .../devicetree/bindings/mtd/aspeed-smc.txt    |   2 +
 3 files changed, 551 insertions(+), 49 deletions(-)

-- 
2.21.0

