Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9E395458D
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 11:26:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="::1" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=eoxx3JBp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlc7N5YwWz30gG
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 19:26:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::608" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=eoxx3JBp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::608; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20608.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::608])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wlc7M3Kjlz2xst
	for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2024 19:26:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXuaYBIKPXzpcHWe1z88SpSlMHiv3NLlQ/xq2SAegKn2hp7usoIcRdvWbmEr6EC5AF5pbxa5HX0fcVGYo5j8ua463GqV/cRlFtqc97wHPKh3SWq+l6Vv32bNnDJXH0kzmq1+UCHltAbp0DCFX7VqFq9jDXR1dlmInMw8EwEp0QR4K2v7pEybfPlkVSLw1oZc9SPvYlBK8cK0sMQk1PQ+cVvFt0AG1fAjLPQvkdKI4xCbIUmGTOCt3eGmCGI+m5UzGKyzNQol7ABu4ill2zhh7q5OFmZqige2Bw+Xwv68wMcZNL/8dfuf3orYemhUMnlNhjS9z6TX+VKcYHCDv6p7OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrtsG6giv8Vmzw5ONrss4xcIYIDPtDHUY7eE3zbiJjM=;
 b=gxQ6vWQm6C8MR5O9IKw56R8Fn/K47ujRBaIrkpztSEELy4qTff8BQ/oa6OGO0xmBR7afoRNMwiPlQWc/pc502wIAzbPjZpu32Hue1gWstV9OU1Y4qpcinAURpdGld3qkzVP6pomHnuCYjJvMLuobKC3uq4arbnWI5X3owRrsHHp9wntkrdowPJf6U0kYj3liMC9iY7K1ajmOeHBxmTMw1SZYqvkxaXm4ek5M+ikFgrCqWf1NXTsK8fweRqu9dxO+CCaERxRcnOqrFOCcQUNUJ+ETGZiNexMjeiDTrZzoACR47OXqRCQTSJEGcjoen2kBLOk5kSu/LxHrX4y6d9YFyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrtsG6giv8Vmzw5ONrss4xcIYIDPtDHUY7eE3zbiJjM=;
 b=eoxx3JBpDdUXACAofbYvHBCvon6wLR3ogY+eMdPLFelLQzSYDIRN4VQKLJFT9gnC0ZSEfq9hICMEe2JsnHKrwOe3cn/bcyWKI5EfJi+24l+WeSjBBOjaj6ronJRLIVg68JhLAtNlOTkVldm8Z8xgzy0/H/sV7Nifnxn1witWKQcD2LCsieVSkY4kAlmAumBWk5QhSHk3f4lueg1ZTIY+Fmue+RlNRrLj7SA1OPGx31+8d1nlTNzvXhV86tHRYzYHCfH+KNatVfRR4PXv3X5Iw2hlaTx5c/VNqnsvb4AcoCZ6ql9U9UylmSVD1qYQuZqe82KiMleMaUE3L6TTiVD9TA==
