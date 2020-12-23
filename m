Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 217B12E11DB
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Dec 2020 03:18:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0xhF2Vq2zDqSm
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Dec 2020 13:18:21 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LwtqYI1r; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0xh96fwXzDqLT
 for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Dec 2020 13:18:17 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 957A6221E5;
 Wed, 23 Dec 2020 02:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689895;
 bh=YsnGpQ60SFScxNogHK+LJ5qgKN29yodapC7t1SN1R6s=;
 h=From:To:Cc:Subject:Date:From;
 b=LwtqYI1r/nnaEG5L6bCJT3fSK6/QekXbyBE93+cgekRWNdAgq0UQlqB4PMc4H0KbY
 71IMTWLlVqjDm+Fm4WbgcwY5Cw7D6x20w/uxe/Uloqpx5R28l06sRefLVWPOY3XGxf
 klBH/AMStjGtfyQaharRd6ljolpuVOr/qEWh2YkCpLHLfCHqEfoYBoMrBnY/4P786j
 dlOdxl7LmlUsR995ZebrtCqvWYUMXTTb6304s8cVmvTKuq8cjHu/N37m1DvTeupdFJ
 rSiK7JqpkbAzRtkKzmWrQ+ABjMJ8NPp6wPItt+73ZBjyVlofv1szAvBuhlyH1BvgRq
 TNkDrjv3sC1tQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 001/130] soc: aspeed-lpc-ctrl: Fail probe of
 lpc-ctrl if reserved memory is not aligned
Date: Tue, 22 Dec 2020 21:16:04 -0500
Message-Id: <20201223021813.2791612-1-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Andrew Jeffery <andrew@aj.id.au>

[ Upstream commit 6bf4ddbe2b4805f0628922446a7e85e34013cd10 ]

Alignment is a hardware constraint of the LPC2AHB bridge, and misaligned
reserved memory will present as corrupted data.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Link: https://lore.kernel.org/r/20191016233950.10100-1-andrew@aj.id.au
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/aspeed/aspeed-lpc-ctrl.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
index 01ed21e8bfee5..dd147af494fdf 100644
--- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/log2.h>
 #include <linux/mfd/syscon.h>
 #include <linux/miscdevice.h>
 #include <linux/mm.h>
@@ -241,6 +242,18 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
 
 		lpc_ctrl->mem_size = resource_size(&resm);
 		lpc_ctrl->mem_base = resm.start;
+
+		if (!is_power_of_2(lpc_ctrl->mem_size)) {
+			dev_err(dev, "Reserved memory size must be a power of 2, got %u\n",
+			       (unsigned int)lpc_ctrl->mem_size);
+			return -EINVAL;
+		}
+
+		if (!IS_ALIGNED(lpc_ctrl->mem_base, lpc_ctrl->mem_size)) {
+			dev_err(dev, "Reserved memory must be naturally aligned for size %u\n",
+			       (unsigned int)lpc_ctrl->mem_size);
+			return -EINVAL;
+		}
 	}
 
 	lpc_ctrl->regmap = syscon_node_to_regmap(
-- 
2.27.0

