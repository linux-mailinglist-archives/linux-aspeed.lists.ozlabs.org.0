Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6C8937390
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jul 2024 08:01:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=sl0VYhRn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQJvm6njLz3fmq
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jul 2024 16:01:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=sl0VYhRn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::631; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20631.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::631])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQJv06fZYz3fRw
	for <linux-aspeed@lists.ozlabs.org>; Fri, 19 Jul 2024 16:00:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZiwsFN20AdA4gL6BJSTT3HmMsgw8mAgg1qPYXD0ZO05jG2JmnU+TNadnNm/2c9UAzQlEcx4Ce6baREhFZNXvSOODjN8wRtjgQnodzlh218fpNEbJ8nQTkHhucgNb/yjdPeUsHyKNrTlFqFn/hjRSChYur6Htak/YmBBW9dLkscbQR5byJpNC5EtCQzOINVwUtV9XNvD39bLsFNylQYJUxzHpxm8Pg/ZktphU9PjGYVtB1qEVkSRsNMyVNkEhPcO0YOuw1Z8/qnRicZ+qOJwE2meTqIrK5VkmYCqJ16eTZebcRhaqdfnJ6FfMAA9AGLHlrXaCxS9hmgeoT8EQZG11w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aG2tAObnqGVyXWs4nhAzlLQoN7HCq1EYScCcl7VH/s=;
 b=hWlicmnCaI4D5SEqbpaffebXPAi71sEqiVNdoG3jH/mTbSwTJthm/DFIYop3QPcoRc47D1KkIrrOv/GFdQ4+lBPb3ffffCed21YNwR+hQhXSvkFul084zHWJ/Co4Wel7+xOhNmnOdAuqdPgQ1/I0gCzsIAND24X6Ai9+pyLjpR9GAqX0uy73ZoJGldfCWDAXs961suczI1zJv0J6e8QSXuvjtHtSq8yhG4VAeu/o5Sg+dcg/rWW/AvCrNlkRVeREBCF8sfETON7T6d0o48gPMixp9+5EinnLZcd2lHJBSnIY/JK6/DEVwr+wjLMvnd18wf+P5Ps+AqF9kKUxhJ0f6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aG2tAObnqGVyXWs4nhAzlLQoN7HCq1EYScCcl7VH/s=;
 b=sl0VYhRncoc4+Z00mj3b6DXOSGYWh0S0ZhOijMu8RfRx/u1/lnIMduaLwzW5FClBqOIOUwNGuTilrspdVZSIKElYATD9vqnQO0zyG8gCRkAPIdR8YMEoHElF5cMyMsFOINNY0Z4OiQCVzJAzVh0+rIjqCzzM5rlvP+TPHyAVpsGACtMmHQ+0anh4nHTg036Y+S7LhGLJEHaqjvHy/MAQSfqGLsS+KBaivCwErKUcZIy4Lurr9y2Lrdf06k3laQKPuQT4868RFWhXYRiBnGmSdsYRjXmqAJtTQKR49KeFgByb2XXuwSwPTz2swXm+TLf6ur3jviPpdqluoOpKx46KPw==
