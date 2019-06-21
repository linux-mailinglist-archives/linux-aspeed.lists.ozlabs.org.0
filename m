Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B4C4E6EC
	for <lists+linux-aspeed@lfdr.de>; Fri, 21 Jun 2019 13:16:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VbjP1ZJzzDqd7
	for <lists+linux-aspeed@lfdr.de>; Fri, 21 Jun 2019 21:16:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=open.sudheer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jn4Tk5lG"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Vbj72nppzDqdh
 for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Jun 2019 21:16:11 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id i2so2854159plt.1
 for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Jun 2019 04:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VTdFcOm7CRlTRM81w2wtydH4RXmRokL4phZ/JGHnN6s=;
 b=Jn4Tk5lGNQj1IWGHAbsqZk1saP02PZQK0W27XBlH7+C+MA+xacGU1p9LiEyzqji5iU
 VxWJIUs9bcWrspUtuQFBnGhPFW6dX6g34TENxF263nZKSubHseIXKkRiViZG3lyu9onw
 h+8XADj/kTLDd+LDqtwC8Os7YwfgoG+A6dsUD7wWsKnPNntiMzgJ4ayl9NB8RLZS1uJu
 cUiTJ4esjnkQVt1G+LeNB6NeMjoAuisJxRxGlXmm8m3On5DsNDBIboVDq5/Uk17Q50U7
 S6O2JHFzAKANr6HADyr683BLgFpWaxp9yN4GFcNUNQbQD/FoBjxR72oLn7/8AuZCGH3N
 BIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VTdFcOm7CRlTRM81w2wtydH4RXmRokL4phZ/JGHnN6s=;
 b=VHl44Ig20irNsNA8Fl3pnNak9YlFxyf1NTp8c8fbZfaDSuBjdsojVR/Aw/UCBBqY/L
 Dzb8Uo/H6Aa3ZLHNSWdJbIk3ckTpvvxvBoD/l5yQ67EOVeK5uCOiStuLutHqGbDlBuAF
 AhSHnUTWcWaeR36osd9NOhtwfwiK0hvJFwsa8/70NsGYGTCcF5mDis1/atAowyIogh+Q
 rEGm+Qca7A5lKt8V+LId9FgxrKmCg1KaAYh1uScZbnsEEig4Hj59fpa/UyxSoNSEPkyD
 Y47AwBxg9fYQ5Jrln0PT472PdFjQLlApPLhs0QFtE+XCHabpX2JtzqGHwdcTs4CoMjbP
 6jsw==
X-Gm-Message-State: APjAAAVxNa+tVPXn6YOBltTRzph0Zn74IFabBi8xLEXD6YlGvYBF2eC8
 g4rkeBbDw6Y22bkZ3NNq2Ns=
X-Google-Smtp-Source: APXvYqx3Ym+DsSadzqC71uLQatiJFRtm6FLzNbco5rONESCMD0bzwqP6ShU8n5RtmTuvQPnjXSIsxQ==
X-Received: by 2002:a17:902:d20f:: with SMTP id
 t15mr61025775ply.11.1561115768738; 
 Fri, 21 Jun 2019 04:16:08 -0700 (PDT)
