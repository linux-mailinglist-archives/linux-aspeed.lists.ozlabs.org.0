Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 4ABF18CCDFD
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 10:11:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=O3GyhXco;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlLMy2nCPz79PT
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 18:06:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=O3GyhXco;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::60b; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlLML3Mskz799X
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 May 2024 18:05:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WuUyUeSfCvQtLW7fJ38NyqLDDN/x3+//SQyu//XHMCy5VyyX4/uF1WDlCQFY1i9COKse7YT/JVql1bW95JIUFLEAR5gFdHRzEIF43T+ZVuuBMP5NsVojPm8H5vB2wTJcOV6YvsrxoDiWje4r0zw4gk4/8mxO4ge1Ve1q7AP+4ymDitXIoYBNOi6qnuxs7PYM0SgTBqbtuYJ8QYTJP1urjptGmm6u6IZrpR7K7PksMNeml62ZiP46fURxlnbkjZU0JEuyE0BRy53FMUh8G14A9+mCFXb2WCXRClSJf53d/OuJWzRoq9/440yzApNYx6OrOWjkpdNUTWQYEKUyIl5iNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/E5tg/AMpCd0EwjdUG5RfJmZJrlX6o4pn+4Lcl6SBsQ=;
 b=CIFsXCe+gGLk8Uti67zILjtA+aIX/5fktJCIbzNKwDJQVon1ZJJGw/BADW6s8QJkDK0eVW6+UcNuvFGHlW3h30yNlIgDT+cvgTbilwoHykYrihSFFa234q2bCWwTPRWXtrWr0NFzlaOsrS7xzp5yc/MHTBLTqzkMkkO2l0n0HboHbvfFbuzCKDvgUBBPa6yujA8JhxxOq+6KgvUIM7CDWDv44mcxmWUJc+4hPNFayHjTwn1jDWx1Xcx74Ozolgnwx1n0WmB06ApydIGqM6nupIYv1P7F+NRPGG7nr6pTh+y6pIAkxwDvtdh4HOJ5hW6uzU8oJI/abhx/ttwdzME7WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/E5tg/AMpCd0EwjdUG5RfJmZJrlX6o4pn+4Lcl6SBsQ=;
 b=O3GyhXcoOuecrNUIFabzEjYLBnXP96OJppR/AxOadJgeQl+dSM/7Tv6S2R/70xh9ZjqUq9HmzHW5VxwGPsrRYGgumPT1B8YtC/s1IdAWU2wseB5PiVJ0YdYmtd6QZvgdSFGR/XvxptpIhBQVG+mkMfqgt7UAlIcaM3R+IOG7AxtrcAJSL6zNPEhnGDApsBYusrRVhBNEZoCmmIJ9mL+0+6+miA9bo1sTeWVHIExLYl9p6Ov7VGsILOzVS6va8dxNcNYdgjFCRjPc1JAUSGoZv1eKaSokny99HSGB8xVodpAoQF2IdURxdaAwCTEJhDzagKVP7DKAcv8ZqeBLQ2lYPQ==
Received: from SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24) by
 TYZPR04MB7455.apcprd04.prod.outlook.com (2603:1096:405:41::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.36; Thu, 23 May 2024 08:05:15 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:0:cafe::6) by SG2PR04CA0162.outlook.office365.com
 (2603:1096:4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22 via Frontend
 Transport; Thu, 23 May 2024 08:05:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024
 08:05:14 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v8 23/23] ARM: dts: aspeed: yosemite4: add fan led config
