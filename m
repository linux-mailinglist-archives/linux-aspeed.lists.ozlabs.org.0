Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFE5937385
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jul 2024 08:00:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=oKTen0wY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQJv62kbtz3fRy
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jul 2024 16:00:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=oKTen0wY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQJtW6ttBz3dTT
	for <linux-aspeed@lists.ozlabs.org>; Fri, 19 Jul 2024 16:00:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=giZTT2qpoC0lHzJtB2ZFGHFwM38hLlTb3NuV95T6nHO2rOV2FnEqQ2lpdMjPzTTWB96/wEeihvNHwoHnYzsRBnK+2oTkv+q28iAoJl64niDWiXWNHtuju5UBYOkFoHDVybNwgt1o4WrXXooeCcZAqF9+MukZ/VzBwx+22Po2AX3rEbEXcwZ0TMRco+6M3GfKvYmWV8CEH/j2T+jBWKF+bzdKZyaBCr7HuToR3R9+15qaydQRG3COrpIqbKZDe0KaYASv7pW/yM1Zr9PNnVA6cswK0S/SEHvkBLeuCHmxiXDNxSA5MZFM/55dGCvnN7vNsICvC8YvbNoFkFJZB2wdKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S11d+Rgg5XKlgMlTPsawAewq2X5TMPnusGFqrYm+mrA=;
 b=Juc8XQAYcmr3QP1kX8bm7xNaxEnFkeh5Gn1Zpf+Gvu0PoaCWFcauUTQtvvHC6MCEahiNkfP+Gc1Rhzy7Cxn5ola0IGnjmC3+fqotl+QYh6D2M59bQue1c02lDUM1OHhcq1+dpPYLZIl4mveMZ/guWxdqWhIKhVkRsnhnabVtl0GMuaJx/ihgQYcbDKt8DlGQmHSAVKTqYR5EiieWhsyyr2bt02Xalzyve9iWae2WKtAci7Jl4hXcswOtRTHLzqWLNgaevK5MjQ9v1kEHUAGKMm9FTmcLe7FKHrQ7qNnVHVaRsRJdbINITT3bg+ksHW1zmmWPLLL4usAAna94tgdraw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S11d+Rgg5XKlgMlTPsawAewq2X5TMPnusGFqrYm+mrA=;
 b=oKTen0wY5j3uYwuYI7/jD24SMDCf8Rm2Yfv987F830FtPz62BMa1x6MEnxjWbB8x05SZ2HmlmsGcIuRLniTGPy0ifAwlxsfJFuj9bH2/a2WU/vG/uX6h/E7My2EDRBBXEUjRZyInPnKgtL02rLX9FC5zKq8XHb58QGgitfhSEl8otGDUTJeiWqrUq6/NcNmuQkiOngBXmgRPf7lwRnERSW4ZXltybETvgQyzDhAZLPN+oLB89mxeoStJKZc0oPDHZJO2nLQ0e1Kdh/jjK/jdHQHTaSPJnzqJORrS+uMyQR7NlvJWPXxbXxIWGr5q/PxRAlIHykRRKcyHEh5t1lbL2g==
