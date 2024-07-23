Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C9E939D97
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 11:25:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=JG2o5t+r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSsFR0QG5z3fK8
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 19:25:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=JG2o5t+r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::62e; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2062e.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSsDl2zb4z3dSp
	for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Jul 2024 19:24:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sDus9c8x9qqfoizVgoAHa0kTDQiyTXWt3woZD8Q4WvwZJCz2hDnpr9sxzo3QbnNlMkd7xrXmoD2aIAS9+O+ApA8PAsYtSGB95i6SqTsQhWKvz2N40ni/QVyBMcM8gk/FwlwUAiiGzv0wVkCHHQM6kl6Nl6fRV7hY+Xr2OxydjyT/BecQvvpX7TACDrRpKjP3NFOxud1Q/RTVe/0YNbmrobmT2Dw7x1SpnBuEaWIgUhzeQyBqjyLcwOx2fu0XOWSWbbgjL7odUhCt7RCzAXj/OMRktuoNpU8r1fS65rE9dYJ1vS6W0Y1/DKWNHeDOTxwCLQ7DAOpoFhCLTYulv5JSwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrtsG6giv8Vmzw5ONrss4xcIYIDPtDHUY7eE3zbiJjM=;
 b=DEgIUevDOA0P3+oRPbfBz64oZBPatvjDulyhy5mjo2NR/z3v1qkepj2TPIDcyOEXFoGhQnFzFGa6bZ/Ys7yviDkvwP6LwNt350IoyhQWneL60f8NInJ+ngu6xaLp8EtoBXTbEvLz8zI2+DH1A43Khx069JAcJPg40WI+kZEjeGduCd5jTRsVy5/+x99xglIPcoKjYNVQsZ44cQui3+c2HVUGpB+aDM5I8j4Pl18xyxNJdNlG5WVWwhwWk9BDSZcUtWS635ucFEuDf/+zYUDkQnr44XDQy0Z5FQFNBjEIU3TjvHjxS3VWOHfHNQ12Ob0VnqqjLMMlsJ//HZGu6CL+7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrtsG6giv8Vmzw5ONrss4xcIYIDPtDHUY7eE3zbiJjM=;
 b=JG2o5t+rxUlrVhABJPO7ARlqix4oq/bDfIAFFhN2D9hAhCKnX7eNPlbiXdWjw1cEP2TtWMnXX8i/Pv/8dO7gFxEPrPtrGCc/qzAcU0Os1NNoUol0/GRQ4pPHixp7IUDq7KBwnAMi9vMMHdfdkCRa+SOXNBYpruKN+hQrSePJnhWEUii+bHdNm+N00bhmQ1nnDudybxZM/KCohVljLuirrijA450AWUjQDNVJFb2l3xxd7bAujq+7CWD0nhbrxWceA+fxWbL8lZqkwlAu9pECnR2RFA9asyMAav6Jb8oXJPGdQcp7lOkpYhx1dyt+G92eekjjR6zlM7kLR3RdvwHniQ==
