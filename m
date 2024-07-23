Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A81DD939D7F
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 11:24:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=VNShvHyq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSsDD42myz3dJ9
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 19:24:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=VNShvHyq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSsCs1S08z3dC1
	for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Jul 2024 19:24:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sov+gBbn0HFP8eLfkiRbQV6YUNASV8+mIxVq4V4CJfZKv03myuMc57jVHN4PIdmX1BPmyQFrWeWzrG1cGawPrTL++hwWFNRLuEHvHFqVhQYQbUjKyIEA0mpKYVJERROTXHwWtJHoj4YghbvRAIjp157r6gNCAJ6v9l6psqQZQ9leIMRtGIh/EMO7F8/KAIlbE5Jres6p4n0Vcc+a8h5nwqtu5TPe741flv80RumcK0U+7qgluO6K10W1Z2z5AOAAx68jZ0K1pUv0XxqroIaNPtcaJ8/0oRWWHHVNP74xf5dqwMDfhtrFYvjcX6M8IizVNs39kxYM7HtFOv/0dln4Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JazR4JFYH/44Q8aeFrnjOL2rYIPNbPmPhwoAEXWC6OQ=;
 b=vfoeoTz84oziwYcu07WsupXHg6xBKuksQL69z0pEDIZtCLt7OhZC6E02VALbWY0KCMKFPDFykr5uVBKq4tK5J6cruvGQ1h6li5C3+bUpCT/sa3/IV5757fEhkd/elmb+Z2Os9u+LHHd95qfVWAVU3Lbon9HXIDpQZAHjL1KEuanH/lb27jbaHroBuV+X7nxrfeeGzAp7P62MaW59lVRKtzBulIb4ewxYC2x7kCnrvWYKOx8eskaFJPlUHjPu2GPrXs9ZShljwjUTYUND2yZUgbFCyrQ6HM/xW/8JbR36XMUlDa3SLLgs2TXOtVenMw0coq1bTYH8IkMvYgNifpam6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JazR4JFYH/44Q8aeFrnjOL2rYIPNbPmPhwoAEXWC6OQ=;
 b=VNShvHyqIptf5eF20Jvsg1S5Hc2xAaT1kUNfqFyOxtWXkODGr3VU9mFgc8EGqmeWsOtH0EoPDn4SBE81RCKI8UuHCejMttVTCatPDhOPKzVojyLLIQmvZvNqk4oATeN/sGdNoos5xVTdTcYWuRJQ97W8S1OmwEu/FF+jZut8bmjwpzAViOQCp6nP8jFAIwDzmS9Osdx/nsYXSZe14MORcpppv6E77YesNcRQFO3ljSO6DijwT8hD98wm+EeemZQTyJ93kp/ZMUQdlaIefW693OJIHTyJxZKubPb7GDdtX3kml9T5KCmgRhBjCTV0Z3ohPUnXyf/Gq47Y5PWSgr1D1w==
