Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E76D2FE73
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2019 16:52:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45F9XH5t9nzDqW9
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 May 2019 00:51:59 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.116; helo=mail1.bemta23.messagelabs.com;
 envelope-from=pengms1@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.116])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lv3Z1YBgzDqTv;
 Fri, 19 Apr 2019 21:32:56 +1000 (AEST)
Received: from [67.219.246.198] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-c.us-east-1.aws.symcld.net id EE/D0-24715-3E1B9BC5;
 Fri, 19 Apr 2019 11:32:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNIsWRWlGSWpSXmKPExsWS8eIht+7jjTt
 jDBZ9lLbYdZnDYsbeB8wW84+cY7X4ff4vs8Wmx9dYLZpXn2O2uLxrDpvF0usXmSxOtbxgsWjd
 e4Tdgcvjavsudo8189YweizYVOpx8eMxZo9NqzrZPDYvqfc4P2Mho8fnTXIBHFGsmXlJ+RUJr
 Bn7/9UUTGtirNi4aC17A+OKzC5GLg4hgQ4miZcnO5khnPmMEjvPPGTtYuTkYBNQkzg5+x4rSE
 JE4A6jxOSN18GqmAUmMUo0fLnCDFIlLOAqMWnJHhYQm0VAVaJ1/gsmEJtXwFni/8VrYDUSAnI
 SN891Mk9g5FzAyLCK0SypKDM9oyQ3MTNH19DAQNfQ0EjXRNfQxEAvsUo3Wa+0WDc1sbhE11Av
 sbxYr7gyNzknRS8vtWQTIzDQUgpYenYwHluafohRkoNJSZQ3t3xnjBBfUn5KZUZicUZ8UWlOa
 vEhRhkODiUJXmtg4AoJFqWmp1akZeYAQx4mLcHBoyTC+2IDUJq3uCAxtzgzHSJ1ilFRSpzXF6
 RPACSRUZoH1waLs0uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHl/gIznycwrgZv+CmgxE9D
 iKTqrQRaXJCKkpBoY2W10fVl+3jjWpv87oy41JchozaMdrU0KkbVTxD51fHmt8dxiz/EFu9ew
 3Zm1zTVJY6N2H2+trW2SKINtTdbKvvDglyWVCfa7i2bcrVvP6CmSsrD81PSv+tWL/mr3fvopJ
 fRSZ+53vUr1uOUt97oXVl7WmNTXteZOzZbmp/ULVynOuRN5pExdiaU4I9FQi7moOBEA8tyxPa
 4CAAA=
X-Env-Sender: pengms1@lenovo.com
X-Msg-Ref: server-2.tower-406.messagelabs.com!1555673571!6170547!1
X-Originating-IP: [104.232.225.11]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13329 invoked from network); 19 Apr 2019 11:32:51 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.11)
 by server-2.tower-406.messagelabs.com with DHE-RSA-AES256-GCM-SHA384 encrypted
 SMTP; 19 Apr 2019 11:32:51 -0000
Received: from smtpinternal.lenovo.com (unknown [10.96.80.15])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 1960AC81E290CCBCF081;
 Fri, 19 Apr 2019 07:21:23 -0400 (EDT)
Received: from localhost.localdomain (unknown [10.245.100.154])
 by Forcepoint Email with ESMTP id 422D026D4E03A77C04BD;
 Fri, 19 Apr 2019 19:32:46 +0800 (CST)
From: Andrew Peng <pengms1@lenovo.com>
To: benjaminfair@google.com, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, andrew@aj.id.au, mark.rutland@arm.com,
 robh+dt@kernel.org
Subject: [PATCH] [PATCH v1] ARM: dts: aspeed: Adding Lenovo Hr630 BMC
Date: Fri, 19 Apr 2019 19:32:36 +0800
Message-Id: <1555673556-419097-1-git-send-email-pengms1@lenovo.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Fri, 31 May 2019 00:50:56 +1000
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
Cc: dukh@lenovo.com, pengms1@lenovo.com, openbmc@lists.ozlabs.org,
 hsung1@lenovo.com, liuyh21@lenovo.com, liuyj19@lenovo.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Initial introduction of Lenovo Hr630 family equipped with
Aspeed 2500 BMC SoC. Hr630 is a x86 server development kit
with a ASPEED ast2500 BMC manufactured by Lenovo.
Specifically, This adds the Hr630 platform device tree file
used by the Hr630 BMC machines.

