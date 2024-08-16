Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B7A95457F
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 11:25:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="::1" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=fdqxxZXJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlc6b5znQz30CL
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 19:25:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::61b" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=fdqxxZXJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::61b; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wlc6Y0mBKz2xst
	for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2024 19:25:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fp9F7opjnF8x1mFMlHTzWjz0oCvxicKnY7wbcYU57a71auOlSFYChG0PrpgN42BmhmsKR2MCEFpMpf8Y2sKvmp2EuPHqdjuFmQmv3T4UWkMDsA7aGmZfBUw5Z5cAKd3xHuF6rnlLbG5E+1kTk6keCCK8K+XKBUXJkuVVKIHG2uN5ZQJrBpXDC1plCiSGNNqM/XwHgRsPS+nssAzwcoFbYvn8TtNAzj2N4ypSrtpZHVz5XUeJYp6FFrU+YC0y6VmtYXnjblPv229xj6nb6vh035EBpIoLcQMFI27kppc/md2YSr3X7MYuOOMcXWqgpQ/RMb9zPeYsW0hbcXUAAOOysg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQ8R9uD5dS2CYOtc4xvne6zIrhYDAk0BYpQGanDefRc=;
 b=yHUVBwH2lPHUjqzuvwjOQ1ngxkEoem83FFTP25yAU21FlafoWd4aT1ik5Me6Kk9P9/aLZTQl7jq4VJMon0fpGWYsr9Zj6eda5Brc6WTVM7Ysmb8D/7gvyEPJ4OEQMN35y7tQx39P5A4AlcqO52YfpmZOj5d+YLUj9uxIaMndZgGDuKgLoCv7MUps/GIze5WX6YnG9GDu7vrKM9GCC6Xe6i5xGzt32ZaCvv0W4S4bJQW4R05KQcuYQV+IlpHW8510a0mDShGIOhEb49gU8+E5MaUZTgpBYVfU9+ZGuofsLeDezPv1AT/45Q7LNnJwfPOnT5VbC/cAE+JpQOoaXqPXog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQ8R9uD5dS2CYOtc4xvne6zIrhYDAk0BYpQGanDefRc=;
 b=fdqxxZXJe0idnREzHlltrQuuZ5F+ee0tDt+zIqXBVFrGDEUX4qCMcRNWKkYopKmkIfGf+oazPh7B/4gd1iXT+Za1lMMhg+gxoq2t3IAJfYw/EoLca9/y6jjwgFOOaKqri5nJxQy0OLsFyZ9prFxMUCYO+y1BZ1Rs8Big53LL/seNV57rbSofNh2o1U4QC7Z4iGnwjdiQeGvWL3zJPlN7SpJlVxJvpmMnLF9u2hqc6NkYc3LfywIGJvQqyMLvHNHGVh5LM0OatRYvO2o+W6avDNAGpqWa0fh2syPNkIQofzo8SeClqCd3nvSlO3Re0TRAyU37oEgXqG5I6lNyFJDEHw==
