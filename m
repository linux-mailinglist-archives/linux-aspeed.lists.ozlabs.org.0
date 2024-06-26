Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 559E7917BEC
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 11:10:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=2fpg/ivc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8GBH58vRz30Ts
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 19:10:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=2fpg/ivc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::621; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20621.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8G9X6l6Xz3cPS
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 19:09:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfP12tzGLoanFeMMTEKrvwx4T7MkfVdE+r4pWrM0Z7i87/5MPoicuNNO4JlArGcX3WG//nBQJ25KyYGM+OK8NiRqDFTvLRVGACJ3AO/KddMHXNrMG673gCC3vhoQ6brgrYIAsg5mRcVN5SO66bJZwwTTIsnhppr9EHjQ8ZGBBluQkMiLjcBDqCYwwy4Z3PSGqYrpsQ9LBwhUgA6yiuq2n8N0bo0o1gZf/ACllCr5iMsYH/KYRr6OE3BnnVh7xNaJOxe12nIUvJvKcFzzPQsaXeC8H7Y0chfib1mvu4aNL4PWixSTNG1aqTGRDLuqAco78Mz+h75RkZ8Pf3o/5blq1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqimXxCSFfjlalerndMtt8J4+kzLlcFkd5OkESE2nnI=;
 b=bHyE1aY7DaKPBgZmYmAGn6YZA9WXdOcXXu/gRBIB/9pZjj9bN9hm4YmhPb1htyjqR7xTGHuKjCUsvgKwDkz5EIW/GSa3w5bCJI2leYuSEdQqEw6AUbtv2PsIU9XHpWsqhnHuXUyTddCpjzzi9qCH4jbAwnqYnSCAyxxquMJmW/zMCpl1aHZNtH52kAFlWtIuL7XORwC8QYzroDRIAFYmZMEnng+HECHFaH+bbCEVfbFYGhyDK2E1T7s/7ZrF6pWd5ky4HbG37zrvhGas885yawjQjflyDbI6ADhcTaaDEaxF9ilSiCW8qkboOW7DHxSH1wAKrvTrwUn6RCUCmi63qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqimXxCSFfjlalerndMtt8J4+kzLlcFkd5OkESE2nnI=;
 b=2fpg/ivcZfGed+U22s16TzkzpbP9qwGbb2n1Ng39RGuiKIViESC+ARG+3PxWaG34AtmC2IF61fZdOgAHBmUDOSji3lN3lJG8ub2IZXjpB1DIoNZKZdoS1xVyTSqdKpWxu7vrl/8xNkeXgpynG/RAyd8QB4Z562asXsFFEIr5PojHoVhw9i6GfJFyqv6iPbhjdM/PzL9I71WcKFxpJxp7Sh8T2FTmxx/Pu1Gz0Rj8NP3fB5Uvz8dh4RSfflxqQ6Mv9/Ys4CRCqlIrDfeTJo8xjwzFTmzjhEjlTLhNwlgpnRKFI+oX0wuxiAktV/1cHjNTc6VClSopoh5fCQ5Y0Nxx0A==
