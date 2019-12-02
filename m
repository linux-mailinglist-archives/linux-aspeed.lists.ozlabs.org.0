Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C41810E5CC
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Dec 2019 07:14:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RFDm4Gq9zDqSB
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Dec 2019 17:14:00 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="aJYVzend"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="xZKQrzIq"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RFCr4RKDzDqS6
 for <linux-aspeed@lists.ozlabs.org>; Mon,  2 Dec 2019 17:13:12 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8395E22431;
 Mon,  2 Dec 2019 01:13:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 02 Dec 2019 01:13:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=o4SgjvFhP06qE
 MYFVcEyg35wWX80rlCKP3ooHrBZfDo=; b=aJYVzendOngQ5F2JtZ/LQe2vcDbRG
 e/7zLxYa5UDicNca+9lLY+dWyuI61IOxfnxHt3T+ZbXgJcNwFJV2rQplDRl2pBYK
 zivV8Mr5LRyxzt0j9MjA3MDQK7RhixXhoTROqJixIYi8FTyoC6T2jrJuMaCHYyID
 BS/SFXVHMrkGeHp93MJO5BBPDteBlibA88foy3ArgZYKqqRSlITMMf3TeKjg4Cfb
 rSxjHlrhCK9q7vllcDdTsI8vnusb0vx+SEnB0fHgJxkLJbOq8rcwhwTn64uOf5j3
 hnlPPyjnQ4+X1J3dUj1eZFosIwTqizIpb6GwONYSqd091w9H8bk/MmZpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=o4SgjvFhP06qEMYFVcEyg35wWX80rlCKP3ooHrBZfDo=; b=xZKQrzIq
 k0dBFFayTBzjEhjfgqH00LhQd7UEJC+SZ7r2pIc7zDQ+pBwWbwByQQiXO28zlhn8
 AZzDcRkj9hMhzv1oAFQdCIVcZDhM2rswsdRhxh5MUzhDShRNzjocBMU2UtGCpeah
 3AANYGU9sFS/MFVly88JLu7aB/CBfnd6Kj/+7dG5SiGccIJPH22mQ9uO+ryPU5Qt
 6EEKr5RtxQwgOO9lI8GlM29M9sXxmGBMUzTgSTb2mgVtSrhVjZykovQI3i9OZicq
 3x0Zp17Y6Cq3YSSuxnA8FcZv8LV98mVXlgYlPzqq6ygsf3V7xlQMyz3zTUKJ+fZL
 Sp46Be8+rchT6A==
X-ME-Sender: <xms:davkXYPqnppDdQxIFKT7dCheGjNfcKI3QtMv1na0ZR5yhCS2L3Ts0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudejgedgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
 ficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfkphepudduke
 drvdduuddrledvrddufeenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegr
 jhdrihgurdgruhenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:davkXceDkTNIKL8ysKCkHewLXEjm-8-E6X7xKBTPHX-RTTWzLJ_w5w>
 <xmx:davkXVmmugzr30SkXnReDAgaPkKPFL1q0AMY5e4L9LYUjU_IirKRPw>
 <xmx:davkXX3x6Mv_l-S32GKlHPJibIv4BclYRoUE0GS0zMdSJrTywlj9Lw>
 <xmx:davkXc2tdlNZMo7kV-aM3HUu-j3It4OqvrLGL6vTR0XOsrAo0XG5Ow>
Received: from mistburn.lan (unknown [118.211.92.13])
 by mail.messagingengine.com (Postfix) with ESMTPA id C05168005A;
 Mon,  2 Dec 2019 01:13:05 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Subject: [PATCH 5/7] pinctrl: aspeed: Move aspeed_pin_config_map to separate
 source file
Date: Mon,  2 Dec 2019 16:44:30 +1030
Message-Id: <20191202061432.3996-6-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202061432.3996-1-andrew@aj.id.au>
References: <20191202061432.3996-1-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Johnny Huang <johnny_huang@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Johnny Huang <johnny_huang@aspeedtech.com>

The AST2600 pinconf differs from the 2400 and 2500, aspeed_pin_config_map
should define separately, and add @confmaps and @nconfmaps to
aspeed_pinctrl_data structure for that change.

Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 10 ++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 10 ++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    | 38 +++-------------------
 drivers/pinctrl/aspeed/pinctrl-aspeed.h    | 19 +++++++++++
 4 files changed, 44 insertions(+), 33 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index c56ded0ac57e..62b8aa53b627 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -2594,6 +2594,14 @@ static int aspeed_g4_sig_expr_set(struct aspeed_pinmux_data *ctx,
 	return 0;
 }
 
+static const struct aspeed_pin_config_map aspeed_g4_pin_config_map[] = {
+	{ PIN_CONFIG_BIAS_PULL_DOWN,  0, 1},
+	{ PIN_CONFIG_BIAS_PULL_DOWN, -1, 0},
+	{ PIN_CONFIG_BIAS_DISABLE,   -1, 1},
+	{ PIN_CONFIG_DRIVE_STRENGTH,  8, 0},
+	{ PIN_CONFIG_DRIVE_STRENGTH, 16, 1},
+};
+
 static const struct aspeed_pinmux_ops aspeed_g4_ops = {
 	.set = aspeed_g4_sig_expr_set,
 };
@@ -2610,6 +2618,8 @@ static struct aspeed_pinctrl_data aspeed_g4_pinctrl_data = {
 	},
 	.configs = aspeed_g4_configs,
 	.nconfigs = ARRAY_SIZE(aspeed_g4_configs),