Received: from PS1PR01CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::19) by SEZPR04MB5873.apcprd04.prod.outlook.com
 (2603:1096:101:7c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.9; Tue, 23 Jul
 2024 09:24:35 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:300:75:cafe::b2) by PS1PR01CA0007.outlook.office365.com
 (2603:1096:300:75::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18 via Frontend
 Transport; Tue, 23 Jul 2024 09:24:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 09:24:34
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v11 21/27] ARM: dts: aspeed: yosemite4: support NIC eeprom
Date: Tue, 23 Jul 2024 17:23:02 +0800
Message-Id: <20240723092310.3565410-22-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|SEZPR04MB5873:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6bce0241-1dd7-4560-41d1-08dcaaf9446c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?BG3AKeoKii1qEBwY1UvNi1jiPiEHqPZNK+iGw50FFV9dU+Xd7IQk+bvuwZld?=
 =?us-ascii?Q?Af4x/N2VQ/MRgT6rRu9WgPwkVVudCB4DWTgMgkgEFEA4kjnYtKQ9TxvV93A8?=
 =?us-ascii?Q?xx3ACZ45MfBqv+nWn/UNyMDMM3+3lbmpauRTxoHpIgl7Am6CgOnL+yZfplcT?=
 =?us-ascii?Q?6NRCr/J6bAUfVMpqys/epNWqS7UV/joNY6aTZW/YlYZiFUuY6eEjvDDeeu5E?=
 =?us-ascii?Q?utP3Gwes46RCiEV2YhFyt5Y/Rx4VufONOb9ouTTzR9AfFxl8T0ZmHNa49kKf?=
 =?us-ascii?Q?foHJHhBa/WwUSoSEl5n/AeTvdc/3NMapSjLH5SG/LV+DLT1NcT384JA3V+rR?=
 =?us-ascii?Q?cI8otbwbHIACiiyQ08KkoTql/9fqCScJUH56LzmXwsvlIziyE6XBXgdeN8HA?=
 =?us-ascii?Q?G9I7KEQVJ7/dqnRovtXQFyX+ghXbb0w7AzB4LT7dMzU4T7vCv9gO6ZCJwCwg?=
 =?us-ascii?Q?DeI49UaXNdEIwbyF0qF+t8AB/wT7ypZj0XO4MvmXYmOH9q+wrgQfYvn/y3QU?=
 =?us-ascii?Q?VYV5CzFwbFBBZookZ2HxwxKgml/gE614yVtxsbM6xiPt/PSfhMGfKBG1V5uR?=
 =?us-ascii?Q?bJ67cJlogfMTVdkaLcxR83iamKi50mHoVRGDLFS0wPtjJNa6mY5B1ujXvis+?=
 =?us-ascii?Q?m+qgrxxO9j9U3A6GYV1wiK4V3+juPBd8NAzVYM1vQrIMMNWHy/zRctwf/GVE?=
 =?us-ascii?Q?UU53Qve2Zwa8UssZRheXREkvTR4JdwlYQoux+XbXYUWYmJT4FsRytJt8a0aq?=
 =?us-ascii?Q?UBYazu1iGp0tg1gzP8qFEhLq+ZP5a4NGKzyEG4XQIKra9MjSSctZfmz547Hu?=
 =?us-ascii?Q?f1aLM9dz+hZJcgXTW4V1+OsXs/WGQq0fwwlPtSjlQRSx+MJYCDuwSI8uE8jW?=
 =?us-ascii?Q?rNXI19hQaJEWN+EkxzZ0V/nUQwbZ+X21I5djCzWscQu0UtfTOMPnTINq/hL0?=
 =?us-ascii?Q?JgIQ+AknVleA9Dn8ZOAs3fAo9mu26eW/0FYUFe2nmkjqSDojc/JZa3GHa8YV?=
 =?us-ascii?Q?Uke1qv/O+gbmIB0S3JFw39hJ9SJWW7BfC4SpiFB8rB91knQwMTYsWRYZ1k0w?=
 =?us-ascii?Q?YZO8++mrL2wjPiN57MLehLGNbuIa8NyM+hzBoXsSBDU9M6JeI4aJSpIuC26w?=
 =?us-ascii?Q?Ut8NA+Gz+DsFejhDfKscfaScGFQeUGk9DkIsj05qLZ3sdwqOe2v3eUw18EY/?=
 =?us-ascii?Q?REG23vAyDHZENSZbdYfK5YSxc+D9MT8DQUNkbZX8rWGSXEY1vhRuTx0S4Sie?=
 =?us-ascii?Q?d4opruOS6moczZW/80g8V1kHpPgLQiHrzYBtyHNFrILu2KVANMs6WBLiuV5J?=
 =?us-ascii?Q?VZTDbouIxxQHtpJbQZ3X8DE7dtafcjsQdM/pYW14EEyMoBEMVNipsi5UfDHH?=
 =?us-ascii?Q?KkFn+BYMwRBwJ2xALDQy1ISi+ENYYrTcyB9xKN7RuwKq3nZYbbvWRiO2jSl6?=
 =?us-ascii?Q?87wwjIzSlrG9Q3rEgQev+bXwmPeRcVRt?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 09:24:34.8791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bce0241-1dd7-4560-41d1-08dcaaf9446c
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB5873
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

