Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAED881AFE
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 03:14:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=AbBhFBUH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0TYK2dCCz3vZk
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 13:14:29 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=AbBhFBUH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::614; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0TXX0CS3z3vXZ
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Mar 2024 13:13:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emOXueRR4Bq2NlE5t10N/mJ1qA23/OVKg5v+T9etU6Rs8dTsGq6nQWXC+guGO+YB9pCbD8Vr3smFRVmUxHuw5F6NPeHWx21WBMpJFYS1DnrDGorGPm80U4wwni6HEvqzVvouTzTDoKHCBoyjUp52FwNXAc2Q+d5Quo6EsammuUdI5YQYctxxkSE2Lht9Zc8x1Bbf9iQbOTyVJ6RekCyABs+LOJZzLUEJbZPUy80Jjdefc90soglDW8oMpQ4WYvE2HXSB9uiz8z54ZFqiB0ls72kkVcZ+Zoju15d4gyryQL/pAOCR0M7/zXuR2VFJOoA57J472mwpz12VRPD/MZ7oxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIGRINpXvZ/agGqhwhiOkaRypFxsGAOVYlXlhpD7bj0=;
 b=kZWIrfajvNmOdGzXDrzj1zuo3drnSgTJYe6XD07CX3V5N36ihZOk5/pw/cO4u0Cxaqcnt22Hipxe/uBVjAAR1+zJ8tR0QNvnJvoDC95d9uZDu+ZtGDiP+o4WAH2wJ47oHXRYsq3w+/ui52WJ6Rr42t3oWGa6sNZzE+wzFKaVk2iZ1cH/4Y+YIvDS0L0mjhD219hRzpt9/FyuLRY1BQ9qJB1VDAY6+OkRU4MlYLNXy60Csg/XaVPLvfErlcrioWHo0HkBUuiVTuGqD9ZQv2M4RVv24cEIw2m/nKxdBUC7H0hQXahH0KoVLrAAd0o+JeaexeWGpIMmANQ7kts19BeyGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIGRINpXvZ/agGqhwhiOkaRypFxsGAOVYlXlhpD7bj0=;
 b=AbBhFBUHujDEEq541cKhs/DWNmPfJVMixiky8qzsUtGKHwR/29BEKKOcZDcuqY9ly2Z2cFY1FAfESTEqnAtrFUKVOo58XFAjTd6uxBWQgyc6vBJOMDgyS5zj03e+iSt61LLarsL1ToZ0z5WXY+pO9f0/GUlCuysKMN/EzfJvoSXVk+xf8tEEAKa6yJWnYaqkvSd+YpEKog11n9zQ7r2FyKHAn0PCD+MF5hhYwtc0zcSyJa1yITI5ZjZrKZsFCoPMA8TLutsi3aiJCWxe5y/10VCWENOxx5MKEY96ajv3Ols52PWylpg91iCB+zohN5c4UZzMQHzi2q303ljW6SOzdQ==
Received: from PU1PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::35) by SEZPR04MB6172.apcprd04.prod.outlook.com
 (2603:1096:101:ce::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.35; Thu, 21 Mar
 2024 02:13:30 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:803:15:cafe::3a) by PU1PR01CA0023.outlook.office365.com
 (2603:1096:803:15::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Thu, 21 Mar 2024 02:13:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server id 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 02:13:30
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v7 17/22] ARM: dts: aspeed: yosemite4: Revise mx31790 fan tach config
Date: Thu, 21 Mar 2024 10:12:29 +0800
Message-Id: <20240321021236.1823693-18-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|SEZPR04MB6172:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 19a930f1-af41-4b74-1ee8-08dc494c80a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	SKk+PfKOzpzlAVnpKOtc8ap/k+0ISTEbuVswvW/LfnWTice8NLFWydyxa0QcbZvQduFsl4BcmD8L5AVu8T13oXos6H2pEm/q796j+JL+pMhmAmtc2zFg2NpHpwxq8XZIVWttqHiUIaCRPjdaI0aNYqS628LH156i1BAxpBcrv+bF/NaYjG4iuTe9o1o91Bwx/SNtp2vPsuYAwMgWk5n0a+kZD258qmw25QzCn2Aai2SxqTUz6qwEMpGU6hSffFmHJM883/USMPy6HxHEmqqS9jco1AuihJWoDjjaruzyl6nqtQutAepr3f9EvaLos7bADvAyDfNS5Xpck1wDERNEuhj0q2C3eFhvHOMOccR8RSGXYESdPAvS6bfCoTwRBZ/qPyiNgZhhSTrf+m8ydVmP8DjtWITRfoYT/km6pQVzZ1EHrMJbwmCZCc5edN+5msVB7odr3OAStv6sO6t7LPWGYxcHFrJLUnQQ/hCI5BY2T5vI181iRnC6nBi7m2WE+pTubaF8qdN9WzV0NevJGlVtNOmnjMKKKK0jWI4MBCI/7o9NWXUtebaa3P+lWvJvlUjR5rJ1AuNgTFhBL9eLmS15PMlY7QjrpKg24FcCjfqqdFQBhk3B9pWgOUsfa0Ihg3AaB5L9tY4LViFhIcflcpf0pdY67EJ7DFqOJcl9EPKGk2jgl+2R/4CK2hfDCWeQSLHAI5snflK1foLEo3wn0NjKE20cQHcx3UiZHqQGujZTfX4z36dWrlFi3fDEBWCCrRgS
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 02:13:30.2292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a930f1-af41-4b74-1ee8-08dc494c80a6
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6172
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
index d59542a9ef75..e0ca0f7b65ea 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1095,8 +1095,18 @@ adc@1f {
 
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
@@ -1108,8 +1118,18 @@ gpio@22{
 
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
@@ -1145,8 +1165,18 @@ adc@1f {
 
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
@@ -1158,8 +1188,18 @@ gpio@22{
 
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

