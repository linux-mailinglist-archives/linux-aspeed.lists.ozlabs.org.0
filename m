Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3D997D178
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Sep 2024 09:05:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X93Lc6lKLz2yXd
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Sep 2024 17:05:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726815927;
	cv=pass; b=C/r21K9TBQ8CfQOpUpMYiW3lXNgAZIGCPY7iJWPw9fLyNfYmXeueZje9WSpxL8ja4GTQtUQpFbrYnjSvZQ8DfCVGRxL0GCvtqILuLp4GV+NFfM64zTEGE5EsoarQGCHAemPnOgfjg6SXRMb8vqS/WyB2apA2pnfkpU0yMathKFfPexTPry+0FO/glFvT21mZmM5FJ8bOvAcO1YAwBon39jZbMWoj/SrHntek7uw5YoqV9JMaIpzWacowHEdrDXaDtx/N61ZKChYGxkKE/ax2wxwjtppk295ezoQEJOwgFJ/jTbyrMDwg6QqXRSEOzlHSdh/ht0RxA/hBcIE/XKEDwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726815927; c=relaxed/relaxed;
	bh=Ak/A7LiKceYzH/Ibf+ojUHPoKN59wU2gqDAJjVq66R4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OQAcFzG4HGHLv9KqvnrXGTxT8nGFGDpZHNDyTjCe7657brHffDNoRsMmICipCy3je1aLHOrvWqgHQgakl2LK90nMIo2Nu3VJBAs4X7wrqoBw4TaVluYLPR+ir8jOL9I8AltYLf7w15aJE6wcN6YL1TbnMu0zFoiUhQnXdKFCPoDnqJC2MgS6PtI73P88XZ2tnCuxOC1YY+/Ph53x6d+kn3Bkij0jbgAhTHGnSfAr+pMjMUSdKAvsI9xW1VjcMNCCajTRuztM3PGJUDwIP8RX/0gTt4C/MCaQFAhi0pkglQsNE/08491W/M7RHpC/2SHLgDFguTzxOLFrOG4NN3BhwA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=RVTgfh74; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c400::2; helo=hk3pr03cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=RVTgfh74;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::2; helo=hk3pr03cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazlp170110002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X93Lb1Xhpz2xLR
	for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Sep 2024 17:05:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQhzeGkdqNCGuzwoXmRaxLkRUkkDan60nsmQNkUkBaj+SPTGsV584/CJSpdnZaZ7wOt2SyVYxAGLEvVZULbl2aCEn49KFdPlAHjaRQVrGfx8RzyDiB2GR8oLefqx23hi/nx9R/5Z99ePa9WGpFKBH3W7SFrT146ZbvfPlUrpGDF/qNzKbVxQajqxXbsyKvSFNW1/UoUssjaLinrxD0NcOnrl7GCWcD1JXnfyqAPwHWF9leLP5qEq4/FtNqX9XJan4tc/u56j0alrwixLFRgpQaXh/b2VgOUnluLzuEDG/stxhyzeHyRXBm5+qi10vCArUmZ+uafoM/M9k+q6rpexrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ak/A7LiKceYzH/Ibf+ojUHPoKN59wU2gqDAJjVq66R4=;
 b=Mqli3K1d1ym/7FKLwwCuyA/iwYAGqlFMbib0KvHu410O/mthUkqcg4ir/eOhlVNpg6mlzliqbEbafNjGMtSRGUm102PyivSPIq996WPWUmtSpiTGc8BIa2ahZWX6s8r7qEAA1FnPvNP04Fc1GChTjkpn5vkC1YkcaSb5/dJ7ka2o8xE8BlOGhjtTHnHENlHB7iu46kGrCaF4lccJO1i0zF/paBGReibUuEaqvgwgyuvY3gEZFNwddbdI6PM+3CsvafCdkeEG9pv54NYD15QtiqKox9d/J0xHFTAuKYGthBTX5siPY6tKSrSrE+sDbGMlQ4YMdeKRNjGZF8JAgqFt+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ak/A7LiKceYzH/Ibf+ojUHPoKN59wU2gqDAJjVq66R4=;
 b=RVTgfh74g8BpVo/DH8+h+Iy/+LYchTg1b29j3MxV9dgPM6Fya3wLkfcRYdnzPGhuiyUqRcIAfQh6XONkbGX6VfBik3mPqARLpsgIIx8AXv+DAL3t5hTak+zSFJtQJXAlcpkwbXCgOrZpVsoD0rvjtcdoLBO07SafvGC60lKLGNS7GFeqmLmK0wcinaUx7wK8em+ET+35C9PL1dXD6vSPARZI+BlIa8YEw4czKpX59SsE7HQf5ln9uU5Olw3N7oiV7fRZFCn90VcziNMaIEIA9roA38BVrVte5SZIQhRRUEAsQtbGYllZL17vitY+AvgVRXO/8pVbscUA9+aewFAY7g==
