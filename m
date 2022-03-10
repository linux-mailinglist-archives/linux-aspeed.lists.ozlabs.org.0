Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C144D3DE1
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Mar 2022 01:07:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDTrf4WwRz3bWf
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Mar 2022 11:06:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HcyGOemh;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HcyGOemh; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDTrT1nJKz2xtp
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Mar 2022 11:06:49 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id g19so3637361pfc.9
 for <linux-aspeed@lists.ozlabs.org>; Wed, 09 Mar 2022 16:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ecoCAWmCAhUla5p6wB0ZNMD7/ItzoQDPKB6CkD1FiJU=;
 b=HcyGOemhntflTA9db6hp8iBOE+cYdAFucJwq2zKDFt6adh2H3niBPlG9lUoqj33rZI
 pjKetC+dCW8fJlSS1/PNrP+LpWGff7OTWSHwaeNYj6+DOyZzZV0X7VJxJzNUYxReqtzn
 kHhnCuXLqJGEXok4SiiKSU/SoXVsPWmP5CidEl8ffVvAHFy4tIBVvn/tBgcGyja9CD3c
 TIcdaTfwCJt5YfVu4ysc9CtKkFFhpHY2xrMl2sDsZ6EF2KYJEbpOTZdZtm+4KmkjiKeV
 Od4Z6zwcOw1aMmHj4hp9BFV3WJ8erO/ODJfghGMGG+wa8P9JfLsgWAhomQTH5Ci8Q1+6
 4R6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ecoCAWmCAhUla5p6wB0ZNMD7/ItzoQDPKB6CkD1FiJU=;
 b=xLHJs4QkoA3hEJcjTAs0o/y/clBHTSQh2E69Q0DY3xmZ1/t3+JMuf15yLHdgUjKJwD
 hi+vYV5+f8GnNYJW2005VTkS5RNxJPy74LyVuImdxtt4RnI3Ao0KaBKRozThobJ+/rYi
 EoPrZdNt1aVjKMgyBWBSzRJDojdl6iifFPZm1gcVnx2lE1RLXIX87lKG7qMeAkJf64sw
 HHy9sa3Locfrn1PJBuVBdfubEaqmYqXm73kA65TEv8c2+iTlispvhyoO+BxAomZKo3X6
 aoqWgTBEuazAYocvzNjOVjrD5HHCjyQY5lYo/pp6MqzcbN/uF2y0ROV/hS4UjQ1gyNIU
 CcYA==
X-Gm-Message-State: AOAM531HsMTzywTetOlfVv9Ju9GZ0CiAPS6FMbOrYQu7M0LKZJNEp7wa
 3zo3O3BnyLCGXONkFnWgg6o=
X-Google-Smtp-Source: ABdhPJwZt7V7Rky3/B3OEnLK8Sych0iLRtte6CgeCT/BUS4V6i2BtEPOiGwDArCjmy4sMOYRAIUR8w==
X-Received: by 2002:a63:17:0:b0:37f:f283:24b with SMTP id
 23-20020a630017000000b0037ff283024bmr1805632pga.407.1646870807951; 
 Wed, 09 Mar 2022 16:06:47 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a056a001a0600b004f2a4316a0asm4213405pfv.60.2022.03.09.16.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 16:06:47 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 2/2] ARM: soc: aspeed: Add secure boot controller support
Date: Thu, 10 Mar 2022 10:36:29 +1030
Message-Id: <20220310000629.119699-3-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220310000629.119699-1-joel@jms.id.au>
References: <20220310000629.119699-1-joel@jms.id.au>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This reads out the status of the secure boot controller and exposes it
in debugfs.

An example on a AST2600A3 QEMU model:

 # grep -r . /sys/kernel/debug/aspeed/*
 /sys/kernel/debug/aspeed/sbc/abr_image:0
 /sys/kernel/debug/aspeed/sbc/low_security_key:0
 /sys/kernel/debug/aspeed/sbc/otp_protected:0
 /sys/kernel/debug/aspeed/sbc/secure_boot:1
 /sys/kernel/debug/aspeed/sbc/uart_boot:0

On boot the state of the system according to the secure boot controller
will be printed:

 [    0.037634] AST2600 secure boot enabled

or

 [    0.037935] AST2600 secure boot disabled

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
  - Place files in aspeed/sbc
  - Check for error when creating directory
  - Print secure boot message even if debugfs is disabled
