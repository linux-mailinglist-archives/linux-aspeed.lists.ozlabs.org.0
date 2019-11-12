Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9BFF8885
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 07:29:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ByXC653rzF3yj
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 17:29:47 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="P9PYlZgu"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ByWd6wkzzF3y6
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 17:29:17 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id q26so12589313pfn.11
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Nov 2019 22:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UUDGU5bEK87zS/zvlEOKFxc9b+Lh+WyGcJ2az77spzU=;
 b=P9PYlZgua/JfV89heBJgV98TMQ1fAx+Av1ZqdGidwAkRfFx9jMLlyIOewz1DdLTVyw
 Ns8I10lupzo1siKw1nmXKsxAg24aO/KDa0ldzvMvVlTglIXiiO0Hfi2xS1sM19y7dyjj
 CqZotFtKtjwZnnvNmOjVIf8LmhHr+cVY6XEuP2h1XKA5R0JEt1ios+ojFoZzS5iEoTar
 OtLOB3FlOREz4WC0T9VAiLOe6D04eBP+Ygo10RvPjo6DS/y0qFJJFTjL19t/acSRbNup
 n+uWAtc/i7uGSW8UJKIPHjBUourFI9wTA+mFODNSDr8+C1ldjkQS133eX1Tzgb0vZcNM
 2PVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UUDGU5bEK87zS/zvlEOKFxc9b+Lh+WyGcJ2az77spzU=;
 b=nUNm13MQr4w0hIXX86dWTv71HbRI1ohfV6v/zp4EYEQVdnfOWv5Kkc2YYwoAu/uLKz
 ATbPaf3Yotn8iDJU3Lp6ASJId3FsjCcUJMYc2AYIvNuW/XP/z73HyioXl+kLBOIL95Zb
 Oyt7IpoiVXQfabxx0skXX+O3IsanDTr3FzDw84T1XkF/GN00wSP84ec05TGqg0kwXr11
 UmnlgPsRN6caWmmMcB5eYUTxwRrVM48vSuEh392RkrPDcgsNEjKaHaBHreHCQ/IZZ7nI
 8uHIVRYH3vnHLOW13q45JvY2yekGPJ6IUC81VAIUekVvRjOOax4vlVJGtK38cEvueYeg
 qbAw==
X-Gm-Message-State: APjAAAVJI++vCPe2ynhWkN7qWliAzdHz+yldckQmol14mLVMh4D83jGb
 J2FwNZMs++h0nFI8YK9i1GM=
X-Google-Smtp-Source: APXvYqyHE2Nv+8XZ3okYhk6S/FI2JZ4VYd65cFUTQ0SXTUhJGGxPHG2Oeqf6Ux1G9ymGLeb4cLnb8Q==
X-Received: by 2002:a17:90a:f013:: with SMTP id
 bt19mr4259314pjb.16.1573540155266; 
 Mon, 11 Nov 2019 22:29:15 -0800 (PST)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id x20sm18573707pfa.186.2019.11.11.22.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 22:29:14 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 3/5] ARM: config: aspeed-g4: Add MMC, and cleanup
Date: Tue, 12 Nov 2019 16:58:55 +1030
Message-Id: <20191112062857.32638-4-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112062857.32638-1-joel@jms.id.au>
References: <20191112062857.32638-1-joel@jms.id.au>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The PCA muxes now depend on I2C_MUX. SPI si now required by SPI-NOR.

Add the eMMC driver, and remove the FSI SBEFIFO which is not used on AST2400
systems.

The remaining changes are cleanups from regenerating the defconfig.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/configs/aspeed_g4_defconfig | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
index 1857df992484..303f75a3baec 100644
--- a/arch/arm/configs/aspeed_g4_defconfig
+++ b/arch/arm/configs/aspeed_g4_defconfig
@@ -132,10 +132,12 @@ CONFIG_ASPEED_BT_IPMI_BMC=y
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
@@ -185,6 +187,12 @@ CONFIG_USB_CONFIGFS_F_LB_SS=y
 CONFIG_USB_CONFIGFS_F_FS=y
 CONFIG_USB_CONFIGFS_F_HID=y
 CONFIG_USB_CONFIGFS_F_PRINTER=y
+CONFIG_MMC=y
+# CONFIG_PWRSEQ_EMMC is not set
+# CONFIG_PWRSEQ_SIMPLE is not set
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_OF_ASPEED=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_CLASS_FLASH=y
@@ -216,7 +224,6 @@ CONFIG_FSI_MASTER_GPIO=y
 CONFIG_FSI_MASTER_HUB=y
 CONFIG_FSI_MASTER_AST_CF=y
 CONFIG_FSI_SCOM=y
-CONFIG_FSI_SBEFIFO=y
 CONFIG_FANOTIFY=y
 CONFIG_OVERLAY_FS=y
 CONFIG_TMPFS=y
@@ -231,7 +238,6 @@ CONFIG_SQUASHFS_ZSTD=y
 # CONFIG_NETWORK_FILESYSTEMS is not set
 CONFIG_HARDENED_USERCOPY=y
 CONFIG_FORTIFY_SOURCE=y
-# CONFIG_CRYPTO_ECHAINIV is not set
 CONFIG_CRYPTO_HMAC=y
 CONFIG_CRYPTO_SHA256=y
 CONFIG_CRYPTO_USER_API_HASH=y
@@ -247,14 +253,14 @@ CONFIG_DEBUG_INFO_REDUCED=y
 CONFIG_DEBUG_INFO_DWARF4=y
 CONFIG_GDB_SCRIPTS=y
 CONFIG_STRIP_ASM_SYMS=y
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
 CONFIG_DEBUG_WX=y
 CONFIG_DEBUG_USER=y
+# CONFIG_RUNTIME_TESTING_MENU is not set
-- 
2.24.0

