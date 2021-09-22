Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A7D415444
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Sep 2021 01:55:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFFXZ5mrnz2ynG
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Sep 2021 09:55:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Aip4GRtq;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Aip4GRtq; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFFXR2y0lz2xtP
 for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Sep 2021 09:55:02 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so3597143pji.2
 for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Sep 2021 16:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kruvS2DIrqO7gxRcBxYzkKWpnQ+/wLF9ZBKVA3jfG/8=;
 b=Aip4GRtqMOgOHs5jcbWacRkFEbwKFzjoK4kZApNxUHvpj5PVviGig4sgSwZOrpzIn6
 vth8ILdfrj6dQzGzxL+1NeA/usN2N8Y8wF0eQV0+85FF32ZHiYL8SsHcZiC8Tvzu7f1C
 OGz4g4a5ZGJtOGmMpAy1YU0ZNton7qh4ZGe7TatGnARc0uD9xl4QGo33mRMKd7+VSRkU
 F2B7YDCZfOQHs2GKzkUHK0RxCPRrawNFlhlH4yacAO3N02DstAg6+l1J1o01v4eVdGMT
 xLd2RrBbPvS02Wv33t/SdBuo4K01S9lYoHjoE7ISy4R8a/ZUXECLlvY09kVMgXTRDiRI
 B/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=kruvS2DIrqO7gxRcBxYzkKWpnQ+/wLF9ZBKVA3jfG/8=;
 b=NXig+kpxwbYM0wZKDr2LzYxevSPHgu5vjZ/9+Ab5DX4Rg+rUM8LzUWvEqhEXHvyLrq
 HRUMmDRJIY5FY635QdnznNCghfcgsjE/fYU2e8HrW1RbVFc19+XHVuyIvOp1gG5uxF6S
 otFrxHH1WRXam3RjHcUuG/SbJys+D9TEDUFqd2AfXc7v0Ejs+Q+cRCrs9xBg+4Aop9l8
 7LCq89pApujJ9gUOimCVqlO9jbg3KuQXrFAFsdocnonfByICu99dykogAhxhXF9jcKHi
 3r4Ayp0y24hrk4yri3com8+TqLHl1oPkRY0hcNInewSNuqoyPnYR0BRQdsTVfXGxUOO9
 39sQ==
X-Gm-Message-State: AOAM531egMhgn4kWHvDrMkrc1YR36Pjvf0WZ4KkBNj6SR8VPlUECqP8e
 t9AeorIrxoHe8TkoM/GzPN8zjG0lzoTtPg==
X-Google-Smtp-Source: ABdhPJxu+Ni2pvvC9cNISYXnsMiVxPfBexOrc+HFG2GnQ+r+gMOzM2r+1m+64GkBPabfoEwes5xaWA==
X-Received: by 2002:a17:90a:c485:: with SMTP id
 j5mr1858983pjt.109.1632354898052; 
 Wed, 22 Sep 2021 16:54:58 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id p2sm4036013pgd.84.2021.09.22.16.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 16:54:57 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH] clk/ast2600: Fix soc revision for AHB
Date: Thu, 23 Sep 2021 09:24:49 +0930
Message-Id: <20210922235449.213631-1-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
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
Cc: BMC-SW@aspeedtech.com, linux-clk@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Move the soc revision parsing to the initial probe, saving the driver
from parsing the register multiple times.

Use this variable to select the correct divisor table for the AHB clock.
Before this fix the A2 would have used the A0 table.

Fixes: 2d491066ccd4 ("clk: ast2600: Fix AHB clock divider for A1")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/clk/clk-ast2600.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index bc3be5f3eae1..24dab2312bc6 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -51,6 +51,8 @@ static DEFINE_SPINLOCK(aspeed_g6_clk_lock);
 static struct clk_hw_onecell_data *aspeed_g6_clk_data;
 
 static void __iomem *scu_g6_base;
+/* AST2600 revision: A0, A1, A2, etc */
+static u8 soc_rev;
 
 /*
  * Clocks marked with CLK_IS_CRITICAL:
@@ -191,9 +193,8 @@ static struct clk_hw *ast2600_calc_pll(const char *name, u32 val)
 static struct clk_hw *ast2600_calc_apll(const char *name, u32 val)
 {
 	unsigned int mult, div;
-	u32 chip_id = readl(scu_g6_base + ASPEED_G6_SILICON_REV);
 
-	if (((chip_id & CHIP_REVISION_ID) >> 16) >= 2) {
+	if (soc_rev >= 2) {
 		if (val & BIT(24)) {
 			/* Pass through mode */
 			mult = div = 1;
@@ -707,7 +708,7 @@ static const u32 ast2600_a1_axi_ahb200_tbl[] = {
 static void __init aspeed_g6_cc(struct regmap *map)
 {
 	struct clk_hw *hw;
-	u32 val, div, divbits, chip_id, axi_div, ahb_div;
+	u32 val, div, divbits, axi_div, ahb_div;
 
 	clk_hw_register_fixed_rate(NULL, "clkin", NULL, 0, 25000000);
 
@@ -738,8 +739,7 @@ static void __init aspeed_g6_cc(struct regmap *map)
 		axi_div = 2;
 
 	divbits = (val >> 11) & 0x3;
-	regmap_read(map, ASPEED_G6_SILICON_REV, &chip_id);
-	if (chip_id & BIT(16)) {
+	if (soc_rev >= 1) {
 		if (!divbits) {
 			ahb_div = ast2600_a1_axi_ahb200_tbl[(val >> 8) & 0x3];
 			if (val & BIT(16))
@@ -784,6 +784,8 @@ static void __init aspeed_g6_cc_init(struct device_node *np)
 	if (!scu_g6_base)
 		return;
 
+	soc_rev = (readl(scu_g6_base + ASPEED_G6_SILICON_REV) & CHIP_REVISION_ID) >> 16;
+
 	aspeed_g6_clk_data = kzalloc(struct_size(aspeed_g6_clk_data, hws,
 				      ASPEED_G6_NUM_CLKS), GFP_KERNEL);
 	if (!aspeed_g6_clk_data)
-- 
2.33.0

