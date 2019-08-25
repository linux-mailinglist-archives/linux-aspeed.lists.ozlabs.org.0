Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF8A9C45D
	for <lists+linux-aspeed@lfdr.de>; Sun, 25 Aug 2019 16:19:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Gchp2yBJzDqRP
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2019 00:19:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fmj0w6Fa"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46GchL5jFPzDqVr
 for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2019 00:19:14 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id v12so9874393pfn.10
 for <linux-aspeed@lists.ozlabs.org>; Sun, 25 Aug 2019 07:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y+TiXTfy0GvucZpWMpF+hFSYcOEhRLjxhLj5EgYmgAI=;
 b=Fmj0w6FapHbABc+eh987fmHXPe8SCHwirQLQQP6cdae4qFHsUNAz1Siwh0NjJqvkfa
 COWY1/KpH6kxxFZWb2ckNWPSfK4YHU2vt/XlWuP6hGzLArij8okqzymSXrHeuyx5m8EM
 TsjBS11ZpnL4SSmyZIIk4lpjSPniC9YDes63aNa35olscVGvNBX9A5KqGOC6ESzv3ljC
 BoV1R5+gtzPIG6VZkRqRqmCoAQDOnScmWmP9FSIH4xRu/JA5/vWhrCw16R9eWFs3odxV
 dyv38klp+9OXGyfwPTTAzUWArNP4j5gawujiivYMxRIDgHdTCU+ZL6NyYVe8rvYuzCWM
 ZKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Y+TiXTfy0GvucZpWMpF+hFSYcOEhRLjxhLj5EgYmgAI=;
 b=Q+PUMBhGNMeAk5E9YAGitCrLSv173EejRApHpM+zP6BqjEy6GaCZWoPjHM2ZpRwUBR
 lAzjRmG1XGZxCnxRv4mPZIUsMNtlg6o0S7UmPtoh3Vh9QEYNRuYLCxNq8kM4AJGi71b2
 nkLrSCu7ys0EBGXl6NwpiJQBjMr9u3esp+oCawpbIklMPEwgRJiw1EYPzcE/AU5I5GBz
 uJhsj8InX6TEaMIqPFw8NST2Ah5wKvzxeBJq/WQ+As4Wybn+kd419y5n/qthiD2zBWSf
 6YBnzLIyox7jWXSbNf2UFJTPSd3rdi5v4rJOY3C0sHjLVUjbg0jC+cIwf8+IglSKkjp5
 75/Q==
X-Gm-Message-State: APjAAAUHRCeqN8skG+LbpGVVDRfVEmlQhj/ZmibWp1Wo6j7d659bSfB3
 p2f6N6ZRcLhxGXVZvgG2His=
X-Google-Smtp-Source: APXvYqzKESmVpB2PpNa7q5Q8l51H9Ksa648hdf0lESby6oBi9xrh0rz5puTH5viJQ284Y8gkE5TC2Q==
X-Received: by 2002:a63:5920:: with SMTP id n32mr11870847pgb.352.1566742751322; 
 Sun, 25 Aug 2019 07:19:11 -0700 (PDT)
Received: from voyager.ozlabs.ibm.com (pa49-199-217-21.pa.vic.optusnet.com.au.
 [49.199.217.21])
 by smtp.gmail.com with ESMTPSA id w1sm7734562pjt.30.2019.08.25.07.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Aug 2019 07:19:10 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 1/2] clk: aspeed: Move structures to header
Date: Sun, 25 Aug 2019 23:48:47 +0930
Message-Id: <20190825141848.17346-2-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190825141848.17346-1-joel@jms.id.au>
References: <20190825141848.17346-1-joel@jms.id.au>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

They will be reused by the ast2600 driver.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 include required headers for structures used by clk-aspeed.h

 drivers/clk/clk-aspeed.c | 67 ++------------------------------
 drivers/clk/clk-aspeed.h | 82 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+), 64 deletions(-)
 create mode 100644 drivers/clk/clk-aspeed.h

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index 898291501f45..abf06fb6453e 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -1,19 +1,19 @@
 // SPDX-License-Identifier: GPL-2.0+
+// Copyright IBM Corp
 
 #define pr_fmt(fmt) "clk-aspeed: " fmt
 
-#include <linux/clk-provider.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 #include <linux/slab.h>
-#include <linux/spinlock.h>
 
 #include <dt-bindings/clock/aspeed-clock.h>
 
+#include "clk-aspeed.h"
+
 #define ASPEED_NUM_CLKS		36
 
 #define ASPEED_RESET2_OFFSET	32
@@ -42,48 +42,6 @@ static struct clk_hw_onecell_data *aspeed_clk_data;
 
 static void __iomem *scu_base;
 
