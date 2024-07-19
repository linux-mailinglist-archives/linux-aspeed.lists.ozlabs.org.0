Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C64293739B
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jul 2024 08:01:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=OS76kLSp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQJwP2V4Tz3fnP
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jul 2024 16:01:57 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=OS76kLSp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c401::4; helo=sinpr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from SINPR02CU002.outbound.protection.outlook.com (mail-southeastasiaazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c401::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQJvW6yC5z3fmS
	for <linux-aspeed@lists.ozlabs.org>; Fri, 19 Jul 2024 16:01:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6GSJVmxCfN0OHflX71lHd3/RWahiH0liSKCyqBOiI0wBfXZ9lkXOnTBqnikvwyUv9EitvKigmG2xsss8MSQDuBozIzZBcroaOXNIIwAHaldXl7WwVV27y91cC4iSkBoTwZSiLrMuEYWhh6XpeGHqIngpwFnB6gEG7uZQGdZ8R54Qn3pbehC03aonI8yuJGRx0p5upWdDUMUcqndQ4sRSOMEzXNOi4xolOHEZxKHUzV0Riz8vJjtO4liybAmMMtBwtQRag3yj3EnuA05Dt+1mIrCOZlyQPTHQ7yNoEfNOqPoV1aHO+CoMtoooNtNgzCYEW02F6INV2ljam05fw/OjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPuO9qcjCRKT1hG8tAOI8QlF9L4C9eaYFzPaHsZZ6p4=;
 b=ZLUWjeWgLNKZBr8OF9odyUVKqYSA+xNyye3Uct95mpX7uCFTD4GyQlqO1sufM+xfvO0EiKTtHc4M/93RAJZkwQdLaX/SIzCv7cp2o44+YgiurwpmmoO7NRq4yObJtZMM5iwnwRxagbnuJkYxfkK+6Pxk004zGE3kECmey9pEUEu11Jm12Eh1/eYr0wbjYBoqz1RjcJ+ds0KzlbNPNpU8G5F5PH+0n0GDwMmqiqQdIZ3xXKXbO9kXsLLLCt8ipnfyq6e/UZilS/1OGOs1YRABMiiqC8o6Xs+ksvY8zr7ZznRrSU094ZSylCLN2cTAaTQneg2v1whW3+wRfKNdsk6aeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPuO9qcjCRKT1hG8tAOI8QlF9L4C9eaYFzPaHsZZ6p4=;
 b=OS76kLSpUIhVilEHVq4J8Pap0LKuG8c5ueHVC5AT4dNosbhrbelRCpsniJWdE3BrJMSL4hBYIhj5N0xmP5I34GAWE1VOPFXyu3xHYElvs0MyM3HAHMQTHjfUwIC9NCKXeSLSTeS9z6Gg9f8Gt6Nx/hc45wJ2nh1c2wEs2zkhvcLfku9LW5kf62eA0cGcyc7k95Hr9aZEzTLn58Nj2mKB5zvt44FDdg/FyHodAvagOVSgtRLTD9z+YiffIrzW6I5e1FTBJHMtsHP6zyseszkaQkhiTd0so3hMGxPjuxKJoJpzMljt2TMtVerPYYjq62e8sm9UR8/p9aOhH7OIfZ5Orw==
Received: from KL1PR0401CA0026.apcprd04.prod.outlook.com (2603:1096:820:e::13)
 by TY0PR04MB5635.apcprd04.prod.outlook.com (2603:1096:400:1ac::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.6; Fri, 19 Jul
 2024 06:00:45 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:820:e:cafe::8d) by KL1PR0401CA0026.outlook.office365.com
 (2603:1096:820:e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17 via Frontend
 Transport; Fri, 19 Jul 2024 06:00:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Fri, 19 Jul 2024 06:00:43
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v10 22/27] ARM: dts: aspeed: yosemite4: Revise i2c duty-cycle
Date: Fri, 19 Jul 2024 13:58:51 +0800
Message-Id: <20240719055859.4166887-23-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240719055859.4166887-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240719055859.4166887-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|TY0PR04MB5635:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3f73bc6b-fe66-48eb-475d-08dca7b8212d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|36860700013|34020700016|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?PMOWvkk3kXn0zgHewbkNny0dv4o59lTA8y/Zs0ntZzWI45hF6G4wJF6s83fS?=
 =?us-ascii?Q?Vc4qMa81izvH4tqR2rfvcbR16KbHP/PZMiHQ4vtvu+i8qT6zgGouq81SdXux?=
 =?us-ascii?Q?CMM7Th+lEt2m7/03sAWhfHkxcA20voJG0tZ3zUm/hehI9tA+P1P4UM1VJbqz?=
 =?us-ascii?Q?EnaQOEG4iLOJR9kf4rYF+3MEYnjVPQc5b9t4lW+dQgbd5cFvJBo+Sq+rTL7I?=
 =?us-ascii?Q?geK0+ZfqlJ80wbehTB7TCGiMMNYEyf3FU38g9I9blLwTk6syae0/3sauwt+R?=
 =?us-ascii?Q?CkGRmrCgbDqGC8aMX6b9uyGk+xGOu/Ar1hpRp+UfxrlpQItK22AePZDsThgi?=
 =?us-ascii?Q?/r0xt4f2LuqBcfgVBjoFjz3ZTehY8DvjajXPPVbvxr0g9yrJCT4C7Y8fX+DT?=
 =?us-ascii?Q?TTzA4PVt0hMCdB2ogzuBSPVPKGnr57q2pzTHPU+FnyD6WEBlTeXwEi1Ynzor?=
 =?us-ascii?Q?xwwCwRGlB1d3mROIBeE4yKt1yUqS8/nhF43X+XY5+5IAfJ2Q0CraS6K426xd?=
 =?us-ascii?Q?4q9gQhpKWmaMjZ36E1QzmZqonBmJRZAGzwIn4Wkey1u7Egw/8+kroexbnRU1?=
 =?us-ascii?Q?IfNGkE4Wi0eJ+5GidvD2jLPcl6S7m/Nst5lwmKnh3e5jaiFpAe5F+ME4WKG1?=
 =?us-ascii?Q?CFVdxSKqZ0a5Cz39Zj6IVtqsuAntQwpTaROCL3GN9iKMqgUv6M2Bb7OCl8u/?=
 =?us-ascii?Q?YpGfBV32NvXIgngRlNA6eaxGgwpuli9EB4ZUpIkCsvujWne2DrtHdBIEMJhk?=
 =?us-ascii?Q?Nlw/e8CelNhrnLyJKLkGqcAa6tMeFL66svn3ozFXfszf/YlteOEbVj0dN7/o?=
 =?us-ascii?Q?4971iAJMiFuugnAi7KfXnPLTOxzGVe0fSD5Oc8w5i6hUDEiwS7tQ6vCDS+wD?=
 =?us-ascii?Q?jBiELVKv9n7lVD0q9XL0Ee4mQWfv5cv9HKa3ObDjzKn8vXMW8NsI2lmQCSa6?=
 =?us-ascii?Q?1wRK0pf8uWurxMSlDNDp9wZSulBt+CvFUy/nN8Pp+xBlgdRxwxT7/gI7QAr/?=
 =?us-ascii?Q?lURyXmwdKbJl8j/3hhYrIr6hTUSnrTpGfjq8uuNCnEJHRvnRzWQTJEdK/mba?=
 =?us-ascii?Q?r58ZDlYLDbwqH1/QFxjZUL+IGuYvbaDmALIfvTbJVk7fohUBgIo1q71bI1kO?=
 =?us-ascii?Q?fNAzRGK3IDu0cOrENAsI9eneFlNWXRS9ZrjtqXcRelb0KccMe77Ey/AE/XF3?=
 =?us-ascii?Q?Z/7uuxPxcAnv7fYdhM0KiWT01UTDv+S4m2/kSGcr+fhGzBZJWpn67lBvFJ4H?=
 =?us-ascii?Q?vrOoqGzrPx7vJCA3ksqnRBF8LN5A+i4olM5noM0lxgnVaWI/hnx/4vBH4Cyi?=
 =?us-ascii?Q?YGzKfBGWBf/c+pVhWN2T8Eehl8AzL93nwA/wcghgfKkKSNUCb41kETmVGvo3?=
 =?us-ascii?Q?o91aegfrttY27qY/TToRu+JpCPAdDB28iUj98yY1+wOQkJTt0etC46h4H7Hr?=
 =?us-ascii?Q?lOI8n7ju53SVldH4UheASsNaIj9wfiGg?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(34020700016)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 06:00:43.8766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f73bc6b-fe66-48eb-475d-08dca7b8212d
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB5635
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

Revise duty cycle SMB11 and SMB16 to high: 40%, low: 60%,
to meet 400kHz-i2c clock low time spec (> 1.3 us) from EE request

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 62dfe935cbcd..21ca22281ef8 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -761,6 +761,7 @@ eeprom@54 {
 &i2c10 {
 	status = "okay";
 	bus-frequency = <400000>;
+	i2c-clk-high-min-percent = <40>;
 	i2c-mux@74 {
 		compatible = "nxp,pca9544";
 		i2c-mux-idle-disconnect;
@@ -1314,6 +1315,7 @@ &i2c15 {
 	mctp-controller;
 	multi-master;
 	bus-frequency = <400000>;
+	i2c-clk-high-min-percent = <40>;
 
 	mctp@10 {
 		compatible = "mctp-i2c-controller";
-- 
2.25.1

