Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 301434A5605
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Feb 2022 06:05:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JntD20C4pz3bVC
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Feb 2022 16:05:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pQcqzwBz;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pQcqzwBz; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JntCw3JM4z2yK6
 for <linux-aspeed@lists.ozlabs.org>; Tue,  1 Feb 2022 16:05:16 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id b15so14471881plg.3
 for <linux-aspeed@lists.ozlabs.org>; Mon, 31 Jan 2022 21:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8HhN0Mo5AAEuJ7GLyfzVMfqoylDTPvGZrezMx4WuD1Y=;
 b=pQcqzwBzTMUt9lhcStTT9fwKTd+uM9KFGW/Xynp4UnrxScTW2VG33Teyi7PCL+v98j
 6POqQnKQFswISlLtU1hDylQGsrJ0qYsaq8Fp6JhEs66Of+MKNRPSZneIImArPfuYgUn+
 zdaF5/zKLPBZ77KtJF6uiTeUHGew/VLxlM3EFtTaz4Z926PX9SiXhaXButFkPqlVyWng
 3eNlSiowJnArQTA46mnNNUkJtYWdXFQmJmkDIVTUrr7omZAivB/M4amoSlDdUx1iVUPa
 yAv9WWxSRi3tnMczSWHJyHkwcEhuIRWpBwSaoSDhBHx8pXgsfZK97aGdfPRMhVKs1Ect
 RQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8HhN0Mo5AAEuJ7GLyfzVMfqoylDTPvGZrezMx4WuD1Y=;
 b=rtR1FAKhf9pWZeYniCb/K3W9UNNULJBx1ts6Z62GClDsw0XYnMoq7nlj0tTDCGsRcy
 BroAsd7WZlzl/dL2kEoxox6gEE0LdaCLzFNSso+RYzcadpR18hZ4OwDgMEvk0zxz6W+l
 rySkpTYsQWk/r5IYPvxeTNGaQwOozEhRHBAgDQ7OhQrBidhd7unhVd1xNn90OHp8JA51
 TNIaWEs7hPEzYMXDB9wiDg8Ecsiv5I5sOIfugHcTx88YAzjhVVovJcvFdfn9Egxo22JQ
 wm9gM7ixnSTHfUNFLtmwtb9FUgt46/rxWOfBQQnFYM2PaGue5JjatrDV1UU9jvB80nhn
 oNYA==
X-Gm-Message-State: AOAM530sRTJQe2qfX4QRCfoDYCMGg2Y7KOsSHC1iCXS3liZLtyiWa5iG
 fOI6lcSjgmAPrUrYogMhYzQ=
X-Google-Smtp-Source: ABdhPJz5avUIU4+X4vd3nMCzoEWBcmSaRvczxUqWfR52EfwhLQGqxyCpeHdGLQIZDWK9NzHJ6jgwxQ==
X-Received: by 2002:a17:90a:f298:: with SMTP id
 fs24mr350977pjb.75.1643691913680; 
 Mon, 31 Jan 2022 21:05:13 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id u37sm6181991pga.2.2022.01.31.21.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 21:05:13 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH 1/2] firmware: Add boot information sysfs
Date: Tue,  1 Feb 2022 15:35:00 +1030
Message-Id: <20220201050501.182961-2-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201050501.182961-1-joel@jms.id.au>
References: <20220201050501.182961-1-joel@jms.id.au>
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
sysfs directory and some example properties that a system can choose to
expose to describe how the system was started.

Currently the intended use describes five files, relating to hardware
root of trust configuration.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../ABI/testing/sysfs-firmware-bootinfo       | 43 +++++++++++++++++++
 drivers/base/firmware.c                       | 14 ++++++
 include/linux/firmware_bootinfo.h             |  8 ++++
 3 files changed, 65 insertions(+)
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
index 8dff940e0db9..2a6478aa178d 100644
--- a/drivers/base/firmware.c
+++ b/drivers/base/firmware.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/device.h>
+#include <linux/firmware_bootinfo.h>
 
 #include "base.h"
 
@@ -24,3 +25,16 @@ int __init firmware_init(void)
 		return -ENOMEM;
 	return 0;
 }
+
+/*
+ * Exposes attributes documented in Documentation/ABI/testing/sysfs-firmware-bootinfo
+ */
+int __init firmware_bootinfo_init(const struct attribute_group *attr_group)
+{
+	struct kobject *kobj= kobject_create_and_add("bootinfo", firmware_kobj);
+	if (!kobj)
+		return -ENOMEM;
+
+	return sysfs_create_group(kobj, attr_group);
+}
+EXPORT_SYMBOL_GPL(firmware_bootinfo_init);
diff --git a/include/linux/firmware_bootinfo.h b/include/linux/firmware_bootinfo.h
new file mode 100644
index 000000000000..581b68508ec8
--- /dev/null
+++ b/include/linux/firmware_bootinfo.h
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2022 IBM Corp
+
+#include <linux/sysfs.h>
+#include <linux/init.h>
+
+int __init firmware_bootinfo_init(const struct attribute_group *attr_group);
+
-- 
2.34.1

