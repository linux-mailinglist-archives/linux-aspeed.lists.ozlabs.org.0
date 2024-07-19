Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A3B93738D
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jul 2024 08:01:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=h89el/0g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQJvY103Tz3fmQ
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jul 2024 16:01:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=h89el/0g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::601; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQJtq4nG0z3cWP
	for <linux-aspeed@lists.ozlabs.org>; Fri, 19 Jul 2024 16:00:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGFfrCuHPWJJjJ5nuL5Ss423f0WTWN4+yNW+X9p41RIK+NOH+BsTTh2RN9R1hDkKcp3NZU5EQGgTAN2skr/u0auirogkcqxuRboK8nT6nJVQ1+9iZQlSoq+TbsfABYXIdMJGTQ3YQhOIwjN8ltrQvK+HB/3/KhGabZODGX2YohyXN5nTH5H37xAerGNma1W9R/0fkSKxR92N52YEkgu8l4aohEAweoxpurshcLCCbQeAWYhRU0FgS3xWr6HvmgP63EDpHc9MRyX3zMFeC2V5IJEet19L+NWa3kmckhqDihAc3YLVL82nl5YxVKhWBnzcIFEyVb5wmO0gyJKGc8gmFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajdRlofMdvo42OVOqGXyRTdshC61xKgWuLqNg7HObWU=;
 b=wRr89L3TvEPxDiU/D56SefOXt89HLDUcsm6C63d41DDH5xwdwBKPmEgMx1ElKbX4A3+ygBbBBURjwMs5mlcjKALoZbWp5rzOLL6kMMgvsvznqKakYGJEjea6b4LVTNENIC5xnXwqrNcPQ4ZQwTmqsp1zXnMtyDzotGnhX4sigVitBI7OGFe9wqqnhp71rNVXfablyRdW6xbbNgmSrH1qwtyEE7Y5SyfsqnKQ1CPCfIdDe9Mw459l7+XmyuAHbaBHd9DkvmaVDTDTlQMP9KF9vCG6uHJm3mDKq4KlhusfooxPFP9uju6Th7lPqe0lbjWet1ezKan5jDoFzCliD4zkJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajdRlofMdvo42OVOqGXyRTdshC61xKgWuLqNg7HObWU=;
 b=h89el/0gv5kNU/r+JlxHLK3DIEkyaiDiFptJdFVI1U8zM9aSaMbmVI6wntZ236SM6iVt5oV0WWeuAdfyCYJha7TY83yqA+TLunJlzJ1TOWb8AfndYIyhNZJCsQVnoZPxquAJwvCyij6SFFy51TkSv5RkRUoDssiposHclWN7cYMY6WlO3thGGMdzxi8pNPgovh1wQPVUsMeQeZThaAJ0TIVDgMSvfei6mcURqqfUT7CNPHg/Z2AFay+pXiNeHqQ3qpJhgGyyWXrS+vE4bi1a2XUJhuFbV/gqLMOkDO0Mu+rBMiuV+3PDzf4jbRxWLPiSxzaGT4kaPTCXWGPhFVDb/A==
