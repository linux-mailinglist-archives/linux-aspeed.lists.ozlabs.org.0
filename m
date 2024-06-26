Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 188AF917BD5
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 11:09:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=z/Hldu92;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8G933q69z3cVy
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 19:09:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=z/Hldu92;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::602; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20602.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::602])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8G8g0scWz3cSL
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 19:08:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1bBqSrsLUR4P5L1XbSr4PGmim7XUUsylcUzhU1/CJDwD3HiLHk+h9kyoaCZGJ9KVUOSwYKeA+W3BlTbB0ivaqYGRyhyoqtUIlY0jDJ629db1nPEvgIRvxah+eIdSFMhHdVR0nPxU9nP5A7EMjQZpweuytXBdR5P0oFsnQQMErDBqx5k/rq5LdvXw5YY0tbkcUzl7xhb2FVU9wi5ebemUb8jMgwo2Dw96f8r808Sa2Et6+TbOF53fYuFigRsFshwLzJpKPXrdlqZFvhmezvMVvP8bjcTEGsBjG0aXGbpUIJfuILo+UfGyHqeg9Cq2ModVlqErrk9qwLsggha4/gbcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbK/2vsfBhS2GguN52/kCxQEVmWfjdwDuSA91VpJMzE=;
 b=jZ1KqIXA46oIqZZYB1H8n7PZBuPFUVVFUBY0FjOL4/7+7ibHH6k7Ur9QV0MG8px+YKX9uiXVQVwFJdEdTQIh0OgfdbK6IkxSIXj9urcPuG00bAZe5gsjzYCTXVnf5CynoKx4rSI4CnzP+yOEdp6InQQiAXu6Kg1UzmTunGDgh2R3Fx9dhAWuLD8d5motjQ9I8A1iA79PpygfVFNqvtTxGB2UxHH6Mizfhs5TK8y7Qg4ykmUM6tptYISPD5XO4zKakcHMfG0Fwf8UsmfPRwAJhOGrOzbKReziUrZ5hsoOQz0M2Uoilua4VmGRfSU8NRioGQmmGr3cqfB2R/jf414IlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbK/2vsfBhS2GguN52/kCxQEVmWfjdwDuSA91VpJMzE=;
 b=z/Hldu92/gHFScEBu486HfjfC3gupEnIacn15X8nVHCAbtp5tdH4S33ASq0E3EOmYIK8Z6ok+7kKstdOizmJkAuMN3bmjAN3s46/fwZGwkekI2hXpuSqddPPZMyrL6sY5K9wO18LPpbBjRynbz0GV+yj0G4R4J099geaDCZdQZfkv+biIWM0w8K73nsMGKs1z9tgUJ/ihwpwkB8u7jFmzh3vvsNyDa5nJqsNM3ZYpFHBWs9JZEouMmOnDbeSfC/16O8mkeBzIb+QKoIc/f81YyUPc70tFugIjGrl4lKeyJIbUPeIq7fEZqY1TpZI+7ZmOH/33B/d4VEnLZDV4HC+oA==
