Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE74F5473D4
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Jun 2022 12:39:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKvTy1w0bz3c7d
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Jun 2022 20:39:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKvTt1qHCz3bnr;
	Sat, 11 Jun 2022 20:39:46 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4LKvTq5Txzz4xXh;
	Sat, 11 Jun 2022 20:39:43 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LKvTg4kn6z4xXg;
	Sat, 11 Jun 2022 20:39:35 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org
Subject: [PATCH] spi: aspeed: Fix division by zero
Date: Sat, 11 Jun 2022 12:39:29 +0200
Message-Id: <20220611103929.1484062-1-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Ian Woloschin <ian.woloschin@akamai.com>, Pratyush Yadav <p.yadav@ti.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

When using the normal read operation for data transfers, the dummy bus
width is zero. In that case, they are no dummy bytes to transfer and
setting the dummy field in the controller register becomes useless.

Issue was found on a custom "Bifrost" board with a AST2500 SoC and
using a MX25L51245GMI-08G SPI Flash.

Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Reported-by: Ian Woloschin <ian.woloschin@akamai.com>
Fixes: 54613fc6659b ("spi: aspeed: Add support for direct mapping")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/spi/spi-aspeed-smc.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 496f3e1e9079..3e891bf22470 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -558,6 +558,14 @@ static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
 	u32 ctl_val;
 	int ret = 0;
 
+	dev_dbg(aspi->dev,
+		"CE%d %s dirmap [ 0x%.8llx - 0x%.8llx ] OP %#x mode:%d.%d.%d.%d naddr:%#x ndummies:%#x\n",
+		chip->cs, op->data.dir == SPI_MEM_DATA_IN ? "read" : "write",
+		desc->info.offset, desc->info.offset + desc->info.length,
+		op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
+		op->dummy.buswidth, op->data.buswidth,
+		op->addr.nbytes, op->dummy.nbytes);
+
 	chip->clk_freq = desc->mem->spi->max_speed_hz;
 
 	/* Only for reads */
@@ -574,9 +582,11 @@ static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
 	ctl_val = readl(chip->ctl) & ~CTRL_IO_CMD_MASK;
 	ctl_val |= aspeed_spi_get_io_mode(op) |
 		op->cmd.opcode << CTRL_COMMAND_SHIFT |
-		CTRL_IO_DUMMY_SET(op->dummy.nbytes / op->dummy.buswidth) |
 		CTRL_IO_MODE_READ;
 
+	if (op->dummy.nbytes)
+		ctl_val |= CTRL_IO_DUMMY_SET(op->dummy.nbytes / op->dummy.buswidth);
+
 	/* Tune 4BYTE address mode */
 	if (op->addr.nbytes) {
 		u32 addr_mode = readl(aspi->regs + CE_CTRL_REG);
-- 
2.35.3

