Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2270F959740
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 11:42:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WphFq1Y38z2yZ7
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 19:42:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::62c" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=R5QyeoT4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::62c; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2062c.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WphFm4LG3z2yLJ
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2024 19:42:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8l++K0XUD4/yx3P61XZWZqmTbN/8xg4Xy6g8tuWBRoFEWh6OaZPGt8dQqYz02QOJsIpt5jebCIRzrI8nFFz5EAnu30wDfY8I1qpBHDHghust/QBOHcQrJNLYjCj9ZvfSGZSQWCyS2qdogQVpuTdIOFXeI0wVThnxrMFmhGDmJYOT7esHFdb3ZieEOnFDPQ1khg5Dg3FQ16BFZVPMhKXG+5F50th2rVe+I4ETLbPqnYSh+c+KLtDmRWlX+IzXVRRIX+QXGS/PSGrT9kkqUB4nE9HCZ/5iAi/S5XywlgyXMm6daG+JqTNUmTOh4XPDV6NXI4uGmGSIA7B/l4HryRYIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQ8R9uD5dS2CYOtc4xvne6zIrhYDAk0BYpQGanDefRc=;
 b=mNclSdvmLrEyl9+vZWRauC6SqutDxo0rO6l9D3zWvziYbTytGwLKJgDpxUfbe0804Ed60Xwkhsi2Aya4g3cczFpdpsd/sgLOI/rZ/2jLL3RZxD2ig5y+9gXj//UCYNlG45Gc7XrXge2a/0yhxqz8UtSCYhaLnoHMXUkUITYeUqkaI6lMBKvz+oUEFPT9xDR3+GY0qiTNHfjNUmPnSJD2wjY+74HhcA6NTImPxPCXIURUdEub4rmymEC0oBFg3rObBEcfmUaL8/LIF3sijUKRnMS3SWStE3F/v1y0lCwH0S2/zq2Sj7H3YEg1813uTBBp1MCd06Eurt0L+4d57v2vJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQ8R9uD5dS2CYOtc4xvne6zIrhYDAk0BYpQGanDefRc=;
 b=R5QyeoT4OIXVHoE6XGp9IWtu8rXu9BS5RytK4r7SMnozrJ+GEpUCEkEmgpgRT4aSe3RKU2rttSA3UmF3HWyzGzIcYbQlIqvx2RuMcc+FWaI8Z99SgesvVb97xP61PhIpRgqaoT1gQBFGO2wfu6UqZEbKN3i1b7BipkbyFqrh9p6JrDOG3333FFTBgP3UQsSblZKcaQh1exjuwq2qiRwrOSqLeF1aoEgJ+ny8wbypQUAAngLYSER26VSWXCDZVjvHRdm1AakQTCbWRCXkby8FIp8t7jX5AyFV+/8ePELKNyHm9il2aoeyeKqEEuaIqsnbLWuQGwxcnQXJSTEEl9HqYw==
Received: from SI2PR02CA0028.apcprd02.prod.outlook.com (2603:1096:4:195::8) by
 PUZPR04MB6368.apcprd04.prod.outlook.com (2603:1096:301:ea::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.18; Wed, 21 Aug 2024 09:42:16 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:195:cafe::80) by SI2PR02CA0028.outlook.office365.com
 (2603:1096:4:195::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.17 via Frontend
 Transport; Wed, 21 Aug 2024 09:42:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024
 09:42:15 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v13 12/29] ARM: dts: aspeed: yosemite4: Remove temperature sensor for yosemite4 schematic change
