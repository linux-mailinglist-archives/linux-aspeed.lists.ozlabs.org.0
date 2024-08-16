Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC03995458A
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 11:26:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="::1" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Lpjh5alu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlc7B6P49z30WM
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 19:26:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::600" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Lpjh5alu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wlc78512Tz2yR5
	for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2024 19:26:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGalgoA6dyaNUVW5z5fFLf/9jcS2tzNNU3joh7M5uQaouX9v4552wpSifKMPYxlFXiqBIr+h5EPe27fLGkulJCajhtMWZBEZEsjhCWvCtjnoZ4YiixLwL+0jmNEQ5mUurkfqiL1q/24HuFUlj12vzPSqJjCUIEn9uvL6Eoa9iQ3fLdCALulq1DFPWERejxBi5PgrRkaT4alnbOtmumOwE9Po0hxwFHbQa3zPVVPM3fJzv6g/oKUcbFbl2zm1ulAyJ7pHY8EAPE8G8bsO4TOZTzwBueRiDbHfqsjtAGXiJL+OLW+bO4Fdrz92Y+L++bk4jrsyhp8NEPUCdyZDGNpOmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOLJimcPeCpdCfRBtB9HXjhtSG89GuCrW23kDWg2py8=;
 b=XSQZNIHriSLr1ru5r3oEeugspYnEO50YjsnT48QtaPcaUB89vddow+GUBKegaikzlCQ6T51cBjQ46Sxx+Y5bOPQImyPSLWcl+WHo5F2OvulVzNTWYEhPzfZnbp/7mN1EwbUzWEFFcVy0lWWt0FD5i+g3ZYBxw0aaHX5ps3UQ3fttN9rOzWM2K6f3uzjBwOcl4A6agbIVyHORIq0YGg6JD/h6EaXGKcJP81OThG7/LCJy4DAM8EKVTfYr7FjKXFgusCkG8qE8t8Z01BShxZ6qWUn5cQZHnh/H+RV9N+MBjeb/d88fQN6Z8cj3zXyczTEdPKh11RUy3RkAlDwqTKspeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOLJimcPeCpdCfRBtB9HXjhtSG89GuCrW23kDWg2py8=;
 b=Lpjh5aluIX2Ird1X+AIV33uMpKjnosQ8rBVRJPovWmJQSx//KOQV0GHf96IcXIgH4lnJb7zBEgTooZYo6Yr0p+jxbqpIGptk8OSEH91BmEhsd+pgWdE3ZI43FpUkF9j51zItxjxph3P/a7r+zn4c5uJ3tj86ib9oM627YdeNgdSTi89H+DvNCPWfvuxNhD74WFivrZEptps+FbdjfSxJBcrq21OGcZhNhdy1eGouh5kQ7tvPgqpeG3VukVtT7LromK4GDG2yU2HTB7wTKzYnNk05DqSoQ/Ku2//ETQS97ZcPrRk1+fvY0+AWeKpRCDSxVDszpOOdiljcsTIaIICScQ==