Received: from Pilot130.192.168.0.22 (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.googlemail.com with ESMTPSA id w4sm2405737pfw.97.2019.06.21.04.16.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 21 Jun 2019 04:16:08 -0700 (PDT)
From: "sudheer.v" <open.sudheer@gmail.com>
To: gregkh@linuxfoundation.org, jslaby@suse.com, joel@jms.id.au,
 andrew@aj.id.au, benh@kernel.crashing.org, robh+dt@kernel.org,
 mark.rutland@arm.com, shivahshankar.shankarnarayanrao@aspeedtech.com,
 shivahshankar@gmail.com, sudheer.veliseti@aspeedtech.com
Subject: [patch 2/5] build configuration for AST2500 DMA UART driver
Date: Fri, 21 Jun 2019 16:47:32 +0530
Message-Id: <1561115855-4186-3-git-send-email-open.sudheer@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1561115855-4186-1-git-send-email-open.sudheer@gmail.com>
References: <1561115855-4186-1-git-send-email-open.sudheer@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 sudheer veliseti <sudheer.open@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: sudheer veliseti <sudheer.open@gmail.com>

Signed-off-by: sudheer veliseti <sudheer.open@gmail.com>
---
 drivers/tty/serial/8250/Kconfig  | 35 +++++++++++++++++++++++++++++++-
 drivers/tty/serial/8250/Makefile |  1 +
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
index 15c2c5463835..c793466a1c47 100644
--- a/drivers/tty/serial/8250/Kconfig
+++ b/drivers/tty/serial/8250/Kconfig
@@ -45,7 +45,7 @@ config SERIAL_8250_DEPRECATED_OPTIONS
 	  keep the 8250_core.* options around until they revert the changes
 	  they already did.
 
-	  If 8250 is built as a module, this adds 8250_core alias instead. 
+	  If 8250 is built as a module, this adds 8250_core alias instead.
 
 	  If you did not notice yet and/or you have userspace from pre-3.7, it
 	  is safe (and recommended) to say N here.
@@ -189,6 +189,39 @@ config SERIAL_8250_RUNTIME_UARTS
 	  with the module parameter "nr_uarts", or boot-time parameter
 	  8250.nr_uarts
 
+config  AST_SERIAL_DMA_UART
+        tristate "AST UART driver with DMA"
+        select SERIAL_CORE
+        help
+          UART driver with DMA support for Aspeed BMC AST25XX.
+          this driver supports UARTs in AST2500,AST2600. It uses
+          DMA channel of DMA engines present in these chips.
+          since this dma engine is used only by UARTs it is not
+          added as a separate DMA driver instead added as a layer
+          within UART driver.
+
+
+config AST_NR_DMA_UARTS
+        int "Maximum number of uart dma serial ports"
+        depends on AST_SERIAL_DMA_UART
+        default "4"
+        help
+          Set this to the number of serial ports you want the driver
+          to support.  This includes any ports discovered via ACPI or
+          PCI enumeration and any ports that may be added at run-time
+          via hot-plug, or any ISA multi-port serial cards.
+
+config AST_RUNTIME_DMA_UARTS
+        int "Number of uart dma serial ports to register at runtime"
+        depends on AST_SERIAL_DMA_UART
+        range 0 AST_NR_DMA_UARTS
+        default "4"
+        help
+          Set this to the maximum number of serial ports you want
+          the kernel to register at boot time.  This can be overridden
+          with the module parameter "nr_uarts", or boot-time parameter
+          8250.nr_uarts
+
 config SERIAL_8250_EXTENDED
 	bool "Extended 8250/16550 serial driver options"
 	depends on SERIAL_8250
diff --git a/drivers/tty/serial/8250/Makefile b/drivers/tty/serial/8250/Makefile
index 18751bc63a84..54d40e5c6e2a 100644
--- a/drivers/tty/serial/8250/Makefile
+++ b/drivers/tty/serial/8250/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_SERIAL_8250_LPSS)		+= 8250_lpss.o
 obj-$(CONFIG_SERIAL_8250_MID)		+= 8250_mid.o
 obj-$(CONFIG_SERIAL_8250_MOXA)		+= 8250_moxa.o
 obj-$(CONFIG_SERIAL_8250_PXA)		+= 8250_pxa.o
+obj-$(CONFIG_AST_SERIAL_DMA_UART)	+= 8250_ast2500_uart_dma.o
 obj-$(CONFIG_SERIAL_OF_PLATFORM)	+= 8250_of.o
 
 CFLAGS_8250_ingenic.o += -I$(srctree)/scripts/dtc/libfdt
-- 
2.17.1

