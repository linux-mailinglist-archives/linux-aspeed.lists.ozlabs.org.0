Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B332AF1F8
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Nov 2020 14:22:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWQPl6Gm9zDqpL
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Nov 2020 00:22:19 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::234;
 helo=mail-lj1-x234.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Uj1A0Cfb; dkim-atps=neutral
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWQPS2F0PzDqpG
 for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Nov 2020 00:22:03 +1100 (AEDT)
Received: by mail-lj1-x234.google.com with SMTP id v20so2037666ljk.8
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Nov 2020 05:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=9r8b49v3ljRgTZvFAK4d4bWtQHAXArk3oNTb3u4fiLk=;
 b=Uj1A0CfbE2XeLHe3CdC7MeMYY0nAH9W5JXxtsE8KohRUij0Es6UpaHYgTSKcmRncl9
 lzwd+FfeMJ0+f1sFzz47qsO+XzzHkwNW6IoK65hYUsifHPOJzhXbY2vm3Q/vmiJejbUC
 SWJKePFV3pigYGgp0CeESneg1CAObVqHpXs2MkIPwApV4s4QV61YsWqkqMGJwnFjSBkl
 q0sKJRKTq0c+E3i5QHDqmSKx6B7LH5cYOPPaGvWL7ei3GqKlTbCeLnT8Mg7lBEhe3hul
 ANoHR8qJO4zWa8NBOth12VbLxl8FzSOrf+6vVpKGbDZHg9NjgGDRErjBcF+CzweJOw7M
 oTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=9r8b49v3ljRgTZvFAK4d4bWtQHAXArk3oNTb3u4fiLk=;
 b=hGmkhwO43YQjyl+4vx958hnDJNRoKYitRxKzbHsciBRizCSzGcwytddNwFPLuNYtnv
 94aDxm6HOtcIvWfQ0Y2axKUbucHtTdaEEvGdmVwQEVffXOzmcGeR0DSIXnreV4HPn4ey
 z/R6EN4lcqokYlNke879JAYbyglmrjAkyu5+2cf+Lx5fW7MOaJeRU0Do4ytXfSChCZnF
 X7WUikjD02bZ/zWCU9Q9kAFSC5MmWfEveor8K+ZkEQs6R4UsBLUtNQv5Gyl1ol95g3nb
 fIR0+38ZEYEt/pAL2COuL7ON8lypTZGmQ94YC67QLq1UqID44ZoD7r4UN8Ng3kctAovc
 Xs/g==
X-Gm-Message-State: AOAM531HYwceyp+g+60anHoY/kJJGI8VZkvlrkHr7MJoZWgFHXtw+GG6
 i9UjQ0CfNfAQV51ODGWptn0=
X-Google-Smtp-Source: ABdhPJzN/eXdGxoCDY5GlSXpuq9R04QSHslNVJU7LNNoweciGDxkm1itgTaG89BpzFa6dKVqTrmopw==
X-Received: by 2002:a2e:90cb:: with SMTP id o11mr2572076ljg.465.1605100918885; 
 Wed, 11 Nov 2020 05:21:58 -0800 (PST)
Received: from DESKTOP-GSFPEC9.localdomain
 (broadband-46-242-8-148.ip.moscow.rt.ru. [46.242.8.148])
 by smtp.gmail.com with ESMTPSA id z8sm235545ljh.74.2020.11.11.05.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 05:21:58 -0800 (PST)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH] ARM: dts: aspeed: amd-ethanolx: Add GPIO line names
Date: Wed, 11 Nov 2020 16:21:33 +0300
Message-Id: <20201111132133.1253-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.17.1
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
 aladyshev22@gmail.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, supreeth.venkatesh@amd.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add GPIO line names for AMD EthanolX customer reference board.
It populates AST2500 GPIO lines (A0-A7 to AC0-AC7) with AMD EthanolX
designated names.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
index b93ed44eba0c..96ff0aea64e5 100644
--- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -97,6 +97,50 @@
 		     &pinctrl_adc4_default>;
 };
 
+&gpio {
+	status = "okay";
+	gpio-line-names =
+	/*A0-A7*/	"","","FAULT_LED","CHASSIS_ID_LED","","","","",
+	/*B0-B7*/	"","","","","","","","",
+	/*C0-C7*/	"CHASSIS_ID_BTN","INTRUDER","AC_LOSS","","","","","",
+	/*D0-D7*/	"HDT_DBREQ","LOCAL_SPI_ROM_SEL","FPGA_SPI_ROM_SEL","JTAG_MUX_S",
+			"JTAG_MUX_OE","HDT_SEL","ASERT_WARM_RST_BTN","FPGA_RSVD",
+	/*E0-E7*/	"","","MON_P0_PWR_BTN","MON_P0_RST_BTN","MON_P0_NMI_BTN",
+			"MON_P0_PWR_GOOD","MON_PWROK","MON_RESET",
+	/*F0-F7*/	"MON_P0_PROCHOT","MON_P1_PROCHOT","MON_P0_THERMTRIP",
+			"MON_P1_THERMTRIP","P0_PRESENT","P1_PRESENT","MON_ATX_PWR_OK","",
+	/*G0-G7*/	"BRD_REV_ID_3","BRD_REV_ID_2","BRD_REV_ID_1","BRD_REV_ID_0",
+			"P0_APML_ALERT","P1_APML_ALERT","FPGA ALERT","",
+	/*H0-H7*/	"BRD_ID_0","BRD_ID_1","BRD_ID_2","BRD_ID_3",
+			"PCIE_DISCONNECTED","USB_DISCONNECTED","SPARE_0","SPARE_1",
+	/*I0-I7*/	"","","","","","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"ASSERT_PWR_BTN","ASSERT_RST_BTN","ASSERT_NMI_BTN",
+			"ASSERT_LOCAL_LOCK","ASSERT_P0_PROCHOT","ASSERT_P1_PROCHOT",
+			"ASSERT_CLR_CMOS","ASSERT_BMC_READY",
+	/*N0-N7*/	"","","","","","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"P0_VDD_CORE_RUN_VRHOT","P0_VDD_SOC_RUN_VRHOT",
+			"P0_VDD_MEM_ABCD_SUS_VRHOT","P0_VDD_MEM_EFGH_SUS_VRHOT",
+			"P1_VDD_CORE_RUN_VRHOT","P1_VDD_SOC_RUN_VRHOT",
+			"P1_VDD_MEM_ABCD_SUS_VRHOT","P1_VDD_MEM_EFGH_SUS_VRHOT",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"","","","","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","",
+	/*AA0-AA7*/	"","SENSOR THERM","","","","","","",
+	/*AB0-AB7*/	"","","","","","","","",
+	/*AC0-AC7*/	"","","","","","","","";
+};
+
 //APML for P0
 &i2c0 {
 	status = "okay";
-- 
2.17.1

