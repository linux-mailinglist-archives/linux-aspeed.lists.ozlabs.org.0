Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE91355A729
	for <lists+linux-aspeed@lfdr.de>; Sat, 25 Jun 2022 07:14:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LVMc963kMz3cdH
	for <lists+linux-aspeed@lfdr.de>; Sat, 25 Jun 2022 15:14:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ZnYxgZ7W;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--davidgow.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=35zi2yggkda4ro9wru2au22uzs.q20zw18b-o63ssrzw676.2dzop6.25u@flex--davidgow.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ZnYxgZ7W;
	dkim-atps=neutral
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LVMX90lNwz3cfG
	for <linux-aspeed@lists.ozlabs.org>; Sat, 25 Jun 2022 15:11:04 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id l6-20020a170902f68600b0016a36fb2c9aso2297082plg.2
        for <linux-aspeed@lists.ozlabs.org>; Fri, 24 Jun 2022 22:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=rVO2p/4gWmOyb4ep6RqSpRHzECQ50xC37PSaOv1SUGw=;
        b=ZnYxgZ7WqalP2dGkVphlbAjbjTTwDrWhD3RAM4V8o6/4InFeKP/4fGh9nmuKlyAEvo
         oKBc3t8krwimc05NLMyCHViXO4A+w6+YsDo8b4CVr4LSG+mLmKz2pA2pe2zjAb1cJ6H/
         jaoeav2d7SWqkbw5WcEyh4WTNEuMEQYzcCSOTK7q3hfcEnQ9xVm8hYFPtL1wb+JG794S
         7Ua4nSkKwOPkLvqgcU+sR2WWAX0aCCZfNetn+bckdI9KhaloJ63hrQo0IsbYsbBAj14f
         03k70sCmEYyFHwzJ40aHjS4YgKpS01/1TW15oVuFATsCHtlepIt02aV2Uauk1+rNeD9w
         hKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=rVO2p/4gWmOyb4ep6RqSpRHzECQ50xC37PSaOv1SUGw=;
        b=WJ1y//MWh3eFZhBftByc/n5UDEOPjceZIdo0jPV3zRWkT8Tb8phsom3EZ4LZWYnUfy
         BGgbL6TGRp+JM2uBzc6hYFRufNGmLXowBv8rm+WH13007J7wG5+qc5HzH297XH38EnGa
         HJXaO6n/wL3xpgdvise1Z1x9mVPX0l8Lsp1tEl8FTxwvn/ATe+ipEMTJYR/5+Qt3lk13
         1+BMv0QhoVZj08Q89ywhC4UGzU2x4+igAaKpRsnhmmoCTHynvLcdkuyuvZWvZgbqVn70
         4ZxRrslZzM3/bSVNxDwhciLLBTGkRGtd/z4YbtlLutWVbqZhLpP3o+WQek2J3gvnWCp/
         KFCQ==
X-Gm-Message-State: AJIora+dyg3Lh4LXOgiltkCryIN97yBHij4murm0XK3S0u1naxi0yK1y
	Ltuos5TQunmOTDhLPV60dlNP/f0PCixNBQ==
X-Google-Smtp-Source: AGRyM1vSgWc7GnZSpUv1n7qCzLhhitXpo2LTAKE1+91FirTZI0V7zE22wJcwEw3RTwL8dSDR+tYk87aSCL5uPw==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a17:90a:249:b0:1e0:a8a3:3c6c with SMTP id
 t9-20020a17090a024900b001e0a8a33c6cmr438311pje.0.1656133861539; Fri, 24 Jun
 2022 22:11:01 -0700 (PDT)
Date: Sat, 25 Jun 2022 13:08:39 +0800
In-Reply-To: <20220625050838.1618469-1-davidgow@google.com>
Message-Id: <20220625050838.1618469-6-davidgow@google.com>
Mime-Version: 1.0
References: <20220625050838.1618469-1-davidgow@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v3 5/5] mmc: sdhci-of-aspeed: test: Use kunit_test_suite() macro
From: David Gow <davidgow@google.com>
To: Brendan Higgins <brendanhiggins@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Jeremy Kerr <jk@codeconstruct.com.au>, Daniel Latypov <dlatypov@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Jeffery <andrew@aj.id.au>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andra Paraschiv <andraprs@amazon.com>, 
	Longpeng <longpeng2@huawei.com>, Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, David Gow <davidgow@google.com>, linux-aspeed@lists.ozlabs.org, =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Matt Johnston <matt@codeconstruct.com.au>, linux-modules@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The kunit_test_suite() macro is no-longer incompatible with module_add,
so its use can be reinstated.

Since this fixes parsing with builtins and kunit_tool, also enable the
test by default when KUNIT_ALL_TESTS is enabled.