---
 drivers/soc/aspeed/aspeed-sbc.c | 73 +++++++++++++++++++++++++++++++++
 drivers/soc/aspeed/Kconfig      |  7 ++++
 drivers/soc/aspeed/Makefile     |  1 +
 3 files changed, 81 insertions(+)
 create mode 100644 drivers/soc/aspeed/aspeed-sbc.c

diff --git a/drivers/soc/aspeed/aspeed-sbc.c b/drivers/soc/aspeed/aspeed-sbc.c
new file mode 100644
index 000000000000..be4497b418c4
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-sbc.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright 2022 IBM Corp. */
+
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/debugfs.h>
+
+#define SEC_STATUS		0x14
+#define ABR_IMAGE_SOURCE	BIT(13)
+#define OTP_PROTECTED		BIT(8)
+#define LOW_SEC_KEY		BIT(7)
+#define SECURE_BOOT		BIT(6)
+#define UART_BOOT		BIT(5)
+
+struct sbe {
+	u8 abr_image;
+	u8 low_security_key;
+	u8 otp_protected;
+	u8 secure_boot;
+	u8 invert;
+	u8 uart_boot;
+};
+
+static struct sbe sbe;
+
+static int __init aspeed_sbc_init(void)
+{
+	struct device_node *np;
+	void __iomem *base;
+	struct dentry *sbc_dir;
+	u32 security_status;
+
+	/* AST2600 only */
+	np = of_find_compatible_node(NULL, NULL, "aspeed,ast2600-sbc");
+	if (!of_device_is_available(np))
+		return -ENODEV;
+
+	base = of_iomap(np, 0);
+	if (!base) {
+		of_node_put(np);
+		return -ENODEV;
+	}
+
+	security_status = readl(base + SEC_STATUS);
+
+	iounmap(base);
+	of_node_put(np);
+
+	sbe.abr_image = !!(security_status & ABR_IMAGE_SOURCE);
+	sbe.low_security_key = !!(security_status & LOW_SEC_KEY);
+	sbe.otp_protected = !!(security_status & OTP_PROTECTED);
+	sbe.secure_boot = !!(security_status & SECURE_BOOT);
+	/* Invert the bit, as 1 is boot from SPI/eMMC */
+	sbe.uart_boot =  !(security_status & UART_BOOT);
+
+	pr_info("AST2600 secure boot %s\n", sbe.secure_boot ? "enabled" : "disabled");
+
+	sbc_dir = debugfs_create_dir("sbc", arch_debugfs_dir);
+	if (IS_ERR(sbc_dir))
+		return PTR_ERR(sbc_dir);
+
+	debugfs_create_u8("abr_image", 0444, sbc_dir, &sbe.abr_image);
+	debugfs_create_u8("low_security_key", 0444, sbc_dir, &sbe.low_security_key);
+	debugfs_create_u8("otp_protected", 0444, sbc_dir, &sbe.otp_protected);
+	debugfs_create_u8("uart_boot", 0444, sbc_dir, &sbe.uart_boot);
+	debugfs_create_u8("secure_boot", 0444, sbc_dir, &sbe.secure_boot);
+
+	return 0;
+}
+
+subsys_initcall(aspeed_sbc_init);
diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index f941c41b84dc..aaf4596ae4f9 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -62,6 +62,13 @@ config ASPEED_XDMA
 	  SoCs. The XDMA engine can perform PCIe DMA operations between the BMC
 	  and a host processor.
 
+config ASPEED_SBC
+	bool "ASPEED Secure Boot Controller driver"
+	default MACH_ASPEED_G6
+	help
+	  Say yes to provide information about the secure boot controller in
+	  debugfs.
+
 endmenu
 
 endif
diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
index 8fb73cede4bf..9e275fd1d54d 100644
--- a/drivers/soc/aspeed/Makefile
+++ b/drivers/soc/aspeed/Makefile
@@ -4,4 +4,5 @@ obj-$(CONFIG_ASPEED_LPC_SNOOP)		+= aspeed-lpc-snoop.o
 obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
 obj-$(CONFIG_ASPEED_P2A_CTRL)		+= aspeed-p2a-ctrl.o
 obj-$(CONFIG_ASPEED_SOCINFO)		+= aspeed-socinfo.o
+obj-$(CONFIG_ASPEED_SBC)		+= aspeed-sbc.o
 obj-$(CONFIG_ASPEED_XDMA)	+= aspeed-xdma.o
-- 
2.34.1

