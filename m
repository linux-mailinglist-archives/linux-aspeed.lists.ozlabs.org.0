Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC86939D90
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 11:25:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=YbgpGc4I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSsF86HNgz3dXL
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 19:25:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=YbgpGc4I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSsDY1fQjz3dRl
	for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Jul 2024 19:24:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFV3/C21Lym2vkZcpUUT3JWyR23lvg5BcS9lrU/lEW+1W63gNp0BwPnGKnksNKU/3SIHgBdFD4rfiX3DEO1gRLqvMCKJAZOlPSEgod1RI5/bhDjNAP0LOPDp3olrmeMpuXYcVIRf8fG9gu7DJwzQl4GRlq6nddX/UWeftg9blLI+gdDMa63wlKo8cpvhnzDHTvK6tAnQF6Xe6fxpIVbNk2F5iMKn9DaMbcpYbrBCSrkGCMnwd3I1xUCBniEDt3/cgh6A96fff/8h9JpekYudiq3GruwMy5yQejU5Bzx6A1vU5G4PRbGz3lm7ksHewHBclSS40BDKOC0WFDYTyapVpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QU+JZ1MSglaWLSUKc8QjBu76ufZkEOMMNsu7ns+mPuQ=;
 b=g6dcq03XvAmdzpjOAAsta3DaJdMWfJEn/C3cUC6MxT2AsuRJa/r1D8W0qKOyQqv9ZRe+5KJZJMOGaiOy1lo7Q3yXz1yJL5GBKF8Vf15LrFhvg2J6CALqmUQN/9cmNqQb4D8jWu8bDGHyPff4yuOwv/7IDmmkE5aOeSdQWZ6GYyPCe6dnymtmmvZQQ9uaNsm/cmBgAHG+MKM3Zn8zkthHwdXvtx4uLacyRv7h8sJvjeD1PrX9T7mP+Te1gOrMHe4Bq7JBloSqFK4fJtS9YcdOxmxr8N/OS36OsKqu/lmWdiC5CIq6Dpq14R6IC+yvxrdRMuXNYNpCt+xlSVgAo1Bmxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QU+JZ1MSglaWLSUKc8QjBu76ufZkEOMMNsu7ns+mPuQ=;
 b=YbgpGc4ImFCVg/Za/WPoXFtSg9IVVJGBg4nxWRY9WQL+nvHGjr5JZwHOk8vlITtpG3CC/H9nJRnMgfY3J1jNLFyTosiWAjxMQIZaz6C630pJIfx+yHASTiiCSWIlnY4+RI6TgV4Ikb32+H/Qrp/mXVxPezLq2JgcvEScnqRRSsxMFRJvJ3yGPyx2HoxNYaqfwYSgeSWlJ4/d2zuDceFurgzU1t77iZE0LnvGse70RWGlyKyVnmHzh/RJC0SJEjoPe9/6YTEb7REzrl/ciehSXGMghYspfsSKUEcq6zECnRk9b57b1kul7Czi9Hpcieqnrhc6h9lw7NudA66wI5Iz3g==
