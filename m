Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA94954571
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 11:25:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="::1" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=JQWKRl0D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlc612bKFz3005
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 19:25:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::616" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=JQWKRl0D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::616; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wlc5x57Xxz30BW
	for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2024 19:25:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eltO8vfON7pA4Q3+/CNvtrBKUixQWFgZ10q9pZSVeh2UI7jjLTE/B1rGVynSi1g2h7z/LP8y6a5hVtdEYZK9pnWWbZxFyThJ35Lb4EfiMjzBHtmZ6nNEAcoiV2LbZ2tzOlE5FLhreD9T+WKOk3dbFR1UPcX3IO4ues/yz1wXwj/NlicQUne8AdpcWhEdls4tHRpOr++nKIYBjmkwl0BHZO2P1uyQ8Qav4eX2kPj1FOwRVTpw4eGM3wnRq+VovqpHW0RrCWqyJp7jmrf/txbOVEwx0+vUuVeBEKmWraTE2UwwMBS2QZOBFdrPoMDjIj0fZxVoUv5OEwko+D/YkBMERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2AzjfJFXFA/0WPUqtPxoFn2BZSzzb91uVzc8URhJAk=;
 b=OKV8qMZylcG2NcrnLhcyhg2fJXXO2UnZvNlwAi0t5wD9meNkPYPk0mtTqxam3KGZTQieMeto6WT9xyiakXwxLQnmxmjwcqPr8gT0E5aRwBEUtFQMz9dQqXgC6nu/Px92UWUQ561cti0pujM8+p/VPUSu4jQenIiav+M9UiB3Uy9dMDcx9EpQFyUE1dcd0tL4VUjZUsVCzRpEq0lc22eCMwXVUMBX2GJBdfA3cd7TmzCO7AwjENoqUsWNXcvGPUVxJR83XDPy81Y1CgSk/pPi8qYRPbXCKdxpRW54VvTbxMytUpTdTEKoDdbKvpUVwaEKCgzaPxR9h/HxxUkidir9Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2AzjfJFXFA/0WPUqtPxoFn2BZSzzb91uVzc8URhJAk=;
 b=JQWKRl0D6ckdaS5NodgngqiBwVogzao4w3SMm+f3EDrbXDsVT/iFB1sR+4I/jECxN7KNsfO1jEpNt19P609Goe1QC90YA9osSDPi7nOpJM1NOuZ0mm8ZO9Nny9ymEF9W/7EocGrI108HPCB7mNj4bRGT8Exi7d4qxj+12cSS0goOVoYCg/QrYga2fpYnFgYdVTxa3HuwyQMgLuufNg4V2gqDyTqULkpp6zyivt+AStBkRoMOANKHgHUqw/lKsD4IbfHDk5sloEIDIhoaQtZ/ZHQDQwRWO39z2daPEfo4urTqEKl+chl1kU+Y4sPmmNC5bu4h1MgwR90n6oBJgmoMDw==
