Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4A793737F
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jul 2024 08:00:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=xMyvLTSU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQJtg24QKz3fRW
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jul 2024 16:00:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=xMyvLTSU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQJtC5kqKz3fR6
	for <linux-aspeed@lists.ozlabs.org>; Fri, 19 Jul 2024 16:00:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NihERkSAsrY8VbTZQwjmp8uwAlDu495bgHXuXGYausfCenxUNphE6yP/9qpGnT0iLoylVHY00+D26S8NAEcJl+JKesvWMoQWFNV1FikMVjKIy2++e6l2sAY1zN8zUV0OVlOB+JKVGav8Yus9DKHal1WraRnm5bASo7VSadrPMgwMT8y0G5w2BmlrLapp/Ift7Jtb+jLC90LP8xonnRsWy/hCtuUMpScdOSz98rCpLjHH+YUcK5bR3WszZGHRLqBl9pxS44nkRQW5lMzIVt/1SDp2qBGCzpo4g1Q8vDh1JvukJiciCavTzxdGAhdeEd3GcObIFrEd57YGbh8DtXzWfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QB96pUAHPYpne52+aZSEHu32dSiQWPF5XIERkA9QsJk=;
 b=klDpihZRu6iE40ZVpOYrOiRwXK73lqsEvA867xeOZ8QVaexJI1yydZRe1SAVQ1reCCZH3M2Cw2cNnuc7tUqOtki//9Ecx/q5sCp92wCVD1lOvGSdF7n7B5rNquXaGGtxKsOXzW342LHeDybbxL/sLP9uewkzPFMP2IROiOPk9uKD1LHxFIvoXruzbgS23p7oucovP0VJNuKebgS7Bnht0hArH4CCdFM0r8cTsOx7jh9Q51cCUnR8GZGXjUXVqQRtSyEV6f01PozDgwS4RFjjh4K1DequqSayQt6+W1t+tnnI78hbte1fuXY2oqQa2P/uguERXnwj4mTLVZc3GKv+CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QB96pUAHPYpne52+aZSEHu32dSiQWPF5XIERkA9QsJk=;
 b=xMyvLTSUUfpjNQvAORlBQtKXV6ZU5pKvq2qW+rX1AtJh6bew4+X46vDXmnM6sNjkX36rObSC7Kv1ksicJYCbhdaQqhWgxqLYjYTrZRRszA95hrPfr57QC82e8Poo2RGbRoV31Wh0dNvI9UJnQ3MCG/PzkbU6WqaUSZhlB/7Tzy1XkKZzfXT9LDcm8xwtPOSYcOeipD+pTD4r7WNKMocEom9U5XeXkMG/KAl8hmNrhckwqeop/qLi8Z2wzi87d1HPYnk8+ohwfvpsKEOBArUM97Yt2TF81VeNacpAJ2E6z/VV3qpKjieQ86pcEOB8mzIq6zOwFlDbi8F4ZFh+qEazDw==