-/**
- * struct aspeed_gate_data - Aspeed gated clocks
- * @clock_idx: bit used to gate this clock in the clock register
- * @reset_idx: bit used to reset this IP in the reset register. -1 if no
- *             reset is required when enabling the clock
- * @name: the clock name
- * @parent_name: the name of the parent clock
- * @flags: standard clock framework flags
- */
-struct aspeed_gate_data {
-	u8		clock_idx;
-	s8		reset_idx;
-	const char	*name;
-	const char	*parent_name;
-	unsigned long	flags;
-};
-
-/**
- * struct aspeed_clk_gate - Aspeed specific clk_gate structure
- * @hw:		handle between common and hardware-specific interfaces
- * @reg:	register controlling gate
- * @clock_idx:	bit used to gate this clock in the clock register
- * @reset_idx:	bit used to reset this IP in the reset register. -1 if no
- *		reset is required when enabling the clock
- * @flags:	hardware-specific flags
- * @lock:	register lock
- *
- * Some of the clocks in the Aspeed SoC must be put in reset before enabling.
- * This modified version of clk_gate allows an optional reset bit to be
- * specified.
- */
-struct aspeed_clk_gate {
-	struct clk_hw	hw;
-	struct regmap	*map;
-	u8		clock_idx;
-	s8		reset_idx;
-	u8		flags;
-	spinlock_t	*lock;
-};
-
-#define to_aspeed_clk_gate(_hw) container_of(_hw, struct aspeed_clk_gate, hw)
-
 /* TODO: ask Aspeed about the actual parent data */
 static const struct aspeed_gate_data aspeed_gates[] = {
 	/*				 clk rst   name			parent	flags */
@@ -208,13 +166,6 @@ static struct clk_hw *aspeed_ast2500_calc_pll(const char *name, u32 val)
 			mult, div);
 }
 
-struct aspeed_clk_soc_data {
-	const struct clk_div_table *div_table;
-	const struct clk_div_table *eclk_div_table;
-	const struct clk_div_table *mac_div_table;
-	struct clk_hw *(*calc_pll)(const char *name, u32 val);
-};
-
 static const struct aspeed_clk_soc_data ast2500_data = {
 	.div_table = ast2500_div_table,
 	.eclk_div_table = ast2500_eclk_div_table,
@@ -315,18 +266,6 @@ static const struct clk_ops aspeed_clk_gate_ops = {
 	.is_enabled = aspeed_clk_is_enabled,
 };
 
-/**
- * struct aspeed_reset - Aspeed reset controller
- * @map: regmap to access the containing system controller
- * @rcdev: reset controller device
- */
-struct aspeed_reset {
-	struct regmap			*map;
-	struct reset_controller_dev	rcdev;
-};
-
-#define to_aspeed_reset(p) container_of((p), struct aspeed_reset, rcdev)
-
 static const u8 aspeed_resets[] = {
 	/* SCU04 resets */
 	[ASPEED_RESET_XDMA]	= 25,
diff --git a/drivers/clk/clk-aspeed.h b/drivers/clk/clk-aspeed.h
new file mode 100644
index 000000000000..5296b15b1c88
--- /dev/null
+++ b/drivers/clk/clk-aspeed.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Structures used by ASPEED clock drivers
+ *
+ * Copyright 2019 IBM Corp.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/kernel.h>
+#include <linux/reset-controller.h>
+#include <linux/spinlock.h>
+
+struct clk_div_table;
+struct regmap;
+
+/**
+ * struct aspeed_gate_data - Aspeed gated clocks
+ * @clock_idx: bit used to gate this clock in the clock register
+ * @reset_idx: bit used to reset this IP in the reset register. -1 if no
+ *             reset is required when enabling the clock
+ * @name: the clock name
+ * @parent_name: the name of the parent clock
+ * @flags: standard clock framework flags
+ */
+struct aspeed_gate_data {
+	u8		clock_idx;
+	s8		reset_idx;
+	const char	*name;
+	const char	*parent_name;
+	unsigned long	flags;
+};
+
+/**
+ * struct aspeed_clk_gate - Aspeed specific clk_gate structure
+ * @hw:		handle between common and hardware-specific interfaces
+ * @reg:	register controlling gate
+ * @clock_idx:	bit used to gate this clock in the clock register
+ * @reset_idx:	bit used to reset this IP in the reset register. -1 if no
+ *		reset is required when enabling the clock
+ * @flags:	hardware-specific flags
+ * @lock:	register lock
+ *
+ * Some of the clocks in the Aspeed SoC must be put in reset before enabling.
+ * This modified version of clk_gate allows an optional reset bit to be
+ * specified.
+ */
+struct aspeed_clk_gate {
+	struct clk_hw	hw;
+	struct regmap	*map;
+	u8		clock_idx;
+	s8		reset_idx;
+	u8		flags;
+	spinlock_t	*lock;
+};
+
+#define to_aspeed_clk_gate(_hw) container_of(_hw, struct aspeed_clk_gate, hw)
+
+/**
+ * struct aspeed_reset - Aspeed reset controller
+ * @map: regmap to access the containing system controller
+ * @rcdev: reset controller device
+ */
+struct aspeed_reset {
+	struct regmap			*map;
+	struct reset_controller_dev	rcdev;
+};
+
+#define to_aspeed_reset(p) container_of((p), struct aspeed_reset, rcdev)
+
+/**
+ * struct aspeed_clk_soc_data - Aspeed SoC specific divisor information
+ * @div_table: Common divider lookup table
+ * @eclk_div_table: Divider lookup table for ECLK
+ * @mac_div_table: Divider lookup table for MAC (Ethernet) clocks
+ * @calc_pll: Callback to maculate common PLL settings
+ */
+struct aspeed_clk_soc_data {
+	const struct clk_div_table *div_table;
+	const struct clk_div_table *eclk_div_table;
+	const struct clk_div_table *mac_div_table;
+	struct clk_hw *(*calc_pll)(const char *name, u32 val);
+};
-- 
2.23.0.rc1

