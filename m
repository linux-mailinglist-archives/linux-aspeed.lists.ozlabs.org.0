Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F335E939D85
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 11:24:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=aHFq3Xa+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSsDW6MjNz3dRB
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 19:24:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=aHFq3Xa+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::621; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20621.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSsD019yfz3dHL
	for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Jul 2024 19:24:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YKujc1UNnoyDdYy8ZM1b3x00+jhb60wqhJw5RWukjJR3u7bMnVRp5Bl5eHBfVLGgIWvhaN6zf9m1mnYlN7gTZmK+aZdN/5Nsmp3FZV+1ErEDUQwvGGvV4WsiYveN9KUrYveZ5JCbCq+fewJ8X/QTd2PPQOpJHfVxA5qWdU2RXMWQUDEEKzUH1+Qd2KVhTVjT+OmCpLK7j4spzTEZT3Fvd/orZtqbEKcAnQjpu9Vo/2DF4IvoF2BJLNOiNVINkSt4tXvcsZ0YIYaa0eVSPKr8rFrILib37jgMyNbgWZgxi++ooRXLmot3nXoXt/1ofJkERq9YmOrrKn9S8UvlN4IsIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1Mo5JFgxGn5H6HKsVEDEaSyXk72X/JC48fJnaRvMS8=;
 b=x1mHtO1NNRhxvR1e3hnidEsiKlOTH27xuoaZ8VBKC7aGqfOkSQyuIe1GUiY2DRyoV8FcMbCvyK2ulnMEjmAMzIyCkKVJo6ZgX8eixM1kZPTj3GKzmaRs29OYDI/HwdCnwh0vY+OeYoUpt6fnKIuk+QEuacM7ubHT6KP2iu+TV7m+qDtvAxHelQVyFD4BxyEIYKcTxIhRHhL3tQP5kPCuI6Z10FkE6wDDTyNyU0db1LiRaTdkVRqPu6eervWetvO4EcdLksq0IldBy4EFcIayBlP6tWWMMdTX217RwMv9wQIwyasP4ukRh32O++1lebBIC0jdbrZ7bJghYAoWu2wJWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1Mo5JFgxGn5H6HKsVEDEaSyXk72X/JC48fJnaRvMS8=;
 b=aHFq3Xa+q9HBBiTmnuIRpgqYH93bgKQBbXG/uCtRPqCZYsqWPL34wRG47OyAx7aHIxb1n/tIwGFhFzmlxy8tra5XvAm3RV6Me0gtPE+2VoG62Prn9aER3bFAcVLHrGDgAhhlruWDvozCSAYysDOC7AgkIdiWv+dXGX8M7EWmp9x5k8xA4AIp8B25nGrAiGXI/l5PC4a+mIWqTZENJQlVO0LLbf7b+FLOMPmJzJsUfzYgEHnokFtDliSeQ/J6VMH99nYSdYaTLpILBHKRkaEh3oT3iqEJj4vGqKajMRfG5E7C1M5sMeC3B6Uy4GKwESV8N5RSinNFUpCYJOrt/9S7JA==
