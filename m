Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ABD93739F
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jul 2024 08:02:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=h+0OM1ZI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQJwh3hCdz3fph
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jul 2024 16:02:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=h+0OM1ZI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQJvg4JCNz3fmt
	for <linux-aspeed@lists.ozlabs.org>; Fri, 19 Jul 2024 16:01:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJ4oWffiCKEtvBbI7BmTO0chKxSZcomcKhUCxvKoNg+CBZUj2tDW84vGjzjSukT31V1MoZ502RVbsW58fRp7YuRnJ6F0VGRUzO1DeKz5qNMOsrWGZdKOPF1GYeL7bGYVV+pk8OS07arH1ya3/Y6kM4V65B2FQR0Ofg+S3LAlYZqaFFnd0OHvbXCFBo8+v0YG/dW7uhzT1S3Jr1I7fQARrVoN3R3kyuDttLS42tbG0STCj00PLfkCtdohEhfpBFXTzVLekjr08H/ty162rRYWDR+b4HlHdH93JU+dijiPRuzyiuswcMeoBFUaaGrUb1L+4OEIWC8GMlj6zBx6CUFcag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/bQfKhYxgR4PXNMn6B+jPqMYJhYuyz0n/Gf4miQ1Nc=;
 b=dvr7AiNwTDmXR+ZX2xkDpKHDUEcnqd8hiJ5uXkuuSoGgGYdTRuMPRCZ6Sfpf0GL//SnN+tNWlNAiMTrB+6DhgxhsZgX2EoAo73d3ZRHuKb1RCY/0xxeZ3hTiq/oN0VQUheWmXcsavsUCeFSQXYBNmxQQNwZ2kDAHBG1yUuVLu9+dK3Bi/hBlD9mvWnhSSgCOMZ5I1XOhBDWZbQuGLXQ5N1+L8aiXF5lYiT1+BGRqnOPOXQKj4HjFj7a+wZXX7JFKnlgbRZq0l8/Gh70zS1zuyh9KS8hQc5OKs3Frd2cei4eeNqitdKnyavMdL+qAg7ruTxy1xI2J+ShwxhgsHeYgvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/bQfKhYxgR4PXNMn6B+jPqMYJhYuyz0n/Gf4miQ1Nc=;
 b=h+0OM1ZIT1EOK94EkczD38DycoTJnI75uzmwym2BdiJUeuDZitt7iKqlm1bcxrn6r/Mot9xYi+XuOQZ01OJJ7gb2ZlN7ToOvG5kdtSQn7qIBy3+D9thsOwuafFpj8aNl5ckpN+YogPiX06x10e7IU7Mrr0J0S2yri1yd8yE/NRUJubsRh2ujsfWfJaBlHsH/m/3OKowaMBUcY7snvnuzNd1oSzkZhT+fqzdZlfRoyMRoW9lUWOPdXfBUSpdS4ux1XwEFxv75hSB1f+v703car5/nz6e5fYOQuuDjMGcZ7E2JSNnrkMQMjCKPoZCWFsmTSdXZG+aUg9ONDmLHwqWIWA==
