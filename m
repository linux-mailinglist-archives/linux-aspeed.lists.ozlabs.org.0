Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 196C925CE43
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Sep 2020 01:25:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjH3N32D2zDrDr
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Sep 2020 09:25:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=dianders@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=eoeZ1xlM; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjH3C35RvzDqvv
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Sep 2020 09:25:11 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id e33so3356487pgm.0
 for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Sep 2020 16:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0oWgj2zq4zbbu5lAqus3SluKKFu5QfUtlWwopTJGHMA=;
 b=eoeZ1xlMPFP7Tf/iVuNvLqP75LmGdaQxIL0WoQWrQV7z/RAJe1VI+/DA7rgv4g5DBu
 f0Hxd7xcKwWdR4vAPofeXOYXGuq3ZOZAmsFgRp6sbKo+mbb7rIzMsOOHkMTDmoyimP1X
 Kd32TS18l3b0IpJjGqqUzlJtQhqZl55x6MECE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0oWgj2zq4zbbu5lAqus3SluKKFu5QfUtlWwopTJGHMA=;
 b=dOs98BKoJF1HTQwnvJ4qxOiF+r2LQBGVgS6I+P4sHe6RNyjnbscXrPxWNmeTgz0dAq
 Q7MDsh2X8TDwxSMHZ8lmINNLg1/28dpvtuKZqOEQMjMwpJ7s6ekFBAk86xsK+fF7dbjV
 HAI2dB4vrexohQ4BsWe3xg/1oFX0ju2DCjj9MxfYiJxEiakPy4w12rbsJCUWQYP2kjjM
 yqO8hmMveC4sBmFI+QKZWq+JJRsxgdkgw32H17/l5oODgsFOj3QHgtq6CuQf1aiaKzPq
 1k8bOUbKKq+0ZzUxm8dOEMIZnKJfWYOxBiqsWYYIlQlH9Dqd6zR65M/GgHWNaZXO+ipp
 aZpg==
X-Gm-Message-State: AOAM530XynyYEZJU2VQCTEINI65PGdsPt41Nu+MRB3i/cQGa6qpH/Yt1
 R2xbYe9xYsQ/K8/QSCKDB6WgEg==
X-Google-Smtp-Source: ABdhPJxXci8J9Qv2zlxPsg4flpI87MuxgFVsNrgjNmKzdj6MjvnpdWRph2Y0Jrgb94EhRBlfr/NozA==
X-Received: by 2002:a62:838a:: with SMTP id h132mr5979867pfe.72.1599175509378; 
 Thu, 03 Sep 2020 16:25:09 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id q7sm3614459pgg.10.2020.09.03.16.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 16:25:08 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 5/6] mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that
 existed in v5.4
Date: Thu,  3 Sep 2020 16:24:40 -0700
Message-Id: <20200903162412.5.I2b630c4d40ff4ea61d5b30b8ccfe95890e257100@changeid>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
In-Reply-To: <20200903232441.2694866-1-dianders@chromium.org>
References: <20200903232441.2694866-1-dianders@chromium.org>
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
Cc: linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Douglas Anderson <dianders@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Baolin Wang <baolin.wang7@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
 swboyd@chromium.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This is like commit 3d3451124f3d ("mmc: sdhci-msm: Prefer asynchronous
probe") but applied to a whole pile of drivers.  This batch converts
the drivers that appeared to be around in the v5.4 timeframe.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/mmc/host/alcor.c           | 1 +
 drivers/mmc/host/sdhci-of-aspeed.c | 2 ++
 drivers/mmc/host/sdhci-sprd.c      | 1 +
 drivers/mmc/host/sdhci_am654.c     | 1 +
 drivers/mmc/host/uniphier-sd.c     | 1 +
 5 files changed, 6 insertions(+)

diff --git a/drivers/mmc/host/alcor.c b/drivers/mmc/host/alcor.c
index 026ca9194ce5..bfb8efeb7eb8 100644
--- a/drivers/mmc/host/alcor.c
+++ b/drivers/mmc/host/alcor.c
@@ -1178,6 +1178,7 @@ static struct platform_driver alcor_pci_sdmmc_driver = {
 	.id_table	= alcor_pci_sdmmc_ids,
 	.driver		= {
 		.name	= DRV_NAME_ALCOR_PCI_SDMMC,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.pm	= &alcor_mmc_pm_ops
 	},
 };
diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index a1bcc0f4ba9e..4f008ba3280e 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -240,6 +240,7 @@ static const struct of_device_id aspeed_sdhci_of_match[] = {
 static struct platform_driver aspeed_sdhci_driver = {
 	.driver		= {
 		.name	= "sdhci-aspeed",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = aspeed_sdhci_of_match,
 	},
 	.probe		= aspeed_sdhci_probe,
@@ -318,6 +319,7 @@ MODULE_DEVICE_TABLE(of, aspeed_sdc_of_match);
 static struct platform_driver aspeed_sdc_driver = {
 	.driver		= {
 		.name	= "sd-controller-aspeed",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.pm	= &sdhci_pltfm_pmops,
 		.of_match_table = aspeed_sdc_of_match,
 	},
diff --git a/drivers/mmc/host/sdhci-sprd.c b/drivers/mmc/host/sdhci-sprd.c
index a910cb461ed7..f88d38e34a23 100644
--- a/drivers/mmc/host/sdhci-sprd.c
+++ b/drivers/mmc/host/sdhci-sprd.c
@@ -787,6 +787,7 @@ static struct platform_driver sdhci_sprd_driver = {
 	.remove = sdhci_sprd_remove,
 	.driver = {
 		.name = "sdhci_sprd_r11",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = of_match_ptr(sdhci_sprd_of_match),
 		.pm = &sdhci_sprd_pm_ops,
 	},
diff --git a/drivers/mmc/host/sdhci_am654.c b/drivers/mmc/host/sdhci_am654.c
index c5f47197d177..a4c6d9d80e88 100644
--- a/drivers/mmc/host/sdhci_am654.c
+++ b/drivers/mmc/host/sdhci_am654.c
@@ -745,6 +745,7 @@ static int sdhci_am654_remove(struct platform_device *pdev)
 static struct platform_driver sdhci_am654_driver = {
 	.driver = {
 		.name = "sdhci-am654",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = sdhci_am654_of_match,
 	},
 	.probe = sdhci_am654_probe,
diff --git a/drivers/mmc/host/uniphier-sd.c b/drivers/mmc/host/uniphier-sd.c
index 55efd5c53249..3092466a99ab 100644
--- a/drivers/mmc/host/uniphier-sd.c
+++ b/drivers/mmc/host/uniphier-sd.c
@@ -685,6 +685,7 @@ static struct platform_driver uniphier_sd_driver = {
 	.remove = uniphier_sd_remove,
 	.driver = {
 		.name = "uniphier-sd",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = uniphier_sd_match,
 	},
 };
-- 
2.28.0.526.ge36021eeef-goog

