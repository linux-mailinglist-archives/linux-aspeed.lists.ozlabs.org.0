Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD7A271EBA
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Sep 2020 11:17:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BvzNh0Q86zDqbw
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Sep 2020 19:17:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OmmennCc; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BvzNJ6t1CzDqTT
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Sep 2020 19:17:04 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id k133so3726205pgc.7
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Sep 2020 02:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GNuvFUCG0UIOJY2lM+ys35a4Bzf9PFRVPqPZ1cJjWa4=;
 b=OmmennCcellYKaDdNl7zydTRmqSGJvqke57LdlRu8hipUWe0MkjM2mkbzQHG70qvNE
 GfeOBhzqODWYc587s9Zv8SeHFeZS77VLJ1hIU8oXzgSLouIC/Ds9cofD96Jmqj2m7SQi
 0vYLhDtlw3eysZTnQX1D6wFPs/aH1mm53IAWSWhV2kn5knaeJo/pslE+ikZOUFDL+aQP
 S0WcAYKgax3/c2CCJiMlRG1lf4gu1SB56H4UG30NKVMiMhQ2IegpDvDKAVh9qEmwQgS8
 V8c+WhaQeXg2qbwRWAavHKowgUCg5klaxEjdXUaumfT6tO3Mtx8S3losM98LlG5Cn/TY
 MSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GNuvFUCG0UIOJY2lM+ys35a4Bzf9PFRVPqPZ1cJjWa4=;
 b=WCwLrQn7XlmN78vEQ3vKoQk4AUfvfkt6oEPPzNcTs3m5ESYZu2DYsabEG8cNwtubfw
 CABTdqChJm7oa2Xr7Sbt3aSmG34U9Ie/xxmfUpHGsOAp0dDvjvwwSL4JIAcJts3pGCA6
 xs01x7rdWuOeUBCqrjR6dhWyldDk3YhFr3Y0tH4nKDoB0VnakZqMZbXNR+imgMsDWV2z
 u9exP5SjyjO0PAjhYgrpHfODvS2EyeqEIehpcrZaDmdmAOqTZFhTPQIfvTstIG0Xwhhm
 IexAyAfJZeyVUvRwSCk6/2TusJL4IdC1FUjdRIgJ45O513otX30ICEb33NTS2l5WONt5
 ntfA==
X-Gm-Message-State: AOAM533IEhJpZ/2O1lhU3NdSVJweOUXQBz0z+Z/X8qwthxSkDdBZJ89i
 JjTMSV0f8FcB0eHI5SlI01xphOdRXoE=
X-Google-Smtp-Source: ABdhPJzb4b2zMjBDsUM7y14Og/FqODWOiOtV0kdQTsYYqtEA9Wqp7E+qdTiza8crZxnbwPMjJuwTEw==
X-Received: by 2002:a63:e94a:: with SMTP id q10mr20675317pgj.189.1600679822211; 
 Mon, 21 Sep 2020 02:17:02 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id gb19sm10105690pjb.38.2020.09.21.02.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 02:17:00 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v3 2/3] soc: aspeed: Add soc info driver
Date: Mon, 21 Sep 2020 18:46:43 +0930
Message-Id: <20200921091644.133107-3-joel@jms.id.au>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921091644.133107-1-joel@jms.id.au>
References: <20200921091644.133107-1-joel@jms.id.au>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This adds a SOC_BUS info driver for the ASPEED platform.

The full ID table is preserved in this commit message in case someone
finds a need to change the implemntation in the future.

	{ "AST1100-A0", 0x00000200 },
	{ "AST1100-A1", 0x00000201 },
	{ "AST1100-A2", 0x00000202 },
	{ "AST1100-A3", 0x00000202 },

	{ "AST2050-A0", 0x00000200 },
	{ "AST2050-A1", 0x00000201 },
	{ "AST2050-A2", 0x00000202 },
	{ "AST2050-A3", 0x00000202 },

	{ "AST2100-A0", 0x00000300 },
	{ "AST2100-A1", 0x00000301 },
	{ "AST2100-A2", 0x00000302 },
	{ "AST2100-A3", 0x00000302 },

	{ "AST2150-A0", 0x00000202 },
	{ "AST2150-A1", 0x00000202 },

	{ "AST2200-A0", 0x00000102 },
	{ "AST2200-A1", 0x00000102 },

	{ "AST2300-A0", 0x01000003 },
	{ "AST2300-A1", 0x01010303 },

	{ "AST1300-A1", 0x01010003 },
	{ "AST1050-A1", 0x01010203 },

	{ "AST2400-A0", 0x02000303 },
	{ "AST2400-A1", 0x02010303 },
	{ "AST1400-A1", 0x02010103 },
	{ "AST1250-A1", 0x02010303 },

	{ "AST2500-A0", 0x04000303 },
	{ "AST2510-A0", 0x04000103 },
	{ "AST2520-A0", 0x04000203 },
	{ "AST2530-A0", 0x04000403 },
	{ "AST2500-A1", 0x04010303 },
	{ "AST2510-A1", 0x04010103 },
	{ "AST2520-A1", 0x04010203 },
	{ "AST2530-A1", 0x04010403 },
	{ "AST2500-A2", 0x04030303 },
	{ "AST2510-A2", 0x04030103 },
	{ "AST2520-A2", 0x04030203 },
	{ "AST2530-A2", 0x04030403 },

	{ "AST2600-A0", 0x05000303 },
	{ "AST2600-A1", 0x05010303 },
	{ "AST2600-A2", 0x05020303 },
	{ "AST2620-A1", 0x05010203 },
	{ "AST2620-A2", 0x05020203 },

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3:
 - Remove unncessary frees
