Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1992A986AD9
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 04:11:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDcXb1f8Pz2yY9
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 12:11:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727316681;
	cv=pass; b=EnNUW3opvpTJFp7aHmTDfb2P3UH7461tu3RC4d/D2XzgFeFYESTqulLwuBwG/Q0cXzBakb71M5J3k9NKfWZ4BunPAau0zl8Z7Sp6hwdqCmfFxb+4Jru0OAoojwAEXjkVRu4HbTwL7fi4v6x6gv8JlBCTIEEoReuyVY3xGLlNy4b03TFyyCyaZ0oSsoa7DMpa8PeQMqGbOdQwYuDU16ai3y7nepae/gTxNFo7vKBaOAZOPtHa9z1sodS9XiidkKSGW0H7ccs97zcFm30jUlEz5rJM8ik998Sv5rlAXSPgC295i4qWiV5wk5p/N1sgeUKNVaMrPUfh85jwoO75lZn0tQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727316681; c=relaxed/relaxed;
	bh=9Pz43d4tpHHltUWAWzFExl3maBWLBxmL+WyB1PRmziU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Y1/JPdyrEMIMs2gKmwjZM7I3ii8WGOAFcK3YVgTk7LVTf5j9KmTfQLlNmos0SyYEN02HAG2mHcKhtjFUj9eEjZ39es/XS+lmFIjYI1ZvYm513CTQZvMIqBzsBvOmzrwcRUS8sMXUtlThwlo0E27REvW0H2j00iGd8+oeE3OeRRJbgbB8gn+nupdi715lRVh8uJD8IxLaF9fASEFAee3z4qr0Zry/rLuHBLXXlulPUD5WYPnlufkio1DmECjX+MJIFM71aNUeoVTX3Xl2vPgUrYMNqDSOle1+kbSwaxqGfi5KxHa+oa4WOFyOoSJQA9vx3zrRndwmeZfeWoZaG+5Ong==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=cyFMVtJ2; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c400::2; helo=hk3pr03cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=cyFMVtJ2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::2; helo=hk3pr03cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazlp170110002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDcXT1LRvz2xjv
	for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Sep 2024 12:11:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/zSbIStV5G0H7j7mlcUnZZDbpOEl3esgrPQYBnoFkhesLk7D/RGF2ZWcYv03oOOAiEJPvQ60uqbAMBQ62bcu9AHvs+ZI3vNmzNBtvD11N/IaVYAdV9vaEN4Xud+XkkRb6g+KCFOw8B8qCp92HHRJGTCcbgIpHWGNjo9rDJ6St9wP6yPcDrOxrfpHFS9AaCeRlhXpsGazPjRfHg/tEc6ayWd4r3NVfwJmixcztL3U3Bk3frcnMDJtoNJlJYZv/mvZPNlyrrS+csMTBXI9DsEyc2L85VsAjWhGGcCDrOxcZjN6spb3UtC1iqbDnsDOzCtzKT0b7FPLSML8ILk47BJVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Pz43d4tpHHltUWAWzFExl3maBWLBxmL+WyB1PRmziU=;
 b=Zkot8ztjz2crUEByHLLfTR37rl9jA0n8RpUTTcWmV81k4s8dA4WvNwzJVWmcG012Qdw4RgQZbxk5JcadeQnD2dubqjCLFcCL31YMnUQ0THDMDsgMHIVS/bmYYeN5dYf8zocAD0BCz5V8ldmhq8BKjMhR9imweozF6ziS64GcHy8irSCaY6LLYtgF8IV8LcXuDTHo9V9OPPV7f7vwDofBRvTMCPeOsjqv7cxg+C/z+hq5NxXGhrA8k15lckETUBg00jjQZZkVnxGfwK9dqEPs5aU4+jNvt3RNBO6x2dfjRTjy+46TM5+TX+C9E8G9aEXaBAFKKvYK+JqCGlc9ipFCOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Pz43d4tpHHltUWAWzFExl3maBWLBxmL+WyB1PRmziU=;
 b=cyFMVtJ2CJ7Zlsh1RQJFVkCoFUsW3hWeV5pW+qlD27ia7dLdgIDqvBmV+9IH3caWCm+kjFRMLXfg+IjDycwIGugX8chYDcOdUun+tr6nk3JzIznbGpSXKXCy6EdG2fcgYUvK9XiI0i0RuZz/+umxMWVcxUbk6jVTzEmUsojfJlCJMSFZepQ5Or3OBvsf8Zi84yByL6TGhJmlO+cr5YyU9dElKfQy0xg4cEkknrHMzNEtAhf1phQ6NI/c+ERilYUqcZn9KB8Am932uvUrIP7tKhqGczQ1uyiq2+wg1oYhAvjVMZnowS843/6Y6BTfJYwt2DAGJ9pEQbpGs6wlKitFvg==
