Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 631CA97BAA9
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Sep 2024 12:18:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7vjx10FTz2yN1
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Sep 2024 20:18:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::626" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726654691;
	cv=pass; b=R7l/emm59gZsDfQ+IZ5InWMd7X2RbmHoZg7nSqH4tdASB6qfNDJY6xiQgnLrIfdx45xf5fxiIsgnGFACgiO8NppmriRau5vF3f/k+ppL5wl0oioU4S9oATaFNok7geaY6FDkChlK8FZJXjsW2Sj64SMIc0BScn8rgkeICOLVa5UJdEUDQ1Pp77srmmK/WmukkIWe5miKjY3WOXNVPCAcxz6gV37WhK3wQJ1WDplcvbtTigQb7pBxE3dhiWIDiLMJth08tfcu9RUFGV2kBtiYEIB7TT89/9QJPvz3P8m2HYnhxMZf8LpLG14sYCIXh2w3d3x5MyZBJo5PGMrSUjN2Aw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726654691; c=relaxed/relaxed;
	bh=zkHem+T3s/jRjK5q8eEkBmLJxtPEkG/EBologUthf/w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=G2ZNWcyjOPIRQBsM4uEsY7mgmx+7caBQ+NgDq51Ag4CwDd62RqhxKcDo0c/Oh+7DUbYdqRmtTFCuyV2tj1KFMS4k2/fYldmcnt75W1PLY7sxn2vmoRBVtEOCoWchb482D2YEiiRshiLZmbc8FdwBa3F3wUWeX9B1r0PJIw+6IguGsBQ2zxYVCwoIA4+FYkIPvnXTSPpLomKgj/OOepVFuWd6PlYUL07bRYboJV/jopp+JjyAcczTdfn9V+g/GXcy+/gQUAhnOnGFLJdqZoflk23uiF0L/lQKtnMgfAC9eAaCsRqXYGZIu1tv8k9IRVYNSpm+hwwNL4Y2p+KjKeeu+w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=abwE0vQL; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feae::626; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=abwE0vQL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::626; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20626.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::626])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X7vjv0Jjkz2xJ6
	for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Sep 2024 20:18:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AyCYw3qyBuJ1A3pXTit9cq2OnX33Q0wxn7YjbE4QOOv/PCGVOAxQfECsSeKBxNtg22e3KLOkX57g2wNRmcEZDaLwkItNj1hMQkjIPoaAp/Sg3Ttip3WhO8R3VlscYoJqgunED6Nft0k/9cEEVz+RQHzKCPz8KKBUNNDSf6FZTzX0TBXMX+Xs4BccSJRMNW8j2oj3LwiT2EBahgpbrKmh7jpTTy+RtEKbndAUUSCtZwm7WteJF+jgKsOI+dCWRgFjnWvY7R7/ND95RrP4tl2kRZ2BPvHfzimEOZqPDNgm7+ZISZV8vqaVOcpAXQQ5mhYc63CD2fTRx3MmvWMLYDAUWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkHem+T3s/jRjK5q8eEkBmLJxtPEkG/EBologUthf/w=;
 b=MI5TGhNbxfgtSHdyI04fR1xmUH26RSjeKca32YAd78B5wsAbBZt+rTZWOe9EmE9KUNoaqkVcIYzw/C8yMwZ3s+2p0x+vgGgGTXAzcFslvvi4Z1Elc0HW+dClCjh0jYOpWkIjYUVbAVr9md7jftS6Rho0f55+0ny3JcFZH2z2C1GNdWLl4/9V0nXPtzew1C49o8+OmfKHxRbp/nLhQEFwrHyIu17XBvSXX3TleSbbWFTNS7ZRdNr2V9Xzko2z9F/LNaHqv1Lvay29wIoffuLZsbqAHG3+gCuKuoF7Ki/wQ+AJf7iwMzC6kAsJMnxUzw/e+TCCw5SH78ntXbKaqAcp0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkHem+T3s/jRjK5q8eEkBmLJxtPEkG/EBologUthf/w=;
 b=abwE0vQLbmbIYNbuRBf7Vu8YlZJb3dREjEd6XeyP8vMH0ZCeE6mHKzmpDG7PPkSBLwa1cfBd/T0B0tTgPez87kCDOeMzOgyeqtyVb2ZK5VLaH8gHkeBT75FEzQrW5h36ydYzM7XPRoNL23mgrdyILdTCSiOiabYMbZQNxfi4JGMCLFZ8j8GRHknee7mkKsFl8LQ4IwhS5itZI1/13+GvDLp5vzvKXwAL5iyJOc8iGIh8CdSYZ8/BJ0DSjpOVRiW5EvG3enL2G/WDb+oscciyJ+NX49hPnaAd1WjThvb/nOb+LyFTJjl1hJdDBPsOX8iT3OnPWLE4eZcPzlbHq3tBcA==
