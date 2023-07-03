Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC47745549
	for <lists+linux-aspeed@lfdr.de>; Mon,  3 Jul 2023 08:04:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=inventec.com header.i=@inventec.com header.a=rsa-sha256 header.s=sEx03 header.b=RI2YTMOL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qvb436kMQz3dKX
	for <lists+linux-aspeed@lfdr.de>; Mon,  3 Jul 2023 16:04:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inventec.com header.i=@inventec.com header.a=rsa-sha256 header.s=sEx03 header.b=RI2YTMOL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inventec.com (client-ip=218.32.67.185; helo=mail.inventec.com; envelope-from=chen.pj@inventec.com; receiver=lists.ozlabs.org)
Received: from mail.inventec.com (mail.inventec.com [218.32.67.185])
	(using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qvb1Q1Zcmz3dCB
	for <linux-aspeed@lists.ozlabs.org>; Mon,  3 Jul 2023 16:02:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
    s=sEx03; d=inventec.com;
    h=from:to:cc:subject:date:message-id:in-reply-to:mime-version:
      content-type;
    bh=hIMcZMsWbpt8FgyYLdfQQ/GAzTgQR7eyippkjzikMWQ=;
    b=RI2YTMOLAkS82rUZ+AoycjRVkcVveluiOkplN3Xhqd2QpmbgvLbPyvdZnXbTpT
      UXCXJE56UD+nuJaNidzFZhOCsEQdo9lsfGrj7B6+VWl55fm9xL6cAvCtdpCZqy
      rQiidVexINS0/5FzkH98aNeEcfXbfkNfxxWPkX5pZXHkpVw=
Received: from IEC1-EX2016-04.iec.inventec (10.1.254.222) by
 IEC1-EX2016-03.iec.inventec (10.15.2.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 3 Jul 2023 14:02:25 +0800
Received: from TAO-MailRelay-1.iec.inventec (10.6.254.133) by
 IEC1-EX2016-04.iec.inventec (10.1.254.222) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Mon, 3 Jul 2023 14:02:25 +0800
Received: from charon ([10.6.141.37]) by TAO-MailRelay-1.iec.inventec with Microsoft SMTPSVC(8.0.9200.16384);
	 Mon, 3 Jul 2023 14:02:24 +0800
From: PJ Chen <chen.pj@inventec.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	<soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@aj.id.au>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v7 2/2] ARM: dts: aspeed: Adding Inventec Starscream BMC
Date: Mon, 3 Jul 2023 14:02:22 +0800
Message-ID: <20230703060222.24263-2-chen.pj@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230703060222.24263-1-chen.pj@inventec.com>
References: <20230703060222.24263-1-chen.pj@inventec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Jul 2023 06:02:24.0909 (UTC) FILETIME=[F0550BD0:01D9AD73]
Content-Type: text/plain
X-TM-SNTS-SMTP: 8EF94C605EEB815EA2DFE3A1D19DF3BDB7028A516C868836792279F99A61768C2000:8
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
Cc: ye.vic@inventec.com, Chen PJ <Chen.pj@inventec.com>, Huang.Alang@inventec.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Chen PJ <Chen.pj@inventec.com>

Initial introduction of Inventec Starscream x86 family
equipped with AST2600 BMC SoC.

Signed-off-by: Chen PJ <Chen.pj@inventec.com>

---
V6 -> V7:
  - Resend a new patch set.
V5 -> V6:
  - Remove setting not match dt-binging check.
V4 -> V5:
  - Remove devices not defined in dt-binding yet.
V3 -> V4:
  - Reply with devicetree binding
    https://lore.kernel.org/all/28f0ce0a82464083ae24f9ef2f598425@inventec.com/
V2 -> V3:
  - Rename the node name to generic.
V1 -> V2:
  - Correct License description
  - Remove not supported device
  - Using openbmc-flash-layout.dtsi
  - Correct device format
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../dts/aspeed-bmc-inventec-starscream.dts    | 389 ++++++++++++++++++
 2 files changed, 390 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-inventec-starscream.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index eb681903d50b..6a897ff40ff0 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1629,6 +1629,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-quanta-q71l.dtb \
 	aspeed-bmc-quanta-s6q.dtb \
 	aspeed-bmc-supermicro-x11spi.dtb \
+	aspeed-bmc-inventec-starscream.dtb \
 	aspeed-bmc-inventec-transformers.dtb \
 	aspeed-bmc-tyan-s7106.dtb \
 	aspeed-bmc-tyan-s8036.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-inventec-starscream.dts b/arch/arm/boot/dts/aspeed-bmc-inventec-starscream.dts
new file mode 100644
index 000000000000..ec82af94e1fb
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-inventec-starscream.dts
@@ -0,0 +1,389 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2023 Inventec Corp.
+
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include "aspeed-g6-pinctrl.dtsi"
+#include <dt-bindings/i2c/i2c.h>
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "STARSCREAM BMC";
+	compatible = "inventec,starscream-bmc", "aspeed,ast2600";
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
+		reg = <0x80000000 0x80000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		video_engine_memory: video {
+			size = <0x04000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-uid {
+			label = "UID_LED";
+			gpios = <&gpio0 186 GPIO_ACTIVE_LOW>;
+		};
+
+		led-heartbeat {
+			label = "HB_LED";
+			gpios = <&gpio0 127 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&mdio0 {
+	status = "okay";
+
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+	};
+};
+
+&mac2 {
+	status = "okay";
+	pinctrl-names = "default";
+	phy-mode = "rmii";
+	pinctrl-0 = <&pinctrl_rmii3_default>;
+	use-ncsi;
+};
+
+&mac3 {
+	status = "okay";
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii4_default>;
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+#include "openbmc-flash-layout.dtsi"
+	};
+
+	flash@1 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc2";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
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
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&vuart1 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&kcs3 {
+	aspeed,lpc-io-reg = <0xca2>;
+	status = "okay";
+};
+
+&uart_routing {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+};
+&i2c1 {
+	status = "okay";
+};
+&i2c2 {
+	status = "okay";
+};
+&i2c3 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+
+	// I2C EXPANDER
+	i2c-mux@71 {
+		compatible = "nxp,pca9546";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x71>;
+
+		i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			// AMD SB-TSI CPU1
+			sbtsi@4c {
+				compatible = "amd,sbtsi";
+				reg = <0x4c>;
+			};
+		};
+
+		i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			// AMD SB-TSI CPU2
+			sbtsi@48 {
+				compatible = "amd,sbtsi";
+				reg = <0x48>;
+			};
+		};
+	};
+};
+
+&i2c5 {
+	status = "okay";
+
+	// I2C EXPANDER U153
+	i2c-mux@70 {
+		compatible = "nxp,pca9546";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+
+		usb_hub: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		riser1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		riser2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+&i2c6 {
+	status = "okay";
+
+	// Motherboard Temp_U89
+	temperature-sensor@4e {
+		compatible = "ti,tmp421";
+		reg = <0x4e>;
+	};
+
+	// RunBMC Temp_U6
+	temperature-sensor@49 {
+		compatible = "ti,tmp75";
+		reg = <0x49>;
+	};
+};
+
+&i2c7 {
+	status = "okay";
+	// I2C EXPANDER U40
+	i2c-mux@70 {
+		compatible = "nxp,pca9545";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+
+		i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+&i2c8 {
+	status = "okay";
+	// FRU RunBMC
+	eeprom@51 {
+		compatible = "atmel,24c512";
+		reg = <0x51>;
+		pagesize = <128>;
+	};
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
+&i2c11 {
+	status = "okay";
+};
+
+&i2c12 {
+	status = "okay";
+	// FRU SCM
+	eeprom@51 {
+		compatible = "atmel,24c512";
+		reg = <0x51>;
+		pagesize = <128>;
+	};
+
+	// SCM Temp_U17
+	temperature-sensor@4f {
+		compatible = "ti,tmp75";
+		reg = <0x4f>;
+	};
+};
+
+&gpio0 {
+	status = "okay";
+	gpio-line-names =
+	/*A0-A7*/   "","","","","","","","",
+	/*B0-B7*/   "alert-psu0-smb-r-n","bmc-ready","","assert-cpu0-prochot-r-n",
+	"","","","",
+	/*C0-C7*/   "","","","","","","","",
+	/*D0-D7*/   "","","","","","","","",
+	/*E0-E7*/   "","","","","","","","",
+	/*F0-F7*/   "","","","","reset-sgpio-r-n","","","",
+	/*G0-G7*/   "","","scm-jtag-mux-select","","","","","",
+	/*H0-H7*/   "","","","","reset-out","power-out","","",
+	/*I0-I7*/   "","","","","","","irq-bmc-cpu0-buf-nmi-n","",
+	/*J0-J7*/   "","","","","","","","",
+	/*K0-K7*/   "","","","","","","","",
+	/*L0-L7*/   "","","","","","","","",
+	/*M0-M7*/   "","","","","","","","",
+	/*N0-N7*/   "","","ncsi-ocp-clk-en-n","","","","","",
+	/*O0-O7*/   "","","","","","","cpu1-thermal-trip-n","",
+	/*P0-P7*/   "","","","","","","","",
+	/*Q0-Q7*/   "cpu0-prochot-n","","cpu1-prochot-n","","cpu0-pe-rst0","","","",
+	/*R0-R7*/   "","","","","","","","",
+	/*S0-S7*/   "","","","",
+	"","PCH_SLP_S4_BMC_N","cpu0-thermtrip-n","alert-psu1-smb-r-n",
+	/*T0-T7*/   "","","","","","","","",
+	/*U0-U7*/   "","","","","","","","",
+	/*V0-V7*/   "bios-recovery-buf-n","","assert-cpu1-prochot-r-n","",
+	"power-chassis-good","","","",
+	/*W0-W7*/   "","","","","","","","",
+	/*X0-X7*/   "","","","","platform-type","","","",
+	/*Y0-Y7*/   "","","","","","","","",
+	/*Z0-Z7*/   "","cpld-power-break-n","","","","","","",
+	/*AA0-AA7*/ "","","","","","","","",
+	/*AB0-AB7*/ "","","","","","","","",
+	/*AC0-AC7*/ "","","","","","","","";
+};
+
+&sgpiom0 {
+	status = "okay";
+	ngpios = <64>;
+	bus-frequency = <1000000>;
+};
+
+&lpc_snoop {
+	status = "okay";
+	snoop-ports = <0x80>;
+};
+
+&emmc_controller {
+	status = "okay";
+};
+
+&emmc {
+	status = "okay";
+	non-removable;
+	max-frequency = <52000000>;
+	bus-width = <8>;
+};
+
+&video {
+	status = "okay";
+	memory-region = <&video_engine_memory>;
+};
+
+&vhub {
+	status = "okay";
+	aspeed,vhub-downstream-ports = <7>;
+	aspeed,vhub-generic-endpoints = <21>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb2ad_default>;
+};
+
+&rtc {
+	status = "okay";
+};
-- 
2.25.1

