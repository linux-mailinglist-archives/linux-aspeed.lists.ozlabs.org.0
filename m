Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD972959742
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 11:42:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WphFx5ynSz2yMb
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 19:42:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::60f" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=fDr2pAaf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::60f; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2060f.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::60f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WphFw2LZtz2y1l
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2024 19:42:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDyKxnNh451M2yxbvuQ5g/RzOsmbyYlypL+wfSfNEPxfpvQRe3pFXZJYNsLkUftlkCK4PbOTUfjyKUPGsfRnrcHD+Cm5DMqdAbToeGkxqxSVOgF+4KQGTkt0vEPDU/MKzp1lstMLViXQeXQsblr0XxXAOAaVFU0HaOJBABuOQQ27TB3kcDKAS0+caHHNN0DH6sc5jxD7ru8UEZgM34AerNccIgyMXadzOdVUNI2inUCJTi7guSH7OZnsPjIkJtMLk8ETZqki2uviDZMKYW51NPZxmtaOfdrgmjcPdpGObOsDloWYk67WWXwksTNaunQrHKfRbESsqt+YZx8USqugxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZanMQdXX7mf9CZbizY6qTm7CHfPB7I8RHeI6+dlIZ4=;
 b=UBvMuNSf46sqdtfH/08RTBV0HkqL7KMQjesj/4gpE6T7skCxUj6uc3d7Es9+WaebkzbrvitAfzRfBYxn3Oboa//DJugNMoAXrP2oo2sYqlu/Bv9NJdXXyequuv2mlbRqED+s2TCUfSnRQPpOChESXJzzm/sHq7F03T/DeHTKtO+ppO1hJy1pE9FZPB1wBscETNkGyKskJULO+adHXTe094yaRen0CXauIULT1hxV0mTl2FhND2HPNdo9UhcL4gwWavrsaIzAveM7LJRdz68ZhuZYNIDyLnnZI3p1lc22nIdbZZO4Hu/jg93ZUibPn/pNrSkCCfXggK3vjeF4hpetgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZanMQdXX7mf9CZbizY6qTm7CHfPB7I8RHeI6+dlIZ4=;
 b=fDr2pAafixC1Hy0EXYPb+kQ7p5gRfweFmOYjCG70Qy/xCeWXsmPAjoYyDtXS7fgoFf9zNC4Bd326EgvVuZP9YUYIlsCkyIarSoGYkqBDrJCGXcrzovEFlbidctOM2V9jSrYvuWd23OUIo3TQYPZWmekfhuPAcvM+V1vdb6RvTzAoASXuYlN/PhlXIj6Z4DRqss0kPXscVvCvtHlaVNKd3/Nmh0vwPM5UfEXFtTG026ZE0jPor+yaBb0E5dBPt95xn1vG97qBqEytvDXukoH0tCFOc7OtyTSiB9lQqVBAWJ50cMjtnvQtgoNO4g5KmUSPSvItCUE6BENjo/Lh1Zbxcw==
Received: from SI2PR02CA0023.apcprd02.prod.outlook.com (2603:1096:4:195::11)
 by SEZPR04MB7052.apcprd04.prod.outlook.com (2603:1096:101:186::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Wed, 21 Aug
 2024 09:42:20 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:195:cafe::bd) by SI2PR02CA0023.outlook.office365.com
 (2603:1096:4:195::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25 via Frontend
 Transport; Wed, 21 Aug 2024 09:42:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024
 09:42:19 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v13 13/29] ARM: dts: aspeed: yosemite4: Revise adc128d818 adc mode for yosemite4 schematic change