Received: from SI2PR01CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::15) by SEYPR04MB5954.apcprd04.prod.outlook.com
 (2603:1096:101:8f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Wed, 18 Sep
 2024 10:17:46 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:191:cafe::28) by SI2PR01CA0015.outlook.office365.com
 (2603:1096:4:191::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.25 via Frontend
 Transport; Wed, 18 Sep 2024 10:17:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server id 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024
 10:17:43 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v2] ARM: dts: aspeed: yosemite4: Enable interrupt setting for pca9555
Date: Wed, 18 Sep 2024 18:17:41 +0800
Message-Id: <20240918101742.1346788-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|SEYPR04MB5954:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6efe72dd-b084-4e7e-7d86-08dcd7cb230f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?MNd8zHPSEo/ChQ4b/2y+4jqRTmh4xeAnEZJvd7jx/Vgh2x776B9qV8LULNNY?=
 =?us-ascii?Q?OzJBEXxdTsbl7JeLOiCmmyIs7RNmsDM5wAKNXTS5cDQr1gohgRWiaRG8JyID?=
 =?us-ascii?Q?lx0yFM3Zj7BkFWTZ1gzktQFv46OTLg7GCyPJImQuroE/29sqOa9u859eQqVz?=
 =?us-ascii?Q?gPnhPTkWIBU65X4b8k75LoyledNW22x7rfKt9Q7dp5Ijhmm9pRuMU7O7Tuhg?=
 =?us-ascii?Q?OUXHIIhkE3qpWxznepqCFj/i51fPXyXu5thz/Sg3/L56/UJ3ZRXB0HBNruhR?=
 =?us-ascii?Q?M8W+3pX3dkGh0cCjbakI7ZITOJPSu+enIwCECTWjAI1yt/8/x+yANZziSvoM?=
 =?us-ascii?Q?7XUsnnh3QQopBNvI3RsrCo7t3A6Y2ZZqrGrUAhROqKn0Y/iXrdNL+xDNzPVi?=
 =?us-ascii?Q?bZQGE0vMOzEP2bKJC13x+pl1qr96aDpEaOmyXka22wv4+7aPcqWoL1keKVNN?=
 =?us-ascii?Q?BYZTNGMCkZCcyV3ElwcSbw3vF3N7+4+OM8DQepgW/0dAtuvJkD6qNi0zb6He?=
 =?us-ascii?Q?6Ivz1u54v1tt+uDPb2eUGXc7nexZZ4Qe0rdYx921sOBUrCelyr+K4JmMPvF0?=
 =?us-ascii?Q?q8kcU14TgtdIKPeq47Pt6y4xAVbOKOrMr1Y62b2R00p7rSRdDQxT5ywL6jUI?=
 =?us-ascii?Q?jvGBJkVwpnF4dVCHjEn5KuYDWPZQRzJEbkSpNsIPI01YefnsoC6/j7sKLp/e?=
 =?us-ascii?Q?DvZ6huQY1Dn4Bz3NFTqTQ5BbMGgLawzV9M+jKqIOYdVg7gcy6SplyAro/KuR?=
 =?us-ascii?Q?aUSVeW9nKHYnPO/MGoUJBsgDjf0iPkH4I3EXzS6l+Swayx2HYXHk/S8YM/Q0?=
 =?us-ascii?Q?KU3w8k+J9OkEuLRyEbMGvM+lsYknbR3W59URpr1ipadGza3XXJUUzki0a5gD?=
 =?us-ascii?Q?JcDQ6dDBt0/5nhakCI/YIayf6375UtHfMbunbxbSb5+923qNj6g8FZlBBsD7?=
 =?us-ascii?Q?T6gXKcqESLfqqS2anUDrLR49hvKCjjNuByQs/RH6QzDgIWbLDx0RaHgG4t5m?=
 =?us-ascii?Q?9EsQuTJ5bFXbvsfwZIxefv39leeSuqVwKCNs2DiRrGNaTEqJ+m62VkoSRWRI?=
 =?us-ascii?Q?va9+lnfOy2qRWWAX3Hwi7ho8y43yaVHU5j8rfxfrVQZjDThRwxMlvteiAVcd?=
 =?us-ascii?Q?9tuhFWCf4I5nQp+pvrwZ68HAFY0jU5FO+LqheNE8m/TN+gz3UIxPH5X8rVNH?=
 =?us-ascii?Q?ncfiz9WGVkD7aXWDfcXwq5cdf8CATX/S5FhFKz8st3M5ePGq3WlvijeTaWmd?=
 =?us-ascii?Q?MbpMU6ZJvCIYrIWN1dHtKcK6piOKqkR3Aw+Djdpi8VYz3VEbhnQNfsE3S/JX?=
 =?us-ascii?Q?gCdr6iXrOb7Zh4BM6NjJQolrTqASUX4pCYiTAvvF+8iUlgfj+P1KpGkxJaCS?=
 =?us-ascii?Q?BpWK83xuHuxRzu4la+gfrZfxiZjc9FM2rA3IUL2wQQsyOS/kqV2bvt4z7E6Q?=
 =?us-ascii?Q?XW5j+pcQC/a5I98yQN79j4S8qnsutRzq?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 10:17:43.8662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6efe72dd-b084-4e7e-7d86-08dcd7cb230f
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB5954
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>

