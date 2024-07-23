Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AAD939D9F
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 11:25:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=pLcoz6tS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSsFt3lNGz3dX3
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 19:25:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=pLcoz6tS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::61e; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSsF74dwvz3dWh
	for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Jul 2024 19:25:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEi39O22J3/ut7RGbwySz75Ffh0q4AqM4x0rezbcIOlPTJOLvlas2V8U4CJS8ws4zfHODBC/W1Wszvs3pIekxze8H2t+x9fWndLoQ1XHvUJTnE8/jWvqnHcBXHBXVP3ou+wDSPouO99V7v8vWeXaOE8UPX0ffKVTMjQdWp3CNYUGy46eocfsJPzYAskIbce3pb8re/2GianuO1XbbN5O+j+w7ILxMga6kp/ZcKFA0ei+tPIFpRUBQJK8R31gicA6pAV4WUL9Pxh9PF/3x5T8w4uk3uft9Tz3kgbc7OpM1Pb+J1gSP8K9PE1JXWjEzUqBgOAO15FbdJuRxO9/aplHNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pXz7BSWZBdMOtEGyFa/mxHhT1h94fl5HKQ6bKEYhdI=;
 b=Wryd+S9jfurebBmsalblHGfnCqFFsUYvB1WAJzsHhuCQc9qFsm0qJMaBd/ZgxXGnNRGdzCFGQB8izOrRWVJfZYJF0z8BO1XMt1XNOrGhiFb07Rjxa5GNhm1nJaob4FV3sgbeGywl5/o9WyCjtFMmJGjg46H8zxlmFYniYnkMYDv6dmEvnsz2Uu10B8ZCIioUf92BmCwBrMnE1s0FDbh1p5/EDrZo6JfKKJ1sSiATAYJEUQtdHoKCl/2W1MWHx/aGO0dXMVDPH1vs+MVn7qRFOyQvJjzlaIuDewxPWqoBbIOt5XGTflvJ3nGIwhGDzW+/0Vs6SEI6rQdUKlxnaL3Bvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pXz7BSWZBdMOtEGyFa/mxHhT1h94fl5HKQ6bKEYhdI=;
 b=pLcoz6tSUgZVejfxIr3L4Qh6L5Jwz+mGO8tYbzmFiyHA4Cv/ayenl0/EKpC8rjVwxn+gDENDsml0fzv2Et8kn+kFmMfw+1JqSRj0Ifceckv62o+qDAkB7aD+q9LQkeW6fyMlt0z8LD+O5bZkJQS5Wf+Rig0ygZPyPgaLhk+7drTFTf2UH2GZw45AOZGXErpD7Grsy+fcsU7EYHkJ/hoYTTMyMr10NuXGl0aDZwQ1fOqXBbIokqq1a46oBA3C530axtnP7pNou6GPWna9yiRRUkRrdqNIZWLBj+snc287Jw0nxjEvIDhOezMabgigvmK9714Kh9Z9S+eWwcJCBdvFww==