Date: Wed, 21 Aug 2024 17:40:23 +0800
Message-Id: <20240821094043.4126132-13-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|PUZPR04MB6368:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d2f31fb2-3766-41ab-b9c1-08dcc1c58aa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?2n0D0NtBJDIxG34cSVZ2FwUVwXBLru68dMzudTZMy0Uh9PB+UEtE81+RgEME?=
 =?us-ascii?Q?FJ1GYWTEz+LqgHbNJjOMU7VwTrUjEENj1QALKegf/QOua2FF+/DEl0f5JreZ?=
 =?us-ascii?Q?DtEIDi5ieTW6JXlOAYNyTi+e5CU9vqNl96QcpM70wgq4Dsa3/v1H2ex65lY3?=
 =?us-ascii?Q?85PIesp4G58pGQN4zEkc0fFAXBS2GEWPIHRidpwZZXZEUFdGOLQa5NMpLR7x?=
 =?us-ascii?Q?bcd6a7W+7SUANHnqrhwP9x/XOPPWEmVokrT9H+uLoVIfhkgF6fPqmSS66L22?=
 =?us-ascii?Q?p+Cxwoq1aTM+hsGU1MORI3n4q+72GhoiIk5tangPFsRB7fvaqpIV+Riol+t4?=
 =?us-ascii?Q?pyaEmPjDpO2zLtDgSIw1sEZEYHdsg0tNsbpErZ3xO7KUCEy1o+kbHxLaeJwb?=
 =?us-ascii?Q?qD9YoPi1utj7CpPYMy83S1yFviMTVU4KXdlNnifztW9NjuH5kn+sGbgbgi0K?=
 =?us-ascii?Q?tQCxGM8t52PePq55mN/Vx6mSbwJtIWfncD92xCn/55evZJpGr0prYmu03MIY?=
 =?us-ascii?Q?dWp3BlLZy+v1mfz9agacltRnPznEJ5N5teRdySHEdYwRYBSltGfJr6rc7naY?=
 =?us-ascii?Q?EgQNmVb/CqOq3BTq/8r++IIsv0PVX8wCjgykt62D6xeV/gEnsHmHAIGWdtcJ?=
 =?us-ascii?Q?RRIpvxZ7Gn4QF1TAmgxQuoz3JXdnhYndlImFYk4GLpRiFEsMme73mJogsTTH?=
 =?us-ascii?Q?u3xLSXab4V45aNXPoOXdNL9V0rZRQkDOXM9MNJrsjpDwdi34aVCoRitu9ceS?=
 =?us-ascii?Q?av7ZK9ya0SxlcVoNZ+Ennp5Rt8HvJSAaq8OQ6FrsF23jbzVxrjSFPGehlZN1?=
 =?us-ascii?Q?hu2azzCOG8b96+taSAy4Q0F9JlHSywaUj+r5wmMFm2bjOok1wiPJLPwopg/1?=
 =?us-ascii?Q?AUbgXXWbV/PKVpdLmWTFkEL1CNdKQsJI4W/vBcnj3PF+U+1hdG2IW/OWoaJe?=
 =?us-ascii?Q?2x1lJBvw6qgdE9uNATzR0WW8Gkc7sVqIUYo8BsHUbJK+Wn6sVQILnyduBjvQ?=
 =?us-ascii?Q?N09sui9cU0uD4ArklWxzFZObBuxfDRgUZ0t31s3hznqCaDn/1wFVa5fPWgfH?=
 =?us-ascii?Q?QEn6ObGkVGBkeQIH8vLNbdTpEV/ZBB79LJBiho0RAD2WFFjGWR+FWiyoY0BN?=
 =?us-ascii?Q?tQ4Si/0Ouc/3UBW8k/lTtXjg1fxo52FYDiiz8kDtk/yF76b1PQwQZPwZO3Si?=
 =?us-ascii?Q?+3y2gkBhbR3qY2UVNQdFsezPQoWhqqcotQJ6Ono0KQmFXCu1V+tqSj4pyzlH?=
 =?us-ascii?Q?AwgD/Td3/exyS04s+9t/Z1K5/md66byJ6aIEJNIC58bjuagMkUX7nZHa5svr?=
 =?us-ascii?Q?vAVx3ojGsiNZhvgJd8uR4L0axhBjsyCKPpAUnBnDBMKrBvRb4tv0+ypUbN+z?=
 =?us-ascii?Q?/J7EZaJKw4culef5ljM45A8gdvXkCWzLAuNpUA6ddGNJLmiazcOE+coq2FAf?=
 =?us-ascii?Q?pi0ydKq1RNjHax4A5gBfqlkcHfFB0sdg?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:42:15.2156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f31fb2-3766-41ab-b9c1-08dcc1c58aa2
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6368
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

Remove temperature sensor for yosemite4 schematic change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index e83cb51ac19d..2c0c37b3ee5b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -921,16 +921,6 @@ temperature-sensor@49 {
 		reg = <0x49>;
 	};
 
-	temperature-sensor@4a {
-		compatible = "ti,tmp75";
-		reg = <0x4a>;
-	};
-
-	temperature-sensor@4b {
-		compatible = "ti,tmp75";
-		reg = <0x4b>;
-	};
-
 	eeprom@54 {
 		compatible = "atmel,24c128";
 		reg = <0x54>;
-- 
2.25.1

