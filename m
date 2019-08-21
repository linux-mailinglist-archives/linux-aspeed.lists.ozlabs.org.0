Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6B1971C3
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2019 07:56:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Cxjx63xBzDqyY
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2019 15:56:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pgfPMqAY"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Cxjl6sCHzDqwy
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2019 15:56:11 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id bj8so726667plb.4
 for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Aug 2019 22:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lLwP3mTOJnfDSrV2MSql/pLg1RylIFBDj+4cxU85JLA=;
 b=pgfPMqAYF1GB9XdOwifBr9+txHI4Bvok60GT3VptbvsIKyyrpsDxznr48oNqWFPy0Z
 obk2AWdFDOJO0+HbeoUQsDLJlQ+6on9XrOFpnBktqGSAIDyZhQ0jBxBenpFZhF1PWadB
 B4kmu3+tV2X7lHFWqrBnCKQt/5dFxdRN7K1pn7xw7EzubDJKQkPsfeH0tAc5rxJJrw6Z
 LVK31Gulp/iQI6J2K/jicOEpE0ozIdVTu0dE1S6nXFUfy6EC/27Y1474FiMtF8fxNxka
 thf7+ZFwgxhFGCkkR8yG0CtCoZqcqUhcZxE8QGa9TVHf1/c/Aj0lT6oLDgbItlauMYlx
 EhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lLwP3mTOJnfDSrV2MSql/pLg1RylIFBDj+4cxU85JLA=;
 b=CHXUF0UrrPupgKvxPaGhyDPQKEq/R2qZ35vStyxFlcJ1G/Fws1oXD+4xrqBQVzDZsf
 VNh2AIqCYI5nCITWujRDZtZGKAjyTdwlrulH+LMoi4fZPQEHSxyy7VapGI09+/1IWuUd
 UJI4y9m8uzbHxA6VPKo8Jgn/tudYroRrYedGGODX3vgZZ0cPSnPhD3Yv5AGxGJN0c2KJ
 JsHky9g+6FSLxB7+7m7reraKgbr+Go3G1EtfrvDOR78VbGh2yk45nF23ALCjjq3ytqmB
 tNuSeE14a5eyKvZKaxDj7st/8WWdMscAD6uE8P1x9hYcNxyP81NpFX16+LSVYD5XfV9A
 sknw==
X-Gm-Message-State: APjAAAU6lm1+85eIKlHeFbju0KXZMBAXUsu/JjuOvl0uqQBFRbjtl4y4
 GdiSLPgLHjETO+TOccUXekI=
X-Google-Smtp-Source: APXvYqz+UEvlsHPy8pZuC/TGIdmf7TVS3tbQQ2LbuvsuOV6sZRFG0SOn7rSViCigIl+8HOPZOoOe4w==
X-Received: by 2002:a17:902:e9:: with SMTP id
 a96mr16619138pla.169.1566366969567; 
 Tue, 20 Aug 2019 22:56:09 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id m9sm26568254pfh.84.2019.08.20.22.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 22:56:08 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Subject: [PATCH 4/7] ARM: aspeed: Enable SMP boot
Date: Wed, 21 Aug 2019 15:25:27 +0930
Message-Id: <20190821055530.8720-5-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190821055530.8720-1-joel@jms.id.au>
References: <20190821055530.8720-1-joel@jms.id.au>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This brings the secondary CPU into Linux. It depends on the setup
performed by ASPEED's u-boot.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/Makefile              |  1 +
 arch/arm/mach-aspeed/Makefile  |  5 +++
 arch/arm/mach-aspeed/platsmp.c | 61 ++++++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 arch/arm/mach-aspeed/Makefile
 create mode 100644 arch/arm/mach-aspeed/platsmp.c

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index f96419135d35..be2fc3e79434 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -155,6 +155,7 @@ textofs-$(CONFIG_ARCH_AXXIA) := 0x00308000
 machine-$(CONFIG_ARCH_ACTIONS)		+= actions
 machine-$(CONFIG_ARCH_ALPINE)		+= alpine
 machine-$(CONFIG_ARCH_ARTPEC)		+= artpec
+machine-$(CONFIG_ARCH_ASPEED)           += aspeed
 machine-$(CONFIG_ARCH_AT91)		+= at91
 machine-$(CONFIG_ARCH_AXXIA)		+= axxia
 machine-$(CONFIG_ARCH_BCM)		+= bcm
diff --git a/arch/arm/mach-aspeed/Makefile b/arch/arm/mach-aspeed/Makefile
new file mode 100644
index 000000000000..1951b3317a76
--- /dev/null
+++ b/arch/arm/mach-aspeed/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (C) ASPEED Technology Inc.
+# Copyright IBM Corp.
+
+obj-$(CONFIG_SMP) += platsmp.o
diff --git a/arch/arm/mach-aspeed/platsmp.c b/arch/arm/mach-aspeed/platsmp.c
new file mode 100644
index 000000000000..2324becf7991
--- /dev/null
+++ b/arch/arm/mach-aspeed/platsmp.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright (C) ASPEED Technology Inc.
+// Copyright IBM Corp.
+
+#include <linux/of_address.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/smp.h>
+
+#define BOOT_ADDR	0x00
+#define BOOT_SIG	0x04
+
+static struct device_node *secboot_node;
+
+static int aspeed_g6_boot_secondary(unsigned int cpu, struct task_struct *idle)
+{
+	void __iomem *base;
+
+	base = of_iomap(secboot_node, 0);
+	if (!base) {
+		pr_err("could not map the secondary boot base!");
+		return -ENODEV;
+	}
+
+	writel_relaxed(0, base + BOOT_ADDR);
+	writel_relaxed(__pa_symbol(secondary_startup_arm), base + BOOT_ADDR);
+	writel_relaxed((0xABBAAB00 | (cpu & 0xff)), base + BOOT_SIG);
+
+	dsb_sev();
+
+	iounmap(base);
+
+	return 0;
+}
+
+static void __init aspeed_g6_smp_prepare_cpus(unsigned int max_cpus)
+{
+	void __iomem *base;
+
+	secboot_node = of_find_compatible_node(NULL, NULL, "aspeed,ast2600-smpmem");
+	if (!secboot_node) {
+		pr_err("secboot device node found!!\n");
+		return;
+	}
+
+	base = of_iomap(secboot_node, 0);
+	if (!base) {
+		pr_err("could not map the secondary boot base!");
+		return;
+	}
+	__raw_writel(0xBADABABA, base + BOOT_SIG);
+
+	iounmap(base);
+}
+
+static const struct smp_operations aspeed_smp_ops __initconst = {
+	.smp_prepare_cpus	= aspeed_g6_smp_prepare_cpus,
+	.smp_boot_secondary	= aspeed_g6_boot_secondary,
+};
+
+CPU_METHOD_OF_DECLARE(aspeed_smp, "aspeed,ast2600-smp", &aspeed_smp_ops);
-- 
2.23.0.rc1

