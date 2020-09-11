Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA45E265AD8
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 09:51:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnnyh2ytbzDqng
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 17:51:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=hofk5gxq; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=KiO0OuYo; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnnyG674FzDqkZ
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 17:51:34 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id EDF37C42;
 Fri, 11 Sep 2020 03:45:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 11 Sep 2020 03:45:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=pDChSN39tqRkN
 QAM7YiAOJfg0uxG4cS03G6jTG8UuWU=; b=hofk5gxqzfZMlnCwbiwg9B5CtDrOB
 O3J8C7PDvsiFJkapAEDjWH0k1GPZbntdJEnsvwQTuXaViPqPf4tZgmDUpHuRStph
 4nEg0+fYQN+IEsoiqoSJYZ6qfT+A6TnhoKwlXPUV+gD8i8se5y4r8HHMwnzczjAW
 vmIo54g6YiWUHF2/kobha3fTKS7VCEdjBzEWQC+R9kv88HiTE/t4l8NRY6ZKeDPZ
 F3d8kdDgovxJaytYUTyU//KGp9+amQZR0Hj306c5OZIID9SY9qF6bbvwJ9Y7/3Kj
 VxZCEU+ujVlMFJqk7+1kgK7DJZxf/up7CpLjuO1vZ6WVBGljQq3jtRauw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=pDChSN39tqRkNQAM7YiAOJfg0uxG4cS03G6jTG8UuWU=; b=KiO0OuYo
 FBnrYLzuXzpCvor9RRcZ48NfDlhmukO9i1lnix/H88i0onTcUc6hf7SD1eYajrwE
 5a3K7hwQgGdG6iXLFR6+aOpAIgmjZQGQYTKgaxZkIhhkiFEy0+qlZzzUV9eMDM2a
 9cRbbgHXwXiq6PQUTY9YZa0rfy2ZqykUM7r/YltDmShXtbGOmMqV6XYfIRbbYCJk
 YliPdukwkG9Fva3x4ENd+v7i6qOnPXoOj4F4kdpxKw41zZcXOK6acqvZM7bN91tf
 yXF+o+lnlPktULL9rI7evF9NJ5Wpc/U+JR802nB3I358HlIexa0av9h/X7CcADvj
 XbBg0wJ2Xt1BtQ==
X-ME-Sender: <xms:HytbX5uPoP5pWEqnyw2_6DtuVow6PU78Cc_NnWIWOthADEQUWpl9yA>
 <xme:HytbXyeDPMBVVyAts2tEg6J8WnShhviP5WM0AbdPAhggEQvRNHug7Yhd1vcQAcdy2
 iWZwQQlahQINu5wew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehkedguddvgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfies
 rghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgle
 etteejffelffdvudduveeiffegteelvefhteenucfkphepudegrddvrddutdelrdekheen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurh
 gvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:HytbX8w57eha_xrzg8YodIcT7KVnsfeLtIRqQQt_eHU42_uJfCIGaQ>
 <xmx:HytbXwNQ4sMOLPMwx_5WqLDkMGmxP7jIcSLPvrG42Y3xwexQI2t66A>
 <xmx:HytbX5-HRlScUrGDWyKykwOa2jla0mq83epAvlFYR-U-tQSgFd22KQ>
 <xmx:HytbX1Y_AHGYsMQtHn_4-Oz-C8RhsdMAOJRq6u5UQCTJq5uqBSGZGw>
Received: from mistburn.lan
 (ppp14-2-109-85.adl-apt-pir-bras32.tpg.internode.on.net [14.2.109.85])
 by mail.messagingengine.com (Postfix) with ESMTPA id D38BC3064682;
 Fri, 11 Sep 2020 03:45:32 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH v2 2/3] mmc: sdhci-of-aspeed: Expose phase delay tuning
Date: Fri, 11 Sep 2020 17:14:51 +0930
Message-Id: <20200911074452.3148259-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200911074452.3148259-1-andrew@aj.id.au>
References: <20200911074452.3148259-1-andrew@aj.id.au>
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
Cc: ulf.hansson@linaro.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The Aspeed SD/eMMC controllers feature up to two SDHCIs alongside a
a set of "global" configuration registers. The global configuration
registers house controller-specific settings that aren't exposed by the
SDHCI, one example being a register for phase tuning.

