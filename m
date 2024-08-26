Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B313795E87A
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 08:24:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsgdJ4QKbz2ypP
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 16:24:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::622" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724653490;
	cv=pass; b=dpOHXrsNApUH2OGoZtkiR9eKc9GwYBv9wFZvC5yhTtDxOh/mpdb9LlwXoUq1zmjG0/JcG8j/O8wGvGJ/QGbJqlh85yPzSgWLflOoa0fn70+ETGu1l10FVI2Gc15OBhgidfVjadMjn270Dv6ZcXDgWWUODavgn9ea4ePQ7Az1YdwL6VGWYzFqvadXDEojTY450Pc39m9h7JAfJfZADerSNmX4wy61Ty+kunOY5daQDjap0mTz5OiXvEEwNFpxrOMyABTtq/WGIezau0ylJG2YjdUuSi/c5WNzXE8LcoQCJzAg7xYa938AigksH1gu3MsYhFXhXDqi6hc5cAePcrORdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724653490; c=relaxed/relaxed;
	bh=wTnjvURfXlo53+eVxwkhIqzweQBqIwx6vFyYMB4uolA=;
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
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=wCMPC1Gp; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feae::622; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=wCMPC1Gp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::622; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20622.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsgdG3rXQz2y7M
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2024 16:24:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCAYeqlQ/bUM1n1naYUHj/psL6W10hjOu37PY7CJTIsuXZF45TR8QUFChUx1t5+u5W6L8SUTQcfnPm+cvYJ2fPcgC9UCDsy6++h+1TzdYf4wXyzU1qCkBPKKiaHZRiqO6kXWrdJwVMVkMHNOBASrHvTvtC/mzr0RMLLMC8NBFdb+us8+fxSO4VWO1mBLLbhqcv5PSOh+V+aJwUR9tykX6CQ1RA37h84RQyJP+gt4IIi+LN56Pab0H9m8M/0MpTRFxK80R2KSNURrTdvp+Mnypp17GSDQ/H2F4nRRbAMxQio22LaiGgAhp9p1ecvSA7GkBGKdLL2r9WKJmp5KmCCZqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTnjvURfXlo53+eVxwkhIqzweQBqIwx6vFyYMB4uolA=;
 b=x2dGlyWb7voUfkYuT6XCqpjOWrj3awy6yM/9KgnIPbMObWdC/GH7JeZYepMK6zJtgP+cvIYxyjCwe9wrmBzc1XlrrSDduI9MtealP5Td2r+uL2I/WRQKXZFApDg0XtD9r2Xy1dOFEcmI4RMDmumuYZQCO6k3ei7SJfRy/zFA3KNjYUQ8IyB85N89hbdHcuzp/nCHIbhqgSyN4VqbAVFW1su5L6id03VugDHseu5QMnfc1PTRnx1IumUeJN3nfX8gdxlhXVI5wYujjw3eEJkYQm2PJtHjsfLuZ6XWHGjIe/U9ScEV6MR72Yu9rqK4d+tI71CiVDlyv7r2xywej0jnhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTnjvURfXlo53+eVxwkhIqzweQBqIwx6vFyYMB4uolA=;
 b=wCMPC1GpxZDza0Rh2V3/7ofggmPLp1GJJpda1BVzPqoKD6cvD/msSIO/b8cQdYfZwT6N8xIoGcRutYSeQZvoaVh9DvfW8LFLtclPjHwTQstpPXSQYxWATNHyxT3YgnyoaNCBiYbNvUPg3KjWjGTeiyH3IdfxDecTcrL5BxgnypKwp3wMI2vD9AmQiBDwAkfU5FxxXvpCvf5PKda74685Hi4zLGtlMU6dEoVnimElhVId/Wh0ESsiDcPjRCuxZwmB9VnJvyyfNJ2xvwxjoM3zhiLETgDVptwaPOoHAJvkVJQRD0D2KmBl29KnuTJ3V6IyGg5B4tgZoAx1Qj3Dr6m1Eg==
