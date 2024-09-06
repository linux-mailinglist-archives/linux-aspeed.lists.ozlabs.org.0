Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B7D96EA54
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 08:28:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0RBx09yLz3cJW
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 16:28:57 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::620" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725604134;
	cv=pass; b=APEfziHhcJpGQ6eGxZSdqPH/t/aj/DLibY3JCivr4ntNvypkKHZ7wPzG76Gt2uqL7g6MX9C03pEOmsxQPys+luFGY6SXz5WfqOWV/dDrsNas5rCwfuaj97NJS/h1DJpfKnWvhPudApaXBaDWFO1F6HTC++YLsbIh3ZZxML0FdZSV9e7rFYfL7zk+jPhNMPMCw2TVgFyxHSp87Q8VaNU/i7TRhGiKVy9vv2UTEmpHrSowH306cVGi91nY5+ICHRSjAwJVbRE6orUVVxJZ/xJXu3nd81i+1Pf8YkSr2sFIhnoUeN4Fny+G4pWTGcrCtkdS+ZJiJpu3uafKIhKLxEW09Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725604134; c=relaxed/relaxed;
	bh=zrtsG6giv8Vmzw5ONrss4xcIYIDPtDHUY7eE3zbiJjM=;
	h=ARC-Authentication-Results:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:Content-Type; b=GnxpCO7/D23BTH84OSQDWh6/faQ+6ciyHMiq4w67PTmVeGgiWptcJfpPaWF7+2AmaBEtG3SGvUBkGB5wiPZIqs+ajtpT6mTYo3JlMQkJrYhH4ppHRD5RYN99ZBHCk8vejO0GAQJ2MdLZd+zcSHqUfucU/DmRgdiMucguf1oByWhBxFlT9WvtRvz46ZG/WOB1yxmAowUyV4V/CHNLWRTpTpYGRYbCHuPGHh12+cTjKvFOyFiShF+uPeLKvvLRqPc77NpLHLthp7l/ehT1I3bX2YCZRhwCMNDDnIeFEs04ycYIJD6X+Je85CdNtOVUcr4hb9ii1Sxm/a/gO06tmEqllA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=R2ek7AmS; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feab::620; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=R2ek7AmS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::620; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20620.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0RBt45rbz304C
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2024 16:28:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+dnUUhP5WRs6uNycZpmUnP7LCvyGMehSYLx+zUVKN9Cde3e06VyO5ElNu5BjvBtF3mZ43iFWNdw6fa2kBtPffrRQM1GDGrVMq0oo0YT8N5rdD27sh8eCHc5m0Qedv/s+ksQ5hw0dW3N53f8U75EB/gqWtV2vasYK53uY9qWgUhNsHZgsvg8LxRlovRz3qJGpcr9HQ28B/EbcZfv//92Z+s2X1k7X6Ggadk63FvPF73DA1aOsXdXLDxL1J42NINivE/IAYuh+rtvPXWEdd89VEagtv50N5n6Oqz3IcEMEaWngKl6gKNXW+RPvTtc+EeEewIJhuNXXIqCFes5+bWBdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrtsG6giv8Vmzw5ONrss4xcIYIDPtDHUY7eE3zbiJjM=;
 b=NOEBhzkyvzw+mRX8xzSIqHbp+uXPjQYBi2obuBp1oMlzzkyDJziH9uBAz4y6hRSQgFMmpAq6pd70iVhfJ930/ggOklK/hKxTgQvN+EQDgEJa92cE+ZR86m/7aYHntCSdn9rUjEUKL1wdIcshwr+4biYAgTq9utXmsbgbTXRMIgGRmut7a3CFg03n8+lh/lgdjcW/Oe1SsJhLl/yUp+KRVq2c7GYuh48kNzWLY0y1t3IU+En7Nb7lSoUQ3mzDlC5fhti7ndwqvzB9Xwa9Ax8uHR0f7W2NGSAaQ4y3Vhohcya9eo2t/U7qjQhjsxzobiFDCVU09k/J7DUBpiJjnMLnfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrtsG6giv8Vmzw5ONrss4xcIYIDPtDHUY7eE3zbiJjM=;
 b=R2ek7AmSaO6e4oiRuHf2aZiO95sJJoOFkickVHW0fb5cFFlDHYCsxQi7jsP6414xPBQXXVcl/zTVwHIcZCfhkPI/04E1YV24Qy+h3dYOG0RvHAS2OxiNuv2aVUvbNOe91J/+LHoTvwW72uGICoeW68KEI+WRlWb35BM/ER6x7gW9ASc8ay4WvaR2ADWIyKc7rymPDIAwm+WkIm1bIqb3KrPmgXPYORnmtYQjE9t6lBxNprTcQ4kkdju6TrYup0PQ5JYewRslNxb/hSCa5PnsCOkDDD9chozuKrCPaxFgLIxoPswpy6pX/xwLYgD0KQt6kOpE3QBoELn2OJgu0I96Mg==
