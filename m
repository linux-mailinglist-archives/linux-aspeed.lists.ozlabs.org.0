Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7877652DB3B
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 May 2022 19:29:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3xgT2v6Sz304J
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 May 2022 03:29:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=x6hNOfKb;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=199.106.114.39;
 helo=alexa-out-sd-02.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=x6hNOfKb; dkim-atps=neutral
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3xgM4N8rz2ynL
 for <linux-aspeed@lists.ozlabs.org>; Fri, 20 May 2022 03:29:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652981375; x=1684517375;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=18M3FclIJ44VQRsji7TBeWXSTssxe3yC83QYfiM/YMA=;
 b=x6hNOfKbqRrOWlh2/+PpERcs/qupEUSPGaNlCku4Yh5UDB796ePhj3NU
 01Q/VEKlJf3G3wQG6Ugq9DfPisf33YmJrAyu/UxTw8aQCqiziHPWk6yq9
 Toov46JPRzcux3lNbqgJYpNUufut2eNl4r2ijCbCb9uOK7CTBNVafvAEQ g=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 19 May 2022 10:29:30 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 10:29:30 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 19 May 2022 10:29:29 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 19 May
 2022 10:29:28 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn <andrew@lunn.ch>, "Joel
 Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v4] ARM: dts: aspeed: add Qualcomm DC-SCM V1 BMC
Date: Thu, 19 May 2022 10:28:38 -0700
Message-ID: <20220519172838.61270-1-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
 Jamie Iles <quic_jiles@quicinc.com>,
 Graeme Gregory <quic_ggregory@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Graeme Gregory <quic_ggregory@quicinc.com>

Add initial version of device tree for Qualcomm DC-SCM V1 BMC which is
equipped with Aspeed AST2600 BMC SoC.

Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
---
Changes in v4:
* Changed vendor name from Nuvia to Qualcomm.
* Removed 'bootargs'. (Krzysztof Kozlowski)

Changes in v3:
* Added 'stdout-path'. (Krzysztof Kozlowski)

Changes in v2:
* Added a comment to explain 'rgmii' phy mode setting. (Andrew Lunn)

 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts    | 189 ++++++++++++++++++
 2 files changed, 190 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7c16f8a2b738..6afb7c8102d3 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1558,6 +1558,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-opp-witherspoon.dtb \
 	aspeed-bmc-opp-zaius.dtb \
 	aspeed-bmc-portwell-neptune.dtb \
+	aspeed-bmc-qcom-dc-scm-v1.dtb \
 	aspeed-bmc-quanta-q71l.dtb \
 	aspeed-bmc-quanta-s6q.dtb \
 	aspeed-bmc-supermicro-x11spi.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts b/arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
new file mode 100644
index 000000000000..966cef5f1e9e
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+
+/ {
+	model = "Qualcomm DC-SCM V1 BMC";
+	compatible = "qcom,dc-scm-v1-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial4 = &uart5;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+};
+
+&mdio3 {
+	status = "okay";
+
+	ethphy3: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+	};
+};
+
+&mac2 {
+	status = "okay";
+
+	/* Bootloader sets up the MAC to insert delay */
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy3>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii3_default>;
+};
+
+&mac3 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii4_default>;
+
+	use-ncsi;
+};
+
+&rtc {
+	status = "okay";
+};
+
+&fmc {
+	status = "okay";
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <133000000>;
+#include "openbmc-flash-layout-64.dtsi"
+	};
+
+	flash@1 {
+		status = "okay";
+		m25p,fast-read;
+		label = "alt-bmc";
+		spi-max-frequency = <133000000>;
+#include "openbmc-flash-layout-64-alt.dtsi"
+	};
+};
+
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bios";
+		spi-max-frequency = <133000000>;
+	};
+};
+
+&gpio0 {
+	gpio-line-names =
+	/*A0-A7*/	"","","","","","","","",
+	/*B0-B7*/	"BMC_FLASH_MUX_SEL","","","","","","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"","","","","","","","",
+	/*E0-E7*/	"","","","","","","","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","","","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"BMC_FWSPI_RST_N","","GPIO_1_BMC_3V3","","","","","",
+	/*O0-O7*/	"JTAG_MUX_A","JTAG_MUX_B","","","","","","",
+	/*P0-P7*/	"","","","","","","","",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"","","","","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","SCMFPGA_SPARE_GPIO1_3V3",
+			"SCMFPGA_SPARE_GPIO2_3V3","SCMFPGA_SPARE_GPIO3_3V3",
+			"SCMFPGA_SPARE_GPIO4_3V3","SCMFPGA_SPARE_GPIO5_3V3",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","",
+	/*AA0-AA7*/	"","","","","","","","",
+	/*AB0-AB7*/	"","","","","","","","",
+	/*AC0-AC7*/	"","","","","","","","";
+};
+
+&gpio1 {
+	gpio-line-names =
+	/*A0-A7*/	"GPI_1_BMC_1V8","","","","","",
+			"SCMFPGA_SPARE_GPIO1_1V8","SCMFPGA_SPARE_GPIO2_1V8",
+	/*B0-B7*/	"SCMFPGA_SPARE_GPIO3_1V8","SCMFPGA_SPARE_GPIO4_1V8",
+			"SCMFPGA_SPARE_GPIO5_1V8","","","","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"","BMC_SPI1_RST_N","BIOS_FLASH_MUX_SEL","",
+			"","TPM2_PIRQ_N","TPM2_RST_N","",
+	/*E0-E7*/	"","","","","","","","";
+};
+
+&i2c2 {
+	status = "okay";
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
+};
+
+&i2c9 {
+	status = "okay";
+};
+
+&i2c10 {
+	status = "okay";
+};
+
+&i2c12 {
+	status = "okay";
+};
+
+&i2c13 {
+	status = "okay";
+};
+
+&i2c14 {
+	status = "okay";
+};
+
+&i2c15 {
+	status = "okay";
+};
+
+&vhub {
+	status = "okay";
+};
-- 
2.25.1

