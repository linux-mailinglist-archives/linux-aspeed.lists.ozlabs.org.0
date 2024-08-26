Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C459395E890
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 08:25:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsgfX63Jvz30TS
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 16:25:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::612" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724653554;
	cv=pass; b=eFwBR713vcz3tYeHetLcZIiINzvZkfin+2V1Rlk4bDJYlwa/JiXJFBeT6D1wSuQRIy3ByIad0jzlqz9H2qritMBju7T3viz96lBT2VjN4lKLQ+XlnELcPjeUOQTN+TOkK/S3NftuTe1AGBwZiWsz61SM7d+hCvDOK4q1lQGgwtiH+sbbTbRk63uNVZ+4EYfPN/zRqAOnHKoA24OOS/hVncl+5XH0Css+3Sb2znZU7nexY00pchy/LOluQ/jsQTp4Sj0sScZ5G50Rdk+hkBHfNMKfvSzVyhk5AH4j1t/jOHt8WBqVg8LpYunGg+pn38Lq3SY1XmS/eP7L85XTCoC8rw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724653554; c=relaxed/relaxed;
	bh=hgFXoaC/5DtSawXO9Z49kR8+2OHTKZslFpSvIDp6jkY=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchan
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=y9PzwNaK; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feab::612; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=y9PzwNaK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::612; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20612.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::612])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsgfV3jkjz30Kg
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2024 16:25:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGe+CFPRqj0P0x6ZICXZphOATrv6z8bSA3JZIPlserZcCjqC4j5RSEMsXoI1aXebeWV1NZ1gSc2ddeJeQYZQhAcOs7h0bEmge4wThIA09zSGpeReuS+KxartdqCP3MR+eVEIBgVJ/7AkxOwPuONTQISCNm6miz/CVRzhus/IIFHrsArw2D9ZbXdu7KwZugvzgkijcYOfeovsyHiE/g4ST93zCRlhnIEd32NtTS4q2KFI3ovj5gmP+Gcfhn4N2WYKIW0Wk5zq2Us8D3H0bE6ILTIiB1OTS1OzsIE87JwG1MqR6Tdt9QW4zXjueZpTYKCUhlw5N/rwgBMnnzhsal0/qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgFXoaC/5DtSawXO9Z49kR8+2OHTKZslFpSvIDp6jkY=;
 b=B+6Qbb1mzSnWzV0jkNPhwo128PD7jvMzzU7s5SS0P23uk5w8f5AG3UCTjVTjd5HYRVWk4hDwTvfWlB1cjEYh1KvM4oqFSNMpOMRM2heFYlwuT3JHGlmiofikIsUT9D0YF7Q+Sr6FFYl1ZQ3Y3jWftVPc51dS4Fh0yy3+EHvTodRZKZU1cH2ODdiCz1085dBh2D/q9tbHSzMoxPxb0sgMKv5vEArrJvLyB9XDxvKnWfX5hzrn+IKRJSHzO3bLUEbZS56DohSzLC/YFEtn3UeuGjsXkCuuISJSOtDGjqLBOTInZqYYEQR4Dm8Xus0GqAam4oWMwjQG/wDHDc0OQdnoAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgFXoaC/5DtSawXO9Z49kR8+2OHTKZslFpSvIDp6jkY=;
 b=y9PzwNaKrqzniQpcsJp+tcf3a8pm1l5LWxJQgUSzIFDQNWSUaqfSvFK5nn9/FDJDcRJo2sHpXv7auG8o31wdIpPH2inUx75p7OxNHTLS2LjGEZz9fJfyC/+e4/i0txYO1AsMwmNqBLHDc5NkpszyNAiFV233jhIjkcbgkavdMuuyZuAb8QzjPx9/YTz6iD6YGj6pHAE8HcT0sWeOSK/SC2zd2ZnhLmQiR1Da0IW6vw9vK2QEgaZ9dJvQwr3fmsrNNwhtk7IlYzJy8z1/LhbyVMW1d12WqDcdBoxvkLKrK6w6Tgq103OY6YnSCxj4psI6z1gmu/eaq1v6RdkfxJHCVg==