Received: from SI2PR01CA0048.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::17) by TYSPR04MB7521.apcprd04.prod.outlook.com
 (2603:1096:400:46a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 09:26:02 +0000
Received: from HK3PEPF0000021D.apcprd03.prod.outlook.com
 (2603:1096:4:193:cafe::95) by SI2PR01CA0048.outlook.office365.com
 (2603:1096:4:193::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.24 via Frontend
 Transport; Fri, 16 Aug 2024 09:26:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021D.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server id 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 09:26:01
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v12 21/28] ARM: dts: aspeed: yosemite4: support NIC eeprom
Date: Fri, 16 Aug 2024 17:24:08 +0800
Message-Id: <20240816092417.3651434-22-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021D:EE_|TYSPR04MB7521:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0fbeac4b-4b72-46cb-20f4-08dcbdd571f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|1800799024|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?5W++W6CyTFOSiP/D3un8X1ZitDiAPrbiSOAgVguSG5ebR62gaQ+Yfm4Mhmcy?=
 =?us-ascii?Q?0RH445skVfd5ttWijkHFAKXXN7eosERa9p9S2Eooi2sb6qR/RU1aukjpTCRq?=
 =?us-ascii?Q?R1IUWYJPRvFSjF4G45KV7Xr9MDWf61/KROvsGEnNw3E8reidVghqRMu/euR5?=
 =?us-ascii?Q?wsUOdq5mAkQ1ay+Xv9w9HmoxBv46HJZ6Vy+QqLjU32e2QshFxW367g/sA9MW?=
 =?us-ascii?Q?Yul0JU0J4V0o0lfxDW3SZcThymvv+tZLX9gIGQesYVaEs8BN18lq+tc53j61?=
 =?us-ascii?Q?hsR5p3RhWG7VBZ4MbGC1EMqOkYkFa45C9v+YJyvth364VzbCmNykEKWJu3D6?=
 =?us-ascii?Q?7fiRKpuvlK86ZQCQ0w7LdnYx6nDNy7RLxA+o3gtVlDWE6swcSJHt+W7kr7Kk?=
 =?us-ascii?Q?AVrSKLtFNnViH9WOD2iOZAkv5O4V6mqdZyv3AX9ccnfh/NOcPbHJf39i7N00?=
 =?us-ascii?Q?o/6K0gYhQp3FVrhrhbdJhssu+rhb3joBcYMk/xYL0rVtaMTU6nPnQVSlMNAi?=
 =?us-ascii?Q?ABfQNyYbzb2EEIvcGgeJlQ2TpOIJuqI1kC2+/d7CaXd6qz+wR2p7g2CWS9F5?=
 =?us-ascii?Q?6cYn9dBROY90uGP1RsboZtrMeb+eXfx6XpfwsLKSoRCg//iF2Vb2P93MFtGn?=
 =?us-ascii?Q?VfzbJDcHtHZ/KPfXhzyGis0ApfJ93iyA8ct5YjA0wJfNdFAjr4TdybUHqrRU?=
 =?us-ascii?Q?sQaPO27QxXC7y8CBOF8b+F+4oS3XwRx3AdUI/+UP1cYq9XUJpYpXbIfJYkf7?=
 =?us-ascii?Q?Pge5PU+q9XbxBvYdYY/pMJZ6MgLKU2vh+WKNQBWBLdESYH/UWqGFGMlSeP7p?=
 =?us-ascii?Q?tq2BVThALeR2wfCqhaWBMmrISXk/3k3Qfdsx5/qCcOsCLVdnHi2ierZw3Erf?=
 =?us-ascii?Q?xDBWoz467+NhJrms6CgtxycPUdU54brLPkJwAgDG7I5QgeR3MT536loCJ1fD?=
 =?us-ascii?Q?g08vGfVSqfqNsq/cw0uGRrIdU+8nyloSxsmtjnJPW9pIHK5VWKmAdC/Ym62q?=
 =?us-ascii?Q?S2HX1lj8WozcYAU8sSkO3I2o54G1KS0cs8mvUJOGJCvIcnyM9MWC7+g5xwr1?=
 =?us-ascii?Q?CbOYn5AT0NMtTLPi0h6CeVuNXUEF5s3ccrT05Jt+SqFzL8UjIMYQ9WvruDPs?=
 =?us-ascii?Q?WJCh46QG7ypvaoFMT9dZOEsKrDM7Qx+gOtbkr2lmn4j3C1pD9SxhZ9iWA//d?=
 =?us-ascii?Q?vuwqI1dgxbk7FYIotrI8eoSn5TkbKSV7hQgLZTZfV6SpD13Fz0vx61TNdi8a?=
 =?us-ascii?Q?ReeaShyscbxVLVZ0G+/s38/byUK8g+IY7fi8Cfuk8QeMVWxbjWlDj81FYjon?=
 =?us-ascii?Q?QKADjT1XG13FK+9SXnAg4kVEM/dC53cU62GB2fcKE4Jfk3luLjgoJ5Ega2Jk?=
 =?us-ascii?Q?C2sSvd7uiNzLtSIUYteqoqOG33FVSckTwGWbxXQbIApcF4ji3wzqwnckwGC6?=
 =?us-ascii?Q?psadiF3RbSFVMibOwLaYTkn+hwjHxWkv?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 09:26:01.5285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fbeac4b-4b72-46cb-20f4-08dcbdd571f7
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7521
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

