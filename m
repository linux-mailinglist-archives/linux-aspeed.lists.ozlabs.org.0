Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3123959751
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 11:43:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WphH46Sgwz2yMh
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 19:43:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::618" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=pF3mt6aM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::618; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WphH248Ypz2y1l
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2024 19:43:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftKToEFBjn9tFV4Ljx+mvMjdNEIheVy5Kw80hvW6i+vkG2EQLfAeffcN1dTbO7CK1amMaswX/MXsxJTL104P1Tao5rzcF2uxBs8qM0n5FDcXeWs7pg6uRp1g1tgqIiJ8PRvTOtE399FF3e9R2liT0tpAlkQ5IOKf2sL7kCwCpytrxY1z2wnyVkNeKY7gf5GGQj8ySmBKeMsttYmnCIPxaTI2EBtVNQxIA620QUykAIKljA6rBvVmw+kbeMg5vmgdPFTwJPSLxhi/uXb15Oifv/SuyLtXD8ongSkhn5tRd7WfNCHLO3OTGIKQBX8b0EnIIYt9MzueYUqCYy3zDapRyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGEY6kFHCr93vzQaG19EtYDkCI9Rttn+5U+iGfkqrRQ=;
 b=op91nr7QVKLnhoUzYWftSE5Zj9LcTH7PWMyDgTNPSBhh1aHp/jkTDb8p96lpdssUfBNi8iZ2nKodtIo6E0hBEHJYnj3wRzEagPVReDEjV9EEQE1iaEXPZhUOyIOu2AUI4vP1gD0LitolWSzb/CD+LMCY659L17m3Zuc/Y91cDoVXqllGt2qO681ayfqlCecAWMrxetjOw5LqYd5HdZ7gaFbUMUL7RiW3DI+pGS136TcBLQ4ZmNiBGqIuC9/RWCSyDrJqd7MwsPJuz+u1G7s6xbO8msg8oCDOhIhMvSljVFCqu36sL1lOIhNdxXlPwLEkIM8A+Ow2o7QjUCTZZ4jG/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGEY6kFHCr93vzQaG19EtYDkCI9Rttn+5U+iGfkqrRQ=;
 b=pF3mt6aM1lGWqLN6BgclFR/iT5VKHfFIIjmdS7MBFUWWbN7aZ53qoC4q9o3opHfrUV7s9uN0zVzdV8fJfMIqEJOIlzkTSosImkLXoMl25qSrWzCfaLWq93St86KjDoHiQph5zd0Ai86AtL+uelyi54EKBz/VVp7YL6SQ+6dEAazuI/iemKnjqw8rVCQEQ7ZS9wzGE/7LWBnoiZXatQrO/Xx6GnLNCG3knvZHKmtyDUB4kL8bmXKvls0wMdMKqi9hNAQES7J7QUCG15skeU6uKVR5vFbLJgDpa7Z8Gq6v5KKU2LEg0uFpCxjcCXHkbGlMjfSXcLdaC2G7lPr64Z3lgA==
Received: from SI2PR02CA0026.apcprd02.prod.outlook.com (2603:1096:4:195::19)
 by PUZPR04MB6293.apcprd04.prod.outlook.com (2603:1096:301:102::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 09:43:22 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:195:cafe::88) by SI2PR02CA0026.outlook.office365.com
 (2603:1096:4:195::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16 via Frontend
 Transport; Wed, 21 Aug 2024 09:43:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024
 09:43:21 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v13 26/29] ARM: dts: aspeed: yosemite4: add MP5990 support