Received: from PUZP153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::11)
 by SG2PR04MB5820.apcprd04.prod.outlook.com (2603:1096:4:1b8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Mon, 26 Aug
 2024 06:24:39 +0000
Received: from HK2PEPF00006FB0.apcprd02.prod.outlook.com
 (2603:1096:301:c2:cafe::20) by PUZP153CA0007.outlook.office365.com
 (2603:1096:301:c2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14 via Frontend
 Transport; Mon, 26 Aug 2024 06:24:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB0.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 06:24:38
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v14 05/31] ARM: dts: aspeed: yosemite4: Revise quad mode to dual mode
Date: Mon, 26 Aug 2024 14:23:39 +0800
Message-Id: <20240826062408.2885174-6-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB0:EE_|SG2PR04MB5820:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f6416975-29c1-4a4f-1ece-08dcc597c332
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?YB7nyB5SKgfNlG9FqHFsZZ9/Cg9lOwBMiqw0yx62HlwjYOnLMRxjItxh99fM?=
 =?us-ascii?Q?pieTNvhTr4HuB3dK0SoI/dSI1Ur4cwAxeelM3AK2WUsJ58vbPl4Q3KMSLwZd?=
 =?us-ascii?Q?r/AU6SGptaO+q08anVGj2Y6Mk9H7Vj0xIAaSYtMwyC9bjxAyqejJ287J8L3Z?=
 =?us-ascii?Q?1HMMNq3Elq1NVEhj3lPPPWW2LgiGq82Isnqp7PGtrpE/PXa2NWu2ljd/OFFM?=
 =?us-ascii?Q?cN2IzTFi5mDoRNvd0w4sMmQai6pqwGbJ/d8NEf6ybq+fCeEUxrgK1TP9jbo3?=
 =?us-ascii?Q?4XXUSSBFc37aQ7xtz4qUwL3Tj1iImuHFmTLT29tymxoAlTEU5bKu2Bb28S1z?=
 =?us-ascii?Q?MoJAClnG1NlsGkWGtUNySngpwaiWsrTgV6GdETp+qgGENjpIGe6+AcEy+1i6?=
 =?us-ascii?Q?lsch2h1/JC1X4CRbM3hgx9+vMTLUd3wWQAN5IOw0XqlFWst1uvuL7Hm6YR0o?=
 =?us-ascii?Q?rE8RBRdl8RiNsp1euYzbkC1ztSLPluYww4lqUne6M8e5WF7CB7R+RivGUscc?=
 =?us-ascii?Q?WRbL+5T8kv75l1wnCsHB+lYmFBvfhLSgmaCjGULmYMWB5uBHqJIr5bwW2l2P?=
 =?us-ascii?Q?acSOm3YiITYJa3RLjlxVD4csshBCtYLAun4zvNKA14z8rkHke1D2b68dCEFL?=
 =?us-ascii?Q?iYHDtI9qP0zTqMbx+e7HegbV7vX0YSSVd2IcP9NO/FgM8MuC0CeX+TKDRdiv?=
 =?us-ascii?Q?RYZTSIX3OkseDhNWp430Ionh9kQfmjEjX03qgHBe5LdnPsJOd/Igx7v4OdeN?=
 =?us-ascii?Q?Tg/Y8+7LWzSNMguQko7b9V3g1rDtSVsjsnVXW3MRon8yWGUMHeq32fUAUGZC?=
 =?us-ascii?Q?1e8fK8OYk796u5EgB49jNLKS3BuASmBqoBVQmddu+FjFhZRxVXqI9PuLTdHh?=
 =?us-ascii?Q?y9YkhRFn3OSvnkgHP9gJL+eM9HRCDNeiRYezXhkLx5288hrfTvHrA+TnUft0?=
 =?us-ascii?Q?8vWxjk13PtpwnSI2G30dH4L1L6YxO6yGe5jn8QaIrDm5s2JZ6p8H3AjiycmW?=
 =?us-ascii?Q?ZHPtTZeH9S1gI2QGkwiWt4DzrGey0jegPRniCkvh8mcHJvD+iVVxh+cIhAbL?=
 =?us-ascii?Q?IpR1qcZcmg4kUGMzECbVyTbqTJ9g0P/Bl4pRWGqAUQDirwQyFngb8G1LnMEH?=
 =?us-ascii?Q?MCFl5GcNQhCmgcsKZjXL7qY+Ox8BYkzCObAsK6w1+sZX2f5y2tl7WUiHVwrw?=
 =?us-ascii?Q?uQECPs61m02rAKzraLJa+j5iT0RJv1U5OLPCrisXHscO5YeuMYftSTx/m05J?=
 =?us-ascii?Q?rXcqogBT8LiGmj3Znzx9suQb82YPHi2F7xBfiVQxceH7L3g4qo38MUD3x6CF?=
 =?us-ascii?Q?Hi6VWqb+CXHPK9FLnssFEBTRlyMR8TVa8L/y9tP1gD5UOoBSbL+dB4srgaTZ?=
 =?us-ascii?Q?SKJ5+VWpGsgE0pUHm81TovWlMM4QmY6HhKlqHWwM9SSgd0kCaoscs6hWO+sT?=
 =?us-ascii?Q?uzxErYDfTMWlV2VFUiwbjQd8MuRPpEJy?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 06:24:38.2843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6416975-29c1-4a4f-1ece-08dcc597c332
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB0.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB5820
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

Revise quad mode to dual mode to avoid WP pin influnece the SPI

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 51b4e9ae13cc..e5354efbb903 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -149,15 +149,17 @@ flash@0 {
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
-		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
 		spi-max-frequency = <50000000>;
-#include "openbmc-flash-layout-64.dtsi"
+#include "openbmc-flash-layout-128.dtsi"
 	};
 	flash@1 {
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc2";
-		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
 		spi-max-frequency = <50000000>;
 	};
 };
-- 
2.25.1

