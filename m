Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0A598EAA0
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Oct 2024 09:43:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=r8G0jk6K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XK3ZW4pX8z304B
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Oct 2024 17:43:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::605" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727941410;
	cv=pass; b=aoqsxWZzrBqgX099jZ4p6uC9378+BQc0dXDkXvPEKPv/U6jKtYD+VcnyqxfO5MX5cZKZksFMSGm27y3h7rUxfPelZdfzc79S5hnMcsgMMsEAraEe2tPZCTosqS3Ois7jsxiIJMkpFnpWob0yLri43O4EFlIQuc0vsK+d1fwGJ1qC3Mbnh1bgUlld1/zK6Z+h+58fjr53fmMNGnKy011OqGsZ6Tb8e1/2xEZeZX1hqm3DW9VUHNbnLrmw86aCUFs/R7PuuBIdY2l9IJYGvhj+s1levu/9D68nZ0MEO79PgtwDvevGq4gcKXaBy66VVSXEzV1ad7wogi01A0xpXgDCOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727941410; c=relaxed/relaxed;
	bh=2Yy4fR8HWBBwDtve5r7q1np0aURr2s4HCWBOXwCOpEg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nP5gzWn69z+tlYNWFqNHXcVjm4kcfmNpi2GbkY7nctDyUYLdyO1e/qQcCDFuwcLdXO7DVYIMM/6MA9NmVw+1WBuJs50ky1uYXipWbw3SyMRYg+hQHuXlmeXDxbrNkQjndJF+kzf4i7Pw8ChYLC77C5ck901Vb0FveCrZzaJQplDQqMqWIDWEgI2y6f7c1rHdXijOiC5BcWTsTRRuawzv1Kqvu4kLOhVR8+UJkbgejVuOzD2UY8y8ZH2UiKMEIUlEXeV36Dpq/LuHZi/sXCkOCGdTwo76MrHKMa2oK0rWphz1PZm9yfE6rmXyMcMVvXBXZAFkaXfYdLWRTAJimOeNqg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=r8G0jk6K; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feab::605; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=r8G0jk6K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::605; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20605.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XK3ZT2CnBz2xxr
	for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Oct 2024 17:43:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1ndEB3O4KOS9W1k0VHNORUknXr6JXYjvJyF0Ttob0TAY9OK0O5+Umd1TleyS6cDawWoxo/fD7MX+8fhJEhbFROnBwWSjmEcPSQl3gZDJTisZ2ZGsW/4uMlv7gumOX0ejofpgIJAna9+lVOsND6OJgocjeNjgXEQALIqMab+MhMgDFoHTbHtWi9kDFQM9B5cB0oviFHQN6fZmRQeXKNLLp0jU9j3NvV58ToXKowYUTNUkmwLNlpAGbmmvxNYAqqoxEcx94wxNgiFZ4T3EGcoH/3gCkQPwR3XAwSmk4FWcQPtPvWl64j5DrH2vrg/LyEKPSxgthWj25Jm5QDtWGYQyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Yy4fR8HWBBwDtve5r7q1np0aURr2s4HCWBOXwCOpEg=;
 b=MTRFdgepLqyChYguIDg9j+hwGKe65iEd5IY5whZlJ0XlUaxRk2f9ARfLcpyNYZZ8c7ychu7uahGQHeb87TZQjq4sEZkv8cq7gPBwnEr8xHOvlfY1GAjPQidMznaz+0kRnjVFXMVGlKF2ifCWJzP2RIgfJN0zMbbt4O7Q+y8ItlyVtq3RPYw+F5Dk0N2+iOX/oyZYTAmPArf98crzo0K68uT7CcfLB36FpLDM/5/cZZI9yojZnIiITtoVC1DaaM/UuO5g9bSYrVFja41WD5C+y0A5AVAnFTvkQ5rFpQAdlGAUofzrmuBuYDMh07JtyT0nBzmGBmSQTGE7hNCN2bcnQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Yy4fR8HWBBwDtve5r7q1np0aURr2s4HCWBOXwCOpEg=;
 b=r8G0jk6Ksu1DT8s4GQbOu9Xk8ckwDzceEil4IA5Yhzh97LxA2PLJw7/lgdfPUnC3NecQtObBZa5vZGeoGSMIKOBHStoAI2QJv5wbWoosZV84222/Va+J7AZYdCs55VZuj5oe9tBrMrvmLUtORoB3dyAwELyzBJyY9CQxK0cMX/9SotILoAqdHn4KtwsG7kN/azQUBcLX41qPF4//wZK1qGs/VHx6WXrEG+HcAnXQNkGYiZ/sUrApqG597ZNu6EZRoATe9TVjipFrobDujJgVEOTHlZdzQ6veHW7WoW6GDHUY772Grd6I9XjwACgFOtKLuNZUzaZy66w5VtbJgZrYEg==
