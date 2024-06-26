Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D6A917BDB
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 11:09:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=QvK/4Bpi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8G9P4zpDz30Vv
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 19:09:29 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=QvK/4Bpi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::61b; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8G8w3hJKz3cS0
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 19:09:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LuqQMZu0ycQd2quBakRBGsNbSBAZP+YiVhXMWAaBIwhRw+PA3f+wFbuqILCWhMfM4Yqd5LtSVakXy7wnopcxCp7mnF2cJYZCz6hNDEuW4za4fV/s+8ZNlNVJEC76R2P/eKCbDPAuhUrZ2dBDI6CtVK2Tr9uvJ5GEcxnRXSLfxow6MZ7a0hYisUM82P4Ksf5lHy0DQB8oSIcpZmArOjI74t+DqSdwgsN7fDaW/VHdxwJYzi9qbZpO6G8qqklTOeUE0i3D0X25L7aw7wQPTCx2V6wGKPfbCSMDLT+vlwwL0LIkTc4uRXeZcF/8F7MKbEszV1e5juqRKcgwWxpdvCIn0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrss1LFTszE1pis/nUOnfDY03qkapLfO8Yjsln0bIZ0=;
 b=NVIMC2eqij6Thie7+xanxJo0gEPZoQgOxgeoId9nMoP9Lm7Gm7sFZV6QPoh0geDQMULEazRHAgXb7fFelJ8nJXbLc/mJ+tokENiTg5j761OEKeEoceW835L+jxqu92E5QLcAphnjOv3hP+r+TMSY1DV/om5ASsKXpDUcpx8wVW1Ps/ToPDtyNjbQLX5HcvKUjivP9wJ4dqOc+2nVXzAKz0oPzfOoRJq9M5qYcIj9HBBt0MiD5ztuzZLgGfyDhEL8mHZ2OQ0/GdIXIkvlr+xSap92/eb3FGbOxev+T1aBhkVm3LoeQ4x+Y21Pj29ZmU9QOs03wx3Lm+OIasxVH16bXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrss1LFTszE1pis/nUOnfDY03qkapLfO8Yjsln0bIZ0=;
 b=QvK/4BpicelI5Kj3+NaroYMJdZnzjfysk/CBcW+2JX1O+ZhR9HCnursh5wFEtR7C7iHQ4vYzBLPwA45wNtzzX3gia4Gac1NeWq8qcMfJJApbMnW+5JBq+q9EtaqH4GwWs925r9V34fM/S9UWdPiNmk3TnbjPikM7zKyu7c57xXszKG8CseQ8i+qJ2IxxdSlInroiQIT9kgw6Olge8uc6c1qOPaNT4ypNUn3mlbuiJdDgfUbGHBguyjMg0DwKpxhuoX7zmD0C9jHsra7NHtYm5owwwe3b1AgxMbBbuQGoDnSegbRFPg7WR5LPutAleE8brYKuyfCeo3CMcMlBWIKhDA==
