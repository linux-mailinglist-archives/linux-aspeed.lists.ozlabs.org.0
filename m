Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5159CBB7D
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Oct 2019 15:19:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46l9Sr59ShzDqfr
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Oct 2019 23:19:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.39.154; helo=5.mo177.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4211 seconds by postgrey-1.36 at bilbo;
 Fri, 04 Oct 2019 23:19:13 AEST
Received: from 5.mo177.mail-out.ovh.net (5.mo177.mail-out.ovh.net
 [46.105.39.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46l9Sd5PmCzDqZn
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Oct 2019 23:19:09 +1000 (AEST)
Received: from player792.ha.ovh.net (unknown [10.109.146.163])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id CF05010D0C8
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Oct 2019 14:02:15 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id 5F7C8AA66000;
 Fri,  4 Oct 2019 12:02:00 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 09/16] mtd: spi-nor: aspeed: Introduce a field for the AHB
 physical address
Date: Fri,  4 Oct 2019 13:59:12 +0200
Message-Id: <20191004115919.20788-10-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004115919.20788-1-clg@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3803008413523086259
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrhedugdegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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

On the AST2600, we will use this field to compute the address of the
chip AHB window from the Segment Register value. It also removes the
need of aspeed_smc_ahb_base_phy() helper.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index add95a9aca76..c5a0c8d94371 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -121,7 +121,8 @@ struct aspeed_smc_controller {
 	struct mutex mutex;			/* controller access mutex */
 	const struct aspeed_smc_info *info;	/* type info of controller */
 	void __iomem *regs;			/* controller registers */
-	void __iomem *ahb_base;			/* per-chip windows resource */
+	void __iomem *ahb_base;			/* per-chip window resource */
+	u32 ahb_base_phy;			/* phys addr of AHB window  */
 	u32 ahb_window_size;			/* full mapping window size */
 
 	unsigned long	clk_frequency;
@@ -533,21 +534,13 @@ static void __iomem *aspeed_smc_chip_base(struct aspeed_smc_chip *chip,
 	return controller->ahb_base + offset;
 }
 
-static u32 aspeed_smc_ahb_base_phy(struct aspeed_smc_controller *controller)
-{
-	u32 seg0_val = readl(SEGMENT_ADDR_REG(controller, 0));
-
-	return SEGMENT_ADDR_START(seg0_val);
-}
-
 static u32 chip_set_segment(struct aspeed_smc_chip *chip, u32 cs, u32 start,
 			    u32 size)
 {
 	struct aspeed_smc_controller *controller = chip->controller;
 	void __iomem *seg_reg;
-	u32 seg_oldval, seg_newval, ahb_base_phy, end;
-
-	ahb_base_phy = aspeed_smc_ahb_base_phy(controller);
+	u32 seg_oldval, seg_newval, end;
+	u32 ahb_base_phy = controller->ahb_base_phy;
 
 	seg_reg = SEGMENT_ADDR_REG(controller, cs);
 	seg_oldval = readl(seg_reg);
@@ -636,7 +629,7 @@ static u32 aspeed_smc_chip_set_segment(struct aspeed_smc_chip *chip)
 			 chip->cs, size >> 20);
 	}
 
-	ahb_base_phy = aspeed_smc_ahb_base_phy(controller);
+	ahb_base_phy = controller->ahb_base_phy;
 
 	/*
 	 * As a start address for the current segment, use the default
@@ -1158,6 +1151,7 @@ static int aspeed_smc_probe(struct platform_device *pdev)
 		return PTR_ERR(controller->regs);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	controller->ahb_base_phy = res->start;
 	controller->ahb_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(controller->ahb_base))
 		return PTR_ERR(controller->ahb_base);
-- 
2.21.0