Received: from SI2PR01CA0046.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::18) by TYUPR04MB6637.apcprd04.prod.outlook.com
 (2603:1096:400:345::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Fri, 16 Aug
 2024 09:25:20 +0000
Received: from HK3PEPF0000021D.apcprd03.prod.outlook.com
 (2603:1096:4:193:cafe::d6) by SI2PR01CA0046.outlook.office365.com
 (2603:1096:4:193::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19 via Frontend
 Transport; Fri, 16 Aug 2024 09:25:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021D.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server id 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 09:25:19
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v12 12/28] ARM: dts: aspeed: yosemite4: Remove temperature sensor for yosemite4 schematic change
Date: Fri, 16 Aug 2024 17:23:59 +0800
Message-Id: <20240816092417.3651434-13-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021D:EE_|TYUPR04MB6637:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a7905a40-e8a0-4677-310f-08dcbdd55931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?BIa1FhXONCMEV9H+0XbVoLoB63VpHPsBWNnMnvV1GHpR67vmaN2wFPWykTC5?=
 =?us-ascii?Q?h1Byh4h8oZLMVyGtS3LR50Pba7wwTsX5gtSPOUkkInc64a9NmPMVsY6Zyl6x?=
 =?us-ascii?Q?RDv89CSCHj6ta5azJhRVHs93Hgbyi4UVn3xQhDwg0omkzznG1aZ30OWEPTYy?=
 =?us-ascii?Q?lh9UfChaJBQDluXd04x0SNLCI/L1rVMYpo1w4nHtsw/+xhPVMIp67IredLHr?=
 =?us-ascii?Q?RdJOuwyxSCO6y//s/zPahNeGLorQ2GROeIPhT2otxBjnyCGryYOFjMD+IYdb?=
 =?us-ascii?Q?QBqAZ1uDSKBgbEUQkT1C6yiOuO8GFm8DQaro6HsNrYDN7XOzvWrBvhfS4B+L?=
 =?us-ascii?Q?CYsuanYtvxXgZg6UM9BJoWMPgU5+bH0r90A/22dXGhJN2UwoHchcbbjiYTvC?=
 =?us-ascii?Q?Q2Y3rC3eOPNim15c8jr/k4rt+gajAdSpzQAAXB8n/R4oW+xLejpOg+qAj4iS?=
 =?us-ascii?Q?UjzjzME2cFo/l2NxtNXpGDtE/VOamMW4cVubcaC8Bx8jxLE8sEcfz32wYKbK?=
 =?us-ascii?Q?P6uVAWewax8+nOz3OAuB2JvQWgFbO2myhFZXPxSj2MWpe6LQ+yjq5leHX+/h?=
 =?us-ascii?Q?SqBOT1tXIv4hDB1iG6YsUSM4lJegojKev1aSRJOXkrndWLULf0sfixG18qMw?=
 =?us-ascii?Q?z97jP0/MvTRMCSwUfQIMbKoufMckhpxxvkA6JtjSi/feB3li0z1zpt1ADUBq?=
 =?us-ascii?Q?zHsHZbRRNXMFOK05bECIV4qEq7ftRUyHFwDSJPgnyANpSqxO1ayqKXRCZyAR?=
 =?us-ascii?Q?FEWMvC9MgU6muQ8WHsh8KLNIPhk/t9LeiynKEHbULBVelwUsLvTunPKatE/4?=
 =?us-ascii?Q?1lHyHaj7XRLWl2yNLm6qMFrCc4I3VlIf6bV3r/rK9TcF8F62U10sJJn/Vd4d?=
 =?us-ascii?Q?Tgw5YTSNYQEXGA7A0ORUaPUU8EvsJKDHVJPgegFNUCxqQK/No4aKgYeiucgc?=
 =?us-ascii?Q?bdUM1NRbL54ZZF2/4aDJoJCWkSz4dYiOdMwG9mjBndxhWu8YAG7Fx7u6JM1a?=
 =?us-ascii?Q?Dsv26DsF/hxSkTmYbs0bYUsftSOykrXJLNmDpj1FxG0uB9yCWydo7KO1lG2+?=
 =?us-ascii?Q?SvMKpWByLwxdQ5DVGwbhZxPQ+tU3d25M8UCol9nGUjmmUtcY3i3DnGF2Hqj0?=
 =?us-ascii?Q?0Wa5yrxXuYLNJPoaRAUoVKzIcarxQVuqVUpjGr4VSV8Xd3l8M7L8KBAUI7nB?=
 =?us-ascii?Q?/oOmT2ytMNDH6dyl1AicNjkud8472su0nCull+b1rc/aVWIYLnzN/fPJrSa8?=
 =?us-ascii?Q?oYtxAWmkGncAl4R3HT3eC8jL1xEpYGu3HDWN+jpToqIinaOxI92f752oSrSS?=
 =?us-ascii?Q?qfshIhV1wBAcmn7uwIrCoSAwkpBFAS/gE+R5zuZ4sbqDo3fMwUbP1/7Avday?=
 =?us-ascii?Q?AJWXH9gIdteeWjMNJqOUn9oC7VbXBW5ut7cD0vinGVEZD2jiEE7tAMBMXLPv?=
 =?us-ascii?Q?BUHuxiFfF758deQnOkYYS1LOajaExXAv?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 09:25:19.9191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7905a40-e8a0-4677-310f-08dcbdd55931
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR04MB6637
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

Remove temperature sensor for yosemite4 schematic change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index e83cb51ac19d..2c0c37b3ee5b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -921,16 +921,6 @@ temperature-sensor@49 {
 		reg = <0x49>;
 	};
 
-	temperature-sensor@4a {
-		compatible = "ti,tmp75";
-		reg = <0x4a>;
-	};
-
-	temperature-sensor@4b {
-		compatible = "ti,tmp75";
-		reg = <0x4b>;
-	};
-
 	eeprom@54 {
 		compatible = "atmel,24c128";
 		reg = <0x54>;
-- 
2.25.1

