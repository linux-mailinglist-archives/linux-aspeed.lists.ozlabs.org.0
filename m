Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id E53A68CCF24
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 11:26:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=wuPPJ0Ws;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlN130Qyrz7938
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 19:19:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=wuPPJ0Ws;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlN0J2vKRz78hH
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 May 2024 19:19:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBefVbdgnbdHv0vbP7zdRaPfhAXLBRn7v95hr71IWVm5esqw7aMn39V+2M2ZTSVJa3wv5DbAUrsIAdxZvoUqyBFVxp6Pwpgl26jq+ted0Tqq4BHh89/LeQQ+R8SE85/+fciIEDiq5Z+B3fJ0PA+oWJeobu2uWE+zTQVV54To4wHUnsIvcD4us76JPXMiTTZ8amLOmXGlsWHA9WHRTfCqcVf+3DuBThlK8EF0JTy0Co328Y/AD9agGIAasl9Nh7asXW4d7F1YKNk0IQ1gyLIcDNlfxBYcnGcmLUJhHRrXNMy1XzXhlC+9S7v0936K7Bas1qYHPJ7QJiY5GgfK8XKg/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pjrbPmUmdku7Zq8bJDb7/0Mq2EK7dm/UVhdSc/M8aE=;
 b=Qd80aVTfTKI4GF1HyUAdP03yhuucAL7j2MD7XI5UIiEFHKT54Z6QDJQcG2nwl8U/QsmFiJ3o9sdQk8dwD6PiGr0FfJYuEVd/+7Xv3fgXbac1eo4l6YC4GUDWx3t76TZjx7+MimwAHias00nP5nyMn3iHCxBI3fn3SnxCywapDBKPCvep/zBxIYZKiVH2i9zebtYfD1M2DQRaM/G53x3vCYh6NsZacLShEYIuqosvWkkn4qoRSSWyKJpEnr9qd4BLontcnoH752zSa9AauvsZe+9mBFy3qgp11GlS6Dk1w4s2xZ9m99VFanM7WlKeAO6W9UTqhoE59aOn+PCXneehng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pjrbPmUmdku7Zq8bJDb7/0Mq2EK7dm/UVhdSc/M8aE=;
 b=wuPPJ0WsbTknwa11OSciPSwL1zuKvOlSkPaNDxQ17cG2AJeJsFpM0U0NwuF70GrACSzxv2Re4oho1Uhpf7a7D+ltC+UwX3wFuJbsP6oFJobzEtW3FVb2hEW+aJCpLlcYAZxsU//jTXcIAFLT/0q21z/8DwoV6AF6aMa4kq67QJ9Ub3GTzMxoX4oVazZOF6aj+241f17ArJC3/xCAkGv0Njomrulg8x+HxSxsjbDam1afOtjFtjnNh92Zjv0/zBViNCEq8Ni+uQirIqu6Xl/INLLZvIT10ZDIZiAbqyxiGtukwAEBz30j5m7m5JZW0oRKKihTkhlJFYHi9e4iVtrZeQ==
