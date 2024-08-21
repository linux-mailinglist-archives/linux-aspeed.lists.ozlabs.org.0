Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6554B95973C
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 11:42:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WphFY293yz2ygy
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 19:42:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::62e" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=NA9I77tQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::62e; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2062e.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WphFV3Msnz2y1l
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2024 19:42:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KjsqkYXxbmnLk6X2ifXdJxRwbgFaFQUBtvsTCDaD9Mo/p+J1aQRgYob7dw1mhCkHqWjCPcyXaPxUnzRS0/Xc1n6D/i7ZgrGtEE438wbUu7ZgPPioiTqyzzHELevGm0zr5Mwh2jThud5aXPWFwtx8iZG7GmC2OUWWo+FcSaQQ3UIQTu7hfIr9lQDnYSEjJJsDcG0Ivwg3xsdqrhghgCkr288wCmAfBXDkVoBPppm9ps23+/Hcmc0KJnW0K5Gjm4TzSEgqjpP8tCi4Xr/SrNCmaWpo/U1BNKXyrUhBiAvavisL/oVE2drAKgF6Wy7BBpTCr6JNKrkjySSxDLHIykOWqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JazR4JFYH/44Q8aeFrnjOL2rYIPNbPmPhwoAEXWC6OQ=;
 b=JpAK/bOR9MVwfSR7bRVrlCvMIWH0ZPa+0akF0qUIJo30PK3zT5VTjZSE0jmjbcx7LLM0cgHP5MLhSiLyoj+8xtiLxhwVp58YlSc9bFrfA/INSHkukQgKOpKKKFsMvet7ZEDOflRfNO9rxNJp44PGlqepG8ZSiFNm67pESMm5bO8B/ok0DRIGvTZCBl51xG5P1ZnOjmBnoCT1q89nUPTdvaAswl18d1wJesaQkxpLR4eXfWsGfjJqhFJ1IQtS6+E/fAjySFypurMlqJQY+UQqM4prlD5Mv8psqYFNanEFOcZ714wMGddWTAh8I+/8VvgJMLktVPjh9EXtpl8yuZEsaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JazR4JFYH/44Q8aeFrnjOL2rYIPNbPmPhwoAEXWC6OQ=;
 b=NA9I77tQMnsLTdOtUUiFewd3ECqhacF6jMFTscyAFe7Zq0syr1QInLJBNnR7qHCDnbb63QVcxVL0/gMQNmRweBBAC4bdBoYN80hZq/Kp7iw6W0RGFJ4e82//NITC24j9aJYnG8lEU5p6fyMteO2YRLOgEdzRW2YRsX8tUYB4AvBIs3YjaTi9EgJBSjzVpYknz3io9n41NGY3gkDMKcZHiz/V5SA7UOtQ/A+IM2hXqkagKSORgF7nCKiFhEbrsT50w+9PNNTEyJVbBUstqNx1RNiQigzpAa/aG/+pxqSQTHiQaMkEX8ouO2NvWwZmVZ578cOsqd7mmm9vKa8vfzKm8A==
Received: from SI2PR02CA0029.apcprd02.prod.outlook.com (2603:1096:4:195::6) by
 TYZPR04MB5784.apcprd04.prod.outlook.com (2603:1096:400:1fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 09:42:02 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:195:cafe::12) by SI2PR02CA0029.outlook.office365.com
 (2603:1096:4:195::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18 via Frontend
 Transport; Wed, 21 Aug 2024 09:42:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024
 09:42:01 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v13 09/29] ARM: dts: aspeed: yosemite4: Enable interrupt setting for pca9555
