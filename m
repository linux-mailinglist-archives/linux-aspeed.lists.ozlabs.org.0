Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A13954576
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 11:25:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="::1" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=jw+qvMg6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlc664CZQz305m
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 19:25:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::61e" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=jw+qvMg6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::61e; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wlc644R4fz2yft
	for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2024 19:25:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C03odKV0gKkqn+KJ4Z/pcctzNcln49n5l3++mPL6++ZeJq9rcE9kTeOfO4g8OYj7DDsKmbQSQXQgaBpG5NZCe8JvE5xISK4V5gKZp/9BKIxFeKhn1DdWVom+5MThzkGpG6mw+Y0X/nqcIHIovha9mV7m/MMVzWkPKt0WTMWlVsdnPq8MTl1cFh8rxCFZ2L+cY0Yf3hb0DGSVC8Iuv6Q6TN58Mspubzudzk9m6iXw0lzey8Ekzir01/yzDAExoa9pGAIeS2H0lZ8JImz3vcPHL5u7caX7i1aI4MOJ5UrRkn39oqjTZX15S0HkxvvR5RI6di0LBdOKt/A4xRqygghemg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0cbZAgnLmtnZUJUsofCz9gNyd7yXSZFoo6OAwbZAno=;
 b=hnBhwQl4WvtzslOLLHSDDftrw9GZba3huYwNuZ2q25dyux1zPOftBBJYs1eHkcFpYuE+NRob6wOor3voIzNjK8Uiqd8iFoilxxJWMMRz6s1MoeP1xVvZXIVkctMG239h0zFEvYcs0Jki9S9+6UPpU3oW0HponeM3wyks0/k78lWwblhDZfosh+b3ODNRnH08uHTH1dyRatQ+Jn5JD1fx/WpPW5cNZqIVCoiIDEWhTtN+4kPJqUdQTsiiX3I8ss50lJUoKRZbMhrkqjfx+6/Ew7MJGIEq7MIxsqXPZJfmYL80aC29yV6taG7PnjcJ1u1SJs8Srkvk5x/ACF8CbySvmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0cbZAgnLmtnZUJUsofCz9gNyd7yXSZFoo6OAwbZAno=;
 b=jw+qvMg6EDZVXNT5+drQg9QwpTW1s//OxtyTeFQKqUj848OkGTyl1ad5RamF3FbGaSBsCuL1bukayz943R7q+zYl4mOH3kKqcbsCAt2Ze6PiZjx8Thq694myZ0jnddeEWdkYWgBiXz0zVp1Fmw8mztL43XxYtg1yjXqnBVo/A/zoFep22oxRfDP8+dZ2kFP3EoMdzUOz6xv2/jm/MhyjpRRlzmCQY1PgG0zifm67CbeIF7akfdesqiflcaBfRJuQ7mKnkfdrwRzZgbeg6Wm/JeMUDrrR1uBkfsZXfK8zYz42sJJJCovGDcR0JqsMNuwjnZbsIYgVGqxzWe54yCacvA==
