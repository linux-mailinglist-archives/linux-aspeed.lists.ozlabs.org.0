Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0BB2FFAFC
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Jan 2021 04:24:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMPkF28wdzDrZZ
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Jan 2021 14:24:05 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=KO663zyD; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=WSeMlxF1; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMPjx1jWNzDr7F
 for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Jan 2021 14:23:48 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 5266C5C0243;
 Thu, 21 Jan 2021 22:23:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 21 Jan 2021 22:23:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=uHl38MxIF2SnkIQDM+hVwSbWSG
 wnRbserqxthYXHezg=; b=KO663zyD/3pyTPh3b/pPhr2bd0HVJGuaA/lBksmvQP
 cN7tshvTGCOBs74DqkOpfZYANgKwKcUeUYvmuBbqAFtKH4xTWy2iD4VazUiR9g+5
 kv6nHUj2LfapSc2zvx30tZI2qQPCBHM529Bm305pWWAFYLdL2r0JBXpIAQWfOCyw
 Q+WRtuNapGdfuvyAdVA/oLQEHA0GEjg128g/XxThHUfo/W496wd74hUpFN9/QX3A
 yHVagsSc0U+NCNwOpMOvnuoAgmB2XU+QYOXXIa962+GgZ4P8gPtjjIk5mXQgPdji
 KLqLG9oC7UB5Ie2k0bzl/5MGdCpQpqsqWbThHjZXP3IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=uHl38MxIF2SnkIQDM
 +hVwSbWSGwnRbserqxthYXHezg=; b=WSeMlxF1oXVSNgcZDTUxOWVIAYmq1AsvW
 jFQK6rSVcs6L0Bw4ty3WcmVdMKK3nCjB3tQT0Xs+mAnIcwD7toxnTYAGLa6E2JxN
 4W4/pm/psWfs5JRczaAzV1D1woDgpIsINAfIsXiJ2r/Mcw6HtcUdk9rU5r6NNQ58
 5o2dlDqdo1EPptEMyUqrY8FQGyeenIC7UfQKVb+pDQX2k5E/Kg8KXXkDJm/iVUCD
 J8P4L9TwLdCBiKrFeHWc7lROX6qVquG/nW40v2UFIDRQ4tyyDB31bbcjfiwEUzi0
 lESx1AQrUC0C9AHFS/9ogsiCaC7NWrWJHWGB5ZkFe+pAD2hI6y07w==
X-ME-Sender: <xms:QEUKYJyc6CbyUv3awMdvv0LNWORLguNfMmdDrRZ-s1zM-37iJmHNmA>
 <xme:QEUKYJTyhH1jk28biAY-hiBLs7VFZ7O3a6CpDrLg5vE5bdWRlNRMwTGgU6RgnFQEL
 vNpv-xAMT0SFXrLig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptehnughrvgifucfl
 vghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrfgrthhtvghrnh
 epkefhieffjeevfeevhedtieeihfefvdejledvvddthefftedujeethfeuueelfedtnecu
 kfhppedvtdefrdehjedrvdduhedrvdefvdenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:QEUKYDWZXNOR00_aI5j5h4cLuEyFG-pL4V4JPLLRhu7TMS2vvpc9cg>
 <xmx:QEUKYLhF0qcRZvlA0u0ovt2DjashUHeqCF_WlBjdt2zlwH731KztOg>
 <xmx:QEUKYLDDDnEObcm_XFFZRNuxWNMUfmceVsFJFRYdvigpNkP5eWSXnA>
 <xmx:QUUKYN1gZtQkgD50r8vFTGT-SdopDqRQhKkdL-_aGCzkDnMZaTx5Ng>
Received: from localhost.localdomain (203-57-215-232.dyn.iinet.net.au
 [203.57.215.232])
 by mail.messagingengine.com (Postfix) with ESMTPA id 18841108005B;
 Thu, 21 Jan 2021 22:23:40 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH] mmc: sdhci-of-aspeed: Fix kunit-related build error