Received: from KL1PR0401CA0033.apcprd04.prod.outlook.com (2603:1096:820:e::20)
 by SEYPR04MB7646.apcprd04.prod.outlook.com (2603:1096:101:1e5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Fri, 19 Jul
 2024 06:00:24 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:820:e:cafe::64) by KL1PR0401CA0033.outlook.office365.com
 (2603:1096:820:e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Fri, 19 Jul 2024 06:00:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Fri, 19 Jul 2024 06:00:23
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v10 17/27] ARM: dts: aspeed: yosemite4: Revise mx31790 fan tach config
Date: Fri, 19 Jul 2024 13:58:46 +0800
Message-Id: <20240719055859.4166887-18-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240719055859.4166887-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240719055859.4166887-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|SEYPR04MB7646:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1b2d9546-cbc2-454f-c2b5-08dca7b81463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|34020700016|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?v6f8oMhDgC2gNZ6O7xe2hM9O8MR1+56foZ7YAls6K8QuETa/bv1+byB4Q8lr?=
 =?us-ascii?Q?ubftmlHXdPdwYGV63qqwcioAZHDzRhSrWP3M1LQzcwTrbzmXMyyiTqdLyS6l?=
 =?us-ascii?Q?0PkCu+29rVfyZlEmD4ZzsBatXmScjcLM3dUQ2hiQyaY8byPpjkXkm14BT9wu?=
 =?us-ascii?Q?KcESextoIeM1svo2Pd+DokgibkJT1aya++NLVv4/26ssPHbcNcrLh1tJTX0z?=
 =?us-ascii?Q?6+L/3usZSZ0+J5kY27klAFVN9gJHO3NZmLfCDMcqe9nBIMtjsJHrWgk8HAiu?=
 =?us-ascii?Q?saM9YaF4zdXFlzcASrc/y3R2WXNqwYvaXmLqb7qKYlJ/uD4pAhahANaRZYe7?=
 =?us-ascii?Q?w0r5JGwwpdcIruejOhPkYSwmsCmqDuylrkFevslexKawNUF3bNp0MNSPYYYH?=
 =?us-ascii?Q?ESikNviO5txX7RdEgP/9zLeg2HUQ2g1ujoM4CPbu8orbnpK2VL5v96kPpHwf?=
 =?us-ascii?Q?iShgbTv3B1xtUlW/znD91g80lF7g8PwjlJK3An0rxqsUP/7zFwpG1wTxoaR1?=
 =?us-ascii?Q?Abj/wtVoEVeIThap8R8Kn9M/Ly8lYNVQYAJdeY+qMsFoJeMCGMuTQG3lkgHo?=
 =?us-ascii?Q?0zTXWA4ImIMLV37shx7G0MtLMD6dvjotRkLS28oR0faJHahjl1+Qb0cAKLtq?=
 =?us-ascii?Q?IPUwNKUh2REiGYY7+8XPkZpDhxjSGZn3ItIin3SgxvBbN+muUj5ZlzMNxdhz?=
 =?us-ascii?Q?7jd7m29TMnCBmmn92E9rp6VXXOSzG81UrU3XQ9/fx3QRYwiUpLkPbIzKcgC9?=
 =?us-ascii?Q?tc2idmkuQO82FsBFC8bM3ulHNg75jTMKO3PwI2RsNJZrFh5roxJ+D0XFQqpj?=
 =?us-ascii?Q?yHhXvBqpTNlnAMtDPFCRWsGtYRV7HzBVRlmNmZ0iUb9/QJYEABYkWNA41p+b?=
 =?us-ascii?Q?BDD4u5lXJCSjnDKF8adngqw1iccamWliJV7DysL/QT40bLW0PWPI4sPWuToG?=
 =?us-ascii?Q?GCh0BIOKVVMWfu1t6iWjx6xvSj1izKPe+Z1gTTXD5BpdhvI5hIR6COGGXJZm?=
 =?us-ascii?Q?/BHsJFgIhaq8xDGoZGHyz2uBlxxiTA0pkHMiVMwXu4Swot746G8AXeHUPPrs?=
 =?us-ascii?Q?yJTIyzLfTfutWtNcN4+UZd/Nbk78PyDXbRje/LIygTvM9S6q8LTqGrzB03Ho?=
 =?us-ascii?Q?oBF8aYMBcDYApy935o6TBWYF0uTAtb4kWqmPKModOy/qkl/Fp8NDXTjEiLla?=
 =?us-ascii?Q?sIl6W5xozLqpPQh9hO6AjviI/rg+BljEy5Zdl05AXA/S9fXm+WCjj/EWgNs+?=
 =?us-ascii?Q?/ml2kjwMJXAe5PnltSKfPFYUh/I1gEvCNodQ4u4RWnDxo5qnJgkaybcgFptS?=
 =?us-ascii?Q?nJ1am6mh7ctaZ1ysQ1zgQ2Y/dcc02UrqSI6zRpdy2x/QlDX5gWHGR9fTdSYO?=
 =?us-ascii?Q?VsWNJqBses+N2bOcQW4qT1q9pGYt7/MY3HgqYq/MmHXJThgCq2wB3MJRAdFy?=
 =?us-ascii?Q?oRDkgczZ5al8sMDRhrLv+oLbGfq3mqCL?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(34020700016)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 06:00:23.5171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2d9546-cbc2-454f-c2b5-08dca7b81463
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7646
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

