Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3CE4A835B
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Feb 2022 12:54:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqHBr00Q1z3bbH
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Feb 2022 22:54:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lEefzxPq;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lEefzxPq; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqHBf0B5Mz30Qy
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Feb 2022 22:54:01 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id i30so2018984pfk.8
 for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Feb 2022 03:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dAqSf/tyCwdsZHkiyWbb3eiNXltTa0d1QVuYusLc2f0=;
 b=lEefzxPqPP58T2ta4bd1mVNE9Swkps/YStQ5ytP+dHpxeWeIBqbiai52u5LlNp6LLi
 kJIZlf1iyqU6qogMnjxpX3nC87Y4QK2DimNOtC69jLWO/jAsAG9R6LnmAbIperFt2bhh
 zLAq1VhpMJmNh2OLyjrZEKku+BKuzmdISuiOXPNOs1yxUi6hv24dKotuEP1YiG3MlKWP
 d04B05m34XKNPG3hP+WhUOYLsVegFC7kKD+kvh0L3z3k31B7HTaM6QTf8UPtyY4x9yvz
 rIGAOxh+MotKoCfiw8quYHOMCk2arbIcZnIXYpVm173U4puSr4c8GUllSO4F1uFx+m/2
 bL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dAqSf/tyCwdsZHkiyWbb3eiNXltTa0d1QVuYusLc2f0=;
 b=wog3clxLI9jaGI16GGDSMufhA11nOPmoX1Cy7ZpF/ziZEj1QLbeTDpHV1gwHmrfHy+
 hTICVkHZ0B0QGTCNwxn4pw+N4fm5hla42T/6kqwIL3QSVkD3q65ogvht+iGwwKoJ472K
 oDZ5cE0I6ycvpKMmrmj/2SHLLAc1YqlKLCALcvwQ0pdhy4b3PXece+y4jnhpGGKA170p
 fX9soXy2RvHZZw8qvscGW91tssTvfkrgefVHj8n4EcWou3Jnfk5Zq1xmXSnitwozjF+7
 ulYi/9zN+Ip9US3jk0palZ6CHgOat5AVEprth8VH6hjCLuUZtr89E0eJWuFm34xjHadc
 +fsQ==
X-Gm-Message-State: AOAM531rVmi4o+H4+tLm/cnUCe6Ce13yo6EhofhrG9mnUEwPRHzBytBO
 GLhLbDf6H/Gmu90g4hmqpjH5YuTQW+U=
X-Google-Smtp-Source: ABdhPJxFEVOWHb3iWJqOFPjq9HC5m+R+EmkHDyHp9hzqEiU5T/OeGD1iK/5rq7whyILLd9P3KudZ8Q==
X-Received: by 2002:a05:6a00:24c8:: with SMTP id
 d8mr33627605pfv.60.1643889239499; 
 Thu, 03 Feb 2022 03:53:59 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id mp22sm9586389pjb.28.2022.02.03.03.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 03:53:58 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH v2 1/3] firmware: Add boot information to sysfs
Date: Thu,  3 Feb 2022 22:23:42 +1030
Message-Id: <20220203115344.267159-2-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203115344.267159-1-joel@jms.id.au>
References: <20220203115344.267159-1-joel@jms.id.au>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Machines often have firmware that perform some action before Linux is
loaded. It's useful to know how this firmware is configured, so create a
sysfs directory and some properties that a system can choose to expose
to describe how the system was started.

Currently the intended use describes five files, relating to hardware
root of trust configuration.

These properties are populated by platform code at startup. Using fixed
values is suitable as the state that the system booted in will not
change after firmware has handed over.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 - Rewrite so properties are present in common code and are exposed based
   on the is_visible callback.
 - Use sysfs_emit
---
 .../ABI/testing/sysfs-firmware-bootinfo       | 43 +++++++++
 drivers/base/firmware.c                       | 90 +++++++++++++++++++
 include/linux/firmware_bootinfo.h             | 22 +++++
 3 files changed, 155 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-bootinfo
 create mode 100644 include/linux/firmware_bootinfo.h

