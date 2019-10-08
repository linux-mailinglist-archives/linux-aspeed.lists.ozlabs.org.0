Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 748B5CF880
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2019 13:35:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nZyq11lZzDqJY
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2019 22:35:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="dIgBzduc"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Mvlrt3Tc"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nZy20X8GzDqD3
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Oct 2019 22:34:34 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C46B221AF1;
 Tue,  8 Oct 2019 07:34:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 08 Oct 2019 07:34:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=IomXpyVOXZ8Uv
 1dPMisUUdf86QeS1crpf/LOXGB55i0=; b=dIgBzducLtm3bjO9Leg5vJzPwNDZA
 tD3kxhrpI+XDTH4bNxgAYJb23dsHyzJQAp39K5TEMP5ilJjObK5wkBZSHea6mEwh
 7sHbTuw0IAUCD1bwZ1sJpvgpa0qYvcuWrdhkEFw6/NMXuDHmLuiaCtGj+JwZtTrq
 +RLvW1+ampAFaghMuHzTuFTVAxdzW7XBGTLGT2AAAEmzZSa9zuMdsXpXlZr2Ntfh
 Fd/iPM+vS2aE2HyFSvVmAggOcYYcrK9hoZ/Xf6VEsgvyyWJEA7uAIX0NenHQ65Gr
 xr/AvWCpg/ayCkerE0ULc8NwwIU9Ri774XG4V8zsF+g53MJ1HkQUy3lFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=IomXpyVOXZ8Uv1dPMisUUdf86QeS1crpf/LOXGB55i0=; b=Mvlrt3Tc
 WpZePURq8P27c6YFdUo8xibi6zt7wN4rHEOGaZEThpmYXOiSpyrQa234C8KBcsf5
 DgzLwtorIZykfr+ZrPFz6vOrwuY6+8nMBdvZErHf19D5eYt6vq7kebUz6QVq1Rv5
 0gFDl6jekAXvkUMRc1DuqVe36k1q8LKQeo1k3Su0xPRz/AccWukw4wgYqtee9C+U
 tG7Uy+v6Rex3bJeqGLLF1IBIQzSxIpZvq8ruFLUvHfM/1CK1BwdLF4ywOA8d6kJv
 Xv0LYoF+3sdy+OwQjj77YBj975e8TwaH6DsW1GOovL0EVm+Atm1ecshlX16GHqga
 SKKp4f1l0lEA8w==
X-ME-Sender: <xms:R3ScXXewqj993nwdvy0W9R9zdTXZH7uZcxxC2q5SIwlY4z4uVXXRsQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheelgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgepud
X-ME-Proxy: <xmx:R3ScXU1dR1Bwcvkr4RpIDdfRxdiSD7XOcELq7uR29_Pj-uiIrQCPRA>
 <xmx:R3ScXX72jGXhSp9et4Ozz8fLijIADE2FOAGkly9RVWGnVmCZpibj2g>
 <xmx:R3ScXTcVyfIMYvYIORliDqx3idVHfkqApo0sKBaavfyGMizkx1Sgvw>
 <xmx:R3ScXfojpt_Rnuw48x2uiNvV2OK7aeA6NrKTls2tfOWU6JiXlw_g3A>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id E1EBCD6005B;
 Tue,  8 Oct 2019 07:34:27 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-clk@vger.kernel.org
Subject: [PATCH 2/2] clk: aspeed: Add RMII RCLK gates for both AST2500 MACs
Date: Tue,  8 Oct 2019 22:05:23 +1030
Message-Id: <20191008113523.13601-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008113523.13601-1-andrew@aj.id.au>
References: <20191008113523.13601-1-andrew@aj.id.au>
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
 linux-aspeed@lists.ozlabs.org, sboyd@kernel.org, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

RCLK is a fixed 50MHz clock derived from HPLL that is described by a
single gate for each MAC.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/clk/clk-aspeed.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index abf06fb6453e..867d8771bb1e 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -14,7 +14,7 @@
 
 #include "clk-aspeed.h"
 
-#define ASPEED_NUM_CLKS		36
+#define ASPEED_NUM_CLKS		38
 
 #define ASPEED_RESET2_OFFSET	32
 
@@ -28,6 +28,7 @@
 #define  AST2400_HPLL_BYPASS_EN	BIT(17)
 #define ASPEED_MISC_CTRL	0x2c
 #define  UART_DIV13_EN		BIT(12)
+#define ASPEED_MAC_CLK_DLY	0x48
 #define ASPEED_STRAP		0x70
 #define  CLKIN_25MHZ_EN		BIT(23)
 #define  AST2400_CLK_SOURCE_SEL	BIT(18)
@@ -462,6 +463,30 @@ static int aspeed_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(hw);
 	aspeed_clk_data->hws[ASPEED_CLK_MAC] = hw;
 
+	if (of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2500-scu")) {
+		/* RMII 50MHz RCLK */
+		hw = clk_hw_register_fixed_rate(dev, "mac12rclk", "hpll", 0,
+						50000000);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+
+		/* RMII1 50MHz (RCLK) output enable */
+		hw = clk_hw_register_gate(dev, "mac1rclk-gate", "mac12rclk", 0,
+				scu_base + ASPEED_MAC_CLK_DLY, 29, 0,
+				&aspeed_clk_lock);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+		aspeed_clk_data->hws[ASPEED_CLK_GATE_MAC1RCLK] = hw;
+
+		/* RMII2 50MHz (RCLK) output enable */
+		hw = clk_hw_register_gate(dev, "mac2rclk-gate", "mac12rclk", 0,
+				scu_base + ASPEED_MAC_CLK_DLY, 30, 0,
+				&aspeed_clk_lock);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+		aspeed_clk_data->hws[ASPEED_CLK_GATE_MAC2RCLK] = hw;
+	}
+
 	/* LPC Host (LHCLK) clock divider */
 	hw = clk_hw_register_divider_table(dev, "lhclk", "hpll", 0,
 			scu_base + ASPEED_CLK_SELECTION, 20, 3, 0,
-- 
2.20.1

