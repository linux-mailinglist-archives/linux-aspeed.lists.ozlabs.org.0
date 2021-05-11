Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 532EA387020
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 May 2021 05:07:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkgsH4YySz2ymC
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 May 2021 13:07:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=canonical.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=juerg.haefliger@canonical.com; receiver=<UNKNOWN>)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfSR65GwLz2xy3
 for <linux-aspeed@lists.ozlabs.org>; Tue, 11 May 2021 16:18:26 +1000 (AEST)
Received: from mail-ej1-f70.google.com ([209.85.218.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <juerg.haefliger@canonical.com>) id 1lgLio-0001yE-3Y
 for linux-aspeed@lists.ozlabs.org; Tue, 11 May 2021 06:18:22 +0000
Received: by mail-ej1-f70.google.com with SMTP id
 p25-20020a1709061419b0290378364a6464so5535838ejc.15
 for <linux-aspeed@lists.ozlabs.org>; Mon, 10 May 2021 23:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bbXPgmZrL4Pxh0/t8XE8baUOCONdkg5IyBFSdmqHWjM=;
 b=scKgo5VJ89krMUc6ypLH5LimW6HPoLDlm3G+vN1mmOUgYkdh0NmNH+LyGi8vQqSjPl
 Lb0zZBob4czn55Ip7lUTgD5gWmu9RWzD7r064lYcIwvBySsuADNAMyxI1uzVkQ+F9gUD
 3UmU8Khn/JOsP/uhiwsDXzbaw4U8LAD2EYgMHdfQpbXZOG0g58VFJF4zXVa+79G3f/6U
 g5ovWzY6hYwffRBU03y2tgySPJ2QZCU8AgdNJvNlaLZt2LRxUK0QCXtE9P45FSiKgFFc
 OYMHGQWU1yDms/v1IW5zcHyoMzuTiCQwULTjzMUFP7ykCiKP0EtBA1Y0vjyL/21S3oJX
 z56g==
X-Gm-Message-State: AOAM532QVEQoepp6IJB+VGlwUWDsyaPvQ0/NBPUwrDvfIeb7BLbuC+I5
 rCKWHDLBU+kOlfuVT8pRMbZg4FTeWSUHWZm3udJYV0dSAdU9pR9/NP7wIBsG/BHBQNKeOM4TdF/
 O8V67GPZ6J8Fie6CQzyazrWVY/aiez5pUNonu2k9VNCk=
X-Received: by 2002:a17:906:9246:: with SMTP id
 c6mr30337749ejx.10.1620713901802; 
 Mon, 10 May 2021 23:18:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuFUKxnlEC58W09fcC4t8RpefrIfBsHhh1rU2Dzq5wghcRbv5j9OslBqjPeLytqr3YNEzFFg==
X-Received: by 2002:a17:906:9246:: with SMTP id
 c6mr30337730ejx.10.1620713901627; 
 Mon, 10 May 2021 23:18:21 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
 by smtp.gmail.com with ESMTPSA id gn36sm10616136ejc.23.2021.05.10.23.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 23:18:21 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To: wim@linux-watchdog.org, linux@roeck-us.net, joel@jms.id.au,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
Subject: [PATCH] watchdog: Use sysfs_emit() and sysfs_emit_at() in "show"
 functions
Date: Tue, 11 May 2021 08:18:12 +0200
Message-Id: <20210511061812.480172-1-juergh@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 May 2021 13:07:13 +1000
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
Cc: Juerg Haefliger <juergh@canonical.com>, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Convert sprintf() in sysfs "show" functions to sysfs_emit() and
sysfs_emit_at() in order to check for buffer overruns in sysfs outputs.

Signed-off-by: Juerg Haefliger <juergh@canonical.com>
---
 drivers/watchdog/aspeed_wdt.c          |  4 ++--
 drivers/watchdog/watchdog_dev.c        | 19 ++++++++++---------
 drivers/watchdog/watchdog_pretimeout.c |  4 ++--
 drivers/watchdog/ziirave_wdt.c         | 12 +++++++-----
 4 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 7e00960651fa..933998e5a9de 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -175,8 +175,8 @@ static ssize_t access_cs0_show(struct device *dev,
 	struct aspeed_wdt *wdt = dev_get_drvdata(dev);
 	u32 status = readl(wdt->base + WDT_TIMEOUT_STATUS);
 
-	return sprintf(buf, "%u\n",
-		      !(status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY));
+	return sysfs_emit(buf, "%u\n",
+			  !(status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY));
 }
 
 static ssize_t access_cs0_store(struct device *dev,
diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 2946f3a63110..fe68a97973a5 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -451,7 +451,8 @@ static ssize_t nowayout_show(struct device *dev, struct device_attribute *attr,
 {
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%d\n", !!test_bit(WDOG_NO_WAY_OUT, &wdd->status));
+	return sysfs_emit(buf, "%d\n", !!test_bit(WDOG_NO_WAY_OUT,
+						  &wdd->status));
 }
 
 static ssize_t nowayout_store(struct device *dev, struct device_attribute *attr,
@@ -485,7 +486,7 @@ static ssize_t status_show(struct device *dev, struct device_attribute *attr,
 	status = watchdog_get_status(wdd);
 	mutex_unlock(&wd_data->lock);
 
-	return sprintf(buf, "0x%x\n", status);
+	return sysfs_emit(buf, "0x%x\n", status);
 }
 static DEVICE_ATTR_RO(status);
 
@@ -494,7 +495,7 @@ static ssize_t bootstatus_show(struct device *dev,
 {
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%u\n", wdd->bootstatus);
+	return sysfs_emit(buf, "%u\n", wdd->bootstatus);
 }
 static DEVICE_ATTR_RO(bootstatus);
 
@@ -510,7 +511,7 @@ static ssize_t timeleft_show(struct device *dev, struct device_attribute *attr,
 	status = watchdog_get_timeleft(wdd, &val);
 	mutex_unlock(&wd_data->lock);
 	if (!status)
-		status = sprintf(buf, "%u\n", val);
+		status = sysfs_emit(buf, "%u\n", val);
 
 	return status;
 }
@@ -521,7 +522,7 @@ static ssize_t timeout_show(struct device *dev, struct device_attribute *attr,
 {
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%u\n", wdd->timeout);
+	return sysfs_emit(buf, "%u\n", wdd->timeout);
 }
 static DEVICE_ATTR_RO(timeout);
 
@@ -530,7 +531,7 @@ static ssize_t pretimeout_show(struct device *dev,
 {
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%u\n", wdd->pretimeout);
+	return sysfs_emit(buf, "%u\n", wdd->pretimeout);
 }
 static DEVICE_ATTR_RO(pretimeout);
 
@@ -539,7 +540,7 @@ static ssize_t identity_show(struct device *dev, struct device_attribute *attr,
 {
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%s\n", wdd->info->identity);
+	return sysfs_emit(buf, "%s\n", wdd->info->identity);
 }
 static DEVICE_ATTR_RO(identity);
 
@@ -549,9 +550,9 @@ static ssize_t state_show(struct device *dev, struct device_attribute *attr,
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
 
 	if (watchdog_active(wdd))
-		return sprintf(buf, "active\n");
+		return sysfs_emit(buf, "active\n");
 
-	return sprintf(buf, "inactive\n");
+	return sysfs_emit(buf, "inactive\n");
 }
 static DEVICE_ATTR_RO(state);
 
diff --git a/drivers/watchdog/watchdog_pretimeout.c b/drivers/watchdog/watchdog_pretimeout.c
index 01ca84be240f..7f257c3485cd 100644
--- a/drivers/watchdog/watchdog_pretimeout.c
+++ b/drivers/watchdog/watchdog_pretimeout.c
@@ -55,7 +55,7 @@ int watchdog_pretimeout_available_governors_get(char *buf)
 	mutex_lock(&governor_lock);
 
 	list_for_each_entry(priv, &governor_list, entry)
-		count += sprintf(buf + count, "%s\n", priv->gov->name);
+		count += sysfs_emit_at(buf, count, "%s\n", priv->gov->name);
 
 	mutex_unlock(&governor_lock);
 
@@ -68,7 +68,7 @@ int watchdog_pretimeout_governor_get(struct watchdog_device *wdd, char *buf)
 
 	spin_lock_irq(&pretimeout_lock);
 	if (wdd->gov)
-		count = sprintf(buf, "%s\n", wdd->gov->name);
+		count = sysfs_emit(buf, "%s\n", wdd->gov->name);
 	spin_unlock_irq(&pretimeout_lock);
 
 	return count;
diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index 4297280807ca..6c9414d09684 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -445,8 +445,9 @@ static ssize_t ziirave_wdt_sysfs_show_firm(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = sprintf(buf, ZIIRAVE_FW_VERSION_FMT, w_priv->firmware_rev.major,
-		      w_priv->firmware_rev.minor);
+	ret = sysfs_emit(buf, ZIIRAVE_FW_VERSION_FMT,
+			 w_priv->firmware_rev.major,
+			 w_priv->firmware_rev.minor);
 
 	mutex_unlock(&w_priv->sysfs_mutex);
 
@@ -468,8 +469,9 @@ static ssize_t ziirave_wdt_sysfs_show_boot(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = sprintf(buf, ZIIRAVE_BL_VERSION_FMT, w_priv->bootloader_rev.major,
-		      w_priv->bootloader_rev.minor);
+	ret = sysfs_emit(buf, ZIIRAVE_BL_VERSION_FMT,
+			 w_priv->bootloader_rev.major,
+			 w_priv->bootloader_rev.minor);
 
 	mutex_unlock(&w_priv->sysfs_mutex);
 
@@ -491,7 +493,7 @@ static ssize_t ziirave_wdt_sysfs_show_reason(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = sprintf(buf, "%s", ziirave_reasons[w_priv->reset_reason]);
+	ret = sysfs_emit(buf, "%s", ziirave_reasons[w_priv->reset_reason]);
 
 	mutex_unlock(&w_priv->sysfs_mutex);
 
-- 
2.27.0

