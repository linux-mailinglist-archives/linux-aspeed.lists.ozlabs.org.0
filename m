Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 760D1959739
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 11:42:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WphFH3N8bz2yVV
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 19:42:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::616" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Dj8bCYMi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::616; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WphFF4W1nz2yDt
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2024 19:42:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RD4mWsU1hV3PXd9aNU8Agw1Wnwk6uq+RoeYDuJ9MZ/QO+0XualZjfw3Qilbuu4fGZtS5Czb+SSuNxtvwXp85xBt3/qskmruT1QaIbRd2tpQ3rEnjT27vYeIIXIcRBMl1xlr8PU3o6wHRz4DA8O6GCXoXELWf5CORmf3Fpm3q4hE3uNiEABfFjzxOPy+0voA1/tCTvepidujPL6rdcW/Th2IIKsg6iJKCDXg1ZaBqoKQTuRH6mgQ9MEtaRc5kAKQVOoUpMb4GWrBdya/hIxPla3RS68mj+gzfg5L+tSz1ro2xX584uWVhDfEN5eDWgMlukiViZeL/pi4J1YAGnIlzvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0cbZAgnLmtnZUJUsofCz9gNyd7yXSZFoo6OAwbZAno=;
 b=mzTfiFqHfvIMyrLpvLu8vHxUMh/X8I0DBhPDV8W5SpKzkZbLk/pLgKJ/+W+sdl+OeivB08tqOJbD0uaG5/znxCiGcMwhVdCC1Fbq4YMLn+3UB6KiwsiCTY2IQxW6jRL/uvu+8BDknDHBiu+fNxF+RvcA5ZTOWd5VGuu0kAhF0gTSylNS91ayKTRGmk0p4zhljhdYJVVTKzZl/yjX2EVp5RvIYDoL6TeloQJ7WO685/w+P3uhEyq9KqvJqEv2GXfknUwtUgnkSP0VZ4aOEbaK8kgQZGQDdNL02odzDR6/fodV8EJgdh5gflsUjCK9MiEmu6I9uGM7bgHJx5lJ6abGaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0cbZAgnLmtnZUJUsofCz9gNyd7yXSZFoo6OAwbZAno=;
 b=Dj8bCYMipW3SUgDmoSw6AZZc/k2bs9Xt6Z5ZnJFB6fSvjr2e4Y+UGYpnkLEqgcSNN31vRhkLyJ2bjgdmvuXGAmLncMlayK488aV/NlkCKNYmJE+EygBrBqb1uy/mtXoxz/b+vWiES7ycwNOUwqzitpu6G4lqJ7r/WVAHn1DYKWnq/ANYQavuZkO2NWGY595ol0qInT7W+6nzvPBe0MZsdYDigYNg8nlANxYlehUnIVM9SUhVtoVHEjQQwRaPM5jJrUZDnKlSPvTn9WsLfz6jUBif3lPGuBmPaIqktcX/3gAVXujERc27k9xZFJ64/0B37IKWp/1aQS+9N9lA2wBJwA==
Received: from SI2PR02CA0022.apcprd02.prod.outlook.com (2603:1096:4:195::23)
 by JH0PR04MB8154.apcprd04.prod.outlook.com (2603:1096:990:a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Wed, 21 Aug
 2024 09:41:49 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:195:cafe::52) by SI2PR02CA0022.outlook.office365.com
 (2603:1096:4:195::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18 via Frontend
 Transport; Wed, 21 Aug 2024 09:41:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024
 09:41:48 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v13 06/29] ARM: dts: aspeed: yosemite4: Revise power sensor adm1281 for schematic change