Received: from KL1PR02CA0009.apcprd02.prod.outlook.com (2603:1096:820:c::14)
 by KL1PR04MB7255.apcprd04.prod.outlook.com (2603:1096:820:102::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.27; Wed, 26 Jun
 2024 09:08:48 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:820:c:cafe::5e) by KL1PR02CA0009.outlook.office365.com
 (2603:1096:820:c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Wed, 26 Jun 2024 09:08:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7677.15 via Frontend Transport; Wed, 26 Jun 2024 09:08:47
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v9 14/26] ARM: dts: aspeed: yosemite4: Revise ina233 config for yosemite4 schematic change
Date: Wed, 26 Jun 2024 17:07:30 +0800
Message-Id: <20240626090744.174351-15-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|KL1PR04MB7255:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 45b41115-da75-4682-189a-08dc95bf96c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230038|36860700011|82310400024|1800799022|7416012|376012;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?/EFrGpO7RB9EkQ8O9BZDxA2oCFOrFQ5vFezXclQbgyERpjPjdQXJP9SXHGfE?=
 =?us-ascii?Q?JdYqkx7RSJ8pPFFNV9NzvDUyO86+ekA+nTg2CsX3RuOwsz0N+dw499UT+cA3?=
 =?us-ascii?Q?q/uPcuUjJ7dIbja/zsLoH05ByFv1pXuAv4MxgwGrmRQsS0lysq0BrK/4Ujch?=
 =?us-ascii?Q?7+qMndaNfL7SNweveHjOI0jnST6PL5s/5gBRkurObQ6XxVs798uhdZEDpTfL?=
 =?us-ascii?Q?94elyi/YRBxegh74ozxxqIXecGjADIfHn6nwueE7+VhiGRnmRHS68GyFO/3L?=
 =?us-ascii?Q?jz4jpRQqVwILM89/xLKqSBz5IaYy4xl1coSTqdyHpK5okwUVx4vkePwBg/hZ?=
 =?us-ascii?Q?zN+4UBu8Qxq/bTMJrEGMdIuGzSFlv0+MiglGbm1w1jwZUGSKxI1ut0sp+oRC?=
 =?us-ascii?Q?Gezb1CisHc53roNBmcbJKO7p6UIRpgnphcy3oMe2EOBi6erHZn2gSUB/anUD?=
 =?us-ascii?Q?76cSW9b80EdcrFFR+/xDza1L5aZOia1DaEWwGMNRZF2LbBNHWMjKj/wnO9Os?=
 =?us-ascii?Q?PIA9QH21OjRaHpAExjNyAUvQhSu6RK+SoiPfW0LFl1T4Bn6r3ObMWDFr2ZHj?=
 =?us-ascii?Q?H5oPLYC8x8cAre9uUZUHvJVmElXYfTKE4ZTcpTSnQohA52alZVz2QrQvP8eW?=
 =?us-ascii?Q?TsRZRkVaSQAhxQpfdtU88WayW68CIhePSGKl6I7TZ81vS67TZBlCYlG/4egS?=
 =?us-ascii?Q?OBtAI5ixcHmo3E2pO1iX6Da5MKBFV52SuD9tgAhggEloV1KnGN11MDxqGL/3?=
 =?us-ascii?Q?wt4PZz62bxABjz7e1tTcEHxxaa+pLcF+k+qRyxJCFqVwMZTECxtKzH6uiHAF?=
 =?us-ascii?Q?oeYAEe0VlJUL51HMt2/5ZCPVjDwxp6+5puw/wwoLCKP0MVy0cgzWJfwgBtZK?=
 =?us-ascii?Q?4aIPsCDb7ypmgiN2ZvVPMNt44iy5RB6r84wLwhPjJkGGQfxpCk6axsI2U7ce?=
 =?us-ascii?Q?1h1IQBpHv2ArbES0qEgTKcNXUAiIP+vCAhgR5JZnO9NfMfH/b2UlFGER1aCb?=
 =?us-ascii?Q?gzZLyy4bmdVXUF8odmew0Z+wStFsUQ2wAo0EGrl1A2gQwJBF9kq/Zushh1M1?=
 =?us-ascii?Q?06o/15CqzozqBjAQMQludTFnKx9U36by8Aq/vySjWUsOtE0dLxlDCtjUd8Yp?=
 =?us-ascii?Q?5/erhqhcOriLNeImXwf2rZ/4FCMLiqHwHqpa1p+Hk5O3R6xjZ2hTVUTLBJbP?=
 =?us-ascii?Q?TipcAQ5cD0Ee1Xs8pIw0uxv4s+whxlLchmC0kg/IzIUVDLpPYzQ1n1itRxYd?=
 =?us-ascii?Q?aoPwED0r7ZVa671Oh2zNgqUFdvEuICOuzGjmjLyuopxNboNTzSsZE6fxI/II?=
 =?us-ascii?Q?cBmu82ZZdpHRvkzPnKhDfFTGqhHsSSmYsO8uIwxm9fwse7QcUTcriFndwTl4?=
 =?us-ascii?Q?JDwz2CK/M7ezHpfbb/eWGpUfhxqGGQcyP6GDNHqhGFdicRXyQAq9iCo67vPZ?=
 =?us-ascii?Q?ZNZfDH1pf8KD8KX7HUv2JEOt/rC9LMI7?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230038)(36860700011)(82310400024)(1800799022)(7416012)(376012);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:08:47.8175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b41115-da75-4682-189a-08dc95bf96c2
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB7255
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

