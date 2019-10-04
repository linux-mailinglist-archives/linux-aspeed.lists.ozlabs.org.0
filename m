Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56122CC10F
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Oct 2019 18:50:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46lG7x4F1dzDqfP
	for <lists+linux-aspeed@lfdr.de>; Sat,  5 Oct 2019 02:50:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=87.98.178.36; helo=5.mo3.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 8427 seconds by postgrey-1.36 at bilbo;
 Sat, 05 Oct 2019 02:49:58 AEST
Received: from 5.mo3.mail-out.ovh.net (5.mo3.mail-out.ovh.net [87.98.178.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46lG7p2HXFzDqdg
 for <linux-aspeed@lists.ozlabs.org>; Sat,  5 Oct 2019 02:49:24 +1000 (AEST)
Received: from player792.ha.ovh.net (unknown [10.108.42.23])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id EE04E22A2BD
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Oct 2019 14:00:19 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id 7A24FAA65865;
 Fri,  4 Oct 2019 12:00:04 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 02/16] mtd: spi-nor: aspeed: Add support for SPI dual IO read
 mode
Date: Fri,  4 Oct 2019 13:59:05 +0200
Message-Id: <20191004115919.20788-3-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004115919.20788-1-clg@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3770357314044005299
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

Implements support for the dual IO read mode on aspeed SMC/FMC
controllers which uses both MISO and MOSI lines for data during a read
to double the read bandwidth.

Based on work from Robert Lippert <roblip@gmail.com>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 56 +++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 148bbc934efc..c775e0612613 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -369,18 +369,49 @@ static void aspeed_smc_send_cmd_addr(struct spi_nor *nor, u8 cmd, u32 addr)
 	}
 }
 
+static int aspeed_smc_get_io_mode(struct aspeed_smc_chip *chip)
+{
+	switch (chip->nor.read_proto) {
+	case SNOR_PROTO_1_1_1:
+		return 0;
+	case SNOR_PROTO_1_1_2:
+		return CONTROL_IO_DUAL_DATA;
+	case SNOR_PROTO_1_2_2:
+		return CONTROL_IO_DUAL_ADDR_DATA;
+	default:
+		dev_err(chip->nor.dev, "unsupported SPI read mode\n");
+		return -EINVAL;
+	}
+}
+
+static void aspeed_smc_set_io_mode(struct aspeed_smc_chip *chip, u32 io_mode)
+{
+	u32 ctl;
+
+	if (io_mode > 0) {
+		ctl = readl(chip->ctl) & ~CONTROL_IO_MODE_MASK;
+		ctl |= io_mode;
+		writel(ctl, chip->ctl);
+	}
+}
+
 static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
 				    size_t len, u_char *read_buf)
 {
 	struct aspeed_smc_chip *chip = nor->priv;
 	int i;
 	u8 dummy = 0xFF;
+	int io_mode = aspeed_smc_get_io_mode(chip);
 
 	aspeed_smc_start_user(nor);
 	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
 	for (i = 0; i < chip->nor.read_dummy / 8; i++)
 		aspeed_smc_write_to_ahb(chip->ahb_base, &dummy, sizeof(dummy));
 
+	/* Set IO mode only for data */
+	if (io_mode == CONTROL_IO_DUAL_DATA)
+		aspeed_smc_set_io_mode(chip, io_mode);
+
 	aspeed_smc_read_from_ahb(read_buf, chip->ahb_base, len);
 	aspeed_smc_stop_user(nor);
 	return len;
@@ -731,6 +762,7 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 {
 	struct aspeed_smc_controller *controller = chip->controller;
 	const struct aspeed_smc_info *info = controller->info;
+	int io_mode;
 	u32 cmd;
 
 	if (chip->nor.addr_width == 4 && info->set_4b)
@@ -753,22 +785,21 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 	 * TODO: Adjust clocks if fast read is supported and interpret
 	 * SPI-NOR flags to adjust controller settings.
 	 */
-	if (chip->nor.read_proto == SNOR_PROTO_1_1_1) {
-		if (chip->nor.read_dummy == 0)
-			cmd = CONTROL_COMMAND_MODE_NORMAL;
-		else
-			cmd = CONTROL_COMMAND_MODE_FREAD;
-	} else {
-		dev_err(chip->nor.dev, "unsupported SPI read mode\n");
-		return -EINVAL;
-	}
+	io_mode = aspeed_smc_get_io_mode(chip);
+	if (io_mode < 0)
+		return io_mode;
 
-	chip->ctl_val[smc_read] |= cmd |
+	if (chip->nor.read_dummy == 0)
+		cmd = CONTROL_COMMAND_MODE_NORMAL;
+	else
+		cmd = CONTROL_COMMAND_MODE_FREAD;
+
+	chip->ctl_val[smc_read] |= cmd | io_mode |
 		chip->nor.read_opcode << CONTROL_COMMAND_SHIFT |
 		CONTROL_IO_DUMMY_SET(chip->nor.read_dummy / 8);
 
-	dev_dbg(controller->dev, "base control register: %08x\n",
-		chip->ctl_val[smc_read]);
+	dev_info(controller->dev, "read control register: %08x\n",
+		 chip->ctl_val[smc_read]);
 	return 0;
 }
 
@@ -778,6 +809,7 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 	const struct spi_nor_hwcaps hwcaps = {
 		.mask = SNOR_HWCAPS_READ |
 			SNOR_HWCAPS_READ_FAST |
+			SNOR_HWCAPS_READ_1_1_2 |
 			SNOR_HWCAPS_PP,
 	};
 	const struct aspeed_smc_info *info = controller->info;
-- 
2.21.0

