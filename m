Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 878B18CCE09
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 10:12:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=fOx08ftc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlLLS23J9z78nL
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 18:04:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=fOx08ftc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlLL64GPVz3vyQ
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 May 2024 18:04:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvA00zKORD2NIHomgrrzxAuOmTIWmjEvQsLyQiaX4wPAb7o0rp19OM7iPtp8GEU4eooCjGp3Tm5JWZO8FwdKaC+iJWdTkOo8O7FOLB/mKAN3lObGX/24irH2TlitQvb9J5nK6rpAuk07pS7jqsM+bznUzIcqSmcppMnKGnwWQ3iQnmzzTs5wcCuyqf9jMpLEeLm+64cA9eEfoGrE4vpXGaoQkywQhzjjB8WLvWS6RjSyGSxsy/JSAZsRQGKfsXk1WsLAmiIFhVWcCVAQZS61XRCgGDjse2tycEh29nuzqggSol8Ex9la2k5c4Dn1oHWrefoTn4ysb+0Qq0VKs62iSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFKimFjZ/HhebE08E0uoD3C7UlaPmpkE4lfEBFrj+a8=;
 b=Ro9RTSxo1xFC/6JyZeRGz863LnyFetLWdX4HnJUPp3WZ3PzYhqg2BK6fCP2wsme1P51CV5jwNfArpf4oNPxnt/JiBua7ORjRdN84SptT5/CX2eg3LVNMU3TtKHN/lzkLeTGeI3fG60+0zCtLdPxG5cnT0xr1XueLc3PPeaLrySTR/b7nx5PytvVM9WjFwZHe/0HKJgmZv/Uj1/W1YWsNEuq9KpeacG8LbxZwiUY7SZC5VrbHAEuWixFSbO6vPMlJ1V/yr0lZxcCmMrZcIYigoF0n/d9vxoE6EyUjgXEIrY/e1YSrqrr9tQw8eWdBOIyloErJxWz4Xo3tri8BNIEEbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFKimFjZ/HhebE08E0uoD3C7UlaPmpkE4lfEBFrj+a8=;
 b=fOx08ftcIl8UKcUZhmOLvZSB8RvJn55EpGOEZ7KMxDgzFBDaz4Z1JGz6lLrC8/PRQNAPn7/DIhjBZXErRlRbgA+rigPZJm8QVsXpvZoRhCSbKldjLGqkweuQCaedISzf1iekXCX8ZO3bu+o4+pqx4legGSEEv/eIDkiPvdpn4wZVtcUO2ogF9BLGgjXe+kMtf5+zZFE81f+tfGTb921hxIcZpSO+lcqLzw7hqES3U7Z+uTbg+u+nHGHhd8q0ut51Wtm3LyriX6ttBCARH5ANa/OvE4P4TlH5SNok8FohBXv6Q87gRz+Ebx3CbRle1eWpkV0gOg1Lc3LN7Wi7qIVOhw==
Received: from SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21) by
 TYSPR04MB7594.apcprd04.prod.outlook.com (2603:1096:400:46a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Thu, 23 May
 2024 08:04:12 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:0:cafe::9a) by SG2PR04CA0159.outlook.office365.com
 (2603:1096:4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22 via Frontend
 Transport; Thu, 23 May 2024 08:04:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024
 08:04:12 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v8 06/23] ARM: dts: aspeed: yosemite4: Revise power sensor adm1281 for schematic change
