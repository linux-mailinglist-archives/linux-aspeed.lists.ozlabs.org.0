Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 946314E6ED
	for <lists+linux-aspeed@lfdr.de>; Fri, 21 Jun 2019 13:16:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VbjW06Q7zDqd7
	for <lists+linux-aspeed@lfdr.de>; Fri, 21 Jun 2019 21:16:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=open.sudheer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qP2XjrYf"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VbjF6GN4zDqdZ
 for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Jun 2019 21:16:17 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id f21so3232878pgi.3
 for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Jun 2019 04:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vwabYDjGbQrLkZt11xJPWZePoxPgRcXGMpjTzWYuVms=;
 b=qP2XjrYfPcIg6m90nvxE5mv1tO7LwZAfjv5T3Y9DVlvVbv/w7UNTw7OsAi9BVVj9is
 wU6xjmi5UFjq4COdkQ8DH80fvsE2LOYSFNfgGNzwW/RpLVbv/4L2uf4aEPAwcIrUZetr
 xL0i9Y3RmxUtrHk8MMfMRxFeSHP0Sd0UB04TYc2afuSMYZXtK+9ZCELqaJNfeIzVAIYX
 QJk8kyd8D/QoxfPksIHwD/ZC6UuqFqK6oo9F5rPSxLkQjQuAr1OK64A0H86ndiYch+8y
 wu9kcon4l/zBD5AXgOKXemlvOThtm3FMapOS75cBDVljewUlaPVqiAM9Em+oM0UYQTTD
 jhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vwabYDjGbQrLkZt11xJPWZePoxPgRcXGMpjTzWYuVms=;
 b=YURRnKSaYHS/8+eRy7cpNC/KT14BwYetGAba8ANpwKZDdUHlxnpUJBG/Ez1LoTyQ9v
 Lrr4MqSabElC+VU407Wizu0UqXYFaNxnuVe/ma5UcuIXF/10EzVsL5Y1oelogbjRXFJn
 9CaZHg/zc5vSnAeXGeHzJ//QHsklAy3Ll4Pn3bHnZlUubCURQGYuJaNSDY7Rvm9ag841
 /mE6APfw6r09tFYvlb31JI4YKKfDI8hufKDeSqrWCG4LwuzsPszytkdMKpD1RiPJgb7s
 jCLv892iGddJHv+5SjPBLYt/+akzV1NFHPhL7vo/96mUymkMNaaDLdh9C2qp9i01+MRY
 h8Sg==
X-Gm-Message-State: APjAAAUt/8ZZcJ/gkv+x3LxPAP1lxTXfBtSz64LPtkTHwqXnbWWvFubx
 osqfXobCM7do1nRNZDK2ENo=
X-Google-Smtp-Source: APXvYqxI9bXXVbbvvPMG+TvLTGibLafT4/isMhPHhu2dF14XjhC+5TV/AQ/aefXFfsPHZCVrOy0Yvg==
X-Received: by 2002:a17:90a:af8b:: with SMTP id
 w11mr5932415pjq.135.1561115775282; 
 Fri, 21 Jun 2019 04:16:15 -0700 (PDT)
