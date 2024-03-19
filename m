Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB1C957977
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:57:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqJt0MWVz3dLW
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:57:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cB4DJP8s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=manojkiran.eda@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzRRJ1pLrz3dX5;
	Tue, 19 Mar 2024 20:35:40 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1e0025ef1efso16747805ad.1;
        Tue, 19 Mar 2024 02:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710840937; x=1711445737; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8lLJjV9sz++A3S70yTL0kgzPdOoYGF0BKRxiCCU5iY=;
        b=cB4DJP8s/qO7x+Uyy7e8OzQfkeUHR5IqEUX8N0UX8fZNFZfOGT1HMV2XE2vMkmmL1Q
         ZaktUdjSlOnwfNlNl2Xbj2YrxvLUClQ3pi5lcjwG2RQ5fUKsweRX9mB4c+e2LIpBFBXh
         MhWnx82DDkPCAbGlelToxhIAjiYGycPc1jGMqu4WlAcEy2HZIPBuNSfzFmglHaDaOZm8
         83ukQtxwP3ZaN49TKsLVrUYdUdtxwbNxfy9Xm9QNW6RrG0mjK2dUNctsADuXWBX45E0i
         05QFmZGFerGsZrgKEwNJZVkoLR2zieFo4MLP7YQOKL3nzltNLWGo7naMGCwwxhuns5Qs
         u+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710840937; x=1711445737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8lLJjV9sz++A3S70yTL0kgzPdOoYGF0BKRxiCCU5iY=;
        b=IJWIDj+6ppNapVQtyyglEdhSiikBMN5PVQXktpN45808smBnFa1VHkWIJSPyFcBBPS
         53T/dnahOYzxVIgwCFI2OcWS9Zv4OYPZjXkFeNwxYqIH+GxmVNpms5qvPAw8s/zmoFYZ
         YJMjXZ/2gTbUxaEZOnlPnkkeBJ8ybVDnsbn6kgGmF4lcoJwOvkArwdVxWK7iBXE6+olQ
         YaDuOU4cb0W+gdmseclpn8+y3vfSK59y+LGQKMKZySH1MYwi36NgSBTR8CtVxt6IGeIQ
         6P6/I4v0txwNVlTk1B988+JsrTvFU2n3AxvjnzlZ7emyU0zL7WZnsrhex/Hx2gODHjhd
         am5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWv1Kj8wi0b+rZoGps89G203UZswlAgV/aFNoY0pykFUrtjqPWiIkYIdO0VQ+/7swCbPCcHfJmxnm37C3lC0X6EEn/3l7lzGQnJRxQTVdqVaYWsR53S+UMUKpUo/e+Wwb4nyKN0dLhT
X-Gm-Message-State: AOJu0Yzxqw9lcYMFmLxVwyr4gDU+AJXTSWPMS7p3GJp1p90nD3p5brro
	d7uZYhY3jQQceBtK0YtCTOUO9SH2lGtlxb3h1MWoNrgP53IbfnSp
X-Google-Smtp-Source: AGHT+IGMXcgzPbiRbAaZnXiJWR2s96AphzV/ePKBVZUQDbytucyVA3PArFmkTCYWRUbf042LO6gbGA==
X-Received: by 2002:a17:902:cecc:b0:1dd:8bc5:afe3 with SMTP id d12-20020a170902cecc00b001dd8bc5afe3mr18719900plg.1.1710840937439;
        Tue, 19 Mar 2024 02:35:37 -0700 (PDT)
Received: from localhost.localdomain ([129.41.58.3])
        by smtp.gmail.com with ESMTPSA id n5-20020a170903110500b001ddc0bc5934sm10942432plh.249.2024.03.19.02.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 02:35:37 -0700 (PDT)
From: Manojkiran Eda <manojkiran.eda@gmail.com>
To: patrick.rudolph@9elements.com,
	chiawei_wang@aspeedtech.com,
	ryan_chen@aspeedtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2 3/4] ARM: dts: aspeed: Add eSPI node
Date: Tue, 19 Mar 2024 15:04:04 +0530
Message-Id: <20240319093405.39833-4-manojkiran.eda@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240319093405.39833-1-manojkiran.eda@gmail.com>
References: <20240319093405.39833-1-manojkiran.eda@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: conor+dt@kernel.org, vigneshr@ti.com, richard@nod.at, openbmc@lists.ozlabs.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, miquel.raynal@bootlin.com, jk@codeconstruct.com.au, andrew@codeconstruct.com.au, manojkiran.eda@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This commit adds eSPI to the device tree for aspeed 5/6th
generation SoCs.

Signed-off-by: Manojkiran Eda <manojkiran.eda@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi | 19 +++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 20 ++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
index 04f98d1dbb97..eaf7d82b6f46 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
@@ -343,6 +343,25 @@ sdhci1: sdhci@200 {
 					status = "disabled";
 				};
 			};
+			espi: espi@1e6ee000 {
+				compatible = "aspeed,ast2500-espi", "simple-mfd", "syscon";
+				reg = <0x1e6ee000 0x1000>;
+
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x1e6ee000 0x1000>;
+
+				espi_ctrl: espi-ctrl@0 {
+					compatible = "aspeed,ast2500-espi-ctrl";
+					reg = <0x0 0x800>,<0x0 0x4000000>;
+					reg-names = "espi_ctrl","espi_flash";
+					interrupts = <23>;
+					clocks = <&syscon ASPEED_CLK_GATE_ESPICLK>;
+					status = "disabled";
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_espi_default>;
+				};
+			};
 
 			gpio: gpio@1e780000 {
 				#gpio-cells = <2>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index c4d1faade8be..094e14442101 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -454,6 +454,26 @@ video: video@1e700000 {
 				status = "disabled";
 			};
 
+			espi: espi@1e6ee000 {
+				compatible = "aspeed,ast2500-espi", "simple-mfd", "syscon";
+				reg = <0x1e6ee000 0x1000>;
+
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x1e6ee000 0x1000>;
+
+				espi_ctrl: espi-ctrl@0 {
+					compatible = "aspeed,ast2500-espi-ctrl";
+					reg = <0x0 0x800>,<0x0 0x4000000>;
+					reg-names = "espi_ctrl","espi_flash";
+					interrupts = <23>;
+					clocks = <&syscon ASPEED_CLK_GATE_ESPICLK>;
+					status = "disabled";
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_espi_default>;
+				};
+			};
+
 			gpio0: gpio@1e780000 {
 				#gpio-cells = <2>;
 				gpio-controller;
-- 
2.40.1

