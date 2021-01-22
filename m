Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FFB3001ED
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Jan 2021 12:49:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMcxd6sxTzDrhl
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Jan 2021 22:49:41 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=B/ZwTxPh; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=BTZwdDg5; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMcx23ThCzDrRD
 for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Jan 2021 22:49:09 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CC1C55C0136;
 Fri, 22 Jan 2021 06:49:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 22 Jan 2021 06:49:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=Aur+84y6XjXo9NANGg4GxQPeSB
 LTSsh+b06q0PumXRo=; b=B/ZwTxPhfBRlLmStrbjvZaaD7Mg6w4qzJ8bXbu65KU
 3jMjIufM/Svx78Hrq3gvPtO3i1tTYYVrQiWcOiE3HYt4mknJbaTB1xrODEvGl8hm
 2T/O0iFeuzI7MA8qNSUT6s6hZRlnKHwJUbC5nNWLlJD2zz8iTW+V9tbqxkYMS2WC
 uJpVLCykxEbPaVo+0ia+S9vQzldlvC/LxKM6uMO/xntV9uPSnDv409y/LMBdixsy
 G3jJkaqbPvUMI49gTUL8jikPH8+IGBlOHNgGbH72BJl18CiF7aDJPkhDuBVCxp38
 KsI1iQkCUh3562uAHcxFVBV+/a7DKHNo9XVz95LCfETg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Aur+84y6XjXo9NANG
 g4GxQPeSBLTSsh+b06q0PumXRo=; b=BTZwdDg5goBiKkL5JBhrbjTMzetVczF1G
 TFmHprbqtWhp4v/Exo15rlz9xYnpAk7DpUk0yP2IuHqpdCziYtlFHsOjjjlWrZrD
 7lOsJM/wzvoyoo2n1lBOD1nYzGeSrr1IvQu3XNq9bilYyrvBIVvyf/k2H/PnAYJ8
 AlXV34P3q6/OjBEhnveifvq9TgZp8pTeRrV/Ty6N/AYp31PdGcLc1BWL28e6fxdX
 ECQnDdNfm1bD6tlDPe7awZVSxr6GDh0ATR434iUkjyXD/2fvuqC7nWaUWqddFub+
 B0AfmSSbXrGwEJVdt5AuITZumwc7EQwU2hUmrpqNLZCAqQyC6YNRg==
X-ME-Sender: <xms:sLsKYFTsNfHLxZXowxy_4GKEGa9aUE2WehOfEdjs7mn5SKkcC96NJw>
 <xme:sLsKYO6YSuYBcfBGfSarQgc34lQNvZs0UrR9fxILnGlKoKXYsE9X51RbE54wW7Apv
 kTuqBjYKHcArSbrRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeigdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptehnughrvgifucfl
 vghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrfgrthhtvghrnh
 epkefhieffjeevfeevhedtieeihfefvdejledvvddthefftedujeethfeuueelfedtnecu
 kfhppedvtdefrdehjedrvdduhedrvdefvdenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:sLsKYCz7Y-Cdu2hE8WcTCdq7xt_lCadrhHnN-HsDrfSyFKxQAIjJ1A>
 <xmx:sLsKYFQ6-nXemAWFYWUKdKvQikIOTXTYoA-_u71_Xh7l5hWlMMkPwg>
 <xmx:sLsKYJVbTBeCUNF5pb8XLNXYZaVxe_jGc8sgdhRkgRA5pZweczZROw>
 <xmx:sbsKYLY2NGAXoGCXdsz3yIDGZCw3WO53noSAxjhKRuFMM7rq5J_vrA>
Received: from localhost.localdomain (203-57-215-232.dyn.iinet.net.au
 [203.57.215.232])
 by mail.messagingengine.com (Postfix) with ESMTPA id DEB9124005C;
 Fri, 22 Jan 2021 06:49:00 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH v2] mmc: sdhci-of-aspeed: Fix kunit-related build error
Date: Fri, 22 Jan 2021 22:18:52 +1030
Message-Id: <20210122114852.3790565-1-andrew@aj.id.au>
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

v2:
* Collapse the #ifdef-ery

 drivers/mmc/host/sdhci-of-aspeed-test.c |  9 +++++-
 drivers/mmc/host/sdhci-of-aspeed.c      | 42 ++++++++++++++++++++++---
 2 files changed, 45 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed-test.c b/drivers/mmc/host/sdhci-of-aspeed-test.c
index 34070605b28b..bb67d159b7d8 100644
--- a/drivers/mmc/host/sdhci-of-aspeed-test.c
+++ b/drivers/mmc/host/sdhci-of-aspeed-test.c
@@ -95,4 +95,11 @@ static struct kunit_suite aspeed_sdhci_test_suite = {
 	.name = "sdhci-of-aspeed",
 	.test_cases = aspeed_sdhci_test_cases,
 };
-kunit_test_suite(aspeed_sdhci_test_suite);
+
+static struct kunit_suite *aspeed_sdc_test_suite_array[] = {
+	&aspeed_sdhci_test_suite,
+	NULL,
+};
+
+static struct kunit_suite **aspeed_sdc_test_suites
+	__used __section(".kunit_test_suites") = aspeed_sdc_test_suite_array;
diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 3b0d381e1215..7d8692e90996 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -556,6 +556,29 @@ static struct platform_driver aspeed_sdc_driver = {
 	.remove		= aspeed_sdc_remove,
 };
 
+#if defined(CONFIG_MMC_SDHCI_OF_ASPEED_TEST)
+#include "sdhci-of-aspeed-test.c"
+
+static inline int aspeed_sdc_tests_init(void)
+{
+	return __kunit_test_suites_init(aspeed_sdc_test_suites);
+}
+
+static inline void aspeed_sdc_tests_exit(void)
+{
+	__kunit_test_suites_exit(aspeed_sdc_test_suites);
+}
+#else
+static inline int aspeed_sdc_tests_init(void)
+{
+	return 0;
+}
+
+static inline void aspeed_sdc_tests_exit(void)
+{
+}
+#endif
+
 static int __init aspeed_sdc_init(void)
 {
 	int rc;
@@ -566,7 +589,18 @@ static int __init aspeed_sdc_init(void)
 
 	rc = platform_driver_register(&aspeed_sdc_driver);
 	if (rc < 0)
-		platform_driver_unregister(&aspeed_sdhci_driver);
+		goto cleanup_sdhci;
+
+	rc = aspeed_sdc_tests_init();
+	if (rc < 0) {
+		platform_driver_unregister(&aspeed_sdc_driver);
+		goto cleanup_sdhci;
+	}
+
+	return 0;
+
+cleanup_sdhci:
+	platform_driver_unregister(&aspeed_sdhci_driver);
 
 	return rc;
 }
@@ -574,15 +608,13 @@ module_init(aspeed_sdc_init);
 
 static void __exit aspeed_sdc_exit(void)
 {
+	aspeed_sdc_tests_exit();
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