Received: from SI2PR02CA0010.apcprd02.prod.outlook.com (2603:1096:4:194::15)
 by KL1PR0401MB6588.apcprd04.prod.outlook.com (2603:1096:820:b6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 07:43:09 +0000
Received: from SG1PEPF000082E5.apcprd02.prod.outlook.com
 (2603:1096:4:194:cafe::f8) by SI2PR02CA0010.outlook.office365.com
 (2603:1096:4:194::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Thu, 3 Oct 2024 07:43:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E5.mail.protection.outlook.com (10.167.240.8) with Microsoft
 SMTP Server id 15.20.7918.13 via Frontend Transport; Thu, 3 Oct 2024 07:43:08
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v3 6/9] ARM: dts: aspeed: yosemite4: Revise address of i2c-mux for two fan boards
Date: Thu,  3 Oct 2024 15:42:47 +0800
Message-Id: <20241003074251.3818101-7-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241003074251.3818101-1-Delphine_CC_Chiu@wiwynn.com>
References: <20241003074251.3818101-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E5:EE_|KL1PR0401MB6588:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d6b2ae95-9541-4641-34f2-08dce37f06e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?xHoYI6lK+9+gCH2n5g2q5Tub7oRuwJGxbRzlFZJHQ+AWfJ/n1+MxfgKQWz4o?=
 =?us-ascii?Q?OHKg74mKDXwoJJFqUQqSaT98vYd2hvYpvngC00gw5UyzqDHpkAx0uz43U0N4?=
 =?us-ascii?Q?xCznWVfF2UsKEDdk1Pot+UPKSLH+eyFCQRWChgyLEndqHsJnh6rRRfktXaX8?=
 =?us-ascii?Q?YE1qvc4CWx+fHlD55chtmLUt94VPtIg5tipU4L0Ih6AazvafETozR2RJFjUH?=
 =?us-ascii?Q?aGon7DjlR0U2UWvUrNHDDkzGBJ4rUWRkXch9zNGNvjro11GVca5knNmRtq8h?=
 =?us-ascii?Q?8QEmk47BqLKV7lGHC+qvaiB6cZpt+Lj/k/kxYiPFO5QrQD01J/n6ttOyEm+V?=
 =?us-ascii?Q?EbA0QUpIPKTpi8h3TmW8wpwN/xAsgtSmFV8le/jLcZTTLoocQ9ZsZZnWOcw4?=
 =?us-ascii?Q?mJIIBdSgJjfbHWrPM9EBZeLMsa/b0leF0O8qaumblW/YLrT4PZcTgYCKsENv?=
 =?us-ascii?Q?vDKnEFfGfVjwY//sLZcrnx2jCtNGhy44vryzE5DrUoluW5hvOiql4KZTjvUA?=
 =?us-ascii?Q?+VdYjQb5UDPHUDmd6I5Ows9ywSlFPvR3L61bgv8wHXkkiR3GC4ucJdinGgjy?=
 =?us-ascii?Q?Xs/zO49M1g4IQ8GBGYTDw+J9OrHM85Gb2qFpPYfIs7K++xgB+EPmQ/TfaoaW?=
 =?us-ascii?Q?uEDsKYdtGxQaET+gV0fAjuFBDvZXTPkIBH+T1sC4IUaA1EkrLTvercQI0gPU?=
 =?us-ascii?Q?aMdmfG4oMV+EQxgehl0XLEArv0WY1Y3CRlI/XPQdMTYqmhcrI4xlQjJdp7hN?=
 =?us-ascii?Q?QA3R2OFqACPQAzko6+Wnv+MC6F0k5bHdZdMR0//Wjc3uwJnrUT1ur/+Vt+JQ?=
 =?us-ascii?Q?TtAB4b0S75itRfssPEcRE80sKphlpHBbmuGsh6HNdo9PWpRAE3O3WWE5bxMW?=
 =?us-ascii?Q?/ruKKsxUyK6iZ9fXXVP1Rm7Jq6sv4iosPO+2Ry0Qb+437IJuE63vzgQNR/S8?=
 =?us-ascii?Q?zQY+yv4ecKj0OWCAnugjugJq2Vi/pnDzDH+aY2T9rWcRS/47Hw9h3IvMCT/P?=
 =?us-ascii?Q?PFVUSDrOxGeJAxtfiUsre1MvBGAOP9HoHzKoXPkmDoaA1QqHHKPPbPE4kPM9?=
 =?us-ascii?Q?/2UW/Ijugfp1ZvQR7L4oaynV/7uC0oWeb8khGcxvyuJ1adPS2TOxa63Y/UK+?=
 =?us-ascii?Q?DIkNnzQzSh7vZRtiyu+kgdpKBbulwJUTIUYkSZj0xZosANSyD0LQxoiAo/hM?=
 =?us-ascii?Q?0ryCMlifbx6CjzqztJXS+8UbAdma8yfSShOo5JHhCbKyp8862ZRcoMvE4Ecr?=
 =?us-ascii?Q?qTHwwKB6CPuZrlW3Hf5ntHRB7bVpUUUNQC17Or3NYyl3V55XBCbFNTLipwib?=
 =?us-ascii?Q?yFbaKfk79fuodIW3N9C37SKY0JSKhpI0+okW+T/Rt/FFKNrNR9WCp4+q+H/z?=
 =?us-ascii?Q?HQl5kPA+r3SbvhJLYBaah3h50OCy?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 07:43:08.8057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b2ae95-9541-4641-34f2-08dce37f06e6
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB6588
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 76 ++++++++++---------
 1 file changed, 39 insertions(+), 37 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 9a9096c94328..7531ac217c81 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -32,6 +32,8 @@ aliases {
 		i2c27 = &imux27;
 		i2c28 = &imux28;
 		i2c29 = &imux29;
+		i2c30 = &imux30;
+		i2c31 = &imux31;
 		i2c34 = &imux34;
 		i2c35 = &imux35;
 	};
@@ -1034,6 +1036,8 @@ ipmb@10 {
 };
 
 &i2c14 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 	bus-frequency = <400000>;
 	adc@1d {
@@ -1094,20 +1098,50 @@ eeprom@51 {
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
@@ -1151,10 +1185,10 @@ gpio@61 {
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
@@ -1199,38 +1233,6 @@ gpio@61 {
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

