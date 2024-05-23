Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id BE85F8CCF2C
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 11:26:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=DMJB5hHj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlN1k6r6dz79K0
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 19:20:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=DMJB5hHj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::61c; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlN0p6DKmz78xF
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 May 2024 19:19:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFlTDQlkUJwudjQ6urWp01fJcTOdIOiel9U1oA/GltMRCRb4Q4Pw2ARiRRFG2iYSFhVnW/LLOnpFlB2TCC3ZNkodxqcN7NBZUFjBfYvhQKM+hFzXWnU0xBSoYmhqqTzWZIxvVLbkbY+CUfoFI4xZwX12A6cypIRGK4IFuZv+Rj5/eFrK9zmps4hOlwjPv/B/fRTbTXbRgfOi+1nyoqdXQgkteT8hznRowQ/EHjMtpySPryo9nqFIzsRK92gxwHbcjtML2frcdHT5jmCmduruRcTYX9ynCriK/hD64R2CcsQwIVAFG8vE4K87bwq061QQM0TpVyzxdK6UcuV0y6OTqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foNIYuXpkItBjY8qUhSUDvLy6XuG5cw+SWa9LoMYeno=;
 b=Wlpa9fP+6ARDHSgE7aXPLrd3KZa3w85Izrl2bFGq9+f7sHX0hIgzWjSIhPAiceq2gOm1bWjR5M4p9kk1gbod57yWZvQHR5dw344af1rMCW2WnK+PPMtQjz82miPp62GMGdOPlDhdHZpybxBTQkeHK+rnB0r/O4d4cAtOPh/RsDs3u3Fzp+gxrGrq2WlkamczB2bF5y8jUieT/GGxTSlxaUaHrPOv3SAYCO/Eqec6Bv9JizMC6Zjdiudbc3IrAgRCj7ErvEACTI6OOGm65/Y4r+PcXEz1bwWPH/OmC0SQrzvXNy9BF997rkwqYsgjYZyFl7KsXVhm1tWxTAmhgyBmaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=foNIYuXpkItBjY8qUhSUDvLy6XuG5cw+SWa9LoMYeno=;
 b=DMJB5hHjWv1A6nq1sBV0uj8tQYpBiGdxiI+Nu5LIUmIDlXNGLqVqjWjmwpNr6oRnsrkFQ3IaYXzgNnBaJNZH/GCArdhvzRlBcfaetXeAa4naL/MXPtmKJyvQZZI7IA96kZjEwqHhK8o9L14wJx/9YegEyXQhInnbQ+TZafqlTkHeL4I8CfJk45Qb9IL1ltg5cRjYDTBJm1FDJhNWX4cnEB4vxjUzQdkfg0xFOS+zDbvL3/urDiUDwZmvCZUOVfTsY7LJod7ZI2Y55tZOmcRKKO5nk7a3OuFXiTlLFxLVg/mVoGMByuk43F0MmJutncd1KmoJdUt3nIszWOq5FBPYPw==
