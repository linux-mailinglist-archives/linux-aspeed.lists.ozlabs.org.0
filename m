Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 014DB917BED
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 11:10:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=1MovN28X;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8GBC2bKwz3cHP
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 19:10:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=1MovN28X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8G9T3mhmz3cBN
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 19:09:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/EOLqAh9sMfnICdC2Cc0mml0c/F5ZME0tSdjDUaPEz1pWbbgwhFTY/rrn8NnPslqEcR8y8w6aUQgdaBB6YIGQG9NynHzu/T2edzUIhBgIToVR64QTVvNPnf1JrpVTXF/qwi4Umyh/K5BYs3tGwxsoQ4NKrzz8UpY4vosyB8ZXH+QyRm0x3USNeyOYn/pNhD/sULLYiyqDj3+rEUwEBZBeKLWHMUU/cOOV4EPAYDB2zeB2kPiin22WxtXCf08bB1e+KGtiTdHkTdXK7blUagFrWxxmnGIrfxQcxsAjRS+uFzbGpDUUeC9wVZOizcCTqzqRYSYbuhjfvAZ+tTPcHxIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pycQ4ax5A44iPL+OokI9fmS5xofqcN1wFPCwCzTXGbQ=;
 b=L4sOTnCUBj87hYvO/R7LM9bePtobPDnSRsBRvAEpasHEs8W8RcyvlJVQm6miK9ZvnuXMSkhBqJU3XU8e5Sab8959Aviqlf0hVSCmgMIikjCao2RBLYGtaYb2FfWGs+mlYlKxuBGYa8jwkQklo3P2ioMPDIFgCDFP5eR1vr4mPWBq17to6nu4d/6GUzN29zyCGEx4pHu36oeBaU9tw4SpPhZOpNu4rCbd3oXuNl8TgXwGUmLATHDfrOzEsStbuvqJmJR3HMJi9GdqOdtqzRYUdL7Nl1812d+jpTWcznxdaNQlUUa4BFOOFMkUKnI//pmX6W8ezHUa/FaboIwZ6V5f1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pycQ4ax5A44iPL+OokI9fmS5xofqcN1wFPCwCzTXGbQ=;
 b=1MovN28X3Dc0YWB40W8UxnHD4xg55E2OBDu651HFCXFMC0xEeBSuTOczJwyX6ygPHw4fXWJ0UlsufPLvOvfbbYuqtHCjxSq88dIkvSVFs/N2CVSXeun9g0CRUFSymN/CdHu3wLaN13aojI4d2d/fvMmQmmEPUpaBiCDoQFPYfTlqPvbCdIP4nOShunDX0UnVWkohBobSdd5I4s0FRn3V0d48033FBGr5X7W5C6X7BTKNMk3K/ee6n9FynOM3yLcPcJw2UDAGjv/TMu4qPIN4Z2VFlyF3Ot005Pq3jcXl8Ow/dZpjJcmZOBCbMhQNrgtl30YFXDW32tGZP7urbWVxVg==