Enable interrupt setting and add GPIO line name for pca9555 for the I/O
expanders on Medusa board.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 98477792aa00..9292f42a39dc 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -298,6 +298,20 @@ gpio@20 {
 		reg = <0x20>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <98 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names = "P48V_OCP_GPIO1", "P48V_OCP_GPIO2",
+				  "P48V_OCP_GPIO3", "FAN_BOARD_0_REVISION_0_R",
+				  "FAN_BOARD_0_REVISION_1_R",
+				  "FAN_BOARD_1_REVISION_0_R",
+				  "FAN_BOARD_1_REVISION_1_R", "RST_MUX_R_N",
+				  "RST_LED_CONTROL_FAN_BOARD_0_N",
+				  "RST_LED_CONTROL_FAN_BOARD_1_N",
+				  "RST_IOEXP_FAN_BOARD_0_N",
+				  "RST_IOEXP_FAN_BOARD_1_N",
+				  "PWRGD_LOAD_SWITCH_FAN_BOARD_0_R",
+				  "PWRGD_LOAD_SWITCH_FAN_BOARD_1_R",
+				  "", "";
 	};
 
 	gpio@21 {
@@ -305,6 +319,19 @@ gpio@21 {
 		reg = <0x21>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <98 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names = "HSC_OCP_SLOT_ODD_GPIO1",
+				  "HSC_OCP_SLOT_ODD_GPIO2",
+				  "HSC_OCP_SLOT_ODD_GPIO3",
+				  "HSC_OCP_SLOT_EVEN_GPIO1",
+				  "HSC_OCP_SLOT_EVEN_GPIO2",
+				  "HSC_OCP_SLOT_EVEN_GPIO3",
+				  "ADC_TYPE_0_R", "ADC_TYPE_1_R",
+				  "MEDUSA_BOARD_REV_0", "MEDUSA_BOARD_REV_1",
+				  "MEDUSA_BOARD_REV_2", "MEDUSA_BOARD_TYPE",
+				  "DELTA_MODULE_TYPE", "P12V_HSC_TYPE",
+				  "", "";
 	};
 
 	gpio@22 {
@@ -312,6 +339,16 @@ gpio@22 {
 		reg = <0x22>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <98 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names = "CARD_TYPE_SLOT1", "CARD_TYPE_SLOT2",
+				  "CARD_TYPE_SLOT3", "CARD_TYPE_SLOT4",
+				  "CARD_TYPE_SLOT5", "CARD_TYPE_SLOT6",
+				  "CARD_TYPE_SLOT7", "CARD_TYPE_SLOT8",
+				  "OC_P48V_HSC_0_N", "FLT_P48V_HSC_0_N",
+				  "OC_P48V_HSC_1_N", "FLT_P48V_HSC_1_N",
+				  "EN_P48V_AUX_0", "EN_P48V_AUX_1",
+				  "PWRGD_P12V_AUX_0", "PWRGD_P12V_AUX_1";
 	};
 
 	gpio@23 {
@@ -319,6 +356,16 @@ gpio@23 {
 		reg = <0x23>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <98 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names = "HSC1_ALERT1_R_N", "HSC2_ALERT1_R_N",
+				  "HSC3_ALERT1_R_N", "HSC4_ALERT1_R_N",
+				  "HSC5_ALERT1_R_N", "HSC6_ALERT1_R_N",
+				  "HSC7_ALERT1_R_N", "HSC8_ALERT1_R_N",
+				  "HSC1_ALERT2_R_N", "HSC2_ALERT2_R_N",
+				  "HSC3_ALERT2_R_N", "HSC4_ALERT2_R_N",
+				  "HSC5_ALERT2_R_N", "HSC6_ALERT2_R_N",
+				  "HSC7_ALERT2_R_N", "HSC8_ALERT2_R_N";
 	};
 
 	temperature-sensor@48 {
-- 
2.25.1

