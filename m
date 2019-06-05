Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC9835C9D
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2019 14:22:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JnxQ00RqzDqd2
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2019 22:22:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=open.sudheer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="t71JZ9F5"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JnxH6X0ZzDqXq
 for <linux-aspeed@lists.ozlabs.org>; Wed,  5 Jun 2019 22:22:43 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id bh12so3553070plb.4
 for <linux-aspeed@lists.ozlabs.org>; Wed, 05 Jun 2019 05:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=h7Wqs4RLm0aox802Dc4SmD3OrJyMD+UrUqdzdFWaGn0=;
 b=t71JZ9F5bbwF+dqf+ccMRhz2p1H7LlFOIJKP9FfBJWAQxeRe7BrxevdOIi7K17v2au
 wmZ9A/bJi1k5jIVKzvjt0/IxfYclJuKbFbaN7wM0AIgr0G8n1To/PfSOXP5iNgm5TTmG
 m6XYSIi/qYeyvK5Tb7lKi3hGP8acGO4vvG544FWdD9wb73Bza6GdLOC3aMm4WNK8QZMa
 PQezM2jWnaX4PtwMqobgNRd24ps2i7I+biTiHwFuuYeoRPcKPGbfhsdmUzHqB+F5BQa2
 kIbWrb6yrE0z0fLKZrABFQGT9NwVQ4mPnUw9BSXnroD8Y+GCnU5xBMnmco1lR4yy5/+c
 v8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=h7Wqs4RLm0aox802Dc4SmD3OrJyMD+UrUqdzdFWaGn0=;
 b=F4AqGBQfE+4KiKbpr/xUf+I12rghzoe3jzsjfdNzX8aAapvD+eDYr4TUjofxJ/F1Uw
 OiY/ophrWauVuL+BhE9DCpFxpLIQ+t4SflniMp/ywitCLfee644J7N1kWXg9xdNVgUxG
 QHcdEiSZjvGQ0vUD1Nx86aD/+Y7u3I6nyk7wKX13ZEVee7OOg1HzJj48e/5Z7SyH93+u
 f7U1pdAat6XeNEvTa/fjJmyH1A1JR0txnj01y5x8n5EaUatuuqdRwAMe/GRTFW5+RmqY
 IIskdSMrnEEipodRfPRzTn+c8F7ym+edTmW2Kv8TEP7P5sXnalhS3r7ud9wHFIOfaTR2
 QQ4A==
X-Gm-Message-State: APjAAAWEjJwNftAut3trUGps0ZIstuG0XbCw4+k8JYN0L+dnMkS+hivk
 swTAbZgzTnCrD2RyKi+8Dcg=
X-Google-Smtp-Source: APXvYqznAoC5mH04itOtkT9+dnHps/OKKuip/dZHjMUEmZmPQI5T1LsM9TbBg5aR0ENoJ55ZmCiJdQ==
X-Received: by 2002:a17:902:290b:: with SMTP id
 g11mr42540866plb.26.1559737361692; 
 Wed, 05 Jun 2019 05:22:41 -0700 (PDT)
Received: from Pilot130.192.168.0.22 (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.googlemail.com with ESMTPSA id q22sm3322094pff.63.2019.06.05.05.22.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 05 Jun 2019 05:22:41 -0700 (PDT)
From: "sudheer.v" <open.sudheer@gmail.com>
To: gregkh@linuxfoundation.org, mchehab+samsung@kernel.org, jslaby@suse.com,
 joel@jms.id.au, andrew@aj.id.au, benh@kernel.crashing.org,
 robh+dt@kernel.org, mark.rutland@arm.com,
 shivahshankar.shankarnarayanrao@aspeedtech.com,
 sudheer.veliseti@aspeedtech.com
Subject: [patch 3/5] DT nodes for AST2500 DMA UART driver
Date: Wed,  5 Jun 2019 17:53:13 +0530
Message-Id: <1559737395-28542-4-git-send-email-open.sudheer@gmail.com>
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

