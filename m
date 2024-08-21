Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E4A959752
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 11:43:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WphHC1vdxz2yMt
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 19:43:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::628" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=OCUo4KAP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::628; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WphH90kpYz2xjh
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2024 19:43:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+pu4FtuLq/vB5YpzWo81diJa9gfTmxE70CvM1CBo0lVedYs8JzkY9gSQXiJT73ZWPP16gJ+PBBvgBCUCcWyN+oM56kZ8qpzepntfYR8AlOcsPjJXpzmmeSZvZM84NxheoiuT2SKM3ipBdj41X/55Lqp4ms+9ZAbu9E2zvc8VgaiusqCcKV125Pua+L1bxMKJfZJ3dcE9a/9xjVL3ckstqTYW3DXXVk1hRanRqc0jSLQ8Ha/NFu1pBIQF5RVX131dJeDdqi0lMAob0e+1zIAhbGzi+tmPpzaZOGB+KBZana7bPW/LjBnVN+dZ61Elp0LW7biF68o6ups/3/6NqdvSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pXz7BSWZBdMOtEGyFa/mxHhT1h94fl5HKQ6bKEYhdI=;
 b=B366/1Zw+iW0Uvtx2YPwXCVLcF0sD4/3yycXqWZGjLkOcnfUM8EtX8EGr+HrSnvGGA/U0E77OLqrUqz2sCzUnzexdlWeYZI62w/nbR0PdnjB9wQydwfqhBN7nM2Q1O+v3Iz2dJWk+SjoxzyQM1txvhq9I0IbdO67WGlSV7IY9krxb/fUk7ryhbooURflHFaaDwvqzg9xppAbasSVl3VXyGW4eF6MTHS3hndC1Ek3VMBLMW6NYbLIgNVOGlHnMqiUADYEnB0PsjNAohM7yY7+NZoG/dt+hSkFF85T2//mnQWY/mHWMYfAK4URMJ5svjEfGvFDuJNhQuJDaaCxjf8ZDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pXz7BSWZBdMOtEGyFa/mxHhT1h94fl5HKQ6bKEYhdI=;
 b=OCUo4KAPpIqgAWioyd5KuoG9LAsKYC0/bdVyv44UlNVS1VzCJD/q65nbG88pZPPY5DFHxyFVfzKqJDPlLdDqQnBdqDmJObsTFIJvb1Hh3xJ+NSZsKnFQFHsSlsoRFoDajfIdF9LN9VH3aT0s3II9Ukgc4dBZBJ6Rp2MgkzqpuUx3EsnccUL+PHNN2UYohg/seMwja19MFjagnefC2PUcIBT26z8+KhRZZ4WAXIGwqTiwPgpEWnrg0avgNGsCK57g9qEFgeCUqffL86xDuWn41d/dDE3Qc7fTmI9zhHnWQk77vAp4E1Qp7kzxHbpuKQiHXMPOJEWhPJX9uKkCZVVdcQ==
Received: from SI2PR02CA0029.apcprd02.prod.outlook.com (2603:1096:4:195::6) by
 SEYPR04MB7089.apcprd04.prod.outlook.com (2603:1096:101:16c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.17; Wed, 21 Aug 2024 09:43:27 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:195:cafe::cc) by SI2PR02CA0029.outlook.office365.com
 (2603:1096:4:195::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18 via Frontend
 Transport; Wed, 21 Aug 2024 09:43:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024
 09:43:26 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v13 27/29] ARM: dts: aspeed: yosemite4: Adjust ioexp bus and remove mctp driver
