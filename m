Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3C1957933
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:57:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqJ32ZLsz3vWW
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OhUHDyUy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=devnull+forbidden405.outlook.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlYjm3w7sz3bq0;
	Thu, 29 Feb 2024 12:37:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9082DCE2367;
	Thu, 29 Feb 2024 01:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFD53C43394;
	Thu, 29 Feb 2024 01:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709170616;
	bh=heYg83dxzIz5cujo+bOCWW+22F7pnM8vLF2xYH8yigk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OhUHDyUyRYJzCuZTlPrer0GidchvAM55tHRU0ATq7RVF5pjhTjq6+W9lyhigwGhj9
	 10b/eRTZgLZWGVz1m1DquvMHD83P8aF5PSaI3SCwqrYAp2i/rT36sKrJ4ArJPbBf7c
	 BykBqeEyjeqFWYTld21qeIxVGMKmYhT3fVF8+0fbVY6liowQtJ+geAvjla9LTxED0w
	 G2VAMt/srRuDrj1Yw2cD/0o1nZNtmP/dlZfeIRiJFDdDfuaesol5yhPct1fP4Jbsq5
	 MOOJNLiGXbaRnh6v4rXW+XzlWhtNcSXxTBu55wU+j1Bsv5sagpF5hwQ7TJX3frwcEc
	 ZkrwFwaPmgYAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BB4C5478C;
	Thu, 29 Feb 2024 01:36:56 +0000 (UTC)
From: Yang Xiwen via B4 Relay <devnull+forbidden405.outlook.com@kernel.org>
Date: Thu, 29 Feb 2024 09:36:19 +0800
Subject: [PATCH v7 1/5] mmc: host: mmc_of_parse_clk_phase(): Pass struct
 device * instead of mmc_host *
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240229-b4-mmc-hi3798mv200-v7-1-10c03f316285@outlook.com>
References: <20240229-b4-mmc-hi3798mv200-v7-0-10c03f316285@outlook.com>
In-Reply-To: <20240229-b4-mmc-hi3798mv200-v7-0-10c03f316285@outlook.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Jaehoon Chung <jh80.chung@samsung.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709170614; l=2509;
 i=forbidden405@outlook.com; s=20240228; h=from:subject:message-id;
 bh=JGOc4wQUSQd78IPQsA2tfrngj58AF1LgtdpM/cwsBoQ=;
 b=UVqVEYvRkoStMPjWxXuTEvzYTOUu7ddzRxFdip+h1ByO1Lh/wnpwRKTzYHt0P28BTnNQp+I4P
 n0y12Yz5P4NAAvWU9ov7tXym7NsiWsqVYUyaE1QKyGF0JLrPccJdHg3
X-Developer-Key: i=forbidden405@outlook.com; a=ed25519;
 pk=KAWv6ZzFsT54MGllOczJgFiWB+DuayEmyn24iiVVThU=
X-Endpoint-Received:  by B4 Relay for forbidden405@outlook.com/20240228 with auth_id=136
X-Original-From: Yang Xiwen <forbidden405@outlook.com>
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Reply-To: forbidden405@outlook.com
Cc: devicetree@vger.kernel.org, tianshuliang <tianshuliang@hisilicon.com>, linux-aspeed@lists.ozlabs.org, Paul Menzel <pmenzel@molgen.mpg.de>, Igor Opaniuk <igor.opaniuk@linaro.org>, openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Yang Xiwen <forbidden405@outlook.com>, David Yang <mmyangfl@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Yang Xiwen <forbidden405@outlook.com>

Parsing dt usually happens very early, sometimes even before struct
mmc_host is allocated (e.g. dw_mci_probe() and dw_mci_parse_dt() in
dw_mmc.c). Looking at the source of mmc_of_parse_clk_phase(), it's
actually not mandatory to have an initialized mmc_host first, instead we
can pass struct device * to it directly.

Also fix the only current user (sdhci-of-aspeed.c).

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Signed-off-by: Yang Xiwen <forbidden405@outlook.com>
---
 drivers/mmc/core/host.c            | 4 +---
 drivers/mmc/host/sdhci-of-aspeed.c | 2 +-
 include/linux/mmc/host.h           | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index cf396e8f34e9..8b2844ac5dc5 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -234,10 +234,8 @@ static void mmc_of_parse_timing_phase(struct device *dev, const char *prop,
 }
 
 void
-mmc_of_parse_clk_phase(struct mmc_host *host, struct mmc_clk_phase_map *map)
+mmc_of_parse_clk_phase(struct device *dev, struct mmc_clk_phase_map *map)
 {
-	struct device *dev = host->parent;
-
 	mmc_of_parse_timing_phase(dev, "clk-phase-legacy",
 				  &map->phase[MMC_TIMING_LEGACY]);
 	mmc_of_parse_timing_phase(dev, "clk-phase-mmc-hs",
diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 42d54532cabe..430c1f90037b 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -435,7 +435,7 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
 		goto err_sdhci_add;
 
 	if (dev->phase_desc)
-		mmc_of_parse_clk_phase(host->mmc, &dev->phase_map);
+		mmc_of_parse_clk_phase(&pdev->dev, &dev->phase_map);
 
 	ret = sdhci_add_host(host);
 	if (ret)
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 2f445c651742..5894bf912f7b 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -539,7 +539,7 @@ struct mmc_host *devm_mmc_alloc_host(struct device *dev, int extra);
 int mmc_add_host(struct mmc_host *);
 void mmc_remove_host(struct mmc_host *);
 void mmc_free_host(struct mmc_host *);
-void mmc_of_parse_clk_phase(struct mmc_host *host,
+void mmc_of_parse_clk_phase(struct device *dev,
 			    struct mmc_clk_phase_map *map);
 int mmc_of_parse(struct mmc_host *host);
 int mmc_of_parse_voltage(struct mmc_host *host, u32 *mask);

-- 
2.43.0

