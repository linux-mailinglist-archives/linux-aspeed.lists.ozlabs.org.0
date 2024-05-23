Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 854E28CCDF7
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 10:11:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=bSBL/wk1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlLMR0xd2z79CJ
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 18:05:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=bSBL/wk1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlLLs3SFPz78yd
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 May 2024 18:05:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fw5+FmCCzi+3QNC5WRo8mTT5z5bSEY6BaGuva/k91tYgk3iSx13Qrr9T1zdwWdpWdCFcyobtjfEOrB6oy806VJDiXoRO2+VMlrE4rSnZWOh5IsEysQ24CCHbOOvxXSHQh9FIHIckC/sEkhcD01BrQBUwb+Z/UnR1722wrw7nqNKiS8HYFx2M+FnDhu0bmRAQJpTqXdDy1Q8ZTIzxEi/VFKCOknE62V9yPqGs/M3yCRjLFNJ+/+LwHlou//V+n/Jo3LzosPjm2fm2QnwB/Ow9Db2lzn8uV+Dy4Gt5Q34BOYo/TcSBpiBVubzGjVTAb4SSIpLeq1VTzEWLwCTIvtLWtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ES3SdMSGvrNhfRoLPeIA0V55NxyaiAY/qzb3Em1tHrY=;
 b=KqucQJsYv0CjpbrkYf5Omt96zhPC4UHyoKTvL+jWbOx3kiab6AElowF1rmmCxHzCuRhHTGAOIfr3Kh1qI20nnEk6YHI15wS8llmn0rW3+X+Ga5B/qOUxpnRFTYHO3bIx5qiKNv3MRxWjB90OjgMzuVe0wJiuGQzda1tct6o5JkP1iOQWMB5dvy44H0J4t4Tpmno5KJZdnTAmMap2IOwL1kvjks0LOBvDg4wZOOspVFgRpiW/aAkAPTHD1/CXLTbRfopaq3lya9iXYN5ts+B8VccTY6gboL9E+8Ph24c4bMcOzgsvboZdvbgebfc8b/hdMys2o0rtIu3q0WbE0iNm8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ES3SdMSGvrNhfRoLPeIA0V55NxyaiAY/qzb3Em1tHrY=;
 b=bSBL/wk1hjKogOUn69YxPogxyPlLnH7NLzh0G4fy/u22sR0seihqR+D8himJyYo2bxKMTgRBkukPBDFzIWcCam2cdHXdJ/IqKHya1S2ClL3qCkM+zo0hXL6GoFwvxz8lVLNZsOXnr3jN87DQR5/swF+DUpFA525foWG4pTlldSQIBw+/WDZq5zxblryDbaDJuaH3M/9uV7M3ArjXcIufAf1dXksaM7UeePi4Dhwb/a6by2XLebvWlU/sraoeExJqQiW94MbfhEmDNq/ZnKbFyoBY/9jMFs0R+mRCDGmx8dQVRZ+giGQ2Ij9X6MqSfFnPgj34agwjdL8rqN8D2Dfp3A==
Received: from SG2PR04CA0151.apcprd04.prod.outlook.com (2603:1096:4::13) by
 SEZPR04MB6874.apcprd04.prod.outlook.com (2603:1096:101:e7::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.22; Thu, 23 May 2024 08:05:01 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:0:cafe::3) by SG2PR04CA0151.outlook.office365.com
 (2603:1096:4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.21 via Frontend
 Transport; Thu, 23 May 2024 08:05:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024
 08:05:00 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v8 19/23] ARM: dts: aspeed: yosemite4: support mux to cpld
