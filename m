Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6C7937393
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jul 2024 08:01:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=UWGZ//Vj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQJvz32BVz3fnF
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jul 2024 16:01:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=UWGZ//Vj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::607; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20607.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQJv71VbWz3fSr
	for <linux-aspeed@lists.ozlabs.org>; Fri, 19 Jul 2024 16:00:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODyfhJzzLyXc8uPh/zaDTbe2R7MCogbWtjfrWObwm8+wqgQlGNwgLluh2DQfuBhfWyXOyvnaPPgmph0y5nlsts3pb2ciO0JvbmFifHuHLoF67TREgg/LwthPYDBC5UlolxsoV0NMR91+MwQaM2ekXiDQp9x/tgC0az1w0eHyHz5F29Hh4BFk1DEs8rKbYwKw8tKl7L+uQ0tvG50m30+fy4+mVwi42YZPLthokn+tmeKFMN0pYYSxHGrUirbTetAb/85/hV6YA+FN/d/ZcczFKcWfDiF8yccvFUjd/+NNZ0oWNzbBlZfSy3ZY6jtyJGk2SY6W1pO36RVHHsjzO20BRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ES3SdMSGvrNhfRoLPeIA0V55NxyaiAY/qzb3Em1tHrY=;
 b=Rt2gpsws0Vc9zyTwWxMNNeJHyMhpT7KHJN9RuP/2ZS6lrCbbVyqpeKiXBDumrW6vMQbGrscPOvhbKcj6zBJ2B96jw0XKSkwG+GyJGVzWDVgvqMv0wNiR+9rYEZAxaqIr2ycpnXUUP87yfeld8Dw/ZKAIkw0LfA/1TbaijvT8XQ0/aWdFWSRWnmrYL7kaprXUwwoIc6MO2ul74DfHkPm5Iyi6lvwbgGX5bbAsVZjVjN3K5wplZgSh/1VwppqPwTejWlL0Dt/HOYChhzdlFmYFp+URfRQmDrvZuSAmOs44NrPTqlYBZXUX16UZfoNymdXYr0ldYj20dC//X/FV2CEMHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ES3SdMSGvrNhfRoLPeIA0V55NxyaiAY/qzb3Em1tHrY=;
 b=UWGZ//VjYGf2kDW0hqNzO4fcTMkDgEneMom6HyFoAt1hzrjBLt77JsMbvesm7HWSo+LfzTkdQa3Z4mAbmvCy4iORa4BblO8Q5PKpBb+50WNaDYMEzhQFZlmUH5+oerZW8B6Ak2ihuJab3Op1KXzFUTyF6Mjaw3+gu78yh15i3GsH++Iz4MtfQCL5KU0Leb/B0Qr8aHxRLcOlbfelDl4J31MAEC44HGaQBNUWMx1Ado99coa9s9nunj+K+IsgCzU1rZfQg950RY1Ct5ru/HtBcRAZ/boW5jK1L3ltew+y4Mb4T6v0JytbU1IwPqh+wi8naWIiZwLUYyd3LStmePHfmg==
