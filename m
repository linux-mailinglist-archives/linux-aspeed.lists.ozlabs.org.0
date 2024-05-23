Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id C0B298CCF3E
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 11:26:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=RtWRvU9U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlN1T22TJz79Ct
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 19:20:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=RtWRvU9U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlN0d74qpz78rH
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 May 2024 19:19:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpsSVb9mhjjKddD4o1dJjgMyxVJK1x9Nd1du8/JSjh19QQxDHqUQeVc36qU3A6E+W3hDyaUkz1Klf4oVO3ugcXYLNXXw4ocG33rf3mQQONpxbfP5+BytkVZDYZgFWauTi6qUi54D6ceCx1nXKo+RuwqRkmSLStgA/kOUbY8hKuH1zZCra1qXpjX3a7UFeA7242q84KBHjrI/eM3l4US5J8fZDBppwETJQ5R6DV/bIrW3EARqFqJ9xB7N+NZefGxzS1iRXrOdDQxZIfHp/WyTQfyyxUv6UxBfvkeeS/w69SQ0d6w1WS/214TtWSF5AEypegJeuJMPLlIQHuA1RUS5RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aG2tAObnqGVyXWs4nhAzlLQoN7HCq1EYScCcl7VH/s=;
 b=mv8013+Loi4XEKluwYG2NKCgwi0Lu+plFCtC01GVLxyaNH5EK9MIlAl9QwuqV1/rbAsjiMMGR4AM3YlWUEkV3GOfZb9wd6BbdhRpe+pvtZZDvM++/XrGqD0Djofy5LRwoynFTOuU+XP7Z7GNdmTYHRV+xVwDRpL0czLeAZwuK5Waxs15fUB8IPUwCQv0QhtdQOKlRJYZBsXh/7OLnllKHBY5bD7joxJdN6X9I+CfUWP1ouy3h2GY5NGmd3mc/4N3nIHEMRtmvx8TgVAn9ctcQ57G3u10veQk8nQY0e07Fy2oTgvYpdkac5c/W/E4R1s1qKS8hXYGF+ndLR3BDK3JZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aG2tAObnqGVyXWs4nhAzlLQoN7HCq1EYScCcl7VH/s=;
 b=RtWRvU9UQLTlcjlT7qRYC9OOWStY7EhAtPm3+DjLgb1XNrMUGFuWc625aKgf2ZtcIDYOnBj67/bZmGaS4Xap0KGLxWGad9nEzQPLMZZDs7to3yXAvZfWtSKIp9s/fjXTrwl/HaitritOX9TCe5DPu37c57foV7HxWt7GLHkTV3Ieo3luQGNl5Swddpaxat9ESzfEZdEMwAnNDxhiXZ+Z4coowkjLxd2sehnKUNBABkA4lT1gg0vzJvauNvm/HEqo+flr+KiQ94bnD3LMT6oYjQ+XQT1ByirfFmZko5yeGPBw3m3SQoINnKBdF/osTVpj6u3/Wk34HI4eV2BISEWKkA==
