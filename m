Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0108E96EA67
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 08:29:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0RCc03zkz3cTh
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 16:29:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::621" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725604170;
	cv=pass; b=cZd6nLa/3lA49S5uEnAlk5RsIM2W8zwKw6iTGRNywTJGh3qXv9OEiWJSc4TKdUDrLBy2ITG8o+N2PhE++l7FA/ch7HTGdUVN3QvQcVi0mWUZWdK+GHE+NBb13TofDZPzZv/pSvKGo0wL34RN9jMzg4NeGBoF4GXvbC6vB3srlAIvO6eNc+LrDpnrlhe4Ar4PDBte34ZttUQestauQNDra9THamXqDHct63QivVSZ2ViUx/vGoPrnpcGIGmnA3Uz+NtiaEwb8dJQoEz0iDGioMFsIglOYOhl1Mf+b2I4vohej062agBG3vEuxHCFNMp2CQPKIzAObZ+mkEH/WOl1qgg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725604170; c=relaxed/relaxed;
	bh=PjaARKguKay68g4+E5ltB5cy1A5x8bWHGkhbabGTogc=;
	h=ARC-Authentication-Results:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:Content-Type; b=AuMNFzifAep8Qg/XYqH0ZVZZZSBu+sbevqKaePWA/AjnGkNvXP4OsGqKz7UIFg28bbs/O07NmYlyayjelRfmZRg91qioasx8Vx6+DqdmnYOv+fFF3X/qhHixoMKgTMLZLELoqcEGvYhDwbqN7fUNZXTR6Gzc0UJ5WagOO2MqLNFl7Jph4+BJSGBiad7NVjsqcEBLm2QxETs9vw3EshGYRWR1x+cl/9H/WZ6k4KvIrNJSnqQw474mAGVztGVR3Wrq9rtsVi07jD5zBbfAztb/bbbFj33HxoKz2DCXLAtu3t6zvLmN4KYWDR0W0utxYEDtRiJdF44tUdaCiI0v4UUCqQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=lfp5Sslv; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feae::621; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=lfp5Sslv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::621; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20621.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0RCZ3vhgz304C
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2024 16:29:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKrf32pQFjiqn2/5NwsQSTNH8uuI03R/m4IDS+w69tJ67DbVlOIdL4MqVN1EeTs3K/uShlh90G7ssFVa6ZLNlCColAUykonivzP/wOhwU+wg/QkRw/7jtaTozGV0oj9WmqMVsuJijGy/8ZwevtHKkip0u927Tfvc6NTnDSLLoRaJ4ryymmNkIIx3lvlltthX4ISusvgOdE7IWWd6JtbVrz3RZBM7r023FnJ46LlqzyXVLDqxrlYS/f+Bu/Qp2qCepNpptENAU/uFCpIVCjYBJl3/EzXqKFKg7BTPMHwx3vQmSIYMTPs8UCmenI/DdXK5FN5fcUfRqaqlafQ8b4S0ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjaARKguKay68g4+E5ltB5cy1A5x8bWHGkhbabGTogc=;
 b=V8QNzsmChplRnWFn2cfgIBhllREPV0bXnHupdeJUjEF+Iwv8sGjSESeCVDHDJ5RQuIp1uSXaDzmuykVNTNc+jTS0tfc5kPNRPEPxm3TWC5xHO40nFfJRubvsBJ2GKPZlLtDCDHdCSScl30dBjDJWsuyfQl62O0uGyPB7EIN8NrbgzkBR8rduae9P+7iZhElnR9sUCjQMsnIS9gH3fnuiYrPF0wGaieT4yY68t8Vmle67J6QjTHONoMR6vF58JnJ13wYbo+r+c/2U4jdvCh0gIXQ/b7TX1mMGpKqMg1D9jM8JJz6E2JvxVEkjryziUBrPGm3Eg7W8em4h+Xco/urBwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjaARKguKay68g4+E5ltB5cy1A5x8bWHGkhbabGTogc=;
 b=lfp5SslvRuyI7VEqwy2QfjWpgUd/CI1lSr31vcZyO/dI7z1JPnt3qfuxqu9zlBB3QbheUvJk1sTUyh3np5UzOvUtYLoTm6PidxoyD9K31qTXuH+KdLFRNYL/Xg12TsDmrAvCEkZKbwKPLVT91Cu00/WRssh6+oOf02/SRcjeiK0H8btXfBtMjBy8jxdDM70m5BssjsXpw2MPRH8lutVCEhEgQC43nTVme5lbRBXDVgKmg7wplon4IB7DmF5Z1yLjTAn0dFMT8Um6tfKd72kZqZHWsoEfEelq2AMBeNsMvPPQyuMxtWzN3krIzg7az85RlcE6TT8hoDyA5bQpib1VPg==
