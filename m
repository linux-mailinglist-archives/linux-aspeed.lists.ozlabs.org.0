Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72363628FF0
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Nov 2022 03:30:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NB9BS2Pjgz3cFZ
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Nov 2022 13:30:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=HfkFBDES;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=40.107.117.77; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=HfkFBDES;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2077.outbound.protection.outlook.com [40.107.117.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7l7g5R4Yz3bY8
	for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Nov 2022 14:49:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNRj1xIDWCCgl3mTmqJLUb2p7IPdmbuUI1E2scyFhGlIuGwG7CZxLcixcgAYxmwLBWubtIde/O42nf9Nio+7cTR49GcdEBH2NBK0XulIz1gHWgXeX367WVyMnWrNyYOMHCqyu/CMMH/08qx7hzEp2Z4MA+mudtVqWGqsaZf9d8AM4oFz5PyNQqPBzd2aqYzF1USEJaSneekDrVuPVCu14XKKQm7xSgzyXb6Vzj6eLrx9evm3pGKqhHCBpRJGhtbW+L+JJpiPz5T+oNaxfSVQeutXKFUWvwEGkHP62f+6/MV99kWeHofmm+Y0VmTu4dJygFZ0ornxVhw8P2ZUzNE3wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3B1DDayC2iYO3nHKpEHJeCQ9S60BqBEkQrVGtKdSfVM=;
 b=Y1+FweePytCVQjvTLacNNaip7Vgjt7PdvTN7eXd2lEXUnoKLDeswZ6pudFf2MEZj1s35KoaCperbr6Fb7QFzfEiIWqzlZ8WpXzkbdlG4uOHxO0kVQfUvsUKxTami1k+KXSM/o7v5dyiwdjWN2yiBoRHtn5jPqt1T1JpRP8RsMvYMox1zQS/t3a16lerlYaeaaUPiT3nhm1mxDqlLPwWiy2331Hes+2OItW+2q8W3oa66osRPmI41d4yaijTyD3W055w4IeGiPqbWYENl2dVY6n9KMDu/XpOJSrIJRgFqpXkBlVb7Ce1amYJkssbnv2Jennp/pvzC0NIwN/RlDve0jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3B1DDayC2iYO3nHKpEHJeCQ9S60BqBEkQrVGtKdSfVM=;
 b=HfkFBDESSNylPZGnXLDJlb+N63oaaZDCcGe5MkGKsxfXOfLst/lRYpDqPc/blwQC/tdMAVyTyfLl8FglgPwh0eDTZkdq0I3WjLzf4Ar5XJPBq7ALXRK3CP2ZiC5jq8JrUeqwd2JEdDBan1rJvgul1lMLpj+t7c+B/X4jlOYCsSwIRjQdkl0fZ/1DbzRRgbdSmJktqx6qZpGgl2mFuQNj+LWFRPeZHCwKQ6lHmVB8qFbnwPfivVRAFcWrmVjH05vmN3PNR6twlnqLPq47Ksnyq6E3Mgjbwn0Dl7ycqr5cdo3i8ecWYa0GX1MA6TrlE5PjHfqn5V9FgxSYXGaO8gz1dQ==
Received: from TYCP286CA0052.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2b5::13)
 by TYZPR04MB4127.apcprd04.prod.outlook.com (2603:1096:400:2d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 03:49:01 +0000
Received: from TYZAPC01FT041.eop-APC01.prod.protection.outlook.com
 (2603:1096:400:2b5:cafe::4b) by TYCP286CA0052.outlook.office365.com
 (2603:1096:400:2b5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13 via Frontend
 Transport; Fri, 11 Nov 2022 03:49:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 TYZAPC01FT041.mail.protection.outlook.com (10.118.152.116) with Microsoft
 SMTP Server id 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022
 03:49:01 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To: patrick@stwcx.xyz,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v4 2/2] ARM: dts: aspeed: greatlakes: Add Facebook greatlakes (AST2600) BMC
Date: Fri, 11 Nov 2022 11:48:26 +0800
Message-Id: <20221111034828.2377-3-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221007055346.3484180-1-Delphine_CC_Chiu@Wiwynn.com>
References: <20221007055346.3484180-1-Delphine_CC_Chiu@Wiwynn.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZAPC01FT041:EE_|TYZPR04MB4127:EE_
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 13854d0a-b2c5-421e-5f1b-08dac397abea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	gSKsd2hpP0qyu6J01K6gk1KmjHDL0kgieRxwGtRPCO+17EGc+2b/7/dCg2/Kj2Y47uO2DHEwU4dGPv53X2W/EBL3WM7zPhAbeQo6XdznRCKmuEkpZctb5VDsHZ7Hps573bTnQeBWknSI3cJ1a9JgtAyge5rh13vlAPA+d5zOV7J4vU+Oy+uhVbLOXtOm4q36XwUHXyJCNbGDwhzmYG0LGFlpBptHeDB/ctaPQN0gtkamIPO9Qge29GIPfdq03f8Hb2jDLH1Y4ChgdeZBvaLLe3QkbgT4jADXV48u7Of1+avCffRqb+p3Z9tTQDLoU4chNTrT5eMmWa0GWBRmDuAzdvYJh4Th4JWIj10IjbIc9TEoFjNFiCxRqbPYX7ihN83CtHXS0Va+2gbi+Rfg2MHRkSBa6Ih+uG4EI8vUFckIlTgVQvb2NzkvscuhOYLq2zc2R75iPPN1qV2N5UWWzL6DVF8VJ/ghjXHbaDnelxWQBza4C8aCjZPZbjCC9HKfe5ugm5xIJLV1mZpZ3thxsKsCzJSF4LyBNxe3NN/abVcXAOCF3y/qOIsUAfRX/cu1a82/rMtcxcYtd7St042jmOimWBGaM0zmcka9lIA09pJtO8JN2tre8htN9KuphDjLEdL0SBvrsR4W/uNhqOmPiANwOc1f9kwQtDSfbIbCGUk+IyvnXidzg0hOh9Y9QGWFZB7Juhf7VrCwxW/Q6SsQoqba6MFj0lGmPqQMnXsHJ1fUsl4klbQ7SKxw8L/rT4YWiTlr
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230022)(6069001)(4636009)(136003)(396003)(39850400004)(346002)(376002)(47680400002)(451199015)(46966006)(36840700001)(336012)(82740400003)(2616005)(956004)(1076003)(186003)(26005)(110136005)(47076005)(356005)(81166007)(6512007)(36860700001)(316002)(2906002)(7416002)(8936002)(5660300002)(40480700001)(4326008)(82310400005)(9316004)(478600001)(6486002)(6506007)(6666004)(41300700001)(70206006)(36906005)(36736006)(8676002)(70586007)(36756003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 03:49:01.2620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13854d0a-b2c5-421e-5f1b-08dac397abea
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	TYZAPC01FT041.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB4127
X-Mailman-Approved-At: Tue, 15 Nov 2022 13:27:49 +1100
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, garnermic@fb.com, linux-kernel@vger.kernel.org, Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add linux device tree entry related to
greatlakes specific devices connected to BMC SoC.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../dts/aspeed-bmc-facebook-greatlakes.dts    | 241 ++++++++++++++++++
 2 files changed, 242 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 6aa7dc4db2fc..d18605aa783d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1594,6 +1594,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-elbert.dtb \
 	aspeed-bmc-facebook-fuji.dtb \
 	aspeed-bmc-facebook-galaxy100.dtb \
+	aspeed-bmc-facebook-greatlakes.dtb \
 	aspeed-bmc-facebook-minipack.dtb \
 	aspeed-bmc-facebook-tiogapass.dtb \
 	aspeed-bmc-facebook-wedge40.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
new file mode 100644
index 000000000000..8c05bd56ce1e
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
@@ -0,0 +1,241 @@
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
+	ipmb@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
+};
+
+&i2c1 {
+	status = "okay";
+	multi-master;
+	ipmb@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+	multi-master;
+	ipmb@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+	multi-master;
+	ipmb@10 {
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
+	ipmb@10 {
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
-- 
2.17.1