+	.confmaps = aspeed_g4_pin_config_map,
+	.nconfmaps = ARRAY_SIZE(aspeed_g4_pin_config_map),
 };
 
 static const struct pinmux_ops aspeed_g4_pinmux_ops = {
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index b2fe47b98fa0..2acbcf3d508a 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2780,6 +2780,14 @@ static int aspeed_g5_sig_expr_set(struct aspeed_pinmux_data *ctx,
 	return 0;
 }
 
+static const struct aspeed_pin_config_map aspeed_g5_pin_config_map[] = {
+	{ PIN_CONFIG_BIAS_PULL_DOWN,  0, 1},
+	{ PIN_CONFIG_BIAS_PULL_DOWN, -1, 0},
+	{ PIN_CONFIG_BIAS_DISABLE,   -1, 1},
+	{ PIN_CONFIG_DRIVE_STRENGTH,  8, 0},
+	{ PIN_CONFIG_DRIVE_STRENGTH, 16, 1},
+};
+
 static const struct aspeed_pinmux_ops aspeed_g5_ops = {
 	.eval = aspeed_g5_sig_expr_eval,
 	.set = aspeed_g5_sig_expr_set,
@@ -2797,6 +2805,8 @@ static struct aspeed_pinctrl_data aspeed_g5_pinctrl_data = {
 	},
 	.configs = aspeed_g5_configs,
 	.nconfigs = ARRAY_SIZE(aspeed_g5_configs),
+	.confmaps = aspeed_g5_pin_config_map,
+	.nconfmaps = ARRAY_SIZE(aspeed_g5_pin_config_map),
 };
 
 static const struct pinmux_ops aspeed_g5_pinmux_ops = {
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 54933665b5f8..fc68aca7b36c 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -411,49 +411,21 @@ static inline const struct aspeed_pin_config *find_pinconf_config(
 	return NULL;
 }
 
-/*
- * Aspeed pin configuration description.
- *
- * @param: pinconf configuration parameter
- * @arg: The supported argument for @param, or -1 if any value is supported
- * @val: The register value to write to configure @arg for @param
- *
- * The map is to be used in conjunction with the configuration array supplied
- * by the driver implementation.
- */
-struct aspeed_pin_config_map {
-	enum pin_config_param param;
-	s32 arg;
-	u32 val;
-};
-
 enum aspeed_pin_config_map_type { MAP_TYPE_ARG, MAP_TYPE_VAL };
 
-/* Aspeed consistently both:
- *
- * 1. Defines "disable bits" for internal pull-downs
- * 2. Uses 8mA or 16mA drive strengths
- */
-static const struct aspeed_pin_config_map pin_config_map[] = {
-	{ PIN_CONFIG_BIAS_PULL_DOWN,  0, 1 },
-	{ PIN_CONFIG_BIAS_PULL_DOWN, -1, 0 },
-	{ PIN_CONFIG_BIAS_DISABLE,   -1, 1 },
-	{ PIN_CONFIG_DRIVE_STRENGTH,  8, 0 },
-	{ PIN_CONFIG_DRIVE_STRENGTH, 16, 1 },
-};
-
 static const struct aspeed_pin_config_map *find_pinconf_map(
+		const struct aspeed_pinctrl_data *pdata,
 		enum pin_config_param param,
 		enum aspeed_pin_config_map_type type,
 		s64 value)
 {
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(pin_config_map); i++) {
+	for (i = 0; i < pdata->nconfmaps; i++) {
 		const struct aspeed_pin_config_map *elem;
 		bool match;
 
-		elem = &pin_config_map[i];
+		elem = &pdata->confmaps[i];
 
 		switch (type) {
 		case MAP_TYPE_ARG:
@@ -491,7 +463,7 @@ int aspeed_pin_config_get(struct pinctrl_dev *pctldev, unsigned int offset,
 	if (rc < 0)
 		return rc;
 
-	pmap = find_pinconf_map(param, MAP_TYPE_VAL,
+	pmap = find_pinconf_map(pdata, param, MAP_TYPE_VAL,
 			(val & BIT(pconf->bit)) >> pconf->bit);
 
 	if (!pmap)
@@ -535,7 +507,7 @@ int aspeed_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
 		if (!pconf)
 			return -ENOTSUPP;
 
-		pmap = find_pinconf_map(param, MAP_TYPE_ARG, arg);
+		pmap = find_pinconf_map(pdata, param, MAP_TYPE_ARG, arg);
 
 		if (WARN_ON(!pmap))
 			return -EINVAL;
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
index a7db31202033..27d3929b6aca 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
@@ -42,6 +42,22 @@ struct aspeed_pin_config {
 	.bit = bit_ \
 }
 
+/*
+ * Aspeed pin configuration description.
+ *
+ * @param: pinconf configuration parameter
+ * @arg: The supported argument for @param, or -1 if any value is supported
+ * @val: The register value to write to configure @arg for @param
+ *
+ * The map is to be used in conjunction with the configuration array supplied
+ * by the driver implementation.
+ */
+struct aspeed_pin_config_map {
+	enum pin_config_param param;
+	s32 arg;
+	u32 val;
+};
+
 struct aspeed_pinctrl_data {
 	struct regmap *scu;
 
@@ -52,6 +68,9 @@ struct aspeed_pinctrl_data {
 	const unsigned int nconfigs;
 
 	struct aspeed_pinmux_data pinmux;
+
+	const struct aspeed_pin_config_map *confmaps;
+	const unsigned int nconfmaps;
 };
 
 /* Aspeed pinctrl helpers */
-- 
2.20.1