Received: from SI2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::10) by SEYPR04MB7632.apcprd04.prod.outlook.com
 (2603:1096:101:1dd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 09:24:56 +0000
Received: from HK3PEPF0000021D.apcprd03.prod.outlook.com
 (2603:1096:4:193:cafe::a0) by SI2PR01CA0047.outlook.office365.com
 (2603:1096:4:193::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19 via Frontend
 Transport; Fri, 16 Aug 2024 09:24:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021D.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server id 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 09:24:54
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v12 06/28] ARM: dts: aspeed: yosemite4: Revise power sensor adm1281 for schematic change
Date: Fri, 16 Aug 2024 17:23:53 +0800
Message-Id: <20240816092417.3651434-7-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021D:EE_|SEYPR04MB7632:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9ff2c31b-144d-4790-f332-08dcbdd54a5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?rQnjpkw2gvyz+BaLChmQ8gXX7tXz5mYT+i6Ya5rg+mJsSBex8BfYQMY+JpTr?=
 =?us-ascii?Q?VWdyoxW3D4X3VXLEI/6jnWXmqUC/hZut3HXVm98YGoHIDCkfrwR12mBV8y/3?=
 =?us-ascii?Q?D6OXXI8okXRe0ppyKu3gLtEd8kiyaeAuusZZDufQhtCeQ3qA/cNqZ19+oh9u?=
 =?us-ascii?Q?dPcHdeKBtsyM//IuPVcdgpH2uoZPa9XGuDoalN+VfqNakmOB5UEJ5hLh9utc?=
 =?us-ascii?Q?YTXKmVuIszDjwG5+fubyO+IwuSkG0LQ/62bgDQBTKNqLX3l30K4J35UOyNv3?=
 =?us-ascii?Q?y9YssEFB27HV3gtPF+qjJZoPUd4LsF/l5bZI4FOBD92SNQs9lv6Ka1QNJVPJ?=
 =?us-ascii?Q?oy9klxFWx90PTJtUdSJWNsSzbPU9OJtDUAGFto6mgKJ+X/yKR4FdzXSmMkxv?=
 =?us-ascii?Q?Q3U682p1MbnprOvOCfAi2iF0OCEXK40RmuaTtEgfHpBs1y8m7fnueoTRe50x?=
 =?us-ascii?Q?Hg6Y8TfJIcjnCkFkceomzN4V5oVQIQnQAVxS11rcKRxMSZxvGT6smJ44LQ/Q?=
 =?us-ascii?Q?DzWW0k/KVcYEKkwiEocxmLQp8uTckSldgR48HLNZ/QDzkjzrN8jzxU3HV0bF?=
 =?us-ascii?Q?2RxYRb/WNKYZCa5HGH5Gkdsot5tiPpoEAtFVLfIBblx1AOhg7PJoKlOH+Z2o?=
 =?us-ascii?Q?Vl562uudBnntdRwCq5cvIPNXGCaiPu4yJDr1A45rfRNDc5UZRUKGOJl1g+IE?=
 =?us-ascii?Q?1vbJozSi+Elll9Zk5p95q7aRPiQBR1hGjqbBYH+FclMM1/4G/THKCxM/Jud6?=
 =?us-ascii?Q?Z5JB88Y/47AbRFhtAWDMWBm2jjcKn1fVYx4IWBTsb8cOoi35dddVxXDg8hfN?=
 =?us-ascii?Q?g1BRi7LmkMrT6bBi5R5YBeC/vjx+sN6CXFY9qBXSZm+BPemiKgapx0+9koKT?=
 =?us-ascii?Q?ake4I8JmYAApnAh8DSOsFS6tIlLP4S4Q6cNBuwpnN9L9aoucc6FJrMy4QMb2?=
 =?us-ascii?Q?F8AhUGGi349G1TC1WP/etXAGveyrUO3jStgU+d+FCBx2xBg7jxvDEDOcpbSK?=
 =?us-ascii?Q?1V+AZaq3JpjnZFYmyS/jOVdSnY2Eaj8wdp96+7jDuDNaYBmipkhZ4a12r6DD?=
 =?us-ascii?Q?ZRWq6SPjyub5bda4vj/zQRX9Q0Y5aoFXT1jwwlO78em+7hFCYVr/07AusZQM?=
 =?us-ascii?Q?r6F5ucoAB44oI8U+K7LxrEyYVRb4McaeV8ymoTfAwEKttCCa6yO+2VokblIf?=
 =?us-ascii?Q?F2HqoqXIb18ygCOC7wxNS3oeHZ+JEPovj3mli7w3I8zOSNAaLTbaqe9P2Rsx?=
 =?us-ascii?Q?kytxWM1zheF3TfXQBFCTLyfYY1Ta6+51jQD0tZt3mPDeIFvMoYR0CcUSIZX9?=
 =?us-ascii?Q?NvVB6rRn8RrnNsTdWcrEAwpHYT4qdbJdmng1xpme6Jlq3VIUz1ULuLIKe6LR?=
 =?us-ascii?Q?HdX4zjbyjgB2BOij2JABpym6hWfeHPpxKt0A5tNZg/auTEEtXUzomIpIBLZ9?=
 =?us-ascii?Q?w506xLCefpWiNnndCcm+gVS66GOWigR2?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 09:24:54.9034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff2c31b-144d-4790-f332-08dcbdd54a5f
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7632
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

