Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C954A96EA3F
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 08:28:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0R9v5thGz3c97
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 16:28:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::626" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725604082;
	cv=pass; b=IlCGFb1mtvaIp5un6ikMytTWSvs6oFCdlcx558EsV8aWWuRc4cKMgxJSvg7ud6QvEWwt0Z0pE+a/g9zHeFjR1gyRt150i597sVE0HeCOBdd+Cfzg6Q7ii6/ygaWVlDStuSGI1B4esAFqe/UkKt/jXd9pes3vPaB7vx1d+W+1uZCHSnX8OUeR5zqniXkrxR7x40Ag7hvliFNwh/mUQQz5iXV1i4uuRuIpEriharF+xWq/CcOPNDNKJIdiCdSG51i/tMGgfm5aKlFBuByAbsGLPzTVkqhWzvsOWHBz0D2HzW1H46vCc5wW8tBjN1bY/a6NrttXOM75mymCAcK7rB6zAA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725604082; c=relaxed/relaxed;
	bh=JazR4JFYH/44Q8aeFrnjOL2rYIPNbPmPhwoAEXWC6OQ=;
	h=ARC-Authentication-Results:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:Content-Type; b=WjyRdEM+j7gGgN6FZWm0JKapbO3Uk6HUkwBGEp57ZALHcpl9QJAP6TXVfMYh17RtUGVjElnJKDBaBLA2W/dwBvOeBqP9cqw769xXZolob8jrXri6s+M9hp58bP4Bggf7YXpz4L9nkjJuJrDnH2gB7oY3mu/U3MnAoZhguYJFW6UwGB1EvmN4slfizY7ZMJtDixKntVyLm0m20tEsjQOEAn+9MmNEFNTxGvdzUUi18QkAVUfR65W5LpoJf2SuGCvUwnn0fP/UbLPgkTLHzXLE6MTSS5CMVNhdG4OnJZ3WN4x6ppfmaj7u+txM8Nxid4M1jbZuPbwwOAowU9cGY98RnA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=fHxq8YT9; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::626; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=fHxq8YT9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::626; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20626.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::626])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0R9t3LVzz3cBd
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2024 16:28:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSxS6IDR9/uJHnJH0UJ9WRNXnEUY6TW4K/a295qxBCjGpRPCWRrm1wcHxw/UMYhC8f5Vh2Rc8GgXw8NKOYEtPQSMJit7oejZSzsI0lyYIY3r7LKbmZfcJONgxX/jmHOsRuMcvRHRo+qNGCCSvCMb00/rAe5RpzTjMnAnmo9vONxZ0/j73Zv1mu6iXOqr4nvEbOuJEZEeUHxfbagunyx+l5AwajpqJ+Qx9FurQFmPLXGdjxG+3vOLZmnAhIMsoTxA3a690esKA85yskODilpXIEQI08DjKY8Mm9Sr0GBTw3dN9CvY7kdw3DtHOX2DDtbPLr17v05rXvz1DRi5DZtTpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JazR4JFYH/44Q8aeFrnjOL2rYIPNbPmPhwoAEXWC6OQ=;
 b=UUL/NdYQpvafJ+43edkXM61Edix3t7+rp3vRVuECi9VNOhQJArBjRpfk5rc+knE1TT7+VaSp2kueSTqyA2UTdWfPew0WmU2emRWfHNsn892lOgVOyBf58Zsi1bYILjQDPRzYVr/VjmLBU5+i/cjdbetQSGt9Hm06seVIprnizR0Ux42G4vXvmiegRf4vuqQwsHqY6qTjYj5mjB57jDBYFG1FxwzSdpkitKIb/vi0NyVWThUvE/+OgelRcHPz3LzoXSkaCT3kuAEpG7vygMh4qzuZERxQGtOgxNLT3s8B0vCLPUtryF8V0WUbHnWn50rVboTyGZZwFa0bVeA6Bc1BNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JazR4JFYH/44Q8aeFrnjOL2rYIPNbPmPhwoAEXWC6OQ=;
 b=fHxq8YT9tNnhEPr+RwfRk25NcScfoClzyGa2DH/MVo6dveOldId4eISl2GXuq7Uxru80vkmP2+zNzKtiNFRAfHtg17DEflpcWIjBA4aqogFNk611lsGf1O3q/B0/nTtg6x9KuK5AOxIr3mGaOI1bQwulnjI0Yxi7ReZObsiyxDJLi3GC6+xQGsQCLyc/OPwaPkP+qVshkiDuE3/5hcZPPmHbp8qbjZNfbE65l9XzHDYAbzK6JzV4nSiAO8/UkmdIXT3J+XgdFD+TOqOLbCQPkb1LnS3OuHPecT9Fs8tDwaIEFYsU8rAvD1Lch0PK1U/M7KV+b3U6vfQlLSK8GTff1A==
