Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AEB937397
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jul 2024 08:01:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=YwQtGRWm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQJwB2CpDz3fmv
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jul 2024 16:01:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=YwQtGRWm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQJvG1lvtz3fRn
	for <linux-aspeed@lists.ozlabs.org>; Fri, 19 Jul 2024 16:00:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IyKrCy8b8unOMdQ9R8+GEMR2sYptKPweMh05/i7/T3nthlaIkBus6RUNQJgUGzINqbpRPtE9Xc4N7qJltvekc9iqiX7PqxPmCoGVXzUl6qLtc4u6JZ8qnoIQNHsznoUVxLwq3lyX4sIwamGTiFSgN5mfv8j6fBqG0l354LCiJ7wswj9+533msBlOAqQa5B+Gg3Cy2sJyYX4kMuIQIrxMcoV2w2KnZDWRF1ngCXfiFOwoONHEusu3XPeVSPJr+ch6LeuOvXcUNp9HZSdWsOhX0IH2GFiG7UsAYH4f/BeYyOTOx6CWJRs1eCeXzKOB0LmquTFlkAxNHjN339AUf1feQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5nLOGzr+7KZfcZvwMsTgIEus1J7dxSLeXUDVhNOLW4=;
 b=r7cxeX0PaQwYQtPKKtGXovkqysXZiiQ+HsP4nVZvRM86QHASRn9qnbWzACmuQpjgyf5Pwfcfzw9UaQd/8KWoumf5zPQDmEdxL9J4QWF8GcqSJIkdSGW1+Zt2X0MiptgcDPN8O4sANwUuRUo0g1pmpTKw0KSkPPzoNOFmDDWrjfN77FKTchVQ22MTcGoiCokPOcohW5wAaBDvBa2WhSpSCozGAeEYsC6j4meHOtn5iY7kGbWUrjRsX+krYXITE0824UgGlttdUdSLVjulsedk4ZDwBP6kODl/WUbeXlbYXVTLz4sYbu8xE9tuHpf+LoSU+P23r94A1puJOByrzQzQ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5nLOGzr+7KZfcZvwMsTgIEus1J7dxSLeXUDVhNOLW4=;
 b=YwQtGRWmkGQtowyunEL9Iq7LB7tAqiXSX1XXMdoJiNDDrUr6U+jezSs/N4fKfJmucO9F+QmGWspmX34xInfOUzfH8jRRnvHjfiheY1FvuBzS5H4vTLKMd2FNpOB5UXA9cYCEGvCK4jAUy5o5lG997Pix/ei6qsLbFPnZpcTNjPa6kNfzFaDy23vu2hTOZbt+CWIrJUB9sN8KbW874or78M81x4bZaHj7VbV2MHBICm6XRM66PMEU7yQUoIvAbvElytMGTzZdkC0hPC1gsKHsjj1W4ik+hWX1ODJzSyip3+G5bGpwqB56CC3geQ6/ixl2BarC6ho/kCoIu/2TmTiOOw==
