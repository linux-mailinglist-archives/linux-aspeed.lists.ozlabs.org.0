Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC9F56C65A
	for <lists+linux-aspeed@lfdr.de>; Sat,  9 Jul 2022 05:24:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfwVp40tTz3c4x
	for <lists+linux-aspeed@lfdr.de>; Sat,  9 Jul 2022 13:24:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=nG41Cf/z;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--davidgow.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3_ppiyggkdcuebwjehpxhpphmf.dpnmjovy-btqffemjtut.pambct.psh@flex--davidgow.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=nG41Cf/z;
	dkim-atps=neutral
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfwQ73M7gz3cC1
	for <linux-aspeed@lists.ozlabs.org>; Sat,  9 Jul 2022 13:20:31 +1000 (AEST)
Received: by mail-pf1-x44a.google.com with SMTP id r7-20020aa79627000000b00528beaf82c3so47022pfg.8
        for <linux-aspeed@lists.ozlabs.org>; Fri, 08 Jul 2022 20:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=0uk9B4iBCc1DStciW4cIjZgeCzcpo0HpP5e4tEE/Rl8=;
        b=nG41Cf/zf7u/sNTdf7Cq7xkL6MwV2j9mNk/je+VAD8dJVe9tTCtvzxVUFtyVny5Btq
         x1Ahnkjlg1ZJP0i/o40I0agXWzyjfVJ67zJnOTVgyBA3BpBqdQfv306NhXPG7cBH6z0b
         5Jn3a76uHAReJMB6C82+3IlzI+hV76RWnd/MpwIBghPNvqEHfssIGDHylf1QKDRZOt7n
         yqd7FwgKuQIeCu+n/LUwVlJDQfooV9o38TE36mJNDYxQopTcJPb3RqWFpOJ4KFfHvt59
         srcH1okBUBcl/7iN9v5P7TbQmO+GJdwbNLUBj65K9m+zurkKaY56ZdTcQEVqi15/o9Wr
         YthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=0uk9B4iBCc1DStciW4cIjZgeCzcpo0HpP5e4tEE/Rl8=;
        b=mGUQXQrGsS/DVM62wPko9WoTqSfl8utixit17CnE2guD3HxKiMtSsAgYCACT6CGNG7
         eMsrWOif1fqfr/L5VAYIxH08S/wDC+m5Bs9GMdsHp+x0ZYIlZuUnXreczo66AyXyPuNB
         swNA6vXqn6z9AHUl8y8wKr7AtYKIfXdm494EeaZDCQd8rlHICBgQPIwl4aZcgs/THmfd
         aGaJNSfZIu3Hkttj3FxIClTsyOP6tfODUCKDt0F8cbhzjzj6AQY26lOtH9R5Bql3HTnm
         vdGohyunPB44/vOvct5j2Bp+LQrPjEAF2AVWDZf+f3I6VhHWx2b0RekkrHj6/55yyzO0
         V0vg==
X-Gm-Message-State: AJIora+Mi29Hbs0WwuoBaxCTHiFFUqpttYuDDqXcJHpAQtm/7i1PYFTp
	p2xJ+dHvmyHE5gy2x1FLLpd3tzrfjVaH6g==
X-Google-Smtp-Source: AGRyM1vb6KdixOSRAr8QjZwc+RJeF7pVnk5EV/2mWAv2L+en8WMRLFL1aQm31W9Ny8aQAjNB+SWrLAXzTPEPcg==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a17:902:8a82:b0:16c:3024:69c2 with SMTP
 id p2-20020a1709028a8200b0016c302469c2mr2056322plo.154.1657336828917; Fri, 08
 Jul 2022 20:20:28 -0700 (PDT)
Date: Sat,  9 Jul 2022 11:20:01 +0800
In-Reply-To: <20220709032001.819487-1-davidgow@google.com>
Message-Id: <20220709032001.819487-6-davidgow@google.com>
Mime-Version: 1.0
References: <20220709032001.819487-1-davidgow@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v4 5/5] mmc: sdhci-of-aspeed: test: Use kunit_test_suite() macro
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
Acked-by: Brendan Higgins <brendanhiggins@google.com>
Signed-off-by: David Gow <davidgow@google.com>
---

Changes since v3:
https://lore.kernel.org/linux-kselftest/20220625050838.1618469-6-davidgow@google.com/
- Rebase on top of the TAINT_TEST patch series. This should now apply
  cleanly on top of the kunit branch:
  https://lore.kernel.org/linux-kselftest/20220708044847.531566-1-davidgow@google.com/T/#u
- Add Brendan's Acked-by tag.

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