Date: Fri, 22 Jan 2021 13:53:34 +1030
Message-Id: <20210122032334.3663056-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
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
 Randy Dunlap <rdunlap@infradead.org>, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Randy found that with the following Kconfig settings we have duplicate
definitions (e.g. __inittest()) in sdhci-of-aspeed due to competing
module_init()/module_exit() calls from kunit and driver the itself.

```
CONFIG_MMC_SDHCI_OF_ASPEED=m
CONFIG_MMC_SDHCI_OF_ASPEED_TEST=y
```

Conditionally open-code the kunit initialisation to avoid the error.

Fixes: 7efa02a981d6 ("mmc: sdhci-of-aspeed: Add KUnit tests for phase calculations")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/mmc/host/sdhci-of-aspeed-test.c |  9 ++++++++-
 drivers/mmc/host/sdhci-of-aspeed.c      | 27 ++++++++++++++++++++-----
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed-test.c b/drivers/mmc/host/sdhci-of-aspeed-test.c
index 34070605b28b..e5edda6c6e60 100644
--- a/drivers/mmc/host/sdhci-of-aspeed-test.c
+++ b/drivers/mmc/host/sdhci-of-aspeed-test.c
@@ -95,4 +95,11 @@ static struct kunit_suite aspeed_sdhci_test_suite = {
 	.name = "sdhci-of-aspeed",
 	.test_cases = aspeed_sdhci_test_cases,
 };
-kunit_test_suite(aspeed_sdhci_test_suite);
+
+static struct kunit_suite *aspeed_sdhci_test_suite_array[] = {
+	&aspeed_sdhci_test_suite,
+	NULL,
+};
+
+static struct kunit_suite **aspeed_sdhci_test_suites
+	__used __section(".kunit_test_suites") = aspeed_sdhci_test_suite_array;
diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 3b0d381e1215..1446f23a2bfb 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -556,6 +556,10 @@ static struct platform_driver aspeed_sdc_driver = {
 	.remove		= aspeed_sdc_remove,
 };
 
+#if defined(CONFIG_MMC_SDHCI_OF_ASPEED_TEST)
+#include "sdhci-of-aspeed-test.c"
+#endif
+
 static int __init aspeed_sdc_init(void)
 {
 	int rc;
@@ -566,7 +570,20 @@ static int __init aspeed_sdc_init(void)
 
 	rc = platform_driver_register(&aspeed_sdc_driver);
 	if (rc < 0)
-		platform_driver_unregister(&aspeed_sdhci_driver);
+		goto cleanup_sdhci;
+
+#if defined(CONFIG_MMC_SDHCI_OF_ASPEED_TEST)
+	rc = __kunit_test_suites_init(aspeed_sdhci_test_suites);
+	if (rc < 0) {
+		platform_driver_unregister(&aspeed_sdc_driver);
+		goto cleanup_sdhci;
+	}
+#endif
+
+	return 0;
+
+cleanup_sdhci:
+	platform_driver_unregister(&aspeed_sdhci_driver);
 
 	return rc;
 }
@@ -574,15 +591,15 @@ module_init(aspeed_sdc_init);
 
 static void __exit aspeed_sdc_exit(void)
 {
+#if defined(CONFIG_MMC_SDHCI_OF_ASPEED_TEST)
+	__kunit_test_suites_exit(aspeed_sdhci_test_suites);
+#endif
+
 	platform_driver_unregister(&aspeed_sdc_driver);
 	platform_driver_unregister(&aspeed_sdhci_driver);
 }
 module_exit(aspeed_sdc_exit);
 
-#if defined(CONFIG_MMC_SDHCI_OF_ASPEED_TEST)
-#include "sdhci-of-aspeed-test.c"
-#endif
-
 MODULE_DESCRIPTION("Driver for the ASPEED SD/SDIO/SDHCI Controllers");
 MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
 MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
-- 
2.27.0

