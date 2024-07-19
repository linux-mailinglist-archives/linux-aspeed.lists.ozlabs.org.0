Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA126937381
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jul 2024 08:00:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=a12CmWwk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQJtt4pXHz3fTZ
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jul 2024 16:00:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=a12CmWwk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQJtP0HfGz3fRD
	for <linux-aspeed@lists.ozlabs.org>; Fri, 19 Jul 2024 16:00:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ix8KAO4ZN8awzFF7b8sJuzjtWLl3HFQNGHUzWHdICMNMNz7HGCOxD+pFf5bX3sdEx/dp2yWS5h5r61JrcAoT1efcO2oBdx1pm2pgKSNd3FISiT4u+LQ/0DLgDqZb6QMNcquX/IDTPT/lt6/KkefZiwDSHh1scu5DH4C/PnV1wcHIaBb4D35fqsqAB/yf8eo0V0MZnj8dXE2YYDL1b0iYN84kRIiZwdFiPNV7BHtsY6cIu6IvTmbzP5/SMP6svQF4WLkDrPq6H8tN8j6M1RlC5B6uozvO01c3rRcjFyiJiyB1uSVwamqZz6FXK1T1BdyFPX4REaBR6cS464nDoPfYCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbK/2vsfBhS2GguN52/kCxQEVmWfjdwDuSA91VpJMzE=;
 b=h+fx7Pz1ku8Bi+p7+qzqyoJSW7fMT2UdkRGlod3WoB1F+pe7mvx78OXw5CcfeZIzuBRHd4Mr6VfyqN6gBRin8sJ06HgEs9JVo7TZewY4lg+OlEHtkHgkZ7qCKkXuIanQwHXPU+oJRnRd5Wta25kv7GFhIrJdIXFUxScKRBbi0Ygag9zAbU+GkJEkRAno5/MPp5LeeI5yXan0V9rPt8R0spM48J16Nvr78qOIJXMUl6Gi5i3TiwGwO+bJyijH44A2tGVk6yx/AGkZGPhvOD+tXPy6KDjTKavNQIxcUJWNSKnv4VmfEratjyoJniDv+3mb4Wo+k7BiRWt6O10UOuVvxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbK/2vsfBhS2GguN52/kCxQEVmWfjdwDuSA91VpJMzE=;
 b=a12CmWwkAHctrj0aAI5X0U7z4w+9Buh4OE32DOgZ4OUqgITD+CehtvsfBwZJejMdy1VpMlqufU/c/yJXydgcJJeD7FeJvVHIymyrPKe8cetXFTqDJHmZUVCxVWrcmBVvGaixztFRpkzwRrxquhPw6lW5L9P1trsGZrJ00Tr9rcz1qwEjfuUlg60ywsnWa/5WoEI6g7YLr1PohOlKiD04R9amnRcBlXz7hCnjtUUAC085TCpb5pb3RAt179HD/cSvjLjHY7ztSfdFMxnhzQJJCOufi3q7ubMWq0eX2rqRW+8Jes7v1oNo0BU3ZrOPEgYoagyHl9v4jKn3ldXWTP2/1g==
