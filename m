Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B15AE76764
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 15:26:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45w8wr2g3yzDq9Q
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 23:26:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=open.sudheer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ABSnbEq7"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45w8wH2L5DzDqQG
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2019 23:25:35 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id l21so24795414pgm.3
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2019 06:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Y/+vYtsCysqhzTsUB/MaZnRyWhMQc4pCqw65yISuFeg=;
 b=ABSnbEq7gwAOQcJS4x5BPjR9TjiZ/KtpISxsQmuCXZ9MoBHN4Pk/qbasRPH/bovbz7
 /gabE+SpXbFSM52BcfmH6FOW+cYZpUHrFAGFVh8fizPuqOvg6gscdBzzH4zV6Ra9gFUx
 FS3FcUiD56vmqIGZNdiS1sn2xqSalRXnaG1bbbcMUXctzETi9DMsSuwH8Wp0C5rR5amq
 8fvgvrVz8RmAJN+u3RtWSyqXPljlYlQt/kUcqWvyz48WGOiFZX/2A+4OmZzahiasGzN5
 S7WQQZgSnCHcIMakYAnWg8SjXgfdHZrXYLKUvxDMyhX9MIM4rmqzX4STqIu3Tn1DX5kX
 yhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Y/+vYtsCysqhzTsUB/MaZnRyWhMQc4pCqw65yISuFeg=;
 b=BKFQFCrFCflS6oMw1reYCNB5XtYcDq+SfhRQeXhccL7REZxAI0Z9+srfqWB+ZOJHaG
 KbxWMOB+AxKXrwIgUnxWYFpAGMo3HfUWlIIE0TlHBUlKxQ8Z7FvHo11p00VCl7Hdf/9g
 JD6d3Sp/g55ZHY5JQvP0mOEV4+fXx8dhO9IeKVwiAlWsIdgodPdkwBhKbliIXOshGe04
 VR8FE2yVBWYcHAWY6IB0hfVkJe6pe47TbJPHfnr4T03M03ttQhHgoFgavJc/5EiLbBI4
 GPel94wNu0lSsy1dtzpQfIq03znyV12BpfAdDdTWNtYwV5QZuLoPo07z3l41WQMH04wU
 VroQ==
X-Gm-Message-State: APjAAAXco8ePEesqrAKLEfQ6RJVgsFWcq+BkYfJe/v6m1pY1bEpCtT9N
 ITIQvXxOOQoxx1EgxAcqB7c=
X-Google-Smtp-Source: APXvYqyZxkac6LiJUmd4XgiaCjs6pQWpAXR97GUjfDJ6ofnoz0LFeonQ/46Uw+0sk31ucCSvExwYQw==
X-Received: by 2002:a63:1d2:: with SMTP id 201mr56974280pgb.307.1564147532616; 
 Fri, 26 Jul 2019 06:25:32 -0700 (PDT)
Received: from Pilot130.192.168.0.22 (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.googlemail.com with ESMTPSA id k36sm54544603pgl.42.2019.07.26.06.25.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 26 Jul 2019 06:25:32 -0700 (PDT)
From: "sudheer.v" <open.sudheer@gmail.com>
To: gregkh@linuxfoundation.org, jslaby@suse.com, joel@jms.id.au,
 andrew@aj.id.au, benh@kernel.crashing.org, robh+dt@kernel.org,
 mark.rutland@arm.com, shivahshankar.shankarnarayanrao@aspeedtech.com,
 sudheer.veliseti@aspeedtech.com
Subject: [patch v4 2/5] build configuration for AST2500 DMA UART driver
Date: Fri, 26 Jul 2019 18:57:17 +0530
Message-Id: <1564147640-30753-3-git-send-email-open.sudheer@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1564147640-30753-1-git-send-email-open.sudheer@gmail.com>
References: <1564147640-30753-1-git-send-email-open.sudheer@gmail.com>
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

build config for DMA based UART driver in AST2500.
Total Available  UARTs in AST2500 are 4

Signed-off-by: sudheer veliseti <sudheer.open@gmail.com>
---

Changes from v3->v4:
- config name changed to SERIAL_AST_DMA_UART  
- new config AST_UART_DMA_RX_INTERRUPT  introduced 
  for selectin between  DMA interrupt based RX vs timer based uart RX

Changes in v2->v3:
- change logs added

drivers/tty/serial/8250/Kconfig  | 43 ++++++++++++++++++++++++++++++++
 drivers/tty/serial/8250/Makefile |  1 +
 2 files changed, 44 insertions(+)

diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
index 15c2c5463835..7052ab0f4894 100644
--- a/drivers/tty/serial/8250/Kconfig
+++ b/drivers/tty/serial/8250/Kconfig
@@ -189,6 +189,49 @@ config SERIAL_8250_RUNTIME_UARTS
 	  with the module parameter "nr_uarts", or boot-time parameter
 	  8250.nr_uarts
 
+config  SERIAL_AST_DMA_UART
+        tristate "AST UART driver with DMA"
+        select SERIAL_CORE
+        help
+          UART driver with DMA support for Aspeed BMC AST25XX.
+          this driver supports UARTs in AST2500. It uses
+          DMA channel of DMA engines present in these chips.
+          since this dma engine is used only by UARTs it is not
+          added as a separate DMA driver instead added as a layer
+          within UART driver.
+
+config AST_UART_DMA_RX_INTERRUPT
+	bool "DMA interrupt of UART RX"
+	depends on SERIAL_AST_DMA_UART
+	default y
+	help
+	  This config  is Enabled by default,which means Rx part
+	  of UART is handled by DMA interrupt.
+	  if the version of chip AST2500 doesn't support
+	  DMA interrupt based RX,then Disable this option.Refer
+	  driver code to see how Rx is handled by timer,if Rx
+	  interrupt  is not available.
+
+
+config AST_NR_DMA_UARTS
+        int "Maximum number of uart dma serial ports"
+        depends on SERIAL_AST_DMA_UART
+        default "4"
+        help
+          Set this to the number of serial ports you want the driver
+          to support.  This includes any ports discovered via ACPI or
+          PCI enumeration and any ports that may be added at run-time
+          via hot-plug, or any ISA multi-port serial cards.
+
+config AST_RUNTIME_DMA_UARTS
+        int "Number of uart dma serial ports to register at runtime"
+        depends on SERIAL_AST_DMA_UART
+        range 0 AST_NR_DMA_UARTS
+        default "4"
+        help
+          Set this to the maximum number of serial ports you want
+          the kernel to register at boot time.
+
 config SERIAL_8250_EXTENDED
 	bool "Extended 8250/16550 serial driver options"
 	depends on SERIAL_8250
diff --git a/drivers/tty/serial/8250/Makefile b/drivers/tty/serial/8250/Makefile
index 18751bc63a84..251f2e85efa1 100644
--- a/drivers/tty/serial/8250/Makefile
+++ b/drivers/tty/serial/8250/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_SERIAL_8250_LPSS)		+= 8250_lpss.o
 obj-$(CONFIG_SERIAL_8250_MID)		+= 8250_mid.o
 obj-$(CONFIG_SERIAL_8250_MOXA)		+= 8250_moxa.o
 obj-$(CONFIG_SERIAL_8250_PXA)		+= 8250_pxa.o
+obj-$(CONFIG_SERIAL_AST_DMA_UART)	+= 8250_ast2500_uart_dma.o
 obj-$(CONFIG_SERIAL_OF_PLATFORM)	+= 8250_of.o
 
 CFLAGS_8250_ingenic.o += -I$(srctree)/scripts/dtc/libfdt
-- 
2.17.1