Received: from Pilot130.192.168.0.22 (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.googlemail.com with ESMTPSA id w4sm2405737pfw.97.2019.06.21.04.16.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 21 Jun 2019 04:16:14 -0700 (PDT)
From: "sudheer.v" <open.sudheer@gmail.com>
To: gregkh@linuxfoundation.org, jslaby@suse.com, joel@jms.id.au,
 andrew@aj.id.au, benh@kernel.crashing.org, robh+dt@kernel.org,
 mark.rutland@arm.com, shivahshankar.shankarnarayanrao@aspeedtech.com,
 shivahshankar@gmail.com, sudheer.veliseti@aspeedtech.com
Subject: [patch 3/5] DT nodes for AST2500 DMA UART driver
Date: Fri, 21 Jun 2019 16:47:33 +0530
Message-Id: <1561115855-4186-4-git-send-email-open.sudheer@gmail.com>
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

DT node for DMA controller(ast_uart_sdma) doesn't bind to any DMA controller driver.
This is because Software for DMA controller is not based on DMA framework,but is dedicated
and serves only UARTs in AST2500. ast_uart_sdma node is searched by compatible string in the 
driver software.basic use of this node is to provide register base address of DMA controller and DMA irq number(<50>).
IRQ of DMA controller is of crucial importance, which does RX and TX of UART data. 

uart nodes dma_uart1,2...etc binds to the platform driver.
irq numbers <9>,<32>,<33>,<34> in dma_uart nodes install ISRs which are of not much interest in uart data TX/RX .


Signed-off-by: sudheer veliseti <sudheer.open@gmail.com>
---
 arch/arm/boot/dts/aspeed-ast2500-evb.dts | 21 +++++++
 arch/arm/boot/dts/aspeed-g5.dtsi         | 71 ++++++++++++++++++++++--
 2 files changed, 88 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index 5dbb33c10c4f..4da09fbe94df 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -64,6 +64,27 @@
 	status = "okay";
 };
 
+&ast_uart_sdma {
+	status = "okay";
+};
+
+&dma_uart1 {
+	status = "okay";
+};
+
+&dma_uart2 {
+	status = "okay";
+};
+
+&dma_uart3 {
+	status = "okay";
+};
+
+&dma_uart4 {
+	status = "okay";
+};
+
+
 &mac0 {
 	status = "okay";
 
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 674746513031..fb7b3ed463de 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -23,10 +23,10 @@
 		i2c11 = &i2c11;
 		i2c12 = &i2c12;
 		i2c13 = &i2c13;
-		serial0 = &uart1;
-		serial1 = &uart2;
-		serial2 = &uart3;
-		serial3 = &uart4;
+		serial0 = &dma_uart1;
+		serial1 = &dma_uart2;
+		serial2 = &dma_uart3;
+		serial3 = &dma_uart4;
 		serial4 = &uart5;
 		serial5 = &vuart;
 		peci0 = &peci0;
@@ -497,6 +497,69 @@
 				status = "disabled";
 			};
 
+			ast_uart_sdma: uart_sdma@1e79e000 {
+				compatible = "aspeed,ast-uart-sdma";
+				reg = <0x1e79e000 0x400>;
+				interrupts = <50>;
+				status = "disabled";
+			};
+
+			dma_uart1: dma_uart1@1e783000{
+				compatible = "aspeed,ast-sdma-uart";
+				reg = <0x1e783000 0x1000>;
+				reg-shift = <2>;
+				interrupts = <9>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART1CLK>;
+				dma-channel = <0>;
+				no-loopback-test;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_txd1_default
+							 &pinctrl_rxd1_default>;
+				status = "disabled";
+			};
+
+			dma_uart2: dma_uart2@1e78d000{
+				compatible = "aspeed,ast-sdma-uart";
+				reg = <0x1e78d000 0x1000>;
+				reg-shift = <2>;
+				interrupts = <32>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART2CLK>;
+				dma-channel = <1>;
+				no-loopback-test;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_txd2_default
+							 &pinctrl_rxd2_default>;
+				status = "disabled";
+			};
+
+			dma_uart3: dma_uart3@1e78e000{
+				compatible = "aspeed,ast-sdma-uart";
+				reg = <0x1e78e000 0x1000>;
+				reg-shift = <2>;
+				interrupts = <33>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART3CLK>;
+				dma-channel = <2>;
+				no-loopback-test;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_txd3_default
+							 &pinctrl_rxd3_default>;
+				status = "disabled";
+			};
+
+			dma_uart4: dma_uart4@1e78f000{
+				compatible = "aspeed,ast-sdma-uart";
+				reg = <0x1e78f000 0x1000>;
+				reg-shift = <2>;
+				interrupts = <34>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART4CLK>;
+				dma-channel = <3>;
+				no-loopback-test;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_txd4_default
+							 &pinctrl_rxd4_default>;
+				status = "disabled";
+			};
+
 			i2c: bus@1e78a000 {
 				compatible = "simple-bus";
 				#address-cells = <1>;
-- 
2.17.1