Received: from PS1PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::15) by TY0PR04MB6207.apcprd04.prod.outlook.com
 (2603:1096:400:32b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.9; Tue, 23 Jul
 2024 09:23:50 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:300:75:cafe::e0) by PS1PR01CA0003.outlook.office365.com
 (2603:1096:300:75::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Tue, 23 Jul 2024 09:23:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 09:23:50
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v11 09/27] ARM: dts: aspeed: yosemite4: Enable interrupt setting for pca9555
Date: Tue, 23 Jul 2024 17:22:50 +0800
Message-Id: <20240723092310.3565410-10-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|TY0PR04MB6207:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dee3f7ed-28f3-46a8-e13e-08dcaaf929de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?HBcGU/aLBuC4YyMOCqnfU7ZxtRbOGyWiOSOGEdt5rxv0mbuMAb1sdd3LlxKD?=
 =?us-ascii?Q?hSNBa7XlCnp7dmxdKi9r3rpXu2g2W/VMLr9EIzx3RNLB+yYrPqA3nB+7b4c+?=
 =?us-ascii?Q?jtP9yEClubmm91u7BllHBA3uRtYnWLl5gKqAVElgs7NBqSD19Qf0/qS7Q4pT?=
 =?us-ascii?Q?tcO4ZhCBP9mHV0TQT+jD2Sbshsy94ZRtVopt4RL2sWaKpR63g+IL13+4bghi?=
 =?us-ascii?Q?9Acclf7ZhpYcZ5HQOnGIn/KtKPL8J8rBf6ubxaS1LJWXrpOeReUp9rqgb4Vg?=
 =?us-ascii?Q?8lbdHjZYzk5cO0bwCMvlKPRJC5BLfooBIan3uc1Nzr58Iu2gFQfXu71kCQ6y?=
 =?us-ascii?Q?s/A6jVkIxrRhnVRZ6hyEZmL0uQiMX+x6LV6+dGLXW5SSuKdCuw115vX1r42m?=
 =?us-ascii?Q?0B7EnrIYAqMGNectua9/jqxTjxrIWlqBM+dAuhh76dO9Woa0WSwBUvYXODqx?=
 =?us-ascii?Q?DtNQ8HpGfDKbgcEVThaXLmp5OmxpHt7c3xJ0CMFJBmbKk8F7iXMHRi/o04dO?=
 =?us-ascii?Q?KyulKdunrJI2YA2VPfHgbZ1F6wtpaekH/Jn/0wbqHNXENyhedT9WS57BGN2k?=
 =?us-ascii?Q?sFaf7KSj+ajDRHTjpAlqJ+cEK6hTPIvb/BiG8cl+cNVioJXFTLYNh/QuWL9G?=
 =?us-ascii?Q?Okf4Q4rYcKJNVm+7sriE+i7FRLmSJxu+787qMd0dVmoRYCz69HCOJ9QsCeFq?=
 =?us-ascii?Q?EVsnA9a/P0u5JkV/OMyyKS7cATDZ5bmY5KOu9EXOiXOrVyLDxj52cv/PVmsH?=
 =?us-ascii?Q?YQzVXDu8TJh1uKAyTIeADnfP+ddxAlNYhZjxL6p5bNSZ/CvIR5fNIHUxmHK3?=
 =?us-ascii?Q?4R12nyFkEt1Dc+pbJoLNoqv6BNzNIfYZrwVbHQTFvNcRfyswLQ1Ij+vGsiws?=
 =?us-ascii?Q?EZ0mc/6CTVnZq+F/fnzgBnUFfcTkhjg/z27JbYtJJXnaSaqHYr0rFjlm0/LE?=
 =?us-ascii?Q?A+Zgul758JFUnLC9tO3UWNuTN5gSB3MT0txL4SuzjsNZXfikZWVLWI/zk2zt?=
 =?us-ascii?Q?3UDTgbD8Ng7VZvPZwwgHc1t604sdrBfRl2vN7b7l1ThkIEWbVpic2u9qiwfY?=
 =?us-ascii?Q?Yj3YghrESyiUu47P9Mf7ixCUoOYeaGuCGJFjgwDzA0GLXFMM3AIIJi1HkQyC?=
 =?us-ascii?Q?SGdQt/8u+BhRCGAsylklE1/7jDOXvdPHgh9G7gxXxylHcBCd2xPqrZ4g8Qbc?=
 =?us-ascii?Q?y019uEjQbpTo9g2YgIER8mrPWIJ13dlxBLt9iyFOD1vyG7WlrPFfkqRHgPAP?=
 =?us-ascii?Q?r54F84ZUy+J5j85HoQxmo56NgX6GOeQYZbZRkNwKG/STkJUqc9pTBu6qFyG1?=
 =?us-ascii?Q?IMgiStXmmd3xVWwbinP1bgKbuXt5PG+Ux9Y3AKxScDmPK58bkmCQ4Fyt0nGK?=
 =?us-ascii?Q?vBM44FioOihVn2VwLZC8vStWof7yS1Dlg3S7YugU9VuhVRH4jf9VwRZs5P6v?=
 =?us-ascii?Q?T+qXNk26WAWfy4srz1+XZhPIqw3iuLzQ?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 09:23:50.3631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dee3f7ed-28f3-46a8-e13e-08dcaaf929de
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB6207
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

