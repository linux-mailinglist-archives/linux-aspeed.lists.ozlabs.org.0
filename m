Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7462095457B
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 11:25:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="::1" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=b5q2+m4r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlc6S3HRgz303K
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 19:25:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=b5q2+m4r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wlc6Q1z8zz2xst
	for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2024 19:25:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0ZWqJwvmeQ02QaXGjfoiHDWGYTNHecelukIeSHD/UldDVCK8fADZ5jsveXNA1W+dJJ5FqMwmOegP+uBnvXF87F98cmEDmCx+N3PSDZexEesltCA3/tNoEun2cIyGYKOZoMq7IB8A57re63wyij5FKx5+o2Sww+8EV86qRL/8hTilRAOfy5nsYjCQH743K+BvnwkbnlxYg8Qb9ocVOixXEdDRkCJ0TIlr6CzEu1FLrBum5ddCQeABms5xZskNq35cARXioeHwnkaAJRnZwySX1IPEGr/IWSiWnUwouaNR0uAABwjTEYV3PhWbtDamWlGxCCWjdDaWq/CqeWXtOoSNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JazR4JFYH/44Q8aeFrnjOL2rYIPNbPmPhwoAEXWC6OQ=;
 b=tWgZU3MHRbZxVlx11B45Sxz3blkB6QS7eOke65UV3h8r8W3MJyAm/zGiMgrFgvXyO8kQY5fS1/Pl9OwbDnDuqvqVUIVFTmEj2Sc3bdYYCJDVIxEJhnE7pnfasLtkz4cfkedpJyywHSXipBDi88XuvDxJuq76wsambbU/PU7eI8Hq7qmLzxn07PbhqJL/MEJ2/SRrCzAilhk7RmkuztigjOPI1/yvEj1qS6uRc6tDpMLs/WcoFiAEMx0VsTMlJFtXqm+SU/Xbg16fsvtvf7LBj9dh1OYnO2oslV+C4MQKBaSjF/bvjFeXL7w1oa719SMpHoXM/tG6N1MtrVAH8ao9BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JazR4JFYH/44Q8aeFrnjOL2rYIPNbPmPhwoAEXWC6OQ=;
 b=b5q2+m4rjcFtS3TqqEIDL8h7JnE7D9YsOamRamkPmULKwU4rQxGdIHbPDQe8qrZ6KtV+zVEovKA1cqzh9wyhZxLQ3OS108guXpl0/pipKPfd2P3MgTCWKOI/WeOixEhLHDvm4GT2UzbfjLuF+CBAgathHNdUvlIVXuoHzcb8WWHeLFoDPl4knwHDgrocd5lWQ1tmVYlZunQCBK+fVbi0mxwM/AJvuuJNSYYHJg8U6y3HIzzs7XqO3BzestwoTG5ipro+fi29t10IJ9hpRoctfh68WabahCBQi6x2GEERBET+DnLfZODpv8sK7YIpucp7NruWtLHZVmIHgSp7jK8+mQ==
