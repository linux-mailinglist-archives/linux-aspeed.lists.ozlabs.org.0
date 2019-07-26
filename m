Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D712676768
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 15:26:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45w8xM1ZbSzDqGv
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 23:26:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=open.sudheer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LoDzl5dV"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45w8wX4pMzzDqGv
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2019 23:25:48 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id w10so24805412pgj.7
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2019 06:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DCfqG2JMRKwxzIsSj479KFdZDqfmx3j+5mtM0thRZ58=;
 b=LoDzl5dV4EQI2pUj8qVRXOAIoTnhZqceQpnFZnYzGnjVxpbtUcLiRPGuN6wt1cfrk8
 9puIruzvHJiQfOZv5PZZd+FF2dgvSd71Ci1ZZsjg7m86JizzgmNPqKMYoXdTIvJXHsOq
 NwrVoe5f9PBdtRH6N66l5YJxfuFP/gD2F802dhFBTC1SiuwOy1MruAO0NLhYsCq4wZOf
 W0p7+pUa1PZq7pPtfk6RsgItcl4726Ceg/Hk1AB1UoURdYRIUBJi5U5lW32rWnPFVBmL
 ZLWuVXX3k3ADP/NhY8j8zdnTzj7neDsmjmOy8n4vuaEr5QmFHjVNvBHoTOFwObaHUPMG
 zgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DCfqG2JMRKwxzIsSj479KFdZDqfmx3j+5mtM0thRZ58=;
 b=SGmIoTkoRkuvd3yq2xvrvK+dUzOxF8yfHzVSCCyd1ODcmqA7gIFgVoEht4nROzYMH0
 8oMXXzrrZyiq+scAXnbsKQD56ERZnXet0n4SaP8o3tdhgau221Yn+T2BHyHa3acVTGSZ
 khVayvwzMZRUuPdqV82R47P1Mk8EW6vplgPqEBinBVeGFm8ZPB8QgAWQHU+xidMFEm/d
 qah8oAnxfig/T/BkEDXLy42tmMlSYqfGw8v7c/cNHKFj76REQ4XvzbryOw9aKT0cWDgM
 A8TW1GsFlbnUvhstR6TGUSVS47XPBgqAkoEtMkYd6hXJOGi66kkOm+VtQV0gUXf9Y9QO
 c7pw==
X-Gm-Message-State: APjAAAUgLx/pgcgiLv+742nAJg1OxZR65zbWHO5a4eHo2L/1H6inEcHR
 VoBX5JFGWRllfg2IGqaCNi0=
X-Google-Smtp-Source: APXvYqxJ0TvnmiWTXBEyq2/z1dvr4VEXVLgB/9ZQJw4kX1R9wOUtS6Lanafe6ZYS4kpvndxZEF77AQ==
X-Received: by 2002:a65:5b8e:: with SMTP id i14mr90112067pgr.188.1564147546371; 
 Fri, 26 Jul 2019 06:25:46 -0700 (PDT)
Received: from Pilot130.192.168.0.22 (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.googlemail.com with ESMTPSA id k36sm54544603pgl.42.2019.07.26.06.25.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 26 Jul 2019 06:25:45 -0700 (PDT)
From: "sudheer.v" <open.sudheer@gmail.com>
To: gregkh@linuxfoundation.org, jslaby@suse.com, joel@jms.id.au,
 andrew@aj.id.au, benh@kernel.crashing.org, robh+dt@kernel.org,
 mark.rutland@arm.com, shivahshankar.shankarnarayanrao@aspeedtech.com,
 sudheer.veliseti@aspeedtech.com
Subject: [patch v4 5/5] Documentation: DT bindings AST2500 DMA UART driver
Date: Fri, 26 Jul 2019 18:57:20 +0530
Message-Id: <1564147640-30753-6-git-send-email-open.sudheer@gmail.com>
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

documentation for Dt bindings for DMA based UARTs in AST2500

Signed-off-by: sudheer veliseti <sudheer.open@gmail.com>
---

Changes in v4:
-
Changes in v3:
- change logs added

.../bindings/serial/ast2500-dma-uart.txt      | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/ast2500-dma-uart.txt

diff --git a/Documentation/devicetree/bindings/serial/ast2500-dma-uart.txt b/Documentation/devicetree/bindings/serial/ast2500-dma-uart.txt
new file mode 100644
index 000000000000..6ebc60b51d4c
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/ast2500-dma-uart.txt
@@ -0,0 +1,43 @@
+DT Bindings DMA UART for AST25XX:
+
+node for DMA controller:
+                       ast_uart_sdma: uart_sdma@1e79e000 {
+                               compatible = "aspeed,ast-uart-sdma";
+                               reg = <0x1e79e000 0x400>;
+                               interrupts = <50>;
+                               status = "disabled";
+                       };
+this node  doesn't binds with any driver.
+DMA controller is handled as a separate SW layer,
+and is included in the same driver.
+This DMA controller node is included in DT
+just for Register and interrupt details
+
+
+
+node for DMA-UARTS :
+
+
+Required properties:
+
+- compatible: "aspeed,ast-sdma-uart"
+- reg: The base address of the UART register bank
+- interrupts: should contain interrupt specifier.
+- clocks: Clock driving the hardware;
+- pinctrl-0 : list of pinconfigurations
+- dma-channel: channel of DMA-controller which is used
+
+Example:
+
+	dma_uart1: dma_uart1@1e783000{
+        compatible = "aspeed,ast-sdma-uart";
+        reg = <0x1e783000 0x1000>;
+        reg-shift = <2>;
+        interrupts = <9>;
+        clocks = <&syscon ASPEED_CLK_GATE_UART1CLK>;
+        dma-channel = <0>;
+        no-loopback-test;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_txd1_default &pinctrl_rxd1_default>;
+        status = "disabled";
+        };
-- 
2.17.1

