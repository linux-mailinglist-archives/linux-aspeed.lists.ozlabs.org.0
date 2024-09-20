Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2A697D174
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Sep 2024 09:05:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X93LT5WgNz2yXd
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Sep 2024 17:05:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::62b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726815919;
	cv=pass; b=RJMQZjVpi9mCbcTNGDl2/gw1J3iersB3BIuK5x5YcrdwlEl+8vQYb0aZslqG8gzYcynZ6mZK350ZwoSFdk3HbDwbae3ex+3OEUffPCsU9IchO2ffnAziSyD/tRTuwCTaRq6vDS45FLohGFHSY0/85vWUY7Ah34l4QxtoZanLLgXUnu6GNGtq0NvuIePc+S34O1uh+z7tsnAzM+tu6WOWl3AYJT9Bt4t3pC5Y/qWHZZvr5Yai+YQj/NmHeHWph6fTA2UZNfqpkNFoEkf+zboxeaAhF23uG3cuuYjPk19ZC6NsHmjvjOKn1pz1so3FCjqrOaKBSOCReHlk+eHqAxsLmw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726815919; c=relaxed/relaxed;
	bh=eJ/0lMMhAeIKfcwK1aKgPcEkNienEhojn0QdA3D1DB4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F2ILjx8cJV8m2ORpkdSm51ZCsSdJUd+FMvPVMwAuy91LD6Wqwy4e0iHERlzzplCV5840QWXmvH4rNCTD3aXGqVHeN7k0OtEM0V751s3/w/wzxCtm44IVXp8AeZv+vYGI7r6zlysccBHfmFiADQKXivjwx56zakJWFfw1yc+1bLI5l5WFV38Cv4XTj8Gyn9kNsQCOf4nEyHtBjHWJlFetulsVkcUJtTMjY2ACidsUiNxo0JROaNdUsXd1Aw+gMxM+MjOV/aExs5ykqTwvPsBf/Vq7ltzgm7u55q3g9l6J489cTPMQl2v5cv2tL1MYx8bzMsO1hZiwnqieGudsHTZLUg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=SAHgZ4qB; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feab::62b; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=SAHgZ4qB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::62b; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X93LR1V3lz2xLR
	for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Sep 2024 17:05:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLY/f7V2OQB4M2k+nj8QnOpaSHwn3LXoA6JTpoktYGjPPi7Vb3sQkPG1RODwwgVfGKWwng+hEkghz18hYB+1ieafnV5ajsvlcaZMRk4NYbCKS8LOkOi1s7mUMQnSTXI5XnFXvZ3DxkodpYVxEwyExckPrm3p678rnOZkePLcNN5WNDYM0ZiJ1E9Qv4VYhOtxhz4B55U/4wIHy509Eofx7hd7Bh2LtPuB92Yu+fW5c2CvVTz6mE4h6P6IfDM5DoGD4lRiebLciKPyq0rg3jwrR4gGRdtLOjpjso4mgN2KJ5VqpgClEkO71EJtS2IZzs0wV/dodukOZcAbMdH9MXCAmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJ/0lMMhAeIKfcwK1aKgPcEkNienEhojn0QdA3D1DB4=;
 b=qJ/PecMPT342nUqV35T1TZnGoUdMFesv6z8U3ny+oJ04mDKHr7DZPYaKWnT7QjNSxigs3Jl7YEJUmE6qf3mcZ0H73SkV0ZAM46U+ILgTD0B1gXEukZrtaJF4iKMCsgMStQCxxM5FzEoB6a7gbcKbJBTa8wUFX0Ey2RlwNxqvNq+bQn36S4XIUuGCNlXoAPhWJqGzBDABpCDZ25yGPJNLvWT3PfwvSGmG7FzI6SAsCvEsKxli2dbQitcuAtNzNLgNpUkWdK4knX5WCW8nlp1TuG5ULjmVXbupF4/bBuVjOsgzzOkTGbew68S7P1us9z0Oxa3AZeHkYhFakH9igVu66A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJ/0lMMhAeIKfcwK1aKgPcEkNienEhojn0QdA3D1DB4=;
 b=SAHgZ4qBnAop3fnNK3yAP916WERQhnFa6MUp7KysGmM2bonLIUbupf+rVAv5E6pxo7gpp1giImCidgC+tLqhH5P6Bl9uKX4cf0hMieZQSlanq4DPMY8kPJEa28H9361VV9CM4pbbjAzlrOmXub5CKaJzZxj9vbH6+yfijzYYcrrwqtt5CzeF8ZytzmOPqpIMxKggPtxxSvCeVuSpe9P0Fbg8P+IRB/g4yll2OtDkVNeHuxIy2GXboEZcJsibVpf1+GVhjlixR3KxavXgy+290S0faONcODCtsj9GWQARgDW5VyM6jHhszAxg+AYLcc2p9UcEv1/fFNDahKaC+Iet+A==