Received: from PU1PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::16) by TYZPR04MB7073.apcprd04.prod.outlook.com
 (2603:1096:400:452::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Fri, 6 Sep
 2024 06:29:12 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::4a) by PU1PR01CA0004.outlook.office365.com
 (2603:1096:803:15::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:29:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:29:11
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v15 30/32] ARM: dts: aspeed: yosemite4: add SQ52205 support
Date: Fri,  6 Sep 2024 14:26:56 +0800
Message-Id: <20240906062701.37088-31-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|TYZPR04MB7073:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8d242480-cd7f-400c-c48c-08dcce3d38aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|376014|36860700013|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?APZBPNqEZvrpWoGjmSzO0uR7kQVagb5C+0G3nsab8S62ujuv0OfrWIOEJJFi?=
 =?us-ascii?Q?XJp5dtONlYXaHfGiTbDvgwfsN21hwD/Jfl/EzhvZ1zeD5+YDgcTX7SIRr/js?=
 =?us-ascii?Q?PYi2YalDXKdAPzE7rrHoM8MZyNNpM0T1PkQtInUbAj/fAoAQlVYyeifXuyKj?=
 =?us-ascii?Q?VSMRaWDgTUAWnO8tTGkszcC/dDme+Tb/DGksZo+stUN6X3wBTFf7zr9pEC9E?=
 =?us-ascii?Q?j162AMYFpXHjSDaEh6wNoxV4sXXFho+o/9M3816OuQ2YX80ghCy8w6D+a6s+?=
 =?us-ascii?Q?srR9wDOrcRTKh56gzE/fcxSUVsD3AUN0nca5uzby27uGgSPSkmKbPxF5xIs3?=
 =?us-ascii?Q?UUHuz+Kv6zb8daQeCIAxsQtPc5/PKv+Tcm+Q0+of6hhlnoj2T82Gu1poS6OO?=
 =?us-ascii?Q?zPf+CR5iONn341m2+hp6gYJoL1J30fZOY3cTeyV0U5biRjarou+NIaUWygSi?=
 =?us-ascii?Q?dURu6pcbXUUBXLOJRaKT4gYcCo+zZuY9piQdHEak1POJ+NM9YwJjt1QF8wM+?=
 =?us-ascii?Q?X+F7rx22+odkTChnOrLy0CVG6VN3yiW6votShtGt/nvtUsZpRL5L/JRQYSlG?=
 =?us-ascii?Q?MGtUOo6JYLUj7g2NAgklTKh3u6A5ullqOZk4N2E9ajGSxIjk91DC2quu6dl5?=
 =?us-ascii?Q?zjTRChM4UvCACZG3GtkklfyFKSvJ1aB7yHVjtmPD9wPeWS/natr08w3cP0xh?=
 =?us-ascii?Q?bBDv9LU0r1UGP6jgziMM5Kjvf5mi8dp5Y8W3MehYpVonGB1QJj6BdS4z9VVJ?=
 =?us-ascii?Q?B/wb1mofiQ6ycTT//6Wahx9R3bFb7xS0My0sjssg/PbE1+Bfhei6Xiye6TIL?=
 =?us-ascii?Q?mcfnVJ7mDzF2HEl3eHTWzip3AA/XJN8LMwMZISuy+GFjPyw2qNGttxpuE93Y?=
 =?us-ascii?Q?+r1LS9eGc0D10xI32jtQ2gu300g/VZWtBv2yKrbbsSZtIi8+6WwJXuZhWlaT?=
 =?us-ascii?Q?CcUouGR2FTZ7ZYLqOkcgtPPH+Q70GuCt82mZ+t/UTK0bK4bshXNmVHydLQz0?=
 =?us-ascii?Q?Sj0bfRR3/5BEdMEZlSl/oQX3pK50AhjJejW7fC+q1ZzNpmjygoe5Zuxkoqz6?=
 =?us-ascii?Q?GbjePaeQiWNanqkwn1WKkRlF/e2WyFiTQFVaHQlhh72Yh+sKfawDb5e3KlJn?=
 =?us-ascii?Q?oGIwziufFH4WuqSl8DRDDs75RSB5bEm2KK6IVTuzURtbN14S0IOObOdMBshy?=
 =?us-ascii?Q?cwW3sDISQFPHag3iaW/gYTjjCHXYJwhoQeE0eigY0TqcJaW9o3aiEjwBUH52?=
 =?us-ascii?Q?4Vr8R6bTZolYFbT/CU6VLIQBO32BtUOAeKaf2Wt7VQQI1b/oOLabUaRk4dxA?=
 =?us-ascii?Q?f+Bn5ySeXPw9zfng3NeKK1q/d/0W1NZKcERfXZMeg+SRWZ99N06tCl93cZRz?=
 =?us-ascii?Q?waFJtmOjHuqt8DIsEM0xKtB+GnVFQ8C++33a51mwDifgOdP9ZQDdLJPulkkA?=
 =?us-ascii?Q?lHPD6o5lxM0Fcfk4/N/vg87dv9WX8mPQ?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:29:11.5997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d242480-cd7f-400c-c48c-08dcce3d38aa
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7073
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

Add SQ52205 in yosemite4 DTS.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index d056f6d5ff6e..04aa428f94b7 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1245,35 +1245,35 @@ adc@37 {
 	};
 
 	power-sensor@40 {
-		compatible = "ti,ina233", "richtek,rtq6056";
+		compatible = "ti,ina233", "richtek,rtq6056", "silergy,sq52205";
 		reg = <0x40>;
 		resistor-calibration = /bits/ 16 <0x0400>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@41 {
-		compatible = "ti,ina233", "richtek,rtq6056";
+		compatible = "ti,ina233", "richtek,rtq6056", "silergy,sq52205";
 		reg = <0x41>;
 		resistor-calibration = /bits/ 16 <0x0400>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@42 {
-		compatible = "ti,ina233", "richtek,rtq6056";
+		compatible = "ti,ina233", "richtek,rtq6056", "silergy,sq52205";
 		reg = <0x42>;
 		resistor-calibration = /bits/ 16 <0x0400>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@43 {
-		compatible = "ti,ina233", "richtek,rtq6056";
+		compatible = "ti,ina233", "richtek,rtq6056", "silergy,sq52205";
 		reg = <0x43>;
 		resistor-calibration = /bits/ 16 <0x0400>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@44 {
-		compatible = "ti,ina233", "richtek,rtq6056";
+		compatible = "ti,ina233", "richtek,rtq6056", "silergy,sq52205";
 		reg = <0x44>;
 		resistor-calibration = /bits/ 16 <0x0400>;
 		current-lsb= /bits/ 16 <0x0001>;
-- 
2.25.1

