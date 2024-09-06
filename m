Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2168896EA61
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 08:29:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0RCP111vz3cLl
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 16:29:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725604159;
	cv=pass; b=fns2IuIWIeNho13O1XiC2nPHr09cbEjX3EfkarWBUoS7MkM4Qb2GUH6DWwHl5B90AaWmWCtiKTzBYUt5+RGGd1MNisNdmADvl+Bx/vuewOrtDc6GyCSvZfEhxkttemFDHC5iTVMsvRMP7hxCuSrpGB9a3gv6bV+u3lf9qT7ZZTCFCn6PEMZH8mFj0SoW2IQwoG5yy7hbGChdtuq8v3keXl6jAZKx9QjNDI0QyZGMaD/ulT5ENlQ3EojcAeZ4bdsYGdTC//CxN+EVus8QOBD1aD58354Jf2adn/00j+8FCDlt+xM3qrHVJ9glTrk8Bbt16wjZvzJG1YG61lAskTjATg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725604159; c=relaxed/relaxed;
	bh=rGEY6kFHCr93vzQaG19EtYDkCI9Rttn+5U+iGfkqrRQ=;
	h=ARC-Authentication-Results:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:Content-Type; b=Q/X3jBPx8HawkKi5zwnvStklfiSXsikb1mlxckbk2gB3Lra6oryt4ZWNtyrk1URrUzWwLY12i4CukjDdJL+CrCXIJYdUfnXHEGJ7u6+Zuj0sAjNWGONc5HMuJ6OrYaN2972C8Uobl45CBDm1H3+PeACkDepWjq2PITqHbTk8mKRKU8rMZE0aS9/b72iJwgFdcW/s9muiywmNl+fGIje3DTdpB3zZxcQQ8cmWU8PXVejUYZfKXtuTHHbYmNNq5/l3m9PWNbBSv+eDzlyaunIK5CyQpFQKN9YrpEm6ub/+WtKPNOZlDUG0LM0obPkUndiR7NAV8oZOMb8CNkYWuJKJ3w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=fmQAlRRv; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=fmQAlRRv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0RCM2rprz304C
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2024 16:29:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9FOu5OGsoI4hqgvFrz2UfbS5a1nim+rxbTfLqwaxBXLoGdCDwkJ3bJAy9Gj0Gidehd8jRHrcNp7iwjug8+vPp2Y/PoQgF1NLkeGYJ1KieZWwDhcwNxOVe/ZdTk2vgRIX3lKx/VLeBIrc03qR9NQQjSd7up/DHJ30jQWHl7cbKpPCtmscbhxCGXxGRz7pj7WoPSEkaCFR4U7WmFaQUKDot78jO/++ZnBVlwMZsE0c73XxXn+lZxLwsmEkD7d3y73NAtoBrDb+F2hBA/fxE2gHFVQM1TIBFRfy0oV1nEAmhAWi6CyZ1WKW87RQ3XgyohPe32zztb2vLNS4Iy9LDjkXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGEY6kFHCr93vzQaG19EtYDkCI9Rttn+5U+iGfkqrRQ=;
 b=Qjs5oH+z2n5A4/wu8ETmtEH6RZr6Bz7VUb/SkeiJDkSFnYxqN9niHYcKaOXY44FyV6XW+uaLS6hwV383m9fni72YHyIcdtcnWOwM2d+UsFOtoG36PY3mIsWVUYk1gKseAf+gCy9Al+Sa8nyAsGpJhiA9EAJWrjRG9TGCyCBUJ29iZcTN4RLhbUZJzcCCi7QYH4lXL1c+zWCcJlZ0LBe0WacRCO60FYq09WPtoekZGlBOgYT8+FrEu2y7bIDGPteuT9vseQwDvuVwau9RvspwS0xE6MgD4wQUP2PfFuzRn2HQYPyUAKdRqI58ZY/OehvkKl1ZfwwK72y77Ra3+JYokw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGEY6kFHCr93vzQaG19EtYDkCI9Rttn+5U+iGfkqrRQ=;
 b=fmQAlRRvNvDhmeifH8W0p9RfFwhNlypvfCi5sNVIyKtB1d3MHmdsAaQKPPtfnTtKfTyzx+PCZU6frLDJMyjGNCzwUkorzHjglXFUpZ9OOIYDg3EHN0Wu0gwHV7jcefMvXIGW4ZcufUtm+qAHd2cjNdZ5ZseWde24dpg+xgDZFHtsMiLKtNorL6yNcJBSf5/uu46UkF/T2uOLZVJtYtGwGZDwjOoWNJH9CRbLXznSC4n4BfSVRRBZ01qaR1AJ7eJqN8X+1Wq7v+iqM1gozgZYkHeLCtWhzzmwebMRl0EmYdavUJtLiJyv141rZosk6B8esbvmOHFqgKSuxUdFjV8RmA==
