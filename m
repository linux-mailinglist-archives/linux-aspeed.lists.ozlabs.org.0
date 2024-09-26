Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B4B986B50
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 05:28:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDfFw1JPHz301n
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 13:28:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::604" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727321329;
	cv=pass; b=YKU0vu4KNjSRZMCuXW2HglB5cM2RJZoisd+bvDLAUIFJbXajZbRDcGa/cx8jc3z+QSeWU3V0a7IdlaE5ejXWk9i3jYXhFXFbkRhmk44rvjG9xMLMPpmu/8HzM8fSFFiwgJcrP4ktReFDk5T4Fz4LCCeKSGrnukkroEOWCLbvcDfDvxp8sx5O3QUSnYjJfD39IwrCTFW6ZJp5tg9DIC3L0uPmB3tNtF0Hk2z4iqXV+jS1mMyBdahw8vkcBrONTMiP+RybYSQqgp7p+hd80RptBzJxLY1s1VO4hCVka3rSLFjuy9Q2efYmbYqLcXIvukV5Wq86EC2zCdgGl2cQbJE2BQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727321329; c=relaxed/relaxed;
	bh=TMtSQcN9CV4Ragazm03k1sewAAIpWZxMagwsuuVYUX8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PgW5Kc76UwwJGk9U1CKhlBXTefXhXlLAsj64uKdPb3RH/BIxS7zBjexbWZeYBkCv+EWwOSPRiF2FehigvIj9JhzzWE3KZi7NUKMesQjfSLeKBLrXhMApAoYMf8dbfp2T9Klu9Aqu/7O9a3H1DojZWo3PFgBHvi41gXFvVznf+VVS1q5z8iVFE532dqAlUN4563MnrBXeimwx+rKOhkffgjmw3wxjqODJRFQmDG4TPlqLsKrkpUqm7k8BQwzrxo3Vu+U6cJXrNsHmtEapzif8umjbryALihp37r7iDtpTpisJDqW0n0KISVkBHkK2Vw8Wn8y/z1Ut11nn2fA65y4hng==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=AvKCshK6; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feae::604; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=AvKCshK6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::604; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20604.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDfFs3nc9z2xsG
	for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Sep 2024 13:28:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFihB5gO5CQ1Ji3jfzKCZf0B9LBfkETWdbuB95OuLOZrustZOFabp0si3KDzCHn1PzRd6KtVV4m/iAk+GShyr/Pafl+PI9Uqwbsr6snu+9zIGzxTH0kWg3m+MbGJvJzqAmLE5vCRNr9HjRC+jiNavWZbqKaHobvLDSLV84CELkCit1M8bk+pNWS0kynVCNKxgiLnP1MUlouhzTmiMR14u+l6/q3csYkSld1ZCdT8zznxuZ+ZhRGWCWQUVmPWMa4uUDq5A8qyzLwCOLJmSZJp8dXKoeKcdDb++pnYdvxeLfzY16maIOf6+c+WT2BLuPkaA1IreUAey4KcYP45itWmHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMtSQcN9CV4Ragazm03k1sewAAIpWZxMagwsuuVYUX8=;
 b=oY6yIVkZNRDlHMGxpIENJsj0eiPNsrB9ac/+4dmwLrP+1w4SmjsGw7iLJwEG5k+nwbFAyXM75//4ohJ9doU+z9X8m30Pt4M2l1SzkgHTy1TDX+d68G0R543hgy8sasVYLSnwUFKi3PNhx2YT4t661HhiGCznSlajf+8NUn57dpdBXSkAHqu33H4QWIIFJprJQDV5Ex8+IU5x68/2S2husO/cpMHRu6mPVVxJbkZr7SZUk4VqW95zbCODslJpYOFsfLy4rRK7SFD5z9s4fzE0DAzgAgzt2CU7jxVyxYovj4ZJqG/nwn3bqmRM87Kd8EK36T/MItEkx7X8/78SchVijQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMtSQcN9CV4Ragazm03k1sewAAIpWZxMagwsuuVYUX8=;
 b=AvKCshK6W58z2PYPCt+fKO39CJ+iYoF8O66CSYuhE6RrEXLka+8di3pg0rW+xNt96DJCZIgvm8QW2nEouHumL+wcf7o+4M62k+fWpWLmbacZ9ji29P6kNQS+LPrb1jzFN/tQAlvVSwhxrZiWOndw6rRsWMyWSJhLTRTFibH+V+P+R5dBwhyDDofxOcxV2eSR/OHtbPVYcb22GdEz4hU6UbmJd3HBWB4x/qg6kl+CtrgD2Q5oB75eMktMD4G8k4UHYgNEZGPLmoNiuhX1jv55lKJhLSNzWiOGVisllF/r/YDHfSqlzpmGDLGmsly3laQaGod9wIX0KU18oD0cpsw4hw==