Received: from PS2PR03CA0024.apcprd03.prod.outlook.com (2603:1096:300:5b::36)
 by TYZPR04MB6427.apcprd04.prod.outlook.com (2603:1096:400:28d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Thu, 23 May
 2024 09:18:53 +0000
Received: from HK3PEPF0000021E.apcprd03.prod.outlook.com
 (2603:1096:300:5b:cafe::17) by PS2PR03CA0024.outlook.office365.com
 (2603:1096:300:5b::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.6 via Frontend
 Transport; Thu, 23 May 2024 09:18:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021E.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server id 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024 09:18:52
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v8 11/23] ARM: dts: aspeed: yosemite4: Add eeprom for yosemite4 use
Date: Thu, 23 May 2024 17:17:58 +0800
Message-Id: <20240523091812.2032933-12-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523091812.2032933-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240523091812.2032933-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021E:EE_|TYZPR04MB6427:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 50e1a0b8-249c-4b06-905c-08dc7b095d4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|376005|1800799015|36860700004|7416005|82310400017;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?YLRPy4DBAugVbqBbKFGbhe2vn3O+xLEOB8svGyiL5khXR6jjtExss7OGUfQv?=
 =?us-ascii?Q?F6Kp+EK0iufWaIi1RQVmrThNvR9IvPrX89yYBVQHetW04KrXRynybjdIZCFW?=
 =?us-ascii?Q?uxOCizjTwpaMGtwWKIl7xjSTI9SbkeEBaz6MP56dMc5BZ6EkUc9yOieJywuw?=
 =?us-ascii?Q?/XrIWlnq1uPFLWUCyAjTBWcjwvIpFGBWr98SSY9lr5yJ/WLTdqYQchQ1+QRs?=
 =?us-ascii?Q?CKfzcKFe/qxZ806+WZJFAL2Hf3LC4mn20l1rJ3f+hs+U6zQSYw3IB9QMcWEg?=
 =?us-ascii?Q?KPZIU6bO59Ep2Vz36IS/7puytbpGYNAeAObS5QcC28/yh+BOxLTBX5egBx1c?=
 =?us-ascii?Q?xrXzZBRTQFjadhzcefk8Y7maqHCCk24aN8zs3DO3xhr7f7ZqptHTJKZKlXDA?=
 =?us-ascii?Q?1Tibbbgltm5JRGHd7NdGU+zp8WYZLHW3zfGBx8vxjAGtJSC9nnroFZNm+neO?=
 =?us-ascii?Q?nGAKbLxk6ymhcNYw9BuaSGhqlfnmX+4cb/x5neqbKQpNaSvhtT9RYE+9zNgi?=
 =?us-ascii?Q?cRBM8h6wumMIG10nMfsjYFdoI4QH1Pz0Do6Fg92ugRURL0a9rczvoJG+UG82?=
 =?us-ascii?Q?4EXwwe2E2E8jRwBXpORfDSU3ao74/AIkJX8+E745ZVsXjFBgw3HRGL+ugECx?=
 =?us-ascii?Q?KsGHz+t5eKXg9ZxzRzEEkNwVdNajnxf/G5oq7mJ7XZEV9abXVOZ9RAe83TGv?=
 =?us-ascii?Q?roHpsQBtozGRYwAPR2K7asBlC4I4Lgd/tb+MZAn7siU3Y4xCPvO4ntpO8gFQ?=
 =?us-ascii?Q?pyTdN/4g4pv8B4A8hChQfJ9Gol4yckR2jC832w7T5d5KemADQbrNeoz4SqLp?=
 =?us-ascii?Q?PeKGbBRLgBjWNaQn22rMBcYZcGt0yQUDngzI+u6nWoBg1BhL3XQND26DdUej?=
 =?us-ascii?Q?2NHsIYRKf7j5wQeflh7DrS6e1Hf8bR8cD9YOxw43wIqiFe9U8CTUAfRHHDka?=
 =?us-ascii?Q?pXWw+Ir8PyB7oCvZMPW4Qv64vH2UigsopsQsFWYWrCZrZVwwv9tdPACyxdvC?=
 =?us-ascii?Q?OuMhSGL72Md76ROAhTfOSejVNuJxZem13DA5j30K98G9sAcizZXzSLyoeXIR?=
 =?us-ascii?Q?3pxpKAxsAjpbgvR5vbYoUxWlurBSYPpWd0q7sebPO63uy6Zmw8g0YXpKV0VO?=
 =?us-ascii?Q?1DXCiD1uh6faqvasFOFmmldLGujgNSOcYRCSuJxYAXjNT2m8NotWyB/6QsZt?=
 =?us-ascii?Q?ndLXQR9UfLaDYDNtJ8l51nHsseaRHJlUkbLiGpIz69af6xf6wPdHun6H73qg?=
 =?us-ascii?Q?ylmt2InBL8/lOGRWszJRrWAFTw7Q5jRABSIZ4yFpIuVtlOb4NEMW16EO3H8C?=
 =?us-ascii?Q?FAn3D0zOYkYz1en3ExC+oMNcBpHrS9mvJQikXuihCDXUZib12Eo71Rurbd49?=
 =?us-ascii?Q?Stc07R0=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(7416005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 09:18:52.7670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e1a0b8-249c-4b06-905c-08dc7b095d4a
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021E.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB6427
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
index 2ac872878acd..9a14f0220cf6 100644
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