Date: Wed, 21 Aug 2024 17:40:17 +0800
Message-Id: <20240821094043.4126132-7-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|JH0PR04MB8154:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a0e39e59-1367-4816-f255-08dcc1c57aee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?JX2MVuGY9T+r8gpWU6s9jkUft9s9ToePWknFSo+6uK9JIylGdWLbvS2hHYsY?=
 =?us-ascii?Q?Y0BJwfpn+O4bNHu46iRiyarlg0eIwNQ6lRpfeKTkUh4jktoBsvz5kTWxLPEF?=
 =?us-ascii?Q?GZYcm/8Btjlb4jRPDVtXJz5DJTGazEdi3geYAHEkYLOzPl2EfDpPcJEjIOj8?=
 =?us-ascii?Q?dYuieNC4HqV9i6cus5sXH+HeAxJ1KrvvI3P3Wj9EiCVKRWKZTNCjgjH8Ttk6?=
 =?us-ascii?Q?2ovJ9v2XBR0rlGZczIjbpofX/b2kTaxBfVK4aaMaooIzPcv/h4zl/WXa23Fw?=
 =?us-ascii?Q?kqHxJAcr0voIJa6J4Q7qWZBjggcyDfltsG/o/yjcEJIbQol8vR5kPMX6AOow?=
 =?us-ascii?Q?zTpkek3avq9GMZ/h3FOiQgANHvQ+OsnhpIylZu1mUI47e9GRDq6JQezqVeBg?=
 =?us-ascii?Q?RIY5LRN5uv81fdDNEM6clOPnfDD4r8vXz/WgBT9Q+BHoeDUf7ABIeonug0s2?=
 =?us-ascii?Q?PTMQcZbXMMx47HQkjng1JhxxUjIuAlx31c5823zmXZeS+fVSEUhzM9bHmkyu?=
 =?us-ascii?Q?YmfJ0RkU9SyJZFa9bEjWX+6XROpVyyTCeDG+OSfm0dZDQ6fS4iSmQLiQnOyX?=
 =?us-ascii?Q?5BB/RA2ZSV19G0pTEnBX8PdzSLKCJf1EUY7+y6Ht9m7az49XvZSnBYtrwP/A?=
 =?us-ascii?Q?H2XY0cQfTOOTx0zTWTL1Al4F7MmH+CZA82sgEhOzYmKROL911NCKZcljGZXd?=
 =?us-ascii?Q?mWJmQJnqyrVxM3cM1x1dTYJ0eAzabgYlfokmBJYkPwAjiSUbQLj4UfhpGDsi?=
 =?us-ascii?Q?ABDeFUX7EqM+OV5IVbIGzDZ6cWT3Q0yKe6Y8IeyyWf8KDkp418VXh8ddLCuD?=
 =?us-ascii?Q?TsmT8iyP/vQbpil1anlIZBbBGW2Wnj71DoxQRm42wxiHwKcRZmNOscHHhtl+?=
 =?us-ascii?Q?3oky+fYQBFTbonjDnN+FJHoY6hPN4I7q4OUrYGd1Q6+2wu5an5OdFPaifOEW?=
 =?us-ascii?Q?6qOJhnhfoqlzfiPQ4jX4rWTyEPsrn68VjAhy97a9TKXk8/+oBSGoOL23NHmx?=
 =?us-ascii?Q?6+M5wl+bdqq47yCuAelYvivV4wP4qeE+rWV3HxC1mcF7/gwZ3whNuymLiTcl?=
 =?us-ascii?Q?4/+M8PlosBKYC+N5KyaYwuV23xhqMo9QwqGzlMRWmUrVJ2FQg6JyymQa715M?=
 =?us-ascii?Q?sw0hjI6Fl11dV9luj3L+efmeun63EEPPDBWcpj3ZQfhStpfq1BIWI+XjITtr?=
 =?us-ascii?Q?pT65C+R1dD/zidFFD8AVy2djOFj0bvmIM6/2DlAXvyCJrOVtfnf0XNWDaC7u?=
 =?us-ascii?Q?j4kIWtd8iUyANct662VNHvliAdwswiwehbiMZ7Z0kAKMrb1Nj5mAI9zOzaaM?=
 =?us-ascii?Q?i3un7JE5039SOV+LwpWv4oIsEqn9bnW7xjAenbYWjM0NQ61wTC7HxUiNBkJ5?=
 =?us-ascii?Q?0dcOIAQNmWjMaSqwrmMMCTzZG9BSpXJf6P7EuTqx/nT5Z/r709IYVdj2P7Pz?=
 =?us-ascii?Q?O8Q6YUApAVfiHRQ7kTfuO+VJUAFiirjc?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:41:48.8247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e39e59-1367-4816-f255-08dcc1c57aee
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB8154
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

Revise power sensor adm1281 for yosemite4 schematic change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index e5354efbb903..7b79fcd77c8c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -176,8 +176,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -193,8 +194,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -210,8 +212,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -227,8 +230,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -244,8 +248,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -261,8 +266,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -278,8 +284,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -295,8 +302,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
-- 
2.25.1

