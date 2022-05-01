Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4495168B3
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 May 2022 00:38:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ks1N63g3Qz2xh0
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 May 2022 08:38:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=EIiptmIO;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=zhangjian.3032@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=EIiptmIO; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Krjpy6Fwnz2xnM
 for <linux-aspeed@lists.ozlabs.org>; Sun,  1 May 2022 20:57:12 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id k1so1935955pll.4
 for <linux-aspeed@lists.ozlabs.org>; Sun, 01 May 2022 03:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ref09pVzmKehKJLaE3ql7rgQqo+jRk+JJ3BJb/yQNDo=;
 b=EIiptmIOKoBAtGUjy79Rt6qQSdXP4sps+nmcDoC+HGp6BYYOOIzpc4iG104sUaHPbg
 9HqBOLWttihdDo0Pr+hUp3DUdBQZsgfgIFaT5kWRyPAKgVsLsW9Hl2LAWoWg+yI0idSC
 9im+lU6Cs36BZXmCopazdDCAAYi6otrXiaqk9HN47M25aME4JMxCLNr8gCf4NEhar3VO
 7UKoqS0VmExOrUdn3sYNl2cp1pNJamlw8158Aui8lsw5yT8pdWtIgIwmZvuYy9QoOwVC
 St+PouMioyuXozPKfXhQEY6B/YnXOLsw2EBWy7gVmYexthMZjTfcujQ3CkaHct4M4GQ1
 vpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ref09pVzmKehKJLaE3ql7rgQqo+jRk+JJ3BJb/yQNDo=;
 b=APesKYp2JAjkTqhnnXfAcx5ftYeHXiuXMgj9/FwohdZjRhNaA65eaoDlPcLTAi9SOT
 nQxsfZ7LekVwuDLZlGQIi4KhHLQx0s+CvnEsghxD1/oMErYyJEdkoFbqRx+QBdrTo7NN
 5hLmyAWO9jSGtmY68gmn5vpUAxq5hUIB3w5UPmKa1Vxuy3USrz2mkbfiIdX/f8oOKM0n
 uk8Zh17hgFAqmsTcpSuyU86H/DMfTBXSPHATS/Zx6Jq6f2ciia/+FSfspxBWBEK8eh+P
 G4ZLcysgdrl+Du7zdB7xDtZ3l2R5rygv5UAFCCueo10aQi3Hh8rCgXQ61jXEB2Pk33cU
 lYwg==
X-Gm-Message-State: AOAM5309P+YKmkV6VQF1+8yHy7xnnvi96vJ+SBaKV5lIExRdpZQleGsM
 1mb0gylEklcQWNVtDnc044JMkw==
X-Google-Smtp-Source: ABdhPJxXhYMF5cj6UvI5DKwEl9ozDUat1mEVxojaSzu68hCpYfpsnF7sdxQri4SH/D0isUTD91DS/w==
X-Received: by 2002:a17:90a:a58d:b0:1db:ed34:e46d with SMTP id
 b13-20020a17090aa58d00b001dbed34e46dmr12731557pjq.124.1651402626080; 
 Sun, 01 May 2022 03:57:06 -0700 (PDT)
Received: from localhost ([49.7.45.235]) by smtp.gmail.com with ESMTPSA id
 g11-20020aa7818b000000b0050dc76281d5sm2811611pfi.175.2022.05.01.03.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 03:57:05 -0700 (PDT)
From: Jian Zhang <zhangjian.3032@bytedance.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	clg@kaod.org
Subject: [PATCH linux dev-5.15] soc: aspeed: abr: Add sysfs attrs for flash
 toggle
Date: Sun,  1 May 2022 18:56:44 +0800
Message-Id: <20220501105644.355062-1-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 02 May 2022 08:36:50 +1000
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
Cc: zhangjian_linux@163.com, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-aspeed@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Implement the flash toggle function in soc ast2600.
Add two sysfs attrs named "access_primary" and "access_backup"

