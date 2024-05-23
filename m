Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id E62C48CCE00
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 10:11:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=mtJtzaHa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlLMc31Qpz79Gj
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 18:05:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=mtJtzaHa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c401::3; helo=sinpr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from SINPR02CU002.outbound.protection.outlook.com (mail-southeastasiaazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c401::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlLM44n4Wz7943
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 May 2024 18:05:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Su15oM1H6/e9WLyjPlxU2PitYlzkKE2dYe1q8sV5WMb/bM4G6EonZeA7DAmNX93/w42H9o/B5RRSkCffrfJqrWputI4i82OcVhogrxeiQ/ZP348G/SCjji84+xikKuCpxKqpYM7ft8tt9MoK1XxI/t9ScIO8W6K5L+hJyR2SUAZl8F5dIpzk3feSLE7viSOMaNkGcqS2dvIA6fljAFVDX/8IFPsMqyVoGCuBRx15MBwCaHFVqBQMG9HPTdk141EOHBKfluYW9GT8JLKdJNA/SmG/AsOMLJeYLYe7Xv+oOPoLTcHhqS90kI6KF5CnrzVJ88YA1nAgMWsM2NgUIkBOiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O16c89fsxykpLXkgqq5cnVpUTCPvI9O9YW+Dewzjs4c=;
 b=OCk/FN5YJ2MIyShqrrWVewhuRo1PY8fwv2OVT6ms+3V06awFrYM8G9NwAfYPpV7lyKWMlpD5C+6Ub+cA1jFAkcVRoTld5XnvmMCX37sqsxp4NYUTvGAA6NpKJQlJkUcLVS3UUzcLerMX8qZQtuAI56dcg3j1rdJuPN449VJMZF2KyRSYd2dKh850fQHWlCMY/1pMKGQ079MxRs85BKWvgTf+NVsWmYlkHsev5heuue8/E9JQWpsqQh6ClC2x3FZClKWvnNPpON0rAaLOlIod4WzeiRAwwaHrWqdbeXXerU3UvlROLgxggGx/yZNbtyPAzmgewsSZoe0/GW6IxlCyRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O16c89fsxykpLXkgqq5cnVpUTCPvI9O9YW+Dewzjs4c=;
 b=mtJtzaHa4A1Gm89Axy3J1/MQLvsd2hZt7sysYowBjNuWUP4jY3/nUA/bmErNBlK3OUbK5OBEygGWQztxYTK/TAaRKhQ71GUaGDgz0ffRqGPxY8KG58cgdGoD9mRuRwwvVuyjyoQtWxq9TvIUTLcXnV4neVku8UyFbJ4vx9gtsl90Wq3zaek7JZrIOOf5qcW22GtOIAG/FQijIEz+WWvi4XxKsLCea0utXnUftfFmcNtYdzO/2A7WrNj1fCcIE8765JOkorZN4Gb6y5d8zMbal+Bf+7SBKB94tUUQ+MnOeEPch+9fZk+Cmwz0wMTGaq+H2IlhTlHoXMi3e87ZS6Is0A==
Received: from SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20) by
 TYSPR04MB8338.apcprd04.prod.outlook.com (2603:1096:405:bd::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.36; Thu, 23 May 2024 08:04:56 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:0:cafe::18) by SG2PR04CA0158.outlook.office365.com
 (2603:1096:4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22 via Frontend
 Transport; Thu, 23 May 2024 08:04:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024
 08:04:55 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v8 18/23] ARM: dts: aspeed: yosemite4: add mctp config for NIC