This also adds an entry of Hr630 device tree file in Makefile

Signed-off-by: Andrew Peng <pengms1@lenovo.com>
Signed-off-by: Yonghui Liu <liuyh21@lenovo.com>
Signed-off-by: Lisa Liu <liuyj19@lenovo.com>
---
 arch/arm/boot/dts/Makefile                    |   3 +-
 arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts | 884 ++++++++++++++++++++++++++
 2 files changed, 886 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index f4f5aea..375e53b 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1261,4 +1261,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-opp-witherspoon.dtb \
 	aspeed-bmc-opp-zaius.dtb \
 	aspeed-bmc-portwell-neptune.dtb \
-	aspeed-bmc-quanta-q71l.dtb
+	aspeed-bmc-quanta-q71l.dtb \
+	aspeed-bmc-lenovo-hr630.dtb
diff --git a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
new file mode 100644
index 0000000..ca80509
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
@@ -0,0 +1,884 @@
+// SPDX-License-Identifier: GPL-2.0+
+//"Copyright ? 2019-present Lenovo
+//Licensed under GPL v2, see COPYING file for details."
+
+
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "HR630 BMC";
+	compatible = "lenovo,hr630-bmc", "aspeed,ast2500";
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=tty0 console=ttyS4,115200 earlyprintk";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		flash_memory: region@98000000 {
+			no-map;
+			reg = <0x98000000 0x00100000>; /* 1M */
+		};
+
+		gfx_memory: framebuffer {
+			size = <0x01000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		heartbeat {
+			gpios = <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_LOW>;
+		};
+
+		fault {
+			gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
+		<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
+		<&adc 8>, <&adc 9>, <&adc 10>,
+		<&adc 12>, <&adc 13>, <&adc 14>;
+	};
+
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout.dtsi"
+	};
+};
+
+&lpc_ctrl {
+	status = "okay";
+	memory-region = <&flash_memory>;
+	flash = <&spi1>;
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
+&uart5 {
+	status = "okay";
+};
+
+&vuart {
+	status = "okay";
+};
+
+&ibt {
+	status = "okay";
+};
+
+&mac0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii1_default>;
+	use-ncsi;
+};
+
+&mac1 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
+};
+
+&adc {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+	/* temp1 inlet */
+	tmp75@4e {
+		compatible = "national,lm75";
+		reg = <0x4e>;
+	};
+};
+
+&i2c1 {
+	status = "okay";
+	/* temp2 outlet */
+	tmp75@4d {
+		compatible = "national,lm75";
+		reg = <0x4d>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+	/*
+	 *eeprom@50 {
+	 *	compatible = "atmel,24c08";
+	 *	reg = <0x50>;
+	 *	pagesize = <16>;
+	 *};
+	 */
+};
+
+&i2c6 {
+	status = "okay";
+	/*	Slot 0,
+	 *	Slot 1,
+	 *	Slot 2,
+	 *	Slot 3
+	 */
+
+	i2c-switch@70 {
+		compatible = "nxp,pca9545";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;	/* may use mux@70 next. */
+
+		i2c_rbp: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c_fbp1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c_fbp2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c_fbp3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+&i2c7 {
+	status = "okay";
+
+	/*	Slot 0,
+	 *	Slot 1,
+	 *	Slot 2,
+	 *	Slot 3
+	 */
+	i2c-switch@76 {
+		compatible = "nxp,pca9546";
+		reg = <0x76>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;  /* may use mux@76 next. */
+
+		i2c_riser2: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c_pcie4: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c_riser1: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c_ocp: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+&i2c8 {
+	status = "okay";
+
+	eeprom@57 {
+		compatible = "atmel,24c256";
+		reg = <0x57>;
+		pagesize = <16>;
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
+};
+
+/*
+ * Enable port A as device (via the virtual hub) and port B as
+ * host by default on the eval board. This can be easily changed
+ * by replacing the override below with &ehci0 { ... } to enable
+ * host on both ports.
+ */
+&vhub {
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
+&gfx {
+	status = "okay";
+	memory-region = <&gfx_memory>;
+};
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default
+	&pinctrl_pwm1_default
+	&pinctrl_pwm2_default
+	&pinctrl_pwm3_default
+	&pinctrl_pwm4_default
+	&pinctrl_pwm5_default
+	&pinctrl_pwm6_default>;
+
+	fan@0 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+	};
+
+	fan@1 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x01>;
+	};
+
+	fan@2 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x02>;
+	};
+
+	fan@3 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x03>;
+	};
+
+	fan@4 {
+		reg = <0x02>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x04>;
+	};
+
+	fan@5 {
+		reg = <0x02>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x05>;
+	};
+
+	fan@6 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x06>;
+	};
+
+	fan@7 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x07>;
+	};
+
+	fan@8 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x08>;
+	};
+
+	fan@9 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x09>;
+	};
+
+	fan@10 {
+		reg = <0x05>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0a>;
+	};
+
+	fan@11 {
+		reg = <0x05>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0b>;
+	};
+
+	fan@12 {
+		reg = <0x06>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0c>;
+	};
+
+	fan@13 {
+		reg = <0x06>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0d>;
+	};
+};
+
+&gpio {
+
+	pin_gpio_a0 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(A, 0) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "MAC1_INT_N";
+	};
+
+	pin_gpio_a1 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(A, 1) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "MEZZ_C_PRESENT_N";
+	};
+
+	pin_gpio_a2 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(A, 2) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "PSU1_PRST";
+	};
+
+	pin_gpio_a3 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(A, 3) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "PSU2_PRST";
+	};
+
+	pin_gpio_b5 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "IRQ_BMC_PCH_SMI_LPC_N";
+	};
+
+	pin_gpio_f0 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(F, 0) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "IRQ_BMC_PCH_NMI_R";
+	};
+
+	pin_gpio_f1 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(F, 1) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "FM_CPU1_DISABLE_COD_N";
+	};
+
+	pin_gpio_f2 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(F, 2) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "SMB_LAN_ALERT_N_MEZZ";
+	};
+
+	pin_gpio_f3 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(F, 3) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "I2C_BUS0_RST_OUT_N";
+	};
+
+	pin_gpio_f4 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(F, 4) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "FM_SKT0_FAULT_LED";
+	};
+
+	pin_gpio_f5 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(F, 5) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "FM_SKT1_FAULT_LED";
+	};
+
+	pin_gpio_f6 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(F, 6) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "IRQ_BMC_CPLD_NMI";
+	};
+
+	pin_gpio_f7 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(F, 7) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "PSU2_ALERT_N";
+	};
+
+	pin_gpio_g0 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(G, 0) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "FM_CPU_ERR2_LVT3_N";
+	};
+
+	pin_gpio_g1 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(G, 1) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "FM_CPU_MSMI_CATERR_LVT3_N";
+	};
+
+	pin_gpio_g2 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(G, 2) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "FM_PCH_BMC_THERMTRIP_N";
+	};
+
+	pin_gpio_g3 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(G, 3) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "BMC_I2C_BUS7_INT_N";
+	};
+
+	pin_gpio_g4 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(G, 4) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "FAN_PWR_CTL_N";
+	};
+
+	pin_gpio_g5 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(G, 5) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "NFC_FD_N";
+	};
+
+	pin_gpio_g6 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(G, 6) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "IRQ_NMI_EVENT_N";
+	};
+
+	pin_gpio_g7 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(G, 7) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "RST_BMC_PCIE_I2CMUX_N";
+	};
+
+	pin_gpio_h0 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "PSU1_EPOW_N_R";
+	};
+
+	pin_gpio_h1 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "PSU2_EPOW_N_R";
+	};
+
+	pin_gpio_h2 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "PSU1_FFS_N_R";
+	};
+
+	pin_gpio_h3 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(H, 3) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "PSU2_FFS_N_R";
+	};
+
+	pin_gpio_h4 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(H, 4) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "PSU1_THROTTLE_N_R";
+	};
+
+	pin_gpio_h5 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(H, 5) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "PSU2_THROTTLE_N_R";
+	};
+
+	pin_gpio_h6 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "PSU1_SMB_RESET_N";
+	};
+
+	pin_gpio_h7 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "PSU2_SMB_RESET_N";
+	};
+
+	pin_gpio_i1 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(I, 1) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "FP_PWR_BTN_N";
+	};
+
+	pin_gpio_i2 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(I, 2) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "BIOS_RCVR_N";
+	};
+
+	pin_gpio_i3 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(I, 3) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "BMC_INTRUDED_COVER";
+	};
+
+	pin_gpio_j2 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "BMC_BIOS_UPDATE_N";
+	};
+
+	pin_gpio_j3 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(J, 3) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "RST_BMC_HDD_I2CMUX_N";
+	};
+
+	pin_gpio_q4 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(Q, 4) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "MEZZ_A_PRESENT_N";
+	};
+
+	pin_gpio_q5 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(Q, 5) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "VGA_FRONT_PRES_N";
+	};
+
+	pin_gpio_q6 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(Q, 6) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "I2C_RISER1_INT_N";
+	};
+
+	pin_gpio_q7 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(Q, 7) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "NCSI_CABLE_DET_N";
+	};
+
+	pin_gpio_r0 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "FP_RST_BTN_N";
+	};
+
+	pin_gpio_r2 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "HDDSIG1_DETECT_N";
+	};
+
+	pin_gpio_r3 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(R, 3) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "HDDSIG2_DETECT_N";
+	};
+
+	pin_gpio_r4 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(R, 4) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "HDDSIG3_DETECT_N";
+	};
+
+	pin_gpio_r5 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(R, 5) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "VIDEO_CABLE_DETECT_N";
+	};
+
+	pin_gpio_s0 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(S, 0) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "BMC_PS_RAPIDON_WAKE_R_N";
+	};
+
+	pin_gpio_s1 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(S, 1) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "HOST_TPM_PP_BUF";
+	};
+
+	pin_gpio_s2 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(S, 2) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "BMC_VGA_SW";
+	};
+
+	pin_gpio_s3 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(S, 3) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "IRQ_SML0_ALERT_MUX_N";
+	};
+
+	pin_gpio_s4 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(S, 4) GPIO_ACTIVE_HIGH>;
+		output;
+		line-name = "VBAT_EN_N";
+	};
+
+	pin_gpio_s5 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(S, 5) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "BMC_HW_STRAP_4";
+	};
+
+	pin_gpio_s6 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(S, 6) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "PU_BMC_GPIOS6";
+	};
+
+	pin_gpio_s7 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(S, 7) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "I2C_BUS7_RESET_N";
+	};
+
+	pin_gpio_y0 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(Y, 0) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "BMC_NCSI_MUX_CTL_S0";
+	};
+
+	pin_gpio_y1 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(Y, 1) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "BMC_NCSI_MUX_CTL_S1";
+	};
+
+	pin_gpio_y2 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(Y, 2) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "UID_ALERT_N";
+	};
+
+	pin_gpio_z0 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(Z, 0) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "I2C_RISER2_INT_N";
+	};
+
+	pin_gpio_z2 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(Z, 2) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "I2C_RISER2_RESET_N";
+	};
+
+	pin_gpio_z3 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "FM_BMC_PCH_SCI_LPC_N";
+	};
+
+	pin_gpio_z4 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "BMC_HW_STRAP_17";
+	};
+
+	pin_gpio_z6 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(Z, 6) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "BMC_HW_STRAP_20";
+	};
+
+	pin_gpio_z7 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(Z, 7) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "BMC_POST_CMPLT_N";
+	};
+
+	pin_gpio_aa0 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "HOST_BMC_USB_SEL";
+	};
+
+	pin_gpio_aa1 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(AA, 1) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "PSU1_ALERT_N";
+	};
+
+	pin_gpio_aa2 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "FM_PVCCIN_CPU0_PWR_IN_ALERT_N";
+	};
+
+	pin_gpio_aa3 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(AA, 3) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "FM_PVCCIN_CPU1_PWR_IN_ALERT_N";
+	};
+
+	pin_gpio_aa4 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(AA, 4) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "USB_CABLE_DETECT_N";
+	};
+
+	pin_gpio_aa5 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(AA, 5) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "I2C_BUS1_RST_OUT_N";
+	};
+
+	pin_gpio_aa6 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(AA, 6) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "IRQ_SMI_ACTIVE_N";
+	};
+
+	pin_gpio_aa7 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(AA, 7) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "FM_BIOS_POST_CMPLT_N";
+	};
+
+	pin_gpio_ab0 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(AB, 0) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "FM_TPM_MOD_PRES_N";
+	};
+
+	pin_gpio_ab1 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(AB, 1) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "FORCE_NMI_SW_FPGA_N";
+	};
+
+	pin_gpio_ab2 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(AB, 2) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "1U_2U_PCBA_SEL_R";
+	};
+
+	pin_gpio_ab3 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(AB, 3) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "INTRUDED_PRES_N";
+	};
+};
-- 
2.7.4