Date: Wed, 21 Aug 2024 17:40:37 +0800
Message-Id: <20240821094043.4126132-27-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|PUZPR04MB6293:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c7f2c9ca-2c77-47ce-767b-08dcc1c5b24f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|1800799024|36860700013|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?XsnDyeY4NOJVTsHffSzmSpnPvyBnsyulqw3Toe+8MULT2i1wnlNxeFWjo1B/?=
 =?us-ascii?Q?yRVUIodZa3XL6Bi6T1Hyv1MKPmAJJCGKsAbUMKdiB1JFkvvMwM9HR3BKYz+b?=
 =?us-ascii?Q?Jx7UZwPMT9vjn9zmuHWBwloX5JdXzOu7qO27LjMG6T0oKd4WaeyqxbLsiO1d?=
 =?us-ascii?Q?g6aFTvn39q4XxwPl/sc2GK1EQZeEFPaWVwJRx/tZxS3wakQoP6JQNByKEGan?=
 =?us-ascii?Q?K4QqUaBJaC8rJwgGfqtcDTvxY7BQ9NT7dupbwPJKEIzJh8b4ZnDKmdlquObF?=
 =?us-ascii?Q?Niw8ay1TVFEbP38YgsadcccLdQOJxBhlIwQr5Fe/Bsw7aFP6SI7d2Xf/3PYi?=
 =?us-ascii?Q?cTtiGEmdrynJpymoT9Xd5fzXTPpBFGjtMwXGvrayJ4jtJO+TP96FGu2c+ZFS?=
 =?us-ascii?Q?JbCqxV5fmWXioMmLepjslrQpRfDlcJ31SUPtvO/YJ9MAUJTaQnZ55ZN1Hnu3?=
 =?us-ascii?Q?qfqTdnbEenULtQfw1SkQuq3YooosNxcj0oGk6+77PDkJPKiPUM3T5cP7GrVb?=
 =?us-ascii?Q?itrxu4XSqr3tDSt4edhBCNIikd3u2+Yd+07OjKGsLQV6uww0oH9HjslmHwFL?=
 =?us-ascii?Q?wy0b7vBOXGFPqAdjEMtCL8Mw8Ovrt/MG41y7s7jHjmtGCG/jhRgJtFDVxs+o?=
 =?us-ascii?Q?9lMmfJOIe2QzVWN911qJk+PbourSXdZUOckJ7Cep+uY0hn4pFNaR56NKutYz?=
 =?us-ascii?Q?Qkn+Y3P19ivTUrJ/QItx4wOJo2ph7yEGNbzFx1e5ksuWbSuYu5j6AAse/9WL?=
 =?us-ascii?Q?Pisc5KdJqYc63+7YJC/N6F07yzvWrlvbeqNmGgy04NZR++uD+WrpvKAwQtjd?=
 =?us-ascii?Q?32iX3gCK2Lan9SfqYLup4m57yP5ZmuLUEjCOEyH6VaDus24AiEeOs43BzNbe?=
 =?us-ascii?Q?7UhJwppllZxHf+rzlCuF2FiqXiI7IFCukQYF+JXqr1C9MZU4xL91AdDE5IdU?=
 =?us-ascii?Q?KhKp8vgHwu/sdbIEP2lr/YN+I1uTOUDasGMKEz7xizTiAj4w3QTHDL4cFPSC?=
 =?us-ascii?Q?ZyjyVsArutV1VFPc1SQHg/NHPSdFkZQPjGMuH7hJFLHJ8z8bX5XMcTaa5cIh?=
 =?us-ascii?Q?Dv5zc77F7Wwjon8ebAgyBmyPiJh4fupKpycvR6KLtRXL3qrM1KQLJgcMtKIi?=
 =?us-ascii?Q?YliyouDKEwg9ORCZaTno/DtCmU9OuB+LE3Rm3gM0vidimfkrd57OToYolD2N?=
 =?us-ascii?Q?8IPMKsr189x7Xc85mk1F688EXDDCmQEtFXvXtJLcmVddUk+al7tTi1b41Niq?=
 =?us-ascii?Q?nYscmcvHNmKQiewtDwo/tMC50mUaN1cnAccvtJ/sB/FVG0EoUaU8ZEoT/RUr?=
 =?us-ascii?Q?6+gfCmlU8c6TS+PxGiUQwt+nirH7cM89zM79p9G+/gIJEOJjMJJAhHTcvRto?=
 =?us-ascii?Q?/6ntPHHBzM0U+PzbKwTVUKmAztnLT4DtpOTzqNgWthqssy1rZ3kGKyt2Wnwm?=
 =?us-ascii?Q?W1Wf8GfSGqmfID2VKTsVJgi4EssCPi+0?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:43:21.7319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f2c9ca-2c77-47ce-767b-08dcc1c5b24f
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6293
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

Add MP5990 in yosemite4 DTS.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 03a1e41312e3..f139f426099e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -356,7 +356,7 @@ gpio@24 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1281";
+		compatible = "adi,adm1281", "mps,mp5990";
 		reg = <0x40>;
 		shunt-resistor-micro-ohms = <500>;
 	};
@@ -402,7 +402,7 @@ gpio@24 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1281";
+		compatible = "adi,adm1281", "mps,mp5990";
 		reg = <0x40>;
 		shunt-resistor-micro-ohms = <500>;
 	};
@@ -448,7 +448,7 @@ gpio@24 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1281";
+		compatible = "adi,adm1281", "mps,mp5990";
 		reg = <0x40>;
 		shunt-resistor-micro-ohms = <500>;
 	};
@@ -494,7 +494,7 @@ gpio@24 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1281";
+		compatible = "adi,adm1281", "mps,mp5990";
 		reg = <0x40>;
 		shunt-resistor-micro-ohms = <500>;
 	};
@@ -540,7 +540,7 @@ gpio@24 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1281";
+		compatible = "adi,adm1281", "mps,mp5990";
 		reg = <0x40>;
 		shunt-resistor-micro-ohms = <500>;
 	};
@@ -586,7 +586,7 @@ gpio@24 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1281";
+		compatible = "adi,adm1281", "mps,mp5990";
 		reg = <0x40>;
 		shunt-resistor-micro-ohms = <500>;
 	};
@@ -632,7 +632,7 @@ gpio@24 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1281";
+		compatible = "adi,adm1281", "mps,mp5990";
 		reg = <0x40>;
 		shunt-resistor-micro-ohms = <500>;
 	};
@@ -678,7 +678,7 @@ gpio@24 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1281";
+		compatible = "adi,adm1281", "mps,mp5990";
 		reg = <0x40>;
 		shunt-resistor-micro-ohms = <500>;
 	};
-- 
2.25.1

