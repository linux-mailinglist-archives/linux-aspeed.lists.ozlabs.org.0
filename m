Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88542939D7B
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 11:24:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=M2F8yAOf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSsCy36dDz3d9v
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 19:24:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=M2F8yAOf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::603; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20603.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::603])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSsCg4X7Tz3d81
	for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Jul 2024 19:23:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jypXrKcKXsInO+CnsYw8L9Clp23g4KhoUyfmMUPkjjNobIZYth0eVqsncVBvtss7xn7QHQ2nBHav4fAeENLp2cc0FU1+4KfCxLvP0EnTLGq5pLejLf1zVcsPxhTcclWTlwBARBjMwuFHWU1GPBjWkdvqV0bKHviNy90jxLxKmK13b83wwwaZg4trs9qEUwL2715IrqHqg0+p6wqbYdonZKiLd9PjY1GW8yQ/GytngZZvX+130lt5Mmkd7rscqtmB1IhcXXwet1880HiFB+gPbSpcFQa/jYNLqW5O8MonCfpv1uz8KQYCuCEqfONzviSYa2e0fivf/qCSZkQalgHYCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0cbZAgnLmtnZUJUsofCz9gNyd7yXSZFoo6OAwbZAno=;
 b=NTZ5oNduh8Ron9IivCeuIEAuzGjRFK4qarBnNh3npC218Qz3MKpw6UDppxSxhY5IK0DFYHyEN+zU22QBeWWhC7hkw+RrY5f41XW9s4Udr1IPvSq4rsMCyULDxi5QbTiwf82cveXpRJ7QrSIUYaY1/5Z4iqNbBrr8+391VdGWkSanBSpmYwwIgZk3/ugJUrDI2kzZagjIxNpnQ1H4HQiXh5HBoc8qipNN0u9HpjJ7sCn+MxMFCvKviIytpWcBm+VTdQOY7JQsyTh6cW+3aSVzpEDP/NItG8IH2BTbMtg9uFV/odh8Rq7WCOgLjfHELjtgfwx3nKp8Y/WrMODO4g0IQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0cbZAgnLmtnZUJUsofCz9gNyd7yXSZFoo6OAwbZAno=;
 b=M2F8yAOf9u7IVxIZv6omOqRPiGqrFE08yyey1rnzN4Fd1nXbLSZlQzBAfgbzgyVPCMOzNJYvhATMGgAlbqDpCa8p7GhFuddFz2Qxwa79sd16jYHOrVoBxDzJ0DerjLGG/zgvD1HNK6cFBL/mYpIQzhLSndknnCj1BXv1ou9Fln7udGce8lhkVvxAadEtVa/7DpUidoHRw+AGRqVUXQPLS3s113cM/vaac2tnOiJFC9DkDVh18DWLjlG26S9Spinr6A02DmRZPf/pgVmyhFuWIINOehvJs+glhBsPflCe7MRCWg2mKCJtmaClHhsuEuVrHgldVF6STE3ikEE/SsDw4Q==