Received: from KL1PR0401CA0024.apcprd04.prod.outlook.com (2603:1096:820:e::11)
 by TY0PR04MB6190.apcprd04.prod.outlook.com (2603:1096:400:32d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Fri, 19 Jul
 2024 05:59:52 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:820:e:cafe::f1) by KL1PR0401CA0024.outlook.office365.com
 (2603:1096:820:e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Fri, 19 Jul 2024 05:59:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Fri, 19 Jul 2024 05:59:51
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v10 09/27] ARM: dts: aspeed: yosemite4: Enable interrupt setting for pca9555
Date: Fri, 19 Jul 2024 13:58:38 +0800
Message-Id: <20240719055859.4166887-10-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240719055859.4166887-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240719055859.4166887-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|TY0PR04MB6190:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: be1f89ec-b337-4bcf-5c84-08dca7b80166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|34020700016|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?8KuM2bKFAXLVMviH+DM3XoZj9bwWEGnJFyTIDZnVJXipMXw/63b6qSyT8mgJ?=
 =?us-ascii?Q?BNrdNMzcGBSgDqJCM91cciYc5NPObfj414RIFTDgiNG7T6k9mt4KkdWvXsJm?=
 =?us-ascii?Q?QlZ+0Ia/SIrObb9yUPKtBJ4U6ve3Gt4kWagpFrd0dv5EYTy/Ax3WhCuSTEt3?=
 =?us-ascii?Q?6X4jakpg8wg+hN78oeaVV/MwAVZDrxfKfwXowvfyP5wpMTkcTFwrVlbZGHzj?=
 =?us-ascii?Q?1JqLCXgxu4//MOghSwvGEQ6lv5jOp0syL38q60vctxGMwr49A4qgYb7ZcvJp?=
 =?us-ascii?Q?EsLrtE+XgKEGZdwrQLIrU1NqM5p9kljYvaA/xp8ncIbsJ8Mj1+iCcNStZIX7?=
 =?us-ascii?Q?nlSFi6AY4dzGA2WSSsfgDFtvewr4YxI63SYCfuqMV858EeJb5xHFn7bAD4Gw?=
 =?us-ascii?Q?wOjqAi/GiuDr89ohD7LkS/G/DC3poSC4k8L8O2cDRAQ9Jo4BgEePM5sqWzOm?=
 =?us-ascii?Q?jh5+I8jDgF4X2Z24ZnDRVbNrLOmcho+KV1pXF8gIs8sjXYvrh9Do2bGM+++D?=
 =?us-ascii?Q?7P8zo6Q5NpM9HFzqm0o3GHuNDRCQnEq9YVS4Hh66ZBIxx6a/mdknl3dwvpq1?=
 =?us-ascii?Q?vyrihNcGVHxWqi1qP9fsRMzJLAnOQcyC+pjBCeV92FAPJlH/tul2d711RBWU?=
 =?us-ascii?Q?L9BFCKhDGF9NMrXAs/EgVBlKmE2ui3wsSQtq2NsklFRscZs8hbzVFI8ID4EQ?=
 =?us-ascii?Q?4+6KsFWkNXuJ+sd/Oe0ZoEhLpGGek6FyvAxbTLfTKRTBFhn0JP0ku4cC+SVZ?=
 =?us-ascii?Q?r8wcAX6VztUUoH5xftvlPJeUFkqB1TuliiFXleF894YRF4hgsx1LTG/Y92x6?=
 =?us-ascii?Q?uPHf+6WL4BLriFbTlOvUAJIiJYT1HuYQF8GUJizIAbWIrkNQCe3SiYMwTaYh?=
 =?us-ascii?Q?14Y4BrEHgmLqfHLirdy7uwQ8PLPldYSPelwjkmwxGoCXXXhPlZvNOuYV3hxK?=
 =?us-ascii?Q?RowQYgolAOE2SziTQ30+J7tOE8PwrOR4zpMOjVJit/w1/wA6jjMqh2VkitO6?=
 =?us-ascii?Q?AfBI/SCSmtrfo90nqhmlj0kQ1K5v2E4MDJIRTNIYskB3JxHiFNHlUXTIC7T8?=
 =?us-ascii?Q?n8QPBS/v91TOfgdyJQDZ90QIZkA8GsiGrZxG9RUIcbdQgZXeIZEqIQIMku1/?=
 =?us-ascii?Q?e1TBGM4M2CZU0n/7Lg7WpPyliYyfsWB6yAGk/EOq8TvlV62Nozbjdd50nHZK?=
 =?us-ascii?Q?066UUrsQNIg7A8wizkizkpP+y+XCpAw+5IsaBfXtmOWX5bf5IH3haMp4D0OO?=
 =?us-ascii?Q?8yA+0lgPHZ8lR4HyALwWPe3mNqZLJm8Q683RrWrHZIFEW7k9qFKZfTZVQ4hD?=
 =?us-ascii?Q?GrGGWsXXBdg8kb0kFd+lxgLioM2hPul+T4Q9gXe4wbrRo8edvg8GhU+/tldS?=
 =?us-ascii?Q?FWGdJ38HxP9JRrANiLNvr5AiV1qda9e9X5GgtiGTs0aL9PUjOvxF95LGpSN0?=
 =?us-ascii?Q?BHOUlvpD5xB+t9zfAXTVOz5ZNKTDxGJ4?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 05:59:51.6574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be1f89ec-b337-4bcf-5c84-08dca7b80166
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB6190
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