Received: from PS1PR01CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::31) by KL1PR04MB6734.apcprd04.prod.outlook.com
 (2603:1096:820:d8::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Tue, 23 Jul
 2024 09:24:56 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:300:75:cafe::71) by PS1PR01CA0019.outlook.office365.com
 (2603:1096:300:75::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Tue, 23 Jul 2024 09:24:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 09:24:55
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v11 27/27] ARM: dts: aspeed: yosemite4: Adjust ioexp bus and remove mctp driver
Date: Tue, 23 Jul 2024 17:23:08 +0800
Message-Id: <20240723092310.3565410-28-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|KL1PR04MB6734:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8ab6db64-d7a6-43b1-2b90-08dcaaf950fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?VW7JqU6fwj4+BnNuV2821N8n9RyqahLNHCTH5gmvUrhBIs3VIOUL3kblbhXi?=
 =?us-ascii?Q?wN0mUZrdoxHejHruHJ505uFVYaigjHxT+IuvVVsfUP2DCRIOz3BzV5aP8Ye9?=
 =?us-ascii?Q?Yd+r/kNg/wsc614wyz8G/KPnEk4QxESPzh94c+7kK3xI6pcPOMFULI1xyyJY?=
 =?us-ascii?Q?wb5TI276ckd1o9kFiNQGrr30z1dQil5SbjwmMW+wyQdHg218rbMCufaHGe1u?=
 =?us-ascii?Q?oMRLiT2XYj6xMhjQINwNTw9nqoRMDQj2bJnBfjSAtPkm0cbCGkR8f9GpIuCR?=
 =?us-ascii?Q?sG4YkOA+AbQSZJJW0vQE3rwnczjM8DKzZ0EAEf+QXSDkT78Pzy8lHUKgeg5P?=
 =?us-ascii?Q?pA1v/n65ub5r5ta8p0TlKWX65CqYOkqVEqXEZXihKopdBYtzYY4rcJy1Hh47?=
 =?us-ascii?Q?u/Z/moL3GUNFQMZt5ZOIMpsQU9eY3ZR9gWWb22KUUyT0A0IghG8PfcHyksR2?=
 =?us-ascii?Q?/P8OToJIllCaKyKNmf9H28H5FOVI0myMtChmBwlUG4TKbCCLjL+934t8ZxmT?=
 =?us-ascii?Q?vUjFQGVpvLreydjahgzLrbKErKGb9nIK9m2MzLKp9IhM6aeBU2TOpPaxNDO8?=
 =?us-ascii?Q?+nJpAB57YdaWBT5k7xIRYiaY2sc7DxKzCmKEiKxjHoZgBj2t1OfOnPpBQiAf?=
 =?us-ascii?Q?07T4ijXsRRN59n8zi6BZ8EolBQnEhjiGQMX0ck2Jqy2hxkMYDpdKCkWdo7ko?=
 =?us-ascii?Q?P7H512ETO3NSKirW2xdpim2y67/CT8RzTOspG1flOHAPxWxV/c1MGYQUR2MX?=
 =?us-ascii?Q?pkXifNgINJg9/cs5FMbICfI4Xcy2gT1WwkMRmMgSvwnMTn4EJR0f8Jz/3FK2?=
 =?us-ascii?Q?KHkkUze4naY1pLCDkM8RaRpX79HmP5T7xobWpS7P2AF0UKf5PB2etBPrOZJi?=
 =?us-ascii?Q?CidxBfnpC/C/TPXtR2rDDGDQPA2emyRJEI7Uzq9gWlCdifr76SDhcnnV1BgQ?=
 =?us-ascii?Q?y4+S7Cf4YD9J1fPXjq1SXVnzPb5VB3hg11JGX6FweKnF8x0SL0erXBMywMzN?=
 =?us-ascii?Q?xQwEGTx6WIZxtlaLd+KK/lxsX3BVKQRR7Qvu4yx0YRYUIavHTxwSQS+aicw0?=
 =?us-ascii?Q?Uh7fdOPB/mCL7C+g+pzId+m6Wzd221QfD0xhxrisIvbI2EYpXrtB7jfPaeqX?=
 =?us-ascii?Q?UAEuFrEXa8RdRq/t3TBQc3bQrL5k/MJzsgo9IjMHcnqs0l+vsFr88xjr69Kv?=
 =?us-ascii?Q?Kqa4ez2n4c0RadeWao/tukGJlG4Bfcjj8D/0CA5o3t3pVZG0nRY0uJHlf/rv?=
 =?us-ascii?Q?VlEEY3Dq2kjmjaoQHJ810z7dcUsvgutAUM8yCLVKpmFA30bLzzww+H2JVbJo?=
 =?us-ascii?Q?ebWJQp0jUm1F3ZEswG9+/FDds0ugu0Bx/4+iluWd2QU5Hn4o71pdiyKj00aC?=
 =?us-ascii?Q?FW6TcUtuBKY/nwqvEzHkT89ufRTgwAgNMUYVNopK/W3GT4kXahi9ELnNpZcI?=
 =?us-ascii?Q?If0SVbYrAV2p95w4UI4pD4/H1FU3Yflh?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 09:24:55.9262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab6db64-d7a6-43b1-2b90-08dcaaf950fa
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB6734
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

Adjust CPLD io expender for PVT stage.
Add GPIO name for GPIOO7.
Only binding MCTP driver on the down-stream port of the mux.
Remove unnecessary driver binding since there's no MCTP device before the mux.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 59 +++++++++----------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index f139f426099e..abd4a9173de4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1156,6 +1156,34 @@ rtc@6f {
 				compatible = "nuvoton,nct3018y";
 				reg = <0x6f>;
 			};
+
+			gpio@20 {
+				compatible = "nxp,pca9506";
+				reg = <0x20>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@21 {
+				compatible = "nxp,pca9506";
+				reg = <0x21>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@22 {
+				compatible = "nxp,pca9506";
+				reg = <0x22>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@23 {
+				compatible = "nxp,pca9506";
+				reg = <0x23>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
 		};
 
 		imux35: i2c@1 {
@@ -1188,34 +1216,6 @@ ipmb@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 		i2c-protocol;
 	};
-
-	gpio@20 {
-		compatible = "nxp,pca9506";
-		reg = <0x20>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
-	gpio@21 {
-		compatible = "nxp,pca9506";
-		reg = <0x21>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
-	gpio@22 {
-		compatible = "nxp,pca9506";
-		reg = <0x22>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
-	gpio@23 {
-		compatible = "nxp,pca9506";
-		reg = <0x23>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
 };
 
 &i2c14 {
@@ -1470,7 +1470,6 @@ adc@35 {
 
 &i2c15 {
 	status = "okay";
-	mctp-controller;
 	multi-master;
 	bus-frequency = <400000>;
 	i2c-clk-high-min-percent = <40>;
@@ -1680,7 +1679,7 @@ &pinctrl_gpio3_unbiased &pinctrl_gpio4_unbiased
 			"FM_BMC_READY_R2","RST_SMB_NIC0_R_N","","",
 	/*O0-O7*/       "AC_ON_OFF_BTN_CPLD_SLOT8_N","RST_SMB_NIC1_R_N",
 			"RST_SMB_NIC2_R_N","RST_SMB_NIC3_R_N",
-			"","","","",
+			"","","","FM_BMC_SLED_CYCLE_R",
 	/*P0-P7*/       "ALT_SMB_BMC_CPLD1_N","BTN_BMC_R2_N",
 			"EN_P3V_BAT_SCALED_R","PWRGD_P5V_USB_BMC",
 			"FM_BMC_RTCRST_R","RST_USB_HUB_R_N",
-- 
2.25.1

