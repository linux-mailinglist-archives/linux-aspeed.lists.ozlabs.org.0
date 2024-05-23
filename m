Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id F37608CCDF2
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 10:11:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=V9gP5sB6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlLM90dDJz7965
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 18:05:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=V9gP5sB6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::617; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20617.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlLLf6ddRz78tB
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 May 2024 18:04:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ek64Knv82mbruMUS+vXJoGQ7GX1Uu4CKLIZkWwFZ8w++iaVTXYAq4vSzZiIga79qMiT/Q+cMsOktEXWuoTmE/Qd/Pu7fnMJ/hW7YLVTKQ13BkkKE9g0gk/nStIZ5CvJ0yqCGxuVoNRny+fwDv8jmLrAB92jqsDXuQwWU3ul0AJW1EeD428A3MSwP3XJKroT9nu29fucoOP9j6QBGAZFBWD1Bkbxv6NlU2/Mg4xT/XAIZbe1CP2gbMo7PxZJhvB3uFAHEWa0Jqc0T21HwjVSh2aa/5i+V9RbQwCMIkyhhpEex15DYVYe5wQmRbE/3cmnC85VQuVAAcoMV8PJofRPhvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrss1LFTszE1pis/nUOnfDY03qkapLfO8Yjsln0bIZ0=;
 b=aML7n/fAsh2JT1HPJ9pReTHKRoI0L8+uLuL/537LaFG6baSGvFLPFIuqKAN1tQfN8QhIcvJSVm05a+JYXsBf320L4cSUexoYo8MhuyQeRIzzU7kwUh0YVeKF3ttb4ViWZ99Thjubc5YZHCDEWK6l0c5RRYBghgcAdPNT5/M1K1TBoC5eHyWkmt4ryRWw/CejMvbf9/glhkkc74yyUToRLERIbxHLpM6oR+FAnq8shVfSC+GaZgdguOubOMqOlR/ifmO/TQzebiuR9YmwpoGSrH0p07src35tksDXpvWX/CaVuFSqpa0Nm/bbojR9c/UHNCIPt0mMg6C1bUy+qKVP3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrss1LFTszE1pis/nUOnfDY03qkapLfO8Yjsln0bIZ0=;
 b=V9gP5sB6gS3Zvfh3NdALvLu3ob4iYeMTmRs8AFz/KykfdHvGNz37fifT+Wg6jZlnNaO9tehyPBTNbf+xQO94dRpHD59rRDck3cqbq+NHuMPDFbeAnifABIDgh357W4xYENDptx+uVwfxXprM9Vw+7bUYTp+fLlqOVoCx1IpuBxUq2BNFyLcYil2gqRVYf7xmyMwWf604TTNkfp+bhoBteNn0tlLmtSfugThA5R3QwueFJMN6ytSPSxfz3lzw8sWEWHc2Ks/B/6RKQ6n7NNErAxogWMjkXofHp8ck5gDahfNf0IYftzfGTNdAFSgS7dTwfdbnFlCiC6EBWvzilV2Nyg==
Received: from SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16) by
 TYZPR04MB7154.apcprd04.prod.outlook.com (2603:1096:400:465::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.36; Thu, 23 May 2024 08:04:41 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:0:cafe::a) by SG2PR04CA0154.outlook.office365.com
 (2603:1096:4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20 via Frontend
 Transport; Thu, 23 May 2024 08:04:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024
 08:04:40 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v8 14/23] ARM: dts: aspeed: yosemite4: Revise ina233 config for yosemite4 schematic change