Received: from PS2PR03CA0018.apcprd03.prod.outlook.com (2603:1096:300:5b::30)
 by TY0PR04MB6343.apcprd04.prod.outlook.com (2603:1096:400:328::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 09:19:11 +0000
Received: from HK3PEPF0000021E.apcprd03.prod.outlook.com
 (2603:1096:300:5b:cafe::1f) by PS2PR03CA0018.outlook.office365.com
 (2603:1096:300:5b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19 via Frontend
 Transport; Thu, 23 May 2024 09:19:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021E.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server id 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024 09:19:10
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v8 17/23] ARM: dts: aspeed: yosemite4: Revise mx31790 fan tach config
Date: Thu, 23 May 2024 17:18:04 +0800
Message-Id: <20240523091812.2032933-18-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523091812.2032933-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240523091812.2032933-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021E:EE_|TY0PR04MB6343:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4695aef4-74ca-424e-4c0c-08dc7b09680c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|36860700004|1800799015|7416005|376005|82310400017;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?k8dROagPR4WwcLtwn7/OWMTBTMs3tSHdYl+dKjzKbEJIjuNjfMEykTf7e3ZY?=
 =?us-ascii?Q?6W6jOoJFzmpjaL+4U61HM5YyowU8E73MpB9GjLhDwtUizUPxsRF0p/fheb/a?=
 =?us-ascii?Q?egxILUr4UIbmDOcEHlxePxm6q2U+5WQpriKjhaZNJx/naszzrJLo02Tt8ZVc?=
 =?us-ascii?Q?mPkR95Dx1+MNf0RxluJ9B1CUbKxb1wjvrneJBWV3ACQpLxGKGmCXrAlY4TuJ?=
 =?us-ascii?Q?VDUDT8glXcyjCd83el5YShpBD7GIjewqQ+PfGzx153ofSBBftKVWZblOcJ1s?=
 =?us-ascii?Q?Xix309WelyyXKa71ti3pJu1wdKlbZs7tXFkt45QZEIaBw4mIjQ7xnOK33kf0?=
 =?us-ascii?Q?ejwbPfRxotkwLCmjS0kS3+fJkXMWyjwyMdApGRCau+zN/AVf7qlOqcFxPjHw?=
 =?us-ascii?Q?5R6ps3+PvtbUM1bXBZIlF3sdCPf4xZR4zCTAZXHyRnyQBgFfp0QApFyKLo9n?=
 =?us-ascii?Q?egMcLVF9iSByAD4/59/I+iD5ee/LlZayvYXm7ucR7LsDI9UStnSzGGFx7kUI?=
 =?us-ascii?Q?eYg3fHzrMmv0z+Q0QD+gxc/089ltri8nSzGMwO0CZdXn67hgwm37YrzNuj1z?=
 =?us-ascii?Q?BSu0FqnQRWJr40HzdeHdP5o79QeUnv6hNCFKUpVICRzg2aUMZGjBw7vIztlu?=
 =?us-ascii?Q?yyMAryMWPE2BXYokNXCZEXPrFQ/tmejCHaEv54LKcnktdmYKgcXDk00bAMjJ?=
 =?us-ascii?Q?x+20aPNAZ6IdQP8YpIqsm48QxN+T9tnzVs2hC1pVv4QZBD7Bq49+cvXEdG4N?=
 =?us-ascii?Q?vGFIWjDdqxxX8u97WqwhCgFQsUBsaZ0LZ26R8JB3G0X4HKSUfta3bBg3M/EK?=
 =?us-ascii?Q?7BnCP05zErxPQEedDnXlD2B75AiEmNCOq9m6M3sGyX2Hiw8jTWCoWjKOgsPW?=
 =?us-ascii?Q?BJfOcEIrJdVo2HF3a5xP8zr9jMuMNoPj3pdIdSoIMSuc6pBKSz8NnTzJaKuc?=
 =?us-ascii?Q?olSPX9LGwbGE/z5hoc2FhiTreSjI/e6K5EvNoSObG10JoGAI0YkQe8FUQitC?=
 =?us-ascii?Q?UrBhbSHkKgkbSR61fCKH8Y9TMGBTATiPbrL3dPZjaMw/kvVhK973709sAzxs?=
 =?us-ascii?Q?gBrIuJaU7GZ4QXNSxOe6UJZtPZ9I9KJufquQk1e1pIZmXxHDhmGpH33pfkMD?=
 =?us-ascii?Q?S+XDfTxQ72bxZTJtbBlTUAWLH0/wMP5v0PTOu6nkV3Dca6gDNG0mvzXWMBDa?=
 =?us-ascii?Q?u6zZLtmNrurgSubjwGSLTymzbY7HTdzAdOaB0AKIPlsghcqYarZs3vxCE9A2?=
 =?us-ascii?Q?8OUIlkszQ8oDQ6kskYnRsx4R1o9gB2W9ZVvlapyEFs4x+XhMnG6HNthNTpr5?=
 =?us-ascii?Q?/WnRbSwbMbn6pIY0MbyxC2Z3fH2nORnF2fOhjyx9sez4wPt3W29MZZ4mF2P6?=
 =?us-ascii?Q?XG9vxv6lR3aJ2YCDpSTYT/nfl+Rc?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(7416005)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 09:19:10.8138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4695aef4-74ca-424e-4c0c-08dc7b09680c
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021E.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB6343
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

Revise fan tach config for max31790 driver change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 48 +++++++++++++++++--
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 3baf1df11a81..59615a6958ec 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1103,8 +1103,18 @@ adc@1f {
 
 			pwm@20{
 				compatible = "maxim,max31790";
-				pwm-as-tach = <4 5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x20>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
 			};
 
 			gpio@22{
@@ -1116,8 +1126,18 @@ gpio@22{
 
 			pwm@2f{
 				compatible = "maxim,max31790";
-				pwm-as-tach = <4 5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x2f>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
 			};
 
 			adc@33 {
@@ -1153,8 +1173,18 @@ adc@1f {
 
 			pwm@20{
 				compatible = "maxim,max31790";
-				pwm-as-tach = <4 5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x20>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
 			};
 
 			gpio@22{
@@ -1166,8 +1196,18 @@ gpio@22{
 
 			pwm@2f{
 				compatible = "maxim,max31790";
-				pwm-as-tach = <4 5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x2f>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
 			};
 
 			adc@33 {
-- 
2.25.1

