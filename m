Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D43917BE3
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 11:09:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=jm3c/x05;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8G9m24LKz2xQL
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 19:09:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=jm3c/x05;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::626; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20626.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::626])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8G9F6wrvz3cPh
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 19:09:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tpcn0Y1QUlPaHBNRIhfc6wvN9Z7z4yNRB+UQKfWpYeHKWPRX49oYW8BlkKUTlePRTM03uMP9qwSbzDTd1/KoDeYsa4GGzSf1akELEASrGQyycfR+iMkgzTtI2e2s4kg8V7fNbN8ul77wbB+ZAxXsicd0MmCpaGjJjgvqztVdy/fjvqaB1E4mGHDn2zd6FT+v28Jvialp/EI8Hrw64hQ7IezSaWEa4nBpbyB8Q1RjgiiULwMyOnBg0PkFcoEjveLvrUsG9dDhYTa4X2pBnKZi64tro3s/VZfy7qgc8Wy6OpY1rVHFd1RnyM2SiwIiVzgdpgTuxI/PAB/sYmUSoLoL1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ES3SdMSGvrNhfRoLPeIA0V55NxyaiAY/qzb3Em1tHrY=;
 b=nDD1vZ46iwm7uOLEmXX5Lj9s12XK6ywRoExRYQGJo/p86VyYXNwsRhqY919MO1DLhj/kAdvnBKY6kF3EtBf+vEGq37/Gs0webiaeIL7+jniGny3zgTkbYdKFSh8G3FZ7g411EdR/Eb/hz1sOHMiN05d1vfvb0JVXFUfZa8/wjHbSn4pDDepP7H7KX7qp/4xjM7dv1ewNs5pUY4SfhyL4MVnEoi4GeX/41y2lafOzgOv4f3JKboPXYDTRv//ibVQOhHdaEoRbfD7bgd95IQcU8jhrapjOFHfX6SBGxOGZYh/If2BcbpMok4H+b8vv5dvRAM4HE5hNE0fSckDGwgXPAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ES3SdMSGvrNhfRoLPeIA0V55NxyaiAY/qzb3Em1tHrY=;
 b=jm3c/x05rLrIK4ESsJ6IrhPQ97Rv8x0Os7GfdZnQeVPc+VxQVGkcNpmqbuMOruJpq2u9HE9eJ3fYuHty71g99QpkVCQbaYGUQTnLuR3PPBEMhgg0VfV6UL7jyEWDric4UKt/xGrOA029QchEyu3Xp35LMqyB6iKoamqjiWVvhOj8c8STBUvOdI5oDOL3CRIVwedJQfXg9ylu0Eucyw4muR55nnbUo7LA1qn8XdVW46pSHtntv0u54RnJa9kd+/8Q6gwxxc0JPDZW/maaeLv31EfRBU45BpBc+cXCL1jKramTdFC5HkMDbExD7A2+xQvpqjt3QvC1HTosc3Q0aOBZng==
