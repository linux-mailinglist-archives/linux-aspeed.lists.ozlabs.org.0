Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 931BC959750
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 11:43:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WphGz4Z0dz2yPS
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 19:43:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::60f" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=39PxuzxU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::60f; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2060f.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::60f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WphGx3mTlz2yDt
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2024 19:43:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vuy/7dTxTzFS2kVpDbTeVi/vBZv9kVgJStEYYbJfumlOjyT0vwNqo1QPai9nEQ1rQLKvFOJteXafT+WrYVyz2MpW72MRpIshaPONwi9dc10Fwt6hj9cY6USH/WCsnK6ex9hAqZbdBcKuPiwX7olDIsCdrkVjTSuug/R6yitUjn1IwxGn30kJjLlc/e/8F1Is+75kKxTe7jTdmr4rjHwJBNHW9vyNNtCoGj9PibyEBWcUfi7nSObOrFFduzQzuwsbBKVNfU5H/feEY95vRULCyoEtgQEoVCPtK21VNhj7eqnzJtB0TI6PPDdAs86opaEasYEu581l90VJiJaAsk99Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgT/6R4EC/XEEfY2gUrLR0f3dvDaYSzSpR2s+GBhOIk=;
 b=kpjGfUbglupy1qVAUTnKfHDwAMo5EPkwpQH3Mt20UtUxkOD8HUfVH3MKXNnoOuWDFSmhWE4drvvwAx1YUoMh5kcSDqeUpU9MaXLXAJ/0G+N8h+y0ORREI8nPlE+8Aq7gCIwCLM0Cgs+/4ccGvvHiAbzYXBq5kUMXNPh5XL/DGsXOMcd/YT66qYHPocIu5LIY2DklBYbWoyPhZJHNCICNRe81tF8fsNSdZ8EQvZG4vjJyna7ZV6TWfx04w8DbZ7RZbdTxRa8X4JRk1HnfNVRzuAaoOER0gRhZqHMnpCFl7xZ9uMROdRRI8RIGEYt3/AXnmDeEn4EJITRlkvUz65T5qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgT/6R4EC/XEEfY2gUrLR0f3dvDaYSzSpR2s+GBhOIk=;
 b=39PxuzxU0gu0L4Yx6EDtzez+Jx0mKDW29PRqoOSDpD0sBMSKClNQBvJvynMAQODUFZQEwLlBN4czSJtgZ0BDQl7kEhVVvhhbYqayKiZm0Lsayf52VP+9QLvRQFr6mVrd/XwFuF4nEwHpr8JZZQ6olH6sUYj3R87QzeJeMeRhW6Jv7zCq4Wy/ftmHR2aQUfzSETAfWGzVgRFBupnkFl29Z71772WJQmQ4n/5jyiqp+nseGGH1HmbsHmnnp/uQDWv+zAovh5J46tN5tH48Cb7nbxPeqYimnw3qu2bPBK6oys9FnTSaWvdV4XvfQ8wBaQNJqQj9nryYt2rnknrj9+4HIQ==
Received: from SI2PR02CA0034.apcprd02.prod.outlook.com (2603:1096:4:195::9) by
 TYZPR04MB5680.apcprd04.prod.outlook.com (2603:1096:400:1c7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Wed, 21 Aug
 2024 09:43:17 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:195:cafe::1a) by SI2PR02CA0034.outlook.office365.com
 (2603:1096:4:195::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18 via Frontend
 Transport; Wed, 21 Aug 2024 09:43:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024
 09:43:16 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v13 25/29] ARM: dts: aspeed: yosemite4: add RTQ6056 support
