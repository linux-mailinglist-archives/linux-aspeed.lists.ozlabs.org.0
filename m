Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2AD575A25
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Jul 2022 06:04:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lkd5p5fsJz3c70
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Jul 2022 14:04:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Of15lLAb;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--davidgow.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3mofqyggkdf8a7sfadltdlldib.9ljifkru-7pmbbaifpqp.lwi78p.lod@flex--davidgow.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Of15lLAb;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lkd5g1Yhmz3bZP
	for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Jul 2022 14:04:05 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-31cb93cadf2so31693907b3.11
        for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Jul 2022 21:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=dOShst8oggqOssAr1ulsAnblCITkep7trvJdY0C5eLU=;
        b=Of15lLAbml49VYHRN9m0VDbCfogr3SovyJGfgCQ7iaWxO2/arZgSm1JkWoAtfuWQlX
         luM3GfvnpmaLCfLXFRTXVP3skXL2hUMumL8ELP8qkLOb1o1ll5w6FN6C0XjjNbS9TDdN
         PsqVD12No9NSstS6gjWYJmxvG6m6l5eJSTmC4BXr+uKXuWjOQIM6AsEDP/qr9/oqEkP3
         zufyGVCthz1+/0+RbafqMV5x2ThixKyaYAePnveQzH/m8OkFCG4EgRf+6VnW42hlEdhv
         4dTf12NWb9TPo54ObWif+TwN/RlIsIBtA8+dlDJXCAmbeUPx84nRTKncRwJc0ouSdHDt
         eMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=dOShst8oggqOssAr1ulsAnblCITkep7trvJdY0C5eLU=;
        b=nifz3/gTIbF8gMm5/8CDc3iqckrmaABYoUs+CfB1ZVXxoCUMC7GP9UzEWd6eAXg1/k
         4XHLlxj02qJZaB50wzf+gB5HrJ9eamyhOxpnVfuAStUKEY8Hi7NqYAlczgd251Htc63w
         ddhq3z/N7YpEPPjFyn7+sTuuUKt/0vf7qfN7PkEEYteIbSQ38YZr86gXNwWqpVDrDp2a
         H9wn21pRThGpjSwMGJNBEp9VZ0LbYzn16jL9m+UL0p06O8HYAbZ/9LEUyvvIOhTcvvJX
         H4kMvhf/whNX0+kZls/StIqRNRpm581/muwVg3Ni8lgpEEmK+7sHVmF4PmHwGfpaPJlo
         +AoQ==
X-Gm-Message-State: AJIora80K1QbTo3TheoqDyyrcpa+vhwDNKEydIeqkXAvKZsMr972xgrU
	LaStsCeOVSe295kaewCV7auN4KzBJ4AnKQ==
X-Google-Smtp-Source: AGRyM1vFpZrFOoq2yapQ0vGl3znNKM4Dn0ax0wtn3S4i2Fs4lp4ajUnIeHklnWD7RiS+zlb4i05wgHyYdzKpWw==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a5b:bc2:0:b0:66e:4a75:e5ff with SMTP id
 c2-20020a5b0bc2000000b0066e4a75e5ffmr12004512ybr.642.1657857840574; Thu, 14
 Jul 2022 21:04:00 -0700 (PDT)
Date: Fri, 15 Jul 2022 12:03:54 +0800
Message-Id: <20220715040354.2629856-1-davidgow@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH] mmc: sdhci-of-aspeed: test: Fix dependencies when KUNIT=m
From: David Gow <davidgow@google.com>
To: Brendan Higgins <brendanhiggins@google.com>, Daniel Latypov <dlatypov@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>
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
Cc: David Gow <davidgow@google.com>, linux-aspeed@lists.ozlabs.org, linux-mmc@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>, linux-kselftest@vger.kernel.org, Sadiya Kazi <sadiyakazi@google.com>, kunit-dev@googlegroups.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

While the sdhci-of-aspeed KUnit tests do work when builtin, and do work
when KUnit itself is being built as a module, the two together break.

This is because the KUnit tests (understandably) depend on KUnit, so a
built-in test cannot build if KUnit is a module.

Fix this by adding a dependency on (MMC_SDHCI_OF_ASPEED=m || KUNIT=y),
which only excludes this one problematic configuration.

This was reported on a nasty openrisc-randconfig run by the kernel test
robot, though for some reason (compiler optimisations removing the test
code?) I wasn't able to reproduce it locally on x86:
https://lore.kernel.org/linux-mm/202207140122.fzhlf60k-lkp@intel.com/T/

Fixes: 291cd54e5b05 ("mmc: sdhci-of-aspeed: test: Use kunit_test_suite() macro")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: David Gow <davidgow@google.com>
---
 drivers/mmc/host/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index 10c563999d3d..e63608834411 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -171,6 +171,7 @@ config MMC_SDHCI_OF_ASPEED
 config MMC_SDHCI_OF_ASPEED_TEST
 	bool "Tests for the ASPEED SDHCI driver" if !KUNIT_ALL_TESTS
 	depends on MMC_SDHCI_OF_ASPEED && KUNIT
+	depends on (MMC_SDHCI_OF_ASPEED=m || KUNIT=y)
 	default KUNIT_ALL_TESTS
 	help
 	  Enable KUnit tests for the ASPEED SDHCI driver. Select this
-- 
2.37.0.170.g444d1eabd0-goog