Received: from KL1PR0401CA0036.apcprd04.prod.outlook.com (2603:1096:820:e::23)
 by TYSPR04MB8167.apcprd04.prod.outlook.com (2603:1096:405:98::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.12; Fri, 19 Jul
 2024 05:59:44 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:820:e:cafe::96) by KL1PR0401CA0036.outlook.office365.com
 (2603:1096:820:e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17 via Frontend
 Transport; Fri, 19 Jul 2024 05:59:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Fri, 19 Jul 2024 05:59:43
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v10 07/27] ARM: dts: aspeed: yosemite4: Add gpio pca9506
Date: Fri, 19 Jul 2024 13:58:36 +0800
Message-Id: <20240719055859.4166887-8-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240719055859.4166887-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240719055859.4166887-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|TYSPR04MB8167:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 796e6169-da46-4bf3-587f-08dca7b7fc74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|36860700013|34020700016|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?MROa1Tlu530wulNOQlBINeAgt6nbpafZFUbyTP9sOSY7FcvKdpQ93T3mf5az?=
 =?us-ascii?Q?aItxVZDTOqtUuJODun6HpwiUgr2jtAl/HAB3UEeI7g09nj9m5fXLd8jy7V8T?=
 =?us-ascii?Q?EJSZUTqvNBez0zokHo7C19qWVQkM5P0pZgXu3d7L1NWwy078RlTEFSrxFzxN?=
 =?us-ascii?Q?PiFkRnynzvnj75dPneDKWOnG3bGdEhSkZBPQ4vAJ6SPSs544zFCYzz3Tv9LI?=
 =?us-ascii?Q?nVqvqH+wGoIwMEI8IDh9ToqGRmd6Usi62zB4owVHvV06yb/bFGmveMzBlhMA?=
 =?us-ascii?Q?MV1oRRh6PAvDQCGaXWZSCmgq4CsY8KwMVYrkiLWpHg1fMVSPw6gnbsZFmeyQ?=
 =?us-ascii?Q?jUplYGZDBlZKOvX80BudBOTtZJF3BacgnOl3lIB7Hab/Gc719ZZIbWNv/M4t?=
 =?us-ascii?Q?2ffWCy9tkwShPlmkWZGMfaWraXuc56AmfQ2fybwyBmqTw0n37zKA+ClcKFsR?=
 =?us-ascii?Q?3c3ryc3h6mD0+gIUmRGwqsCJg1JIWfP/UU7kJvgyUzvw0eBCimMQ40kjoAch?=
 =?us-ascii?Q?e91NGuuvfUIXSrDT0S8ZQzaTdYPg7FxDpZWNBbtsGshSjLxGJFHRwI1gSvi8?=
 =?us-ascii?Q?yFWWEGR+icVJYMcWIFoJw6Ju3tPqrYrrMy5vuz5IYXzFXz0fjfGor5TIl0fW?=
 =?us-ascii?Q?BGztDPn9uvX+V+qWe0NCAIdpn02qAMcBtFqGf+pIDEdAbf5ItyplL6UXYMRL?=
 =?us-ascii?Q?JnHLE3xJRsyDNuSN8R/r81A183swomiFr6PbEKIpzf99KUy/IIMYZtGxNVtw?=
 =?us-ascii?Q?GSNKEAYxgary47NqByU/r7LtSDCfywGMhtuqCXFKfDjM7oke+74gajOdQtt7?=
 =?us-ascii?Q?aoqhu4E7qrTFLJf3LpO3vKjaMm+sWmEQKAjmFznAdDk+n5Nida2ZL7KzI7xI?=
 =?us-ascii?Q?jGMUi2N/kmj4eFTHt/2TFmYP2ibKg3C2JxFklEyP3JJE8rWkr66c2HqJwhKm?=
 =?us-ascii?Q?OUvqaQGKhPaYzwQpqerouRR5EKvt/KMoimkCNBw+qpqnlDD1s6bYQyGPmTfB?=
 =?us-ascii?Q?MjpHIgaZbmZkdTT0gLr+kAA7itW0LIVkei2efbup7X9lwEhDM2hYkNeHOinb?=
 =?us-ascii?Q?xeEFUvG21QEjHtFqoXgf8i9TdowEhRwetWJedp1jy+SI+EiAnpx8+6IoJGmD?=
 =?us-ascii?Q?u0o7LOZexQaNrhVjXFTVsy088cIHuRjCNAAwDMdX4wgZ8wywNLZHjkf3tm2F?=
 =?us-ascii?Q?Mlw/RuV0dlSnQF4oALptTPCto36CQDmvQetwXeo6JqdiyfgJ7UuWNOPEL2+q?=
 =?us-ascii?Q?kJ2qb349PvpyKuE9EqoFSOErwgZR1neuBtzwZA19iqNilRg6ivY5PjWuJc9Z?=
 =?us-ascii?Q?Jsz5SWLW/h7rR2mJOwMVJOh8cg+fqRPIgfH3tOQKHydrAPPhvaKbv7RFUO8i?=
 =?us-ascii?Q?W2gR8lAcQV2fDSjiGeHBaZmQAf/QtGIPocuLbFStlP1zegGRZrE6SzBpvmzM?=
 =?us-ascii?Q?wfkD0GG9gN+8GMPqEgOiSoGhU3iN/Sew?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(34020700016)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 05:59:43.3761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 796e6169-da46-4bf3-587f-08dca7b7fc74
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB8167
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
index f0f714c7bc77..33dcb2451ae3 100644
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