Date: Thu, 23 May 2024 16:03:28 +0800
Message-Id: <20240523080330.1860074-24-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|TYZPR04MB7455:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cbcba8a4-6ed1-4e6e-f1de-08dc7aff144a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|1800799015|36860700004|376005|7416005|82310400017;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?Dpr42LWCi9SS/nIUclmIqJKEHAnx1+ah9DsSAQyUTuvx/F2HfQRdjQ4a/I/U?=
 =?us-ascii?Q?GVqX6CXoQnVKF2gjuQF0TuA8KU6Z0wsyJuCVValYjxfKyxlu6lsFu8IBelXz?=
 =?us-ascii?Q?YY/M1doo57/T0lY0+90w+qEyZOCTKBSmoG6lAY+K3BN7+5KXIGoMgCuFhVU5?=
 =?us-ascii?Q?9zzvnW50nL2Fuz2t8PFWpJlG0vFcZEe0q7O/u3ogZYM332qGpvj3CemTloUp?=
 =?us-ascii?Q?m/Ft7xEjFk3g/0bxoeK5c4pc3gy6LrSVav/0hM7RIClqqBTp/8xDdUaNhWBL?=
 =?us-ascii?Q?Xcb07Ro+G9XEUnbdOymwpENWMyRE/Aszvf8yEzfSsAY0hthD30bbEDiJXhzT?=
 =?us-ascii?Q?eLQuYPTFTiedQeywn8B/CLAQFtRrwljwOInAifEjfMJFbCTQivCJBAmGv1ni?=
 =?us-ascii?Q?iBU5+HkRDAr4I61aGUQNu2t9fYwDae18StGSx1I27rDTNEEXGQybAYdggqbX?=
 =?us-ascii?Q?Zum3F5zoQZkdr4uET0SdDcTQ2JsBDbgRTpXonethhRHFQLH0/GKAomlHvZzD?=
 =?us-ascii?Q?hkOBarC/jHn+LC/VAuju5o8vmEiJ9BRkhS4PRCFkjnAvlx2QKThWHQ5DRHrj?=
 =?us-ascii?Q?DPxym4E8QhtqN2lhOhiql6mMgbtoa5erExoUd2BAP6ng0U/o7RS9GExeatOx?=
 =?us-ascii?Q?w8y2dk+lo5DFtiacmAK5p1De4LAXe3o/kRWtoXFYDwch3K8isl5Fob8ySCmT?=
 =?us-ascii?Q?Xz4dTL3Mw1aUtL43FD/oZHw+fYUanm6xFDHVrdGNvTEub/0XRSjRjdF7kbc9?=
 =?us-ascii?Q?NMKashMYsHMvZfZ2Dhz7dwdvRUHJXVWk8BZrcgtkRND+QUBAXTN50xsw6jR8?=
 =?us-ascii?Q?AlmW3+b0RWq12UXxmKENdHzAgczKXaexsP0Q7BrNXLn0BLswfhJnvKMCOdWa?=
 =?us-ascii?Q?ueN1gB/DlPx2iebz7JU9Ml90PpU8wAYRaCVDMahTk06PLoM0Gk4qyGth2AJ0?=
 =?us-ascii?Q?uFO4ap9kpEq6rciq8SUMD8cJzuiXmqvFKMbAPRfyw8IJCOphZ5kiWyULdNDx?=
 =?us-ascii?Q?clBD3ZnffeUyhC/VYg5S5X3aPPFLdFf6u0d40zVlJxFP8CoxUxCvZtSpZ2HL?=
 =?us-ascii?Q?twyEWR3EnLWawphZog7zmiQ/pZvnfaC1EADllre+SssHsq8Tzd94UpvxuXV0?=
 =?us-ascii?Q?iBZ790yQHwiqBfkfOZ5CpaN9skjO9QMmB7zs4hYxGgRTa+zKfwPEanZbVw6T?=
 =?us-ascii?Q?Bv3UE2Z/jVDRoHonmiTTY5KmBrox7sAgXSqwHms/n4H3QcnukuMZS2vaQY7C?=
 =?us-ascii?Q?gOC1smRYTCw9SZx/diG0sFDShXeu/1bwF2GywOXApLPHI01DxfZQlrML4dLx?=
 =?us-ascii?Q?QvXwPEnNQABqgK/nm+NGQwp4Kf9vN2WNgBKeiRwWO1jkDnIfzcbjfVoDI28V?=
 =?us-ascii?Q?emAuG5Y=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(7416005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 08:05:14.8441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbcba8a4-6ed1-4e6e-f1de-08dc7aff144a
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7455
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

Set fan led config in yosemite4 DTS.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 152 +++++++++++++++++-
 1 file changed, 150 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 21ca22281ef8..fc988e32519c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -75,6 +75,154 @@ tpmdev@0 {
 			reg = <0>;
 		};
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		fan0_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio0 4 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan0_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio0 5 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan1_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio0 10 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan1_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio0 11 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan2_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio1 4 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan2_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio1 5 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan3_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio1 10 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan3_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio1 11 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan4_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio0 2 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan4_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio0 3 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan5_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio0 8 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan5_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio0 9 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan6_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio1 2 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan6_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio1 3 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan7_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio1 8 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan7_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio1 9 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan8_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio0 0 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan8_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio0 1 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan9_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio0 6 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan9_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio0 7 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan10_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio1 0 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan10_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio1 1 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan11_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio1 6 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan11_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio1 7 GPIO_ACTIVE_HIGH>;
+		};
+	};
 };
 
 &uart1 {
@@ -1198,7 +1346,7 @@ eeprom@52 {
 				reg = <0x52>;
 			};
 
-			gpio@61 {
+			led_gpio1: gpio@61 {
 				compatible = "nxp,pca9552";
 				reg = <0x61>;
 				#address-cells = <1>;
@@ -1268,7 +1416,7 @@ eeprom@52 {
 				reg = <0x52>;
 			};
 
-			gpio@61 {
+			led_gpio0: gpio@61 {
 				compatible = "nxp,pca9552";
 				reg = <0x61>;
 				#address-cells = <1>;
-- 
2.25.1

