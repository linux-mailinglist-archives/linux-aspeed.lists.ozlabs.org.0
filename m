Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA456878E88
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Mar 2024 07:17:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=QPiGSpqD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tv3MH3q0vz3dVC
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Mar 2024 17:16:59 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=QPiGSpqD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tv3Ly42M5z3d3W
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Mar 2024 17:16:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwnr37gUMphMOprxRW7IXQV/1gio6o547SiqeLi++5bcSAnAcSA1iKMt1ZXk9NaSVXmyFfw0Z7rW4nRCfFyB69hO4xGDfkyeiEbKSG2We8iPrIuo9esMLsu0DTLNGayy5YobKf+2k2q4wzK0e/x6dWSjpS9zAFpduJBpMa2/eI7hHeR5H5so+M2N6SBjiDee/eCyX41NW2TzVxGL62opqoW5Sd4jdR8Y9G8NdO+ITxlNAOF0fnEcQfuCLKUSBfqC0Yt6nDr7Qy7IepmLj8iNjDZXy9XThfSm/1KUpQq38tq6fZiBhG5XSPGO4I0JLXIuXtNNLnC9s1vALdHq9w4Lug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyfzsiMTiBll4ouoSSuk92xJoh4krtds9VMlLuTcNyM=;
 b=KFj1vm39b9qT6AkRDgaSADCr3+D2weknkNdWsQkRy6FoYCY7dXSFCIE5D0vFI5P6br+3kRFatP4nm6c86QepzSGdFW6uriglsmEkcj/6GYSQBgGtSyeWciu8RJDdMgSIPDfPgDzGZ+dlVKVvTWxWjnXRn+tuGanwH9nya9VlCpKryEVZXLdpaDMDiMmoKak9oSJFkns+bF55wFiS4H0csSiUWIrFE9sTa4azecdECnlaWjINnEKltqjfI6mSZJkxs0/AW1gTAwJYDrkDoTe2yELReC9jKHW1LDPVL91A5fJhs6OxhlDQA17galK0uKIgbzb/sC7+XdZDoVZLD6nkRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyfzsiMTiBll4ouoSSuk92xJoh4krtds9VMlLuTcNyM=;
 b=QPiGSpqDrtDvQ3ANnVAmrYAlZVHuks2T2EHCwDRrrFqtgjlq+paPrIkvK/KacfPtpDO8h/rpko92IlpaQTpCbMetYaMvsyMY9nMeAxQRG4fK7RWtiHa0aa3AIwQAHL1YMg5m5WhFYYYG0pgwobohGR5D5Ds5kx/2WRGYpCleCULJ7OOJn1cGbCkCmHErpIqiss3V68g3StYBlLoxGPN/3HtjFknwVIsd+2Ct0FeUDg8VuaiHDG+Axjmpbiwu0KLHFUcXtu+x+X8/XgHk713FOm4Q86vP4Hp20MSY/c7dvBs8uM4/FUZNZ6oJ8E++k2R4kgnK11i2T1OU7sAdyCkfQw==
Received: from PS1PR03CA0022.apcprd03.prod.outlook.com (2603:1096:803:3d::34)
 by SI6PR04MB7830.apcprd04.prod.outlook.com (2603:1096:4:244::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.33; Tue, 12 Mar
 2024 06:16:24 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:803:3d:cafe::52) by PS1PR03CA0022.outlook.office365.com
 (2603:1096:803:3d::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17 via Frontend
 Transport; Tue, 12 Mar 2024 06:16:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server id 15.20.7386.12 via Frontend Transport; Tue, 12 Mar 2024 06:16:24
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v6 06/22] ARM: dts: aspeed: yosemite4: Revise power sensor adm1281 for schematic change
Date: Tue, 12 Mar 2024 14:15:38 +0800
Message-Id: <20240312061556.496605-7-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240312061556.496605-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240312061556.496605-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|SI6PR04MB7830:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 236fa6a8-6133-48a4-4cc8-08dc425bf1c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Gdjq27Y2tcDCSX1XIY4NKRQr/PHdJ4Z176v7VDe4JDuCNSKCOaVewYCvIx+QP/NsZ86fHq7pSh/FrHo6pOMDD3bVXDlQWChjV390VfioO9fhdz0tjITorOJrTuNhrVGvADE10ndCK+SH9zbYQF8Itey0IQzJCfR0drSbVEO2tAa64HvJnsZAaokGLvlpE2OYa9cGlgmkDMErpmQHlMrElGTZsTy1im38CTgO9ckzG4HremmXqd63qEnhAS5zmkJim3a0Rd71TojmKSAl58COD3DVloOmQIiyj24BmVzGY3WkbQojE2wVV9spzUkZ1ReVaM9k3FWwfd5PFcwY+ue7H92YtiELwsH03NVey+yunteHjC1vaziy/8kq9myX/tTE2t6x1OoASzKeluDAeoukDHOto681MECmptcHO4AGp7R6TvczEVSkhz57MgzL2G5AAr0X5ZlTRweta4SQA5otHTUwWRODiiVPLHdRbHBLzFwaHK3vM1mbf+eQ5hrmLticpY/u8b5N54of6EMOJrpTbyGXoi1WsjigzWFOykhxaSNDJnZFZByWoA0TPUdKD7J6Bjz3jiYF5PDtOkNoibDosdI15M+Wh0rl94ZXYPLMf+FPoYJ2TEDAE9x6Xj4XHAQ3Ms+F0hIpdcCnPAfI/E6KM6lpmwZvzilEffQkKP3S9yP5nExWhCUHcIO1Kl5RyRKa66R92wwF6JAhurJMGL5n9OGnSJtrSPqxy3Sp5l+wysuiLwUnPPoFN3hjUpa4ub7w
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 06:16:24.3538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 236fa6a8-6133-48a4-4cc8-08dc425bf1c9
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR04MB7830
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
index 23006dca5f26..af9f7067c57c 100644
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

