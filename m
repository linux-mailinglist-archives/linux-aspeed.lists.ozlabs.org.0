Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F34873F13D2
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Aug 2021 08:52:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqwSR6zwpz3bTV
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Aug 2021 16:52:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bSjEvlCD;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bSjEvlCD; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqwSG360kz3bZr
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Aug 2021 16:52:30 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id bo18so4373834pjb.0
 for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Aug 2021 23:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=10mXIJmtbKRd+xhhD29gKQpI6TpHJzdExf1Tb9trL9o=;
 b=bSjEvlCDdMPnFS7zglwIdXuhMELDu8lVArt/KJ+oswv2WLKKXDvxw6Zm72CmGJSpO4
 LGDjm0zu5jnH/1DyUg09sSzLvXD32SFV/0Gjyu57ualv+i+ed+btUzUj+OPXBC3ulC+N
 EJP6cc7l4MW3cfizgw1MCxmXVY3tBh1rG45ypdXNgR9kOe6vZuatAe7USKhWz0VY4QzF
 G0AkiAWPb+g40Qszeq+Xk8ruXv9MKhI29T3PxV/ydGQ8pJ/iN5CUIgzq/x7H8KgGruoV
 b23NYVuEAeT2g0LHQgrtStAi765UOI93gj0Mu43OgFcV5KE22RDELrhBqZfKeFVjZ3lD
 d52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=10mXIJmtbKRd+xhhD29gKQpI6TpHJzdExf1Tb9trL9o=;
 b=mpGmJGLBatMIj9WCLJ30T7kc3FdthDxgApHMJ1u9kI98qu6LSlTmpZ1LTYiy4vhyu1
 gjMIfagYKBJQS1YLl1h+0J7ol+D5Is/1kYbNEHK+8BGGNvi1XmA7mtCa7rb/BqpiClPp
 JWFKvI3mcGXHExJ1pEXP5xSQWH/cacHmL4kvaP/+aaAnbLAhsC8BbxFF4XHozJeNX9G0
 OJa+ouQaEQIlBrrSzbxMOCljU249QWC34aboAtt9nqRGK7sD54cWtceBqfwKbEaS/cSt
 7WpJul5M1b0PRYq073hHKyUXVyQWjmUjI1qINOiPB1+3y7tQgCOke2X+ZLntbxgrmP4G
 Tr3A==
X-Gm-Message-State: AOAM531MpA0nydAPQGUIjP6IdyGoZX8IfWuURRiteZD+GZsORm5kS120
 AZtTfWLYLmDxh80f7zX/b6XvFqRFICs=
X-Google-Smtp-Source: ABdhPJwoBfJsOS+syJjb0EqCRoyVaKFHoC2Yz62lsj6/lQIQWRRYVJjADhkjgJFnqspGavImZJr2Xg==
X-Received: by 2002:a17:90a:be09:: with SMTP id
 a9mr13378713pjs.85.1629355947931; 
 Wed, 18 Aug 2021 23:52:27 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id 4sm1860035pjb.21.2021.08.18.23.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 23:52:26 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 4/4] ARM: config: aspeed: Regenerate defconfigs
Date: Thu, 19 Aug 2021 16:22:03 +0930
Message-Id: <20210819065203.2620911-5-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210819065203.2620911-1-joel@jms.id.au>
References: <20210819065203.2620911-1-joel@jms.id.au>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

A make defconfig && make savedefconfig was performed for each
configuration.

