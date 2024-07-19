Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F14F193737B
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jul 2024 08:00:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=HIwZmbyv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQJtP5xQ3z3fQn
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jul 2024 16:00:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=HIwZmbyv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::613; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20613.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::613])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQJt34znrz3fQR
	for <linux-aspeed@lists.ozlabs.org>; Fri, 19 Jul 2024 15:59:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W14RQQiOBOvE9khQxqIjF2rmU97TFHGPKxG05My9XzzcepwXnH2hDJvtpSdj8DpefjXtU0LYiL3qqMcjDmKaskTxVmyKb0XYSjWIYGGy0Zas7tLA19bZrx4veJrdTkghlTzK39jYp10vIHAQ5fKEg67JCOY0ziS6uwOCYc0aJKNJICZkkBLBjx5k5nVl8ygt+ezxTSck6BNx8qCVELPuNTnGW2at8y0pu5zlwBRqB9Fb0pDqUzb7yblQLRRLUMt5JBi5rlOfYwbv7EFoJs2Ng36y+w9rxBWt10fzpNYK9jgCooR5AmvRgmXdXc0f/psAJ8v3DGZDuo3wHfRsdEonug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/dqJuii+ID5NkttuzvqI67JF2qX2ZPzbFRrGdWVquY=;
 b=bJWToOJE1B/kNFqpd++ZfprfUFQEbxTZvuy5jIYBCqED0YkOSx2hv+GJS/6B8r5SFVKsWmjAzHlnrUhSimIQ0R1b49MxnjaQzsbNe6Ry1/aNYoTK1dvXwq1+DNAzLnuBY6dN5rHxo6oz9G2FmjyeTxchMsKPzlcQP6CZi20lTdkWXfXlfsNtDhXUaopxlUMVEeESDbIUL53PoPrk3awfs+x5b5tIuR+0ADKCW0lUj+x672pu2YysWnG44w8skPmcNm9Fw8BC6xULrBEWHoZTzZYrXKUeZxtqzdHbOuKtaXKLODqV3XKK4Q5sfXKdoZ0WM6Oru1Iq50esecOAoKiykg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/dqJuii+ID5NkttuzvqI67JF2qX2ZPzbFRrGdWVquY=;
 b=HIwZmbyvkl5pmTZBz3SMw19bi68K+xWhItHiwGAWMp1Rfd+NKsUm/MRFHZHcqqev/X9kFsz5xHP5Mb1uMT2WelnHbLi0jOBuS0Iv/7/SqEdHHyWhmFiCKaNoV6TykGkrEVHR1+P2bugsAc9Cbs0VDiIm4mgqeJFy41M3NOhQfQN7bTVRuZ/HPzYb+UMHcFkGaieHageraGrvcekLfy+QblQUUeW2ZIUMJmeq2FcQ+1zRhY92flw2kGwHdVd0/5NCwF4PQxG/HbpmKjUHfM8F2vgYQLdYlbbrywKJ8+0TpUZrlSJ9MB+Zi2cc0Wfnbl8dzuc0wDap0d2CsOdKkbS5vQ==