Received: from PU1PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::15) by SEZPR04MB6806.apcprd04.prod.outlook.com
 (2603:1096:101:e5::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 06:27:43 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::16) by PU1PR01CA0003.outlook.office365.com
 (2603:1096:803:15::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:27:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:27:42
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v15 09/32] ARM: dts: aspeed: yosemite4: Enable interrupt setting for pca9555
Date: Fri,  6 Sep 2024 14:26:35 +0800
Message-Id: <20240906062701.37088-10-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|SEZPR04MB6806:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6ccf5dbd-53c5-468a-6758-08dcce3d03c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|36860700013|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?QLEwppWHvk6rjfJPryZ4xUFhyqY+MsybQ5ASKelSlOqc/IF3V7tm6ip0M1VP?=
 =?us-ascii?Q?M9aw+lcQ7mCjaQy1+Q9JzvCxjK/mtojxJs8qLYtHcvyqE6nv8JttEpI67mKp?=
 =?us-ascii?Q?RgBIM76Um+0DsyX804rjIF4jchDH4gfiaDx1VTVR/yXUiplzua6dfDkszzBe?=
 =?us-ascii?Q?5LjUU4a8skrBrN+D1URg1h85wlkCzUED50PgOrDNEnJE47ij213Uih8ivU0I?=
 =?us-ascii?Q?hzMad3LiWPaVplBuiMyV4SALJ49WDHWjFCTCG1dUOpdkOCvgamiXmZdvKHfR?=
 =?us-ascii?Q?s01yEJNQol5BpCMTsCwaU9ue2BAqA+RmdX8dCRATPO76HQ/bFYw6X/djq0vN?=
 =?us-ascii?Q?68YSaOt14Kz6bYXXGGz6rKRorRpFD0FqYBeh18jGAztAAPwyuhBvr6I54JUz?=
 =?us-ascii?Q?4sm8UT+c33BilIraSQrFjHg1/51NBGwIUjK804JuNyVNrne0yxOZP7/5aMIf?=
 =?us-ascii?Q?vLhhHovNHjFf+v3h0fhH6KOWX57/2A+ENz7jJ9UMBtG/uOFQiZcC+vrxxSUR?=
 =?us-ascii?Q?K66wd+DB2ihRUnkUa/EZAml/iP8GfGpVDh6a7XiNmRTIJnxjcl2rdbWQtLBM?=
 =?us-ascii?Q?NtE3ydFf1+WMSKyJOcBXOyWLNRDxkij8yo5gyLYmFNsgtHY/WwH5aMGdia8Q?=
 =?us-ascii?Q?GAYxzYf01WtWTOPa9Tswm21rxFxtRpbYWj9MhekDS7OE0pPEjkgfQZhg5znH?=
 =?us-ascii?Q?0H/xlrCOk8Gn2qvmIkMiK7Lnm+OkAy2gip+QEE4iH3Q+g+9baGbFfOl3Jqae?=
 =?us-ascii?Q?OD5jd3vFxUVZWD1zFZ2JkUF2yXzwrQNO0ZGMpvHxdNpW4hWbOGZJqOulXXRR?=
 =?us-ascii?Q?YF7ZyoPfRa6o41F8p3uqJ3nAOEMvGrA/JLVh8ulcjt0+PkTwsdLrPRbwifoe?=
 =?us-ascii?Q?HGi63UzuBeF/dFeb5pY827F7xnFuYCgVqqanjpHKqEpf8SI5ABh+o3vUWH7H?=
 =?us-ascii?Q?DBR457hMrDsu4jKs6FyAnuXqifTjfQU5bIOIL78bt40Ty8BEZgTGh31D2pZc?=
 =?us-ascii?Q?mQrXcua1UAvFCQLG6sBJlJBdG2kenoj0F3iilFZkVJaSk4ya9Cl3PSBJvAc/?=
 =?us-ascii?Q?gMKrRdtcD/z4enWTGEUe5lONZ51ar8zlKHROGekqJ1B0+2rUw9xelLY951sG?=
 =?us-ascii?Q?33azS8Kre0MNDRzR0wSOxakD8ASDyQWnKsaUxBxm6rqeN0lm120Hp9RN3VLS?=
 =?us-ascii?Q?lXvxpMmCtF03bqPHmz+WNtLqtfbXrRP2zxzGztDVTztOEDv3f2g/7ZnaLLPV?=
 =?us-ascii?Q?QQcbXd1PuuOL3bvHC8Pm7PgIX4dSVvCtAp993PFeA0Eiy0T3a6XgHpAM7a5x?=
 =?us-ascii?Q?kWSobwl1G4p2afAtJENgIr1N46rJJkzwV/gRgxbcyk3C/ncfewp7Z9ANLEnr?=
 =?us-ascii?Q?McvHbIkm1J0idyvIzok4G0I56gkGrQEYS/VZP4D3b8sOGWElKA4uKQpKF8EJ?=
 =?us-ascii?Q?quWGNfag6Zczw4enZH1LLeJSTyDB6vYu?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:27:42.8188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ccf5dbd-53c5-468a-6758-08dcce3d03c9
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6806
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

