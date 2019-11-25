Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCFE108E69
	for <lists+linux-aspeed@lfdr.de>; Mon, 25 Nov 2019 14:05:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47M6hB0TSFzDqby
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Nov 2019 00:04:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kpFkmbDD"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47M6gf53N1zDqcn
 for <linux-aspeed@lists.ozlabs.org>; Tue, 26 Nov 2019 00:04:29 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id j12so6483757plt.9
 for <linux-aspeed@lists.ozlabs.org>; Mon, 25 Nov 2019 05:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=qGezSPv9jvcj/7xKFa9KZTI9OMyO6N5DYb75LLWYBuc=;
 b=kpFkmbDDgsjT6k7lYYUGqtww5039GLqzwJS2PndxMuQwWtfm+CdpU5acLe4TDKHKyB
 9PUXMpOQRqusDRFNkZ3bmg4jJytYgADZ/+E/O+oHv3/0jNSx0GoSZ3Q5/zR9a1iONIEO
 JfoTNyATWDXwVX2Cv0m/wjpXrAkVgsxg/H1KuuyLC02LLkS+FblWYBd4dKqBQfsNkXAl
 Oj4hgoEwE2pfUdddLgdvmYIMTdKw4LGRYnxW9uY+gwIpwGOwfOpBsgsOMe3zC4wk506P
 rcK87N+mtizhp8B8XqDNRYMAsQh31gojSQqW3Dp2DDBaGfGZ/4Hd+CSvRKQX2wkzsk8v
 jLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=qGezSPv9jvcj/7xKFa9KZTI9OMyO6N5DYb75LLWYBuc=;
 b=saoDpH8wYUURK1//GGNJ5BnJkMo1523uytO+8P4BVTkuBqgJqtcfVpfsEX2aXsF00Z
 ayhdZwwhnnTgCfO66s69uVyabHqGR5FySwuIyGwP8PTqFF1tNSXGIYCK1MOo6QX15+W3
 IFARbBg3oRlgCLHARJ7yTGQPtoiCONO3YwZRVe03zOVFpuuTXRZ43EoUex8uO3i4eWQ+
 fleoyVVg9dwKmVwCIPMB/sGav4sBNlXa2PrJbRs0r99VY1xN3H7bQb2Bb4umoiqBpY0P
 z1E6L2LUHOUE62lb0RoYcazxqH01NM0GDsoSqeiNnlDZ5U8jvfs2hHI66lrc0A3UlTUo
 x5Kw==
X-Gm-Message-State: APjAAAU39ZuPPe+HfVrY571aAphriD8nIX3R6tlgQgHNfWO1FPTqx4Di
 TTboSfu72BnnjQmDAwv+1L4=
X-Google-Smtp-Source: APXvYqwkC+fd2MEbWas3tM4hFlRaxLaPx3Z5euuU8J3AD+bQgaEKba8isM885BEFVMhJl6QMRQGLdw==
X-Received: by 2002:a17:902:b482:: with SMTP id
 y2mr28918431plr.128.1574687067822; 
 Mon, 25 Nov 2019 05:04:27 -0800 (PST)
Received: from cnn ([2402:3a80:42d:2c57:5d0d:9f5:fef:e996])
 by smtp.gmail.com with ESMTPSA id v189sm8793680pfv.133.2019.11.25.05.04.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Nov 2019 05:04:26 -0800 (PST)
Date: Mon, 25 Nov 2019 18:34:20 +0530
From: manikandan-e <manikandan.hcl.ers.epl@gmail.com>
To: andrew@aj.id.au
Subject: [PATCH v3] ARM: dts: aspeed: Adding Facebook Yosemite V2 BMC
Message-ID: <20191125130420.GA24018@cnn>
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
Cc: devicetree@vger.kernel.org, manikandan.e@hcl.com,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The Yosemite V2 is a facebook multi-node server
platform that host four OCP server. The BMC
in the Yosemite V2 platorm based on AST2500 SoC.

This patch adds linux device tree entry related to
Yosemite V2 specific devices connected to BMC SoC.

Signed-off-by: manikandan-e <manikandan.hcl.ers.epl@gmail.com>
---
 .../boot/dts/aspeed-bmc-facebook-yosemitev2.dts    | 151 +++++++++++++++++++++
 1 file changed, 151 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
new file mode 100644
index 0000000..09bffcd
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2018 Facebook Inc.
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "Facebook Yosemitev2 BMC";
+	compatible = "facebook,yosemitev2-bmc", "aspeed,ast2500";
+	aliases {
+		serial4 = &uart5;
+	};
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200 earlyprintk";
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
+	use-ncsi;
+};
+
+&adc {
+	status = "okay";
+        pinctrl-names = "default";
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
+	status = "okay";
+	//FRU EEPROM
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+		pagesize = <32>;
+	};
+};
+
+&i2c9 {
+	status = "okay";
+	tmp421@4e {
+	//INLET TEMP
+		compatible = "ti,tmp421";
+		reg = <0x4e>;
+	};
+	//OUTLET TEMP
+	tmp421@4f {
+		compatible = "ti,tmp421";
+		reg = <0x4f>;
+	};
+};
+
+&i2c10 {
+	status = "okay";
+	//HSC
+	adm1278@40 {
+		compatible = "adi,adm1278";
+		reg = <0x40>;
+	};
+};
+
+&i2c11 {
+	status = "okay";
+	//MEZZ_TEMP_SENSOR
+	tmp421@1f {
+		compatible = "ti,tmp421";
+		reg = <0x1f>;
+	};
+};
+
+&i2c12 {
+	status = "okay";
+	//MEZZ_FRU
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+		pagesize = <32>;
+	};
+};
+
+&pwm_tacho {
+	status = "okay";
+	//FSC
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
+	fan@0 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+	};
+	fan@1 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x02>;
+	};
+};
-- 
2.7.4

