Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0F5414646
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Sep 2021 12:32:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDvjz04vKz2ymx
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Sep 2021 20:32:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chin-ting_kuo@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDvjt5Bn4z2yJC;
 Wed, 22 Sep 2021 20:32:01 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 18MAB7N1012563;
 Wed, 22 Sep 2021 18:11:07 +0800 (GMT-8)
 (envelope-from chin-ting_kuo@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 22 Sep
 2021 18:31:25 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <robh+dt@kernel.org>, <joel@jms.id.au>, <mturquette@baylibre.com>,
 <sboyd@kernel.org>, <adrian.hunter@intel.com>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <andrew@aj.id.au>
Subject: [PATCH 01/10] clk: aspeed: ast2600: Porting sdhci clock source
Date: Wed, 22 Sep 2021 18:31:07 +0800
Message-ID: <20210922103116.30652-2-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
References: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 18MAB7N1012563
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
Cc: BMC-SW@aspeedtech.com, steven_lee@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

- There are two clock sources used to generate
  SD/SDIO clock, APLL clock and HCLK (200MHz).
  User can select which clock source should be used
  by configuring SCU310[8].
- The SD/SDIO clock divider selection table SCU310[30:28]
  is different between AST2600-A1 and AST2600-A2/A3.
  For AST2600-A1, 200MHz SD/SDIO clock cannot be
  gotten by the dividers in SCU310[30:28] if APLL
  is not the multiple of 200MHz and HCLK is 200MHz.
  For AST2600-A2/A3, a new divider, "1", is added and
  200MHz SD/SDIO clock can be obtained by adopting HCLK
  as clock source and setting SCU310[30:28] to 3b'111.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/clk/clk-ast2600.c | 69 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 61 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index bc3be5f3eae1..a6778c18274a 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -168,6 +168,30 @@ static const struct clk_div_table ast2600_div_table[] = {
 	{ 0 }
 };
 
+static const struct clk_div_table ast2600_sd_div_a1_table[] = {
+	{ 0x0, 2 },
+	{ 0x1, 4 },
+	{ 0x2, 6 },
+	{ 0x3, 8 },
+	{ 0x4, 10 },
+	{ 0x5, 12 },
+	{ 0x6, 14 },
+	{ 0x7, 16 },
+	{ 0 }
+};
+
+static const struct clk_div_table ast2600_sd_div_a2_table[] = {
+	{ 0x0, 2 },
+	{ 0x1, 4 },
+	{ 0x2, 6 },
+	{ 0x3, 8 },
+	{ 0x4, 10 },
+	{ 0x5, 12 },
+	{ 0x6, 14 },
+	{ 0x7, 1 },
+	{ 0 }
+};
+
 /* For hpll/dpll/epll/mpll */
 static struct clk_hw *ast2600_calc_pll(const char *name, u32 val)
 {
@@ -424,6 +448,11 @@ static const char *const emmc_extclk_parent_names[] = {
 	"mpll",
 };
 
+static const char *const sd_extclk_parent_names[] = {
+	"hclk",
+	"apll",
+};
+
 static const char * const vclk_parent_names[] = {
 	"dpll",
 	"d1pll",
@@ -523,18 +552,42 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(hw);
 	aspeed_g6_clk_data->hws[ASPEED_CLK_EMMC] = hw;
 
-	/* SD/SDIO clock divider and gate */
-	hw = clk_hw_register_gate(dev, "sd_extclk_gate", "hpll", 0,
-			scu_g6_base + ASPEED_G6_CLK_SELECTION4, 31, 0,
-			&aspeed_g6_clk_lock);
+	clk_hw_register_fixed_rate(NULL, "hclk", NULL, 0, 200000000);
+
+	regmap_read(map, 0x310, &val);
+	hw = clk_hw_register_mux(dev, "sd_extclk_mux",
+				 sd_extclk_parent_names,
+				 ARRAY_SIZE(sd_extclk_parent_names), 0,
+				 scu_g6_base + ASPEED_G6_CLK_SELECTION4, 8, 1,
+				 0, &aspeed_g6_clk_lock);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
-	hw = clk_hw_register_divider_table(dev, "sd_extclk", "sd_extclk_gate",
-			0, scu_g6_base + ASPEED_G6_CLK_SELECTION4, 28, 3, 0,
-			ast2600_div_table,
-			&aspeed_g6_clk_lock);
+
+	hw = clk_hw_register_gate(dev, "sd_extclk_gate", "sd_extclk_mux",
+				  0, scu_g6_base + ASPEED_G6_CLK_SELECTION4,
+				  31, 0, &aspeed_g6_clk_lock);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
+
+	regmap_read(map, 0x14, &val);
+	/* AST2600-A2/A3 clock divisor is different from AST2600-A1 */
+	if (((val & GENMASK(23, 16)) >> 16) >= 2) {
+		/* AST2600-A2/A3 */
+		hw = clk_hw_register_divider_table(dev, "sd_extclk", "sd_extclk_gate",
+					0, scu_g6_base + ASPEED_G6_CLK_SELECTION4, 28, 3, 0,
+					ast2600_sd_div_a2_table,
+					&aspeed_g6_clk_lock);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+	} else {
+		/* AST2600-A1 */
+		hw = clk_hw_register_divider_table(dev, "sd_extclk", "sd_extclk_gate",
+					0, scu_g6_base + ASPEED_G6_CLK_SELECTION4, 28, 3, 0,
+					ast2600_sd_div_a1_table,
+					&aspeed_g6_clk_lock);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+	}
 	aspeed_g6_clk_data->hws[ASPEED_CLK_SDIO] = hw;
 
 	/* MAC1/2 RMII 50MHz RCLK */
-- 
2.17.1