Date: Wed, 21 Aug 2024 17:40:36 +0800
Message-Id: <20240821094043.4126132-26-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|TYZPR04MB5680:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2efe3abf-fa7a-4051-3738-08dcc1c5af27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?kbz5FwFLYjnx44rs4qQyvRjkYSlqJXwLq5XYGe6nwWNPs+L1XTG6uL82GdnG?=
 =?us-ascii?Q?WfFporzUzdF39Wg7O4pgRvg1A+8SbfKwTa8PuEp/wjDiC7SKA/AKd0LEhmyW?=
 =?us-ascii?Q?Q6Ufl1W2pQ4seuaxN2mtlTeO4GEnMYsWsjL7NcIDMrjSgG1iujhdwOoGubr9?=
 =?us-ascii?Q?eEOaHamEpFeyZtINzTFZvH8Elnk7IJjEavoZ1iwXkysApOxAtaw97lwaJcOf?=
 =?us-ascii?Q?rwpqLDm3gKPPQclRNSQjhYvELOzsMfK68FV73tTCIzIJQ297kJ9W99Zqunmz?=
 =?us-ascii?Q?hOV33tq1fcWx5RBgS3Ovk0IQ4DDgmTdVB0P8FJqOeTNooLiA3ICWbe46Qfvn?=
 =?us-ascii?Q?qdE0VJNcqOMGnaeZxz6PatA0dqQlj7te7uvhpD697ExlSaeWzRElHBQ8aow9?=
 =?us-ascii?Q?gCntPe6rCkNP/XAQTs9yaQhd/Ldyv1+LJtHjDVD7npk4Dh43ZDUGZOCv8auf?=
 =?us-ascii?Q?SdSXJfryyaOvJQtApgCizBQ4Y+fAceJ7oCrDkM/pn8xy1tc3lz0R1mGdM9Hi?=
 =?us-ascii?Q?ct0cMPMzwTTooeYGYiGnpdzjzBIizoCpNKBqz0uMzbgTOmp/6v3IeHl1tv9r?=
 =?us-ascii?Q?VUoSSNacHeq/aOdKkwqXgZsNt6rXnFxyfHx5IwcNDv9x/NMqDdzp7WOGjYDT?=
 =?us-ascii?Q?tyyrb1roco+LysLwYej5Pc5sLIBjE+Z3woxjlEoBz7AhVOJLvNvAmPyTVatG?=
 =?us-ascii?Q?7vq1yiLJzzcaJnDrwx8Bq3ZmoJJaITGMPQIScgy6d8K+fAdkPUDf9our6vrW?=
 =?us-ascii?Q?POUf2g7G/VMhYrXAuOVKTSLOAHM+V2Uqzw11Gu0NtQd41J2LcdKQ1Npewu27?=
 =?us-ascii?Q?K5OLYlb74qMq3HH5fUWZ2Sj0OVd3HyqLj7aZaAv86fLVS6nI9QwCQmLCD3O8?=
 =?us-ascii?Q?3GLdQySUkPmoXJhh+fatGmbCFfILTY5x4WtohuNSDd1Iey4F/4sBTXkFuTRJ?=
 =?us-ascii?Q?ah9U+XiaB9XtZlm8cD7dQki8qpuyNtk9hc0MSOnuVGeec3+mxBQO6/wAtdC7?=
 =?us-ascii?Q?fm+86s8jk2ncbZl5VxaJSmodll5mAyemehxtxEZb3V94TNX/+UeaOYX/O3PZ?=
 =?us-ascii?Q?2IxG/njn/iVHk+jDSRdDhkuXjY28BxPVbXqxMj3Zj5EPZy1IpFBQOZZd5kz2?=
 =?us-ascii?Q?8itSKeKVWoeh8Vyv6oixMa1sdIeMn4WmHxei8fQ3ErV+Xi8HRhg/3LsT6WWk?=
 =?us-ascii?Q?CnE6eyII17eC3OhK2P3AUxtZQ8BfDlEoE1ZsYiqdoFqL+FTdbpxvcLytR+Vz?=
 =?us-ascii?Q?2rauOgZqXKm8ZfAuhEJI9Sn2Nq8G0ry8YQt6X1cuWwFz/POPVkMluUR9bmCb?=
 =?us-ascii?Q?RIfgLUslR6eo6/lOi5TwifpKlxFnlFzId8tYiiInXnjNCw88Mlt7CbzCsMJ/?=
 =?us-ascii?Q?L0dR2qncZYA1BBlzltxmwZbLUxVjyovBFg1LAJhJ5j+y4iWn9Qi2YY9Dh7Lz?=
 =?us-ascii?Q?JmhvCZvRHcjyCWB8o3bIvqs2orc9ZMT9?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:43:16.4037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2efe3abf-fa7a-4051-3738-08dcc1c5af27
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB5680
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

Add RTQ6056 (spider board 3rd source) support in yosemite4 DTS.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index f73719b3c2f1..03a1e41312e3 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1240,35 +1240,35 @@ adc@37 {
 	};
 
 	power-sensor@40 {
-		compatible = "ti,ina233";
+		compatible = "ti,ina233", "richtek,rtq6056";
 		reg = <0x40>;
 		resistor-calibration = /bits/ 16 <0x0a00>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@41 {
-		compatible = "ti,ina233";
+		compatible = "ti,ina233", "richtek,rtq6056";
 		reg = <0x41>;
 		resistor-calibration = /bits/ 16 <0x0a00>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@42 {
-		compatible = "ti,ina233";
+		compatible = "ti,ina233", "richtek,rtq6056";
 		reg = <0x42>;
 		resistor-calibration = /bits/ 16 <0x0a00>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@43 {
-		compatible = "ti,ina233";
+		compatible = "ti,ina233", "richtek,rtq6056";
 		reg = <0x43>;
 		resistor-calibration = /bits/ 16 <0x0a00>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@44 {
-		compatible = "ti,ina233";
+		compatible = "ti,ina233", "richtek,rtq6056";
 		reg = <0x44>;
 		resistor-calibration = /bits/ 16 <0x0a00>;
 		current-lsb= /bits/ 16 <0x0001>;
-- 
2.25.1