Received: from PS2PR04CA0007.apcprd04.prod.outlook.com (2603:1096:300:55::19)
 by JH0PR04MB7842.apcprd04.prod.outlook.com (2603:1096:990:91::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22; Wed, 26 Jun
 2024 09:09:20 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:300:55:cafe::1e) by PS2PR04CA0007.outlook.office365.com
 (2603:1096:300:55::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Wed, 26 Jun 2024 09:09:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7677.15 via Frontend Transport; Wed, 26 Jun 2024 09:09:19
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v9 24/26] ARM: dts: aspeed: yosemite4: add XDP710
Date: Wed, 26 Jun 2024 17:07:40 +0800
Message-Id: <20240626090744.174351-25-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|JH0PR04MB7842:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9276b3ad-19e6-45b2-52b1-08dc95bfa9d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230038|1800799022|82310400024|36860700011|7416012|376012;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?5q8rUtC3r+t1k4AA5VMht8MMtK8N3g0+oYcpz++BLLH+HFjMKQ6mwkLbaDT0?=
 =?us-ascii?Q?QvuFVy+ah96xQZhoalN5RjOFh2SXf5KLtAIXrMpY3jTyBviX3JXaoDEKdbn7?=
 =?us-ascii?Q?jlZwEeVKj54ZJveBd0mXZyyJcmLAozjV10IAExMAic9rFxfmQ2IG4M+oBaAP?=
 =?us-ascii?Q?0KgW4jkhLoyc/9AntIY2JEqnIoqRlVaq/yV0Lx1G5LSgLpvP+o/5FAmGv5lr?=
 =?us-ascii?Q?2YM3Znfi4PjE3xAd94DwKvf7o4Nb2KqtpY9zzHsW7cKTF7gP6ZK6oZ5xWFIr?=
 =?us-ascii?Q?Xb2Lf4s6Vs0O0dOJsXTTem1cBElj+GFfd7J6ljxWmvhar+nbe+0hJ1Pxas3M?=
 =?us-ascii?Q?/oaIrbbm5XmYdWiJc1I76vBln+nHABkZZv0cqMhkM6z0i5Q8PpJYKldi9e7h?=
 =?us-ascii?Q?lpkdg0+FD/T2LkY9p8MMVSTtKE606aUQiAGyo2/EbDEk1/FWr3ko5UQiED4i?=
 =?us-ascii?Q?UYGkmxarfaEkrb5Wx9DcvaFg5+ihyNmnhjJeq4TzWVw1snxlA2mekXNpBFZt?=
 =?us-ascii?Q?GMGGlNsWrDYLuWFgvE3Nxvp6WzpvkQvi/84kVomiJnFmdFq5sBXEM503fhtG?=
 =?us-ascii?Q?jXmF4RntOsRTrkjPA4lqX++e1D3zeiMyxn9Ivh2FInfv0tsFPRwiGB6Cfl5G?=
 =?us-ascii?Q?8d1Py4cSeCJ5s4giWap4R2UGDaIWbjumsP2/vF3X+wARdxxUCMZD/xA0TMu+?=
 =?us-ascii?Q?8h60DCaMSC7dBRBlAeGbEgzMzloPAi5W0UF4bkEzvbMG8tdzyEOSS7dYy3bh?=
 =?us-ascii?Q?WYP3eb5s31UYqJG/ICFldAMI8NH1ruJNydqzn5Jq6vjcUew7Wwi5duuL+iD7?=
 =?us-ascii?Q?0GY+qCf4GL5yGMdzlAZv8ISZNLHGQALK8ARAQN8SsXG6WPr2J85Ejv3DICTe?=
 =?us-ascii?Q?iClnZgvCtYndbG1Zzry/qHnbB4QdUpxfQ8dh6lYuoiWRekXK/TakKq2ZFjrH?=
 =?us-ascii?Q?GOZsWQkTvGWESsJEkKlmP1umyiUOFwCQ8CIg0u21ziPZVWfNTQYciHlIaJqW?=
 =?us-ascii?Q?mEv6tYhSjMLBSnUtV5TL1Q2Na1rJhoFRNVzci5UbS4Hen87olG9pUvrADxb2?=
 =?us-ascii?Q?kK8XB6u2sFt1h2BsU6DAmlf5wlyenAcBY11/cbM9hTMA5ndQ22wqE2QvJWdm?=
 =?us-ascii?Q?FdLAYW0L1JJqTR3GfXvL8PBUDyGGKKmvXRKhlKo0pv2vyHZeuVpx21zAuTZE?=
 =?us-ascii?Q?iBhJGHOOe7toGM0mD9BdFwmQM3rQLvPs4ugYwr8nb77Uf2+I/a1DuVgjtM3Z?=
 =?us-ascii?Q?KludnLBpeDlrse9FG8iTMz9lilyAd78q4hAWsP4N6mrD12gHtOmdUM7+OKg8?=
 =?us-ascii?Q?4n+7m9ZSdIx85M+axmw8Y+UKbO2kKGlVnsyd5dsfyIRnuXeiKm4CczFQA4jY?=
 =?us-ascii?Q?VQfsOBMPt0m9GZrFQe89LsF1XOUZqobeReP8ss5di/MYZFJKmQ=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230038)(1800799022)(82310400024)(36860700011)(7416012)(376012);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:09:19.8333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9276b3ad-19e6-45b2-52b1-08dc95bfa9d7
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7842
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

Add XDP710 in yosemite4 DTS.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 2cbb210ed53e..05f109687ee2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -978,11 +978,21 @@ power-sensor@10 {
 		reg = <0x10>;
 	};
 
+	power-sensor@11 {
+		compatible = "infineon,xdp710";
+		reg = <0x11>;
+	};
+
 	power-sensor@12 {
 		compatible = "adi,adm1272";
 		reg = <0x12>;
 	};
 
+	power-sensor@13 {
+		compatible = "infineon,xdp710";
+		reg = <0x13>;
+	};
+
 	gpio@20 {
 		compatible = "nxp,pca9555";
 		pinctrl-names = "default";
-- 
2.25.1

