Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFDACBA31
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Oct 2019 14:18:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46l8711d8QzDqfK
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Oct 2019 22:18:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.73.110; helo=18.mo6.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1050 seconds by postgrey-1.36 at bilbo;
 Fri, 04 Oct 2019 22:18:45 AEST
Received: from 18.mo6.mail-out.ovh.net (18.mo6.mail-out.ovh.net
 [46.105.73.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46l86s6MFMzDqdm
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Oct 2019 22:18:44 +1000 (AEST)
Received: from player792.ha.ovh.net (unknown [10.109.143.232])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 4CE9F1E4316
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Oct 2019 14:01:43 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id 59679AA65F0C;
 Fri,  4 Oct 2019 12:01:28 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 07/16] mtd: spi-nor: aspeed: Add support for the 4B opcodes
Date: Fri,  4 Oct 2019 13:59:10 +0200
Message-Id: <20191004115919.20788-8-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004115919.20788-1-clg@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3794001212520238003
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

Switch the default controller value to use the read mode in order to
customize the command and use SPINOR_OP_READ_4B (0x13) when the chip
supports 4B opcodes.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 1c1822a13407..add95a9aca76 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -888,14 +888,21 @@ static u32 aspeed_smc_default_read(struct aspeed_smc_chip *chip)
 	 */
 	u32 ctl_mask = chip->controller->info == &spi_2400_info ?
 		 CONTROL_IO_ADDRESS_4B : 0;
+	u8 cmd = chip->nor.flags & SNOR_F_4B_OPCODES ? SPINOR_OP_READ_4B :
+		SPINOR_OP_READ;
 
+	/*
+	 * Use the "read command" mode to customize the opcode. In
+	 * normal command mode, the value is necessarily READ (0x3) on
+	 * the AST2400/2500 SoCs.
+	 */
 	return (chip->ctl_val[smc_read] & ctl_mask) |
 		(0x00 << 28) | /* Single bit */
 		(0x00 << 24) | /* CE# max */
-		(0x03 << 16) | /* use normal reads */
+		(cmd  << 16) | /* use read mode to support 4B opcode */
 		(0x00 <<  8) | /* HCLK/16 */
 		(0x00 <<  6) | /* no dummy cycle */
-		(0x00);        /* normal mode */
+		(0x01);        /* read mode */
 }
 
 static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
-- 
2.21.0