Received: from KL1PR0401CA0031.apcprd04.prod.outlook.com (2603:1096:820:e::18)
 by OS8PR04MB8122.apcprd04.prod.outlook.com (2603:1096:604:28b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.13; Fri, 19 Jul
 2024 05:59:36 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:820:e:cafe::1) by KL1PR0401CA0031.outlook.office365.com
 (2603:1096:820:e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17 via Frontend
 Transport; Fri, 19 Jul 2024 05:59:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Fri, 19 Jul 2024 05:59:35
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v10 05/27] ARM: dts: aspeed: yosemite4: Revise quad mode to dual mode
Date: Fri, 19 Jul 2024 13:58:34 +0800
Message-Id: <20240719055859.4166887-6-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240719055859.4166887-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240719055859.4166887-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|OS8PR04MB8122:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cf81f268-140c-4ea6-2b2a-08dca7b7f7b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|36860700013|34020700016|376014|82310400026|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?1pyw3XixiylsNny+GBM1bY2e49PqSQGj/bKEOz31hBmUm46E/YFalBn/o0+Y?=
 =?us-ascii?Q?BJubWNL+PDBY3tY8iGDkCjN2Ob8H0+l04/15KH4liQW9ZPkk+7KGK6LdUz9P?=
 =?us-ascii?Q?WpjeRU63PlIAoDyE0fl4EiPSJhpoEi2o0soJskOzntLQMTojlZW2NGfUy7XC?=
 =?us-ascii?Q?Sj9BIc9YnYCM5lDduPUPTbPY4RuUSGRxKYIwnW4C37iiSD3rSbyILKqPRuuF?=
 =?us-ascii?Q?snOh34goeAZky4TvhDw1SdHQH8SCkipIdrP93po83X5xYcJT9SzUDZXZeGRd?=
 =?us-ascii?Q?lwKK17A4SxitqWYsxshL3MKI/Kx9GTtgN3HYDC8csBFInWV39PvXc1cbZSFQ?=
 =?us-ascii?Q?xW5B8Uzl8sEeWNoZREoE5aBj/ib4zfzzD2aPTq+k//WkaAPLtjF4O/eARVD3?=
 =?us-ascii?Q?5izLkArByByFEy3YKBi30vpsaZi7O9uz3WP78ZL+h0Fo7aDPcZM9ZzXR7FLb?=
 =?us-ascii?Q?MayZY5epDDP8qNWRCaqdaJbUblV8o6/56ceebcne0/ungI06NTu7vsjym/pq?=
 =?us-ascii?Q?gJFp9QLZQOqeLUR2vrU3UKtotXMp6UY8Obyl1qtNP/dPriZ42jYDZsPwrSQo?=
 =?us-ascii?Q?8W+hYtaa/tp974xcwnTkFaHVzK00Cf5oGPK15m8g7nY4ZvqIVOw2H7RaoaAY?=
 =?us-ascii?Q?P+kUNcmRrVODn4kwGmAIXxQl0hGj6vDJnUPkQuZvddOwYyXxR7jvv8GUq7wY?=
 =?us-ascii?Q?kk9SK237JZde5s8lXrapVud8/q6FA/nPvJYSJF0W21o6errnnvjg4tNVQY+w?=
 =?us-ascii?Q?9RMOjr1rjNf4fTop6U9FiT+tQQwHPB15qwH4RGSD1dasMTwQeQv2T6c9FtMl?=
 =?us-ascii?Q?tiu0v2MCDGdXzfAyEI4IitAEWD3cKxa/M7WE+XsVy1eILAvPfqsGiJ58lv18?=
 =?us-ascii?Q?36Jc8jdA5anr6LH7DFjoHO/l8TpdeCQ/BDAhVgQ5jP47YoSo4raPok4tvtOF?=
 =?us-ascii?Q?mDVkMyy6SA655HiEwfYJJbLhwRnWMVjsz3j5LkxVY1T0VR7eJx7LqgTc0ngE?=
 =?us-ascii?Q?CvZyd9MJEpCF0FkcdRkeA04MCnRNq6JTzTRoBquRlnI3jbPMZ3m3NkHRSUNJ?=
 =?us-ascii?Q?sNP8E6bFbbwFTHS814Ra9m9IRF0/PmoWgeQoJW3BHP+XMy8h4Y50E1X8aXDb?=
 =?us-ascii?Q?HuQzc7VVPQC066Ymq6VHES8BBgQYmOLucPGlqU4KWPjDlPUof5e+okf5ImTg?=
 =?us-ascii?Q?usi1M7jYuBOvtq/PTTbzS2yKIiHeMEgWoKI4KPPh1BLN7NPMD9EmHXN4Fgg0?=
 =?us-ascii?Q?GfScMJqRgqWyvpCqxnJa0Q9yJyY6c9ivryeTqgroFirulOazfdX3k/hIp2dz?=
 =?us-ascii?Q?ao/l8Z2E5O+G55f/THKE2DPyTZXRy5TFExylEbFJvoPpbOG0o7rnZThuOdtc?=
 =?us-ascii?Q?BnInYASM4oXY3Xydl0HMVLgrhizOsM5CPXT4oFK2Qf5JTvAdftNd0cSfcsBH?=
 =?us-ascii?Q?XHeuu9M/7Qkb3FPufbGKAaDcF8VNRK4m?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(34020700016)(376014)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 05:59:35.4385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf81f268-140c-4ea6-2b2a-08dca7b7f7b9
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS8PR04MB8122
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
index b0643e8aefee..a708e56b7ec3 100644
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

