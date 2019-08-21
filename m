Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D32A1971CB
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2019 07:56:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CxkD2D2lzDqyj
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2019 15:56:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nLUkfdAc"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Cxk023p7zDqbp
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2019 15:56:24 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id t14so708772plr.11
 for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Aug 2019 22:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cl+8p7IjwOmu/57vcjZR8WI0fB01MFPdHX/I9mopYKM=;
 b=nLUkfdAcnMwMhCbckNJld74SrWq6OJpEZghk3AlLw3YrLeLkd64vM9dz4WPn0GSpUd
 sx2GEozETcKoqjFCb8CTrGGLggcZbhN33h+Zbv+wtoBllPojJGO6ktF6HfynDuVRJU/0
 MF13E62ssTk4bpVK+K9jjvpXJWpOmtTlgK7Vm3bsIaWD0tNZ4liKtl46D7Z363KldTzk
 G75OzMmWg9rvAQFlBzW/acDAxTz8A+7TXDElu7W7pYlKWED403UpAfhlsNl4NWMDqzS1
 TCntO4Jbxl8iTEVeO1TW0TteJqF14AEI86GZNB5VYi+xSRIlwWpMQqCaHTlrCj0q4Ezj
 qLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Cl+8p7IjwOmu/57vcjZR8WI0fB01MFPdHX/I9mopYKM=;
 b=N+9ZC6Ck9LcKDHT45TnYaBEglZjJqdmBVrDf7awKmRVpSAI6gdWXU0z2QCCSXUQTUl
 q/FvK5rQdJf5pxK+PlDqypAYaemTqXPS/JoAh8t3+Y+XpdcmnefV0nbfRlbPsqGRrA4R
 WE0a766LJncy3qOOqxiRPmP78/QA1Q0+EmzWfkYm000XFdujNyg9CbjPkLJ9Hec1yl57
 OTXnopKI0BU13Mym26rtT4JD+Jt615RQYek17OsoEFuI1shjF4xiT/kRWTYZcqb/k6MF
 yMvjYhh/xUbuwASthTibUsONGFZ9EvHDBmmJvHhCkD0mziAWhfZBMMzWXkzcaiyWsZ3V
 0R2A==
X-Gm-Message-State: APjAAAVDZXGLZOXbX7UU7/MpEqQ3WbLocTVEs8Ghl+bmfEWUm3u8Hlr/
 UZAFhOND6jA1kDEQApXZszQ=
X-Google-Smtp-Source: APXvYqzYQs1jmaRyUy+/+2oBaJRR5DJBG64wLpMysrA/dlWTCgTRjmToDLsMqmOik2O6WLD/5OCBCQ==
X-Received: by 2002:a17:902:9b94:: with SMTP id
 y20mr32176648plp.260.1566366982431; 
 Tue, 20 Aug 2019 22:56:22 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id m9sm26568254pfh.84.2019.08.20.22.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 22:56:21 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Subject: [PATCH 7/7] ARM: configs: aspeed_g5: Enable AST2600
Date: Wed, 21 Aug 2019 15:25:30 +0930
Message-Id: <20190821055530.8720-8-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190821055530.8720-1-joel@jms.id.au>
References: <20190821055530.8720-1-joel@jms.id.au>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

CONFIG_STRICT_KERNEL_RWX is enabled by default with ARMv7.

Turn on HIGHMEM as the EVB has 2GB of RAM, and not all is usable without
hihgmem.

The SoC contains Cortex A7 supporting VFP and has two CPUs.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/configs/aspeed_g5_defconfig | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 426d8e0c9890..597536cc9573 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -21,21 +21,26 @@ CONFIG_PERF_EVENTS=y
 CONFIG_SLAB=y
 CONFIG_SLAB_FREELIST_RANDOM=y
 CONFIG_ARCH_MULTI_V6=y
-# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_ASPEED=y
 CONFIG_MACH_ASPEED_G5=y
+CONFIG_MACH_ASPEED_G6=y
 # CONFIG_CACHE_L2X0 is not set
+CONFIG_SMP=y
+# CONFIG_ARM_CPU_TOPOLOGY is not set
 CONFIG_VMSPLIT_2G=y
+CONFIG_NR_CPUS=2
+CONFIG_HIGHMEM=y
 CONFIG_UACCESS_WITH_MEMCPY=y
 CONFIG_SECCOMP=y
 # CONFIG_ATAGS is not set
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_KEXEC=y
-# CONFIG_SUSPEND is not set
+CONFIG_VFP=y
+CONFIG_NEON=y
+CONFIG_KERNEL_MODE_NEON=y
 CONFIG_FIRMWARE_MEMMAP=y
 CONFIG_JUMP_LABEL=y
-CONFIG_STRICT_KERNEL_RWX=y
 # CONFIG_BLK_DEV_BSG is not set
 # CONFIG_BLK_DEBUG_FS is not set
 # CONFIG_MQ_IOSCHED_DEADLINE is not set
@@ -140,10 +145,12 @@ CONFIG_ASPEED_BT_IPMI_BMC=y
 CONFIG_HW_RANDOM_TIMERIOMEM=y
 # CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_MUX=y
 CONFIG_I2C_MUX_PCA9541=y
 CONFIG_I2C_MUX_PCA954x=y
 CONFIG_I2C_ASPEED=y
 CONFIG_I2C_FSI=y
+CONFIG_SPI=y
 CONFIG_GPIOLIB=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_ASPEED=y
@@ -194,6 +201,10 @@ CONFIG_USB_CONFIGFS_F_LB_SS=y
 CONFIG_USB_CONFIGFS_F_FS=y
 CONFIG_USB_CONFIGFS_F_HID=y
 CONFIG_USB_CONFIGFS_F_PRINTER=y
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_OF_ASPEED=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_CLASS_FLASH=y
-- 
2.23.0.rc1

