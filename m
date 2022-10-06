Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E90C75FB0FB
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 Oct 2022 13:08:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmtM75Pdgz2xjr
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 Oct 2022 22:08:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=FUy+asYR;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=40.107.215.74; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=FUy+asYR;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2074.outbound.protection.outlook.com [40.107.215.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjhXh6Scnz30Dp
	for <linux-aspeed@lists.ozlabs.org>; Thu,  6 Oct 2022 17:36:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IN7fdsBbIcdMdsaWvJqRV0KWcCmHBTmS75hEcREDmJI6cXhPn3Om7o0nbs6dfE+IXuHaQV68KCogY65jGzMPMRl5w3e5BSTX3F4fjO3tv8N+OxZVNcrKkrNkXa3o40Dte0B3vhmhsoEO59/2+vKHFdUHzDs3qKWM2FcDPWdF3S2GMm/mcx5KIGvd4SlFwIOC0tF5bMdwkU9fqJyZtQ/+9p+nUOLZpil1QGA4teUr8a5o8aurHIioSavespjnPB9Jl61NfqqILX8jT65ZGqNC5zjFSdiH+l2Zf/kJATrdzMVm+jK8JQeb7nen2UjA2VrtDxhajYqmT3PUIUyi+ALPPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeVb21g4BfL59o2kwqj4FMp59AJyjr8MD+jhbcMkM/U=;
 b=SZl+yL7KvWt1BRWMCQQTRutXVw8eW3t7XDwP0yJKrALmlCnuKLWTPnSV+e5JnWK1G+Sxp/cAcNUKcEHZcI8KviUmWypQs+3vnUUjrM8LoDD+kUL4hpbZWbgzWPpvZzyE/tvFtwF0tn5grYdTqiJ9qQTGN+xN8eaJt3LLQqfMK4hdt3BdhgzMXR73LTEoRAW4ULu0fs5s//yOcpwlxSdGObGR8sQk9FZVsrg/1XEH3u501sNwqF+2ZX3NXGm/qSB1zgwyf5vkIH4vXllM3zG5ztXHWneCVT27hQitbom3pCje1hOodQs3itxdYlL+MPCehMTXnDRWrKa0Lto+f5Zgpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=linaro.or smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeVb21g4BfL59o2kwqj4FMp59AJyjr8MD+jhbcMkM/U=;
 b=FUy+asYRbTs3yER/cON8LPEOeceyPD8ciHJBNtGTv9wZ+vZPHPlNK6IOaS8x+NGVV8Pg/fNRfLtIgy9KPy1k1AHqNYgtaYl29gIbjXkKsFZSOiXauMC8D+NFKpTq/ZERLpS99fzkLrRdjIDbWUDe3O80XGo0oycK0hBngk04Dp6DaOPq6QToj0BY3MRelG0pL+62gKbeKwsoV0Jr4LXDx3Ww1MsiTsCQunJdHXLIF0uGRoF15bb3c4AfIHgVFo8YeBdX6Y/3DqQ9IoFC/L4P3XLzgziOSyHJtjX0bwy4GK6u7pnfl7HMP7gq+m2WvnX/wkz3t15NCvRpTMXEPsiG4A==
Received: from TY2PR01CA0003.jpnprd01.prod.outlook.com (2603:1096:404:a::15)
 by TY2PR04MB3997.apcprd04.prod.outlook.com (2603:1096:404:8004::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Thu, 6 Oct
 2022 06:35:45 +0000
Received: from TYZAPC01FT018.eop-APC01.prod.protection.outlook.com
 (2603:1096:404:a:cafe::4) by TY2PR01CA0003.outlook.office365.com
 (2603:1096:404:a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Thu, 6 Oct 2022 06:35:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 TYZAPC01FT018.mail.protection.outlook.com (10.118.152.93) with Microsoft SMTP
 Server id 15.20.5709.10 via Frontend Transport; Thu, 6 Oct 2022 06:35:44
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To: krzysztof.kozlowski@linaro.or
Subject: [PATCH v1 2/2] greatlakes: dts: Add Facebook greatlakes (AST2600) BMC
Date: Thu,  6 Oct 2022 14:35:25 +0800
Message-Id: <20221006063527.2007802-2-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221006063527.2007802-1-Delphine_CC_Chiu@Wiwynn.com>
References: <20221006063527.2007802-1-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZAPC01FT018:EE_|TY2PR04MB3997:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 96f69eb3-393b-4f34-bcc2-08daa764ff9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	jlJibwqZZd1e1brB7zypHyInSvfVXCoUSzLCK2BJHEwld78JT73thWY0O3EtT6RnqY70OPCrp84gX+qU6UOMvgfTVLCDHEHTtElVAqKe7FprI3BZNIYmQRdbEJ/oFy4B8T3VJ/2Yjz2/XHaXjB2/bop9g+Sy0aCTdD+dIdWyaUA3fYN4ai/LaS1vNcZ6E22J5ORt2Wn14wPq/8BEa+p+X4L9KkvKQoA+7+Ldy8OUJe+RNnXtuSGYauHbcR4kTmLgKg2nnaJsCAa5RmVC2YGdejgA3aN0Mzkjd4+76hZ741pqyLyW/vPkWf7tHcF5jtu2du2DKf7utNcQgUYkXl/9feVMlOhAQSPvgRHH+9HmJ+gqHOZ0ymz0jEDoeSI9NCxkOko7BXugsT265/v3YtyWfrATJlnP2GR559DkW9uvqY7TPfjGIgLyPoU/AhQs8HqsqwJsUm8yD0SkqZGQFys64E7JJy7xwYMmHsGjoXcDzPt6euXpYIycOJt0i4z91kyGcls6L1yajgEbgSA8c7W0tjejKrMCTfpO9Mrl3ZK52p74Ka1rh2ZVpJB+TFmRvpqlT4/y/jUY7i7/+kHmmfKitpr1ItdqvMjpNgUfsOXZwkvAzvDjblBGhTBfwFm9tc31TXhuf1k9vAbHvuGf6QD0rPzEvweR97U3QrIv/BA2v2Iwm3rmH7fLAJBdLf0r8CfNYjszHqYgxKLZ6Zr725epu3tFIDtWNn5DO1cp85j4lV+C39X+g+BtD//eja9thznQ
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230022)(6069001)(4636009)(346002)(136003)(376002)(39850400004)(396003)(47680400002)(451199015)(46966006)(36840700001)(36756003)(40480700001)(70206006)(70586007)(2906002)(6512007)(26005)(4326008)(41300700001)(8676002)(356005)(86362001)(5660300002)(8936002)(7416002)(82740400003)(81166007)(47076005)(316002)(36906005)(36736006)(36860700001)(54906003)(9316004)(336012)(82310400005)(6916009)(478600001)(6486002)(956004)(2616005)(1076003)(186003)(6666004)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 06:35:44.7662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f69eb3-393b-4f34-bcc2-08daa764ff9d
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	TYZAPC01FT018.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3997
X-Mailman-Approved-At: Tue, 11 Oct 2022 22:08:23 +1100
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Arnd Bergmann <arnd@arndb.de>, garnermic@fb.com, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add linux device tree entry related to
greatlakes specific devices connected to BMC SoC.

---
--- v1 - Add documentation of board compatible (bindings)
---    - Add board compatible
---    - Remove the bootargs
---    - Revise the DTS node name
---

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../dts/aspeed-bmc-facebook-greatlakes.dts    | 243 ++++++++++++++++++
 2 files changed, 244 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 05d8aef6e5d2..d9f417f2d7df 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1586,6 +1586,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-elbert.dtb \
 	aspeed-bmc-facebook-fuji.dtb \
 	aspeed-bmc-facebook-galaxy100.dtb \
+	aspeed-bmc-facebook-greatlakes.dtb \
 	aspeed-bmc-facebook-minipack.dtb \
 	aspeed-bmc-facebook-tiogapass.dtb \
 	aspeed-bmc-facebook-wedge40.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
new file mode 100644
index 000000000000..29c46d0e003e
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
@@ -0,0 +1,243 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2022 Facebook Inc.
+
+/dts-v1/;
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/leds/leds-pca955x.h>
+#include <dt-bindings/i2c/i2c.h>
+
+/ {
+	model = "Facebook Greatlakes BMC";
+	compatible = "facebook,greatlakes-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial4 = &uart5;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
+				<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+				<&adc1 0>, <&adc1 2>, <&adc1 3>, <&adc1 4>,
+				<&adc1 5>, <&adc1 6>;
+	};
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
+
+&uart4 {
+	status = "okay";
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&wdt1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst1_default>;
+	aspeed,reset-type = "soc";
+	aspeed,external-signal;
+	aspeed,ext-push-pull;
+	aspeed,ext-active-high;
+	aspeed,ext-pulse-duration = <256>;
+};
+
+&mac3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii4_default>;
+	no-hw-checksum;
+	use-ncsi;
+	mlx,multi-host;
+	ncsi-ctrl,start-redo-probe;
+	ncsi-ctrl,no-channel-monitor;
+	ncsi-package = <1>;
+	ncsi-channel = <1>;
+	ncsi-rexmit = <1>;
+	ncsi-timeout = <2>;
+};
+
+&rtc {
+	status = "okay";
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-rx-bus-width = <4>;
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-64.dtsi"
+	};
+	flash@1 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc2";
+		spi-rx-bus-width = <4>;
+		spi-max-frequency = <50000000>;
+	};
+};
+
+&i2c0 {
+	status = "okay";
+	multi-master;
+	ipmb0@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
+};
+
+&i2c1 {
+	status = "okay";
+	multi-master;
+	ipmb1@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+	multi-master;
+	ipmb2@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+	multi-master;
+	ipmb3@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+};
+
+&i2c6 {
+	status = "okay";
+};
+
+&i2c7 {
+	status = "okay";
+};
+
+&i2c8 {
+	status = "okay";
+	temperature-sensor@1f {
+		compatible = "ti,tmp421";
+		reg = <0x1f>;
+	};
+	// NIC EEPROM
+	eeprom@50 {
+		compatible = "st,24c32";
+		reg = <0x50>;
+	};
+};
+
+&i2c9 {
+	status = "okay";
+	multi-master;
+	ipmb9@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
+};
+
+&i2c10 {
+	status = "okay";
+};
+
+&i2c11 {
+	status = "okay";
+	eeprom@51 {
+		compatible = "atmel,24c128";
+		reg = <0x51>;
+	};
+	eeprom@54 {
+		compatible = "atmel,24c128";
+		reg = <0x54>;
+	};
+};
+
+&i2c12 {
+	status = "okay";
+	temperature-sensor@4f {
+		compatible = "lm75";
+		reg = <0x4f>;
+	};
+};
+
+&i2c13 {
+	status = "okay";
+};
+
+&adc0 {
+	ref_voltage = <2500>;
+	status = "okay";
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+			&pinctrl_adc2_default &pinctrl_adc3_default
+			&pinctrl_adc4_default &pinctrl_adc5_default
+			&pinctrl_adc6_default &pinctrl_adc7_default>;
+};
+
+&adc1 {
+	ref_voltage = <2500>;
+	status = "okay";
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc10_default
+			&pinctrl_adc11_default &pinctrl_adc12_default
+			&pinctrl_adc13_default &pinctrl_adc14_default>;
+};
+
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&uhci {
+	status = "okay";
+};
+
+&gpio0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpiu1_default &pinctrl_gpiu7_default>;
+};
+
+
-- 
2.25.1