Received: from PS2PR04CA0007.apcprd04.prod.outlook.com (2603:1096:300:55::19)
 by SEYPR04MB7262.apcprd04.prod.outlook.com (2603:1096:101:16d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22; Wed, 26 Jun
 2024 09:09:04 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:300:55:cafe::d4) by PS2PR04CA0007.outlook.office365.com
 (2603:1096:300:55::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Wed, 26 Jun 2024 09:09:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7677.15 via Frontend Transport; Wed, 26 Jun 2024 09:09:04
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v9 19/26] ARM: dts: aspeed: yosemite4: support mux to cpld
Date: Wed, 26 Jun 2024 17:07:35 +0800
Message-Id: <20240626090744.174351-20-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|SEYPR04MB7262:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5d7efe39-2616-49ad-4664-08dc95bfa08e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230038|376012|7416012|36860700011|1800799022|82310400024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?/8VkwZyTOUhrmbls26SOR+SU6d3aCdWpTJelhIjzX5oyg/64z6zl/wNJ5JAA?=
 =?us-ascii?Q?o9fpiI7lkmHAV9pzEzbnQM3MLw/ldfT1KdvDRCnXLEGYt5pvCmpSbr3sekvH?=
 =?us-ascii?Q?wxXParcryVVPSlmnRdjv2W2TTOaTZe7GcIqaKpKFPGaLwWcEAM/zR2SxSgDN?=
 =?us-ascii?Q?UbUTyoWsD4PAEMo/aDtXrl6ZU/QOsjLtFF1ZW4Qpaali1E9SxtBFdh4gwvwb?=
 =?us-ascii?Q?MqvYYPn0eijkwY7zUEY/In/9B2FgbuWdlS5qIXmXL7pbw9qzkNUOp1b/AkNx?=
 =?us-ascii?Q?b+7th0lmH/ZKnsq0rLdenE6fWRuRA/A+bSAHvgGu2QXcdUiWPKxI3qpF0YN1?=
 =?us-ascii?Q?kDYQcYFcMCfocPRFQ3hJsY8mWKpEu+m1o8LcBA0Js0Inel0lj4yzFi++8Kz3?=
 =?us-ascii?Q?kx/hbOPrcom9w2QVDHKtUtp4VoxXSorq/NDhYxZM8cDvHg9QOXLdZyI7wjuZ?=
 =?us-ascii?Q?S3trwDxmtIA1oOBqktq74CnJ75ud40MteV7Fp14wvLm0uCGuqj9vOgLfVPyD?=
 =?us-ascii?Q?eH1JimRxuN2p3I9I/nZXSIs47MkQxnWDOWou7C/E0e8R1UJSyXT6ByVDxI5x?=
 =?us-ascii?Q?C4S8ftGh5FthmaKA87jaRkr9I7rUcdyMHE6vl/k7BQ2t5CENhSlPL6BO5fJU?=
 =?us-ascii?Q?lTDnmUYAgZ9uVU8slUpKmLVhsEJvUx8ULPS14AuiMF8voCCqF9icBLdl8LSc?=
 =?us-ascii?Q?5yAvThznV+KYv6sVR2ci0xQbm96nmyXFhkeFeGuo5j0o7XGyAAYIKtopiDmQ?=
 =?us-ascii?Q?/1E1P5DYocxNs1XJXqd4vtj8upuvXNonaWnbbASKecgexpcgDjmM7HQcftNw?=
 =?us-ascii?Q?KY7dfpT9g+CygpPSO5G9mFq/lbpTDwQq9s1Ed7PYZoQ0MK59T7M07YlzZ+eY?=
 =?us-ascii?Q?YxcgKgl6H5brm1Xoy94rvv9A2nFkC8nK8GG+0ragsASxHggY8e0c6hBjLdnI?=
 =?us-ascii?Q?RtnNnhq0/TMJ7D7xfDypt8T9COfkkYrOh0WnW7NRJIY7kY3qB3OCOweKZy/a?=
 =?us-ascii?Q?zjQGBGrAdN4JFycslaCcUzE3JbDIh8jHNaTwrZ0F+hymQ83uzVO2D97Q2G8H?=
 =?us-ascii?Q?fB3Ii1wunBC8uLfGeS9Q6/DanUWkgjSWQ96gxu4kXhJUd/tHX5kNzNNE/+W2?=
 =?us-ascii?Q?cqMp5kX3akWBJ7uKyd58+DUA4xtNqvsjRcGTwBwD2+l5DcYQL0vE55B6Fs7W?=
 =?us-ascii?Q?ysxQtFkLNCP0zNvuIR07ZEaUf1db01CRdKqC9KFKl6IEWKFSnw1EibQkvhnN?=
 =?us-ascii?Q?C24PAVAojTcGtjLqDel7dDSbVP3p8W1Q3Yv/43+FOWCD5oJ2eH3F0O4BHS+m?=
 =?us-ascii?Q?L4xJqiI/zi76/cKgnvJR4qhgxx+tr0mKsZB9vp6XAy9GnmeM6MpXssrqwQx6?=
 =?us-ascii?Q?+e7+jA4WfuAQ36o3kE8LyY7H5xXKTMNWvWVKceI5ITTS31SXKA=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230038)(376012)(7416012)(36860700011)(1800799022)(82310400024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:09:04.2082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7efe39-2616-49ad-4664-08dc95bfa08e
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7262
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

