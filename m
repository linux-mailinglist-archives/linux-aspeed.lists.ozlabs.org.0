Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F06C495973B
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 11:42:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WphFX0QRFz2yVb
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 19:42:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::606" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=CVlkdKP0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::606; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20606.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WphFT5VSyz2y1l
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2024 19:42:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EdTmIcDvdrp/QLk6eBSi1rTDm3k/MSrudlRuJnukNOgYaXyEbOoLpHEzu0koJ2O7xh6cauBjwr2XMCWsO6Vpx6HgPWaKfh8h7PjOWXB0R3LuluREmho8MAzhOfUVBhlhfVj8/4s9Afs/N/Q4jxHs99OKVsKlaOV9YKKh3oJUCO9lUFGSVxzGWqEVBXlvnDlNbs2z6u4rNnP5d+RLymurOwS2GkLwGH64e7kiVxieCyP668Qhcy4NBxwVdXpU/2GU1Jvbv8DbXp33biLAQTXth0z5c7BlCtmHn/wL+GJj6EnZPIhm8tZim7g6PCm6RK3K8c4a79HU3uvGQ6Xhm4jyzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIYwTFLr7k3/66Qq65omckRUKm3v7IIjsRhJzbIKUfk=;
 b=Pp24H0kcaBxiUHC9Q54VVP8nrRkbQI43Gi9J8gZq/+NfGkhMOcIYPdUO/xJ0tAvcKETRb4Kj3CmW8NJw46oosSBKEkYoEdY5b+mtVIIxqPhcxHa9UfMU/AF+YzEHbwVXbZrhLZ9QOn8Laha/MvKcI+EFHG1XzH28wfbYsG0ktpjgAsY7ygXROlu1pnemCHrpNs531zLQdhv8W7DnbNYYtwL6nzMlY8UYIMvoU+lEnreWq/WPw2AKWm6BXkrESz8nlNYJUcCyb5z1sajJGNcuKNG+Rxazh7gdrGwnDqo9sExA9Ujq+hxiRrRmnhpcBEv8SKkJNyVrP/DKCoKHa4BP2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIYwTFLr7k3/66Qq65omckRUKm3v7IIjsRhJzbIKUfk=;
 b=CVlkdKP0l/Ugyh48suwGyAmSc8Rxn6w1umQgpN+oDv0qJSlBJcz/Nwj3h+77t4c/Mfl7/cnZHD3xNBwUlRglNOyDEJLPmK6OjyoE5z0Nxx++lT9q2UKidENZ1q98QofK2CERoSiOI2TAfdiQH1xA4cXeSEYVLPELoF40xffOi/0/dFc8pOQ6UXS60tGsBC2U4cQNbz9xwXgWrTTUmmSfBLMuHCaAEcPIwiDhGX73E+uVfSpM/MVk2wGmhxOusylgyetfP0EiPJZhKIJDwlGnZ5cUDTxsJ9jzATA1Ki7+uJ3ZZJUNwwurSafiHZm4uXxmVNaQ51D0M/m7Z6XGYnNOAA==
Received: from SI2PR02CA0021.apcprd02.prod.outlook.com (2603:1096:4:195::10)
 by SEZPR04MB5753.apcprd04.prod.outlook.com (2603:1096:101:74::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Wed, 21 Aug
 2024 09:41:53 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:195:cafe::f2) by SI2PR02CA0021.outlook.office365.com
 (2603:1096:4:195::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18 via Frontend
 Transport; Wed, 21 Aug 2024 09:41:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024
 09:41:52 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v13 07/29] ARM: dts: aspeed: yosemite4: Add gpio pca9506