Received: from SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) by
 TYZPR04MB5854.apcprd04.prod.outlook.com (2603:1096:400:1f2::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.25; Thu, 26 Sep 2024 03:28:26 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096::cafe:0:0:20) by SG2P153CA0012.outlook.office365.com
 (2603:1096::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.5 via Frontend
 Transport; Thu, 26 Sep 2024 03:28:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server id 15.20.8005.15 via Frontend Transport; Thu, 26 Sep 2024
 03:28:26 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v1 1/5] ARM: dts: aspeed: yosemite4: Add i2c-mux for two fan boards
Date: Thu, 26 Sep 2024 11:28:17 +0800
Message-Id: <20240926032821.4171466-2-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240926032821.4171466-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240926032821.4171466-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|TYZPR04MB5854:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7c4cd154-c1b3-49d2-809d-08dcdddb48b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?qvKIYPty472hp2kHoeoyaBIhFankMwqm2hkDj5ydZ0WzJYL0+UmCIYBB1Ypf?=
 =?us-ascii?Q?lsY9rohjR8F0h+iAxr/sbB10EmkS7Pr3Er99RP0486FYXhDbCRd75tkNj+PH?=
 =?us-ascii?Q?/Bu5yCUslUu8Ufn5x4x4F6ImDEtC5ov9fmxAk0a2SiB5ZEbpV36NcU8Okp+i?=
 =?us-ascii?Q?lnSL3hKMqo6TRIRaHfPS2LXpwZ63BV+9/WtOzTqPjcaVF2X/Su9x7LiES4O1?=
 =?us-ascii?Q?vZ6akIIBk0HqaGkMuXZ115f4NkCSewHUidpQXeTwCPdMEOiP95E9oy6KjxQL?=
 =?us-ascii?Q?h1+H0J5sxuVtwb2jl+hwzKJz9LoiiWfuRaVvJHekeQmC45AvcHUQsMex5COE?=
 =?us-ascii?Q?ePwoazVMVOj9NKwtC3pfVN3KPLG2fVSsKeV5zOgxT7EFMKToDl7Kuu7xiTKB?=
 =?us-ascii?Q?w+Vnj8CuVBeOcVDEopkepZTnz+9mCE4zat+tsErtzNZ4zz7U+ZXEFbsdA4dx?=
 =?us-ascii?Q?4wKzrqFLEqPbR+JdtuTwQrLOhzxmJs4+RhNXC9fc19OQ+u5nipuWDNhuqZkG?=
 =?us-ascii?Q?1IhQttyKRsQqI/Hi/JPXoz2L66ctw3GAtmOirlKehQ+ECNrUmDrgiuaJliNH?=
 =?us-ascii?Q?/nF7s68Kd5XW+NcEbsMuRapRmfAY2Cm7tTPH1oCW24gsSkL1ZbnlapnWMYeY?=
 =?us-ascii?Q?pUqrUBBw6j9j3No1hfAL1ZMIGvvZIVMWwkmLgVvY/FFHUiMVRVb7po+psMZM?=
 =?us-ascii?Q?YnQavbV7p/822+WQjXo/YbTkRqEBv7jt3k9Du8tojB/fqrGQqwlB54zgr18y?=
 =?us-ascii?Q?Ddam/t5bYE3WOQsyvvcjONvSdrC8CurLetO2eJ0Onf/WQkIr/7dGBlSVKnWs?=
 =?us-ascii?Q?8lir2FPw6qZUCWHIUlgV6x7EKEoYIQNW33GOYIEorsJp+wX0LrA7CVNCXPTd?=
 =?us-ascii?Q?R3O/I+ylytOE69kjD4AjYO6aKlQ4AtuD4WT2sEQdJ/UA3qW4/Tzmq/Wy8FKm?=
 =?us-ascii?Q?lTSYGiEr6M77DgNtRXNplP34l8ODA3h7JpyueAFpEN7VsyVBotVkay8CU6uC?=
 =?us-ascii?Q?qFoBIhvfkJB+iqj/oNsfH+CykbBscnN0x0D+OXcU7JbZZBhJQ5nVbVf08jQ4?=
 =?us-ascii?Q?HnoTlisJ7ASwVHCmfdBLK9Lpu2F/ElkT4jEwGMBPFHLMBeUK9FkVcO8YfiHz?=
 =?us-ascii?Q?0W62AC3t6kxpO2wGHzft82BS+BJOI7n4K+bLnLUC3nq1xiZj/YqnA89pJzRj?=
 =?us-ascii?Q?YvDXmATacVYCSU+nyIgY2txvhDw9N21K1u16SJkj+KRR02KsWwfYihOsFKtY?=
 =?us-ascii?Q?8s+e55pBlWFcl+8tofT5EucjhI/YIcxsAuau0LbAd8SsxMVvKFKxLu8hTYqy?=
 =?us-ascii?Q?97YAvx7FF3fTFDl0X6lJZpl4yvNczeXDYVnKFhES7OdXIyW/9qYnyMgeRiqf?=
 =?us-ascii?Q?muBqDtezmQBggExlDquVyLgfP6ue?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 03:28:26.0298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4cd154-c1b3-49d2-809d-08dcdddb48b7
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB5854
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

