Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B764B142DDF
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Jan 2020 15:43:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481ZCf4LbbzDqCW
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Jan 2020 01:43:10 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oe9toNJn; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481ZBz5LC0zDq5f
 for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Jan 2020 01:42:32 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id e11so7297985pjt.4
 for <linux-aspeed@lists.ozlabs.org>; Mon, 20 Jan 2020 06:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=YqfXc8yXrudcqJ9+BPypAzGN1yskDe+7msexUEFvfvc=;
 b=oe9toNJnvkAP4PD5GyZiZnfkpld67CC1xeoorIFWRKSe8teuBreIpOIS6DVl+qkOjr
 SU05RpSvRxi40FipKfZpxf1nzdcjU6aMU9GVeH78Uo6n70vQ11pGUr3qsavc/C+PCHis
 XpfxUsGyC2LwKx12Mef/FWYPVtuf6U01FDZoUnG9xxIqandQFZFPlGWR0cJfyY0n0Fac
 Np6IxInbcjlOJ40Mxll/xAkkWz9F12fL30qVCL3Uq/jwbasYlaP0UyTgpayvN5reOFUH
 YUfaJP1ANyImjcYXwmeqciOZ88vk3QlBQq1kdkfPNTl/SYf+MXkAYs13m6nD4yof/B0X
 XrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=YqfXc8yXrudcqJ9+BPypAzGN1yskDe+7msexUEFvfvc=;
 b=h1uNjDSMaN/3NMnnA9CbXf7gp4/KWLsh7rQarjHDkJAMwXLAMWV4pJbrR4Svdhnmuz
 yIxNWabSNng915I0yJ8KDbrU8sWCiX7qUAv5W/LFNS+ITIhlue2a3TpTmWDg6HFo+fyV
 REjPTqCaYQUs7sXxC4iWYn/lsU0hKTlgrKc583j4Pzf0Y/RrBTWrvExIfotnA5tviksQ
 pDoQRsNPopQawfbYwRcY1wlg/DiTgyzMXHClTx7XOvtAXwGLUn98tzF1W6IH2aPokHLz
 syGcg46hJUHe5bRFpSvCspHjCoCLBI/BajKgv7YGyPrGJN/GP/G9YjqZ7quff1f2VpD7
 FDgw==
X-Gm-Message-State: APjAAAVY8mzhvQyOmTCWc9/2AZV5lpcACLdeLCzuyPwnJhrFnFZEJKV/
 Eakuba7YlkYCqUym96ADQ1E=
X-Google-Smtp-Source: APXvYqxLZ61cO6F7r43DS1R/LrcLbFu87VZDZuIPlM4HJvu6ugke2TJ0dojPO/76HcTXndeugKX8xg==
X-Received: by 2002:a17:90a:f998:: with SMTP id
 cq24mr23057835pjb.6.1579531347713; 
 Mon, 20 Jan 2020 06:42:27 -0800 (PST)
Received: from cnn ([42.111.130.113])
 by smtp.gmail.com with ESMTPSA id w3sm36152429pgj.48.2020.01.20.06.42.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Jan 2020 06:42:27 -0800 (PST)
Date: Mon, 20 Jan 2020 20:12:21 +0530
From: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
To: andrew@aj.id.au, joel@jms.id.au
Subject: [PATCH v6] ARM: dts: aspeed: Adding Facebook Yosemite V2 BMC
Message-ID: <20200120144221.GA22195@cnn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: devicetree@vger.kernel.org, sdasari@fb.com, manikandan.e@hcl.com,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 sam@mendozajonas.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The Yosemite V2 is a facebook multi-node server
platform that host four OCP server. The BMC
in the Yosemite V2 platform based on AST2500 SoC.

This patch adds linux device tree entry related to
Yosemite V2 specific devices connected to BMC SoC.

Signed-off-by: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
Acked-by     : Andrew Jeffery <andrew@aj.id.au>
Reviewed-by  : Vijay Khemka <vkhemka@fb.com>
---
---      v6 - Added device tree property for multi-host Mellanox NIC in the ncsi driver.
---      v5 - Spell and contributor name correction.
---           - License identifier changed to GPL-2.0-or-later.
---           - aspeed-gpio.h removed.
---           - FAN2 tacho channel changed.
---      v4 - Bootargs removed.
---      v3 - Uart1 Debug removed .
---      v2 - LPC and VUART removed .
---      v1 - Initial draft.
---
 .../boot/dts/aspeed-bmc-facebook-yosemitev2.dts    | 149 +++++++++++++++++++++
 1 file changed, 149 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
new file mode 100644
index 0000000..04a6a32
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright (c) 2018 Facebook Inc.
+
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+/ {
+	model = "Facebook Yosemitev2 BMC";
+	compatible = "facebook,yosemitev2-bmc", "aspeed,ast2500";
+	aliases {
+		serial4 = &uart5;
+	};
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	memory@80000000 {
+		reg = <0x80000000 0x20000000>;
+	};
+
+	iio-hwmon {
+		// VOLATAGE SENSOR
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0> , <&adc 1> , <&adc 2> ,  <&adc 3> ,
+		<&adc 4> , <&adc 5> , <&adc 6> ,  <&adc 7> ,
+		<&adc 8> , <&adc 9> , <&adc 10>, <&adc 11> ,
+		<&adc 12> , <&adc 13> , <&adc 14> , <&adc 15> ;
+	};
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+#include "openbmc-flash-layout.dtsi"
+	};
+};
+
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "pnor";
+	};
+};
+
+&uart5 {
+	// BMC Console
+	status = "okay";
+};
+
+&mac0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii1_default>;
+	mlx,multi-host;
+	use-ncsi;
+};
+
+&adc {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default
+			&pinctrl_adc1_default
+			&pinctrl_adc2_default
+			&pinctrl_adc3_default
+			&pinctrl_adc4_default
+			&pinctrl_adc5_default
+			&pinctrl_adc6_default
+			&pinctrl_adc7_default
+			&pinctrl_adc8_default
+			&pinctrl_adc9_default
+			&pinctrl_adc10_default
+			&pinctrl_adc11_default
+			&pinctrl_adc12_default
+			&pinctrl_adc13_default
+			&pinctrl_adc14_default
+			&pinctrl_adc15_default>;
+};
+
+&i2c8 {
+	//FRU EEPROM
+	status = "okay";
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+		pagesize = <32>;
+	};
+};
+
+&i2c9 {
+	//INLET & OUTLET TEMP
+	status = "okay";
+	tmp421@4e {
+		compatible = "ti,tmp421";
+		reg = <0x4e>;
+	};
+	tmp421@4f {
+		compatible = "ti,tmp421";
+		reg = <0x4f>;
+	};
+};
+
+&i2c10 {
+	//HSC
+	status = "okay";
+	adm1278@40 {
+		compatible = "adi,adm1278";
+		reg = <0x40>;
+	};
+};
+
+&i2c11 {
+	//MEZZ_TEMP_SENSOR
+	status = "okay";
+	tmp421@1f {
+		compatible = "ti,tmp421";
+		reg = <0x1f>;
+	};
+};
+
+&i2c12 {
+	//MEZZ_FRU
+	status = "okay";
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+		pagesize = <32>;
+	};
+};
+
+&pwm_tacho {
+	//FSC
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
+	fan@0 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+	};
+	fan@1 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x01>;
+	};
+};
-- 
2.7.4