Received: from PS1PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::30) by KL1PR04MB7253.apcprd04.prod.outlook.com
 (2603:1096:820:fb::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Tue, 23 Jul
 2024 09:24:42 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:300:75:cafe::91) by PS1PR01CA0018.outlook.office365.com
 (2603:1096:300:75::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Tue, 23 Jul 2024 09:24:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 09:24:41
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v11 23/27] ARM: dts: aspeed: yosemite4: add fan led config
Date: Tue, 23 Jul 2024 17:23:04 +0800
Message-Id: <20240723092310.3565410-24-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|KL1PR04MB7253:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 30273969-cdbb-4d13-633f-08dcaaf94879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?2LljGxqB0p08LwgcRFffJnSWkKrKqFO/AMben+ybK8kjn6tzPKVDSpmcNn53?=
 =?us-ascii?Q?b1Jj8W1yC1B5meYv96d3UrBgoHwO+TgBANn5jFWymRkErvcAVsZNFwj81gix?=
 =?us-ascii?Q?2LmALgb3qKT2N0+OHGft2ABmF66hgJ8+BG0LE7U1rqLG8SsLmYi4pajg2Wn2?=
 =?us-ascii?Q?YtIyVXiPt2VulgR8ytRaHVbk9W1yG+38rLhtfWbFjoUWpnlhY6vXW3O04kci?=
 =?us-ascii?Q?68ymXH9U4vrwKHSq0nG71aN7FhUw5yPsMXw9y0TNJiA+iKdn8iX9MNFQGyC5?=
 =?us-ascii?Q?P4Enc+Bsfk1TFh5//zwHKsa6YzdXdJ2jy+DIKE2mpsDXGX7otL2h+7rFs9WE?=
 =?us-ascii?Q?dt+CxD7U+wdeRMK84OIWaJo/QKpdPPaD2MLhfR6FrFCr+GgueLHwQUqJWKb3?=
 =?us-ascii?Q?4KNWVD8SZz1/aOT1sPZt5LSsMz3qPZcv+C0kfk6V7l/RaKiJ60TKjzNawCkw?=
 =?us-ascii?Q?hbOM7S5+3+5d2OLnml9QyqvSDXFtggRRvRXi2LUwcLE5vpq5+MjGKuZF6OUL?=
 =?us-ascii?Q?z1FHLtFEYGVXfwj4s/o3B4jMmUX/o1tu1HZcX0Wi5/EDfpVyXn90LRdDuL+v?=
 =?us-ascii?Q?3AntOf+L4/FED3a4FIz/IGLbO4kWxfJntryZwkm3FD8AXbZ7TEStMHuEWj6u?=
 =?us-ascii?Q?DyB0724xvQmbEQTnRPXf2xpATTy5nf9Hi6WzzH+eAjMb3IojhHP1Rfqo9Q+Y?=
 =?us-ascii?Q?GqU1CUmMDlkUzryGI+esYiXb4+pIN4UAfrozyzMRtvpYyG46K72N9c5TerMF?=
 =?us-ascii?Q?H2SBc3zsUPARN0vZUlMAt8xIb4LXHrld80GAXb6Pcx8Bl8Byz6bv+RakCUuU?=
 =?us-ascii?Q?BqxY6bN9GtO+0K283ETw4XUc/HXDJdBhDLV5Vc9udNkeViQiL+yjEHKNUIxV?=
 =?us-ascii?Q?wJ1IwezECJUbCLR71KaEQ5pob3LZ6tYSIjoYxjFlUJ4pwOPyyirH3p6RfbQC?=
 =?us-ascii?Q?S3MZsIPr4ZL7mqJ0I40j4xU0nJgt5zx9ZHNvMEN/VW6/EmrlhOtY4DIzWDuI?=
 =?us-ascii?Q?ISNBD7LxfPXbkfg1mrBFHt+x5a/hNF5UyyXZgjPX80LDNzEtiSLFSxkLhVRD?=
 =?us-ascii?Q?rhGqapgf2+ZJ9Qkw4uuMqiNU7o5a1flodMgiIB2KVeLafANw4Vpm2YMzCZj3?=
 =?us-ascii?Q?/3Ie8aKWxvnFBaDxlOGabNMfxivfurqGLQeI8IK8hfifgbLT6GIfMSz+I75V?=
 =?us-ascii?Q?GdTgYepcb2dEUHxWW5j/eUiJpgFtQlzUbp39pL7HGB3vnfGy4Z59Eb74sloo?=
 =?us-ascii?Q?d2ftWScIg6lOkQ643Zbj9Tytum/Svoydgc42ucyk0sO3fSugez2j6T0ABjPo?=
 =?us-ascii?Q?YaWEJ7pR9rfZKtO14JyZ/rRBF6QN9LbFsr2VTwPIYG9jtfd68CIL4FWDH3ak?=
 =?us-ascii?Q?vYJlLt+ZjEtEYNRpACGjisLEg4AQWiv0DfvPgGzYb0N6GpX7daN/38kQAsDe?=
 =?us-ascii?Q?8cQipAuPU+x/Ps4T6KPypLxwr5JzMf+e?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 09:24:41.7073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30273969-cdbb-4d13-633f-08dcaaf94879
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB7253
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
index c940d23c8a4b..2f4e9c5edd5a 100644
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

