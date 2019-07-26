Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFCA76767
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 15:26:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45w8xF3TfCzDqQW
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 23:26:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=open.sudheer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EUDfHT3Y"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45w8wS2TMJzDq9Q
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2019 23:25:44 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id c3so1397967pfa.13
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2019 06:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XnwQtA++4ZLQs18Zi/kVWI3WT0kdxj4T2Lu+EaH+lNM=;
 b=EUDfHT3Y1h+g5qNNasOMRbGs4FROTTau5miuZF1wBpoiCwIxlfrvi6feHwz+MTe7yf
 zXyLaRMXduj9kqj1QWbGuzaDVllBTUprvYCfp7LUt39JcqNTTkBnpkZWkrTnCeBdPhOS
 9KmCcO/qmA/CS5V5zQ+qt5llyJYjaEgCjnzsEeZNtUeefrPFIBZjZdQDFqFvjBHsrmns
 GM6kH6J01Gd4FfX/YwyMyD8R5EWeBgLObSCniqX5monH6I6g6I96uhRds/gg+2WpyNsm
 7P8K68ue70jt8NvnT+rF58SwQX4OQ/fPbJlL095xFhDLLhzR+zV2vYVnb6pzgSHcpDvi
 DBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XnwQtA++4ZLQs18Zi/kVWI3WT0kdxj4T2Lu+EaH+lNM=;
 b=JSq3InqAwyPxTKhT/nIocUyHu29XkAzW/SaKOth6UxANEhEfZfM5qaZuqNxMzdTDE5
 WvDUz9vweAb2zZjBseitoBv0x7cJ4Y2+mEKVwygK6XrcAxTIWuv0iXrATMl8aI619V9V
 MWBzqtXpVf4hNUL8hajqI8FRj/imOpV53fK0b5/t+FRDLkfwflBua0nIpFAh5/pizkDC
 Fj2iKTXoqjaAe5zbpwpDcjIy0aN81SXvxyyhfjJuVvndGzRX/TJXTg35+ZUrfsNRXtcn
 QEBZoHGzCQTvCHCFZ9A24Uy7oCpNkRyVWRJAW9Fl2BsGcgsCkdg0wKoTIp3DOtFL7csa
 5i8Q==
X-Gm-Message-State: APjAAAWTrgFjN3hHR6gTKO2fiTd+JfqrSab8QunsCIqxb/bqYfBfrlAN
 IhvsTjJSRn7Ye2e3Im3bDsw=
X-Google-Smtp-Source: APXvYqzTWZbkX606qEM14eI+153drc1gKBISCMCaxjG+FvU99HV0t2kzhGHkSgxYnarXYG3KfRm3dw==
X-Received: by 2002:a62:1ac8:: with SMTP id
 a191mr22270899pfa.164.1564147541492; 
 Fri, 26 Jul 2019 06:25:41 -0700 (PDT)
Received: from Pilot130.192.168.0.22 (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.googlemail.com with ESMTPSA id k36sm54544603pgl.42.2019.07.26.06.25.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 26 Jul 2019 06:25:40 -0700 (PDT)
From: "sudheer.v" <open.sudheer@gmail.com>
To: gregkh@linuxfoundation.org, jslaby@suse.com, joel@jms.id.au,
 andrew@aj.id.au, benh@kernel.crashing.org, robh+dt@kernel.org,
 mark.rutland@arm.com, shivahshankar.shankarnarayanrao@aspeedtech.com,
 sudheer.veliseti@aspeedtech.com
Subject: [patch v4 4/5] defconfig and MAINTAINERS updated for AST2500 DMA UART
 driver
Date: Fri, 26 Jul 2019 18:57:19 +0530
Message-Id: <1564147640-30753-5-git-send-email-open.sudheer@gmail.com>
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

defconfig changes to add DMA based UART in AST2500
Maintainers File updated.

Signed-off-by: sudheer veliseti <sudheer.open@gmail.com>
---

Changes in v4:
- config name changed to CONFIG_SERIAL_AST_DMA_UART as per convention
Changes in v3:
- Added changes logs 

MAINTAINERS                          | 12 ++++++++++++
 arch/arm/configs/aspeed_g5_defconfig |  1 +
 2 files changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 997e27ab492f..d814a52ecf99 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1347,6 +1347,18 @@ F:	drivers/crypto/axis
 F:	drivers/pinctrl/pinctrl-artpec*
 F:	Documentation/devicetree/bindings/pinctrl/axis,artpec6-pinctrl.txt
 
+ARM/ASPEED DMA UART DRIVER
+M:	sudheer v <sudheer.open@gmail.com>
+R:	Joel Stanley <joel@jms.id.au>
+R:	Andrew Jeffery <andrew@aj.id.au>
+R:	Vinod Koul <vkoul@kernel.org>
+L:	dmaengine@vger.kernel.org
+L:	openbmc@lists.ozlabs.org
+L:	linux-aspeed@lists.ozlabs.org
+S:	Maintained
+F:	drivers/tty/serial/8250/8250_aspeed_uart_dma.c
+F:	Documentation/devicetree/bindings/serial/ast-sdma-uart.txt
+
 ARM/ASPEED I2C DRIVER
 M:	Brendan Higgins <brendanhiggins@google.com>
 R:	Benjamin Herrenschmidt <benh@kernel.crashing.org>
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 1849cbc161b4..fc17cc9ddc00 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -144,6 +144,7 @@ CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=6
 CONFIG_SERIAL_8250_RUNTIME_UARTS=6
+CONFIG_SERIAL_AST_DMA_UART=y
 CONFIG_SERIAL_8250_EXTENDED=y
 CONFIG_SERIAL_8250_ASPEED_VUART=y
 CONFIG_SERIAL_8250_SHARE_IRQ=y
-- 
2.17.1