Received: from PS2PR03CA0007.apcprd03.prod.outlook.com (2603:1096:300:5b::19)
 by JH0PR04MB7203.apcprd04.prod.outlook.com (2603:1096:990:36::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 09:19:21 +0000
Received: from HK3PEPF0000021E.apcprd03.prod.outlook.com
 (2603:1096:300:5b:cafe::c9) by PS2PR03CA0007.outlook.office365.com
 (2603:1096:300:5b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.9 via Frontend
 Transport; Thu, 23 May 2024 09:19:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021E.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server id 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024 09:19:20
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v8 20/23] ARM: dts: aspeed: yosemite4: support medusa board adc sensors
Date: Thu, 23 May 2024 17:18:07 +0800
Message-Id: <20240523091812.2032933-21-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523091812.2032933-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240523091812.2032933-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021E:EE_|JH0PR04MB7203:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1ed2207e-fe08-44dc-2e84-08dc7b096de3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|376005|7416005|36860700004|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?8YVuYoTnsFq+ofs+U/Ldy6l8ZZoFB4aDZWMm5h3iJ8Ebv8CWHDOQ6ft0TCdD?=
 =?us-ascii?Q?12x0N3UIJufqIcF3xT/gBnNWxOakoL9aSXxHQBMj7SYFtVXIN5Zo3FNtLf/w?=
 =?us-ascii?Q?R5WkbrVbwn+tiJcb1rrQ9uGKyhca9zk9EEUruRYbTdi/8BHYS9abzLgbv9BJ?=
 =?us-ascii?Q?wNV2nym3Ex0oSijrLDHnkHx/UbZqC70OLlF8SLm5HgB9Danv2jnEC8RPUztw?=
 =?us-ascii?Q?WGc+ZPQFYEunUsLV/bpSjqER+KTv05jyzXGnTRni84WyI1KyNOM+Ky3o3pk9?=
 =?us-ascii?Q?783ETgpKCElf1MeSL1Kn+nEBTlBv2ldXIW4OSbai5WqaPG3qNPtH6WAtPjDU?=
 =?us-ascii?Q?iJmyGTZNtUh0M8hyuC1C+E5j2071QwfEHxQS5qFOTC9A7MfCKxSYxLeqKEmZ?=
 =?us-ascii?Q?omzULCrzBKggthge2flVQAbnl7cX1mk2m//FsJK4QlFk4aWmwFSzI/U/avCT?=
 =?us-ascii?Q?CN2HpVBxJfNZz9xVbD5au2P8DPa5wVrzvKqGlorqbVgl2iUC9CZB9EvMfp+8?=
 =?us-ascii?Q?rC6jrha/UFtp3FYr+5Y/6E6creWmsVOPhsPuFNediGtTptBVXntrxc1AT4yT?=
 =?us-ascii?Q?JRN8KwpN+cmHIYD9gqMN3a9FLsGdcTnuOhTsKwClGWYCLCFJpdAdnOTDSZ1p?=
 =?us-ascii?Q?2NeUFBjTEY7cPKvrO4lSHXvozV5K2bNnlpYzlSCiX9oLXaDiYmdQbbg5wTeH?=
 =?us-ascii?Q?T0T1Uylrp46oyh7O+xpg3oZ1UrzBuZjrUyrDZpcy7SnoZWO04l4cVw/mEdLP?=
 =?us-ascii?Q?THUSj1J5v2FN/0s5f8TGyDSjNIlX7L59hzSI0m+5eHOo9iRS/YVgMR5XZp1W?=
 =?us-ascii?Q?MZoXlZgtX3HSr7ITLaXIjDh7ZDeY87hfTRlUs+eOZ3Fs+fOV5TjAVQWJR3UR?=
 =?us-ascii?Q?zBsLnzdPPs2I5//gz6dExHnl8CD3eZPsmDDoOWfNQs4EV+jqeDGaDbqwz2qs?=
 =?us-ascii?Q?ot6oxaMwUnLAIMXQJZaO5FhcCoNfSPCnQyTr3b2tfqQl7yDGQpbaVYh0rWvj?=
 =?us-ascii?Q?Oz3ISFalSHV0XuusVnpp1qbr/nzzdq9Cwmy2ynNlHNVDWCWFQ47gIw4OhO08?=
 =?us-ascii?Q?9k7B/xix11DbHlLpCYydtHMTdIFfUD7ouY2hZQN5Ry8Ti+P6dgop57N3qCH1?=
 =?us-ascii?Q?8vWP56i0F5nauGZnkqocaegDQVWqiW8xeayyF4GmdovbV6Ks0dtFqUA26hTI?=
 =?us-ascii?Q?LmmwCxGejf5OOnHSi5VignpguGJ4hj5bl0y3B6kvhMYtpClJsJ4KUOOxrp+4?=
 =?us-ascii?Q?/ONT1bI+Zk6Wti2lUVyP1bB9qKSYxMnFPBX81+sELR3c4izIa9e6qgoCA7zR?=
 =?us-ascii?Q?7iyZnLubxFW8o4RlaiW4KgSTsi690CHYqzTB/Oy2I9pAYs/Wze2GPVa281sQ?=
 =?us-ascii?Q?A3XpwSJYDvxnRTaPdFmpNVLHtj/u?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(376005)(7416005)(36860700004)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 09:19:20.6107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed2207e-fe08-44dc-2e84-08dc7b096de3
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021E.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7203
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

Add ina233/ina28 support for medusa board adc sensors

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index f4e37187bd5b..bacaa2208734 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -915,6 +915,19 @@ power-sensor@40 {
 		reg = <0x40>;
 	};
 
+	power-sensor@41 {
+			compatible = "ti,ina233";
+			resistor-calibration = /bits/ 16 <0x0a00>;
+			current-lsb= /bits/ 16 <0x0001>;
+			reg = <0x41>;
+	};
+
+	power-sensor@44 {
+			compatible = "ti,ina238";
+			shunt-resistor = <1000>;
+			reg = <0x44>;
+	};
+
 	temperature-sensor@48 {
 		compatible = "ti,tmp75";
 		reg = <0x48>;
-- 
2.25.1

