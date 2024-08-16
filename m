Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 034CD954578
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 11:25:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="::1" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=C5Ec+Zn1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlc6C02SXz2yw7
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 19:25:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::600" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=C5Ec+Zn1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wlc685YJ2z2xst
	for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2024 19:25:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RMmxHJ0thwesMfyo+hDhau6gNOZQ48Z4TzK5TzLa4wobkO9+lFL/ueGmdChC+brwWDAV3LycHf1AeqQkAMsQ4Ndo1Ld+INcw8yldacz5+TO9GxghVLzbCNtGB6iEzX0JbtG664KBzl0qK+6vepk4fzRHFZ052SJ0B2fBe95JX0o6UMXNbxRkX2At4Nj9th7d888P3bKhvN1keeifPDreHqn1x0krTbvRVSmkIXTr/EWaeh4wJvWZGHrAY8mMJAqu69NAX7p4LnqS7UCP9xoi4QEW8RPd8/b/Bt0mCSc4j67bP7yvsj1e1taks0tqs6sJYkf9nakVfu6w/c5tEl7xRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIYwTFLr7k3/66Qq65omckRUKm3v7IIjsRhJzbIKUfk=;
 b=r3wXxsGYKr+LRu93KreH3FN8+zohU6orlgMad87SrUDQk0CCZDRf71YGQmldVDET+sN5N2IHcppTm/okrBlcRVfMheo92T3u6HqW0BzZ3iQo91JWJ3oIiod99HhBI7KXHrBraxTegmYoC8L7rT/hScA8gteJGR8LLL+Q4ldXjRtJz2Zl64D2IxccDm1etreOwE8sTJLhiWwkUIePp8tC8pe1r6N8EKYxF7cdLY5U4lrRTGiA2pymlyeq+F6YdmwmHbvdORiTuICNxEolA10K78rg7NJ1MWyAOWW3AGtBuD7tVYHbdQIzxmdkCoMiBS6peMBedO5dP6nnEs7/dFV4zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIYwTFLr7k3/66Qq65omckRUKm3v7IIjsRhJzbIKUfk=;
 b=C5Ec+Zn146ws5mKo7xFjH0y+9pSluLawU3wGgVdJ/ePAs+cXP2FAgWDVftptyNbao00XGPy56KcXS/B18tOw+Ymz3Z9qWHUQNSsGFFnDyYsw4wKuMl06cV26GmGHnBeZ42CZbScy92Pel1o51/kBCVA481DgbpOH8w8/Nw3iqNC8N/V3WcYOt1ExcYwu41AV+dVNPhrMKoAL47bJ0RcQ2qswJ0vOlAn4Fi8rki4BnS3JDUM14mtYl46eo35sLjsLL+kqtoLLC1KGDG87Y8qHq9hINDse9o5c7QvcHjzyrNvHCYQJhJkM012LdBmNa7dox6DHZfYoKnS18ah+baDgfw==