Received: from PS1PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::16) by OSQPR04MB7837.apcprd04.prod.outlook.com
 (2603:1096:604:2a1::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.13; Tue, 23 Jul
 2024 09:23:40 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:300:75:cafe::29) by PS1PR01CA0004.outlook.office365.com
 (2603:1096:300:75::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Tue, 23 Jul 2024 09:23:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 09:23:40
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v11 06/27] ARM: dts: aspeed: yosemite4: Revise power sensor adm1281 for schematic change
Date: Tue, 23 Jul 2024 17:22:47 +0800
Message-Id: <20240723092310.3565410-7-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|OSQPR04MB7837:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fea945eb-df96-4272-eaec-08dcaaf923b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|376014|1800799024|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?hRnQEwyQHncSLRJFC30K8kGJR4P76S1KSGAqQCs4IXm9C9PXNF59EG1J4b8A?=
 =?us-ascii?Q?ZOfWTfVVr0tcbaP8J0jHrKtyQz3i5WiNrrd02i2kZM6U/IGkNQzuRp03/9UA?=
 =?us-ascii?Q?BNRzOnlaXKzDyJUevqVHrje1QTNjVO2v7O1ruEFSj14UQes2OW/GK2VIyk5r?=
 =?us-ascii?Q?uY2nQBnRFHD0D7A9zDBkZaB3IC7jYfAVZObYEr8jT6JZYMyvG3BBkpplCEf0?=
 =?us-ascii?Q?EQRypT2SZkud7SkTAojA/mM5xfinjFRc+07stwuUJFGfFzwcMEB17ngnPbGE?=
 =?us-ascii?Q?gB4KthEJ2/rkgCZcOSYxOPrlQ+F18H4/QKzL5LSfO5zAH2OkNTNqN28UHwoU?=
 =?us-ascii?Q?Ug3qHAeav7cxsPZfvK22iPgG4JG6YrRU8cA2VwYsy8v4z8YjofjetGr2jKFs?=
 =?us-ascii?Q?YAvqOqerdQlu+sERLs00UIq+TE1qAkZLbiN8Zj3T8imYq9f/pdmZUazM/IZd?=
 =?us-ascii?Q?dftOq8jxw/Sh1rFjrXnRRtGVPpMw3QYLxkFdpX3qdfj5/IuqygvKnMGDCY1n?=
 =?us-ascii?Q?3oHu3E7itRQSVQjPr021cqBnm4WIJMajTCVHLZMzUXDvunuwjbuq4g9Zn5dA?=
 =?us-ascii?Q?rJMpuWkw51NSerHXH2p8V+JkFU3JCXlhSuoUINQ3iEIBMcYx2gz7xfzhoRBb?=
 =?us-ascii?Q?fwaS0s9ExUsNXOHW7jLHQuupUHs8mApK3cKWe6RJ9KuHV97mwPaj/YoYTK53?=
 =?us-ascii?Q?pdxEiWWkYr0sG60z/SpGoAFQiI90bCjCIruB3rvnulTgDmoDU7ceQSIP5Gav?=
 =?us-ascii?Q?jJ3WBJVSaNByNSjRawWsPLuWeRn2Ax3NEJOAHT94p82Ctd0+siCirEOFb803?=
 =?us-ascii?Q?8hmKPG6qdUAh9yH4iN1Atd0+kqNjw36IELec9I+GWK0X7N6lN9cKThY7xUNv?=
 =?us-ascii?Q?e0qqxJuy5AaEjIRVslhDVrYcf9L9+hMCEXrWdbPp92UwVIF38Q6sX3Wb4Yyt?=
 =?us-ascii?Q?zOwkBc6T8/07RvxO7qp+Z/ENhy+cYXgUxTubWA+r0xLr3Wx1AlFnTYi0YF6Y?=
 =?us-ascii?Q?C6kqBllHciwLVGfU7A6OR5/pfOgveCsRcnp9QqpKLcCUuxVDXO1OUANuwCq7?=
 =?us-ascii?Q?AcWYqm+RcnAxP1Oi4KlKrQoFUpfbXxr4y6hoYs4O9ZJsjPuuN6RFlIoOipAg?=
 =?us-ascii?Q?OMzQJLPWlNRrgDtlkmTk+3cGlZ7M+zMerdcOnCUpiuCY5wgsHHGfo5IV5wEh?=
 =?us-ascii?Q?SoKTDv6AkMhuGfU4jQnvrWam0tuGE4/ASXMfHKxHGhiAG+h7Xyu23gt3C0d8?=
 =?us-ascii?Q?tjUpnOAHGQKOL1z1TYLcNA1Yt+lRfVSVbBUMIUnw4AeUpgA0s/uCdEcTZzmY?=
 =?us-ascii?Q?0oWt/p6drhGBvEbQ/CjVshbhxmdVJVL81OWGYQf+/vS4t1oJi/RluCpUOsM/?=
 =?us-ascii?Q?JehHOYOy/Wr6Q0Q6ogvJDF4i8n2eeHHRhXEQ6+rjP90lcTnbKDtjnUBjuBHg?=
 =?us-ascii?Q?aBHJW5uZlJMn8Snyqi9aDdPuXHmwS8a7?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 09:23:40.0349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fea945eb-df96-4272-eaec-08dcaaf923b6
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR04MB7837
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