Date: Wed, 21 Aug 2024 17:40:18 +0800
Message-Id: <20240821094043.4126132-8-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|SEZPR04MB5753:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 054c7c99-5d48-4357-d751-08dcc1c57d5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?BRdG3j9D4V4oCt5Wxnzk9DrZSWpVUJfuvZHZ/gfq3EHDtCBjJR0FZ6xftrFO?=
 =?us-ascii?Q?5bY5tRuQzFvFiN87RbvbQr6AI7Aw8aRBDEAQVYrzh7ZVdcuqVUaGFqGIdiLc?=
 =?us-ascii?Q?6L6uabwDUEWMzRjcYy3/t/LUQqDK1VJJ1nbvEtqxdneJZBOxz9ujSUOJNRiq?=
 =?us-ascii?Q?1Ui2DgkUBhMhN+WwE3nIzdjg6gABQSzvvgRNYRwpULDOFno+8vKgHZ99oSLY?=
 =?us-ascii?Q?7WPeCKTTfVDjU+OvRCHkpqjLyWfj2PgvpqwvD8TFnB0Yd/HDOyolYQ7SYIiY?=
 =?us-ascii?Q?m6ZS5mAdcfanyBII8zQxUUR4db0FuLthyjONaVC2855fDacLbwWmJ0OBlXd7?=
 =?us-ascii?Q?t7audiBUgKTOcKE9z4BxUit8XzhrsGsmOYR0PU36JEmbLmm/SMCw552DqG3S?=
 =?us-ascii?Q?LCO0gCsoMdkVcgXeyGim6J/RKebZoHK0hbJdIJt+nMWvv8JXfhIGNy4Y7eY1?=
 =?us-ascii?Q?0WMiqI7ZczT5b+WAv/tR8vyGNV8DBq5vbU0AIJ7Tl7SzpVeBmI4lWfv5ccM+?=
 =?us-ascii?Q?PQcZ1WHoL+UBYxbGFvcrQGATQ+QYQ9OnS3qI6oW5RRP08u3248mltloCWexS?=
 =?us-ascii?Q?KMZN1gZcn849jLZupwt3qlABsPYHM8H/pjHDI79cZBoFmHzF9Ic66NZ3K1je?=
 =?us-ascii?Q?ZQa0kG+yTzXDR42AUUwMNS2SSe1E/ZVQyQ4WV45xjXvmxl9//vTR18L2mMce?=
 =?us-ascii?Q?4qL55OcEBYDRtLoKN4oYQVMXIr5wNjgbdBUpmccN/GSW5ux6MJw2J8v4b7wN?=
 =?us-ascii?Q?z+nogpO4Dnab371laTd4yCWbVSy4tAzZBzZssJBLxlCK2ySTBUjciTbUGyYS?=
 =?us-ascii?Q?iWxmU0eKMuphCKz0L++sG4puo0zpJTMcQiYRwBrh370NOW076OXJZkP/FLlz?=
 =?us-ascii?Q?ur87NP/jNCSYk2CvWk8KDUN3eZa0gynPWbDFauYj8hQ/MjJaepe29v2OiSiH?=
 =?us-ascii?Q?I3Ughnv/ErRATwO70QowYeB2sgO/OvbHhLbFaxjB3pyftFjkv5SlKQrrxjtV?=
 =?us-ascii?Q?DFdsGiWsm/fR+BvcQwIW5QBMeduOg7NMxur0pX7xssicqHfJsLayROEqWDx+?=
 =?us-ascii?Q?iC0AM8h8k8IOEB0RMOFG6mIYggSGjg7p3GnW8E8DHMVneO6Xfali/pz52aJz?=
 =?us-ascii?Q?Fr+7XzTCR0NlKQhWxyevIYZffW56rZKszTWQUY2jiyW6UNZSA8h0rOsUJk1/?=
 =?us-ascii?Q?AKN3/2Y3aFbRa67wp3e2teINE1LKC7qnfum3LNvtyYhPkWm0/92wtNASn1hT?=
 =?us-ascii?Q?logRAssipFpP+5Z9Wys/wgDM7HnTn4aUuqpsXFIybQP2nYJSYcA04x/f/fHw?=
 =?us-ascii?Q?+0hjgswTu13KgXJP4uclhbDsrBJt2sEckBEdZajixm8XZvQcx1RFXSy7Lqc/?=
 =?us-ascii?Q?CPPw0BYOlR8ftKPvGtgaPyDPE6gkyT657SbkOPOm7JU26r7nUPj7naevKfKA?=
 =?us-ascii?Q?Voa2GbQ5glJKJNzsA5vo9ts1QmWcyOp2?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:41:52.9341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 054c7c99-5d48-4357-d751-08dcc1c57d5a
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB5753
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

Add gpio pca9506 I/O expander for yv4 use

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 252 ++++++++++++++++++
 1 file changed, 252 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 7b79fcd77c8c..f4d27f1ffdb8 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -175,6 +175,34 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@24 {
+		compatible = "nxp,pca9506";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	power-sensor@40 {
 		compatible = "adi,adm1281";
 		reg = <0x40>;
@@ -193,6 +221,34 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@24 {
+		compatible = "nxp,pca9506";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	power-sensor@40 {
 		compatible = "adi,adm1281";
 		reg = <0x40>;
@@ -211,6 +267,34 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@24 {
+		compatible = "nxp,pca9506";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	power-sensor@40 {
 		compatible = "adi,adm1281";
 		reg = <0x40>;
@@ -229,6 +313,34 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@24 {
+		compatible = "nxp,pca9506";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	power-sensor@40 {
 		compatible = "adi,adm1281";
 		reg = <0x40>;
@@ -247,6 +359,34 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@24 {
+		compatible = "nxp,pca9506";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	power-sensor@40 {
 		compatible = "adi,adm1281";
 		reg = <0x40>;
@@ -265,6 +405,34 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@24 {
+		compatible = "nxp,pca9506";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	power-sensor@40 {
 		compatible = "adi,adm1281";
 		reg = <0x40>;
@@ -283,6 +451,34 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@24 {
+		compatible = "nxp,pca9506";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	power-sensor@40 {
 		compatible = "adi,adm1281";
 		reg = <0x40>;
@@ -301,6 +497,34 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@24 {
+		compatible = "nxp,pca9506";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	power-sensor@40 {
 		compatible = "adi,adm1281";
 		reg = <0x40>;
@@ -690,6 +914,34 @@ ipmb@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 		i2c-protocol;
 	};
+
+	gpio@20 {
+		compatible = "nxp,pca9506";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
 };
 
 &i2c14 {
-- 
2.25.1

