Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10317600A4A
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Oct 2022 11:18:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MrWd06SxDz3drk
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Oct 2022 20:18:28 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MrWb56Rsvz3c4Q;
	Mon, 17 Oct 2022 20:16:49 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4MrWb55sqhz4xG9;
	Mon, 17 Oct 2022 20:16:49 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MrWb20658z4xGG;
	Mon, 17 Oct 2022 20:16:45 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org
Subject: [PATCH linux v2 3/3] spi: aspeed: Introduce a "ranges" debugfs file
Date: Mon, 17 Oct 2022 11:16:24 +0200
Message-Id: <20221017091624.130227-4-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017091624.130227-1-clg@kaod.org>
References: <20221017091624.130227-1-clg@kaod.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This dumps the mapping windows, or decoding ranges, of all devices
possibly attached of the controller. To be noted that a top level
"spi" debugfs directory is created to hold the intermediate directory
of the driver instance.

Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/spi/spi-aspeed-smc.c | 66 +++++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 75e1d08bbd00..a79e5cc8ac5b 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/debugfs.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
@@ -102,6 +103,9 @@ struct aspeed_spi {
 	u32			 clk_freq;
 
 	struct aspeed_spi_chip	 chips[ASPEED_SPI_MAX_NUM_CS];
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	struct dentry           *debugfs;
+#endif
 };
 
 static u32 aspeed_spi_get_io_mode(const struct spi_mem_op *op)
@@ -716,6 +720,65 @@ static void aspeed_spi_enable(struct aspeed_spi *aspi, bool enable)
 		aspeed_spi_chip_enable(aspi, cs, enable);
 }
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+static int aspeed_spi_ranges_debug_show(struct seq_file *m, void *private)
+{
+	struct aspeed_spi *aspi = m->private;
+	struct aspeed_spi_window windows[ASPEED_SPI_MAX_NUM_CS] = { 0 };
+	u32 cs;
+
+	if (aspi->data == &ast2400_spi_data)
+		return 0;
+
+	aspeed_spi_get_windows(aspi, windows);
+
+	seq_puts(m, "     offset     size       register\n");
+	for (cs = 0; cs < aspi->data->max_cs; cs++) {
+		if (!windows[cs].reg)
+			seq_printf(m, "CE%d: disabled\n", cs);
+		else
+			seq_printf(m, "CE%d: 0x%.8x 0x%.8x 0x%x\n", cs,
+				   windows[cs].offset, windows[cs].size,
+				   windows[cs].reg);
+	}
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(aspeed_spi_ranges_debug);
+
+static int aspeed_spi_debugfs_init(struct spi_controller *ctlr)
+{
+	struct aspeed_spi *aspi = spi_controller_get_devdata(ctlr);
+	struct dentry *rootdir = NULL;
+
+	rootdir = debugfs_lookup("spi", NULL);
+	if (!rootdir)
+		rootdir = debugfs_create_dir("spi", NULL);
+
+	aspi->debugfs = debugfs_create_dir(dev_name(&ctlr->dev), rootdir);
+	if (!aspi->debugfs)
+		return -ENOMEM;
+
+	debugfs_create_file("ranges", 0444, aspi->debugfs, (void *)aspi,
+			    &aspeed_spi_ranges_debug_fops);
+	return 0;
+}
+
+static void aspeed_spi_debugfs_remove(struct aspeed_spi *aspi)
+{
+	debugfs_remove_recursive(aspi->debugfs);
+}
+
+#else
+static inline int aspeed_spi_debugfs_init(struct spi_controller *ctlr)
+{
+	return 0;
+}
+
+static inline void aspeed_spi_debugfs_remove(struct aspeed_spi *aspi)
+{
+}
+#endif /* IS_ENABLED(CONFIG_DEBUG_FS) */
+
 static int aspeed_spi_chip_read_ranges(struct device_node *node, struct aspeed_spi *aspi)
 {
 	const char *range_prop = "ranges";
@@ -845,7 +908,7 @@ static int aspeed_spi_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "spi_register_controller failed\n");
 		goto disable_clk;
 	}
-	return 0;
+	return aspeed_spi_debugfs_init(ctlr);
 
 disable_clk:
 	clk_disable_unprepare(aspi->clk);
@@ -856,6 +919,7 @@ static int aspeed_spi_remove(struct platform_device *pdev)
 {
 	struct aspeed_spi *aspi = platform_get_drvdata(pdev);
 
+	aspeed_spi_debugfs_remove(aspi);
 	aspeed_spi_enable(aspi, false);
 	clk_disable_unprepare(aspi->clk);
 	return 0;
-- 
2.37.3

