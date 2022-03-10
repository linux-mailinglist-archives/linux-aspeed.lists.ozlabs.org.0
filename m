Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB6E4D3DE0
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Mar 2022 01:06:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDTrb21Cmz3bSv
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Mar 2022 11:06:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=o4RAwQqn;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=o4RAwQqn; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDTrP67x9z2xtp
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Mar 2022 11:06:45 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id c11so3278730pgu.11
 for <linux-aspeed@lists.ozlabs.org>; Wed, 09 Mar 2022 16:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1cFKtN40pL2xMYIvh9TRbkp8PsEIDv0ea2xxCLSNgsA=;
 b=o4RAwQqnmfCI8nBbFcaF7OokoMqzTCNRNZjvyvWyY9xYj66UDqBRiQKN4oOB2m04Er
 hpBGaJb+OEfzRZN3Fbvna4jvuLuAfy0SnWLf3RSaQtyyyMxGuERFiL2F3OCe0kKEGXMf
 172JAZglS3JDdDgesIyek3NiUpI8GxyZ+2ugOit1K/LnNnIiTxle1HeFYyU3ldo0KQvQ
 u/ZWgXOBXyH0HeFv/lg2TbzM0DPQAxQobLCRlhR6kqH4ZRO4eSN6DhLl3PXaJBsFR9fI
 uL9q0fIYhF53+FWZv1WVle8FzGBVyjSo5RnkONDes7/8NVY6p4HbZW7M2sQF4txfjXEJ
 WT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1cFKtN40pL2xMYIvh9TRbkp8PsEIDv0ea2xxCLSNgsA=;
 b=YDgjJwdY/7bkywAUZJOYtpVcqvnZqilP00B639E2Y1NmeNdvmfLG4hzJTjLskI7JwI
 kD0eYinwRaeNCHKAdmHfeATy9KE7HiOP7vl2ewjesdNBWZswyWDESNgKD0RkdJxC8Unl
 rbeFfN/CwJ543nW56++EDYYHYqrY4MlPG/0XdJ6I+e4rBuNaKx0L/OeM7pWkJ68DN7Ok
 q1SwT+CPgxfG0T1a0a2XFLOXqXmV8I/G2nTVDdr8FRB0agj5ugMTM4xsuvpReQfjxcPV
 CF8ZaE23bIoQawTiJMZOEWX0l/+1wpSuPAN9cQ2YR3EziUFwUB/AyEosUJurGfvMqkav
 vgXg==
X-Gm-Message-State: AOAM5309QGIxB5zM/RVWOy4Od+u0vfz6NSnbrlq7iPLeYc3oLOeX9w41
 JcCIumIpNzG+/9nLE1k4izK5D2G9EbEOqA==
X-Google-Smtp-Source: ABdhPJxaAmNrfvQiHS+BuqoTBOqVud9HzWd+yVhE8lfV6qlsscpgEj85G+U9Dak5tN/JyDQyhYs9Uw==
X-Received: by 2002:a63:8a4c:0:b0:37e:31f8:15f2 with SMTP id
 y73-20020a638a4c000000b0037e31f815f2mr1775428pgd.225.1646870804502; 
 Wed, 09 Mar 2022 16:06:44 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a056a001a0600b004f2a4316a0asm4213405pfv.60.2022.03.09.16.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 16:06:43 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 1/2] ARM: aspeed: Add debugfs directory
Date: Thu, 10 Mar 2022 10:36:28 +1030
Message-Id: <20220310000629.119699-2-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220310000629.119699-1-joel@jms.id.au>
References: <20220310000629.119699-1-joel@jms.id.au>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This will be used by other drivers to hold machine specific debugfs
information.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/debugfs.c | 16 ++++++++++++++++
 arch/arm/mach-aspeed/Makefile  |  1 +
 2 files changed, 17 insertions(+)
 create mode 100644 arch/arm/mach-aspeed/debugfs.c

diff --git a/arch/arm/mach-aspeed/debugfs.c b/arch/arm/mach-aspeed/debugfs.c
new file mode 100644
index 000000000000..b7d1b8f28435
--- /dev/null
+++ b/arch/arm/mach-aspeed/debugfs.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2022 IBM Corp.
+
+#include <linux/debugfs.h>
+#include <linux/export.h>
+#include <linux/init.h>
+
+struct dentry *arch_debugfs_dir;
+EXPORT_SYMBOL(arch_debugfs_dir);
+
+static int __init aspeed_debugfs_init(void)
+{
+	arch_debugfs_dir = debugfs_create_dir("aspeed", NULL);
+	return 0;
+}
+arch_initcall(aspeed_debugfs_init);
diff --git a/arch/arm/mach-aspeed/Makefile b/arch/arm/mach-aspeed/Makefile
index 1951b3317a76..3db448ccdfe1 100644
--- a/arch/arm/mach-aspeed/Makefile
+++ b/arch/arm/mach-aspeed/Makefile
@@ -3,3 +3,4 @@
 # Copyright IBM Corp.
 
 obj-$(CONFIG_SMP) += platsmp.o
+obj-$(CONFIG_DEBUG_FS) += debugfs.o
-- 
2.34.1