Enable interrupt setting for pca9555

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 56 +++++++++++++++++--
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index b11951c2f71e..09bbbcb192f5 100644
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
+		"P48V_OCP_GPIO1","P48V_OCP_GPIO2",
+		"P48V_OCP_GPIO3","FAN_BOARD_0_REVISION_0_R",
+		"FAN_BOARD_0_REVISION_1_R","FAN_BOARD_1_REVISION_0_R",
+		"FAN_BOARD_1_REVISION_1_R","RST_MUX_R_N",
+		"RST_LED_CONTROL_FAN_BOARD_0_N","RST_LED_CONTROL_FAN_BOARD_1_N",
+		"RST_IOEXP_FAN_BOARD_0_N","RST_IOEXP_FAN_BOARD_1_N",
+		"PWRGD_LOAD_SWITCH_FAN_BOARD_0_R","PWRGD_LOAD_SWITCH_FAN_BOARD_1_R",
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
+		"HSC_OCP_SLOT_ODD_GPIO1","HSC_OCP_SLOT_ODD_GPIO2",
+		"HSC_OCP_SLOT_ODD_GPIO3","HSC_OCP_SLOT_EVEN_GPIO1",
+		"HSC_OCP_SLOT_EVEN_GPIO2","HSC_OCP_SLOT_EVEN_GPIO3",
+		"ADC_TYPE_0_R","ADC_TYPE_1_R",
+		"MEDUSA_BOARD_REV_0","MEDUSA_BOARD_REV_1",
+		"MEDUSA_BOARD_REV_2","MEDUSA_BOARD_TYPE",
+		"DELTA_MODULE_TYPE","P12V_HSC_TYPE",
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
+		"CARD_TYPE_SLOT1","CARD_TYPE_SLOT2",
+		"CARD_TYPE_SLOT3","CARD_TYPE_SLOT4",
+		"CARD_TYPE_SLOT5","CARD_TYPE_SLOT6",
+		"CARD_TYPE_SLOT7","CARD_TYPE_SLOT8",
+		"OC_P48V_HSC_0_N","FLT_P48V_HSC_0_N",
+		"OC_P48V_HSC_1_N","FLT_P48V_HSC_1_N",
+		"EN_P48V_AUX_0","EN_P48V_AUX_1",
+		"PWRGD_P12V_AUX_0","PWRGD_P12V_AUX_1";
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
+		"HSC1_ALERT1_R_N","HSC2_ALERT1_R_N",
+		"HSC3_ALERT1_R_N","HSC4_ALERT1_R_N",
+		"HSC5_ALERT1_R_N","HSC6_ALERT1_R_N",
+		"HSC7_ALERT1_R_N","HSC8_ALERT1_R_N",
+		"HSC1_ALERT2_R_N","HSC2_ALERT2_R_N",
+		"HSC3_ALERT2_R_N","HSC4_ALERT2_R_N",
+		"HSC5_ALERT2_R_N","HSC6_ALERT2_R_N",
+		"HSC7_ALERT2_R_N","HSC8_ALERT2_R_N";
 	};
 
 	temperature-sensor@48 {
-- 
2.25.1