attr "access_primary": Appears only in the backup flash startup
store: Non-zero values will clear "Boot Flash source select indicator"
to '0', the next reboot will boot from primary flash. Nothing will be
done at 0.
show: 0 means the next reboot will boot from primary, 1 will boot from
backup.

attr "access_backup": Appears only in the primary flash startup
store: Non-zero values are the timeout time for abr WDT, WDT will be
turned on immediately if written. The maximum value is 0x3ff, and unit
is "0.1s". zero value will disable WDT.
show: the time left(unit is 0.1s) in WDT timer. 0 means timer is not
enabled. Thus, A non-zero value means that waiting until the WTD times
out will automatically start from the backup.

Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
---
 drivers/spi/spi-aspeed.c              | 62 ++++++++++++++++++
 include/linux/soc/aspeed/aspeed-abr.h | 93 +++++++++++++++++++++++++++
 2 files changed, 155 insertions(+)
 create mode 100644 include/linux/soc/aspeed/aspeed-abr.h

diff --git a/drivers/spi/spi-aspeed.c b/drivers/spi/spi-aspeed.c
index 909b5fb175d6..abe3bfe2bd42 100644
--- a/drivers/spi/spi-aspeed.c
+++ b/drivers/spi/spi-aspeed.c
@@ -24,6 +24,7 @@
 #include <linux/sizes.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
+#include <linux/soc/aspeed/aspeed-abr.h>
 
 /* ASPEED FMC/SPI memory control register related */
 #define OFFSET_CE_TYPE_SETTING		0x00
@@ -127,6 +128,54 @@ struct aspeed_spi_controller {
 	spinlock_t lock;
 };
 
+static ssize_t access_primary_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct aspeed_spi_controller *ast_ctrl = dev_get_drvdata(dev);
+
+	return _access_primary_show(ast_ctrl->regs, attr, buf);
+}
+
+static ssize_t access_primary_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t size)
+{
+	struct aspeed_spi_controller *ast_ctrl = dev_get_drvdata(dev);
+
+	return _access_primary_store(ast_ctrl->regs, attr, buf, size);
+}
+
+static ssize_t access_backup_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct aspeed_spi_controller *ast_ctrl = dev_get_drvdata(dev);
+
+	return _access_backup_show(ast_ctrl->regs, attr, buf);
+}
+
+static ssize_t access_backup_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t size)
+{
+	struct aspeed_spi_controller *ast_ctrl = dev_get_drvdata(dev);
+
+	return _access_backup_store(ast_ctrl->regs, attr, buf, size);
+}
+
+static DEVICE_ATTR_RW(access_primary);
+static DEVICE_ATTR_RW(access_backup);
+
+static struct attribute *bswitch_primary_attrs[] = {
+	&dev_attr_access_primary.attr, NULL
+};
+
+static struct attribute *bswitch_backup_attrs[] = {
+	&dev_attr_access_backup.attr, NULL
+};
+
+ATTRIBUTE_GROUPS(bswitch_primary);
+ATTRIBUTE_GROUPS(bswitch_backup);
+
 static uint32_t
 aspeed_2600_spi_segment_start(struct aspeed_spi_controller *ast_ctrl,
 			      uint32_t reg)
@@ -1393,6 +1442,19 @@ static int aspeed_spi_probe(struct platform_device *pdev)
 	if (ret)
 		goto end;
 
+	if (of_device_is_compatible(dev->of_node, "aspeed,ast2600-fmc")) {
+		/* if boot from alt source, show access_primary, otherwise show access_backup */
+		if (readl(ast_ctrl->regs + OFFSET_ABR_CTRL_STATUS) &
+		    ABR_BOOT_SRC_INDICATE) {
+
+			if (devm_device_add_groups(dev, bswitch_primary_groups))
+				dev_warn(dev, "Could not add access_primary\n");
+		} else {
+			if (devm_device_add_groups(dev, bswitch_backup_groups))
+				dev_warn(dev, "Could not add access_backup\n");
+		}
+	}
+
 	ret = devm_spi_register_master(dev, spi_ctrl);
 
 end:
diff --git a/include/linux/soc/aspeed/aspeed-abr.h b/include/linux/soc/aspeed/aspeed-abr.h
new file mode 100644
index 000000000000..3542f76e0232
--- /dev/null
+++ b/include/linux/soc/aspeed/aspeed-abr.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __ASPEED_ABR_H__
+#define __ASPEED_ABR_H__
+
+#include <linux/device.h>
+#include <linux/sysfs.h>
+#include <linux/io.h>
+
+#define OFFSET_ABR_CTRL_STATUS 0x64
+#define OFFSET_ABR_TIMER_RELOAD 0x68
+#define OFFSET_ABR_TIMER_RESTART 0x6c
+
+#define ABR_WDT_ENABLE BIT(0)
+#define ABR_BOOT_SRC_INDICATE BIT(4)
+#define ABR_RESTART_MAGIC 0x4755
+#define ABR_CLEAR_BOOT_SRC_MAGIC (0xEA << 16)
+#define ABR_RELOAD_MAX_VALUE 0x3ff
+
+static inline ssize_t _access_primary_show(void __iomem *regs,
+					   struct device_attribute *attr,
+					   char *buf)
+{
+	u32 status = readl(regs + OFFSET_ABR_CTRL_STATUS);
+
+	return sysfs_emit(buf, "%u\n", !(status & ABR_BOOT_SRC_INDICATE));
+}
+
+static inline ssize_t _access_primary_store(void __iomem *regs,
+					    struct device_attribute *attr,
+					    const char *buf, size_t size)
+{
+	unsigned long val;
+
+	if (kstrtoul(buf, 10, &val))
+		return -EINVAL;
+
+	/* write bit[23:16] = 0xEA */
+	if (val)
+		writel(readl(regs + OFFSET_ABR_CTRL_STATUS) |
+			       ABR_CLEAR_BOOT_SRC_MAGIC,
+		       regs + OFFSET_ABR_CTRL_STATUS);
+
+	return size;
+}
+
+static inline ssize_t _access_backup_show(void __iomem *regs,
+					  struct device_attribute *attr,
+					  char *buf)
+{
+	u32 status = readl(regs + OFFSET_ABR_CTRL_STATUS);
+	u32 timer_reload = readl(regs + OFFSET_ABR_TIMER_RELOAD);
+
+	if (!(status & ABR_WDT_ENABLE))
+		return sysfs_emit(buf, "%u\n", 0);
+	/* [31:16] Counter value status */
+	return sysfs_emit(buf, "%u\n", timer_reload >> 16);
+}
+
+static inline ssize_t _access_backup_store(void __iomem *regs,
+					   struct device_attribute *attr,
+					   const char *buf, size_t size)
+{
+	unsigned long count;
+
+	if (kstrtoul(buf, 10, &count))
+		return -EINVAL;
+
+	/* disable watchdog */
+	if (count == 0) {
+		writel(0, regs + OFFSET_ABR_CTRL_STATUS);
+		return size;
+	}
+
+	/*
+	 * bit[12:0] : Reload value of expire time
+	 * The time unit is 0.1 second. Default set at 22 seconds
+	 * 0: Immediately timeout
+	 */
+	count = count < ABR_RELOAD_MAX_VALUE ? count : ABR_RELOAD_MAX_VALUE;
+
+	writel(0, regs + OFFSET_ABR_CTRL_STATUS);
+	writel(count, regs + OFFSET_ABR_TIMER_RELOAD);
+
+	/* Write 0x4755 value to load the reload value into watchdog counter */
+	writel(ABR_RESTART_MAGIC, regs + OFFSET_ABR_TIMER_RESTART);
+
+	/* Enable watchdog */
+	writel(ABR_WDT_ENABLE, regs + OFFSET_ABR_CTRL_STATUS);
+	return size;
+}
+
+#endif
-- 
2.25.1

