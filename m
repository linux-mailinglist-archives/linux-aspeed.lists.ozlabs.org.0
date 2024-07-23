Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2367939D82
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 11:24:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=B6MDfGMA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSsDQ46gCz3dFS
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 19:24:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=B6MDfGMA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::62e; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2062e.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSsCv6jBXz3d9t
	for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Jul 2024 19:24:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XX6jMFMdaQU9RQ9vHpEh4NkE3IsgkpG8s03DHuImG0R25lDK35OWpkjR0vOG4uqMFGs5UT6Hx7mhhi+bGGHWy28dRCpgWHR18Xk6hKbhqChj3TrvWS422DsrFALgiBNzrV7o6QdDl9hGBS3Om3wkkAJsSyDHzuWyjHxpTAZRcgmAfVDcN+hbmliiJ1KgWgQEgmBzXQpSnmJnveiNOacvV1n0+BoS5RxI9nvf5tAzyrZmjFbdOKs5g/P1d9/YTj2kS1BGXbZ5tr/IrkSI/nIh+JJnl4FBvb2mFiDb49qmYjiyai/jCZbn4x+P4ol+vKCueYwbDMbw+lWpUOz0B//yyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lo2LnZejiHLnr3GYBrZTsuUBWpB3Ws7w5C5IaBMRr/o=;
 b=fubrVb4YOcJryXhJVpAMi2eIiE2+NYcK6GB6HA6Jwwbirn9Q3Jjru8d+25sfflSubFIn4NsA4EtOqLFf3lETApN7Kcd7PjbD0h9j6O7buQQGb22bJvHh2VjaQNswQdpjB2P8NZYKWJIBO/yFS45rD5UGZF475c3Xeu74L6+X3nWH0AGEHPi8t92iWy9guOEG2pLWbrlX3oR/w8OxHY7mblL8JB64wnB0SuCzGFZkcJZKY9XX/OIw48Oxr7zZ25W0FuZMp74Tl59OaJ3FV8Mk9Y35CaRpsfiiXuQVFftBiYGF8UgzPTPBwMHSdrhh7dW6UpgdJ1w4thzmwh6Aocg/rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lo2LnZejiHLnr3GYBrZTsuUBWpB3Ws7w5C5IaBMRr/o=;
 b=B6MDfGMA+BylPD8W4TIhj40/q1q6iMAy17yj7RztNEy8cOl4gYXI0eUkZTKg1dOGkxdEx8T/RgxNz9v5dBolcLbfowIuFZytJKAqTqFZ/5oMo7Ulr+JR4/I6RgBtTNT7F5OaNiMvTqTwu6KcE0q8B2NGT0gQUgRITDn6MZBOAQlSzJIyEqMzx7112cHxmbPIqkNpPxWuLGBDpIGodHkyPTWUlmZLVJv7SOsp2h5cWgAXDTo7ePHbkOmmjRFpQOWjvwrihErizhQgS0KPXApjMgINKrHwzK6CN2XeBZjA69pqb8heXL0bh/II9QSL3cXjAaTajcVVVdPKarzmKAGarg==
