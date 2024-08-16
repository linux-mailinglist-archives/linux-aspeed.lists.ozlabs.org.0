Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB40954584
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 11:25:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="::1" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=mTIP82li;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlc6k0pmGz30Mn
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 19:25:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::600" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=mTIP82li;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wlc6h5FZHz2yft
	for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2024 19:25:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/5wgz/DEPjU/OVffHp5EC0PMugjrAt/oSdoSL/sTfzgcG8DW34ss5vU+T9WAcI3tZZHAGYuXNXvhz3B3S/ZZZrc2dGEsyj3pUyu7WaZ/KHQVaC8KDLp8b013JNKliw03a4e0A5/irdErpwDuGf5E+/b6kwu3pOS2TMcNFl6foYcBzFFHuFuPgp1cw/zf/h5VwOaUyhQa+FW4qI6OQeZQmPcX7muxz+Lj3Ze+m7EAqdmE18SlmINdgogZ+MmOQkPIUXRQV0PxyHp+0MYHRytfy/yb3sKyx6MaumQ3jTD7rcAVMpg2PjA11chHzLHoF53dnLKF5qyC3GBosZcY50xdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgFXoaC/5DtSawXO9Z49kR8+2OHTKZslFpSvIDp6jkY=;
 b=LXdZf+YGpHSykxuxA5JfAdCg8yEWDrCIrnRXAD6DQSk7fbU0DH2JRG9DejfGsosNkOKKkndqOQCXzvRqRh1O84bEJSVog8FKgAPM19iHl/shbHMWvmOGCWuBhyufxDldSmt1Zcdw3CpPhl+qwJ5O3JkmBywhmEInEixcCmUPlWb11aO64vBF3iC8k3mBrMfWwxgrc5R/UjD2GorMfC7nZ2a4tzaFak/fuFnudbmMi5xlHxmAqYQp50whN+5VH3BceH0F7aMrA+x0SA3ylC5+n0RrO/Fx0V1aXT9M/a7BOeVgWdanxfZwtzSGBSW9Bm7XxQqP9BSU6XnkITwSRME4iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgFXoaC/5DtSawXO9Z49kR8+2OHTKZslFpSvIDp6jkY=;
 b=mTIP82liQBdv8UtRfGALcPpStI9OePVtBkZN2oc6wAhHbjmakF4F5geYN5qew//PxIez0gFxkeFLcX/Xqgah0+m+ogRaZHLLODGYEyPcjPOtqgoqoLhSvSUUQl0hVXoRWbEdkQetgL+4ghjsrI83uz5NCRqcQ+4gGf7MAjzQUzOAraotby1of7DSyffzlfasAqKGZ2jtdXDuKdBDX4xn84QLfb4nrtp7ynngnb2kQpip/D1vlp3ILdHV0alRQvdtoziP+zBW5kK6QQSx+FCn1mSZ9L82AS/oW0E9O28fSd3V0KFZKwSntVFh6saPsDaQGVnGRtzN3XLrJsoo49U5jA==
