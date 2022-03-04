Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8AB4CCC0F
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 04:04:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8t3g44Rqz30DT
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 14:03:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l33fzAci;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=l33fzAci; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8t3W2xlRz2yPF
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Mar 2022 14:03:49 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id bd1so6538851plb.13
 for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Mar 2022 19:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+u2m0rf3cR04lcFpp9V0PIcwkqS7KFjZG1zpqmtcwE8=;
 b=l33fzAciqc+p8oYdc53A5JAEr+lfxeLsxLkb4s+5ZPW19CPt5TqrblmyFIAngemZAs
 NwW9hu/jqRCeTaKPZmFOu8s6t8/Hh6kdefWB13DVbD3KTqMxa4tamT/7/GHIeQsdiuKD
 UdQ2pvdBlYMM2gHTDmMz6E6ne/YS1mEGqxNyi8sn0sk6pbrcCTuDdhQr3DE2xyv9SQer
 +xI9OcV3dlgu1R+faA3cl6E7vO6aKMUaomTQuAHXyZuzIfe32LLJg+RsR38mGmPB+Q6q
 U3L6ii2IQvrpeP4C83xL9RaibbKZIhbujx6dxBFkaptNzq9rivTF717rSFZANHuHqLZT
 ZMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=+u2m0rf3cR04lcFpp9V0PIcwkqS7KFjZG1zpqmtcwE8=;
 b=bDgKgavKHGXjx5TYFWSZcrki0HYboL2OqO8rEH20ZokrUIw37sagNhv7k7N1S0GdxK
 JNe/15YS+lWfeYl/FnHVOQY90mWkbA/MetQvFOpm5MfdQzSn5ubMTbSG+JXIwy51CZo5
 sQoYYtVUltHji5zoRds12lcDwjeME+3iD55cZTSO+j7zmKKFxNL2W/q5MKLdOLC2fCde
 Z+HhQ3IYSnVBwYCnD0QlJ41UPYgGUV6J7Ybghp2BkkE7vM/hmvmZU7w38ABVhujFtt+R
 BlfmPzsZ2wA39isiH6WMCXKkr1bM/ZXlCHaV5k9Fe23o3iE3ug4/WkJTdY7zlrrZFL8D
 KxXg==
X-Gm-Message-State: AOAM5317hFYBwR2O/R1E5SO08CbmVTxdCg91KMtCMo/fDpF8GyNgT/mu
 ws4AEW9AtqfuVjmUeZ3dKQ0=
X-Google-Smtp-Source: ABdhPJzf+DPMVXpUtgHnSgaR8kBwlRjPuPEtNM65T93BHuXf6r6rCLOzeaJVsT2CUwjtjr3kvctttg==
X-Received: by 2002:a17:90a:ff0f:b0:1be:ed25:de99 with SMTP id
 ce15-20020a17090aff0f00b001beed25de99mr8436368pjb.159.1646363026995; 
 Thu, 03 Mar 2022 19:03:46 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a056a00218200b004f6519ce666sm3966978pfi.170.2022.03.03.19.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 19:03:46 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] ARM: soc: aspeed: Add secure boot controller support
Date: Fri,  4 Mar 2022 13:33:36 +1030
Message-Id: <20220304030336.1017197-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This reads out the status of the secure boot controller and exposes it
in debugfs.

An example on a AST2600A3 QEMU model:

 # grep -r . /sys/kernel/debug/aspeed/*
 /sys/kernel/debug/aspeed/abr_image:0
 /sys/kernel/debug/aspeed/low_security_key:0
 /sys/kernel/debug/aspeed/otp_protected:0
 /sys/kernel/debug/aspeed/secure_boot:1
 /sys/kernel/debug/aspeed/uart_boot:0

On boot the state of the system according to the secure boot controller
will be printed:

 [    0.037634] AST2600 secure boot enabled

or

 [    0.037935] AST2600 secure boot disabled

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
We're creating a common API for a subset of this information in sysfs:

 https://lore.kernel.org/all/20220204072234.304543-1-joel@jms.id.au/

However, machines with an ASPEED soc need the detailed information from
the SBE that is not relevant for other systems, so expose it all in
debugfs.

 drivers/soc/aspeed/aspeed-sbc.c | 71 +++++++++++++++++++++++++++++++++
 drivers/soc/aspeed/Kconfig      |  7 ++++
 drivers/soc/aspeed/Makefile     |  1 +
 3 files changed, 79 insertions(+)
 create mode 100644 drivers/soc/aspeed/aspeed-sbc.c

diff --git a/drivers/soc/aspeed/aspeed-sbc.c b/drivers/soc/aspeed/aspeed-sbc.c
new file mode 100644
index 000000000000..ee466f02ae4c
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-sbc.c
@@ -0,0 +1,71 @@
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
+	struct dentry *debugfs_root;
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
+	debugfs_root = debugfs_create_dir("aspeed", NULL);
+	debugfs_create_u8("abr_image", 0444, debugfs_root, &sbe.abr_image);
+	debugfs_create_u8("low_security_key", 0444, debugfs_root, &sbe.low_security_key);
+	debugfs_create_u8("otp_protected", 0444, debugfs_root, &sbe.otp_protected);
+	debugfs_create_u8("uart_boot", 0444, debugfs_root, &sbe.uart_boot);
+	debugfs_create_u8("secure_boot", 0444, debugfs_root, &sbe.secure_boot);
+
+	pr_info("AST2600 secure boot %s\n", sbe.secure_boot ? "enabled" : "disabled");
+
+	return 0;
+}
+
+
+subsys_initcall(aspeed_sbc_init);
diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index f579ee0b5afa..7a2a5bed8bc5 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -52,6 +52,13 @@ config ASPEED_SOCINFO
 	help
 	  Say yes to support decoding of ASPEED BMC information.
 
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
index b35d74592964..042235ffa05b 100644
--- a/drivers/soc/aspeed/Makefile
+++ b/drivers/soc/aspeed/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_ASPEED_LPC_SNOOP)		+= aspeed-lpc-snoop.o
 obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
 obj-$(CONFIG_ASPEED_P2A_CTRL)		+= aspeed-p2a-ctrl.o
 obj-$(CONFIG_ASPEED_SOCINFO)		+= aspeed-socinfo.o
+obj-$(CONFIG_ASPEED_SBC)		+= aspeed-sbc.o
-- 
2.34.1