Received: from KL1PR0401CA0021.apcprd04.prod.outlook.com (2603:1096:820:e::8)
 by SEYPR04MB6752.apcprd04.prod.outlook.com (2603:1096:101:dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.7; Fri, 19 Jul
 2024 06:00:40 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:820:e:cafe::fa) by KL1PR0401CA0021.outlook.office365.com
 (2603:1096:820:e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18 via Frontend
 Transport; Fri, 19 Jul 2024 06:00:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Fri, 19 Jul 2024 06:00:39
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v10 21/27] ARM: dts: aspeed: yosemite4: support NIC eeprom
Date: Fri, 19 Jul 2024 13:58:50 +0800
Message-Id: <20240719055859.4166887-22-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240719055859.4166887-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240719055859.4166887-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|SEYPR04MB6752:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7f339f60-2214-46f2-5663-08dca7b81e13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?OkhglmtuYjpOzSxz5jKTrhIUgG0pAaxnNP7aTkYIA3xjjjsM8M9DS8xX2c7e?=
 =?us-ascii?Q?92IEq3wyS1QbNJy78KEsSMNGmoxTiSaqtkEJNjeSLY3Ed++oXOqInoCgUmQr?=
 =?us-ascii?Q?66gjvil5Bz3UADremUormJ4sJDXjCzAdAn0e75X5UJ6aCKkIpyxsRbxHz0bq?=
 =?us-ascii?Q?Xdbpm1hlNaRMNwdbV9cqdxGMfN2m/TZEpoyG0dKBo6jJvyi+n6FUmWrtvkpT?=
 =?us-ascii?Q?BsU//rcZ0ODyca71Thi0UJ3hNmXOTBHFCSVpEX9O2SSGlRT7KdY9uCQUBzPZ?=
 =?us-ascii?Q?xAa4oty2LBRX4/OXv/ZXeyqMKnA/NkBGJec1zqkGuWHosO76IMO0JojIXOD5?=
 =?us-ascii?Q?DkNfPVUYkO1yKCc+KmV/48EJjN0krfSGEtAtWJv8lk/uNGi4bGWnNstNOHtb?=
 =?us-ascii?Q?QSPgBD3hBDsiBTGAssFm5az54ezTBC0EFIirldxSRf1EteWJmNLKPbKpvKf3?=
 =?us-ascii?Q?i5AOZpjtUeUZUl8PIMdl9j4PPAI+6Tb1mCgYflBbDWePmMMYCQruy5+7N7SW?=
 =?us-ascii?Q?8l0B6qSd0m8srFbX8HQsjeODmIKe18pNrWnmadM5GsATuNk7P5ABGWoaTUmg?=
 =?us-ascii?Q?9lEyB39JviFYH1fqhJvGVdWT+NSJPFf7hfmiTAAm3qfb0TflSD7Pa7KCIWbK?=
 =?us-ascii?Q?WRHxXLt4uReYhOB/2vhzWpLiRySWjfYHKggFElUqhfO5HOLGgcDKvDAFtr6Y?=
 =?us-ascii?Q?mDn3Lq6lhAna3OA/m2AAX54DnJL3aXbGGTz37TR+eFUMq9cZ5zOrpirxRIRD?=
 =?us-ascii?Q?+Aa66FN8QzltxfgNEtcg2cXoL37SQz51Hb6/18YCa1YxMFC9i7k3lBV0c5MY?=
 =?us-ascii?Q?FFUqTEME1Qm4qpT5/2QRXocdOglKX7L8ps10Z2HM8yGEHgrKWryaGWh98PVF?=
 =?us-ascii?Q?naG991Fu3jD7TgznOFq/rc8XeiGviIdDswiTAtgpckcvMFn17kweQmr2uOAD?=
 =?us-ascii?Q?nV/sH144ndb3ShK1DuwSaOS4V00aRPOGoigLFmAYO9ZfkmbWP22l9VyJ43D+?=
 =?us-ascii?Q?8mJ962VH46jgv4kbIVJP1v14tlRIFiDUioDLe6W3g2ta1mVpbpnVRQWm6Qki?=
 =?us-ascii?Q?c24JiUXQkG3kESFc/gSLaZxvSSV/JfRd4FAELJa4nU6Wl6DEMaYpsQ4t+ZWJ?=
 =?us-ascii?Q?9Z8TtEGnblePOhMWz2QQaXBAkr4rPyYZNvdbue4UbCdXrM4UcRmTLnlojSku?=
 =?us-ascii?Q?Kgn+42KLohMQCQem12PfVKYjioiNmQNBuXUhDkp6jdlpY7nr+xeZL905K9uS?=
 =?us-ascii?Q?R9PQXLkvShax7TkBmNj9pe0y0wZ2An4A0pgTQCGpLH96DTh/Nst8jrI4HG22?=
 =?us-ascii?Q?tQks8Le1/bsq7BGMMAx1KCReJwbGnwzkqHneLftoHNb20bO/fL1MtrRWF/oB?=
 =?us-ascii?Q?ylUJKpi1nyCu4zbpnEJMgYc9OLNtCOeqyRvCkT15LbvowHSaIWC56cxEhtEv?=
 =?us-ascii?Q?h6St5jfiYGrPFsxTbYFXR33fhtb9UKF7?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 06:00:39.7828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f339f60-2214-46f2-5663-08dca7b81e13
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB6752
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
index bacaa2208734..62dfe935cbcd 100644
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