The test can now be run via kunit_tool with:
	./tools/testing/kunit/kunit.py run --arch=x86_64 \
	--kconfig_add CONFIG_OF=y --kconfig_add CONFIG_OF_ADDRESS=y \
	--kconfig_add CONFIG_MMC=y --kconfig_add CONFIG_MMC_SDHCI=y \
	--kconfig_add CONFIG_MMC_SDHCI_PLTFM=y \
	--kconfig_add CONFIG_MMC_SDHCI_OF_ASPEED=y \
	'sdhci-of-aspeed'

(It may be worth adding a .kunitconfig at some point, as there are
enough dependencies to make that command scarily long.)

Acked-by: Daniel Latypov <dlatypov@google.com>
Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: David Gow <davidgow@google.com>
---

Changes since v2:
https://lore.kernel.org/linux-kselftest/20220621085345.603820-6-davidgow@google.com/
- Clean up the aspeed_sdc_init() function to get rid of an obsolete goto
  (Thanks Daniel)
- Add Daniel and Ulf's Acked-by tags.

No changes since v1:
https://lore.kernel.org/linux-kselftest/20220618090310.1174932-6-davidgow@google.com/

---
 drivers/mmc/host/Kconfig                |  5 ++--
 drivers/mmc/host/sdhci-of-aspeed-test.c |  8 +-----
 drivers/mmc/host/sdhci-of-aspeed.c      | 34 +------------------------
 3 files changed, 5 insertions(+), 42 deletions(-)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index d6144978e32d..10c563999d3d 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -169,8 +169,9 @@ config MMC_SDHCI_OF_ASPEED
 	  If unsure, say N.
 
 config MMC_SDHCI_OF_ASPEED_TEST
-	bool "Tests for the ASPEED SDHCI driver"
-	depends on MMC_SDHCI_OF_ASPEED && KUNIT=y
+	bool "Tests for the ASPEED SDHCI driver" if !KUNIT_ALL_TESTS
+	depends on MMC_SDHCI_OF_ASPEED && KUNIT
+	default KUNIT_ALL_TESTS
 	help
 	  Enable KUnit tests for the ASPEED SDHCI driver. Select this
 	  option only if you will boot the kernel for the purpose of running
diff --git a/drivers/mmc/host/sdhci-of-aspeed-test.c b/drivers/mmc/host/sdhci-of-aspeed-test.c
index 1ed4f86291f2..ecb502606c53 100644
--- a/drivers/mmc/host/sdhci-of-aspeed-test.c
+++ b/drivers/mmc/host/sdhci-of-aspeed-test.c
@@ -96,10 +96,4 @@ static struct kunit_suite aspeed_sdhci_test_suite = {
 	.test_cases = aspeed_sdhci_test_cases,
 };
 
-static struct kunit_suite *aspeed_sdc_test_suite_array[] = {
-	&aspeed_sdhci_test_suite,
-	NULL,
-};
-
-static struct kunit_suite **aspeed_sdc_test_suites
-	__used __section(".kunit_test_suites") = aspeed_sdc_test_suite_array;
+kunit_test_suite(aspeed_sdhci_test_suite);
diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 6e4e132903a6..ba6677bf7372 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -606,25 +606,6 @@ static struct platform_driver aspeed_sdc_driver = {
 
 #if defined(CONFIG_MMC_SDHCI_OF_ASPEED_TEST)
 #include "sdhci-of-aspeed-test.c"
-
-static inline int aspeed_sdc_tests_init(void)
-{
-	return __kunit_test_suites_init(aspeed_sdc_test_suites);
-}
-
-static inline void aspeed_sdc_tests_exit(void)
-{
-	__kunit_test_suites_exit(aspeed_sdc_test_suites);
-}
-#else
-static inline int aspeed_sdc_tests_init(void)
-{
-	return 0;
-}
-
-static inline void aspeed_sdc_tests_exit(void)
-{
-}
 #endif
 
 static int __init aspeed_sdc_init(void)
@@ -637,18 +618,7 @@ static int __init aspeed_sdc_init(void)
 
 	rc = platform_driver_register(&aspeed_sdc_driver);
 	if (rc < 0)
-		goto cleanup_sdhci;
-
-	rc = aspeed_sdc_tests_init();
-	if (rc < 0) {
-		platform_driver_unregister(&aspeed_sdc_driver);
-		goto cleanup_sdhci;
-	}
-
-	return 0;
-
-cleanup_sdhci:
-	platform_driver_unregister(&aspeed_sdhci_driver);
+		platform_driver_unregister(&aspeed_sdhci_driver);
 
 	return rc;
 }
@@ -656,8 +626,6 @@ module_init(aspeed_sdc_init);
 
 static void __exit aspeed_sdc_exit(void)
 {
-	aspeed_sdc_tests_exit();
-
 	platform_driver_unregister(&aspeed_sdc_driver);
 	platform_driver_unregister(&aspeed_sdhci_driver);
 }
-- 
2.37.0.rc0.161.g10f37bed90-goog