Received: from KL1PR0401CA0032.apcprd04.prod.outlook.com (2603:1096:820:e::19)
 by TY0PR04MB5885.apcprd04.prod.outlook.com (2603:1096:400:212::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.9; Fri, 19 Jul
 2024 06:01:01 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:820:e:cafe::fe) by KL1PR0401CA0032.outlook.office365.com
 (2603:1096:820:e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18 via Frontend
 Transport; Fri, 19 Jul 2024 06:01:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Fri, 19 Jul 2024 06:01:01
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v10 26/27] ARM: dts: aspeed: yosemite4: add MP5990 support
Date: Fri, 19 Jul 2024 13:58:55 +0800
Message-Id: <20240719055859.4166887-27-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240719055859.4166887-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240719055859.4166887-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|TY0PR04MB5885:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: afb01f52-099a-46a0-3d7f-08dca7b82adf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|34020700016|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?9YtGwzeCqHnKtVBtyABN7PiYf3PdBcKO99crbfsQykfH3xV4ZF/Bd09dSbuY?=
 =?us-ascii?Q?NUP9Jso2WoKeUhV9XNDCjWFE9Ni48xoUh9LyDhXte/AcsDMjWMU2k6ugFePW?=
 =?us-ascii?Q?Aey9aJa6ZULivx55Bi+PDWiwERzR4mqDD9a1BxGnu8B2hjPmFK+BOxyjs/Bm?=
 =?us-ascii?Q?u5HalULKpRdm4GSrpO8SakaNhqGqNgDZPoKgSBmKKmsnCt0YonMH1ZpkJHwK?=
 =?us-ascii?Q?Oo7aMzh/dyQF6tyKgk63BhNTPBEz0ZULl4vqEBHh38T5nuPOl3xH6RTnyA2O?=
 =?us-ascii?Q?nHyPvAgKjtpnq12noYK8LxMh7fHkrvwlB69tYjfo5XoPsH5wDnHOYZcueXxU?=
 =?us-ascii?Q?sD659sq21Om2xh7VjRY2DApKc/GsGUl2ynqQ4A+WQdrtqx3Y84JIUOHLJMVD?=
 =?us-ascii?Q?Yy+7WaSz7QXLrPgW5qtb9MGZMjLtk4ppUrUhNZAiDgf4FEqdQtfXw9BYO8jM?=
 =?us-ascii?Q?EWt60eEz+eC28hJMFH0NOiVYd7U/FHvWHEAITPnzt4xCSNgczAO8VVCddXT6?=
 =?us-ascii?Q?Z7OPLBUOtu/oFQ588wat2r0VkOP8xt8E1UkeONo5O1A1L20FdRhMxmTuXcEc?=
 =?us-ascii?Q?XDKkRe8H6JoPJl5z7BPd+/zFr1WfASXeKC7iXWx2KWtwxg11M39xD5Tl8gRD?=
 =?us-ascii?Q?ajo1318lDKzYlP5osSz2tmRBi481aXqVJvRgLcPhB9GzrjKfMd/n3BVqtQ9w?=
 =?us-ascii?Q?nfN0GTNkeiHjToNHnvFd6LtH50DHmKbdD4212DNavcner7ZogUbKUeEcgNnH?=
 =?us-ascii?Q?CyP8NH6ipMi5HwmKsO3gDDLmDsula/e264ddZdifzED+yoMKy0a5eMeG0pOw?=
 =?us-ascii?Q?uiMric7FCzXHQ6XX8/nHxgk6gr7OziHbynRsiPTmg15szFVdyHXlRxcjmfoJ?=
 =?us-ascii?Q?AxIOqJz8cMSVEOUfgJlYwenDnSXUtJ05p9h9Tu+4tkwFKiD2Uprw3Ih21PhL?=
 =?us-ascii?Q?13WcIhdO9sTMBLbp1wlUjypVa72sksu5YO3J+n+qqzvBy2ZKq+ZpxP/B9EvE?=
 =?us-ascii?Q?R1XUVP+BAp8hJbeZ3vypkM9dv8p88Hh+c65VndiO6BptvtqVF/DjiCDNkwAW?=
 =?us-ascii?Q?TZVWAD2Zh0W6g4XmGUHd1RmztEdQszPEE1nO6hw23bu7hOlwslS+OnCpV9HZ?=
 =?us-ascii?Q?dhhpXNMkpWMfo9N47or34cZJMDbxThji1PWqIkIJnkCk/wGYuvgqPOzClYeA?=
 =?us-ascii?Q?neCcKnV7ua1qDebKwaprvv2DmK8StNbQxfIT+ki2gotfabQgYUEhMEuwQz+5?=
 =?us-ascii?Q?JWt+E8eTgot8PsMPoB9N05MHh77FGStQLR/igtKh4aha7B1q8FY+v/4lhXrg?=
 =?us-ascii?Q?wEvDeQBoV12Q/bXKBzq0DQNT7D/jpR90hWdz20ZcKJZgWOBMx2rlAVuyPAXj?=
 =?us-ascii?Q?bYgTd5dslvXocrb4ARmcdp42aBBsor3dXBzZT9yRqTobjswJdv0uDurEfVWX?=
 =?us-ascii?Q?Sulil7PcQHsO/JJ3TB2FGoxBpI5euLv8?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 06:01:01.2362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afb01f52-099a-46a0-3d7f-08dca7b82adf
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB5885
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

Add MP5990 in yosemite4 DTS.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index b0eb38f9aa7e..7ad080e3f432 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -356,7 +356,7 @@ gpio@24 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1281";
+		compatible = "adi,adm1281", "mps,mp5990";
 		reg = <0x40>;
 		shunt-resistor-micro-ohms = <500>;
 	};
@@ -402,7 +402,7 @@ gpio@24 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1281";
+		compatible = "adi,adm1281", "mps,mp5990";
 		reg = <0x40>;
 		shunt-resistor-micro-ohms = <500>;
 	};
@@ -448,7 +448,7 @@ gpio@24 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1281";
+		compatible = "adi,adm1281", "mps,mp5990";
 		reg = <0x40>;
 		shunt-resistor-micro-ohms = <500>;
 	};
@@ -494,7 +494,7 @@ gpio@24 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1281";
+		compatible = "adi,adm1281", "mps,mp5990";
 		reg = <0x40>;
 		shunt-resistor-micro-ohms = <500>;
 	};
@@ -540,7 +540,7 @@ gpio@24 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1281";
+		compatible = "adi,adm1281", "mps,mp5990";
 		reg = <0x40>;
 		shunt-resistor-micro-ohms = <500>;
 	};
@@ -586,7 +586,7 @@ gpio@24 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1281";
+		compatible = "adi,adm1281", "mps,mp5990";
 		reg = <0x40>;
 		shunt-resistor-micro-ohms = <500>;
 	};
@@ -632,7 +632,7 @@ gpio@24 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1281";
+		compatible = "adi,adm1281", "mps,mp5990";
 		reg = <0x40>;
 		shunt-resistor-micro-ohms = <500>;
 	};
@@ -678,7 +678,7 @@ gpio@24 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1281";
+		compatible = "adi,adm1281", "mps,mp5990";
 		reg = <0x40>;
 		shunt-resistor-micro-ohms = <500>;
 	};
-- 
2.25.1

