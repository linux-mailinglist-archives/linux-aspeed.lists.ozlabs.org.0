Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 558EA917BD1
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 11:09:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=bmvXPQco;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8G8n5k5Cz3cVf
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 19:08:57 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=bmvXPQco;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::61c; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8G8V3mh8z3cQq
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 19:08:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbcC49Zpzc+RkPeG6SKV1uN7MBNweVoRbz1EM6Dk/nCOji+dcdmVokPJOUdhLpXp5driSwiSTTafe6yvKORXnmzbNfd/jKY7pGfHZYbeLPYX0LK/4RQAI/XtDtCiltMJMeNFHjGue58/5akTPveadRbTr1XesSthStzCYns2OTzXH5ESes3QAAystC0DyqFokXCzQFBKsmlC9/zhsjusZBkb5WWS8Gc+PKe8Sgcw+YX69nFp/dK38ENJMflCarlclyNWdmAiYvigydiqE2xCcb5/sCAaB1SK5kIVLbmcwN7SAyDsC5NkGXSLoR/i0mAW//PpGNiXYdyepSI2HeVwzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QB96pUAHPYpne52+aZSEHu32dSiQWPF5XIERkA9QsJk=;
 b=VyWQF9b/w5bq/fooj2wXp9+uF/02y6mGAF3tZql3Di7hBUcA8SPznW6cbfEPDCvuYL7OHYBwrujKhZc2RmstPLKMLZfM0Z9qX99PZ17teXYut/QLT8EvUKF5tpi86VIsqOYO0/xdZ/2Z9yU6qV5bu9UB1sEzi2GHdau3VEBL2PQoC4xMjzYHBsB/1f4IsNz0QpG+dw8ufBxmq/lhtB+zS+ckPHLv/VuHl9v6XwxY8KBTLwrVPz9fC/jAoCowpL2Mw8QsMaUK+G4ZfxizMa6SPZQBV5Pl+XSD8dVeVN+cWaGGwrBlplkMwjw+uYz/AGP0hu6ZOVo9g3XjhyIkNlQCdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QB96pUAHPYpne52+aZSEHu32dSiQWPF5XIERkA9QsJk=;
 b=bmvXPQco5EVQwja1LBcHThFuK1UjUmXuu7z0PqFycs9tjZheDQJ9YQ0/RrJQKXXaS3oHv0w2F2Vo2CGrAM38KX/GhDEpCZBmfh8ZMjMy+Y39TeJ+yhsfs5uh66uRjHsavlDs4rqhRwn6AMp9yPrsgBBI4OYk6a4rQzXf2xAOMt5uhRMlgvBEjWXbNYHiKaSHwJ4JUT1QMWW8RqWxy+uVYUByWRAQtiBQSST9woood9xkNK/DfjH/wbflaVyI4ZOZsqLJOex2wieZnzO3elPb/Y0jkU8uw01TDCQlKtueUmQRgHYUt/eMlsm+oFWGl8FNNQnvqi9UcrNN/9+7W/4NSA==
