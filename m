Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D4A867842
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Feb 2024 15:26:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LRoHTwUS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tk2x145tcz3vf8
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 01:26:29 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LRoHTwUS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tk2vx4sRBz3vfv
	for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Feb 2024 01:25:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708957534; x=1740493534;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lTV4RH4qiS21e5gSPVWYHbVcBJWdPYtUVhU20SXaAR4=;
  b=LRoHTwUSORrj0Bo86SgIHGzds5n4DVvE+6+0x5Vo0h/moJ0QJYFidjFi
   VRaYhZ2ufNKSvl2cRVz1vij5F5ECraG6SJiESEqRZWxr+2uCOzkLeHaYo
   qLxKhZfwyW7Fq4VHeNYG7MlXguHXq22Q0/cil1awSe10cvatx3jEh5r5w
   MouGXyDTpIZXf1jgd8eyZP10mwLnu15Ks5pjFbx9LEcySnMF7oKn23lrh
   Vp3KeJDudTrj5Tsxg1pJ2qBN74+ozKLiUKvKqJEz/vIXvI9Mb3N7FEKM1
   zQ6VMCaBcfT8U7Dd9K7+ei2yRi6QKm4ohJJfeoqBwgdI/oY3q96U2m16r
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3375255"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3375255"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 06:25:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="937030151"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="937030151"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 26 Feb 2024 06:25:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AE687A97; Mon, 26 Feb 2024 16:25:16 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 14/14] serial: 8250_uniphier: Switch to use uart_read_port_properties()
Date: Mon, 26 Feb 2024 16:19:30 +0200
Message-ID: <20240226142514.1485246-15-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20240226142514.1485246-1-andriy.shevchenko@linux.intel.com>
References: <20240226142514.1485246-1-andriy.shevchenko@linux.intel.com>
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
Cc: Scott Branden <sbranden@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Al Cooper <alcooperx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Vladimir Zapolskiy <vz@mleia.com>, Paul Cercueil <paul@crapouillou.net>, Thierry Reding <thierry.reding@gmail.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Jiri Slaby <jirislaby@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Since we have now a common helper to read port properties
use it instead of sparse home grown solution.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_uniphier.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_uniphier.c b/drivers/tty/serial/8250/8250_uniphier.c
index 6399a38ecce2..d3f270a191ee 100644
--- a/drivers/tty/serial/8250/8250_uniphier.c
+++ b/drivers/tty/serial/8250/8250_uniphier.c
@@ -162,7 +162,6 @@ static int uniphier_uart_probe(struct platform_device *pdev)
 	struct uniphier8250_priv *priv;
 	struct resource *regs;
 	void __iomem *membase;
-	int irq;
 	int ret;
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -175,23 +174,12 @@ static int uniphier_uart_probe(struct platform_device *pdev)
 	if (!membase)
 		return -ENOMEM;
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
-
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	memset(&up, 0, sizeof(up));
 
-	ret = of_alias_get_id(dev->of_node, "serial");
-	if (ret < 0) {
-		dev_err(dev, "failed to get alias id\n");
-		return ret;
-	}
-	up.port.line = ret;
-
 	priv->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(priv->clk)) {
 		dev_err(dev, "failed to get clock\n");
@@ -211,7 +199,10 @@ static int uniphier_uart_probe(struct platform_device *pdev)
 	up.port.mapbase = regs->start;
 	up.port.mapsize = resource_size(regs);
 	up.port.membase = membase;
-	up.port.irq = irq;
+
+	ret = uart_read_port_properties(&up.port, true);
+	if (ret)
+		return ret;
 
 	up.port.type = PORT_16550A;
 	up.port.iotype = UPIO_MEM32;
-- 
2.43.0.rc1.1.gbec44491f096

