Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F9395E876
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 08:24:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsgdC0H87z2yNc
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 16:24:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::60b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724653485;
	cv=pass; b=XOgyFodANuUOafhVlQb4Iu8XoMazdDLLe5Ps4jEv0TmNUE/XXU9eRy4ECZRb/vsxy1CjVg6Pl6Eadz6IpU4Pkyx3kTOAKtBQLXgZFoKfRC7yN4y9nbxpurEGqnR97PHnosb5IKhqGqoX44EnWxkA6t2PeIYyJN1PA6KBlZHSdHAj2LqD8ZPW3HirPWgV0FUIDitL0m/NzWU7O+xaPliBPzw0Y/1jK5UpUeIqhV8Wyq1aZkY6vSIPOhf/rfqvb79r7+7E/rB7D8qWYvgjzAG0jJalqMwByIKfUyEUqWCloBFMkrTVh8EeprvPG+Dcup8Yw7E0N5+2nFXHPmEY1q+u5A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724653485; c=relaxed/relaxed;
	bh=MpSriWfetK7algw9l4MNrHnpp7Z7wNyiJZzZzENk6Z0=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchan
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=mh5e56IE; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feab::60b; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=mh5e56IE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::60b; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsgd91yJHz2xsd
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2024 16:24:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1RdZewCh8G2cxSeZ+6lNGek5e9b/vYXypWURmVmWosVFWqzx6j+0LJlOhgJvgdMwBmQj6XpqA34F7TPtn8lovmDglPuFO9Ba7FhKywELDXvHlH0E6sDjh+lujjW6dIpJe+899t0oVGyKfsbm2aeGYzNd/H/DU42NqYkAFaqbRnd/bgsoDT2g39kJCAlAH2f5lPU1XqH/RiZTSv93y04pLNgK/04EYKIlQyWyOStGpJo2e/DRN9SwaP/1pXWK6SuVvxm2R0hD3b/uj0E4v9RJqhbgep2unIuBa4zHtfdPNsy/rnC1a3JwBYV6Ao+kn8zynbZEGAPeruFpzukfPfuIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpSriWfetK7algw9l4MNrHnpp7Z7wNyiJZzZzENk6Z0=;
 b=inMQel1d3VhAfEHxYHRFjJuFFyJZicA5BbbQwQz8Vx3ANfvCNB1ZO0xkxVUfJJWsvR3nSWyn19GzedP5apb+Dlub2+7UVii7te7/0hGUyvpmBUUlaNU5eufGEhVcP4cfxX2Vg9kV+vfqZqby9OYAPYKASr1JYLSfAfDuKLVwWUFJTRIHhFneraK2Flr8UYLW6tjP7Pgr62nErkA9+JjRJe7Qm4fuV8e5Zi2g04Z90beEV9laT1eYhAujTBJM4sn8Gf7FHwXOPviR66ptsyPtH8vfZcKP1L0QJUKMetZff0jJVb/O4mfuOSXfe16rUkvU+Zp3PIjDrD8oCO533o9mfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpSriWfetK7algw9l4MNrHnpp7Z7wNyiJZzZzENk6Z0=;
 b=mh5e56IElIUSwufVgU3Q1Ch2jm+52mS1/kyD09hc9dlMgs6UgsnOfkDLE1s4STg2RDe2OXN9kmf7MNHkeNwxF4nR6w9pRULUokLitlFlekaqUC9evGCZO2182DI9QT3uL3AOCGGE0JVGbnMq87tHynoUb6oPTVC2gJXriabrVGD5M8z79LXowxevxX59VeaT6ihPJoOqvJzjXapQckqd+cJVtjHquphJVrxTECLh0GoeIiRdVsZ6mXvKR/wPQA/8powWDU/yUHHsCPK6/vKl8ZUZsvDb69ox+WhNOAKI2/HlJX8C25lm49XvkQyd5HzvveS4uENMyayhVqgpaa7jRA==