Received: from KL1PR02CA0018.apcprd02.prod.outlook.com (2603:1096:820:c::23)
 by TYZPR04MB8022.apcprd04.prod.outlook.com (2603:1096:405:ab::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22; Wed, 26 Jun
 2024 09:08:24 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:820:c:cafe::68) by KL1PR02CA0018.outlook.office365.com
 (2603:1096:820:c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Wed, 26 Jun 2024 09:08:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7677.15 via Frontend Transport; Wed, 26 Jun 2024 09:08:24
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v9 07/26] ARM: dts: aspeed: yosemite4: Add gpio pca9506
Date: Wed, 26 Jun 2024 17:07:23 +0800
Message-Id: <20240626090744.174351-8-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|TYZPR04MB8022:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2d64fd3f-17af-48e0-e01c-08dc95bf88bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230038|82310400024|36860700011|1800799022|376012|7416012;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?Xz3X8UJcL/cfhHHhd1REirEE6rzduHyHDZB/uppj+tw6XXzxRm3nW6TdJV1v?=
 =?us-ascii?Q?QzRnwLvs1x2KpCvFMkX7Ko2d7kuMSJARoiPDV3JGPxAPmXfUJXWoUVXjxfwj?=
 =?us-ascii?Q?g2W9TpJWEZsoZZmc1DukAp91R5wClzXWHqbjtHSxgl2I3vNR3AiKccMH8LKN?=
 =?us-ascii?Q?aecK/1Q3CaR8GJsEQSLAXkjdtVom6yx/Xccx09g1Q5LU1pBv0g8kHFqMRmEe?=
 =?us-ascii?Q?T8redg0D9vAhSyxYBsehslN9jF2de3eXaAZaKG0Fu93wRnIC2s9Fc8YTCoY8?=
 =?us-ascii?Q?vb7Sg5hM5Tb6T3V7yTUOjmSGKB+Fn6A8fddn17NezbjnxuGCsXqM+pFTqejE?=
 =?us-ascii?Q?3xyN5h2BJgjONGOfU+/m3RiIcGVrRBAsMTmS661udjO/5eDXxFpLPCxuIrCa?=
 =?us-ascii?Q?gL7FiVhxAEu+vriVbiFchjo/xoEAYFlGvOMjHqCpVl175JWVQceTK+sLFA1t?=
 =?us-ascii?Q?EUrk7wOEbOEQmxQkSlWAakAmuUwcKZn/cc2ehxN9vOkCNhxGFpg/j9bEXb1S?=
 =?us-ascii?Q?8d8lbaIgwK1x0wBErWcRT8KlJrpz35RTiHcVldttffU4W38z7CjmRAkkUY2+?=
 =?us-ascii?Q?QjaUwNv1+RFlhdx4YCpcqHfWLgWnCZV45r6xGWcnCYbg3tJwMv44/vW4uviF?=
 =?us-ascii?Q?eKpgSH9s8ztT4jjboVXu7lZWXLzDddo0uJyQYbED4gynbSnx8Hu6Wbb7BaeF?=
 =?us-ascii?Q?Oqp6iW6bar/p/SqVgL1MEPubTYQpud0fqVLkGdtTiAAsKRNt+V3GO/WdPjo4?=
 =?us-ascii?Q?RIDh65Fqu4db2pKmcbSNxBonQgteQvaNh4qoHlce/lpYOeKE6Eg28n7ZlZUY?=
 =?us-ascii?Q?Tr3s8NQWq6qmZyemmoSHxMRGUMu+YUpu7dv4dJz6/LMRMjFKCWjKi1hRJsMW?=
 =?us-ascii?Q?Pxx3kZI7EdTJhNijHNqg2UE0cIa+rMRTskNxih3Q3jko+yE1q3XAjEWcOkXc?=
 =?us-ascii?Q?pyGGWsTRfjqlv/E9H6FDcR0mliCYucwOu99usHtbATtC5pApgbefEfhvtizz?=
 =?us-ascii?Q?bnyOvt4HARBVH8pyKYglacI6eruWq6a7SYatrQFOi6WzHFh/kNR2FDYP/O7C?=
 =?us-ascii?Q?DwdEZj5Ce8AXAHFG8fMv3+b9MqXunfd2wUKbjEHh4HET+DZPHLb+rZNS1eQt?=
 =?us-ascii?Q?DZWSffaUMp11beE/i/bN4V/J42Zw3V+gKRMOtUkoxwxQACcsoQZm44yjWX1a?=
 =?us-ascii?Q?9SnDxdos5UiTJdWKImIfGhdsDz+ug66NnwPaU/ofKuKHDc2VTid/yOSglCkw?=
 =?us-ascii?Q?rmDeGBF6CP7PBFGsiD70YtYZbbsrr+uC8mLNENf+pZDqN9+Zo6CrGg2Ddo40?=
 =?us-ascii?Q?xeuFWnivZ1dayj2/qoacQ+JWSsOd1KpHPhFQq3/JPqUsERLGVF0mFnPlTWNH?=
 =?us-ascii?Q?t0IRP7JwmimPGsBtf7fn16sV/88FZiWU7lPhYjB7JREo8443gw=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230038)(82310400024)(36860700011)(1800799022)(376012)(7416012);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:08:24.3017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d64fd3f-17af-48e0-e01c-08dc95bf88bd
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB8022
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