Received: from SI2PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::15) by TYUPR04MB6762.apcprd04.prod.outlook.com
 (2603:1096:400:359::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Fri, 16 Aug
 2024 09:25:43 +0000
Received: from HK3PEPF0000021D.apcprd03.prod.outlook.com
 (2603:1096:4:193:cafe::84) by SI2PR01CA0041.outlook.office365.com
 (2603:1096:4:193::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19 via Frontend
 Transport; Fri, 16 Aug 2024 09:25:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021D.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server id 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 09:25:42
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v12 17/28] ARM: dts: aspeed: yosemite4: Revise mx31790 fan tach config
Date: Fri, 16 Aug 2024 17:24:04 +0800
Message-Id: <20240816092417.3651434-18-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021D:EE_|TYUPR04MB6762:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e813346f-8c5b-447e-cb29-08dcbdd566da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|1800799024|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?LrDwL0bgsuEHZxa/JFEv3iurI1X4UGv8zPPk4FcSOSLIzLAF3F6ATh5H/HSY?=
 =?us-ascii?Q?ZsJchLIvubL5Xjyc1MffFEu7NOBd6nt/I5Hn5947t5pwARt1kfi9FYLGpksZ?=
 =?us-ascii?Q?OF3U0MOJBiIhkj6ZL4lOoMsOKIqHWVwu10dZ0GpPQQtOe5Eo3/uXSW5pIfiy?=
 =?us-ascii?Q?/UBufG/mFPlJhCWsgDJZFQLkNl/4X/9eAOsGziissRjqUZWXKooqURIPcpna?=
 =?us-ascii?Q?gtb3sWg4key6YJkGZYdKbbfupoBlIvA63Nzp/BLNSEhnfSgqrTxeYS5i0aQ7?=
 =?us-ascii?Q?FJt0tUPg8v8bTs6TMDFpQQQOi7+/GNlXAprTopBFqJuu1sqamivApw7uR2wa?=
 =?us-ascii?Q?WNXDxzhJKNNinSwIj0ynBSE6YzgVrbZt8bvIcfv3hICfY11mUBC4hd5Lzoe4?=
 =?us-ascii?Q?U5xt4zq31EXqgb7PlHwtax3aSULMrEcvung5Nv7TMDpH81CBAkDwqGiBSf4Y?=
 =?us-ascii?Q?lsEInFQ87rpM9ryEBfVNsjzXHlU3cEC9hau2bvI8XWeEqMhZtLi7N/FKysn0?=
 =?us-ascii?Q?S1UFk9c7PlOyPafoYZ+rzouFP61CIH4eHG5ahQMcA794JlBoSY5dOgi7jIjQ?=
 =?us-ascii?Q?HtQOc8B1TiC+2RITFXhxKPgjUhrL8VsOKEAmhfUavETqjSA/PiCvpNmITSaE?=
 =?us-ascii?Q?nZs14hPjtrxfNmZXxuq7iugPdQdA4QT2cOkq8I6FU5Z9uNdLsWR6/2a7PUBj?=
 =?us-ascii?Q?BjkYxg1krqdU/ZMe70D8tvI33RVFInqJ1MeHsYlkB8JOmsY8XLcoLNJRHrjC?=
 =?us-ascii?Q?3Y2gFwjg+5KqX8DF/rm46OHexl/+HmtWaxYZV81bikbKYcVVSFb8+2P4R0p6?=
 =?us-ascii?Q?WrmfmYPtpl80l1nqSBufVcBJP8KkMn+qzIpjSYUo7XTsiKoZ055Ed8xGViWJ?=
 =?us-ascii?Q?RVaFe9DJ3XnsmRN9YBhCvgSz7u2oy8UROXscxq+ySNs2pFzO82d9MaoVSYRC?=
 =?us-ascii?Q?FF1Uzflb0EV2/zkg9eXW8T3ZYyHh3nIM0mTQDYea0Iv+ZkwniyAe5Ny5YTia?=
 =?us-ascii?Q?04UvkSbpqa4QCo8FkxPjLZtzASgn+xmFUMt5+yCsrUHs57XNS97c+T5WmbAT?=
 =?us-ascii?Q?DL+xwKSJdkTjFmZMK2cw7/Sh6elC35F+TQu7ws1+AXM4AxoOGrMGzLCvpNig?=
 =?us-ascii?Q?tZNomXIb+jMYEinHTxyH/NYrngJZTwcLpgevVGcwPCYK0CzT21uOqc3MzCfY?=
 =?us-ascii?Q?3JF6THfjFqtzba/38HMi6lxmo1nlBBxh9GT9wEATHPq3DajN2cDLjweyU1I1?=
 =?us-ascii?Q?zag00MYvCm4wtA6jQPV8gvbpoVySejqV62h/Yb703k0zvubLUdMpjVZ7KxpD?=
 =?us-ascii?Q?PS3PvuWm1F6YxIDWsd1QGICpVpJCxC8iKGk4Dw8eEpvG6ZPiY1VR10yQWTMo?=
 =?us-ascii?Q?38wkHoCF0rAfPVRYySMWWWuCwRjnBdlOaUx3TL1Jb3NR5LbCYFAGDk/SEOuF?=
 =?us-ascii?Q?Hy99UzLS6hEbkoZ1w+Y3Ei8pCFu8TrhD?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 09:25:42.8878
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e813346f-8c5b-447e-cb29-08dcbdd566da
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR04MB6762
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
index 60743f9829a5..b46a0b9940e2 100644
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

