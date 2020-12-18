Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A07A2DDD71
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Dec 2020 04:54:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cxw3Y1yGQzDqWr
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Dec 2020 14:54:33 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=gpfMTTE/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=F5F/Oran; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cxw3J1X5gzDqWj
 for <linux-aspeed@lists.ozlabs.org>; Fri, 18 Dec 2020 14:54:20 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 31A925C00F4;
 Thu, 17 Dec 2020 22:54:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 17 Dec 2020 22:54:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=hVMm4VwyoVE0E
 1Ux9HqgKQndPgPApnbPx+tXCVQwpSw=; b=gpfMTTE/U32PUFTes52Qgv/CR1mk1
 NM/zsiRxFC67rlwIMMCd1Cp+DC2svIhE34KdjXUmIvKBVMvsRPK03xZNOkeANFn7
 ix9Mrld8yp12wVz/xCvOpnSkDcDquynTISCHRqaeta/GkPCqgHV5NgqHGURsBWLt
 ohkAuohjyHH4W9wd7JXutrpWGYqQwYGz6PLgAHJg8Vbx5TCY7SyDrxB+SCyoeTEl
 rvxGgkR3ezjVvSVacDTP7XBBwS9hS7WtR5ygfVIVeapWlopaDsEVMop9waSwxytA
 aBYzDGOgAcFCwo6tcTUzM5GSSTA4Z0w8asuAP1mPk01QTgDU3XYzadwNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=hVMm4VwyoVE0E1Ux9HqgKQndPgPApnbPx+tXCVQwpSw=; b=F5F/Oran
 E546fmjMkcj/dza/pZykL3+pY2l7lq+wwrCZhbGusjYqfBtbC65qNBu8rjxQizvQ
 MDaFDv0QetwqiLRJ7kKjlyjYk+07+CJdC6dF7oOIufqjvSH/S2hNNtpbQ9YQPhLl
 QW/XgXbHtuSrIEejyl7jNJWqPXQiKkxv1v+QE8hStrOS6UYujizTBeZRiZOFUozb
 khNFg7G8ENcu+rxomGDNYXIKd4ccqdiFDCQQY7o2oAnls/uX8PxIPIJhSJgcTmqG
 gyLP7vidFAViSrpntTR5dlKpoAbh8YrWcvbxDctjWaWlD9Jpidv5hk37bfPuM3PT
 /to6a8vcDGroeA==
X-ME-Sender: <xms:6ifcX--B6d9xJd9vTmCCCEFWW0Zx-9SoIQL6LOToeA13AsEA4PsboQ>
 <xme:6ifcX8ganQTAucLpW2XtK737gCPu_SuaKC8E3MzVVsb4VHv58EkoboPzoukb0amA0
 nOdhKl1zZyIW8Cxsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudelhedgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppeduvddtrddvtddrjeejrddvuddu
 necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprghnug
 hrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:6ifcX-dMleqTJCIJ3QjsoSVc7VKwBDCkBtE97QTy8SYFcW2jcw_Cdw>
 <xmx:6ifcXzqWM4rwcCrRXGwNU-4iDYkBcK4UG6bD7M0yxA0W3jXrXtw5-g>
 <xmx:6ifcXzAmUoKqaFepzBEC8gsfWyc7Jg_75tP_PYaIMaeaqEV-k4noLw>
 <xmx:6ifcX0LWzBWjuq9yFknA6cIVrpD2SFrKtfNzi0pLHHl9RU6DBOk3kQ>
Received: from localhost.localdomain (unknown [120.20.77.211])
 by mail.messagingengine.com (Postfix) with ESMTPA id D1B951080057;
 Thu, 17 Dec 2020 22:54:12 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH v6 4/6] mmc: sdhci-of-aspeed: Add KUnit tests for phase
 calculations
Date: Fri, 18 Dec 2020 14:23:36 +1030
Message-Id: <20201218035338.1130849-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201218035338.1130849-1-andrew@aj.id.au>
References: <20201218035338.1130849-1-andrew@aj.id.au>
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
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Converting degrees of phase to logic delays is irritating to test on
hardware, so lets exercise the function using KUnit.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/mmc/host/Kconfig                |  14 ++++
 drivers/mmc/host/Makefile               |   1 +
 drivers/mmc/host/sdhci-of-aspeed-test.c | 100 ++++++++++++++++++++++++
 3 files changed, 115 insertions(+)
 create mode 100644 drivers/mmc/host/sdhci-of-aspeed-test.c

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index 596f32637315..d6f00d1d6251 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -168,6 +168,20 @@ config MMC_SDHCI_OF_ASPEED
 
 	  If unsure, say N.
 