Date: Thu, 23 May 2024 16:03:19 +0800
Message-Id: <20240523080330.1860074-15-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|TYZPR04MB7154:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 53e80a3c-011d-4bc6-ebdc-08dc7afeffa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|1800799015|7416005|36860700004|376005|82310400017;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?3QNwZJK0Vjwy2VeCjbTO85BWPe8YseGegiPzziil/15wXHrh4viFXZBVtK75?=
 =?us-ascii?Q?6o9H2z5ZqjRlCtyOHOKRWjuH+4fT+OF0PKBkMAH4ZL7oz4D6ZUpe/1/+2/XV?=
 =?us-ascii?Q?LxmySRENQmMvJo5flEkrlJpkniA2wWM9mEQCeaUx/DsQcXLD5JpbZ6fWM/x2?=
 =?us-ascii?Q?ucarsMmIh2NApy1Q5RpbPX2chWpbBTJrnpFRcFWy1BiR3asrqDNimdwVIcq1?=
 =?us-ascii?Q?ZX2lbhizNKfPfxBvk02eY5EP22u9oFZu3+xLyqqnVmAr9cgrYCb+e/AnuMeN?=
 =?us-ascii?Q?lkWuhsYVE8a3jUsZCmAVShAK3c1zcgSB6RsvI9YesfDK52Q9zIOmJIQaN+Id?=
 =?us-ascii?Q?y6IJc4hpWUSCUUWM95bPpvuj5rV2XtZdtKuWnP4bwKOGhx3uaKSKYDqLTGYC?=
 =?us-ascii?Q?3orT+mW3T3SVf0DhX2hUFE0sJcoWBo8cDbxHGHTCItvd0cQbzA+SIlJloFm5?=
 =?us-ascii?Q?lmDnSKekxS+sbokzuFKfbhORD2v4Js4F0JiUkQDQlvYdbEPyw85uJzjaRJs+?=
 =?us-ascii?Q?QxG8sgnugtgoU/rrnJd+pvKZZbGJeb5T7e2c1KEVztxlWKYwrZnXKu4iUfBg?=
 =?us-ascii?Q?iq4eUH3xsjtm0SMx2amb/niIWvdBIJ49ZkG+mH3ZwjPTqcEG5FahcfAIw0ty?=
 =?us-ascii?Q?hJi3AIt1nhTWCW+5xf09sLMvq7yljuh6o9nNVuKueX7VpJ8zeb6y3BAi902c?=
 =?us-ascii?Q?Y62df7H35xaq5NfInXgMrz2BYQhgMM6UAdfsCshBwIxFKZirbgxxTOd4vslc?=
 =?us-ascii?Q?Sokl7GQXKOANr6+iYE1XHpDJuWj0G8/C8YyBLEkbddnvcNCeIAX/SxFIlxN9?=
 =?us-ascii?Q?QiNDO6ilx09LX3591TuZNMOYGbaPnXOQpomUr59kQmwCITXYXKZzzVgmibVN?=
 =?us-ascii?Q?nwe+PidzitZVc7bm6/wTQHvxT2kIHuuLgyW+pm+0U1XxlLRXxtS0ag1L/7Vt?=
 =?us-ascii?Q?M0cpZBOOmHHmGmzMpzMEZMASXRTw8IHqIjUiqF2w8IEqupzngnXNJcVoSTub?=
 =?us-ascii?Q?G5opzTpj+9Zf5JkbTZOMMWZYwqXOiTzWc+laR/BAGNtaH91k8yS0eojPy+xx?=
 =?us-ascii?Q?QkHwbj1wVYiWfJ/Po28sc4wKVXAaHJAYFL8v/OyppExOUJRSKCkjUQ7/F/YC?=
 =?us-ascii?Q?Ji7LM91lVbLWloW5D/s2aweaD7ap569n3lHbfO1UlSAmu0acazXd/aVV+Ums?=
 =?us-ascii?Q?+m6oiPQzVXla03TXOsdpawiu+JdH0MsxqJHH3ygMALvz+1ChS3QKKvhTtNEH?=
 =?us-ascii?Q?DEz4ySXDqvJ+yOhLN0NzKMYYjPBXHULhhGjvPenZPvGEArFDJkjKZwu95qEq?=
 =?us-ascii?Q?M84Ns7nV+utDbCdVbbCx5+/oYQqEsXF1R2sMH53aSCop/Lrb8Bvj5EfNo9o3?=
 =?us-ascii?Q?8FO2ae8=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(36860700004)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 08:04:40.2813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e80a3c-011d-4bc6-ebdc-08dc7afeffa9
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7154
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
index 0c7d85ff4360..67e3c787d675 100644
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