Received: from KL1PR02CA0010.apcprd02.prod.outlook.com (2603:1096:820:c::15)
 by TYSPR04MB8064.apcprd04.prod.outlook.com (2603:1096:405:86::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22; Wed, 26 Jun
 2024 09:08:32 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:820:c:cafe::f3) by KL1PR02CA0010.outlook.office365.com
 (2603:1096:820:c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.38 via Frontend
 Transport; Wed, 26 Jun 2024 09:08:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7677.15 via Frontend Transport; Wed, 26 Jun 2024 09:08:31
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v9 09/26] ARM: dts: aspeed: yosemite4: Enable interrupt setting for pca9555
Date: Wed, 26 Jun 2024 17:07:25 +0800
Message-Id: <20240626090744.174351-10-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|TYSPR04MB8064:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 74b31ae6-497d-40d3-9b14-08dc95bf8d06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230038|7416012|82310400024|376012|1800799022|36860700011;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?sbKsCral+j9mTbcjpY7rmvJmdZBPI9PN3oCPfpkttWnvIUj8ue/zyC2zIdsb?=
 =?us-ascii?Q?Y6aM+zcU69LRsHvV1XVLNgSkb0prHlVQ9v5MWzcp47YE6Ghsjt9CdoqhO93h?=
 =?us-ascii?Q?DadRWI1jgtiVLVpBEtT5NLnjS1RUyMlo8OQ6cgPgkhOZCFP4Nqi9U1/6EQG7?=
 =?us-ascii?Q?o6ybMkyZBJxpAR9qLXA/qbb1wMeFSnNHPGhzKi6pNhpvNHxEAmlqsHPlWn2G?=
 =?us-ascii?Q?WQarBV9E0KCVSDJ8u6Zh2IHQ5lzk6Y0oSPw7tolV+tjFTtutmZ0VgToDjB2Y?=
 =?us-ascii?Q?ANzzLCzDNutdobEwcCEyjVmXZi5eB/XUTmlE7Gh0O2d89kACW3YJbiXttwG6?=
 =?us-ascii?Q?VU6hzDOsc4fRvE1ucXNsvILaEIgbKi50gqNjPbmM5X/ptBD9NNkn1CSEG5mc?=
 =?us-ascii?Q?8kM/mFhO9DIyXnbl+cJVnK2RbBuiEGqr+QQCylJjwEWMzws/YpZG0cqepCDJ?=
 =?us-ascii?Q?9ok0SAPjTuFuE3cArB7CeH6Xt8MtYKuOSS2HB5DglVlLBZIhydonpy2gii78?=
 =?us-ascii?Q?HpPi2teqRGlVLFfo6gj3rJ5gltxOs/aVNVv3LWBHSHBJD6236nDhae4eC2VP?=
 =?us-ascii?Q?rGPkUgkDtYwfuxH9J//NYQNrRtqBaYUBjzFw+PjAgb9HwA/3MCtCE92dHnLS?=
 =?us-ascii?Q?O24HJspq1nr10iADdjMf/KJkdvQT2BnvNLGk9OqgXdmOW4RfHxTlRDDA/A/I?=
 =?us-ascii?Q?WYZv/fweGtK7USuOyxnXELrd1XHLTrMjuVMerD43V3DFfoUlfumu4x/bndla?=
 =?us-ascii?Q?aPGT5++rc6D2V97xp7b7F63+kX8Yfg5QfK0aR1MJYQ7cVMIAK7l1cL/CM3vp?=
 =?us-ascii?Q?SNuK9I6ZgpU0jmInRPVG5vXbr+g1/bb3k9id6yA0UREk3j/mXuorq5LVFXod?=
 =?us-ascii?Q?2r1WrEfgueXWT7v8c1Ejj9Gj3Podh17vnonJQqz70imkD6RSvlrA5PIZprxV?=
 =?us-ascii?Q?TH0zm8MsIn8lXDvg8uZjBy2D7gem7DiUJ7P1SQKwXlei8z81n9Fav8SEjrzq?=
 =?us-ascii?Q?bt9WAa2Cblg60hPldZJCyQUxUo8OzXpFozU0MmySSaiIkCKRMF4pgbfeQfsz?=
 =?us-ascii?Q?O9gt/ZMQ3QfPKCBDkMWEviHMirievHrbXlpy12h8wrWq6QxX/iRrM3fGue1g?=
 =?us-ascii?Q?lfillXQBbyoPVVL70/kLDITWythTljQBeTjdr9qCaLHUQ0h2BH3furQuSywZ?=
 =?us-ascii?Q?wZx3b7zMh35lGCIPB6VtE/fzI0y3KlfvQzUMWxgaehHMpjKtQuGun1Gbv8LO?=
 =?us-ascii?Q?wTxMLjgj1awd82naQyRVLX2Svy+VVJoWnGs2tBPEE96uubz08FnIw0yzryDN?=
 =?us-ascii?Q?1AgXcx8k33BqModnhbykGm7iP+FrDr7Ac8cA9Z8s39k0WLQkKzBSu+836iJT?=
 =?us-ascii?Q?STcGwpOKyaaxms7KGIZjVz8K4n/Mywi+YV0HXwoHAF8ASjOj1Q=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230038)(7416012)(82310400024)(376012)(1800799022)(36860700011);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:08:31.4892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b31ae6-497d-40d3-9b14-08dc95bf8d06
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB8064
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

