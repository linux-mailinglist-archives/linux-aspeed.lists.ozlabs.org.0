Return-Path: <linux-aspeed+bounces-2400-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 522CCBC0ABB
	for <lists+linux-aspeed@lfdr.de>; Tue, 07 Oct 2025 10:37:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgqJ56KTBz3000;
	Tue,  7 Oct 2025 19:37:09 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759826229;
	cv=none; b=gaVK3iKG+mU9Wj2gj/QL9gxERI+PivzUSoU4dfkVHt8i6sHf8J2Rtl845TYEiMs1SiUCY7P37oZ1WRnrxpP61UC96P0TSJm7ubrkeSqeW/NLJrd3+aCk/SYmUv2cCJyz2Fh8+K1cLeB5U/fEZvMRxTJDF0MWMtCo9U/Ki7Y3ZcFl5RTIhaXRUUF6NfnS7WpDtH7G4iBHJlwzo7i/j1GnzI4HfKoSIj20eUafUjIERxTuJVDd0mmNWZQTE2tSOAUEqNQBxn6I0cqd61+EqQEHEh5kIla0MkXOWNE+RUw7vqH7Agpp/1ch6jFCRIlvyBkkWRBAHfMtdrUmvDKqDdE6NA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759826229; c=relaxed/relaxed;
	bh=4+Ko8/6FsnseVRineMRqv6gJgFLaro8IQcwm9otxtFo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hmVP07mt5bHf9sqfFmVTTBR3ci7YZK9+WNWbY0rxmSCYL+MAP+Gw21nLZYnLXMOc9nkqxdyl2+y5vCDIB2xs+qeTHiXmA3CwASbaRBw5kLwe/UDVjnl2885ecVmA97sK0p6nEwh44Cuo5RcsBdBazGyWSJob40JOssFux8ZGBI6wUTpILLRRa36VAW4hThhOGdNkDzTVQ9FQR2rLAbgFisKnuV5kDvcPee3ZPLRTpnoI7PxOpQHgrQvcXbvQ7Vu3peqEjeExmfmpQPbzJXyKsSK95UKmsJ/ixhcEEVOqX0r/zwFgMa4HgM1mB1mVhXzOdq92owFp3b7k+SgNPtBMhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cgqJ52Y0Hz2xQ4
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Oct 2025 19:37:09 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 7 Oct
 2025 16:36:50 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 7 Oct 2025 16:36:50 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH 2/3] watchdog: aspeed: Support variable number of reset mask registers
Date: Tue, 7 Oct 2025 16:36:49 +0800
Message-ID: <20251007083650.2155317-3-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007083650.2155317-1-chin-ting_kuo@aspeedtech.com>
References: <20251007083650.2155317-1-chin-ting_kuo@aspeedtech.com>
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Starting from the AST2600 platform, the SoC design has become more
complex, with an increased number of reset mask registers.
To support this, introduce a new field 'num_reset_masks' in the
'aspeed_wdt_config' structure to specify the number of reset mask
registers per platform. This change removes the need for hardcoded
platform-specific logic and improves scalability for future SoCs.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/watchdog/aspeed_wdt.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 837e15701c0e..e15f70c5e416 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -35,6 +35,7 @@ struct aspeed_wdt_config {
 	u32 irq_shift;
 	u32 irq_mask;
 	struct aspeed_wdt_scu scu;
+	u32 num_reset_masks;
 };
 
 struct aspeed_wdt {
@@ -54,6 +55,7 @@ static const struct aspeed_wdt_config ast2400_config = {
 		.wdt_reset_mask = 0x1,
 		.wdt_reset_mask_shift = 1,
 	},
+	.num_reset_masks = 1,
 };
 
 static const struct aspeed_wdt_config ast2500_config = {
@@ -66,6 +68,7 @@ static const struct aspeed_wdt_config ast2500_config = {
 		.wdt_reset_mask = 0x1,
 		.wdt_reset_mask_shift = 2,
 	},
+	.num_reset_masks = 1,
 };
 
 static const struct aspeed_wdt_config ast2600_config = {
@@ -78,6 +81,7 @@ static const struct aspeed_wdt_config ast2600_config = {
 		.wdt_reset_mask = 0xf,
 		.wdt_reset_mask_shift = 16,
 	},
+	.num_reset_masks = 2,
 };
 
 static const struct of_device_id aspeed_wdt_of_table[] = {
@@ -482,8 +486,9 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	if ((of_device_is_compatible(np, "aspeed,ast2500-wdt")) ||
 		(of_device_is_compatible(np, "aspeed,ast2600-wdt"))) {
 		u32 reset_mask[2];
-		size_t nrstmask = of_device_is_compatible(np, "aspeed,ast2600-wdt") ? 2 : 1;
+		size_t nrstmask = wdt->cfg->num_reset_masks;
 		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
+		int i;
 
 		reg &= wdt->cfg->ext_pulse_width_mask;
 		if (of_property_read_bool(np, "aspeed,ext-active-high"))
@@ -503,9 +508,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 
 		ret = of_property_read_u32_array(np, "aspeed,reset-mask", reset_mask, nrstmask);
 		if (!ret) {
-			writel(reset_mask[0], wdt->base + WDT_RESET_MASK1);
-			if (nrstmask > 1)
-				writel(reset_mask[1], wdt->base + WDT_RESET_MASK2);
+			for (i = 0; i < nrstmask; i++)
+				writel(reset_mask[i], wdt->base + WDT_RESET_MASK1 + i * 4);
 		}
 	}
 
-- 
2.34.1


