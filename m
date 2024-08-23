Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8143995C5B5
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Aug 2024 08:43:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqrBK1nxhz300B
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Aug 2024 16:43:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724395414;
	cv=none; b=DyTmp96f4hBBTfYPcCDHajYQ0fHKDPTmXx6hqWC6GoHAaUBV4aiwJ2l/R+Q8zm+27iIcC5Mb7GQRPihyoOTKg0G/u3cD7VWs2/hdIgx8qwMd+xpRqLjBYSCUHzOjsFbkaQ4hlZJ/Z7TXazIc0ZGdk1eSYalLRCxwzCVGP9cTVD89KETTy73Bt03cPaiPnKqf94hlcDxFSiMaYDICvRDKct5nzCZwciqRIPCVhWw+Tgq12P6Ae1KOAYLRZ9eQMo3yk6yNohyjg0FBPm0GD9K8oUxOOC6QCHNezl9qwugcWwzd2eFMCxLlwzMuIt8brA3YLW140KhSZC9Pe0XpRBWwoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724395414; c=relaxed/relaxed;
	bh=u9haRtJlDhH3as0n0sIs6bufmr/5Xn4xEdxe/ZlTMKs=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key; b=Lmut04VJgrE76a7PgHhOuVL8xLHLfP6hRZMwLz0jdViiBhl1ystkFxsTiXW4ak7kn67ECp9tny0qViG1ITb4OWyE9TbQ5hu7Vbs3yIk2mIx9XEZ38HlCPW1KEKW07+aKqNlTAg5vqKgBMPONw9HUexkDKRflEVc2xxDSeBS5/LlSq4AVkS2b8Huv5E/LUKI5ezmxASaHtGXgolPkhXtpidrrcGobIC7HDVlQ+dMjGrJ0GI0YDoVXiW97IaZ3EBCtnXpzNz7TwwRp73rdb6iqtakmzDLGxnLtqVh7gVrnlaqYmGGgF9fNE0/uLSxYJzYbsyKzPwmmSOQ7i5UUkVqvFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TySe+Nqx; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TySe+Nqx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqrBG3j9Zz2yGD
	for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Aug 2024 16:43:34 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-202318c4f45so16070465ad.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2024 23:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724395412; x=1725000212; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9haRtJlDhH3as0n0sIs6bufmr/5Xn4xEdxe/ZlTMKs=;
        b=TySe+Nqx0gw68pEFVSSFhgjvJB2dI5KchGvomooUprGeux6hSPXcjC++Y5eRTFfs9Q
         dBX/ssfDyA3j7rCL/EZOMSegQN9RNr1DvnYNDMPuF8hSyB6xoDK7MbM4c1flWrlT24EB
         0EFZCp6H9c2HZVIpLs3BMCk29djtHJDm6oVsdfoXJDu3YWII73TM+dUSHua+VFB5JI1F
         DoRg+pP585thseu2ep4Er4CbQ5zjQ96nMX54pKVikSyFjHdnRm72s9yjNNueM+I8r5Df
         ccyzCZZXTJdkdn6SRUUExzUG6mds8qVAbtuhkNzLpxckeyO3kOon7f9nn3wnl1R66g1A
         qPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724395412; x=1725000212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u9haRtJlDhH3as0n0sIs6bufmr/5Xn4xEdxe/ZlTMKs=;
        b=CTmX1P74eg4HfiTnAf89PVQgCGG41jnZdxaYP4NKbfMRACJSCAIYlUD/VnEGGA0yRT
         crjSbV1aFcoXRh7JTxNTSz7fTPlYIVP0ChK9ErcsVV3qIubS6IdfwyItKL/bmm6Fuz4+
         dQYKv9OsFZE5Se4gGpfwWxHw1KaHyCEIZx11HePDDGvr5CVgApdqD+ixbn2IL4EJ7EXm
         18SUXpMqF8y8KGpWXmpCzoyqBpsZTZ3GPtzrtf9+wD5yZutr4p5FwSlF9h2ZE5r0C4eT
         D2FwZ/bTquM9UgRAqFZT3o0rb4OqCUokwt2LD31ad6EgetNU+wXNyfJalZX5YGNkQfiK
         y/Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWo8+shB2WsjFkoETiqnUqQx0QBbhI68aN477eIhNB7pGVnKLJyBrq8hOm+Pec9zEUu7WogT1kEsG1DXD0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy4/GLeeylJGsxx6ZUba2x8JuWyjibSUB10D6FILT4X1okDlYBV
	uUW3zJ0iR+ghAiLN8PINVPFRjs8pDU1mVsjILJHG9kxhMfcWuOh7