diff --git a/Documentation/ABI/testing/sysfs-firmware-bootinfo b/Documentation/ABI/testing/sysfs-firmware-bootinfo
new file mode 100644
index 000000000000..cd6c42316345
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-firmware-bootinfo
@@ -0,0 +1,43 @@
+What:		/sys/firmware/bootinfo/*
+Date:		Jan 2022
+Description:
+		A system can expose information about how it was started in
+		this directory.
+
+		This information is agnostic as to the firmware implementation.
+
+		A system may expose a subset of these properties as applicable.
+
+
+What:		/sys/firmware/bootinfo/secure_boot
+Date:		Jan 2022
+Description:
+		Indicates the system was started with secure boot enabled in
+		the firmware.
+
+
+What:		/sys/firmware/bootinfo/abr_image
+Date:		Jan 2022
+Description:
+		Indicates the system was started from the alternate image
+		loaded from an Alternate Boot Region. Often this is a result of
+		the primary firmware image failing to start the system.
+
+
+What:		/sys/firmware/bootinfo/low_security_key
+Date:		Jan 2022
+Description:
+		Indicates the system's secure boot was verified with a low
+		security or development key.
+
+What:		/sys/firmware/bootinfo/otp_protected
+Date:		Jan 2022
+Description:
+		Indicates the system's boot configuration region is write
+		protected and cannot be modified.
+
+What:		/sys/firmware/bootinfo/uart_boot
+Date:		Jan 2022
+Description:
+		Indicates the system firmware was loaded from a UART instead of
+		an internal boot device.
diff --git a/drivers/base/firmware.c b/drivers/base/firmware.c
index 8dff940e0db9..24b931232eb2 100644
--- a/drivers/base/firmware.c
+++ b/drivers/base/firmware.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/device.h>
+#include <linux/firmware_bootinfo.h>
 
 #include "base.h"
 
@@ -24,3 +25,92 @@ int __init firmware_init(void)
 		return -ENOMEM;
 	return 0;
 }
+
+/*
+ * Exposes attributes documented in Documentation/ABI/testing/sysfs-firmware-bootinfo
+ */
+static struct bootinfo bootinfo;
+
+static ssize_t abr_image_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%d\n", bootinfo.abr_image.val);
+}
+static DEVICE_ATTR_RO(abr_image);
+
+static ssize_t low_security_key_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%d\n", bootinfo.low_security_key.val);
+}
+static DEVICE_ATTR_RO(low_security_key);
+
+static ssize_t otp_protected_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%d\n", bootinfo.otp_protected.val);
+}
+static DEVICE_ATTR_RO(otp_protected);
+
+static ssize_t secure_boot_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%d\n", bootinfo.secure_boot.val);
+}
+static DEVICE_ATTR_RO(secure_boot);
+
+static ssize_t uart_boot_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%d\n", bootinfo.uart_boot.val);
+}
+static DEVICE_ATTR_RO(uart_boot);
+
+#define ATTR_ENABLED(a) ((attr == &dev_attr_##a.attr) && bootinfo.a.en)
+
+static umode_t bootinfo_attr_mode(struct kobject *kobj, struct attribute *attr, int index)
+{
+	if (ATTR_ENABLED(abr_image))
+		return 0444;
+
+	if (ATTR_ENABLED(otp_protected))
+		return 0444;
+
+	if (ATTR_ENABLED(low_security_key))
+		return 0444;
+
+	if (ATTR_ENABLED(otp_protected))
+		return 0444;
+
+	if (ATTR_ENABLED(low_security_key))
+		return 0444;
+
+	if (ATTR_ENABLED(secure_boot))
+		return 0444;
+
+	if (ATTR_ENABLED(uart_boot))
+		return 0444;
+
+	return 0;
+}
+
+static struct attribute *bootinfo_attrs[] = {
+	&dev_attr_abr_image.attr,
+	&dev_attr_low_security_key.attr,
+	&dev_attr_otp_protected.attr,
+	&dev_attr_secure_boot.attr,
+	&dev_attr_uart_boot.attr,
+	NULL,
+};
+
+static const struct attribute_group bootinfo_attr_group = {
+	.attrs = bootinfo_attrs,
+	.is_visible = bootinfo_attr_mode,
+};
+
+int __init firmware_bootinfo_init(struct bootinfo *bootinfo_init)
+{
+	struct kobject *kobj = kobject_create_and_add("bootinfo", firmware_kobj);
+	if (!kobj)
+		return -ENOMEM;
+
+	memcpy(&bootinfo, bootinfo_init, sizeof(bootinfo));
+
+	return sysfs_create_group(kobj, &bootinfo_attr_group);
+}
+EXPORT_SYMBOL_GPL(firmware_bootinfo_init);
diff --git a/include/linux/firmware_bootinfo.h b/include/linux/firmware_bootinfo.h
new file mode 100644
index 000000000000..3fe630b061b9
--- /dev/null
+++ b/include/linux/firmware_bootinfo.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* Copyright 2022 IBM Corp. */
+
+#include <linux/sysfs.h>
+#include <linux/init.h>
+
+#define BOOTINFO_SET(b, n, v) b.n.en = true; b.n.val = v
+
+struct bootinfo_entry {
+	bool en;
+	bool val;
+};
+
+struct bootinfo {
+	struct bootinfo_entry abr_image;
+	struct bootinfo_entry low_security_key;
+	struct bootinfo_entry otp_protected;
+	struct bootinfo_entry secure_boot;
+	struct bootinfo_entry uart_boot;
+};
+
+int __init firmware_bootinfo_init(struct bootinfo *bootinfo_init);
-- 
2.34.1

