Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B708726BFAA
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 10:47:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Brtyl2MqCzDqNj
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 18:47:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Fn8qiLiB; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrtyT20BfzDqW5
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Sep 2020 18:47:29 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id bg9so2823073plb.2
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Sep 2020 01:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=InfK4VMkGLM/0nl/ACN4Pi7fzdl6Qn42FMA4SMJK5IU=;
 b=Fn8qiLiBy5BCcx1hk3ue1FC6I8+fZvTDWx2FtlFycqt7qXaJX5JCAz7dHc8wB89gPq
 nwwQS/hitMQHO+uTBqWqjqVd/uFGHenF4JlWvriMAjoe1QNYQgpuCegjDtC4QR7gQmwy
 d4r1FcVFb8Ha+KawzosQmoPe+ngq20Z19jSyIzqqvEg1VprsChOzajKhnTXggo/ZJrMm
 r3K9UY7KyKefDmKXuhxIOF7DVbnV4YELmeKvSyZFaDlRH1OsuS5WX6Z1KU7TOVQ/GZu5
 zWzgKtYEXhGNfO++wnhX35T+gdpaU/7sqTYSn90SrYz5hoMj80soY/g6mYxfHHKl/mkb
 E/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=InfK4VMkGLM/0nl/ACN4Pi7fzdl6Qn42FMA4SMJK5IU=;
 b=pqawG7MHrI6gYCHnRXBS/t0m7a/1OpdvRH01/LJAucyKzZ86DE5Xb6R25J/ypig6lS
 5teX5W8Chc6R904wU3t8C9OowwuwUT6loUTByGCE0AuU8HVJAOj/9x4feFLxETbTaTOf
 I6giv5BTi/znyh20QErj0jZS9xcO9YgqmCxiNlAdxagR7Vo3COWQK5/sHcvsbaZw754A
 eCP/d9rc3+KPot+/lG3MD5HuF3OG+hf4EGAoGZVwOR0MmtNvo1lAlU6dOgsESBBl8cV5
 Ir6OB1829KIgMHDSn8zlP0HUsZBC7E/c7NZNB8RaYn9IfwXJpOh9ACcA8Hn9hw/kiXRZ
 BkDw==
X-Gm-Message-State: AOAM53125rsV2iW04vLiSAoFV7wW2bdh5VyfE9l0Qfm394dXzKPSz7lV
 nruBxUBcPIM+qWSgFoYgl6Y=
X-Google-Smtp-Source: ABdhPJy92Ru8q9ViiiGzETrQHLZaHHUAYz2fR19NtcQZlZazaRos1qFeyE/+uigmiVm1FJzrXvGVxw==
X-Received: by 2002:a17:90a:f206:: with SMTP id
 bs6mr3068945pjb.196.1600246046526; 
 Wed, 16 Sep 2020 01:47:26 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id kf10sm1925323pjb.2.2020.09.16.01.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 01:47:25 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/3] soc: aspeed: Add soc info driver
Date: Wed, 16 Sep 2020 18:17:02 +0930
Message-Id: <20200916084703.778386-3-joel@jms.id.au>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200916084703.778386-1-joel@jms.id.au>
References: <20200916084703.778386-1-joel@jms.id.au>
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
 drivers/soc/aspeed/Kconfig          |   7 ++
 drivers/soc/aspeed/Makefile         |   1 +
 drivers/soc/aspeed/aspeed-socinfo.c | 141 ++++++++++++++++++++++++++++
 3 files changed, 149 insertions(+)
 create mode 100644 drivers/soc/aspeed/aspeed-socinfo.c

diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index 3c03c255e6e9..be5a29e8b0dc 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -35,6 +35,13 @@ config ASPEED_P2A_CTRL
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
index 000000000000..b72c449f7ccb
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-socinfo.c
@@ -0,0 +1,141 @@
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
+	of_node_put(np);
+	iounmap(reg);
+
+	/* This is optional, the ast2400 does not have it */
+	reg = of_iomap(np, 1);
+	if (reg) {
+		has_chipid = true;
+		chipid[0] = readl(reg);
+		chipid[1] = readl(reg + 4);
+		iounmap(reg);
+		of_node_put(np);
+	}
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
+	 * Serial Nnumber: 64-bit chipid
+	 */
+
+	np = of_find_node_by_path("/");
+	of_property_read_string(np, "model", &machine);
+	if (machine)
+		attrs->machine = kstrdup(machine, GFP_KERNEL);
+	of_node_put(np);
+
+	attrs->family = kasprintf(GFP_KERNEL, "%s",
+				  siliconid_to_name(siliconid));
+
+	attrs->revision = kasprintf(GFP_KERNEL, "%s",
+				    siliconid_to_rev(siliconid));
+
+	attrs->soc_id = kasprintf(GFP_KERNEL, "%08x", siliconid);
+
+	if (has_chipid) {
+		attrs->serial_number = kasprintf(GFP_KERNEL, "%08x%08x",
+						 chipid[1], chipid[0]);
+	}
+
+	soc_dev = soc_device_register(attrs);
+	if (IS_ERR(soc_dev)) {
+		kfree(attrs->family);
+		kfree(attrs->revision);
+		kfree(attrs->soc_id);
+		kfree(attrs->serial_number);
+		kfree(attrs);
+		return PTR_ERR(soc_dev);
+	}
+
+	pr_info("ASPEED BMC %s rev %s (%s)\n",
+			attrs->family,
+			attrs->revision,
+			attrs->soc_id);
+
+	return 0;
+}
+early_initcall(aspeed_socinfo_init);
-- 
2.28.0