Received: from PS2PR04CA0021.apcprd04.prod.outlook.com (2603:1096:300:55::33)
 by TYSPR04MB7924.apcprd04.prod.outlook.com (2603:1096:405:91::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22; Wed, 26 Jun
 2024 09:09:17 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:300:55:cafe::ea) by PS2PR04CA0021.outlook.office365.com
 (2603:1096:300:55::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Wed, 26 Jun 2024 09:09:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7677.15 via Frontend Transport; Wed, 26 Jun 2024 09:09:16
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v9 23/26] ARM: dts: aspeed: yosemite4: add fan led config
Date: Wed, 26 Jun 2024 17:07:39 +0800
Message-Id: <20240626090744.174351-24-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|TYSPR04MB7924:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d03abb97-92d4-4dc4-546a-08dc95bfa7f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230038|82310400024|376012|7416012|1800799022|36860700011;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?Rrng4aQNtZogmLsoz7p6Cxlym41zAHgEwBuy90cTwTC6wcIC3gwUOw5/k/E5?=
 =?us-ascii?Q?4JxPiKm1gdS2has1QpbeZtSoNCGT7CJaqf36EDCgHXQfPMDZqNTU0xSbwojC?=
 =?us-ascii?Q?PEa3qjmddWouDJMhAxrN+MHNMDvK5BHFqy2E+9+z07rqyJce6AQr6tY55cnP?=
 =?us-ascii?Q?s1BemREsWvAJ60bWRgUQPedrd4V5EtgvvsV3AYcZOMu3BW841JzsHbloFChb?=
 =?us-ascii?Q?d53JsSAFOG1fx5AynbtEUc7w7LwFpYkfGkEaDCbegAC3XdGNTO2xjHd+lj5N?=
 =?us-ascii?Q?byra33ZNitwPoHXiQcldSM7NMJRLpHIyjgPIA3xd75RQr6HuHZOMZJKwWtvH?=
 =?us-ascii?Q?0P32fywhIuZQpdcHTxEh4u+ozxntqKbryb+K2pB/d9edOkPs5pYMNzzZrtmT?=
 =?us-ascii?Q?2uFqBNe0SmGNus5IHS29gdceQLsOByh5jto5C1L5nMMbd8pRHI+TuI4nLGw5?=
 =?us-ascii?Q?n0vkKfnjQqe3vvvygWlb7Bbpex++5KHqAdXFr3KhMSsDwKBRqp3JOqCbyCy2?=
 =?us-ascii?Q?ORZkLlgKQInApONOARhXtsUYBzLdCL4/B7G5/qzD2sJuSCi4uk/ZUAbbfgyz?=
 =?us-ascii?Q?96K+DWwa54gJetCvh0tLq5XkZnao3L8uU3iCQS4uHwCyPtWGpv0qWMxrgDfU?=
 =?us-ascii?Q?OTs2UddV2pXpttYvOQYS5tQYuPj7EEjs9XhDbPTiUmK0ujj80QoVuZ9X7kxm?=
 =?us-ascii?Q?9kVHouK4gypCjW68YUh5DwZui/M3LJZGhEh+YJe4f+rniVxF0Ta+i32ik3c5?=
 =?us-ascii?Q?nsDzZbZU+dKjGhel3Bl9M8anb/0Lq0WLXeoTtSjBnvLkJIE/0xY6JhMqhkQs?=
 =?us-ascii?Q?skbg4jxtEKGvk7vBqpH8KP+XRdjRi+tUpLZB2LRKuzRkxHGbTZoyDXdLltuA?=
 =?us-ascii?Q?Er82e0AJU1bRS8VwTsRSDDj/WrSOc87vR0whav5P5xMapGYY823Qu5/MNYUG?=
 =?us-ascii?Q?CRba5Qg6ADqrcdVQFuRBLC0019SLNTV3sGcTRrIiPPtBKKKm7voVr5fw0Vi4?=
 =?us-ascii?Q?iglD0TrsHsG3Q7qAUifNbJ6hEhKzi1Si7SY2VQR1RVO3LDDIPc4imerUWscO?=
 =?us-ascii?Q?2cswQuAZs3p2CNsGVchZoy2bmd+69OHKp2+yC0bF6zbLVihXeCydmM672bED?=
 =?us-ascii?Q?SJdLN42b1JIZYXovhsmnjOidyvGVjmheaocGCTkKCbpcprmsWfF0uxtlTg5f?=
 =?us-ascii?Q?NVirjF0R7NhJCnYqPCX8R4GTAiC+ULncrao6muQ2gUu4AZypYCQVojbhjIXc?=
 =?us-ascii?Q?cmNB821rQkKKgr5fNUR/r3T30RmRkD1VcMiOmX+2+FJImMSM274LiN0Pb9nQ?=
 =?us-ascii?Q?kjfX+edWlucbS7Sv75EVuEr7berLLS2L2rzKUqCZB1XAxb8xCLfT6cqyxRDb?=
 =?us-ascii?Q?JGLRbdGUiG+xCAJor7f4S9UepHm9O512wsqHCHArGpaamirk8A=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230038)(82310400024)(376012)(7416012)(1800799022)(36860700011);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:09:16.6614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d03abb97-92d4-4dc4-546a-08dc95bfa7f3
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7924
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
index 21ca22281ef8..2cbb210ed53e 100644
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
+			led_gpio0: gpio@61 {
 				compatible = "nxp,pca9552";
 				reg = <0x61>;
 				#address-cells = <1>;
@@ -1268,7 +1416,7 @@ eeprom@52 {
 				reg = <0x52>;
 			};
 
-			gpio@61 {
+			led_gpio1: gpio@61 {
 				compatible = "nxp,pca9552";
 				reg = <0x61>;
 				#address-cells = <1>;
-- 
2.25.1