Received: from SI2PR01CA0045.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::19) by KL1PR0401MB6610.apcprd04.prod.outlook.com
 (2603:1096:820:b8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Fri, 16 Aug
 2024 09:25:00 +0000
Received: from HK3PEPF0000021D.apcprd03.prod.outlook.com
 (2603:1096:4:193:cafe::4f) by SI2PR01CA0045.outlook.office365.com
 (2603:1096:4:193::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19 via Frontend
 Transport; Fri, 16 Aug 2024 09:25:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021D.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server id 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 09:25:00
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v12 07/28] ARM: dts: aspeed: yosemite4: Add gpio pca9506
Date: Fri, 16 Aug 2024 17:23:54 +0800
Message-Id: <20240816092417.3651434-8-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021D:EE_|KL1PR0401MB6610:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 328732de-6237-4e1c-9442-08dcbdd54d6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?iiW6gan/I0CHTsfrGViVLIEi17EJYr4nFfhlCU7Zwm37wUfX8/CskBZF0D4R?=
 =?us-ascii?Q?7quU/3GU2KlUhGt0mV7studTp3nDXhkAQyWTIAcSKXXYAz/B7fvDnVhuD6IB?=
 =?us-ascii?Q?xnKgyHnh7dZxW7IDwWAU2bVFt6AEtxD0g41dAbPqRohxSust9xNzyLV35M57?=
 =?us-ascii?Q?30WJW9baD0Ma70rscxh2WNX9SU5GhVNRrenw/q0JPmgUJhmCcgiueH2nId8q?=
 =?us-ascii?Q?dnPmzLsfpdEYwOigRR80Bi0E0/nwPRb0dB9hkWvq/V+GcxBnPy3lQX5gmTst?=
 =?us-ascii?Q?NUR4/Ay4jRPyw8g30zPhCkWNLsIQF/l8A1f8UNNPVddMR6FKMmqKo91/L/XR?=
 =?us-ascii?Q?XBIK8GlbhHE2nftOnz8qKlyrpTBDrPsAvkfsrfMHFcFzRaUlrT05+WjamAks?=
 =?us-ascii?Q?SBgV73nNh+n7dpDwPn4I5BD3eLiPMbRApUT2GVO1Gmi+oFYTELqA/jGSGJPi?=
 =?us-ascii?Q?lQgUPyCCLCxShXlrHFh4HYFSRCyhl09ht6mbXD7Tjb7NOiVaWsc6bd7ItB59?=
 =?us-ascii?Q?Ysv+lfop365XDQhFOiXF4JEcPjNIDNjsTPL6tLQr/GHhTyVs2YsV0mFV4jVf?=
 =?us-ascii?Q?uGQoqqlVaBR9zWF82drUvRpmTsXEnLLe2Iu7FgAdR7Tae58A+ZK9ruUvsMdr?=
 =?us-ascii?Q?XQoWRW5X9MJFRWFyopqPDvMa5CjKToSSpHMnTi6i2HmK4SLMqKV9zNoC/PNm?=
 =?us-ascii?Q?lKoUzt1kF5JXfQ+hjIw6enFuSaDNfNZ/kCccUL6474UHIzgKVpbTS0wDGxKW?=
 =?us-ascii?Q?78wEj0foGVfdVsh8UlbJNjKIemYbgpCoeSieszSM8H13F7TNnG7pqxu6QPQ2?=
 =?us-ascii?Q?7hxskElc4J46O+Slx6BIse+iF7iQjSVDlVZvEf5EAVYe935PWmeVeahI4eBs?=
 =?us-ascii?Q?ieFkdmZ2+WqQ4diW8RIC9Q7xKuQfBiYUhsGfrCtxIFvpCn8HvF977aoHByOD?=
 =?us-ascii?Q?ycii+kN0XMzBwVCdaeAm2Vw7MTQrO/4C/fUJ2ryNvOkOJ8tMj2qGjzYgCWKE?=
 =?us-ascii?Q?wlxyvpT6vjM8KYp1WTBcn+3jRQSH4LCnZthiaaoLg1+RcSz47cR/hY/Vp9nX?=
 =?us-ascii?Q?EZAcIxgSqm3wcTvM2ad7EysuHStD4a4tA2e42bW5dqlQBAnuQRbNSUpG4jDn?=
 =?us-ascii?Q?NPbeSpSJg3MWfHrGPx8OsiWldzgQ9TFYcQw70l2TMY++3HQRIzyHlJxLJSrH?=
 =?us-ascii?Q?2JP8+xQXztPsapZQ4DZgDjJoj7HmaOZIBLeA9FEH0bjdpaIsUsrJpxgaOpFW?=
 =?us-ascii?Q?B/hWJkb/yBBWmwK+6qvu2dvlDgjCkyN5WdzPI7zC4xL9BFQVwZSj+8/lSjlB?=
 =?us-ascii?Q?1ro/aFqQi/BBByzJ94lw3/tbIm4onJQ09NFg4aeyymWlRy80i+w/HxGEdx51?=
 =?us-ascii?Q?xHOUUt94dr8Thorrh2D6XEvSSApwtLj5LstqJtOZ9gO+Q0fQXE9kUwpvxNWh?=
 =?us-ascii?Q?qPzZahQW68aBKuedGF/eQ03JT4mDTr/s?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 09:25:00.2159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 328732de-6237-4e1c-9442-08dcbdd54d6b
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB6610
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

