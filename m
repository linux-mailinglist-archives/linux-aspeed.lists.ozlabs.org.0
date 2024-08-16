Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAFB954597
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 11:26:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="::1" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=wqgXS2vJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlc7q38zpz3bZ6
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 19:26:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::609" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=wqgXS2vJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::609; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20609.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wlc7n0Dbgz3bjk
	for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2024 19:26:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qiU5FzCpp77PLhs7ptBf98xalvty+eaVBP0z5eiGbY6iQVGesbTUNeizjfRPzwKsHM7xsKnXoNarhbBTkuB5VPbWYc3DyR37RCDdJ+7WA6+U5W6Sx3PCVp3SwhwwB28H+WTq0jfYbRhM1ScZwprIfuNZV8YatSvEAcMJXyz9PhIZl1agVJ6KeN+hqL+DP8aij7EbkZDkU1aNmU2MHXW6D968665hu++Vw+e33vwH1dFZYpqox/xY17KLcawxzoWW+WsYU2VQtQVegQWVE1/+08GGvm5AaEwKJYsqdWQd2Og5KdD7bbx11j1btMQpmrL88BYM8wKbmN0M3vUzAt/CUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGEY6kFHCr93vzQaG19EtYDkCI9Rttn+5U+iGfkqrRQ=;
 b=h9/g2iaKEesy4goiFdlrmspOoThXWxmQ8O/TuiclMHuh+hsotOpHWQ5YuObB/4TfwlYLTT7O9KhSdr41zAVPo2jZ/jzYLCQttODu5hnQgP0bJxof1d7cETgVTWZJ2XXUCgRdNkDHLW/XgT1ELqHXcsz+JTTYLS7V2IPIQoo7VozYRHLqk7iT0Xh+ky8gcLKkx5T4W+macrBmeUMuWKqK42MwUsl+dujyvf9glyW+JNd535bVdIoi5cUjLJYmIz9/XYMePh/ONiGxLdt5ZMQkgXurzoCeri1Nytwx2yPxEePMoj453h5Vlj6/VBDldSx+058MQSrKuiFdA5YateNl8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGEY6kFHCr93vzQaG19EtYDkCI9Rttn+5U+iGfkqrRQ=;
 b=wqgXS2vJHigimROHRcvqjohvMHbRwRAQXTifJX+hgqr5eSegKT4Joqyz8j7IqQMpUcW7Cqjh2MKN9npQ2Y/AkKJbbFVcEh6OGyiFMvdXku637sWvI8tRblhM/oFH4G6Fd9lfQ7GIXXB7/sOZF+GsqgfUanlEYxyhKtAwPQ4z5NONDqWSmDkUmjGTsY4iEvTOuK2E4x/DpJsgsQ+uq88+0ERQOvodEgwUhOO3zRLWYFKex28Movtp/wuLZdAnQ/KyY7p78NpZ8LiorNp2wPWgmm5fpR+EpEpmi1HGUJjrFFBp0kPC+PlKsO53Lg8TxhsOEKz4hXiLWgSnj3ouhpCTmA==