Received: from PS1PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::23) by TY0PR04MB6566.apcprd04.prod.outlook.com
 (2603:1096:400:27d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Tue, 23 Jul
 2024 09:23:57 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:300:75:cafe::cd) by PS1PR01CA0011.outlook.office365.com
 (2603:1096:300:75::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18 via Frontend
 Transport; Tue, 23 Jul 2024 09:23:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 09:23:57
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v11 11/27] ARM: dts: aspeed: yosemite4: Add eeprom for yosemite4 use
Date: Tue, 23 Jul 2024 17:22:52 +0800
Message-Id: <20240723092310.3565410-12-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|TY0PR04MB6566:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d89a0b1f-9a32-4fdf-c737-08dcaaf92df0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?fU5TINUCs3zJ4GfjeyvSD9m3wyZUIiEUJ2Y9bQx4xWKKxG1OTjzujRkt1OnY?=
 =?us-ascii?Q?huQ/Cr8WAe9GsfWEqUsaHhiZfi+2BgLBnQnD7Z7jx38U17ZXkdD1pjaDIQCs?=
 =?us-ascii?Q?TxLGjQCWRuYblM7TCtcygbM+G+pFrER39guHWTxsvRuVNklqMEY+aS/I9WG+?=
 =?us-ascii?Q?uT9kormQrk53NPyQCnsj8AECttfha6EfkUuM7fX79dJyNnip6ubNAR1sQlDG?=
 =?us-ascii?Q?xjK6O1achDu/fKC7L+dAxZ8En7j7SocSwWo8IZZ9fFa1z7v1lQAKpPrVQ743?=
 =?us-ascii?Q?o+syHaCs7z7e70pi5Zmeuv8L36fTIM20VRXr4gZZ2LKO1rprQwKvl7Bg7XNb?=
 =?us-ascii?Q?GD/WWTxvDYkB52sjiStqFA41sEGy/wysNioXXj84SjhQxruD3g5Y+XsNSm52?=
 =?us-ascii?Q?jrVRe4yR5WqiMBrFvNNfpBQqpFdidPiOeF30C53Shw/sx4yBQ7FWVLV4m85e?=
 =?us-ascii?Q?77Naq/W2q3zTFAAAJ+El5+/MCg7C3nX/8b9a3dnkyG5c1DRrsInEe8HqKfea?=
 =?us-ascii?Q?6EaVjkB9hKD3RUjknWPbiFXUtX84Uhu4S8wIKzD/0gTl9bpb9ythxlw07mB5?=
 =?us-ascii?Q?3PCS0aLW/Mi5jryKEXO/M8WhT1HbWsb0i/6Yh8V5H8b4W1rmmDbU/yp639T3?=
 =?us-ascii?Q?bMdKxAmg1yDn+h/UNSLOz6VlRBqo3R22qSC7mZOAhdm6Qxkt7nGwxgqqs+F0?=
 =?us-ascii?Q?6OpoHGgJykjpi08PRZ3q0oAZEDvnOt9Fl3q5KUT3MlGLxjtbQ3LHMkefYsRa?=
 =?us-ascii?Q?nH6yVwFfFKvs6TW0jjOmqzqTs60ntfxi02Mph5NI/YBUjrzztL3qZqGWYbXL?=
 =?us-ascii?Q?oBKTandS1FtJinFsWuBrS+/EKsq3xpepskQI5t9+lbzmNLUzQBVGbwK6GZdC?=
 =?us-ascii?Q?ucgP3ilLhbmQ038nTYeTFA+i7Ow2jH5w8nDWaVs4T+Bf1Fm2IR4moDhWVICV?=
 =?us-ascii?Q?c2l18Km5q/CfiJ8D7anLTfIaKtS/zN3CaXpC/4ZCyWd6MDHJ2NzOqgznrJ7T?=
 =?us-ascii?Q?U+bVz0rrQNnGNBtksImfpyDL6geueTyTefm/c8gm6zFX9GQL1SfnnuGSvaw5?=
 =?us-ascii?Q?L6mp5XjckYwHvL6jB0W6iCVfYYq3jKXyiLEV2VLWENsPVe5n6M5I1EUqqhx9?=
 =?us-ascii?Q?uLMWVa/iTcSzrFc+ICr58MPSi8+lzbhJdBNjlxeryPhPS7aHHDnoWxp29w6r?=
 =?us-ascii?Q?H2M0qPSR8sVNXNhYoq9x8cHv1OWcVLOFLz/EzArPPMFzbRnHa08VisjKnC8l?=
 =?us-ascii?Q?UwZUPVL8kH2pmRMU+4jwv4m0HJDTElGMjFSnUkRmfzW8OpN0PrgPLx4udB86?=
 =?us-ascii?Q?uQbCpklQeyqtPlInhyVtbEZq3HwjimFmIyAUSXuX5Wzag09RbXlIArNbONA3?=
 =?us-ascii?Q?wDnHiZKC0CFWNiRRQaV57yeVSuyfqs2l+drPb+zzlevlrT1LYCCEvxUjI0o1?=
 =?us-ascii?Q?bBzY/7dzv9tVdvIy+Rqmy9dQMOiSx3HY?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 09:23:57.1913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d89a0b1f-9a32-4fdf-c737-08dcaaf92df0
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB6566
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

Add eeprom for yosemite4 use

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 139a09de24cf..e83cb51ac19d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -932,7 +932,7 @@ temperature-sensor@4b {
 	};
 
 	eeprom@54 {
-		compatible = "atmel,24c256";
+		compatible = "atmel,24c128";
 		reg = <0x54>;
 	};
 
@@ -971,6 +971,11 @@ eeprom@50 {
 		reg = <0x50>;
 	};
 
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+	};
+
 	rtc@6f {
 		compatible = "nuvoton,nct3018y";
 		reg = <0x6f>;
-- 
2.25.1

