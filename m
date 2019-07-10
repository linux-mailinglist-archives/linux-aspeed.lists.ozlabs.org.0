Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BB5647CF
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jul 2019 16:10:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kLgw5311zDqRx
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jul 2019 00:10:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Kz5a5tTx"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="sjRKgULh"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kLgN66FgzDqM7
 for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jul 2019 00:10:23 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DE6A3220A3;
 Wed, 10 Jul 2019 10:10:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Jul 2019 10:10:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=oEpi+6+0w26RCxBP4UT6DzJfnA
 X/f9uFoVKZM8Skn8A=; b=Kz5a5tTxNyorBcpc+UNoDcGZpcJKbJC4GIVEch3yMC
 Rhi3ealHNcRancfrfjCRkHgsXQBmT1B55ANVKy9S0SYuEXYdroWXy0G07sMA8BBu
 CNfXnuAcI29EpjBlakDLLMqJoDttEkzNecg47h2RUXU1qbU9dd8jxbmfMo8c6CCx
 JWv0ZjpQM9BrCMhVMUC+TOrNNlvnMI4HmRrZGmFAAvXzPpaneWpaDx+DjaOshBYJ
 +xeGhGESLn9jBWUshcUU4fISJVA1ndYMFre96rIbKJ1bUHoWzgQE+pPLAqV+Pcdm
 s4I8NUEB/03sBb3bmRYxRqSPNvwouIcf98U1twAUiSFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=oEpi+6+0w26RCxBP4
 UT6DzJfnAX/f9uFoVKZM8Skn8A=; b=sjRKgULhpy0LQqshO1disWZtV/hBTF9wo
 ZlAq/FM7O7aKxYNtCcqCk4YlTvJnGeahvgjtCzKNEG9HHZYqmo7YQrpDfR87kEel
 cCu4WeDaL7nywSRsLUsOTMrGDmmZ7O9pOuEAw3Qfn5var7OQan+RAd5ysijMJHJX
 2ljMxd/j3wTifFaNlE1OuYsNbaXSUhvuWwH/AeU8YncMNVDdFAYIl9LVCtcAD5QE
 We94FlOQojDdQXn54u0ZVO5FMX6EkhRqePNBPDUZ/tzquYgK+gbEu8vkmte+kF4D
 dFX0pYQuJyC2tUI+FMTn+3y8FdT1cDdSlJc1h2twwidxoLj3AGz5Q==
X-ME-Sender: <xms:yvElXSJ4SG24WGntwpZq-QBpuocYYGJTvyrV03fgEaxsujcTvdUypQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeeigdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptehnughrvgifucfl
 vghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhppedugedrvddrke
 ehrddvvdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgr
 uhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:yvElXfIcN6wa89Aem-4o4cq38mA6Xrmkk5-Hb03MnH6UqQb-FaOebg>
 <xmx:yvElXakMZ5-q5tbO8BrhEtIai9q7FXkPuMj5my6h0KhtqgbRPes0XA>
 <xmx:yvElXVOODzsYKupGZl8u3YtjMfBeq7L7n73PZ5VZAYzn400fbDUcNA>
 <xmx:y_ElXVuCWTBgi4BF9t9TP_KiIZHwFybqQBRRBBabXpVOomzIsQPZeg>
Received: from localhost.localdomain
 (ppp14-2-85-22.adl-apt-pir-bras31.tpg.internode.on.net [14.2.85.22])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9E52780064;
 Wed, 10 Jul 2019 10:10:14 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-clk@vger.kernel.org
Subject: [PATCH] clk: aspeed: Add SDIO gate
Date: Wed, 10 Jul 2019 23:40:09 +0930
Message-Id: <20190710141009.20651-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
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
Cc: linux-aspeed@lists.ozlabs.org, sboyd@kernel.org, mturquette@baylibre.com,
 ryanchen.aspeed@gmail.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Joel Stanley <joel@jms.id.au>

The clock divisor comes with an enable bit (gate). This was not
implemented as we didn't have access to SD hardware when writing the
driver. Now that we can test it, add the gate as a parent to the
divisor.

There is no reason to expose the gate separately, so users will enable
it by turning on the ASPEED_CLK_SDIO divisor.

Signed-off-by: Joel Stanley <joel@jms.id.au>
[aj: Minor style cleanup]
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/clk/clk-aspeed.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index 42b4df6ba249..898291501f45 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -500,9 +500,14 @@ static int aspeed_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(hw);
 	aspeed_clk_data->hws[ASPEED_CLK_MPLL] =	hw;
 
-	/* SD/SDIO clock divider (TODO: There's a gate too) */
-	hw = clk_hw_register_divider_table(dev, "sdio", "hpll", 0,
-			scu_base + ASPEED_CLK_SELECTION, 12, 3, 0,
+	/* SD/SDIO clock divider and gate */
+	hw = clk_hw_register_gate(dev, "sd_extclk_gate", "hpll", 0,
+				  scu_base + ASPEED_CLK_SELECTION, 15, 0,
+				  &aspeed_clk_lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	hw = clk_hw_register_divider_table(dev, "sd_extclk", "sd_extclk_gate",
+			0, scu_base + ASPEED_CLK_SELECTION, 12, 3, 0,
 			soc_data->div_table,
 			&aspeed_clk_lock);
 	if (IS_ERR(hw))
-- 
2.20.1

