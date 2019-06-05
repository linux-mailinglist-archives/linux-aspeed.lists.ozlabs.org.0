Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F049D35C99
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2019 14:22:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JnxJ1RtdzDqT6
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2019 22:22:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=open.sudheer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MyVhaRsQ"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JnxC2t3GzDqNP
 for <linux-aspeed@lists.ozlabs.org>; Wed,  5 Jun 2019 22:22:39 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id h17so12328273pgv.0
 for <linux-aspeed@lists.ozlabs.org>; Wed, 05 Jun 2019 05:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XvD01gwGwPNuRPEhXmAmu4eDP7JeVIjlGNk8Nfd1TVU=;
 b=MyVhaRsQfmeV0VJna801iFQDl6WPANoMVnR9955VixVVj/TS72OIqr+9CxTQnv5Z2r
 bY/pHzQ0OSdSy4TLkWT5ns9BOwfmo9nBB10bHjge4DqGCAEg13oMu1W5MQyb+/ZZ4anu
 w448lLZ9+EBtKQtJsbdT7r+yuPHgkxXGSE/xJYj6PAPv59BpZmtn8HDH43LwLaLauFXp
 75/iSq81hjWhYECyf/gvfjxrWOHiIu64ZuF6BHddPPK3Wqmd2PJk5HLbt00gBlTXOgBB
 Ae9AU6xw4Hzsc2i/v027AEM5hSnX8xz/ww8hplc2mGucvM3woWSxaB5DXsHhojhotIdQ
 DBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XvD01gwGwPNuRPEhXmAmu4eDP7JeVIjlGNk8Nfd1TVU=;
 b=teElifzhm58kONXhMdvSXIWifTMTLO08jvrslxFnjmUu6z69PxAlK8Mob8YI9TOwH2
 3KKVNM1s8FrVx8fjOZvB967bNTXNsUvFsbGmlvK14C4r1rXnxAOGKnJBqXM43GYDGMsb
 Vx7bnTrFb0sAx0UOGrMCJtlk4ZiAyZrdmszp5yLtgPZL+BjkE2uB7zj7nRVw27lI7g3B
 Oqh+Io5pUe+Zmfy9DTKFxbLfFOu5OkT5e/mncStVqF3fDvDiocwh1roHJ3v0w7G3kIn2
 Yx1cJhm2GOTrBdjhwFlChfpOcPlk+kLTaYLj2nZSJjiZm7XbYypb22c9JJgoRYTaSOEr
 SpjA==
X-Gm-Message-State: APjAAAVFrIJ64o1uuB4FNMzVO9Fr5rQeIMeAwp7wIqe528x4cG/ohKbs
 tg5+3GGJL+KTxs385LH6zLI=
X-Google-Smtp-Source: APXvYqzHCuU7Z6N3vPTHx/riiLS2gEmWEYSbb+cJlSKkH+OC/ineeAYzJs1YUjLCINDbYB1cLpZOjA==
X-Received: by 2002:a63:f257:: with SMTP id d23mr3999590pgk.305.1559737356026; 
 Wed, 05 Jun 2019 05:22:36 -0700 (PDT)
Received: from Pilot130.192.168.0.22 (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.googlemail.com with ESMTPSA id q22sm3322094pff.63.2019.06.05.05.22.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 05 Jun 2019 05:22:35 -0700 (PDT)
From: "sudheer.v" <open.sudheer@gmail.com>
To: gregkh@linuxfoundation.org, mchehab+samsung@kernel.org, jslaby@suse.com,
 joel@jms.id.au, andrew@aj.id.au, benh@kernel.crashing.org,
 robh+dt@kernel.org, mark.rutland@arm.com,
 shivahshankar.shankarnarayanrao@aspeedtech.com,
 sudheer.veliseti@aspeedtech.com
Subject: [patch 2/5] build configuration for AST2500 DMA UART driver
Date: Wed,  5 Jun 2019 17:53:12 +0530
Message-Id: <1559737395-28542-3-git-send-email-open.sudheer@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559737395-28542-1-git-send-email-open.sudheer@gmail.com>
References: <1559737395-28542-1-git-send-email-open.sudheer@gmail.com>
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
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 sudheer Kumar veliseti <sudheer.open@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: sudheer Kumar veliseti <sudheer.open@gmail.com>

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