Received: from SI2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::10) by SEYPR04MB7400.apcprd04.prod.outlook.com
 (2603:1096:101:1b4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 09:25:08 +0000
Received: from HK3PEPF0000021D.apcprd03.prod.outlook.com
 (2603:1096:4:193:cafe::cf) by SI2PR01CA0047.outlook.office365.com
 (2603:1096:4:193::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19 via Frontend
 Transport; Fri, 16 Aug 2024 09:25:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021D.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server id 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 09:25:08
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v12 09/28] ARM: dts: aspeed: yosemite4: Enable interrupt setting for pca9555
Date: Fri, 16 Aug 2024 17:23:56 +0800
Message-Id: <20240816092417.3651434-10-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021D:EE_|SEYPR04MB7400:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7d074948-fd5c-4861-d340-08dcbdd5521a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?Wj6IAuQJLPAVVi9FsIdDwYBpIeHv8SGylx6DvwN5SnLoGD+g2jgtlYjlv2Fl?=
 =?us-ascii?Q?UQMeMNxqRkSsBPXLU2JxhHWHUqXAjj1Cxz9e2b87fuVLX3xUsuOTZcCDmBID?=
 =?us-ascii?Q?wEJsvWS7abjGuDpHdo8PaIts3JWY4tqIcm0G+El0nQNZzC+ySDOjXe25dZBR?=
 =?us-ascii?Q?5za+IC3esues1D7VIt2ErQ5v7zAKU4/4GkeRfGFK8cVztOfHBmAdNNkQPoVH?=
 =?us-ascii?Q?g5OQv6wNTkGRs4P7WzNmWftScBKPJHcrxbt+O60ahhujdW+04VDmbTfBQtnu?=
 =?us-ascii?Q?H7+sqU8oL6FftQ/zHYg6ZeAnqoyCpIVK9ZhxJfTAFhUAFgMQ3kpoMjzNCuq8?=
 =?us-ascii?Q?e/lZuCLvHxbz395uyumJV/5BaNm79/8345GpFoODK1zCgwWGu3LhCvexT3Hk?=
 =?us-ascii?Q?c08MdC7UEi+F1z/l4iC0jTikUM1wdAOD3REVOV+2LeNnAvzAP8854iEFsgbm?=
 =?us-ascii?Q?kE6pcHDzW8Bc5IFtEb4kLhL7DhCEeehTXvMSTMUisxJFB3dQMuCQLKFi0kdw?=
 =?us-ascii?Q?6PbO5MgGj1lNliDpk/QuYQAhjJBj5HXPis6GlVbVIxSOeatnfuKrOYaEjE2P?=
 =?us-ascii?Q?q7nkcVS0eQyHd7gb6L35QmZKzp5j8hk0KjyUaLrx5419Z/ncJYVisOT+9lck?=
 =?us-ascii?Q?KcjdatyPgGnLGQi4OLkYN7WQmsZpvHVLFFjRFGuv1IvYtES0eIu6jWaRf1MF?=
 =?us-ascii?Q?kP2xkqSmCR70YtDhRrxydLxHuavbQyL6UAE0Z0F6Sz+Rf9+44JEohIWPT3Fs?=
 =?us-ascii?Q?DLYJ1DF8ExhHBQT3JElSJEv5UGDwFujD0lssgV+OFws2W1FmzebhhNxdf/8X?=
 =?us-ascii?Q?thmD5HpjpEjUx9G6UKzCh1NeSeTse28C76Y9pIRImK04FiBCh8Na5Ia5yMp1?=
 =?us-ascii?Q?sOZPa8rqG3LccO2klQ0IuQ/RrKOKusN2JMTyArMTj0M4INoBRMdxJGiLLfVG?=
 =?us-ascii?Q?OG/b1GiRSDAamYLWoVBUlnPCNSmKPRZKMuC/Tpf7mOi7/FtIljdvdnQ9IAI3?=
 =?us-ascii?Q?6JZ6a1k6Y64yg0UH/ffNbEw5ESvI4XrpcWHiCaHDzX50N0YQccgVtKJAO2OW?=
 =?us-ascii?Q?xqAvGsYoGu7iw7TINnNxy1O/J+DtA9hTra6scFqnzX2dshISKCOOkxOwhi0I?=
 =?us-ascii?Q?nxCSRg/KK1OyMYwssw3sFSJfsR7+ayYA2JDHnS6wtUpu8Cr9J2KIf1jV70qA?=
 =?us-ascii?Q?kGXBne67/wsLEBknQ12daenAsjnZboXtaYCiJAbTbsrJO3Wz2b8WfCSFMcnq?=
 =?us-ascii?Q?RxseKzxPNpJmj652Xvz5uERFR7uIhVOMuEBkwWLwab4g4qmxIt0e+mN8cddw?=
 =?us-ascii?Q?K7NIgMM3rrZ8/KbCDS6wv26gkp9oYwRW5FbLVTchHBjccFh+4LNGPNQZvuO0?=
 =?us-ascii?Q?7iiyyTvnXiofTcj3jEy+uDTdpQtU6MlxX1tUktyqKFv7UNJnSne+cn2bFjyA?=
 =?us-ascii?Q?hpNmlOJ8tQnmTd6UUdTiWf5zmsYSGXaG?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 09:25:08.0753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d074948-fd5c-4861-d340-08dcbdd5521a
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7400
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