Change the address of the I2C mux for two fan boards to 0x74
according to schematic.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 81 ++++++++++---------
 1 file changed, 44 insertions(+), 37 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 98477792aa00..04f6378c2b5f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -17,6 +17,9 @@ aliases {
 		serial6 = &uart7;
 		serial7 = &uart8;
 		serial8 = &uart9;
+
+		i2c30 = &imux30;
+		i2c31 = &imux31;
 	};
 
 	chosen {
@@ -380,6 +383,8 @@ ipmb@10 {
 };
 
 &i2c14 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 	bus-frequency = <400000>;
 	adc@1d {
@@ -440,20 +445,50 @@ eeprom@51 {
 		reg = <0x51>;
 	};
 
-	i2c-mux@71 {
-		compatible = "nxp,pca9846";
+	i2c-mux@73 {
+		compatible = "nxp,pca9544";
 		#address-cells = <1>;
 		#size-cells = <0>;
 
 		idle-state = <0>;
 		i2c-mux-idle-disconnect;
-		reg = <0x71>;
+		reg = <0x73>;
 
 		i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
 
+			adc@35 {
+				compatible = "maxim,max11617";
+				reg = <0x35>;
+			};
+		};
+
+		i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			adc@35 {
+				compatible = "maxim,max11617";
+				reg = <0x35>;
+			};
+		};
+	};
+
+	i2c-mux@74 {
+		compatible = "nxp,pca9546";
+		reg = <0x74>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		imux30: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			adc@1f {
 				compatible = "ti,adc128d818";
 				reg = <0x1f>;
@@ -470,6 +505,8 @@ pwm@20{
 			gpio@22{
 				compatible = "ti,tca6424";
 				reg = <0x22>;
+				gpio-controller;
+				#gpio-cells = <2>;
 			};
 
 			pwm@23{
@@ -499,10 +536,10 @@ gpio@61 {
 			};
 		};
 
-		i2c@1 {
+		imux31: i2c@1 {
+			reg = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0>;
 
 			adc@1f {
 				compatible = "ti,adc128d818";
@@ -520,6 +557,8 @@ pwm@20{
 			gpio@22{
 				compatible = "ti,tca6424";
 				reg = <0x22>;
+				gpio-controller;
+				#gpio-cells = <2>;
 			};
 
 			pwm@23{
@@ -549,38 +588,6 @@ gpio@61 {
 			};
 		};
 	};
-
-	i2c-mux@73 {
-		compatible = "nxp,pca9544";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		idle-state = <0>;
-		i2c-mux-idle-disconnect;
-		reg = <0x73>;
-
-		i2c@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
-
-			adc@35 {
-				compatible = "maxim,max11617";
-				reg = <0x35>;
-			};
-		};
-
-		i2c@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
-
-			adc@35 {
-				compatible = "maxim,max11617";
-				reg = <0x35>;
-			};
-		};
-	};
 };
 
 &i2c15 {
-- 
2.25.1