Received: from SI2PR01CA0048.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::17) by SEYPR04MB6629.apcprd04.prod.outlook.com
 (2603:1096:101:c7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 09:25:53 +0000
Received: from HK3PEPF0000021D.apcprd03.prod.outlook.com
 (2603:1096:4:193:cafe::4a) by SI2PR01CA0048.outlook.office365.com
 (2603:1096:4:193::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.24 via Frontend
 Transport; Fri, 16 Aug 2024 09:25:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021D.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server id 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 09:25:52
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v12 19/28] ARM: dts: aspeed: yosemite4: support mux to cpld
Date: Fri, 16 Aug 2024 17:24:06 +0800
Message-Id: <20240816092417.3651434-20-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021D:EE_|SEYPR04MB6629:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 75648114-326c-49ac-118d-08dcbdd56c95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?wvazU9EwbO9oR9ept9vTAG6qporGJ/3hEW79STtJGfFdBLTAhmyOaisAj2fF?=
 =?us-ascii?Q?kmVO4elEPuM8YFdzbKiHHC1+f3yizuXEjl/N0zaaaQQrRNOhNYePZ3WWw0o5?=
 =?us-ascii?Q?YoPsdiTmlZAM24/XcU9cKn/OeAe/B1u0jsXlxesM9DZrASkZZj2WqjfOJM3m?=
 =?us-ascii?Q?G84Pjz0qBkTSyK35o+C4MeFyljuY41BFfRNWkz5qdJvhxwdDQNMZnLTIV2In?=
 =?us-ascii?Q?eJ+Q/FJMz1Pa19sUIA7CHc7dRzngikgyvVlObiS4BizCtYEkUUjh+Ntb/xXG?=
 =?us-ascii?Q?8Zbbn6Qr8k0UZ2JRbz7m6wqTedTSm87nv16/A8Qm+7h9NA5/cwPEFYWATTt1?=
 =?us-ascii?Q?f0f9aMruJ0uoStCzdc7X/RWC+Nf5LfIV5xLMeBzjOeDNIm+BSM678hgspsR7?=
 =?us-ascii?Q?kB5K7T80t48S0NUF4JySlemRsjX8tVdKSstzILnUjShKwHEriWMWtcrBsnk9?=
 =?us-ascii?Q?xRSmRFc57rdXi8y4B+/Q57hmS+2gyOQux2kOmTl9/XmEdWlk354VKhszny86?=
 =?us-ascii?Q?cJAEAn1tYNnNyLdPBCxmnx7bRwwH4ClTNQS1J7jASnUtuZ+wBkwgritaByeU?=
 =?us-ascii?Q?N56QbtsYQrBNhu5jy3j5LweRuGoHP6vZsOk5EPWGPxfNQK13TErVCGGkWWzG?=
 =?us-ascii?Q?zZtKR2L+YiXOhiDDk7qVGNv3Nx8a+K6sa6VDbvAzlrjrBcZCVeFwrkXK8gX0?=
 =?us-ascii?Q?HiMuShxu4jXmx/nObA0/PwBllu4S5T4Ts9QfR3dW4R5qS1XZ1mFgRRNS6MPo?=
 =?us-ascii?Q?IH9y18j2DTx0/rjJd5IX7mRFRPRxrDMzWvh1AccLjLy8m2JR2K+rxgqiTuN9?=
 =?us-ascii?Q?H/OdEovMy/2+wrLjM6ZR/fEVA9F5oGuV8UrICvdPT0vZz2DBCZvnkmR8IUJm?=
 =?us-ascii?Q?vF0fXCwW8cOqK3Zsbt9t9RNrMr/Q74X2KNuYkAn0gfBqTnjpx3L0vw8cERJz?=
 =?us-ascii?Q?gi6TGhdxElYoDEbLmakx3DEsqDulN1z37WB+5IMJdw69XstpID37bi/vdz9v?=
 =?us-ascii?Q?+2umo4pYl8FqNH1y6EuKP22puCwSSfOeQ9McRixf2WujNk9ApiCE0/XjCdwf?=
 =?us-ascii?Q?BEpY6r1DDRovBJGJj/JYvmVlk9/UtOwih2Vja8n/M7LxPuaO8sUKrLUet/ni?=
 =?us-ascii?Q?E6erRwiFvXZG3quazQm29+q46Mw6b76cOUjmeFCEoWYBwP7ile72v32GmJiL?=
 =?us-ascii?Q?XLjEgOEWVYIjjQInirphG6UCrk3QantbYFSEeYr4G+6QvEpGXpUg2eJqNLQQ?=
 =?us-ascii?Q?XYCcbOIk1omO57jSsqcFbw2EU/LtGZi06fRnQe3nVoPgEwnl9mVdHbM6eyOr?=
 =?us-ascii?Q?19TBHYonXNExuZILcsYb8YHQbKhsQimFjIrMeQdh+mxLdJjLPQhz0cY816bW?=
 =?us-ascii?Q?kuPBLGUQ2T1rxixlHo7IVEm/6An+eeeXwYO1/jswUnr1cyY6cppxb2KfPsy/?=
 =?us-ascii?Q?tuniynjRKPXz/GM4a+R3Sb2PTj6qkGNt?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 09:25:52.4972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75648114-326c-49ac-118d-08dcbdd56c95
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB6629
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

Mux pca9544 to cpld was added on EVT HW schematic design,
so add dts setting for devices behind mux pca9544 to cpld

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 64 ++++++++++++++-----
 1 file changed, 49 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 7b8a2384d99d..98eeee49b082 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -36,6 +36,10 @@ aliases {
 		i2c31 = &imux31;
 		i2c32 = &imux32;
 		i2c33 = &imux33;
+		i2c34 = &imux34;
+		i2c35 = &imux35;
+		i2c36 = &imux36;
+		i2c37 = &imux37;
 	};
 
 	chosen {
@@ -951,24 +955,54 @@ &i2c12 {
 	status = "okay";
 	bus-frequency = <400000>;
 
-	temperature-sensor@48 {
-		compatible = "ti,tmp75";
-		reg = <0x48>;
-	};
+	i2c-mux@70 {
+		compatible = "nxp,pca9544";
+		i2c-mux-idle-disconnect;
+		reg = <0x70>;
 
-	eeprom@50 {
-		compatible = "atmel,24c128";
-		reg = <0x50>;
-	};
+		imux34: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
 
-	eeprom@54 {
-		compatible = "atmel,24c64";
-		reg = <0x54>;
-	};
+			temperature-sensor@48 {
+				compatible = "ti,tmp75";
+				reg = <0x48>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
 
-	rtc@6f {
-		compatible = "nuvoton,nct3018y";
-		reg = <0x6f>;
+			eeprom@54 {
+				compatible = "atmel,24c64";
+				reg = <0x54>;
+			};
+
+			rtc@6f {
+				compatible = "nuvoton,nct3018y";
+				reg = <0x6f>;
+			};
+		};
+
+		imux35: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		imux36: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux37: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
 	};
 };
 
-- 
2.25.1