Date: Thu, 23 May 2024 16:03:24 +0800
Message-Id: <20240523080330.1860074-20-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|SEZPR04MB6874:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 026daf43-558e-47e4-a01a-08dc7aff0bc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|82310400017|1800799015|36860700004|7416005|376005;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?5JBuktmbbEE8SCC46ciczCE1tyGhHMc62c2yx8akVgDA31Z7T9hEWjiA+cNh?=
 =?us-ascii?Q?II9iweoZlQcJ+l+o0zQC+0sTag0ZWDuphj0YxCnbQXZaRPS1Flh3qH8aHtFL?=
 =?us-ascii?Q?boPCxiuEfEAO3xVa+f8tnFCGB1wvhAi/Os4EDE9DSBldbIHwWGsf0K7wbv5I?=
 =?us-ascii?Q?5RDXx+NXk5laEmGZ0dwF10qs9F8/4uKup0Zv+CjzRoN1Lvhn4YvfzmCbQ3bq?=
 =?us-ascii?Q?mb8UkBSNgl6jGqIvRgCbr5hrWwAAUAZOscv8yK0RSdiZEkCPnaYDlaJuxfbm?=
 =?us-ascii?Q?9PIkVAyjO1UnDOOntWR9ksCaFSPDPyhdPLl7m52pQqrdsorbcG2ldcL4wpDn?=
 =?us-ascii?Q?qwf3+NNj1LL6PCAsFOUMjzS/CQil6j46T1TWgzm1zxwrvSAlK6LMAzDlCU7I?=
 =?us-ascii?Q?0vLMoPwpztAaXpoQJ7fZL6y8AetSSYOcItcP/qdtUhqKSShT0VhRSHWA9NWx?=
 =?us-ascii?Q?R/LOb6jCQy7OEYs0O/GmuBiiEMYJGHDfqL2quvY9oaprPVc6WuqB+4mi9yR/?=
 =?us-ascii?Q?BxbIrf2Qyg7a6SCP2ihLd/MRvQjFdLUaM42uSE3+xHki4L1x0oC9nhbmngEi?=
 =?us-ascii?Q?pOK/Zcg/t8xqtyOYnrschdiifKrahphuWqSfogaEkhMSf5FqkSZGLiMMwdfG?=
 =?us-ascii?Q?cfgeivibHRlMdvOVUZauyN2rhDrp6XOCWp2KbDL7El/UP3tS9fbSMnyZcgaI?=
 =?us-ascii?Q?f/pcuRm8oyNB9W1LX6dyRe6pRS/Q/kgIm43JABRIeFy6t/RHGcorrFjXcbpt?=
 =?us-ascii?Q?Y/JNiqDc8QrV0Lb0yvQSa4TGUpxJWeohOmPPId8HdSjJG3Bq9YkVllCQXEUV?=
 =?us-ascii?Q?icO2j3lDXQh5ao34/ZFg2kEZ8ZRYo3FQS022vrQR3HwaNLmEk109nKn19v5K?=
 =?us-ascii?Q?fGNv9/cKFe3arQu4LO9xPmou43OJcD+dA7BFYv9oYl1Xapc2qySe8u8o8t2S?=
 =?us-ascii?Q?wEJp7NQp7BkK4xGdQVV4QB03nKABxeDRMhhkhdh1Y/N/MdJ6BaiL8b+4gH4g?=
 =?us-ascii?Q?8Hpdg/pFg2Pa35igB1iN58J0553so46lOFLpS4T8VHYh0fifU2AiwvRnPcgD?=
 =?us-ascii?Q?mO2y7mNNViy0UU3cg+kqKVME610pOeEUS/IJZ3+A/nZzMbW0E2t3gK2jLQ1c?=
 =?us-ascii?Q?WLcqwC3w2QqcGKYva7oJKMLuzn4GI+jnwwYCp55obpPKF9TQDSIfBius7/rR?=
 =?us-ascii?Q?vEFQOcv6U7VAbBAHoo249fwMXZjeNLFuaEywTEVqgACwmb4MwEAgW1nI9f0x?=
 =?us-ascii?Q?cR9zmV9u7ZehKD6oTkUc6qa/mLVE2JjZE78Th6GFGRJn/omqLnPUq3zWwCh2?=
 =?us-ascii?Q?kpAo0a4w/fgU7umghg2ghhUrT5iG1ftc4KDk6REpO5DXXJM48xmF5MTS8Hpj?=
 =?us-ascii?Q?J9KSm6eTvlUXWgwDI8wjojO8yRgY?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(36860700004)(7416005)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 08:05:00.5627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 026daf43-558e-47e4-a01a-08dc7aff0bc0
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6874
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
index 83c9d76f5a11..f4e37187bd5b 100644
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