Date: Wed, 21 Aug 2024 17:40:24 +0800
Message-Id: <20240821094043.4126132-14-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|SEZPR04MB7052:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1f119c26-cd0b-4e68-622e-08dcc1c58d32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?aIfbW0QQ51jSvU7FZOY52rACb1f6101i8TU+X7Ul03ab0MoFPyeNABAS6K7y?=
 =?us-ascii?Q?TLs0isVdz3uGUzUlmsHHuj9gKEUnwF2irG+Paj67s8pP0aXK/PJFrrFWwwyi?=
 =?us-ascii?Q?5ISE/BKqtKGIf/EqsithZTpVpAUqcdAVeRf4nd/jxAKOiGKmv4Q1NqHqpNuH?=
 =?us-ascii?Q?MXgWKaWS+WG4PG2+tl2yPsfd7ubZiAENPdAF38o1SQWd7If1iZZT9LieVX9t?=
 =?us-ascii?Q?qWnn2ZLRkoUPjHv/AMQVlpYTs3LZL5sPbUQFXwmdT3RIX2wqBtg5t0mitcEh?=
 =?us-ascii?Q?C3XUAqeNzu9NqnHby8SlN3KSQ9kiKmlbRZH4U/3oRHds4a3HgTmywbYN28AG?=
 =?us-ascii?Q?NlA52xFWCyLIU3QhqlC6V3+dm37GYbry4zAwiPchKCIQZSFvSYpJBqHGW+n6?=
 =?us-ascii?Q?9Q/JLAGjqlmZ/6pbk7f0E8L3/d4BaaOK+wY7BpFvNkXy27OHUEoX81E0w1Lc?=
 =?us-ascii?Q?sBjaSqQs3uyzb6CX3/qZNLI89reTyff5j8PTCWoVytJU36cnrA+cvdQQJmXI?=
 =?us-ascii?Q?+RvCy6Y9NVJe//UmNsuOW7BHYK2z8bDt/nDVtOpMj3eLxxNCKt6TekKYs4tc?=
 =?us-ascii?Q?U+lfOscf/BAxMfaFG9wkwwoeX56MDkmzYeRVxlTxlx9T0oyi5obod0Y0v/Dp?=
 =?us-ascii?Q?Scj7/2zycLLWVXP/60B21JtMtVhHvLJmVkX6tpWhzGPhrjKDGpRcqo359G8G?=
 =?us-ascii?Q?PZinAYP0NOuzwYg7o7anobgIig9oWac0P1pHrMj5ota/pC+wmYusFz8MqNUr?=
 =?us-ascii?Q?qH9MZAJkNDZV//B8RqjYExXDfQujKNVcCJGwE6FZ9YwftMSNvfTFo1dBgRHL?=
 =?us-ascii?Q?X5idwj2cNPC81+NEtg3Pq0dUSPg+lkbXZ3ZxWDZn/Ii+u9pycv5j9xYQHQNE?=
 =?us-ascii?Q?lGq959v/oO5hIAVBxVi6+tmET2oZCFEiDcGEeCuQNxMTJINNwwj5dweQ5/8F?=
 =?us-ascii?Q?Lx4iI8oXmrx6pLss4qFAIY/Kx+L1Bet8Wjq1gKxVGs4Du4G7+g74C9H4yMiK?=
 =?us-ascii?Q?xjQamzdw+RlIryjdHi4oSmb0ZNYU6k4d3GxVslAnLN7b65NhtanzA3rYOlCB?=
 =?us-ascii?Q?r6spHMk3TdSzjNMW6DPBq10GhrZa2R3jWsBO9nVo49lnZMexxbISnNXr/ppH?=
 =?us-ascii?Q?q5Lpsk7j65MPqwfxL5Tiu6XC71KvOaQBzW0yIO62evxs8V89nNzhb/Pt+LmM?=
 =?us-ascii?Q?L57PRnlOj423yedef7ksnbC3l3jjYJ2DtxKyr1FdmavZJ/inkBwY+mC4ggWH?=
 =?us-ascii?Q?SViDhfWChTCwMoP8Kn4waxvypeyoo+S7/Qh3LHG62KDCzpuz6OY/FpQl1++L?=
 =?us-ascii?Q?UsYWv7cO6OJMgJkDhyhF2Dp2ueUOaJcr5wW3r5WZK+XpYyKdTK0vOa0zUF+F?=
 =?us-ascii?Q?bBuYU9x/fLJzMwkP9DTot3sCWCSDAysRYancQyoJqVDw4AXlFx/ab5UFkQWY?=
 =?us-ascii?Q?sfDn//BpwjnsFiUwWHlnK87zjX/nUiih?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:42:19.5125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f119c26-cd0b-4e68-622e-08dcc1c58d32
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7052
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

Revise adc128d818 adc mode for yosemite4 schematic change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 2c0c37b3ee5b..1765a0bb70d7 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1018,19 +1018,19 @@ &i2c14 {
 	adc@1d {
 		compatible = "ti,adc128d818";
 		reg = <0x1d>;
-		ti,mode = /bits/ 8 <2>;
+		ti,mode = /bits/ 8 <1>;
 	};
 
-	adc@35 {
+	adc@36 {
 		compatible = "ti,adc128d818";
-		reg = <0x35>;
-		ti,mode = /bits/ 8 <2>;
+		reg = <0x36>;
+		ti,mode = /bits/ 8 <1>;
 	};
 
 	adc@37 {
 		compatible = "ti,adc128d818";
 		reg = <0x37>;
-		ti,mode = /bits/ 8 <2>;
+		ti,mode = /bits/ 8 <1>;
 	};
 
 	power-sensor@40 {
-- 
2.25.1