Received: from SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) by OSQPR04MB8234.apcprd04.prod.outlook.com
 (2603:1096:604:29d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Fri, 16 Aug
 2024 09:24:47 +0000
Received: from HK3PEPF0000021D.apcprd03.prod.outlook.com
 (2603:1096:4:193:cafe::97) by SI2PR01CA0049.outlook.office365.com
 (2603:1096:4:193::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19 via Frontend
 Transport; Fri, 16 Aug 2024 09:24:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021D.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server id 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 09:24:46
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v12 04/28] ARM: dts: aspeed: yosemite4: Enable watchdog2
Date: Fri, 16 Aug 2024 17:23:51 +0800
Message-Id: <20240816092417.3651434-5-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021D:EE_|OSQPR04MB8234:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8e77d3d3-68f3-464c-bcb3-08dcbdd544f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?aSxK1kEQt65Jve/PXqOyaBW5HR2WQCvxiW2BE1cZzf6JjmEmBrVGA/ryzZPZ?=
 =?us-ascii?Q?E/KwrazTUDs4fdFB+UI3LHTdY6Dbd2eTHQzcZS6WtMCF0bapMXZY16V0azm9?=
 =?us-ascii?Q?RIXrQ9CVzd87Gg9dwq1joHApVjrMTmm2HYkp6I/retyLXRq7mzdI8xo3GSd5?=
 =?us-ascii?Q?eD8ubwiDEatbwrmId/wiSPUYi3PVvHNzwg0iNOOf8GtvBecjzTpS+ahGM2iy?=
 =?us-ascii?Q?7IH1sUG9nSKiNsqSyDT9fqWTenfRG0w9cwR1VJD521kCXxidL+4kINeU3QcU?=
 =?us-ascii?Q?VX2qbF9CQo22rtM2vgUYA2E5m6ocz+VfUaDmc5yCm04X4Ihef9qcYgRFbtDL?=
 =?us-ascii?Q?WUCzTNk2insEN6wEMspQj4Z4S9dR41D3qjlZNsANUlF5RS+hWhvnvlCV+HsV?=
 =?us-ascii?Q?f5LoHg5vnSVZHa30NJ3OzCqvHO3GeVPsw8UaoT34e7vb+xvZFtZWf+WCd8Qu?=
 =?us-ascii?Q?DDdfIg7fLFzN8iL4NMXS2GhALXrCmoCpGv1W85WE+jDrUshlVW4qz67z8kGl?=
 =?us-ascii?Q?55WMjg1pxXnU0tcIJOd7hhiSiqoi2iWj+VUdfZPdjXVbyVvFMgX7Pb8qk/US?=
 =?us-ascii?Q?+5vSI1ovxeO/Po64HF2ftFen+dFyJh2n6nIMUQLuG3Ex1o7cckH6KMFSVciG?=
 =?us-ascii?Q?I8s02xqsRZKvKtSyqCcmbeX/18yPLm+Xd6OnoEUZ02NuAr6ocbB8S8dSJxg1?=
 =?us-ascii?Q?oTGQPehW4gwzyo66CGPW5o9ezXu77ocDiVrc80z8iLPNq6zAz27tkX+YmRcI?=
 =?us-ascii?Q?TtKRDVzaDRc1jXyYWEgg3NUdx9e5hg4oiUZSHz8FTx7FG1kuyW++Rx6mmVWM?=
 =?us-ascii?Q?14F1Kzn05bgzKsBoOO816vvzEv2t8L6g2zJ7K5qp2aQGcZfemyhqyc2rkaV9?=
 =?us-ascii?Q?jRZZs8YsI07YI2HKdit0TgwrlymhYr/SrIeLz1f2ZVT0Lv3+YJmxocBHI22s?=
 =?us-ascii?Q?KDiAzjhUaPZwQ/G2/uwWe1iLZajZ/OXWCH+C1X5ml81lT9OJd9NJbBvk/Ak8?=
 =?us-ascii?Q?U2CkZ5T2g6ENy3jhJ+LUrwyNoMZ67NJHgB1jCoJvSf6Le6kvwUkeaKGByOYp?=
 =?us-ascii?Q?IjjZiqU0ZSYembTDdeslmwHFxyRVexLWImuliZqLBV+FaKoIr/3v2ZeOaI3y?=
 =?us-ascii?Q?HWbEb45RSp0dFSO/P+C1s8imYgg8hucBuKiOvVzjHMyWbOCo7HINLyaR2idI?=
 =?us-ascii?Q?icLAq/O2wVeQdVAlsD1TxdwIo1rXJ7wODilB1u0eD3j3Y9sZN/jt5ITgRCPi?=
 =?us-ascii?Q?EODybd3C9ajCfmbog1HxRoiypKN1M7VDsm7dCgJUxnS4xPZKHbhkTtUnJ76I?=
 =?us-ascii?Q?Oaiwttq7uWWiOCpfKjxcxcUwAkCP1+wnxguPyL1/YDAaLvMPPiFMgLfGSEPn?=
 =?us-ascii?Q?A61eiJNkZR6M0d/Mb7Ey4F4u8lHre8VCjL9bfft/gDkILQzHmIjmsX6tqwO3?=
 =?us-ascii?Q?oXPLOvOvSFDylxRv5lwgCFYG4tsDocQ9?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 09:24:46.0284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e77d3d3-68f3-464c-bcb3-08dcbdd544f6
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR04MB8234
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

enable watchdog2 setting

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 575abdd530df..51b4e9ae13cc 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -120,6 +120,13 @@ &wdt1 {
 	aspeed,ext-pulse-duration = <256>;
 };
 
+&wdt2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst2_default>;
+	aspeed,reset-type = "system";
+};
+
 &mac2 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.25.1

