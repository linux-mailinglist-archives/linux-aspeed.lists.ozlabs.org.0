Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EC8698DEC
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 08:42:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHRjg0bZKz3cMj
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 18:42:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RUszN14Y;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RUszN14Y;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHRjR2ypdz3cKv
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 18:42:03 +1100 (AEDT)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 3FC012024A; Thu, 16 Feb 2023 15:42:01 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676533321;
	bh=nEz8ZwbZq4uv4GNC68L/J2QzHskqfAQiUHEbxZNxSGE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RUszN14YWY6naxENAcAJoIIZQBU49k8A+C7WnAEzCiiPM8+BW/Z13Jl1hZpfDl6Ce
	 etUM/dvOr32V40DqnICZr1mg+dwXD93fUIP3qTiNGnsiy/1ZGEQ6sMdUQmRMx5GWvI
	 fmqmwR86cw61Cuhyuj7+UsoHb0F06BOPLJ7Gnr8khlgCk1RdrAn2O3nNRH2c1N4xO2
	 DPKA98xMF1VMbQn6hBf3NI9/Jr0mZoOHnan/QS7YmDEkfeULWADJKFNPBS/ThQuNs/
	 QA5gRpsFIbfOpugPM7AR8Z5cBnqNloHpoMhKZGnVHth505qvPgUYCRg2cZ72UQYBMp
	 szJtg+HZfiyzw==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Subject: [PATCH 2/4] i3c: dw: Add platform operations
Date: Thu, 16 Feb 2023 15:41:53 +0800
Message-Id: <eb90bc9ee9f72efc2012abce3e4e50186552e194.1676532146.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676532146.git.jk@codeconstruct.com.au>
References: <cover.1676532146.git.jk@codeconstruct.com.au>
MIME-Version: 1.0
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
Cc: Vitor Soares <ivitro@gmail.com>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The dw i3c core can be integrated into various SoC devices. Platforms
that use this core may need a little configuration that is specific to
that platform.

Add a little infrastructure to allow platform-specific behaviour: a bit
of data on struct dw_i3c_master, and two hooks to the probe and init
calls to enable this.

A future change will add new platform support that uses these hooks.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 drivers/i3c/master/dw-i3c-master.c | 42 +++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d73d57362b3b..49b891449222 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -241,6 +241,17 @@ struct dw_i3c_master {
 	char version[5];
 	char type[5];
 	u8 addrs[MAX_DEVS];
+
+	/* platform-specific data */
+	const struct dw_i3c_platform_ops *platform_ops;
+	union {
+	} pdata;
+
+};
+
+struct dw_i3c_platform_ops {
+	int (*probe)(struct dw_i3c_master *i3c, struct platform_device *pdev);
+	int (*init)(struct dw_i3c_master *i3c);
 };
 
 struct dw_i3c_i2c_dev_data {
@@ -612,6 +623,12 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 	u32 thld_ctrl;
 	int ret;
 
+	if (master->platform_ops && master->platform_ops->init) {
+		ret = master->platform_ops->init(master);
+		if (ret)
+			return ret;
+	}
+
 	switch (bus->mode) {
 	case I3C_BUS_MODE_MIXED_FAST:
 	case I3C_BUS_MODE_MIXED_LIMITED:
@@ -1128,8 +1145,15 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 	.i2c_xfers = dw_i3c_master_i2c_xfers,
 };
 
+static const struct of_device_id dw_i3c_master_of_match[] = {
+	{ .compatible = "snps,dw-i3c-master-1.00a", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
+
 static int dw_i3c_probe(struct platform_device *pdev)
 {
+	const struct of_device_id *match;
 	struct dw_i3c_master *master;
 	int ret, irq;
 
@@ -1181,6 +1205,18 @@ static int dw_i3c_probe(struct platform_device *pdev)
 	master->maxdevs = ret >> 16;
 	master->free_pos = GENMASK(master->maxdevs - 1, 0);
 
+	/* match any platform-specific ops */
+	match = of_match_node(dw_i3c_master_of_match, pdev->dev.of_node);
+	if (match && match->data)
+		master->platform_ops = match->data;
+
+	/* platform-specific probe */
+	if (master->platform_ops && master->platform_ops->probe) {
+		ret = master->platform_ops->probe(master, pdev);
+		if (ret)
+			goto err_assert_rst;
+	}
+
 	ret = i3c_master_register(&master->base, &pdev->dev,
 				  &dw_mipi_i3c_ops, false);
 	if (ret)
@@ -1213,12 +1249,6 @@ static int dw_i3c_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id dw_i3c_master_of_match[] = {
-	{ .compatible = "snps,dw-i3c-master-1.00a", },
-	{},
-};
-MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
-
 static struct platform_driver dw_i3c_driver = {
 	.probe = dw_i3c_probe,
 	.remove = dw_i3c_remove,
-- 
2.39.1