Enable interrupt setting for pca9555

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 56 +++++++++++++++++--
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index ee11b3b8e81f..92733a8ecf0b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -832,30 +832,78 @@ power-sensor@12 {
 
 	gpio@20 {
 		compatible = "nxp,pca9555";
-		reg = <0x20>;
+		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
+		reg = <0x20>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <98 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+		"P48V-OCP-GPIO1","P48V-OCP-GPIO2",
+		"P48V-OCP-GPIO3","FAN-BOARD-0-REVISION-0-R",
+		"FAN-BOARD-0-REVISION-1-R","FAN-BOARD-1-REVISION-0-R",
+		"FAN-BOARD-1-REVISION-1-R","RST-MUX-R-N",
+		"RST-LED-CONTROL-FAN-BOARD-0-N","RST-LED-CONTROL-FAN-BOARD-1-N",
+		"RST-IOEXP-FAN-BOARD-0-N","RST-IOEXP-FAN-BOARD-1-N",
+		"PWRGD-LOAD-SWITCH-FAN-BOARD-0-R","PWRGD-LOAD-SWITCH-FAN-BOARD-1-R",
+		"","";
 	};
 
 	gpio@21 {
 		compatible = "nxp,pca9555";
-		reg = <0x21>;
+		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
+		reg = <0x21>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <98 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+		"HSC-OCP-SLOT-ODD-GPIO1","HSC-OCP-SLOT-ODD-GPIO2",
+		"HSC-OCP-SLOT-ODD-GPIO3","HSC-OCP-SLOT-EVEN-GPIO1",
+		"HSC-OCP-SLOT-EVEN-GPIO2","HSC-OCP-SLOT-EVEN-GPIO3",
+		"ADC-TYPE-0-R","ADC-TYPE-1-R",
+		"MEDUSA-BOARD-REV-0","MEDUSA-BOARD-REV-1",
+		"MEDUSA-BOARD-REV-2","MEDUSA-BOARD-TYPE",
+		"DELTA-MODULE-TYPE","P12V-HSC-TYPE",
+		"","";
 	};
 
 	gpio@22 {
 		compatible = "nxp,pca9555";
-		reg = <0x22>;
+		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
+		reg = <0x22>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <98 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+		"CARD-TYPE-SLOT1","CARD-TYPE-SLOT2",
+		"CARD-TYPE-SLOT3","CARD-TYPE-SLOT4",
+		"CARD-TYPE-SLOT5","CARD-TYPE-SLOT6",
+		"CARD-TYPE-SLOT7","CARD-TYPE-SLOT8",
+		"OC-P48V-HSC-0-N","FLT-P48V-HSC-0-N",
+		"OC-P48V-HSC-1-N","FLT-P48V-HSC-1-N",
+		"EN-P48V-AUX-0","EN-P48V-AUX-1",
+		"PWRGD-P12V-AUX-0","PWRGD-P12V-AUX-1";
 	};
 
 	gpio@23 {
 		compatible = "nxp,pca9555";
-		reg = <0x23>;
+		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
+		reg = <0x23>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <98 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+		"HSC1-ALERT1-R-N","HSC2-ALERT1-R-N",
+		"HSC3-ALERT1-R-N","HSC4-ALERT1-R-N",
+		"HSC5-ALERT1-R-N","HSC6-ALERT1-R-N",
+		"HSC7-ALERT1-R-N","HSC8-ALERT1-R-N",
+		"HSC1-ALERT2-R-N","HSC2-ALERT2-R-N",
+		"HSC3-ALERT2-R-N","HSC4-ALERT2-R-N",
+		"HSC5-ALERT2-R-N","HSC6-ALERT2-R-N",
+		"HSC7-ALERT2-R-N","HSC8-ALERT2-R-N";
 	};
 
 	temperature-sensor@48 {
-- 
2.25.1