Date: Thu, 23 May 2024 16:03:23 +0800
Message-Id: <20240523080330.1860074-19-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|TYSPR04MB8338:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 04b767b3-d6ad-4b5b-ea58-08dc7aff08a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|1800799015|36860700004|376005|7416005|82310400017;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?l8iRdh12BtPcVugd/6dsvHNJSnSecpkc4VmFBfJexgYFoysA4NJgFksZZO7k?=
 =?us-ascii?Q?tdCzMW9EG0/8cZne1b0ypI7m3fSacgcKtCl6X5tdGcQswmgyaKpsvNYT/QRz?=
 =?us-ascii?Q?iyY1JP4PzesjGviB5nxAfkUf6U3UAJgX+xwAiZsAjXx44+Fhh1SB/GsLd1Rt?=
 =?us-ascii?Q?Akb9ZD6fK1blXlKD1A2Mrc0ygq/j/xBt7CRsnM/wquSM+lSKHVQl0l3JM9uy?=
 =?us-ascii?Q?swJqm9cOK4Atd5kClPuL+OPhqk1heqR91BXnensPIM9fqq0P9Etv1z/Pb6qs?=
 =?us-ascii?Q?60Cy5Mi9Ygep3Ir1prjw2Yn+DHs25l6+t6717ETUHWBtBpi6FmAOU2cN6b0I?=
 =?us-ascii?Q?UbTfGGUWUGmLOrMMOoujZGH/GuiCge1Ya7xO1H8JYFZVhzRKBO7280kbkE10?=
 =?us-ascii?Q?/39AMjvXCgEDQxqaGpqbglVylYDpCng50ywWfhEQEa1nmLmEin0TwTpRKSbf?=
 =?us-ascii?Q?UW2fV6+UzZGZg/I+ccJIBuQbaALLHeyS2taxNpS3hlxZsn4cDpowdXJLP2ZD?=
 =?us-ascii?Q?qeFMn83Ll4Xcf4Wi28TXoLk7+IBlLL3KLPG3nz+QdrGxxw7zfW/jpePy+BWo?=
 =?us-ascii?Q?GHFjOxr1W12UVq7hC22PSopFv9v9JB4YVmm+jeUcopXO3zxRE2SM54Iu9+rD?=
 =?us-ascii?Q?9wv48HsMSZzKKuNa+FfX/+bQjVem9T0985LBTtBKEY0Esf2vOp2mM1Jff673?=
 =?us-ascii?Q?oAMbq/9aM9ed60ckwcC7/CWF6W8G3/MzREn2dWZClMSHYhUuvk/r1TOGFhmI?=
 =?us-ascii?Q?0/C8h+4gCuF5tiQVJBoZ0W24rBrpZAEWSYnCtIL8lYCwKxE2H8S5K0mPJSH9?=
 =?us-ascii?Q?LweHAEPWZcr5mPOh9Y5eAZvsiN04rO7p63RmNu7ynQOyNLSerzVZ3OxQWpM5?=
 =?us-ascii?Q?5iR7VqjuC3bpBfCZqgBCUGtQeG3g5j85k5sNI2EeL8KqSFBdr2cPheB5v/qo?=
 =?us-ascii?Q?n+PVNmoLiNa4JYsjtx/s3m64K9gECGcY9P106+Pgc1EmYvDT9vQCtB2eKyxv?=
 =?us-ascii?Q?ZNrBarDbK7Cc3p6p7fLhes4VWdtzisy0nDvy0PeGc5BBAfBTN6gZbnSyp8yO?=
 =?us-ascii?Q?w3Xn3Td3PeLnIVVdob+aar0jUbmc7unwvkUpIAbCAOupBuEOBrwvR3mWe9kz?=
 =?us-ascii?Q?2wtdNDZYVo+KuW6qtDPnveJT1hX5p48aFHUi2AA5+8Zoi6NpK0MEbdVGNlft?=
 =?us-ascii?Q?zc6CAgVwfXQa56V02FrstZzxaCil6I5n3UWkUOukLuugxzfHzmQiN7SUwIki?=
 =?us-ascii?Q?GI5S3U5lv8EkPrSis1M47W5nC973V1PzZ/i0xtI3BVPd10YbcdzT9065cl3Z?=
 =?us-ascii?Q?Z4YXSEpXm76Pre+mQrRyknp4z0Ej3OUiEmxyFExKh8QWr1kfHgDiShuY+9qO?=
 =?us-ascii?Q?YixCZ5IGLWNdl8A02ehKDjVMcnA6?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(7416005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 08:04:55.3127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04b767b3-d6ad-4b5b-ea58-08dc7aff08a1
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB8338
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

add mctp config for NIC

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 59615a6958ec..83c9d76f5a11 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1281,40 +1281,64 @@ imux24: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 
 		imux25: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 
 		imux26: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 
 		imux27: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 	};
 };
-- 
2.25.1