Received: from PU1PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::17) by PUZPR04MB6536.apcprd04.prod.outlook.com
 (2603:1096:301:f3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 06:28:34 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::28) by PU1PR01CA0005.outlook.office365.com
 (2603:1096:803:15::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:28:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:28:33
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v15 21/32] ARM: dts: aspeed: yosemite4: support NIC eeprom
Date: Fri,  6 Sep 2024 14:26:47 +0800
Message-Id: <20240906062701.37088-22-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|PUZPR04MB6536:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d9ddabec-6a98-4a9a-c042-08dcce3d2212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|36860700013|82310400026|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?L3z6qm4UddWfhTwJcbT7/TauaypxrlsPWhftAXPWtYoQ6xG63OS3zGhCWK3K?=
 =?us-ascii?Q?hBZPD7kPcxHYRf4kXUUYkDw5jsELNiQXrDSKaYsb4DWYHIqHc6HP8TWBbqMY?=
 =?us-ascii?Q?DHRqtaNtDgGe+TW1+cBcBTIsznsEIiufwCQteNih48ia9+t/cxEp7mQqVR5h?=
 =?us-ascii?Q?/15QJUgNgYO7snzYxZQt4v8LoZvN6tiaQTbrve3ZQ/HDWp3Nb27zyHrsus4r?=
 =?us-ascii?Q?BXovOw+5LUuHRNXNVYnUC0t5KD/tuEfbYJLzteUmX/BLjV5Tm3DGsIeOWkne?=
 =?us-ascii?Q?pUAnX6TjlOVrmyNj1KSUQfWtE3DgnoexZkVVxQD1+yhv+xWTzPuQVEeGGcjr?=
 =?us-ascii?Q?R2ub9//AfJnGcU6JHg3VIpe7x+nWELPCZPpx4FAxSibm/wATuG4yvJVWtcDX?=
 =?us-ascii?Q?vQ504aMMyoqGMObn0hzD2Zm4Kc5mlBHML0aw0KDV6Gc7IILvjs3gbk1boO59?=
 =?us-ascii?Q?THBvt4OjYczI8so1dGN9B9fkq40zO2pzlSDeVQVkxvsvQeXK8YagNmankJes?=
 =?us-ascii?Q?aJbi2zJD1I7Lbe0rivOikI0yXDBR19riY+HpoOmTMAXuPBtkPsedfHwovO3c?=
 =?us-ascii?Q?pVXQtHfVV9p5sk1z7OcnmJhzt4cPeyGOKM4Qh7ppDKYqfJTTi63Pi9bZgx18?=
 =?us-ascii?Q?MwuUX3SnsJMmQbRmJeKR7d8dcf2IH2VowMzlJy7NWaYVhNmUakm7sp2CplQo?=
 =?us-ascii?Q?b6uTNU2siMoLL68m6qVgHInOyMb3SEmAM1lqpVwIC7UFCGlzNsak9Ctz1qaG?=
 =?us-ascii?Q?UrRvYW8CpmOYSTA3hFInmGGNov4GSd4r2rp3777G4U+476KuaMCuIfvGCg+2?=
 =?us-ascii?Q?4jMuxz2tQgEgSMdVuqUNxBIrRarBha4SxE5AQlhXl4cd6iSzM651jGdilJb1?=
 =?us-ascii?Q?LBHstQT1MknmAIXRv110qOelo8Fn4JNkr6RJDpwtLb3VctgU2iMg10NVeBFd?=
 =?us-ascii?Q?pGzd6LRyxbmz8tzXs6UHZykUzMfg+mHLWCWsq6+bpffxnUt2uqP0BVmTy+6Y?=
 =?us-ascii?Q?c+XPHkXphhD99BBTb9KuQ9v3CSR/8ebn40qrOQ0p9/vuPDVUMzPuEg0bgiWT?=
 =?us-ascii?Q?tQyvo6YWYtETfmaLK0QiDcFQc6RQg1xlY2H4zF4IVOngk/vAWfyri89mIhnU?=
 =?us-ascii?Q?1hJg1Yp7AtJ1SV5oTZBycA8Pz+eIbAx0WD7EHDL1wNq93ThRO7JPRU6tlci5?=
 =?us-ascii?Q?e7od+DQolDdpZw4wT0W6L+h/+ebWm/3R4N6HVpaYFCcrucAsKrcqsN1Z1nSU?=
 =?us-ascii?Q?F4V9f6bkkbjTHNoLPMyC24hDrPx2JHOha2wn+uIHg7EFtMKhrGks00Jr/QIQ?=
 =?us-ascii?Q?+Sbi5NbzeTW2kr/ljZ41nKUe2mTfgB+4kTYjNFlvX0Pksj4niWFTMClt8Ut0?=
 =?us-ascii?Q?LycIjZdW8CeYSlPpPTbdxhGa1/JdO7PB4vt5mnwxtuzn0C/i1HQJPbpOYv5C?=
 =?us-ascii?Q?u/R07nKF9WxAPD/ErUbz7EDPbdUrC/zS?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:28:33.6936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ddabec-6a98-4a9a-c042-08dcce3d2212
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6536
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-aspeed@lists.ozlabs.org, Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add NIC eeprom devicetree config

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 49500db53a13..c2994651e747 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1338,6 +1338,11 @@ temperature-sensor@3c {
 				compatible = "smsc,emc1403";
 				reg = <0x3c>;
 			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 
 		imux25: i2c@1 {
@@ -1354,6 +1359,11 @@ temperature-sensor@3c {
 				compatible = "smsc,emc1403";
 				reg = <0x3c>;
 			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 
 		imux26: i2c@2 {
@@ -1370,6 +1380,11 @@ temperature-sensor@3c {
 				compatible = "smsc,emc1403";
 				reg = <0x3c>;
 			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 
 		imux27: i2c@3 {
@@ -1386,6 +1401,11 @@ temperature-sensor@3c {
 				compatible = "smsc,emc1403";
 				reg = <0x3c>;
 			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 	};
 };
-- 
2.25.1