Received: from KL1PR0401CA0032.apcprd04.prod.outlook.com (2603:1096:820:e::19)
 by TYZPR04MB7154.apcprd04.prod.outlook.com (2603:1096:400:465::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 19 Jul
 2024 06:00:16 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:820:e:cafe::76) by KL1PR0401CA0032.outlook.office365.com
 (2603:1096:820:e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18 via Frontend
 Transport; Fri, 19 Jul 2024 06:00:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Fri, 19 Jul 2024 06:00:15
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v10 15/27] ARM: dts: aspeed: yosemite4: Remove idle state setting for yosemite4 NIC connection
Date: Fri, 19 Jul 2024 13:58:44 +0800
Message-Id: <20240719055859.4166887-16-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240719055859.4166887-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240719055859.4166887-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|TYZPR04MB7154:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e2c950cb-8b20-45d8-d0ba-08dca7b80fa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|34020700016|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?dRscF9v3yMOatPtAlBx7nzj09KDkpXIRBk6wdt88IPHQGSFzEjFBh90N2wHm?=
 =?us-ascii?Q?BuNcSnHVYovdeJCPMexn6a2nrzgke+jQEFEKMMikwOpw6t4f/IRITmift6Ih?=
 =?us-ascii?Q?9gg8HKNrWTlLE6qLUQnww0SbqacJPjBSooNI5FALXIY0Aso563RUrIrzEZDf?=
 =?us-ascii?Q?ezpS3Ld1mUiV7k5vbFDwdcKCuwBXPiGaZ7SsIQKEfgBQZxE3/yD78ysEem48?=
 =?us-ascii?Q?ZpwkDtUcKJZJk8Q8guRWYTlu3gAwUhmb9lfGarQ789KtLQd2vfJp8f+6m76o?=
 =?us-ascii?Q?vfozW6etvq+OBa1RIfolwob0TJjy1K36ynJ3JL1+eZGSGydsuG/H4EUaGpGG?=
 =?us-ascii?Q?JePQTz5XlvZUxfcuaHqOuJRRY3bLkw7RfiPSd4aG5aOjgvjeDiAkrREULKL0?=
 =?us-ascii?Q?Kgk0Zibu5Vynn+HeOPt1eGXhub0EzYwg0/sXL/4O5eGX5foJ3D22cbspqAr6?=
 =?us-ascii?Q?xEEsHYw8qRQ66EunRxuqlC7AXgjKXwOqS8i9DO1CeOmL5cxhyXe3eb4xYtVn?=
 =?us-ascii?Q?87ZJNL2fAdcuKU0/xSpDAKDvsyCNYzfyLLEXIu0t3sOxKIVAf990hB98AuDF?=
 =?us-ascii?Q?Yf4uvhoMrPe0zKpaG0ocNgRCOmt5TVSiGT9W7ieQq30XWwQNgNd/qT2PPf7O?=
 =?us-ascii?Q?UOBBCZ8ED7kpNJPT4IMaIejgEogTXtNXODYCvjKDoPXotVs90gfLemb4f1fE?=
 =?us-ascii?Q?oAAvzJfOxfxFuh7jvPQ9zaUnsf7+yQ2FTTNpbmTQf3lOWnBdJTpqfPk9iCCa?=
 =?us-ascii?Q?pzLnhGEDTFWzUPkQtyfpSxTk8xdwcfTfrm0GwgFo4M3HdvRMCCG7E9RZo5iJ?=
 =?us-ascii?Q?WHEYLzLBwhlw20j5pRPTO98XMIeLZM2Ixm+pyKeam62dcTxHYoLELf4sCBZ+?=
 =?us-ascii?Q?j4Q4pYfqRnyA2NWq3+7erPOX9qp86QDyXU8jaaQbLTsglyNFbW4BQ1tNB+Q3?=
 =?us-ascii?Q?yDaURg/g/i53dodtYqugainr8V00+12+AMN0rfJoImPFXN3ugixW1KpHgXDJ?=
 =?us-ascii?Q?8Clo3L+eh3Z4C0OYIOMKzRQVBa6Fm4JRkhfL075eg0bjO4hPyvI8lOcKuQ0M?=
 =?us-ascii?Q?0OOmtCR+Q87724BQ4N8lpuS8cJLvhBL5EByYvQ2aT6Ybg85AdVD+GbpzC2hB?=
 =?us-ascii?Q?XvORo+wigyvaloR+xYxkRZLkbWoewsD/a1bSf3oSLQacWZ/XmuPNfXVSPSn3?=
 =?us-ascii?Q?1rRsYcn9G2Iuq41pNwt+wHAhquKGIgDuAmOkh7znc2CTQYFgqgWWDhJA5NvG?=
 =?us-ascii?Q?BC3tZr+2h9UQzOix8BRh0EvNtquWcDjx5WD3S5XPJni5xjNb3p9/x0Df5fKu?=
 =?us-ascii?Q?GFhBSOvo8PBPvKihkvld90f7HZ3H9dXAsIAg+sU24LgJV4V0yfU1HT3uCAga?=
 =?us-ascii?Q?uGzf/yfkqogTN8L18XrQG3PLbP8XZxRLVwTASBKVowXAIsB3KJxdeMIWUI14?=
 =?us-ascii?Q?RSdtEsMxd8lQ0n8HQrdc7h89Z4uu0VCt?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 06:00:15.5639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c950cb-8b20-45d8-d0ba-08dca7b80fa3
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7154
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

Remove idle state setting for yosemite4 NIC connection

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 67e3c787d675..8b23b012d6f5 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1235,7 +1235,6 @@ mctp@10 {
 
 	i2c-mux@72 {
 		compatible = "nxp,pca9544";
-		i2c-mux-idle-disconnect;
 		reg = <0x72>;
 
 		imux24: i2c@0 {
-- 
2.25.1