Received: from SG2PR02CA0103.apcprd02.prod.outlook.com (2603:1096:4:92::19) by
 SG2PR04MB5913.apcprd04.prod.outlook.com (2603:1096:4:1d0::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.18; Fri, 20 Sep 2024 07:05:00 +0000
Received: from SG1PEPF000082E3.apcprd02.prod.outlook.com
 (2603:1096:4:92:cafe::74) by SG2PR02CA0103.outlook.office365.com
 (2603:1096:4:92::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.25 via Frontend
 Transport; Fri, 20 Sep 2024 07:05:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E3.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server id 15.20.7918.13 via Frontend Transport; Fri, 20 Sep 2024
 07:04:59 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v19 2/2] ARM: dts: aspeed: yosemite4: add mctp config and sensors for NIC
Date: Fri, 20 Sep 2024 15:04:49 +0800
Message-Id: <20240920070449.3871705-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240920070449.3871705-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240920070449.3871705-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E3:EE_|SG2PR04MB5913:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 89d0dfe3-717e-48e5-d74c-08dcd9428ade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?uqjXxOzQghD9h3cdYloxgc8UOBcjtox7kZafgGUHIM1tQRgYJlkNzCnr6Tei?=
 =?us-ascii?Q?Anv1xNTw34bfVJH3mCCs8oMYyJIs7KonweS4tD4fO9Xh6UTMR+VZZ5NTHneF?=
 =?us-ascii?Q?hoxixng5cPoPhI1eJfA9dtPDX+4FQQTaZZl4aCDeEUjqiaruf9bf5AA5a3cB?=
 =?us-ascii?Q?pAzOixuhbk/lHW89o2QM1SlJcR7cYyZApOVDx/1luqYCmpPVX9DRlxv4FKaG?=
 =?us-ascii?Q?r8hTb4pAQCn6Fjkxre2LTsM/0KbRKu88Zy2Xp3ot0BSv29mlgpw1Ao4aGSMe?=
 =?us-ascii?Q?v0k2zvBn+C6RCUm5HHhaZKzPgAJ5bdbdxXgX4n+i14aOaXslmB5IZzPldBzB?=
 =?us-ascii?Q?wl4hJGMdPHYA0BQ0Dj5NjDh2awOO8tawX/6j8tCahr3VfNaSIaBdZvLNUi0h?=
 =?us-ascii?Q?P1jPZrgp5VO2MU/4UYQpjb10G9RrRIy325qomDlZDbshy2miJLRWWm7FADPL?=
 =?us-ascii?Q?aaSOSgF/GS2tzBY44O+XecgSPb5hX7gOlLRaVr6Op9H36j9jUilxgJK9lruX?=
 =?us-ascii?Q?aYI4J1HXW5nqJ3qP+PJJWWDxQxwOdx40B7GQGC8gz1MOIwkxklar5/UwKzOC?=
 =?us-ascii?Q?wb6IovFMZ5rUmld5xv9I5iE2/Vj5zz3+G7lXNSBKgBodC0q/ufGRzhA2zGlG?=
 =?us-ascii?Q?3igzUGAJ01wUB6sb2B93SD1RRx7opyKqITJn96/yqfcdkQsEJ1fLXhIPZlMw?=
 =?us-ascii?Q?/HYRHRM8eo060VySKMSTBEG8PMP8QOjztYjTqqoGm/fDNzkhmzNe1+9fUhPy?=
 =?us-ascii?Q?1bVjhVPYEi6nPBwddVPm8uKRy8WCcSF0VP94Pu8CumPYDdUV6JnfJakjfa3v?=
 =?us-ascii?Q?aCLuULtvlEUR4EpCyTFRdvns7/tb9xJ15O94YcpZaB937Orx3onmtAgVG0+V?=
 =?us-ascii?Q?JSOYxoS0a9WC9E0CtxF0YNDzrbyvdksVFijSkRwPkNxXNFNS7GNG5O/GdE0m?=
 =?us-ascii?Q?7kURUJmtiPdf+QNmrD4Q+Hc2P5vHloQ66ErSkZLf0LyaNscXz+kgNQlQnmlG?=
 =?us-ascii?Q?NgRateoe1r/Oph28tXpp/yAQEYvPaKZSEAelT6DElcMsKPS/bFBPtzyfca50?=
 =?us-ascii?Q?Z7F0Bn2H/bpkvVZ4Xm9LGMm+2ba8dnAJn5yqTCVKtzmBsV7jyJRXnHp9r+FZ?=
 =?us-ascii?Q?RZY6tTPeTI29lKZin/8N4aXU376yht2TVGr3lgfwKUV0KNNQY3ZAVLThl4FJ?=
 =?us-ascii?Q?AyGPfKh1ZSYJxHyzYZnLojT1GsUMIyYyfdLeUtxGVyVy2w5EkhHIqmMgtLqh?=
 =?us-ascii?Q?nnmVqaPatGegl6XLl00JyW9YMgSnzuJufHbA3fSanWivIbtBC0flvzi57JDa?=
 =?us-ascii?Q?S6CnNN4D/TdSs/rqbzkXOR/prz+hhe3EPb47FDj3DEx6q0KWMmDrr+1tB5Z4?=
 =?us-ascii?Q?hNshcsk6BGDnoVF/TO0QfEjcRTCmcBjL96gI0t8Zohmqp3YVuqRwsaInNnPW?=
 =?us-ascii?Q?exUzEyjFV5lqpYUMeQlwlwa8LzWXv/kj?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 07:04:59.3977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d0dfe3-717e-48e5-d74c-08dcd9428ade
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB5913
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>

- Add MCTP config for NIC and remove the unnecessary MCTP config on bus
15.
- Add eeprom for NIC.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 30 +++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 6b4efb5fbd83..621e4e970790 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -937,7 +937,6 @@ &i2c15 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	status = "okay";
-	mctp-controller;
 	multi-master;
 	bus-frequency = <400000>;
 
@@ -951,46 +950,73 @@ i2c-mux@72 {
 		reg = <0x72>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		i2c-mux-idle-disconnect;
 
 		imux24: i2c@0 {
 			reg = <0>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			mctp-controller;
+
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 
 		imux25: i2c@1 {
 			reg = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			mctp-controller;
+
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 
 		imux26: i2c@2 {
 			reg = <2>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			mctp-controller;
+
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 
 		imux27: i2c@3 {
 			reg = <3>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			mctp-controller;
+
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
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