Received: from SI2PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::15) by TYZPR04MB5757.apcprd04.prod.outlook.com
 (2603:1096:400:1fa::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 09:26:24 +0000
Received: from HK3PEPF0000021D.apcprd03.prod.outlook.com
 (2603:1096:4:193:cafe::a) by SI2PR01CA0041.outlook.office365.com
 (2603:1096:4:193::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19 via Frontend
 Transport; Fri, 16 Aug 2024 09:26:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021D.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server id 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 09:26:22
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v12 26/28] ARM: dts: aspeed: yosemite4: add MP5990 support
Date: Fri, 16 Aug 2024 17:24:13 +0800
Message-Id: <20240816092417.3651434-27-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021D:EE_|TYZPR04MB5757:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 06dd025c-e0ca-4fd5-7711-08dcbdd57eb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?HgSi4ykrVy1brS3fTM+3P7jUg4vBStiHpEsYbmBM82ci0Fk0qWhynP6zg2Yj?=
 =?us-ascii?Q?yVVl24YTcD4Jd06fq72AjgqawUXeTUkOu9bXWtljLFK+N08+yqkXYcjceTZH?=
 =?us-ascii?Q?9P3tVdZylpmprpwoxwj77rF76vYHlNKoltbH7eCYZ6ssFWn1l6FmeCBmkW6Q?=
 =?us-ascii?Q?ZoYMz+nuH8rEs2H5B0Ke3mIWtrUT7RlZvuqnnVKz9JTJCDS/01Fjbg0Z0Ayk?=
 =?us-ascii?Q?K18akhu2rvoeiffh4r4mPBlsH+uXDpTF8YxfZWPRl93CwWhneWKFj0ZrR10C?=
 =?us-ascii?Q?Yvw57E9K1mGGk43SIc9gAgLJB5dnrXcleFg89Z+aKsFracFO4CpJgJCos6Pi?=
 =?us-ascii?Q?W1z8K6JwxnPty8xMVk6KfEu7HNetQhAvH9pmku0Y39GYMxiKBozh9IprGoJ9?=
 =?us-ascii?Q?JASvWKFzcNqV6q1tnMQbUsT/wkLzh6iVVVRKtxZGamTQ9v8VcFhTeBry1+s4?=
 =?us-ascii?Q?tQ+0MX4ip274huqZWG5mB1ZmclxjeWjwGmaqPrE31OdipMK3+uau+tlo2O0O?=
 =?us-ascii?Q?JNWFf+6f0fTy0hVHhL47aavlPU49f4gQ6ZtHU70ogp1Ubh7Nx0HyywLdECPd?=
 =?us-ascii?Q?1ojFESMlsVzplK855JCO0G5Aj46S7NRUk+BDEcyWB8dT4RyIe/7BpVFuZiAw?=
 =?us-ascii?Q?uxoAt7GhnJ55Rslx8yCYXQHSqWaW4aifsyJEnJf7iRCWeh6EM04Te3NnXM8d?=
 =?us-ascii?Q?BjkE4VPqLrpYy05IZggeP615CS6I6Bb/2EEXHOINNhrZ3tvmKwWWHjdc7csa?=
 =?us-ascii?Q?EFE+8xOafIQKMH2OOm5Pn6SH9BrJCQh4JCQbpaN6IH7PMMEc+wrI/yBZ8wrf?=
 =?us-ascii?Q?TWZIcPPqnRDahj80FBsGIHkHBrwG5djIIAPZFf4b5mFS3uclGv4V4dWaGOHI?=
 =?us-ascii?Q?39rKq+flwFWJYZbpYfxhhLEYfsqzOqoIiiRhu8eeyVTa8hd1BPvoKV9KTMEW?=
 =?us-ascii?Q?b9y9GSe+x2sD5gOiKUPTG9ZSnOyKroH/VzrwunJlZuFPSOguIfDSWZJniw8f?=
 =?us-ascii?Q?MmGBDIlDNuXZtAm9WKvgcrvmK9idnuMygQROt0QdI+AMJJ4CvuQzd9+8aucL?=
 =?us-ascii?Q?NcqZF5UupCM+wummX0loMORgdkBbph7mAqhfQa85X4a30Q/xnTLp2R6pSoZk?=
 =?us-ascii?Q?OaTRaeSBR8XbcPUVLhmgOG9CTiGMjN7LA3HBjZFa+88EzhirjDp/a7zGer4T?=
 =?us-ascii?Q?x9HQx6B+yA1lJQKXtDzJMgl/cz0Aldz3Xj3RnyewkhLg9VjlQ7UToXU/lHjy?=
 =?us-ascii?Q?QWkndcgYHwW0OpGj0OH60q4oSBCe+GyU+xGaabGuxIuFj9SuN7M5/aSWovvw?=
 =?us-ascii?Q?H3Jkk4dC3um4WJ1hyYi6ZSlXrRFzV+WeMUX+DlTKd5EL0099iVa13C1w+4Pc?=
 =?us-ascii?Q?Gy3K8WlgNwE3zNNNBbmhFnY9XEMbcjqOcWy8j24owI9pWA9XoZeHw5bo+Xe6?=
 =?us-ascii?Q?fJv+CE+BoFy/zZKoFD3gsJIZTICnXZLd?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 09:26:22.9347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06dd025c-e0ca-4fd5-7711-08dcbdd57eb9
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB5757
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