v2:
 - Fix of_node_puts
 - Skip kasprintf where it's not needed
---
 drivers/soc/aspeed/Kconfig          |   7 ++
 drivers/soc/aspeed/Makefile         |   1 +
 drivers/soc/aspeed/aspeed-socinfo.c | 133 ++++++++++++++++++++++++++++
 3 files changed, 141 insertions(+)
 create mode 100644 drivers/soc/aspeed/aspeed-socinfo.c

diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index 9ce252445605..7ece0675b1fa 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -31,6 +31,13 @@ config ASPEED_P2A_CTRL
 	  driver also provides an interface for userspace mappings to a
 	  pre-defined region.
 
+config ASPEED_SOCINFO
+	bool "ASPEED SoC Information driver"
+	default ARCH_ASPEED
+	select SOC_BUS
+	help
+	  Say yes to support decoding of ASPEED BMC information.
+
 endmenu
 
 endif
diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
index b64be47f2b1f..fcab7192e1a4 100644
--- a/drivers/soc/aspeed/Makefile
+++ b/drivers/soc/aspeed/Makefile
@@ -2,3 +2,4 @@
 obj-$(CONFIG_ASPEED_LPC_CTRL)	+= aspeed-lpc-ctrl.o
 obj-$(CONFIG_ASPEED_LPC_SNOOP)	+= aspeed-lpc-snoop.o
 obj-$(CONFIG_ASPEED_P2A_CTRL)	+= aspeed-p2a-ctrl.o
+obj-$(CONFIG_ASPEED_SOCINFO)	+= aspeed-socinfo.o
diff --git a/drivers/soc/aspeed/aspeed-socinfo.c b/drivers/soc/aspeed/aspeed-socinfo.c
new file mode 100644
index 000000000000..26db42ef6aae
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-socinfo.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright 2019 IBM Corp. */
+
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/sys_soc.h>
+
+static struct {
+	const char *name;
+	const u32 id;
+} const rev_table[] = {
+	/* AST2400 */
+	{ "AST2400", 0x02000303 },
+	{ "AST1400", 0x02010103 },
+	{ "AST1250", 0x02010303 },
+	/* AST2500 */
+	{ "AST2500", 0x04000303 },
+	{ "AST2510", 0x04000103 },
+	{ "AST2520", 0x04000203 },
+	{ "AST2530", 0x04000403 },
+	/* AST2600 */
+	{ "AST2600", 0x05000303 },
+	{ "AST2620", 0x05010203 },
+};
+
+static const char *siliconid_to_name(u32 siliconid)
+{
+	unsigned int id = siliconid & 0xff00ffff;
+	unsigned int i;
+
+	for (i = 0 ; i < ARRAY_SIZE(rev_table) ; ++i) {
+		if (rev_table[i].id == id)
+			return rev_table[i].name;
+	}
+
+	return "Unknown";
+}
+
+static const char *siliconid_to_rev(u32 siliconid)
+{
+	unsigned int rev = (siliconid >> 16) & 0xff;
+
+	switch (rev) {
+	case 0:
+		return "A0";
+	case 1:
+		return "A1";
+	case 3:
+		return "A2";
+	};
+
+	return "??";
+}
+
+static int __init aspeed_socinfo_init(void)
+{
+	struct soc_device_attribute *attrs;
+	struct soc_device *soc_dev;
+	struct device_node *np;
+	void __iomem *reg;
+	bool has_chipid = false;
+	u32 siliconid;
+	u32 chipid[2];
+	const char *machine = NULL;
+
+	np = of_find_compatible_node(NULL, NULL, "aspeed,silicon-id");
+	if (!of_device_is_available(np)) {
+		of_node_put(np);
+		return -ENODEV;
+	}
+
+	reg = of_iomap(np, 0);
+	if (!reg)
+		return -ENODEV;
+	siliconid = readl(reg);
+	iounmap(reg);
+
+	/* This is optional, the ast2400 does not have it */
+	reg = of_iomap(np, 1);
+	if (reg) {
+		has_chipid = true;
+		chipid[0] = readl(reg);
+		chipid[1] = readl(reg + 4);
+		iounmap(reg);
+	}
+	of_node_put(np);
+
+	attrs = kzalloc(sizeof(*attrs), GFP_KERNEL);
+	if (!attrs)
+		return -ENODEV;
+
+	/*
+	 * Machine: Romulus BMC
+	 * Family: AST2500
+	 * Revision: A1
+	 * SoC ID: raw silicon revision id
+	 * Serial Number: 64-bit chipid
+	 */
+
+	np = of_find_node_by_path("/");
+	of_property_read_string(np, "model", &machine);
+	if (machine)
+		attrs->machine = kstrdup(machine, GFP_KERNEL);
+	of_node_put(np);
+
+	attrs->family = siliconid_to_name(siliconid);
+	attrs->revision = siliconid_to_rev(siliconid);
+	attrs->soc_id = kasprintf(GFP_KERNEL, "%08x", siliconid);
+
+	if (has_chipid)
+		attrs->serial_number = kasprintf(GFP_KERNEL, "%08x%08x",
+						 chipid[1], chipid[0]);
+
+	soc_dev = soc_device_register(attrs);
+	if (IS_ERR(soc_dev)) {
+		kfree(attrs->soc_id);
+		kfree(attrs->serial_number);
+		kfree(attrs);
+		return PTR_ERR(soc_dev);
+	}
+
+	pr_info("ASPEED %s rev %s (%s)\n",
+			attrs->family,
+			attrs->revision,
+			attrs->soc_id);
+
+	return 0;
+}
+early_initcall(aspeed_socinfo_init);
-- 
2.28.0