The phase tuning feature is new in the AST2600 design. It's exposed as a
single register in the global register set and controls both the input
and output phase adjustment for each slot. As the settings are
slot-specific, the values to program are extracted from properties in
the SDHCI devicetree nodes.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
In v2:

* Rework devicetree parsing to minimise state disruption
* Switch some log statements from dev_info() to dev_dbg()
---
 drivers/mmc/host/sdhci-of-aspeed.c | 126 +++++++++++++++++++++++++++--
 1 file changed, 121 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 4f008ba3280e..c61eb42e1ebb 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -16,9 +16,19 @@
 
 #include "sdhci-pltfm.h"
 
-#define ASPEED_SDC_INFO		0x00
-#define   ASPEED_SDC_S1MMC8	BIT(25)
-#define   ASPEED_SDC_S0MMC8	BIT(24)
+#define ASPEED_SDC_INFO			0x00
+#define   ASPEED_SDC_S1_MMC8		BIT(25)
+#define   ASPEED_SDC_S0_MMC8		BIT(24)
+#define ASPEED_SDC_PHASE		0xf4
+#define   ASPEED_SDC_S1_PHASE_IN	GENMASK(25, 21)
+#define   ASPEED_SDC_S0_PHASE_IN	GENMASK(20, 16)
+#define   ASPEED_SDC_S1_PHASE_OUT	GENMASK(15, 11)
+#define   ASPEED_SDC_S1_PHASE_IN_EN	BIT(10)
+#define   ASPEED_SDC_S1_PHASE_OUT_EN	GENMASK(9, 8)
+#define   ASPEED_SDC_S0_PHASE_OUT	GENMASK(7, 3)
+#define   ASPEED_SDC_S0_PHASE_IN_EN	BIT(2)
+#define   ASPEED_SDC_S0_PHASE_OUT_EN	GENMASK(1, 0)
+#define   ASPEED_SDC_PHASE_MAX		31
 
 struct aspeed_sdc {
 	struct clk *clk;
@@ -28,9 +38,21 @@ struct aspeed_sdc {
 	void __iomem *regs;
 };
 
+struct aspeed_sdhci_phase_desc {
+	u32 value_mask;
+	u32 enable_mask;
+	u8 enable_value;
+};
+
+struct aspeed_sdhci_phase {
+	struct aspeed_sdhci_phase_desc in;
+	struct aspeed_sdhci_phase_desc out;
+};
+
 struct aspeed_sdhci {
 	struct aspeed_sdc *parent;
 	u32 width_mask;
+	const struct aspeed_sdhci_phase *phase;
 };
 
 static void aspeed_sdc_configure_8bit_mode(struct aspeed_sdc *sdc,
@@ -50,6 +72,22 @@ static void aspeed_sdc_configure_8bit_mode(struct aspeed_sdc *sdc,
 	spin_unlock(&sdc->lock);
 }
 
+static void
+aspeed_sdc_configure_phase(struct aspeed_sdc *sdc,
+			   const struct aspeed_sdhci_phase_desc *phase,
+			   uint8_t value)
+{
+	u32 reg;
+
+	spin_lock(&sdc->lock);
+	reg = readl(sdc->regs + ASPEED_SDC_PHASE);
+	reg &= ~(phase->enable_mask | phase->value_mask);
+	reg |= value << __ffs(phase->value_mask);
+	reg |= phase->enable_value << __ffs(phase->enable_mask);
+	writel(reg, sdc->regs + ASPEED_SDC_PHASE);
+	spin_unlock(&sdc->lock);
+}
+
 static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 {
 	struct sdhci_pltfm_host *pltfm_host;
@@ -155,8 +193,49 @@ static inline int aspeed_sdhci_calculate_slot(struct aspeed_sdhci *dev,
 	return (delta / 0x100) - 1;
 }
 
+static int aspeed_sdhci_configure_of(struct platform_device *pdev,
+				     struct aspeed_sdhci *sdhci)
+{
+	struct device_node *np;
+	struct device *dev;
+	u32 phase;
+
+	if (!sdhci->phase)
+		return 0;
+
+	dev = &pdev->dev;
+	np = dev->of_node;
+
+	if (!of_property_read_u32(np, "aspeed,input-phase", &phase)) {
+		if (phase <= ASPEED_SDC_PHASE_MAX) {
+			aspeed_sdc_configure_phase(sdhci->parent,
+						   &sdhci->phase->in,
+						   phase);
+			dev_dbg(dev, "Input phase adjustment: %u", phase);
+		} else {
+			dev_err(dev, "Invalid input phase value: %u", phase);
+			return -EINVAL;
+		}
+	}
+
+	if (!of_property_read_u32(np, "aspeed,output-phase", &phase)) {
+		if (phase <= ASPEED_SDC_PHASE_MAX) {
+			aspeed_sdc_configure_phase(sdhci->parent,
+						   &sdhci->phase->out,
+						   phase);
+			dev_dbg(dev, "Output phase adjustment: %u", phase);
+		} else {
+			dev_err(dev, "Invalid output phase value: %u", phase);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static int aspeed_sdhci_probe(struct platform_device *pdev)
 {
+	const struct aspeed_sdhci_phase *phase;
 	struct sdhci_pltfm_host *pltfm_host;
 	struct aspeed_sdhci *dev;
 	struct sdhci_host *host;
@@ -181,7 +260,10 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	dev_info(&pdev->dev, "Configuring for slot %d\n", slot);
-	dev->width_mask = !slot ? ASPEED_SDC_S0MMC8 : ASPEED_SDC_S1MMC8;
+	dev->width_mask = !slot ? ASPEED_SDC_S0_MMC8 : ASPEED_SDC_S1_MMC8;
+	phase = of_device_get_match_data(&pdev->dev);
+	if (phase)
+		dev->phase = &phase[slot];
 
 	sdhci_get_of_property(pdev);
 
@@ -195,6 +277,10 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
 		goto err_pltfm_free;
 	}
 
+	ret = aspeed_sdhci_configure_of(pdev, dev);
+	if (ret)
+		goto err_sdhci_add;
+
 	ret = mmc_of_parse(host->mmc);
 	if (ret)
 		goto err_sdhci_add;
@@ -230,10 +316,40 @@ static int aspeed_sdhci_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct aspeed_sdhci_phase ast2600_sdhci_phase[] = {
+	/* SDHCI/Slot 0 */
+	[0] = {
+		.in = {
+			.value_mask = ASPEED_SDC_S0_PHASE_IN,
+			.enable_mask = ASPEED_SDC_S0_PHASE_IN_EN,
+			.enable_value = 1,
+		},
+		.out = {
+			.value_mask = ASPEED_SDC_S0_PHASE_OUT,
+			.enable_mask = ASPEED_SDC_S0_PHASE_OUT_EN,
+			.enable_value = 3,
+		},
+	},
+	/* SDHCI/Slot 1 */
+	[1] = {
+		.in = {
+			.value_mask = ASPEED_SDC_S1_PHASE_IN,
+			.enable_mask = ASPEED_SDC_S1_PHASE_IN_EN,
+			.enable_value = 1,
+		},
+		.out = {
+			.value_mask = ASPEED_SDC_S1_PHASE_OUT,
+			.enable_mask = ASPEED_SDC_S1_PHASE_OUT_EN,
+			.enable_value = 3,
+		},
+	},
+};
+
+/* If supported, phase adjustment fields are stored in the data pointer */
 static const struct of_device_id aspeed_sdhci_of_match[] = {
 	{ .compatible = "aspeed,ast2400-sdhci", },
 	{ .compatible = "aspeed,ast2500-sdhci", },
-	{ .compatible = "aspeed,ast2600-sdhci", },
+	{ .compatible = "aspeed,ast2600-sdhci", .data = ast2600_sdhci_phase },
 	{ }
 };
 
-- 
2.25.1