Date: Wed, 21 Aug 2024 17:40:20 +0800
Message-Id: <20240821094043.4126132-10-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|TYZPR04MB5784:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ff17e67b-df52-4a86-2866-08dcc1c5827a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|1800799024|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?cN6iBVd9tVCyJa/BTeul0uKOgA/8m/JzOEEqaYI4lQru9KC9iEvHVBCTrO9T?=
 =?us-ascii?Q?pHXSDpz1nJmITvy66SudivYRCdrSgYsJeSCucvJD5ROOgGNqvXSww2xQXwX/?=
 =?us-ascii?Q?pzYf+xjUDQTFGebgqQLOWDfjbcQWFZC71NJ4A4q3NeYo09p2EBWWMh0AWs2c?=
 =?us-ascii?Q?rgho+84IlsgXj+VYcX5aTt3pF7j7myw5jkNZ+o1s6Q2UoaYn6/+JFq+t0Cn3?=
 =?us-ascii?Q?VLNYCXYw37H8PG7DgYkroxsrp+4FhbFBBBBMxCea7TQiSkPo1NwMV9tjuj5W?=
 =?us-ascii?Q?ELHrbU2106TS2i7Hc21eLHxvqN8LEN1m/tJ+07TMhUuWEhN3iUW6o9gmZvcu?=
 =?us-ascii?Q?JJ9X972jJeengWPVKGSAlZOrIAMe3Op1c1QRNaJrbMPoQJKk34JHHmS5rBGe?=
 =?us-ascii?Q?6VzFHQtYPcCgTr8/N3bx+KXaow3M69UYwrvkRlYjefY9y/5RD+uEpZwUr9oQ?=
 =?us-ascii?Q?1NPkWYHhwX2U4lvAq4Sn6p/vAHmF1UaVKDaxdqQJvILPQWaVCma4YbsLdBj7?=
 =?us-ascii?Q?h57UssOeAuqAK4qibKr5lAWanSF3cW7e2bmFUVwZBRXAdNdLQorNjaKBS1y7?=
 =?us-ascii?Q?bhOFKjZiNtRG6Iwu5M1S4o+DTd4qiHI+tZRSgvmj6dTRJqx09Vb3Pr8l/CZW?=
 =?us-ascii?Q?k/xpmMEj11ockHjEyjLdgcqXW1eqspVEyhV96CFbJUdvratgyCiw2kVcgxZ6?=
 =?us-ascii?Q?v/FB6b11iQxbJErNIDbnR41z84BkDlrlbznXkA/K42imaXkabpcJCZXdAmXP?=
 =?us-ascii?Q?e3sApLK5wn9ckDvc9qiHxjc70LeHSP6Y+Wwzn4fEgIMPv5F1golOqYbMTmpe?=
 =?us-ascii?Q?3h9ycUz46mW3cSw/SnTU6GJJvSwiC0TMmH/+3vnq1P/5IYqEeQ8WzzE+ODOG?=
 =?us-ascii?Q?3ACusFrGottaz8gpPInKkl5LJgtl1jDIpR4/I2N3boKLopkncrDh9m7YtkHm?=
 =?us-ascii?Q?nqex1SNmPV1r22Bg9u9W+Dzw6tPl+lzXCKpIzPizM7k4cO/wxt2a7LoESyZd?=
 =?us-ascii?Q?MarPLsUSlC3PhFEnBHQMJqGVAxtJazeCeH4XOStBnsM1xFaMkoPPPApdscuK?=
 =?us-ascii?Q?I0cPMj1NBrmzO3qb0YEzq5sApaD0T7z9dbjLo9phD6mrv/KyhLtAocthGQHv?=
 =?us-ascii?Q?h7NG+9HpN9UKDVn1fhtG8j9vgedW/ptAEo7a0MI6pJqmah8H8g3lFBXp66tz?=
 =?us-ascii?Q?W6sftMCa4RFkM61rcCX6rnDBXY4Otfa8qd+k9VMp+bl9G33coerX8hxSQ440?=
 =?us-ascii?Q?IVFYWojF6sC43Z/AbolOip1BAmqku80IydHMPgrEgGgvZjsQLaQf2/gRq5pN?=
 =?us-ascii?Q?8nCLu8Fj03dnG9hKTUvmp2O7YP/y9/ECbFJaHq31IOooFboLOWkkB7hi6OWG?=
 =?us-ascii?Q?DJk1AlTqw8UDPirTSEUbKPycWZX2u0ufnVLQmPg8m9IUzrp0lSVCr4OPl5KY?=
 =?us-ascii?Q?kWkfdeK9kLYK9lMWQd26etacAzHCsd6Z?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:42:01.5279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff17e67b-df52-4a86-2866-08dcc1c5827a
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB5784
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Enable interrupt setting for pca9555

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 56 +++++++++++++++++--
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index b11951c2f71e..09bbbcb192f5 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -832,30 +832,78 @@ power-sensor@12 {
 
 	gpio@20 {
 		compatible = "nxp,pca9555";
-		reg = <0x20>;
+		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
+		reg = <0x20>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <98 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+		"P48V_OCP_GPIO1","P48V_OCP_GPIO2",
+		"P48V_OCP_GPIO3","FAN_BOARD_0_REVISION_0_R",
+		"FAN_BOARD_0_REVISION_1_R","FAN_BOARD_1_REVISION_0_R",
+		"FAN_BOARD_1_REVISION_1_R","RST_MUX_R_N",
+		"RST_LED_CONTROL_FAN_BOARD_0_N","RST_LED_CONTROL_FAN_BOARD_1_N",
+		"RST_IOEXP_FAN_BOARD_0_N","RST_IOEXP_FAN_BOARD_1_N",
+		"PWRGD_LOAD_SWITCH_FAN_BOARD_0_R","PWRGD_LOAD_SWITCH_FAN_BOARD_1_R",
+		"","";
 	};
 
 	gpio@21 {
 		compatible = "nxp,pca9555";
-		reg = <0x21>;
+		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
+		reg = <0x21>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <98 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+		"HSC_OCP_SLOT_ODD_GPIO1","HSC_OCP_SLOT_ODD_GPIO2",
+		"HSC_OCP_SLOT_ODD_GPIO3","HSC_OCP_SLOT_EVEN_GPIO1",
+		"HSC_OCP_SLOT_EVEN_GPIO2","HSC_OCP_SLOT_EVEN_GPIO3",
+		"ADC_TYPE_0_R","ADC_TYPE_1_R",
+		"MEDUSA_BOARD_REV_0","MEDUSA_BOARD_REV_1",
+		"MEDUSA_BOARD_REV_2","MEDUSA_BOARD_TYPE",
+		"DELTA_MODULE_TYPE","P12V_HSC_TYPE",
+		"","";
 	};
 
 	gpio@22 {
 		compatible = "nxp,pca9555";
-		reg = <0x22>;
+		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
+		reg = <0x22>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <98 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+		"CARD_TYPE_SLOT1","CARD_TYPE_SLOT2",
+		"CARD_TYPE_SLOT3","CARD_TYPE_SLOT4",
+		"CARD_TYPE_SLOT5","CARD_TYPE_SLOT6",
+		"CARD_TYPE_SLOT7","CARD_TYPE_SLOT8",
+		"OC_P48V_HSC_0_N","FLT_P48V_HSC_0_N",
+		"OC_P48V_HSC_1_N","FLT_P48V_HSC_1_N",
+		"EN_P48V_AUX_0","EN_P48V_AUX_1",
+		"PWRGD_P12V_AUX_0","PWRGD_P12V_AUX_1";
 	};
 
 	gpio@23 {
 		compatible = "nxp,pca9555";
-		reg = <0x23>;
+		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
+		reg = <0x23>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <98 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+		"HSC1_ALERT1_R_N","HSC2_ALERT1_R_N",
+		"HSC3_ALERT1_R_N","HSC4_ALERT1_R_N",
+		"HSC5_ALERT1_R_N","HSC6_ALERT1_R_N",
+		"HSC7_ALERT1_R_N","HSC8_ALERT1_R_N",
+		"HSC1_ALERT2_R_N","HSC2_ALERT2_R_N",
+		"HSC3_ALERT2_R_N","HSC4_ALERT2_R_N",
+		"HSC5_ALERT2_R_N","HSC6_ALERT2_R_N",
+		"HSC7_ALERT2_R_N","HSC8_ALERT2_R_N";
 	};
 
 	temperature-sensor@48 {
-- 
2.25.1

