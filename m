Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EDD1069FD
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Nov 2019 11:30:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47KCPc4HpJzDrJf
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Nov 2019 21:30:44 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fWB0qAhi"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47KCPN4jxqzDrD2
 for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Nov 2019 21:30:32 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id p26so3284429pfq.8
 for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Nov 2019 02:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KZF4nCg+mr6Tu7VsbFdxmJAwi8ka4CeGB3j0/tQUh5Q=;
 b=fWB0qAhi80fT+Q/RQ4rWbGdN28X7xewAfOZCug4QaKIQuw3pBgWLvWdanya5EjKNsY
 uA0MY2/5Ao72E5fmBT0xrPh2z2ouGbMatpGmufUyjoPziIAbW06cymmArvFfcFugSzEY
 pCJSJXdezGTB1OqJIa3HgOYNZhrTLQRf0r4LobJn4Y/Z7hNCgl/+F4TzTK5euJxHLtuJ
 jcPAcLm0gy5stx3QrMpA50j8kHh//UbZVdkJ7duKZH3Nj+/CD38YUmJ6CQ5ugSDaz5aF
 SxeZ5g5SqpDasHHoTL0m887lrtqeSayGmJhke7iH+Et8bZZ5Way9/fR6ai9FmN4JhYhW
 ytZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KZF4nCg+mr6Tu7VsbFdxmJAwi8ka4CeGB3j0/tQUh5Q=;
 b=KvUj5nXdJkO6MvycYzfh3SPydSUxVnZq6V7eEO6k2qsz+ZhthG7kU+LsilNyOhRHnf
 Vc7wfwNY5FDSop/s7geuL3/o9gCKAkXqYnem7R8kBNBVOZ1Bxh4xwGMKL9DXbqP444Dv
 LXLC6dERHn78oD6uk3c9eTieBiv+f/oAayrk8y4cbq71f+GYA2WXmt1SofpRPmz6F0eD
 /BlboqZ5O7IEKYYlrl/wZ2rZUPXZwSHoXv/0JT2VjzrMjDaqAX0cQduHfq717J8DkJDB
 vPTeRRR7bsbgYoxjHlp4bMI+BdlM4qu9XKC23CF7WIZMH4r4OnH0EEKz8CTycHr7inxc
 RkWQ==
X-Gm-Message-State: APjAAAWj89lrOaSq1GLvgx1rUSjUn+64lcBndNxsUIjGW6FMmaRx57Mp
 45asUKwb92oAV2EUe6vvHI4=
X-Google-Smtp-Source: APXvYqycOpmM/n3thMeej5yGENE2TyzgFM6MbEvwtSCL1aM0q8MUKsgmF/CiLfo61cTKps1pxWyPDA==
X-Received: by 2002:aa7:9639:: with SMTP id r25mr16489748pfg.17.1574418628685; 
 Fri, 22 Nov 2019 02:30:28 -0800 (PST)
Received: from cnn ([2402:3a80:46d:ffdd:5d90:34b2:635a:ec78])
 by smtp.gmail.com with ESMTPSA id f59sm2247416pje.0.2019.11.22.02.30.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Nov 2019 02:30:28 -0800 (PST)
Date: Fri, 22 Nov 2019 16:00:22 +0530
From: Manikandan <manikandan.hcl.ers.epl@gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Adding Facebook Yosemite V2 BMC
Message-ID: <20191122103022.GA15913@cnn>
References: <20191118123707.GA5560@cnn>
 <b2f503f0-0f13-46bc-a1be-c82a42b85797@www.fastmail.com>
 <D34D3A2F-9CD5-4924-8407-F6EB0A4C66B5@fb.com>
 <20191121074843.GA10607@cnn>
 <0fce7468-bb35-4d47-8d5d-abc228e99085@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fce7468-bb35-4d47-8d5d-abc228e99085@www.fastmail.com>
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


From 9a17872b5faf2c00ab0b572bac0072e44a3d8b91 Mon Sep 17 00:00:00 2001
From: manikandan-e <manikandan.hcl.ers.epl@gmail.com>
Date: Thu, 21 Nov 2019 11:57:07 +0530
Subject: [PATCH] ARM: dts: aspeed: Adding Facebook Yosemite V2 BMC

The Yosemite V2 is a facebook multi-node server
platform that host four OCP server. The BMC
in the Yosemite V2 platorm based on AST2500 SoC.

This patch adds linux device tree entry related to
Yosemite V2 specific devices connected to BMC SoC.

Signed-off-by: manikandan-e <manikandan.hcl.ers.epl@gmail.com>
---
 .../boot/dts/aspeed-bmc-facebook-yosemitev2.dts    | 152 +++++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
new file mode 100644
index 0000000..5f9a2e1
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
@@ -0,0 +1,152 @@
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
+		serial0 = &uart1;
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default
+		&pinctrl_adc1_default
+		&pinctrl_adc2_default
+		&pinctrl_adc3_default
+		&pinctrl_adc4_default
+		&pinctrl_adc5_default
+		&pinctrl_adc6_default
+		&pinctrl_adc7_default
+		&pinctrl_adc8_default
+		&pinctrl_adc9_default
+		&pinctrl_adc10_default
+		&pinctrl_adc11_default
+		&pinctrl_adc12_default
+		&pinctrl_adc13_default
+		&pinctrl_adc14_default
+		&pinctrl_adc15_default>;
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


On Fri, Nov 22, 2019 at 09:16:39AM +1030, Andrew Jeffery wrote:
> 
> 
> On Thu, 21 Nov 2019, at 18:18, Manikandan wrote:
> > 
> > Hi Andrew/Vijay,
> > 
> > Thanks for the review .
> > 
> > The following changes done in dts and tested in Facebook Yosemite V2 
> > BMC platform,
> >   1. LPC feature removed as not supported .
> >   2. VUART feature removed as not supported.
> >   3. Host UART feature removed as not in the current scope.
> >   4. ADC pinctrl details added in dts.
> 
> Can you please re-send the patch as a v2 and inline to the mail rather than
> as an attachment?
> 
> Cheers,
> 
> Andrew