Date: Wed, 21 Aug 2024 17:40:38 +0800
Message-Id: <20240821094043.4126132-28-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|SEYPR04MB7089:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bb2d0928-1e0a-41b7-7ff7-08dcc1c5b500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?9+jK8xxcHYe4y23eS5mrG0Dqj3J4aOatt8ljwQnrXzGhEkOp2SX1MPpQdKha?=
 =?us-ascii?Q?DFnwPM/QpLu1dI3OlYq8f5upz4DlmkRo3CysBCsCyppxt8JB4hd4lOY1R6Wi?=
 =?us-ascii?Q?fX4vWoRW5FEwKZ0wbgognBl9fb+1ERZXzBXnmzcCU1cGYsA7FqmmDtaAhIg5?=
 =?us-ascii?Q?0Qx8MLbpAvk2Kog9MoZ/vNo1f3+4tPPXIi8o0S+JVscomz+Azwv97Ug6gvzR?=
 =?us-ascii?Q?oh+RrmLhcowED9n4gBvLx15QdabKNuZ4er+u+GsCq/QtwAcXn1Hy7IlsI4vJ?=
 =?us-ascii?Q?xx2uo1Z7MyTPW7m/z5UOHF90z+SrxbHZIW8dxGT3BrD2rg875h/aH9GGKsGm?=
 =?us-ascii?Q?zroNEQdawJfYSDWFzMSTWrt5yECQnZKQNkS+oRR2xj93nL9xTgbpOgD5mZdR?=
 =?us-ascii?Q?IR0rI4ywa3EBh9MSwPelkM4MC90GX1YK7M/s4tKQ8elcwy1nzefs+POm91K6?=
 =?us-ascii?Q?d7GHaYzAXpicR9IFyD3rJRQNnGji9eVl7J4EHQsfGQke/55avGiRREP0dKiK?=
 =?us-ascii?Q?j/0U3xatGAqmlyeX+HdYWq+jjxdkAxT/1OvwcHG6LxS0KPoIIIrbedWSDPo8?=
 =?us-ascii?Q?Bepr9x9dgR2K9+PlyiGG+rGgS+6nQjfggeEK1lI48dJEiEu7MBcT6Ztx6+Ji?=
 =?us-ascii?Q?16cLO1kk1/aEvYQMOZMlIvQExoceIItRaXFUDyhxcGzN+u9laNfcBuvV7B+u?=
 =?us-ascii?Q?puQh7X7vFEhGLFDlSYxSulI4e6rauC1rzvKZVHEwITyEksnyRmKLl0UEuYPM?=
 =?us-ascii?Q?uvsOlgXtqoj4LS5JfhXSowx7RnpvfdfkPATyUJlmmjYMoNra4g6TzBZuSLY/?=
 =?us-ascii?Q?83eIBu6uol02i35E7Vv7V6TJaFfTdnKESZyBck6+6gAkArH6SEni5MHEtnqf?=
 =?us-ascii?Q?Bbyo4oqOgQ//Se8fLnZi0Itk4gziZHHI5DJ3BzXqoXeNO5q6ZMu6JSQoFa7c?=
 =?us-ascii?Q?9H+sphPkG7BPd6dq+q4O+dZro2N0LLdVvFGY0DaxI0U/2LDoYbrmXB2pPyyy?=
 =?us-ascii?Q?otonDoegPxPcW2h1rQiOmxiMfV4DScyfjHhI92qWYNmhgt99mWY/oT2dhCcg?=
 =?us-ascii?Q?zOb4Axqwcr70aTcgkjKvMQeau+g2QH25f7IeXs+pEai2m1rLaGCqTwwBAny/?=
 =?us-ascii?Q?j6Y6dRT92pL2O+MXIllnjDsCFlTWj3XzCrCiS4t9+gZptkofzEFqDQHi1K6k?=
 =?us-ascii?Q?vNDKlpDwSYMZdJiDALw/nSd8QMIlWHGBxtjjieEhmH/IRkRCeyLBV3MTkuzG?=
 =?us-ascii?Q?FVldcnaq1C1DhImuCCuCQZCRRys6Q3t6hNhJoCSZGWqjZUuCTlpNk89PgPTh?=
 =?us-ascii?Q?xYkbfCaleUNY8Dlqa8+rWI5NdHyyNFy2FGEEJ8b2y38Ci/DavBejKcpqIkhu?=
 =?us-ascii?Q?6BH5CIU6HCJXncD3HCJL1SWq4G/pCx0qd2H6KAyLKtoXEqzwb/DBrtJXyfOE?=
 =?us-ascii?Q?lS+q5nB+/yTiakGzpA5u7jwX1QLYjOy9?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:43:26.2319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2d0928-1e0a-41b7-7ff7-08dcc1c5b500
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7089
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