Received: from PU1PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::30) by SI2PR04MB5896.apcprd04.prod.outlook.com
 (2603:1096:4:1ec::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 06:28:54 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::d3) by PU1PR01CA0018.outlook.office365.com
 (2603:1096:803:15::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:28:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:28:53
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v15 26/32] ARM: dts: aspeed: yosemite4: add MP5990 support
Date: Fri,  6 Sep 2024 14:26:52 +0800
Message-Id: <20240906062701.37088-27-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|SI2PR04MB5896:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 10a0752d-c3ce-4f5d-58a6-08dcce3d2df7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|36860700013|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?rva4kTslprBq3auKgwLlIK2zV24aaWdLGHT66XY8Aje70xjTngdFGqT0OX60?=
 =?us-ascii?Q?y8U7q063urKf25yKndLej/ENGs05//y5crVROLjrk1A8ZvDV3yIPDmepeFr+?=
 =?us-ascii?Q?HEpABHjsj88pKWFsxonhJvWXWY71u2lVfTlZrUiCSm5K7wZMKO7XslgpYuwA?=
 =?us-ascii?Q?VSRtX7CN3wVNkN2/BAT94tEUjuYnhFrH9Cudi/RFJPVr4iS+vCbCRYlweMzp?=
 =?us-ascii?Q?3ntuKU12LDMfkMQJjsDllElL/GqB4uGRayZkr5rW408VYMb8KNPXEp0RNmG+?=
 =?us-ascii?Q?iO10qudg7T0qBqDrh+kr0gIKBxYE5f5opzc0wKXRhguEJEwdIk/OajU8ifkN?=
 =?us-ascii?Q?2SOheQg74HD0WFv9na2PhT9Um2CONpf7rtteBCKaneNLDEx84xHA/b0ySoH4?=
 =?us-ascii?Q?VZLPJkwqsGppQTz8YKPpADtWOnhXfrrFpQtkzogdTLDRPLrwIWcFkgYOGXdN?=
 =?us-ascii?Q?yjDJrBCSJIhZt/bWegvbZMII4XV2h6p2mZH3t2vwilPOOVuIsCtMCgFC05cq?=
 =?us-ascii?Q?jNO7ab40Kz92TNHpm49u/p2MIEb6w2K5OdXz/dBHUklGbziJe4IYHqb3Wxaj?=
 =?us-ascii?Q?IpfdfX6zaPwsuj6e+0VVrFLDp6byKMy9Pq87LcOi6A6+oNwiaGrqIAt93iDK?=
 =?us-ascii?Q?OA5XnWD5z+pvAW1p+ZK4TXjAMSml1FDxcbvBLOxt6ZIbi5zmSpxeznaG/Evn?=
 =?us-ascii?Q?yQvES1VKEIOdVkqtyiHuOOaglZnd61NbKhIV9jI+hkWjB77H5qnD/t3W1oMh?=
 =?us-ascii?Q?VyS4EYuR+b8Z5XiJb+repZNa+ie1y2mEPAdS1TYcMivpRGEy6p21W8gm86AE?=
 =?us-ascii?Q?87mFWZ+RuYRbow/fvXlOMHy5hrJJ7aKUFLHncM5Mu2bI8Z6WosquOGw5o8kO?=
 =?us-ascii?Q?l7xY0P8/K94N9/ehwJzYb+vi3vdr2wAxGWLAZ59MMayOVFUQTIXvm48mqi7P?=
 =?us-ascii?Q?FF05np2J9J1V7WDIaNO3i497jHpqOXxQmkohW6yzF7VADhdBsQQcePt7rtee?=
 =?us-ascii?Q?frTGHnLB0CzWB2d2I6g0Ar7iWEhU0PyauRjlZxbPywQVQhsjsXb9ktISebol?=
 =?us-ascii?Q?pWhz4DJ6esohyOkDIRe1/HygxBrF+M5nLzHIDE3haUjRUlGZ9+TwfV858G7A?=
 =?us-ascii?Q?uoinCvvMDqkeLyXPHlmvPCSUOMUZPYzEB817ioyIjH8T1BVJP26+yWXW1F8n?=
 =?us-ascii?Q?hDIC17AIFCFJwpyla/JvaR3QEnsNJBZJOQRVcJzuvObpSgsj1eJ5sRBdLusA?=
 =?us-ascii?Q?aOUHKMUA0UTKTvPWIYPIP3QR9rZC/33zXxKDFMpTqSXlqKnz5P5r9HKY45fw?=
 =?us-ascii?Q?OisAybGyFnBO5s1DaE8RlW3ADbfgSFzv89sHhpT0Ipy9LF7/IrX/AHznMRDa?=
 =?us-ascii?Q?v+nASA21qCReuyvKH+zyKUJF0+U0tkMivxWBtf6DlO9vn37ggXJW1w/UnSdj?=
 =?us-ascii?Q?m0GvOeJ4kbG1GXDDSeWPQpdewG/4UdTJ?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:28:53.6310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a0752d-c3ce-4f5d-58a6-08dcce3d2df7
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB5896
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-aspeed@lists.ozlabs.org, Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add MP5990 in yosemite4 DTS.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 03a1e41312e3..f139f426099e 100644
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

