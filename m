Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E13BFCBA66
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Oct 2019 14:28:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46l8Kx0v9fzDqfq
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Oct 2019 22:28:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=188.165.39.218; helo=6.mo7.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1209 seconds by postgrey-1.36 at bilbo;
 Fri, 04 Oct 2019 22:28:09 AEST
Received: from 6.mo7.mail-out.ovh.net (6.mo7.mail-out.ovh.net [188.165.39.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46l8Kj5nY0zDqf2
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Oct 2019 22:28:05 +1000 (AEST)
Received: from player792.ha.ovh.net (unknown [10.108.54.72])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id CD6DB13333F
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Oct 2019 14:03:06 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id 188B1AA663E2;
 Fri,  4 Oct 2019 12:02:50 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 12/16] mtd: spi-nor: aspeed: Add initial support for the
 AST2600
Date: Fri,  4 Oct 2019 13:59:15 +0200
Message-Id: <20191004115919.20788-13-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004115919.20788-1-clg@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3817363635969362867
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

The HW interface of AST2600 SoC SMC controllers is very similar to the
the AST2500. The AST2600 Firmware Memory Controller is now SPI only.

The Segment Registers also have a different encoding. A 1MB unit is
used and the address range of a flash SPI device is encoded with
offsets in the overall controller window. The previous SoC AST2400 and
AST2500 used absolute addresses. Only bits [27:20] are relevant and
the end address is an upper bound limit.

Read training yet to come.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 68 ++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 7cdd84a2ca82..c977f8f28aef 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -116,6 +116,39 @@ static const struct aspeed_smc_info spi_2500_info = {
 	.segment_reg = aspeed_smc_segment_reg,
 };
 
+static u32 aspeed_smc_segment_start_ast2600(struct aspeed_smc_controller *ctrl,
+					    u32 reg);
+static u32 aspeed_smc_segment_end_ast2600(struct aspeed_smc_controller *ctrl,
+					  u32 reg);
+static u32 aspeed_smc_segment_reg_ast2600(struct aspeed_smc_controller *ctrl,
+					  u32 start, u32 end);
+
+static const struct aspeed_smc_info fmc_2600_info = {
+	.maxsize = 256 * 1024 * 1024,
+	.nce = 3,
+	.hastype = false, /* SPI Only */
+	.we0 = 16,
+	.ctl0 = 0x10,
+	.timing = 0x94,
+	.set_4b = aspeed_smc_chip_set_4b,
+	.segment_start = aspeed_smc_segment_start_ast2600,
+	.segment_end = aspeed_smc_segment_end_ast2600,
+	.segment_reg = aspeed_smc_segment_reg_ast2600,
+};
+
+static const struct aspeed_smc_info spi_2600_info = {
+	.maxsize = 256 * 1024 * 1024,
+	.nce = 2,
+	.hastype = false,
+	.we0 = 16,
+	.ctl0 = 0x10,
+	.timing = 0x94,
+	.set_4b = aspeed_smc_chip_set_4b,
+	.segment_start = aspeed_smc_segment_start_ast2600,
+	.segment_end = aspeed_smc_segment_end_ast2600,
+	.segment_reg = aspeed_smc_segment_reg_ast2600,
+};
+
 enum aspeed_smc_ctl_reg_value {
 	smc_base,		/* base value without mode for other commands */
 	smc_read,		/* command reg for (maybe fast) reads */
@@ -251,6 +284,39 @@ static u32 aspeed_smc_segment_reg(struct aspeed_smc_controller *controller,
 	return (((start >> 23) & 0xFF) << 16) | (((end >> 23) & 0xFF) << 24);
 }
 
+/*
+ * The Segment Registers of the AST2600 have a 1MB unit. The address
+ * range of a flash SPI slave is encoded with offsets in the overall
+ * controller window. The previous SoC AST2400 and AST2500 used
+ * absolute addresses. Only bits [27:20] are relevant and the end
+ * address is an upper bound limit.
+ */
+
+#define AST2600_SEG_ADDR_MASK 0x0ff00000
+
+static u32 aspeed_smc_segment_start_ast2600(struct aspeed_smc_controller *ctlr,
+					    u32 reg)
+{
+	u32 start_offset = (reg << 16) & AST2600_SEG_ADDR_MASK;
+
+	return ctlr->ahb_base_phy + start_offset;
+}
+
+static u32 aspeed_smc_segment_end_ast2600(struct aspeed_smc_controller *ctlr,
+					  u32 reg)
+{
+	u32 end_offset = reg & AST2600_SEG_ADDR_MASK;
+
+	return ctlr->ahb_base_phy + end_offset + 0x100000;
+}
+
+static u32 aspeed_smc_segment_reg_ast2600(struct aspeed_smc_controller *ctlr,
+					  u32 start, u32 end)
+{
+	return ((start & AST2600_SEG_ADDR_MASK) >> 16) |
+		((end - 1) & AST2600_SEG_ADDR_MASK);
+}
+
 /*
  * Switch to turn off read optimisation if needed
  */
@@ -538,6 +604,8 @@ static const struct of_device_id aspeed_smc_matches[] = {
 	{ .compatible = "aspeed,ast2400-spi", .data = &spi_2400_info },
 	{ .compatible = "aspeed,ast2500-fmc", .data = &fmc_2500_info },
 	{ .compatible = "aspeed,ast2500-spi", .data = &spi_2500_info },
+	{ .compatible = "aspeed,ast2600-fmc", .data = &fmc_2600_info },
+	{ .compatible = "aspeed,ast2600-spi", .data = &spi_2600_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, aspeed_smc_matches);
-- 
2.21.0