Received: from SG2PR02CA0107.apcprd02.prod.outlook.com (2603:1096:4:92::23) by
 TYSPR04MB7867.apcprd04.prod.outlook.com (2603:1096:405:89::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.18; Fri, 20 Sep 2024 07:04:57 +0000
Received: from SG1PEPF000082E3.apcprd02.prod.outlook.com
 (2603:1096:4:92:cafe::73) by SG2PR02CA0107.outlook.office365.com
 (2603:1096:4:92::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.25 via Frontend
 Transport; Fri, 20 Sep 2024 07:04:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E3.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server id 15.20.7918.13 via Frontend Transport; Fri, 20 Sep 2024
 07:04:55 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v19 1/2] ARM: dts: aspeed: yosemite4: Revise i2c-mux devices
Date: Fri, 20 Sep 2024 15:04:48 +0800
Message-Id: <20240920070449.3871705-2-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240920070449.3871705-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240920070449.3871705-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E3:EE_|TYSPR04MB7867:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a380f36e-48bb-4557-7895-08dcd94288ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?2Z4vNQbdFQiXhQQ2L/b0TtLEM+Xmp41ojVw7zqdK73Zeu7AdcfkQXOkUoinw?=
 =?us-ascii?Q?nYprf/ETdbQvoIZX6tWOCfiGAOvRkC6fRa4e+RVJvaipgesqpWblrknpSeWw?=
 =?us-ascii?Q?iHgm/Vr1HGqsN5aBPYJUL8GsVOmHfq0818cNQJMhCaNdXQRvf5sDXjI22mtu?=
 =?us-ascii?Q?9R+KTVwqasYmdqDfPKWJNN1+PRnVuZGFYCe09lB43FZMRW6mYISGrnIXPMRs?=
 =?us-ascii?Q?36An/Mo5haSmb7dwE8kDX1c/JnA0X32HuRVY94a/T/RqBuZj1jxV8uEsW3mN?=
 =?us-ascii?Q?p6ZMXCNubC+rcyQMJSLQfYP4qHpuDeTpDihCY1o4zveKlJScoSdVJ6SmnkZ2?=
 =?us-ascii?Q?VnvH2Uj/K9YCKYm+f7SnJMjinHID7gPGUH32t0qLcL845BSoy2b/zS88VFMq?=
 =?us-ascii?Q?IPfrD/ggwVPpIZiBd3cOC7iTeU9dwW+yyCtZyVOjsRCN8QhvJNr7cp5VTFft?=
 =?us-ascii?Q?VN6zfjeM2Ug164pMG0xf5y1RC5p7S0htLIDKHk3GnPAVa/5HayGsysDZYObg?=
 =?us-ascii?Q?eqmJ0mpAoIexrACUAU3ha1yVcwR38AuG/i8DLjXH7T9gmmbxCZXsZg7LHC0x?=
 =?us-ascii?Q?xptOYv+rPXz6yrNJRDw3W7TJfez96xrfmhOdrV0Bn4TWMzF126zSr7ulfkdT?=
 =?us-ascii?Q?JTIz6Cjk2eYVelEmOtKA6/ZWT/tyApKTtfY7wD0zQtv4tQDnoFLMo3Crmwbj?=
 =?us-ascii?Q?L0+ts9qXxIub9ksqR2fJJPH86x5L0s2eDLxU7v9K/QF3BAg/3twoeQZ96uCN?=
 =?us-ascii?Q?pdfk18pdaF/4sqzbV4sOE93k7B3B526Shi9NSyy7pt5w3IF7PRUIyrw9joUx?=
 =?us-ascii?Q?TT65bvJOapdSjeE1lqoTwFRphYqu29IK4OF3Rf++jTV/4VFquhkv7Nn50t9v?=
 =?us-ascii?Q?i/C+PWsdmUsr53lNCA0zm6/QXiJalf4427shhCB8PO7lw0z5EY97986k2MpY?=
 =?us-ascii?Q?nqulyQOgExZTazIsTfN5qAdDH/ENvTYJ6dNHCT38xfw5+TAqRUcYc3cghY7D?=
 =?us-ascii?Q?lgW4HkSeiCCA9QejMJVZurikf8SiJwo2BiNRJWeHSrpq5vTp9JR3e1VGdwif?=
 =?us-ascii?Q?vmNQDw+ThxYbN5raJ5I+/OntZ3/PieoJaTRoT1UNwrGL0YbLs+oXNFHcsWyc?=
 =?us-ascii?Q?Mm4wqufcJKm+XPcrVJB377CkSIKFtP+0Ti+ZwswlN1tIF3QRkvRwEkpVOurK?=
 =?us-ascii?Q?fG0ow4xNRkStw4eIOfi4kqhF8ZgiN64GT+dAdEU3rateHaEAw136nXt6gyd4?=
 =?us-ascii?Q?kM02UCp3vACmQ3VJetdTc241/fOVoDJcPaK4NGXOto3EP9FZHzfImWwjVShf?=
 =?us-ascii?Q?+VT/urGAL/ip5h2HQkrs9plHsxVKMEqf4BZfUxPWmF9sTNa4qPcR1SL7l73K?=
 =?us-ascii?Q?p7GpokgX/szyd4vbtct+RAYtIp0l?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 07:04:55.7883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a380f36e-48bb-4557-7895-08dcd94288ba
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7867
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>

Revise Yosemite 4 devicetree for devices behind i2c-mux
- Add gpio and eeprom behind i2c-mux
- Remove redundant idle-state setting for i2c-mux
- Revise address of max31790 devices after i2c-mux.
- Fix warnings reporting by dts checking tool.
- Remove led_gpio pca9552 since there is no binding document.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 539 +++++++++++++++---
 1 file changed, 466 insertions(+), 73 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 98477792aa00..6b4efb5fbd83 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -17,6 +17,29 @@ aliases {
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
+		i2c24 = &imux24;
+		i2c25 = &imux25;
+		i2c26 = &imux26;
+		i2c27 = &imux27;
+		i2c28 = &imux28;
+		i2c29 = &imux29;
+		i2c30 = &imux30;
+		i2c31 = &imux31;
+		i2c32 = &imux32;
+		i2c33 = &imux33;
+		i2c34 = &imux34;
+		i2c35 = &imux35;
+		i2c36 = &imux36;
+		i2c37 = &imux37;
 	};
 
 	chosen {
@@ -255,41 +278,327 @@ power-sensor@40 {
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
 
 &i2c10 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 	bus-frequency = <400000>;
+	i2c-mux@74 {
+		compatible = "nxp,pca9544";
+		reg = <0x74>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		imux28: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			gpio@20 {
+				compatible = "nxp,pca9506";
+				reg = <0x20>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@21 {
+				compatible = "nxp,pca9506";
+				reg = <0x21>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@22 {
+				compatible = "nxp,pca9506";
+				reg = <0x22>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@23 {
+				compatible = "nxp,pca9506";
+				reg = <0x23>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@24 {
+				compatible = "nxp,pca9506";
+				reg = <0x24>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-line-names = "","","","",
+						  "NIC0_MAIN_PWR_EN",
+						  "NIC1_MAIN_PWR_EN",
+						  "NIC2_MAIN_PWR_EN",
+						  "NIC3_MAIN_PWR_EN",
+						  "","","","","","","","",
+						  "","","","","","","","",
+						  "","","","","","","","";
+			};
+		};
+
+		imux29: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
 };
 
 &i2c11 {
 	status = "okay";
 	power-sensor@10 {
-		compatible = "adi, adm1272";
+		compatible = "adi,adm1272";
 		reg = <0x10>;
 	};
 
 	power-sensor@12 {
-		compatible = "adi, adm1272";
+		compatible = "adi,adm1272";
 		reg = <0x12>;
 	};
 
@@ -348,22 +657,89 @@ eeprom@54 {
 };
 
 &i2c12 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 	bus-frequency = <400000>;
 
-	temperature-sensor@48 {
-		compatible = "ti,tmp75";
-		reg = <0x48>;
-	};
+	i2c-mux@70 {
+		compatible = "nxp,pca9544";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
 
-	eeprom@50 {
-		compatible = "atmel,24c128";
-		reg = <0x50>;
-	};
+		imux34: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			temperature-sensor@48 {
+				compatible = "ti,tmp75";
+				reg = <0x48>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c64";
+				reg = <0x54>;
+			};
+
+			rtc@6f {
+				compatible = "nuvoton,nct3018y";
+				reg = <0x6f>;
+			};
+
+			gpio@20 {
+				compatible = "nxp,pca9506";
+				reg = <0x20>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@21 {
+				compatible = "nxp,pca9506";
+				reg = <0x21>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@22 {
+				compatible = "nxp,pca9506";
+				reg = <0x22>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@23 {
+				compatible = "nxp,pca9506";
+				reg = <0x23>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+		};
+
+		imux35: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		imux36: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
 
-	rtc@6f {
-		compatible = "nuvoton,nct3018y";
-		reg = <0x6f>;
+		imux37: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
 	};
 };
 
@@ -380,6 +756,8 @@ ipmb@10 {
 };
 
 &i2c14 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 	bus-frequency = <400000>;
 	adc@1d {
@@ -440,43 +818,39 @@ eeprom@51 {
 		reg = <0x51>;
 	};
 
-	i2c-mux@71 {
-		compatible = "nxp,pca9846";
+	i2c-mux@74 {
+		compatible = "nxp,pca9546";
+		reg = <0x74>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-
-		idle-state = <0>;
 		i2c-mux-idle-disconnect;
-		reg = <0x71>;
 
-		i2c@0 {
+		imux30: i2c@0 {
+			reg = <0>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0>;
 
 			adc@1f {
 				compatible = "ti,adc128d818";
 				reg = <0x1f>;
-				ti,mode = /bits/ 8 <2>;
+				ti,mode = /bits/ 8 <1>;
 			};
 
 			pwm@20{
-				compatible = "max31790";
+				compatible = "maxim,max31790";
 				reg = <0x20>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 			};
 
 			gpio@22{
 				compatible = "ti,tca6424";
 				reg = <0x22>;
+				gpio-controller;
+				#gpio-cells = <2>;
 			};
 
-			pwm@23{
-				compatible = "max31790";
-				reg = <0x23>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+			pwm@2f{
+				compatible = "maxim,max31790";
+				reg = <0x2f>;
 			};
 
 			adc@33 {
@@ -488,45 +862,34 @@ eeprom@52 {
 				compatible = "atmel,24c128";
 				reg = <0x52>;
 			};
-
-			gpio@61 {
-				compatible = "nxp,pca9552";
-				reg = <0x61>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				gpio-controller;
-				#gpio-cells = <2>;
-			};
 		};
 
-		i2c@1 {
+		imux31: i2c@1 {
+			reg = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0>;
 
 			adc@1f {
 				compatible = "ti,adc128d818";
 				reg = <0x1f>;
-				ti,mode = /bits/ 8 <2>;
+				ti,mode = /bits/ 8 <1>;
 			};
 
 			pwm@20{
-				compatible = "max31790";
+				compatible = "maxim,max31790";
 				reg = <0x20>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 			};
 
 			gpio@22{
 				compatible = "ti,tca6424";
 				reg = <0x22>;
+				gpio-controller;
+				#gpio-cells = <2>;
 			};
 
-			pwm@23{
-				compatible = "max31790";
-				reg = <0x23>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+			pwm@2f{
+				compatible = "maxim,max31790";
+				reg = <0x2f>;
 			};
 
 			adc@33 {
@@ -538,43 +901,30 @@ eeprom@52 {
 				compatible = "atmel,24c128";
 				reg = <0x52>;
 			};
-
-			gpio@61 {
-				compatible = "nxp,pca9552";
-				reg = <0x61>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				gpio-controller;
-				#gpio-cells = <2>;
-			};
 		};
 	};
 
 	i2c-mux@73 {
 		compatible = "nxp,pca9544";
+		reg = <0x73>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-
-		idle-state = <0>;
 		i2c-mux-idle-disconnect;
-		reg = <0x73>;
 
-		i2c@0 {
+		imux32: i2c@0 {
+			reg = <0>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0>;
-
 			adc@35 {
 				compatible = "maxim,max11617";
 				reg = <0x35>;
 			};
 		};
 
-		i2c@1 {
+		imux33: i2c@1 {
+			reg = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0>;
-
 			adc@35 {
 				compatible = "maxim,max11617";
 				reg = <0x35>;
@@ -584,6 +934,8 @@ adc@35 {
 };
 
 &i2c15 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 	mctp-controller;
 	multi-master;
@@ -596,9 +948,50 @@ mctp@10 {
 
 	i2c-mux@72 {
 		compatible = "nxp,pca9544";
-		idle-state = <0>;
-		i2c-mux-idle-disconnect;
 		reg = <0x72>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		imux24: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+		};
+
+		imux25: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+		};
+
+		imux26: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+		};
+
+		imux27: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+		};
 	};
 };
 
-- 
2.25.1