Received: from SI2PR01CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::15) by TYUPR04MB6792.apcprd04.prod.outlook.com
 (2603:1096:400:35f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Thu, 26 Sep
 2024 02:10:53 +0000
Received: from HK2PEPF00006FAF.apcprd02.prod.outlook.com
 (2603:1096:4:191:cafe::ef) by SI2PR01CA0015.outlook.office365.com
 (2603:1096:4:191::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20 via Frontend
 Transport; Thu, 26 Sep 2024 02:10:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FAF.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Thu, 26 Sep 2024 02:10:52
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v1] ARM: dts: aspeed: yosemite4: add i2c-mux for all Server Board slots
Date: Thu, 26 Sep 2024 10:10:50 +0800
Message-Id: <20240926021051.3782377-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FAF:EE_|TYUPR04MB6792:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a9dddc45-2896-45c4-9c3b-08dcddd072fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?pZ70diJrAFlq6vFNGFgPy9lVi9r4OHwgdPNQWeyX8eNhf9cpPtEZ5ZrkMkqY?=
 =?us-ascii?Q?ZRIb367d3j49qnee0LzYWgSNDyODFbUhfcPYfo2ByUYb18I9yq/uAF2eXRHk?=
 =?us-ascii?Q?QjnrPmfzwMKG62Hf6r196+ZRd3JMfEh1XKdCi2qE0biJ6D/+MwrERAuqGm6W?=
 =?us-ascii?Q?e9H7IXebKEFN+1XOrHyFH5i+C5VcE27IBAthhDZOciWwCA2sdYjFl7zoydXE?=
 =?us-ascii?Q?9iySUfviinzigmqYzFCKViC9eWIsE8gK0si32Zr+y9VidpE57FjlCN+9xSbH?=
 =?us-ascii?Q?Vld6QRxJl4/m+h0yK7rDpb1t/wgWHHQKUhnzimJRhlaCLpTGyYbs87DEeNc5?=
 =?us-ascii?Q?6mZOsOGdfqABc4HX0+pnf8CYHukQadBaGXdq++4lx1XC2Cl6EhfalOHoLJzO?=
 =?us-ascii?Q?14b/PiyWuASRjHlF2FyfutPn2e3n4H02WK1lvrSogEWK7LER5hwraBUw9DpX?=
 =?us-ascii?Q?/EBoefD6N4yfz5ejX6mRULYZz3J6CUZwLi2ONXhRS3ZgojgBJOm38sUO6FlL?=
 =?us-ascii?Q?b69OWSHUDythWxW2eH729BKmNqgzJjWJ0yhhmb3XRV6yDQgdMfitWkvpF9p6?=
 =?us-ascii?Q?y20RS7Q50w2WBK+zeWUPoDtYdJjRiOCLIB/qEIfwv0TmxuqvPDAXHOaQo1f3?=
 =?us-ascii?Q?mlNAMelMpRhf2m719cEYeHXDc+mawSSmOkC/g2zFDK529rHx1/YE5XNIZ7Ig?=
 =?us-ascii?Q?1UnDoBzdAMN+7IJuv4/LObviSpv84ofCnC7hZZTBAzg0ZKbdh/CvamdbTtK3?=
 =?us-ascii?Q?npEig4Y07poGxBlaLKlcZSMW46gmeKQYzeq1wYDvvCt8f5/X9qL4j5rE4jWR?=
 =?us-ascii?Q?+6uJVJRROPU0ycfWMN6mV/v2YWnWDMtCYFnQHk2qV2H7RsM8c9610/yH56a8?=
 =?us-ascii?Q?C/srHKBnS3ngUP9rq50TLe6cjAvIo31kllIXQMqAusuduS5oo9SMrmhvhBJp?=
 =?us-ascii?Q?vJAKCU3OOLerCIQl+OSwFRvks4UcdOUsXuP3Ny/KbMK0IMvDtY+uS6pnffK8?=
 =?us-ascii?Q?la9n9ZCRRCrw5l6JkgW17UgYcuHCpNNGjwaS1lIV/94FI14owVMERd1ykXOi?=
 =?us-ascii?Q?SpYKiXzl6rC0vDJxoz+73iobCf8RiwbrSz59icykaxWRD67yocWIYFDj2ZOq?=
 =?us-ascii?Q?Auo57rmWLDZqgvLp7b9wHQ8oHGqB/4jOMah004p6LBLXIoQu50OaUdWGLgV4?=
 =?us-ascii?Q?jE3HqN0kb622L1HGzWZ8nrSdSwPNAqIOee1blC8NXe1v9p8G4Lr3T/+HVJ38?=
 =?us-ascii?Q?jE/2w1rz76p1v16q23iPo/49NGCIMb7Zra47WJpkJ26CyTUA62K070kc0YA+?=
 =?us-ascii?Q?XnaZX1NdSaX9+04eKYTwM+77zEt/M7iMIcnryERsOtPVb3qoy2KPYiDKdlA3?=
 =?us-ascii?Q?xtYSACnigCaZezcOdQTyEOXRQjlAKa8gmbewZGMNNxTmeEkE7IeN6zHBmKaJ?=
 =?us-ascii?Q?f6vuHoCx26Vutdyu8udkm5AgtBlKFhet?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 02:10:52.9492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9dddc45-2896-45c4-9c3b-08dcddd072fe
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FAF.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR04MB6792
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, Delphine_CC_Chiu@wiwynn.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>

Add i2c mux to 8 slots of server board and add the io expanders and
eeprom for the slots.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 239 +++++++++++++++++-
 1 file changed, 235 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 98477792aa00..95ebdf54615d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -17,6 +17,15 @@ aliases {
 		serial6 = &uart7;
 		serial7 = &uart8;
 		serial8 = &uart9;
+
+		i2c16 = &imux16;
+		i2c17 = &imux17;
+		i2c18 = &imux18;
+		i2c19 = &imux19;
+		i2c20 = &imux20;
+		i2c21 = &imux21;
+		i2c22 = &imux22;
+		i2c23 = &imux23;
 	};
 
 	chosen {
@@ -255,24 +264,246 @@ power-sensor@40 {
 };
 
 &i2c8 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 	bus-frequency = <400000>;
 	i2c-mux@70 {
 		compatible = "nxp,pca9544";
-		idle-state = <0>;
-		i2c-mux-idle-disconnect;
 		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		imux16: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+
+		imux17: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+
+		imux18: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+
+		imux19: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
 	};
 };
 
 &i2c9 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 	bus-frequency = <400000>;
 	i2c-mux@71 {
 		compatible = "nxp,pca9544";
-		idle-state = <0>;
-		i2c-mux-idle-disconnect;
 		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		imux20: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+
+		imux21: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+
+		imux22: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+
+		imux23: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
 	};
 };
 
-- 
2.25.1

