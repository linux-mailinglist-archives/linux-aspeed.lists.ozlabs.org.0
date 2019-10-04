Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CE9CBA00
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Oct 2019 14:10:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46l7x6242qzDqfY
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Oct 2019 22:10:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.33.251.175; helo=3.mo179.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 418 seconds by postgrey-1.36 at bilbo;
 Fri, 04 Oct 2019 22:10:11 AEST
Received: from 3.mo179.mail-out.ovh.net (3.mo179.mail-out.ovh.net
 [178.33.251.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46l7wz67PrzDqfP
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Oct 2019 22:10:08 +1000 (AEST)
Received: from player792.ha.ovh.net (unknown [10.109.159.69])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 6657F1428E3
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Oct 2019 14:00:04 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id 0561EAA656D0;
 Fri,  4 Oct 2019 11:59:46 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 01/16] mtd: spi-nor: aspeed: Use command mode for reads
Date: Fri,  4 Oct 2019 13:59:04 +0200
Message-Id: <20191004115919.20788-2-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004115919.20788-1-clg@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3766135191457794995
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

When reading flash contents, try to read from the AHB window
configured for the flash module. This is called the "command mode" on
Aspeed SoC SMC controllers. If the window is not big enough, because
of HW issues, fall back to the "user mode" to perform the read.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 009c1da8574c..148bbc934efc 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -398,6 +398,31 @@ static ssize_t aspeed_smc_write_user(struct spi_nor *nor, loff_t to,
 	return len;
 }
 
+static ssize_t aspeed_smc_read(struct spi_nor *nor, loff_t from, size_t len,
+			       u_char *read_buf)
+{
+	struct aspeed_smc_chip *chip = nor->priv;
+
+	/*
+	 * The AHB window configured for the chip is too small for the
+	 * read offset. Use the "User mode" of the controller to
+	 * perform the read.
+	 */
+	if (from >= chip->ahb_window_size) {
+		aspeed_smc_read_user(nor, from, len, read_buf);
+		goto out;
+	}
+
+	/*
+	 * Use the "Command mode" to do a direct read from the AHB
+	 * window configured for the chip. This should be the default.
+	 */
+	memcpy_fromio(read_buf, chip->ahb_base + from, len);
+
+out:
+	return len;
+}
+
 static int aspeed_smc_unregister(struct aspeed_smc_controller *controller)
 {
 	struct aspeed_smc_chip *chip;
@@ -739,6 +764,7 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 	}
 
 	chip->ctl_val[smc_read] |= cmd |
+		chip->nor.read_opcode << CONTROL_COMMAND_SHIFT |
 		CONTROL_IO_DUMMY_SET(chip->nor.read_dummy / 8);
 
 	dev_dbg(controller->dev, "base control register: %08x\n",
@@ -805,7 +831,7 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 		nor->dev = dev;
 		nor->priv = chip;
 		spi_nor_set_flash_node(nor, child);
-		nor->read = aspeed_smc_read_user;
+		nor->read = aspeed_smc_read;
 		nor->write = aspeed_smc_write_user;
 		nor->read_reg = aspeed_smc_read_reg;
 		nor->write_reg = aspeed_smc_write_reg;
-- 
2.21.0