Most changes are due to options moving around, except for the following
which are due to changing defaults:

 - SECCOMP is enabled by default as of commit 282a181b1a0d ("seccomp:
   Move config option SECCOMP to arch/Kconfig") in v5.9

 - The soc drivers ASPEED_LPC_CTRL, ASPEED_LPC_SNOOP and ASPEED_P2A_CTRL
   are enabled by default when the aspeed platform is enabled, as of
   commit 592693a1f881 ("soc: aspeed: Improve kconfig") in v5.9

 - The ZBOOT_ROM_TEXT/BSS values fall out of the defconfig as of
   commit 39c3e304567a ("ARM: 8984/1: Kconfig: set default
   ZBOOT_ROM_TEXT/BSS value to 0x0") in v5.8

- I2C_MUX is selected by MEDIA_SUBDRV_AUTOSELECT, probably as of about
  v5.8. It was in the config as it is required bt the PCA I2C muxes that
  enabled it

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/configs/aspeed_g4_defconfig | 12 ++----------
 arch/arm/configs/aspeed_g5_defconfig | 20 ++++++--------------
 2 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
index a578865c2d96..acaafa351d08 100644
--- a/arch/arm/configs/aspeed_g4_defconfig
+++ b/arch/arm/configs/aspeed_g4_defconfig
@@ -3,6 +3,7 @@ CONFIG_KERNEL_XZ=y
 CONFIG_SYSVIPC=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=16
@@ -14,7 +15,6 @@ CONFIG_BLK_DEV_INITRD=y
 # CONFIG_UID16 is not set
 # CONFIG_SYSFS_SYSCALL is not set
 # CONFIG_AIO is not set
-CONFIG_BPF_SYSCALL=y
 CONFIG_EMBEDDED=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_COMPAT_BRK is not set
@@ -26,10 +26,7 @@ CONFIG_MACH_ASPEED_G4=y
 CONFIG_VMSPLIT_2G=y
 CONFIG_AEABI=y
 CONFIG_UACCESS_WITH_MEMCPY=y
-CONFIG_SECCOMP=y
 # CONFIG_ATAGS is not set
-CONFIG_ZBOOT_ROM_TEXT=0x0
-CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
 CONFIG_KEXEC=y
@@ -76,7 +73,6 @@ CONFIG_NETCONSOLE=y
 # CONFIG_NET_VENDOR_AMAZON is not set
 # CONFIG_NET_VENDOR_AQUANTIA is not set
 # CONFIG_NET_VENDOR_ARC is not set
-# CONFIG_NET_VENDOR_AURORA is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
 # CONFIG_NET_VENDOR_CADENCE is not set
 # CONFIG_NET_VENDOR_CAVIUM is not set
@@ -132,7 +128,6 @@ CONFIG_ASPEED_BT_IPMI_BMC=y
 CONFIG_HW_RANDOM_TIMERIOMEM=y
 # CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_MUX=y
 CONFIG_I2C_MUX_PCA9541=y
 CONFIG_I2C_MUX_PCA954x=y
 CONFIG_I2C_ASPEED=y
@@ -214,9 +209,6 @@ CONFIG_RTC_DRV_RV8803=y
 CONFIG_RTC_DRV_ASPEED=y
 # CONFIG_VIRTIO_MENU is not set
 # CONFIG_IOMMU_SUPPORT is not set
-CONFIG_ASPEED_LPC_CTRL=y
-CONFIG_ASPEED_LPC_SNOOP=y
-CONFIG_ASPEED_P2A_CTRL=y
 CONFIG_IIO=y
 CONFIG_ASPEED_ADC=y
 CONFIG_MAX1363=y
@@ -257,6 +249,7 @@ CONFIG_DEBUG_INFO_DWARF4=y
 CONFIG_GDB_SCRIPTS=y
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_DEBUG_FS=y
+CONFIG_DEBUG_WX=y
 CONFIG_SCHED_STACK_END_CHECK=y
 CONFIG_PANIC_ON_OOPS=y
 CONFIG_PANIC_TIMEOUT=-1
@@ -265,6 +258,5 @@ CONFIG_SOFTLOCKUP_DETECTOR=y
 CONFIG_WQ_WATCHDOG=y
 # CONFIG_SCHED_DEBUG is not set
 CONFIG_FUNCTION_TRACER=y
-CONFIG_DEBUG_WX=y
 CONFIG_DEBUG_USER=y
 # CONFIG_RUNTIME_TESTING_MENU is not set
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 6ba30b212bda..480dbbb4ff91 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -3,6 +3,7 @@ CONFIG_KERNEL_XZ=y
 CONFIG_SYSVIPC=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=16
@@ -14,7 +15,6 @@ CONFIG_BLK_DEV_INITRD=y
 # CONFIG_UID16 is not set
 # CONFIG_SYSFS_SYSCALL is not set
 # CONFIG_AIO is not set
-CONFIG_BPF_SYSCALL=y
 CONFIG_EMBEDDED=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_COMPAT_BRK is not set
@@ -31,10 +31,7 @@ CONFIG_VMSPLIT_2G=y
 CONFIG_NR_CPUS=2
 CONFIG_HIGHMEM=y
 CONFIG_UACCESS_WITH_MEMCPY=y
-CONFIG_SECCOMP=y
 # CONFIG_ATAGS is not set
-CONFIG_ZBOOT_ROM_TEXT=0x0
-CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_KEXEC=y
 CONFIG_VFP=y
 CONFIG_NEON=y
@@ -89,7 +86,6 @@ CONFIG_NETCONSOLE=y
 # CONFIG_NET_VENDOR_AMAZON is not set
 # CONFIG_NET_VENDOR_AQUANTIA is not set
 # CONFIG_NET_VENDOR_ARC is not set
-# CONFIG_NET_VENDOR_AURORA is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
 # CONFIG_NET_VENDOR_CADENCE is not set
 # CONFIG_NET_VENDOR_CAVIUM is not set
@@ -149,7 +145,6 @@ CONFIG_ASPEED_BT_IPMI_BMC=y
 CONFIG_HW_RANDOM_TIMERIOMEM=y
 # CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_MUX=y
 CONFIG_I2C_MUX_GPIO=y
 CONFIG_I2C_MUX_PCA9541=y
 CONFIG_I2C_MUX_PCA954x=y
@@ -232,9 +227,6 @@ CONFIG_RTC_DRV_RV8803=y
 CONFIG_RTC_DRV_ASPEED=y
 # CONFIG_VIRTIO_MENU is not set
 # CONFIG_IOMMU_SUPPORT is not set
-CONFIG_ASPEED_LPC_CTRL=y
-CONFIG_ASPEED_LPC_SNOOP=y
-CONFIG_ASPEED_P2A_CTRL=y
 CONFIG_IIO=y
 CONFIG_ASPEED_ADC=y
 CONFIG_MAX1363=y
@@ -279,14 +271,14 @@ CONFIG_DEBUG_INFO_DWARF4=y
 CONFIG_GDB_SCRIPTS=y
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_DEBUG_FS=y
+CONFIG_DEBUG_WX=y
+CONFIG_SCHED_STACK_END_CHECK=y
+CONFIG_PANIC_ON_OOPS=y
+CONFIG_PANIC_TIMEOUT=-1
 CONFIG_SOFTLOCKUP_DETECTOR=y
 # CONFIG_DETECT_HUNG_TASK is not set
 CONFIG_WQ_WATCHDOG=y
-CONFIG_PANIC_ON_OOPS=y
-CONFIG_PANIC_TIMEOUT=-1
 # CONFIG_SCHED_DEBUG is not set
-CONFIG_SCHED_STACK_END_CHECK=y
 CONFIG_FUNCTION_TRACER=y
-# CONFIG_RUNTIME_TESTING_MENU is not set
-CONFIG_DEBUG_WX=y
 CONFIG_DEBUG_USER=y
+# CONFIG_RUNTIME_TESTING_MENU is not set
-- 
2.32.0