Received: from KL1PR0401CA0036.apcprd04.prod.outlook.com (2603:1096:820:e::23)
 by KL1PR0401MB6259.apcprd04.prod.outlook.com (2603:1096:820:c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 19 Jul
 2024 06:00:33 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:820:e:cafe::af) by KL1PR0401CA0036.outlook.office365.com
 (2603:1096:820:e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17 via Frontend
 Transport; Fri, 19 Jul 2024 06:00:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Fri, 19 Jul 2024 06:00:32
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v10 19/27] ARM: dts: aspeed: yosemite4: support mux to cpld
Date: Fri, 19 Jul 2024 13:58:48 +0800
Message-Id: <20240719055859.4166887-20-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240719055859.4166887-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240719055859.4166887-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|KL1PR0401MB6259:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 65874533-f738-418a-abc7-08dca7b819fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|82310400026|34020700016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?NI2eWqVlYUlWIk5SgwGjcLLkOlKaZwp4VMI0vzQdALW0TvSVGbL1WqU5ROLL?=
 =?us-ascii?Q?kS60BtNA6NNXcTTahtmcGAYfmBauumhQ0XLDJNEci1Vv2DdMMN/YxjlJNHrp?=
 =?us-ascii?Q?ESz3ZNB/I72gKUnDGzXv7oywCnOSobZToU75/L4+fKuQYJKF55ceBqT8v1XY?=
 =?us-ascii?Q?qntEXSREah50CTN9swmzzIIvd/5i7z+Bp9LeCpD9Oy2Zoe0Xz227qGqNMm4A?=
 =?us-ascii?Q?PtW8Ct+W8QrOXY1MZLLwAh681zMWI2bAG7oxD7ZY84nUlxX3eppJmndaSP15?=
 =?us-ascii?Q?T2OdEi215tRIypjqVoX1og8/tdhgFUJkOtufkbxr/OLyLPvc2sYQ2GEJL0/N?=
 =?us-ascii?Q?9rVbBqzj97IK9ESJmcMs+QxqGcZpH8nQzzs4BQxLDqlqAcQQ3TJyfn/WkUxE?=
 =?us-ascii?Q?b1ndubr9wOWpEwFjROvkxrWJrqHzJe0Lxf8n8xmqASEY49KtPnMxLZuepnaF?=
 =?us-ascii?Q?YqCA0gb0NHwSxNf7KbAGDI9rWITO08LA3ny5/cjBI80RzYEUt+H/+yuzjNSC?=
 =?us-ascii?Q?JpyypeJC6YWoV4nsrvBoAHjF8M9tRIY33If26zkNpbPqHdDhwPzgRZ2oBtn6?=
 =?us-ascii?Q?zXSYUEfmXKUv9x+dtFIWWuBpU90rESh0bDPdJE4LjJhG9RbtXFIxBJwxIdUh?=
 =?us-ascii?Q?ym5bx8pvn2DO6422HFIq04OXr56hGLQTRu8jRtyPdLcTwT97M8qA1xLaXczL?=
 =?us-ascii?Q?uBNxWCggCY4E9tAjXNnNHeqquwce4881UMLfmTiFyS/JHjG62mvUp8/6mClW?=
 =?us-ascii?Q?O3zT1Bk15F0a+OfNEqosyYeMIVjfJ0lngWgOQxD4ajCdJFXzZeRroh8z+qjG?=
 =?us-ascii?Q?SheTh1/S5ZcF6KtLaUyAiCNH+MCdgwhAc1fgsSOEEDvpNnjj35HyQ/MtxXcY?=
 =?us-ascii?Q?EEchgSNBxmJ5bQgcx0MnA/6A+nD7EYjDk31OdUMQ5/3TAnpt4rt8bPKw5JFx?=
 =?us-ascii?Q?q+zDg7WaBJnKHRB31a3nhtmD5AcUCKmKZUUQkHqhXf12dd94+9cWF9SJ+F7b?=
 =?us-ascii?Q?k5H8iIEnkmm35Qz08MRuyW4EtT0TMVuCOTGNs/FTRynpIsjZ/UHALH3D17+N?=
 =?us-ascii?Q?ZRYLvCwo8WU5XmgPWYGZdQhhmU6heEpVqNaS6hOxRcViOgQ5Ck264t69L/0v?=
 =?us-ascii?Q?x1DjJPPTTPtkBp+2ZpyEujt6g7bJudagofSGn6kPmbK17qeZFhU5lV4Ed3ko?=
 =?us-ascii?Q?qvONdvGP1Y5mYU7resSx0Cp2z7yVMyuu2mjB9hKvBG4VNzB3pD7PJ/O9w++4?=
 =?us-ascii?Q?UeJ0ia4g9AtfdqzpI2WabxJS7vJ+bOO5idjXFODsWq8mdTRcxKPnwbV+So4i?=
 =?us-ascii?Q?x+X6g9sosVC5Iuw+lgiNSlXPUNkH7l4Y3oAU9VADGqdfq24JFSorOT37BqxU?=
 =?us-ascii?Q?3xOy/87YFDe40WYRX4yTe2+L2zcG2i8K7KOhWEeaFcMUa+SnDWpXfQawyRqN?=
 =?us-ascii?Q?+iBgmedMDW3b16Jza5WAzn0Pz6fl2XPO?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(34020700016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 06:00:32.9390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65874533-f738-418a-abc7-08dca7b819fc
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB6259
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