Received: from PS1PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::25) by SEYPR04MB6578.apcprd04.prod.outlook.com
 (2603:1096:101:b9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Tue, 23 Jul
 2024 09:24:07 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:300:75:cafe::44) by PS1PR01CA0013.outlook.office365.com
 (2603:1096:300:75::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18 via Frontend
 Transport; Tue, 23 Jul 2024 09:24:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 09:24:06
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v11 14/27] ARM: dts: aspeed: yosemite4: Revise ina233 config for yosemite4 schematic change
Date: Tue, 23 Jul 2024 17:22:55 +0800
Message-Id: <20240723092310.3565410-15-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|SEYPR04MB6578:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4bd1fd7f-8bdf-4ace-0fb9-08dcaaf933ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|82310400026|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?dlyDA4pvJjMPrFUlNSZ4JH+HfTX5Zzun9L9jK0dqfzAWsuoo6nbqIciTVjmv?=
 =?us-ascii?Q?foFxofXfGqo381E33/zbz8Fw6PzzO4fmf+hFQOJCfbQI261uCVttMPKj6Whd?=
 =?us-ascii?Q?LSw8a8DtBWek8qfWO51BqPNCjQOX1MmcdYo9OV+mPdlEckJ/w9KrODUDj2ln?=
 =?us-ascii?Q?3r+367UZug17YQVBKOR69mUFdNnEbmLK8ez+Lbk10RuFKP3MY6BcjWBQdIAN?=
 =?us-ascii?Q?5E+kfGtHTbPCzXXLLAHDWJpqZRTVJuDwIl1hedHP+2SFvwWoDLrONwOE07fs?=
 =?us-ascii?Q?pEVeAj4+iWZW14QRWE4xzJlqrEmGI5vvPMVNSr/yX1nngjHaEcaUJE2Tl0gE?=
 =?us-ascii?Q?X9jlAb3hj+95Yna7QSXOD/DotuLyiNwkLCCZ02lIRD4iJVNlgTeaVeGdMuL1?=
 =?us-ascii?Q?CuTVEE3RpECBe718GtbIrzYESouQj9Tj8cZ2VpisxlR/vy2CAKcH7jOtNFVh?=
 =?us-ascii?Q?yBDqm6mx+ChEqHWqeyx9j7pcR8GBMiFVWfdnw9rC6cF6s4DJF2aeB7SIHPOL?=
 =?us-ascii?Q?o8/Mq/Mc4i8rK1LXaSJ5w/0e5Wa8dlg61YQiS+E9VhXEbO3FRNpwYHV9nAnf?=
 =?us-ascii?Q?ZVSmqaftDCZ/0GYpdI7Dhy3t8xQ44fLxrV2xaH8NsuHGAePzBPNLTzNeJvfX?=
 =?us-ascii?Q?3R/2hYSRNZO7mBmz8foh3nNWiG11dFJSZYamBHPaQK/ZlzSmqwsiVZXpgxev?=
 =?us-ascii?Q?MgIEoEWtCl0/BReImMRsW91TAAA+C4mfZbL+vmFZi/SjdEWzLqxqfkHanELG?=
 =?us-ascii?Q?dsTQf3CHs1ZWf12MjdN6mVEavftmf2Yf9WmjbX8X123zyA+J+2DQBliboPKT?=
 =?us-ascii?Q?ACDTXtbrY9LaOD8HyL3qk1QwrjBNGipJk9NlmdP+6/oQ5SYTXTw/OATE3hZ9?=
 =?us-ascii?Q?F680YELZdfSdHh1hBCxAd/uFOMn+TjsRDu1OJEw5uQ6vkHULt6GoqCZAI7VA?=
 =?us-ascii?Q?KaKydorK5byg8X2shIg+/8K9zAL5BfbaVUkSdb+6XG6qMWHc8vt5fYY7gIfU?=
 =?us-ascii?Q?P2V8uYPT7ZfhMf1djBHVBByeE/HUG2+tKi66HzUAKf0VY8dj41c6gl+CZQAC?=
 =?us-ascii?Q?daMkygoPn/EJ/lwKHhKfQ5z2Z/tIAco6K2LJUQ1/zcEvqrVJ6LxiwQMzizUj?=
 =?us-ascii?Q?B/wPVxr1oKs5UKDPmKuUicHvT90TwcEXq239riY+ze2tTMqHxU6x5pspNUVK?=
 =?us-ascii?Q?4LmcwoUfjR5eeRXY7/rrvhOdZgdDnn55LjWZVzVnHdPXLSHevVnB6l2Vok1H?=
 =?us-ascii?Q?7A0g3KeSaVpdV6615X/FlYPImIrwWNNgko7SqL1KrZXsUXfWm3qchsprwFU1?=
 =?us-ascii?Q?AT1K4qOICIg74M/Shk7ANwTJWqBUPSnTqGlKaMY/8S/59l7KTNR5WUqqOlsN?=
 =?us-ascii?Q?PE6YPbR2EUr9EcHl0Y7LG5yu1Jt0TeS9NpujGSeB8ki1C9Ym0+vYmkjJeYXI?=
 =?us-ascii?Q?vtpjzi4ML1bWCx+ooZlpwWAlNChz2lGP?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 09:24:06.9570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd1fd7f-8bdf-4ace-0fb9-08dcaaf933ca
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB6578
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

Revise ina233 config for yosemite4 schematic change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 1765a0bb70d7..df389b506b4b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1034,28 +1034,38 @@ adc@37 {
 	};
 
 	power-sensor@40 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x40>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@41 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x41>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@42 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x42>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@43 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x43>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@44 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x44>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	temperature-sensor@4e {
-- 
2.25.1