X-Google-Smtp-Source: AGHT+IGHykukqXZCzMYZVYv87LpFox5BqZBfXjmpajZXWlmjvOg6skq9Mncp7YM2zOm8mjE8YAroaQ==
X-Received: by 2002:a17:902:ccc9:b0:203:a0c7:3156 with SMTP id d9443c01a7336-203a0c73186mr12510605ad.5.1724395411681;
        Thu, 22 Aug 2024 23:43:31 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385565468sm22339945ad.11.2024.08.22.23.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 23:43:31 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 23 Aug 2024 14:41:10 +0800
Subject: [PATCH 1/2] ARM: dts: aspeed: catalina: add pdb cpld io expander
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-catalina-ioexp-update-v1-1-4bfd8dad819c@gmail.com>
References: <20240823-catalina-ioexp-update-v1-0-4bfd8dad819c@gmail.com>
In-Reply-To: <20240823-catalina-ioexp-update-v1-0-4bfd8dad819c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724395406; l=4747;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=8B2Kdifg6ohVXbBcb3ikIS2CYpY8L4Xytwog8dey6KQ=;
 b=M9JD45yHv2R8YpQiCh7GfQE1oGz/q/z8CmjFuFDwq4to3offqfYPnUn6fjJdwm5TPjdveOA+Z
 dt/h24syl+nCjA53OEiQMSH+a0OCTotHzzYXg3ZZ8Vt4MI1YJlbAZEX
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add more IO expanders which emulate by PDB CPLD.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 131 +++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index a62c30f2c0df..3a00182084a5 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -762,6 +762,66 @@ eeprom@57 {
 
 &i2c14 {
 	status = "okay";
+
+	// PDB CPLD IOEXP 0x10
+	io_expander9: gpio@10 {
+		compatible = "nxp,pca9555";
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
+		reg = <0x10>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	// PDB CPLD IOEXP 0x11
+	io_expander10: gpio@11 {
+		compatible = "nxp,pca9555";
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
+		reg = <0x11>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	// PDB CPLD IOEXP 0x12
+	io_expander11: gpio@12 {
+		compatible = "nxp,pca9555";
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
+		reg = <0x12>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	// PDB CPLD IOEXP 0x13
+	io_expander12: gpio@13 {
+		compatible = "nxp,pca9555";
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
+		reg = <0x13>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	// PDB CPLD IOEXP 0x14
+	io_expander13: gpio@14 {
+		compatible = "nxp,pca9555";
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
+		reg = <0x14>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	// PDB CPLD IOEXP 0x15
+	io_expander14: gpio@15 {
+		compatible = "nxp,pca9555";
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
+		reg = <0x15>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
 };
 
 &i2c15 {
@@ -977,3 +1037,74 @@ &io_expander8 {
 		"SEC_FNP_L_CX0","SEC_FNP_L_CX1",
 		"","","","";
 };
+
+&io_expander9 {
+	gpio-line-names =
+		"LEAK3_DETECT_R","LEAK1_DETECT_R",
+		"LEAK2_DETECT_R","LEAK0_DETECT_R",
+		"CHASSIS3_LEAK_Q_N_PLD","CHASSIS1_LEAK_Q_N_PLD",
+		"CHASSIS2_LEAK_Q_N_PLD","CHASSIS0_LEAK_Q_N_PLD",
+		"P12V_AUX_FAN_ALERT_PLD_N","P12V_AUX_FAN_OC_PLD_N",
+		"P12V_AUX_FAN_FAULT_PLD_N","LEAK_DETECT_RMC_N_R",
+		"RSVD_RMC_GPIO3_R","SMB_RJ45_FIO_TMP_ALERT",
+		"","";
+};
+
+&io_expander10 {
+	gpio-line-names =
+		"FM_P12V_NIC1_FLTB_R_N","FM_P3V3_NIC1_FAULT_R_N",
+		"OCP_V3_2_PWRBRK_FROM_HOST_ISO_PLD_N",
+		"P12V_AUX_NIC1_SENSE_ALERT_R_N",
+		"FM_P12V_NIC0_FLTB_R_N","FM_P3V3_NIC0_FAULT_R_N",
+		"OCP_SFF_PWRBRK_FROM_HOST_ISO_PLD_N",
+		"P12V_AUX_NIC0_SENSE_ALERT_R_N",
+		"P12V_AUX_PSU_SMB_ALERT_R_L","P12V_SCM_SENSE_ALERT_R_N",
+		"NODEB_PSU_SMB_ALERT_R_L","NODEA_PSU_SMB_ALERT_R_L",
+		"P52V_SENSE_ALERT_PLD_N","P48V_HS2_FAULT_N_PLD",
+		"P48V_HS1_FAULT_N_PLD","";
+};
+
+&io_expander11 {
+	gpio-line-names =
+		"FAN_7_PRESENT_N","FAN_6_PRESENT_N",
+		"FAN_5_PRESENT_N","FAN_4_PRESENT_N",
+		"FAN_3_PRESENT_N","FAN_2_PRESENT_N",
+		"FAN_1_PRESENT_N","FAN_0_PRESENT_N",
+		"PRSNT_CHASSIS3_LEAK_CABLE_R_N","PRSNT_CHASSIS1_LEAK_CABLE_R_N",
+		"PRSNT_CHASSIS2_LEAK_CABLE_R_N","PRSNT_CHASSIS0_LEAK_CABLE_R_N",
+		"PRSNT_RJ45_FIO_N_R","PRSNT_HDDBD_POWER_CABLE_N",
+		"PRSNT_OSFP_POWER_CABLE_N","";
+};
+
+&io_expander12 {
+	gpio-line-names =
+		"RST_OCP_V3_1_R_N","NIC0_PERST_N",
+		"OCP_SFF_PERST_FROM_HOST_ISO_PLD_N","OCP_SFF_MAIN_PWR_EN",
+		"FM_OCP_SFF_PWR_GOOD_PLD","OCP_SFF_AUX_PWR_PLD_EN_R",
+		"HP_LVC3_OCP_V3_1_PWRGD_PLD","HP_OCP_V3_1_HSC_PWRGD_PLD_R",
+		"RST_OCP_V3_2_R_N","NIC1_PERST_N",
+		"OCP_V3_2_PERST_FROM_HOST_ISO_PLD_N","OCP_V3_2_MAIN_PWR_EN",
+		"FM_OCP_V3_2_PWR_GOOD_PLD","OCP_V3_2_AUX_PWR_PLD_EN_R",
+		"HP_LVC3_OCP_V3_2_PWRGD_PLD","HP_OCP_V3_2_HSC_PWRGD_PLD_R";
+};
+
+&io_expander13 {
+	gpio-line-names =
+		"NODEA_NODEB_PWOK_PLD_ISO_R","PWR_EN_NICS",
+		"PWRGD_P12V_AUX_FAN_PLD","P12V_AUX_FAN_EN_PLD",
+		"PWRGD_P3V3_AUX_PLD","PWRGD_P12V_AUX_PLD_ISO_R",
+		"FM_MAIN_PWREN_FROM_RMC_R","FM_MAIN_PWREN_RMC_EN_ISO_R",
+		"PWRGD_RMC_R","PWRGD_P12V_AUX_FAN_PLD",
+		"P12V_AUX_FAN_EN_PLD","FM_SYS_THROTTLE_N",
+		"HP_LVC3_OCP_V3_2_PRSNT2_PLD_N","HP_LVC3_OCP_V3_1_PRSNT2_PLD_N",
+		"","";
+};
+
+&io_expander14 {
+	gpio-line-names =
+		"","","","","","","","",
+		"FM_BOARD_BMC_SKU_ID3","FM_BOARD_BMC_SKU_ID2",
+		"FM_BOARD_BMC_SKU_ID1","FM_BOARD_BMC_SKU_ID0",
+		"FAB_BMC_REV_ID2","FAB_BMC_REV_ID1",
+		"FAB_BMC_REV_ID0","";
+};

-- 
2.31.1