Received: from PUZP153CA0005.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::22)
 by JH0PR04MB7915.apcprd04.prod.outlook.com (2603:1096:990:98::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 06:24:23 +0000
Received: from HK2PEPF00006FB0.apcprd02.prod.outlook.com
 (2603:1096:301:c2:cafe::64) by PUZP153CA0005.outlook.office365.com
 (2603:1096:301:c2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14 via Frontend
 Transport; Mon, 26 Aug 2024 06:24:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB0.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 06:24:22
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v14 01/31] ARM: dts: aspeed: yosemite4: Revise i2c-mux devices
Date: Mon, 26 Aug 2024 14:23:35 +0800
Message-Id: <20240826062408.2885174-2-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB0:EE_|JH0PR04MB7915:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f2490522-a5e6-4458-33cf-08dcc597b980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?EGCMVWRAB9hmjfqzrLf+8e4Bz1pxcz57WKLeX6N4PKg0J+KTOXjsBlzkFs3T?=
 =?us-ascii?Q?O82nNocO9NH2CLN1zbTujRbWoRkrDVdCxXVlPSn2PDcCG8t/7dpk/hZsC4yH?=
 =?us-ascii?Q?rC+VH1/Uoxq6e8FkaQlBaBVbzG6G5Whp4q338kqpUIDdLFH4zb9Fr1JZo4C2?=
 =?us-ascii?Q?2zhgHEL1HoO+T1lvmR1FAr36WG/+9IuuvHWTl0JukHbPecrE+KqDdHOM76Vr?=
 =?us-ascii?Q?vGzI2wL6layOvuhN7wQLNNHLLoRV5tx4SYg2CgomL4KrpOZp5E8aUin9Npgc?=
 =?us-ascii?Q?UpwPO1u2kFjncgGlAksIeRpZ/k3z36F7+W/y3YDbeSmHXx/1tmHNF1wrdu3i?=
 =?us-ascii?Q?rvkFcZ07vqqIi2SX77VKhiU90EEbkKMUlWsfJCWmcpn0qEMp9NC3HhDyYofw?=
 =?us-ascii?Q?6CuxRYerZurvzVE4avuLYB4995LTtmUgomkJDGkogHNyHCx6DtXT++ymWVo9?=
 =?us-ascii?Q?miMc7AVYuE1eb1E/oi2+7eZ1RvvLH4P49Kx/wHFRaDzuUiLF1XlNGq8lNBpO?=
 =?us-ascii?Q?2208CGLv08FfiagGkXp8bwLd6C5MrWZdKsYKrx3fRUIvnwG3V8nSXkDzGBDT?=
 =?us-ascii?Q?OWE6xeOqTQq/Fx17PBMOikjzY9KDbwmxg2x7QpEFCcpogOMJzUqgnc5Op5vK?=
 =?us-ascii?Q?hMBQTxBX/0d252GNFxV+UzlT7lp+b/VGIWyeMaw8MyxMqTzL1zLaurHqfFF/?=
 =?us-ascii?Q?rj9wTOp2exB4afFG8FyZv49LD0i0XQaPrM70fdt+1w+CMzMlvgD8T1iiCWr7?=
 =?us-ascii?Q?1zAADdfzA5aJEHHlBq0KDDpFqkJ5vK9JREwHViaKorti/gGA61ke2O169Bql?=
 =?us-ascii?Q?34b8qpHP9aMoZLeo7P5xXpRzVGwBgarCIcoBFz6QrDiH/dVSeIf+JQxOcIpq?=
 =?us-ascii?Q?tpyLGGI/bXbBcXZyp5oi4QAv8wnAS8T+QuxnNr1IcTt2EnNQIqzALN8apZ++?=
 =?us-ascii?Q?wC0fW0i1Fc/qUNH5uAvcitiPJeFZaat2yqH0hZBNelmfYObL/ZYlxrsF1wAg?=
 =?us-ascii?Q?UUw5aT687o445r63Uv++KDEQz9Rw1HNozAyDXv4IIW3ak1Qt3jknjL0QjihT?=
 =?us-ascii?Q?zZlvWw+4wut4QaVHSTj0XPKSuiKJ0d16Z30JJ3eU2F3SC+/J7SorYXbcTsUq?=
 =?us-ascii?Q?WkFAVerEID+HlpTKaZuE1ttVkTAXOAERVVqyn/9dzQSTs6umuLgYARBphYUp?=
 =?us-ascii?Q?wsgQ0aGRQkioEfpiGdAlbiIlkhkU4XyMWEVwmsSiW7WE6wvAq8Zz/v1s/Bxh?=
 =?us-ascii?Q?i6NzoTNonJArwbhez5wlFV6mS7oIzeCSa7g7qIDNgI4zCyHHKBCO6wzR/ta5?=
 =?us-ascii?Q?+PvXA/8quNuak6+edlHMtRp7+x5YZQVecKJzZQcsS4qowHiTLZnlVvRxnJV9?=
 =?us-ascii?Q?agvE2f/+29D39qgBCuCylh10mCXKzS1gpXbkKJ9m84WkPT9lpxQbGAhDOJJ+?=
 =?us-ascii?Q?TO9uhzFD4CckcgnmFFoxyvMRSdlC7/x2?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 06:24:22.0344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2490522-a5e6-4458-33cf-08dcc597b980
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB0.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7915
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

Revise Yosemite 4 devicetree for devices behind i2c-mux
- Add gpio and eeprom behind i2c-mux
- Remove redundant idle-state setting for i2c-mux

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 381 ++++++++++++++++--
 1 file changed, 347 insertions(+), 34 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 98477792aa00..ce206e2c461b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -17,6 +17,25 @@ aliases {
 		serial6 = &uart7;
 		serial7 = &uart8;
 		serial8 = &uart9;
+
+		i2c16 = &imux16;
+		i2c17 = &imux17;
+		i2c18 = &imux18;
+		i2c19 = &imux19;
+		i2c20 = &imux20;
+		i2c21 = &imux21;
+		i2c22 = &imux22;
+		i2c23 = &imux23;
+		i2c24 = &imux24;
+		i2c25 = &imux25;
+		i2c26 = &imux26;
+		i2c27 = &imux27;
+		i2c28 = &imux28;
+		i2c29 = &imux29;
+		i2c30 = &imux30;
+		i2c31 = &imux31;
+		i2c32 = &imux32;
+		i2c33 = &imux33;
 	};
 
 	chosen {
@@ -259,9 +278,109 @@ &i2c8 {
 	bus-frequency = <400000>;
 	i2c-mux@70 {
 		compatible = "nxp,pca9544";
-		idle-state = <0>;
 		i2c-mux-idle-disconnect;
 		reg = <0x70>;
+
+		imux16: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+
+		imux17: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+
+		imux18: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+
+		imux19: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
 	};
 };
 
@@ -270,15 +389,174 @@ &i2c9 {
 	bus-frequency = <400000>;
 	i2c-mux@71 {
 		compatible = "nxp,pca9544";
-		idle-state = <0>;
 		i2c-mux-idle-disconnect;
 		reg = <0x71>;
+
+		imux20: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+
+		imux21: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+
+		imux22: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+
+		imux23: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
 	};
 };
 
 &i2c10 {
 	status = "okay";
 	bus-frequency = <400000>;
+	i2c-mux@74 {
+		compatible = "nxp,pca9544";
+		i2c-mux-idle-disconnect;
+		reg = <0x74>;
+
+		imux28: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			gpio@20 {
+				compatible = "nxp,pca9506";
+				reg = <0x20>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@21 {
+				compatible = "nxp,pca9506";
+				reg = <0x21>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@22 {
+				compatible = "nxp,pca9506";
+				reg = <0x22>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@23 {
+				compatible = "nxp,pca9506";
+				reg = <0x23>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@24 {
+				compatible = "nxp,pca9506";
+				reg = <0x24>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-line-names =
+				"","","","",
+				"NIC0_MAIN_PWR_EN","NIC1_MAIN_PWR_EN",
+				"NIC2_MAIN_PWR_EN","NIC3_MAIN_PWR_EN",
+				"","","","","","","","",
+				"","","","","","","","",
+				"","","","","","","","";
+			};
+		};
+
+		imux29: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+	};
 };
 
 &i2c11 {
@@ -440,16 +718,14 @@ eeprom@51 {
 		reg = <0x51>;
 	};
 
-	i2c-mux@71 {
-		compatible = "nxp,pca9846";
+	i2c-mux@74 {
+		compatible = "nxp,pca9546";
 		#address-cells = <1>;
 		#size-cells = <0>;
-
-		idle-state = <0>;
 		i2c-mux-idle-disconnect;
-		reg = <0x71>;
+		reg = <0x74>;
 
-		i2c@0 {
+		imux30: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
@@ -457,26 +733,26 @@ i2c@0 {
 			adc@1f {
 				compatible = "ti,adc128d818";
 				reg = <0x1f>;
-				ti,mode = /bits/ 8 <2>;
+				ti,mode = /bits/ 8 <1>;
 			};
 
 			pwm@20{
-				compatible = "max31790";
+				compatible = "maxim,max31790";
+				pwm-as-tach = <4 5>;
 				reg = <0x20>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 			};
 
 			gpio@22{
 				compatible = "ti,tca6424";
 				reg = <0x22>;
+				gpio-controller;
+				#gpio-cells = <2>;
 			};
 
-			pwm@23{
-				compatible = "max31790";
-				reg = <0x23>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+			pwm@2f{
+				compatible = "maxim,max31790";
+				pwm-as-tach = <4 5>;
+				reg = <0x2f>;
 			};
 
 			adc@33 {
@@ -499,34 +775,34 @@ gpio@61 {
 			};
 		};
 
-		i2c@1 {
+		imux31: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0>;
+			reg = <1>;
 
 			adc@1f {
 				compatible = "ti,adc128d818";
 				reg = <0x1f>;
-				ti,mode = /bits/ 8 <2>;
+				ti,mode = /bits/ 8 <1>;
 			};
 
 			pwm@20{
-				compatible = "max31790";
+				compatible = "maxim,max31790";
+				pwm-as-tach = <4 5>;
 				reg = <0x20>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 			};
 
 			gpio@22{
 				compatible = "ti,tca6424";
 				reg = <0x22>;
+				gpio-controller;
+				#gpio-cells = <2>;
 			};
 
-			pwm@23{
-				compatible = "max31790";
-				reg = <0x23>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+			pwm@2f{
+				compatible = "maxim,max31790";
+				pwm-as-tach = <4 5>;
+				reg = <0x2f>;
 			};
 
 			adc@33 {
@@ -554,12 +830,10 @@ i2c-mux@73 {
 		compatible = "nxp,pca9544";
 		#address-cells = <1>;
 		#size-cells = <0>;
-
-		idle-state = <0>;
 		i2c-mux-idle-disconnect;
 		reg = <0x73>;
 
-		i2c@0 {
+		imux32: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
@@ -570,10 +844,10 @@ adc@35 {
 			};
 		};
 
-		i2c@1 {
+		imux33: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0>;
+			reg = <1>;
 
 			adc@35 {
 				compatible = "maxim,max11617";
@@ -596,9 +870,48 @@ mctp@10 {
 
 	i2c-mux@72 {
 		compatible = "nxp,pca9544";
-		idle-state = <0>;
 		i2c-mux-idle-disconnect;
 		reg = <0x72>;
+
+		imux24: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+		};
+
+		imux25: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+		};
+
+		imux26: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+		};
+
+		imux27: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+		};
 	};
 };
 
-- 
2.25.1