+config MMC_SDHCI_OF_ASPEED_TEST
+	bool "Tests for the ASPEED SDHCI driver"
+	depends on MMC_SDHCI_OF_ASPEED && KUNIT=y
+	help
+	  Enable KUnit tests for the ASPEED SDHCI driver. Select this
+	  option only if you will boot the kernel for the purpose of running
+	  unit tests (e.g. under UML or qemu).
+
+	  The KUnit tests generally exercise parts of the driver that do not
+	  directly touch the hardware, for example, the phase correction
+	  calculations.
+
+	  If unsure, say N.
+
 config MMC_SDHCI_OF_AT91
 	tristate "SDHCI OF support for the Atmel SDMMC controller"
 	depends on MMC_SDHCI_PLTFM
diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
index 451c25fc2c69..3ee59d5802cf 100644
--- a/drivers/mmc/host/Makefile
+++ b/drivers/mmc/host/Makefile
@@ -90,6 +90,7 @@ obj-$(CONFIG_MMC_SDHCI_DOVE)		+= sdhci-dove.o
 obj-$(CONFIG_MMC_SDHCI_TEGRA)		+= sdhci-tegra.o
 obj-$(CONFIG_MMC_SDHCI_OF_ARASAN)	+= sdhci-of-arasan.o
 obj-$(CONFIG_MMC_SDHCI_OF_ASPEED)	+= sdhci-of-aspeed.o
+obj-$(CONFIG_MMC_SDHCI_OF_ASPEED_TEST)	+= sdhci-of-aspeed-test.o
 obj-$(CONFIG_MMC_SDHCI_OF_AT91)		+= sdhci-of-at91.o
 obj-$(CONFIG_MMC_SDHCI_OF_ESDHC)	+= sdhci-of-esdhc.o
 obj-$(CONFIG_MMC_SDHCI_OF_HLWD)		+= sdhci-of-hlwd.o
diff --git a/drivers/mmc/host/sdhci-of-aspeed-test.c b/drivers/mmc/host/sdhci-of-aspeed-test.c
new file mode 100644
index 000000000000..fb79b278fb81
--- /dev/null
+++ b/drivers/mmc/host/sdhci-of-aspeed-test.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (C) 2020 IBM Corp. */
+
+#include <kunit/test.h>
+
+#include "sdhci-of-aspeed.c"
+
+static void aspeed_sdhci_phase_ddr52(struct kunit *test)
+{
+	int rate = 52000000;
+
+	KUNIT_EXPECT_EQ(test, 0,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 0));
+	KUNIT_EXPECT_EQ(test, 0,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 1));
+	KUNIT_EXPECT_EQ(test, 1,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 2));
+	KUNIT_EXPECT_EQ(test, 1,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 3));
+	KUNIT_EXPECT_EQ(test, 2,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 4));
+	KUNIT_EXPECT_EQ(test, 3,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 5));
+	KUNIT_EXPECT_EQ(test, 14,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 23));
+	KUNIT_EXPECT_EQ(test, 15,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 24));
+	KUNIT_EXPECT_EQ(test, 15,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 25));
+
+	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 0,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 180));
+	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 0,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 181));
+	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 182));
+	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 183));
+	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 2,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 184));
+	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 3,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 185));
+	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 14,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 203));
+	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 204));
+	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 205));
+}
+
+static void aspeed_sdhci_phase_hs200(struct kunit *test)
+{
+	int rate = 200000000;
+
+	KUNIT_EXPECT_EQ(test, 0,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 0));
+	KUNIT_EXPECT_EQ(test, 0,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 5));
+	KUNIT_EXPECT_EQ(test, 1,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 6));
+	KUNIT_EXPECT_EQ(test, 1,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 7));
+	KUNIT_EXPECT_EQ(test, 14,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 89));
+	KUNIT_EXPECT_EQ(test, 15,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 90));
+	KUNIT_EXPECT_EQ(test, 15,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 91));
+	KUNIT_EXPECT_EQ(test, 15,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 96));
+
+	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 180));
+	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 185));
+	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 186));
+	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 187));
+	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 14,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 269));
+	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 270));
+	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 271));
+	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
+			aspeed_sdhci_phase_to_tap(NULL, rate, 276));
+}
+
+static struct kunit_case aspeed_sdhci_test_cases[] = {
+	KUNIT_CASE(aspeed_sdhci_phase_ddr52),
+	KUNIT_CASE(aspeed_sdhci_phase_hs200),
+	{}
+};
+
+static struct kunit_suite aspeed_sdhci_test_suite = {
+	.name = "sdhci-of-aspeed",
+	.test_cases = aspeed_sdhci_test_cases,
+};
+kunit_test_suite(aspeed_sdhci_test_suite);
-- 
2.27.0