Date: Thu, 23 May 2024 16:03:11 +0800
Message-Id: <20240523080330.1860074-7-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|TYSPR04MB7594:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2c74abeb-f060-43e5-3138-08dc7afeeedf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|1800799015|7416005|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?7MuAI7IcrJHrR3ZFuUCYR//MEy2iS4A/iT0KbnCGqKLBGQBl8a3mjvvcTYzf?=
 =?us-ascii?Q?hbg96j47tUWUBzWzWyrMH10LwlWiS+HtvFZfqpwtQHjcbBrLDZqfYVRbWtQQ?=
 =?us-ascii?Q?7e1CtDxRMBAAkJ0F7XhlScE75Q3iZ1lo/1jhrJiKvy/YJPuYRAUxXQHsEkh4?=
 =?us-ascii?Q?9ye68H8slzRqu/f+3HY2bxWMMX30O+u+59Cvg6+fnJuppkaSqke5ZqCumCuO?=
 =?us-ascii?Q?qJrVjV2wWn1RxSYrWTjtsCK85JZH76Wt4ebsGXBYZMz0/FspIHhBlEUooK0p?=
 =?us-ascii?Q?o66/UPGjA5bA4w4llMn1LwU4dkx5diHJBtq49pOF2tmZQJ0KGvP+xkcLwS+8?=
 =?us-ascii?Q?oVaZzlxkL21lGaG50C2QvRED0TZYPdiE4UBS0hR9LrIHbKv2k+HAgyzILxSG?=
 =?us-ascii?Q?DzoVWDLsnZ7rNM7Ov4dT7cD4+GohkDJ1Mt6h4eZHpgfpbCQpshh/Vv5XcGJ/?=
 =?us-ascii?Q?QzmetN5+pbbrfMnCKXfLUHJYAL1pjEGHICHjayd/0EIKLQvtBEKXbdODUr4g?=
 =?us-ascii?Q?n5vicyjBoJvXIJNgFvTayo+sAJnwtS1LY8Dpqoc3aAMcB/uV9NdCAnxmcSqI?=
 =?us-ascii?Q?Nm76EaUtPqMeR35H8lqd5giZ3S3HEaLtW0vVoxep7tgRdMFziYDJtwBJBYHY?=
 =?us-ascii?Q?mST8E9r35yRgNm8afWHD4MRsnVQQJcvLtMYdwnCRv9YbsnESYHyZHbXwYY6v?=
 =?us-ascii?Q?q1qlwZn16Yr6Z3truefa524Z/ix6IRtE34+e9ACF6G7mlkMbECFkCyk1Gw7b?=
 =?us-ascii?Q?AKkGVV22+J2spJFRXssamX6PHWClKZsT3FVJacT59zfllLaA55z+QL5Z12Fu?=
 =?us-ascii?Q?MNdwvbF1JX7pMah7AbApTDBi+sNzOGrp317C+TvCQdoYk5XTEQrfAc1crMv4?=
 =?us-ascii?Q?NEJJJZA8dH4hEJVy7JyV0x+qe6ztL+BT8iJyb9egguyTCufIrK8zVKzXuxYQ?=
 =?us-ascii?Q?T9UvrZGmlYxTVstDhBaE6C2U7WXMMFWwqimTMOGuEHZUP5u2a19Qm2o77InY?=
 =?us-ascii?Q?qZ56qy40QIjY8GVhrZhYXKZGggySZDd5GprWQtcXoCp6UckPm2tlYGCWfgAq?=
 =?us-ascii?Q?3+5gkRvQATjgQel80WBYc1qrYA+MnmqgghtGKxzDKCwAcBxJSoD7ODd03RsP?=
 =?us-ascii?Q?hvwDFHnAoIjAvOkmDUnN0tDfYGcnOFWFjOD+EdyO3x0DzXVcrJiUV+gwMy8i?=
 =?us-ascii?Q?V6wR0GSM0nwxiwAVahkMe+r5bJAaQBdy7fxfsawwI8M3bz0ROiCkv6oLuDfk?=
 =?us-ascii?Q?8KFeZC7MtdzEby4WYarLhiq22xI2bdnKQMrtVWNSaq9gqQoKhESNs958+k5P?=
 =?us-ascii?Q?4T6H5GHn1P9OCNPC8GZdsbHbJI1hZZfwFc6g7yycTj1Rr7NFDlOQE3hYUVBW?=
 =?us-ascii?Q?ZeIPeIc=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 08:04:12.0779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c74abeb-f060-43e5-3138-08dc7afeeedf
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7594
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

Revise power sensor adm1281 for yosemite4 schematic change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index a708e56b7ec3..f0f714c7bc77 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -176,8 +176,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -193,8 +194,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -210,8 +212,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -227,8 +230,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -244,8 +248,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -261,8 +266,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -278,8 +284,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -295,8 +302,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
-- 
2.25.1