Received: from PS1PR03CA0008.apcprd03.prod.outlook.com (2603:1096:803:3d::20)
 by TYUPR04MB6762.apcprd04.prod.outlook.com (2603:1096:400:359::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 06:25:33 +0000
Received: from HK2PEPF00006FB0.apcprd02.prod.outlook.com
 (2603:1096:803:3d:cafe::9b) by PS1PR03CA0008.outlook.office365.com
 (2603:1096:803:3d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14 via Frontend
 Transport; Mon, 26 Aug 2024 06:25:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB0.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 06:25:33
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v14 17/31] ARM: dts: aspeed: yosemite4: Revise mx31790 fan tach config
Date: Mon, 26 Aug 2024 14:23:51 +0800
Message-Id: <20240826062408.2885174-18-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB0:EE_|TYUPR04MB6762:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5392848a-dcbe-4c7a-3d85-08dcc597e3d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?GECzBovjanqY2iN8+pr7d8glJQSgpeL3Bp99U/ayjjbM5K+BMLdBNMWaatzv?=
 =?us-ascii?Q?iFv5ESgXVio7SxL88vksa9HBQW3QoeVHd1sNm/q6x3xsqmFHgZjKTVFA29vk?=
 =?us-ascii?Q?pPR/HBKxi6SCZgcuy94tylLYYyn1zPAKuWAtC40y4SYO8rFIPapC3YPQo/GP?=
 =?us-ascii?Q?emUFweYRHL5TGXxPQxGIs2NYnyDDlSBM2Sw6+LoCyPptZbDgswenKqPoUDYo?=
 =?us-ascii?Q?poXIxwBHRuWOnrUs6OFRueXynQnret8sRZ8ivtcrDhtwZmk2+k9Q6mwiie2g?=
 =?us-ascii?Q?9b8zr9+pypji+b3NjrO/PaxCScskAO2nq0XveWhsc6qRGPpVYz9crCF+XsF3?=
 =?us-ascii?Q?HwA6I3jGPISsMvtdiL7CuMd9Zj2HVrUj3f83P8FwYMYg8+elqZX82ByfOBi6?=
 =?us-ascii?Q?hJEke4WwPYLKFCDcvhp+6mbCdpRSu11safuVK7NTiiccUOauyi1jdgKUPbZg?=
 =?us-ascii?Q?fCfqNuBHVfM8zuv+Qh9zxTL7Kwt+dZTvg6cWe1ztBJhIfiB4pNU+1JyHfDSB?=
 =?us-ascii?Q?t/0zAH37q0qJqTBcyeHET71w57SJchP802pCz8EVIKvEP2d0Iv4LP9dZAXaf?=
 =?us-ascii?Q?XFRvE5+ICRbQaWEECXzZB39RpNyINzFdfmZdJzZB9vcMqMAaGgujyeje+KF1?=
 =?us-ascii?Q?UKLS17YudSI0oJEqrYi06/KY/FZDJVnR+9kPsEVYvvM2ThQudFjUTzB0j0TV?=
 =?us-ascii?Q?KYBqvg22Cg+5vPzWc1Mbqh3vIS5cn1rvuAggaDshfEF/JZa8GJRhnBhf1xMo?=
 =?us-ascii?Q?IRG0nePATvme6Fr6HO55ZP80n4YEAtm8ucD9twNea44cuzlN9PMXhsuKZjQ+?=
 =?us-ascii?Q?UUySpGkUMhzKeLqB4xPDy18GI8hUB/LN1jrIf/gtBJtkfzM7HTmRe3ntMtK8?=
 =?us-ascii?Q?2XJx0pv1sIIB8d33Nr4bwM/x4xMC0sGnLgpJdUOmtxnIxJcqElJsyTkrGiyl?=
 =?us-ascii?Q?y9mrUaj+tJj8DhDDI3KlG35E3LF7vw4ZjBjewGGolS0XtFczJPcG0QipbUng?=
 =?us-ascii?Q?XrfVc95B94YeWGcnhtix/Sv3moLIroPAEVUsvZOdMqPYsedGbTzyyHBI8w7e?=
 =?us-ascii?Q?HEUsn5v4HEBZQlbtbf22eWT4JLYAuPRDmsYI/mdYvigK/QE6tXyd8W7UAD2+?=
 =?us-ascii?Q?EpKJPbFx3zrOSQGOq8XTzR5zH/pA29UkF9AL0+Y5za613PNhWCCYBbjr5ODe?=
 =?us-ascii?Q?CQcsGMFcgqpoPaWhwBouQDnpiiJuYY4zRQyueVfoIYSyk+IOKCcvhzbMG/gD?=
 =?us-ascii?Q?piSeW2VIodefbT8RPWYBJaaDD/EHQayX91R5rqNwQ2H1CBowVFnfDFcRJCFw?=
 =?us-ascii?Q?BrlB78RozOs778yQMa+sjK2VKcQ0zhf7vIW2+CEkqxcFoVN8RHnFc0lSofm0?=
 =?us-ascii?Q?mAXEMTKwCc+0oi6GtoYWJKLDlt/azBiCGawSECDyCVll3v+5XYdgxZHuQKj5?=
 =?us-ascii?Q?gtBg+JWs/3XFMeESnNOksj79HD906fzL?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 06:25:33.0338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5392848a-dcbe-4c7a-3d85-08dcc597e3d4
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB0.apcprd02.prod.outlook.com
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

