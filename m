Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 461ACCBAAA
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Oct 2019 14:39:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46l8bC56LQzDqft
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Oct 2019 22:39:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.33.251.49; helo=2.mo173.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 2.mo173.mail-out.ovh.net (2.mo173.mail-out.ovh.net
 [178.33.251.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46l8b53BKjzDqf9
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Oct 2019 22:39:44 +1000 (AEST)
Received: from player792.ha.ovh.net (unknown [10.109.146.211])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 4799F11B99D
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Oct 2019 14:03:22 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id C8549AA664C7;
 Fri,  4 Oct 2019 12:03:06 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 13/16] mtd: spi-nor: aspeed: Check for disabled segments on
 the AST2600
Date: Fri,  4 Oct 2019 13:59:16 +0200
Message-Id: <20191004115919.20788-14-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004115919.20788-1-clg@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3821867236165716915
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

On the AST2600, the segment of a flash SPI device can be disabled with
zero register value. By default, the CS0 AHB window is open but the
other CS are not. This is closing the access to the flash device in
user mode and also forbids scanning. For multiple CS, we will need
firmware or a DT property to reopen the flash AHB window.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index c977f8f28aef..fad08738e534 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -307,12 +307,20 @@ static u32 aspeed_smc_segment_end_ast2600(struct aspeed_smc_controller *ctlr,
 {
 	u32 end_offset = reg & AST2600_SEG_ADDR_MASK;
 
+	/* segment is disabled */
+	if (!end_offset)
+		return ctlr->ahb_base_phy;
+
 	return ctlr->ahb_base_phy + end_offset + 0x100000;
 }
 
 static u32 aspeed_smc_segment_reg_ast2600(struct aspeed_smc_controller *ctlr,
 					  u32 start, u32 end)
 {
+	/* disable zero size segments */
+	if (start == end)
+		return 0;
+
 	return ((start & AST2600_SEG_ADDR_MASK) >> 16) |
 		((end - 1) & AST2600_SEG_ADDR_MASK);
 }
@@ -656,8 +664,15 @@ static u32 chip_set_segment(struct aspeed_smc_chip *chip, u32 cs, u32 start,
 	 * size, but take into account the possible overlap with the
 	 * previous segment
 	 */
-	if (!size)
-		size = info->segment_end(controller, seg_oldval) - start;
+	if (!size) {
+		end = info->segment_end(controller, seg_oldval);
+
+		/*
+		 * Check for disabled segment (AST2600).
+		 */
+		if (end != ahb_base_phy)
+			size = end - start;
+	}
 
 	/*
 	 * The segment cannot exceed the maximum window size of the
@@ -686,8 +701,8 @@ static u32 chip_set_segment(struct aspeed_smc_chip *chip, u32 cs, u32 start,
 		size = end - start;
 	}
 
-	dev_info(chip->nor.dev, "CE%d window [ 0x%.8x - 0x%.8x ] %dMB",
-		 cs, start, end, size >> 20);
+	dev_info(chip->nor.dev, "CE%d window [ 0x%.8x - 0x%.8x ] %dMB%s",
+		 cs, start, end, size >> 20, size ? "" : " (disabled)");
 
 	return size;
 }
-- 
2.21.0