Received: from KL1PR0401CA0036.apcprd04.prod.outlook.com (2603:1096:820:e::23)
 by SEZPR04MB6657.apcprd04.prod.outlook.com (2603:1096:101:e0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Fri, 19 Jul
 2024 05:59:56 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:820:e:cafe::22) by KL1PR0401CA0036.outlook.office365.com
 (2603:1096:820:e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17 via Frontend
 Transport; Fri, 19 Jul 2024 05:59:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Fri, 19 Jul 2024 05:59:55
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v10 10/27] ARM: dts: aspeed: yosemite4: Add power sensor for power module reading
Date: Fri, 19 Jul 2024 13:58:39 +0800
Message-Id: <20240719055859.4166887-11-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240719055859.4166887-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240719055859.4166887-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|SEZPR04MB6657:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 18577245-fb9d-4505-3fd7-08dca7b803f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|34020700016|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?W7ukNkk5iynlbPeUD+pSYdVgQ6cuK96XTDeIjDbBXEzEFwGek6EL680aGF/c?=
 =?us-ascii?Q?UOEXRAaM09EicAMzMQzgB+7d5myLXrsGtf9zP4x/2Vtg+GwFcoPW6K0G28IP?=
 =?us-ascii?Q?wX1ap96a3DTMYohETbIuHZGSIOVXQBQEFiHbvGNMoV450b9PrqpFMFXfWbTV?=
 =?us-ascii?Q?0IWZENLl+aCNKFtBcRLRiHidJlkRzhnvsEyw9TgW4MwjGhc5x9Luvi5wT57S?=
 =?us-ascii?Q?yBYgQKOsehmzrLrLzzxp+47D1cAvuYEIGdJFu5pYZHxjCVLeI6ZXMe+diaFC?=
 =?us-ascii?Q?mNU08uvmT953Wpr4Kdx8f2sLtkBIbCp0FYr10jsw5OsNSgGicXLQGCp/UFkx?=
 =?us-ascii?Q?4XdUFFicnnVdQLlpVdBIH7KAvAGOMjSTR1s+/+Lkl4w7imFVW4gGM4X+1pTq?=
 =?us-ascii?Q?E5R7aOslUTG3SNrC/8g4cOryfk70suingyscCrHgHTYtOBnuRov/5kaLV9xu?=
 =?us-ascii?Q?dV+tuGy+ZSiwPryiv6b9hS5bnji78ggwptXR0WMuKL1Rvb7ZUr2E74IhAH6X?=
 =?us-ascii?Q?sMH3VXJ+7JwMe1QoASzLvxAXdImrpGWSQ9qOHxr556LKv/NFMB2rJLuvivbn?=
 =?us-ascii?Q?HuKtyJ21csgPv2EKK0I4raMXze6CuXfM0Y6fEeOmlUa8DhEdRRf490QBp9dh?=
 =?us-ascii?Q?8MjPXIcjZQEaGsI30Eluo8zxYp5CQrCIaz60j/F0svv7MdKx9ABmOOtB3+Og?=
 =?us-ascii?Q?p/TO0Ub7JDaJ4/8kaXFum4hkV4+mf32oy+GwHsZ9NxScNhmrg4ecbhKAkhyP?=
 =?us-ascii?Q?mXsd4b9TNnmIZgLZnJMEdKvhBTFCT+SNI30KNEsceOs1lE2WF94UMpCQX7f4?=
 =?us-ascii?Q?HbvRz4nqR8bZdD/QiGjrPZ1Akiij/LuNC03n80tZZxdMwanYcRbtBSH996Kb?=
 =?us-ascii?Q?bCD9zwk7rWR8oq5nvY/KkvDrZyclEPYbscnoNwl1H85XuxV2RfxsRrzLQJAd?=
 =?us-ascii?Q?QlzhvQlZW9qgn78fsMPwKJHHdrf10XRqsohdhj3+mDpWt/OX8Bda+PBBg/uG?=
 =?us-ascii?Q?JvhgBgmnZ8OGWCZRnkJc9KJTHuCb6vIStjfAZWW9sInw1vVsqxbxQEL9uv72?=
 =?us-ascii?Q?jDvQRkPEbB2D3ixLpyq5rSNDGzdHX/w+Ab5IBdG4ygUCA1ItXfRQanWltpPy?=
 =?us-ascii?Q?DQbyVo7KAtGg+wVle48E12CLv6BogHgL14oyjYJ4rpzrTaNetd/iMtlOUd7n?=
 =?us-ascii?Q?FEtdpXlux7ea0JvSzjBX+TGjnDXvfJNECXJcurmjPTDwYellz1oCvf3nxHlk?=
 =?us-ascii?Q?DZlZ0/v74YHapNbGui/C9gSz3dCDqq7sBeOOsXd+c93czeyQrr6J/OSJ/Y67?=
 =?us-ascii?Q?K6SzscEHfC0DgLQafSMpjVRvId85Dc17W0C1EJo0qpai0Fp0PDiHH3enSAGv?=
 =?us-ascii?Q?8CfeoZHKgBNp8Ob9+xdo0Se2vpTzx8AQXL9pHNOn+s+OedrFwoFhx/E4p2dt?=
 =?us-ascii?Q?HKFzq8A7S8+qyrAzySf4AoOz4l+DpDBD?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 05:59:55.9387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18577245-fb9d-4505-3fd7-08dca7b803f1
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6657
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

Add power sensor for power module reading

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 92733a8ecf0b..2ac872878acd 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -906,6 +906,11 @@ gpio@23 {
 		"HSC7-ALERT2-R-N","HSC8-ALERT2-R-N";
 	};
 
+	power-sensor@40 {
+		compatible = "mps,mp5023";
+		reg = <0x40>;
+	};
+
 	temperature-sensor@48 {
 		compatible = "ti,tmp75";
 		reg = <0x48>;
@@ -930,6 +935,26 @@ eeprom@54 {
 		compatible = "atmel,24c256";
 		reg = <0x54>;
 	};
+
+	power-sensor@62 {
+		compatible = "pmbus";
+		reg = <0x62>;
+	};
+
+	power-sensor@64 {
+		compatible = "pmbus";
+		reg = <0x64>;
+	};
+
+	power-sensor@65 {
+		compatible = "pmbus";
+		reg = <0x65>;
+	};
+
+	power-sensor@68 {
+		compatible = "pmbus";
+		reg = <0x68>;
+	};
 };
 
 &i2c12 {
-- 
2.25.1

