Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A9E917BE4
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 11:09:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Hzhq94JI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8G9r3Vbsz30WS
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 19:09:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Hzhq94JI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8G9F6rVrz3cHP
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 19:09:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EayDvDPp/dmwfuOIoDLNv/jy5sv/bwT7Pcr+hp2qAcvlKgt4B/NRpbXw6obokgE+KSuxhTBRYppWnZ5VOU5HVVHOKcVc2OtBCx2tS+LAx5ddA0+yIORhP4baubBDgleiC5FCUpag0xHPXTbfGCr86bPmaldl4t79PQYgn++pr8fd85XB3foFXL0gz+9rwsZL2GNe0ngLInPrpZhSoB0LQNN9BJt4YuvQoTaIj6yOYJQVKHYUO4TJe/Zl7AfVQBttx4guDD4cfnbLThPaOCQ8aECf7js+l5k1GEcsDPqX7JvS9/6d/NYZnt4MpVFWYnyt6Fohu8bgqPNQPwpdtjBb1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O16c89fsxykpLXkgqq5cnVpUTCPvI9O9YW+Dewzjs4c=;
 b=TMFcEVhTwvwc3DbSj117scEIS2OvBN6kQ0p2RLO8F9duheNJKrIeWZhVXOGAlMfHYWfF5s2+is5s0aA8NsCSZkWJeLMGJ5CE6HQ0OVwQvPOKIxXNoFEHyjiPfaS60Klmy3XYPzkBZPIEAcEJ8XQtXUCZhmeQGOMoVBuEGFqMcSVzAFz8T3FAzdm1jpGoiIMElUIym/gzG7IMrGqv02vlKftMt0hGaBUZoQDLDJ0XIpJu5HlyNO1xPC20mamlEFVjAeSMUBcm1K7uXUMLfk3uwROHy4YiYQEkPdqCPCgqleQ6AMGDgspv6cw/9Hq9QSgUKahWNiFTiFRdlwSDNQqnXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O16c89fsxykpLXkgqq5cnVpUTCPvI9O9YW+Dewzjs4c=;
 b=Hzhq94JISiO2of3cb/2LoeIBLSXUud2IjOpg3POwR0UNferCISIoNnTJyA+ziKu13koC9hezLzRkGF9aFGU4o9X5DQstTCVv/+nP2eGzz52/jHjoklZhnMpoakqFlpt7RWnMP+3c3BnQlzwGHnTqsjoweojm9mjDJUsdBrfiOynFuWNQEm1SL8C0NsMFou/rqe3awYNHc+SQ8D75/KxDBFwpzMDH9zm+OQzZGMSlLhVwSjLe3nfXyPso8DzYtQGb3cA1hxJHgu3QvfEThHNxIAVa+Y+ktr1L46fmp/FbicWD2VIg0DVRT4dFWDSV5gjA3Ea74hyiPLH4oXTX0UFoNA==
Received: from PS2PR04CA0020.apcprd04.prod.outlook.com (2603:1096:300:55::32)
 by KL1PR0401MB6307.apcprd04.prod.outlook.com (2603:1096:820:b9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.20; Wed, 26 Jun
 2024 09:09:01 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:300:55:cafe::27) by PS2PR04CA0020.outlook.office365.com
 (2603:1096:300:55::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Wed, 26 Jun 2024 09:09:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7677.15 via Frontend Transport; Wed, 26 Jun 2024 09:09:00
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v9 18/26] ARM: dts: aspeed: yosemite4: add mctp config for NIC
Date: Wed, 26 Jun 2024 17:07:34 +0800
Message-Id: <20240626090744.174351-19-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|KL1PR0401MB6307:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d791f2a0-ebb6-4e15-4c7e-08dc95bf9e4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230038|1800799022|82310400024|36860700011|7416012|376012;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?4PxnfW30qgPyuaS4g3w0AqTKu0e9d17j8eyWkwaMjATccWSrvcPYeQSr4cER?=
 =?us-ascii?Q?KORZlokGtkBCBhvhlaOFQUou0U0aH+tS+p21n1Yfp/sV9LqpuvkFS2BA4C2Z?=
 =?us-ascii?Q?XFHWBwnoeVn8meyS2x7Jg6CjUG1VQsMJcZQ8EjNAQ/I4GMU+oP9CO24MbNKv?=
 =?us-ascii?Q?WRfPAlpVqvXLGTfp4E2FwLX0/jRhQKKFs0SWiZax+a5Qds25lOr1CKGTsUJP?=
 =?us-ascii?Q?iBHj176RFEdfE66fl4+2g12wogNmiiDQJarBe+QG1OkmSohaivfGADO0F2Mu?=
 =?us-ascii?Q?qEELvRviIcauy1TFnVj1LOWSqzTaWet53UFvb1Sy2xpxdvfKQzXhiW8JQb8I?=
 =?us-ascii?Q?DoGSM8yCfo/nH3ik215Z4tj+S9oqc7vRzTCqjIGGluyBZ7xC4EBgveFddn4J?=
 =?us-ascii?Q?jwW+6BLNuhvQmdYCmzOez1UFRlgOEwjm8GOWgsp4fJkArXPaLDngXRs3PsA+?=
 =?us-ascii?Q?p2G9ANvUGoQgFYzfsyu9hcR7juDWAjRyybCAjwKMruBzZn1LuWVUcP4N/ySR?=
 =?us-ascii?Q?geNZxgt+zThGs+naXHEj8kU+75S8yhW+YXAp3vZzogtJQA+Q8OvOAZ1V+SDD?=
 =?us-ascii?Q?wy54VLZXa3YbONcGE3VaY4i7h7bRF4aViT0bdnQZSVLyf0YjjraJSB2OPHxY?=
 =?us-ascii?Q?ELbJT1WGLNiSvLxSMuV3qNuO0Ki2n/EGIOIOYq44EoN7UFaVgFV37SkQQ2gT?=
 =?us-ascii?Q?FVI0wZ2cHI/DXpPiH/ED1jhe1ggqgquxvw2QSzPeWvdFJ44Rld2+mXMKog/s?=
 =?us-ascii?Q?Jtq7EblahL/ddcQ8p9gaRGBTnxg5mwiPMZMkUp/DXNCRxzLaQQPD3gaio7c3?=
 =?us-ascii?Q?PdUq/JxmGantVh22ksxjDOC6eCHW+E9NyjsjGYROAqlFB4m7G9tGMmbYKip7?=
 =?us-ascii?Q?UGg8P7HhfALINp3+3JkabpnM78peOGiGXnd0/9g5WGuXAtJs1oGeMSjsnuJT?=
 =?us-ascii?Q?MBK4Xgpc27igRHaRbK0e4OgE62b6XsWs2UfOAGOWK0gl1MRBwaNeJmNMsVBf?=
 =?us-ascii?Q?eD5ujN3+FM+dqjLI89wIzEU2RyWmQNJhPzyJ5lyEi4M7hSoBmYEi/1YR69RD?=
 =?us-ascii?Q?P8PaLMpqlVojnptIb5r4yBpP0cfc3wQv0cXlXybGCIciN9//XtELmWcF+Pwt?=
 =?us-ascii?Q?d57O46W5dJXruBO6NdgrMmR90EEi9bNzpJYkxfTx1AUPGydcr+ONZRd0Db8E?=
 =?us-ascii?Q?HIq0QT6FT5tLPIY/X0NM9xPGOEeezxUpos+bIiCt63HDW0HwytGWYt3O62DU?=
 =?us-ascii?Q?XGMZbcPPDKawCnaZNcqGUz7u3vEjuG15YJt2395K+Gsz6i8upcS4fndqQkEs?=
 =?us-ascii?Q?quRQGOGhwBOEGlXYX2quKOCq212RkXZt8vKIqemfP1XXfZHm2Yvxuz+tBu0t?=
 =?us-ascii?Q?C+jMlgkh1Wrianj051f7a13eQcqLbPom7PAcAUCy2g1d4FCUZe+a9c7/vwoF?=
 =?us-ascii?Q?KzjutcpRMXBLcD3QI/ej7OFGmh5MqFeI?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230038)(1800799022)(82310400024)(36860700011)(7416012)(376012);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:09:00.4738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d791f2a0-ebb6-4e15-4c7e-08dc95bf9e4d
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB6307
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

add mctp config for NIC

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 59615a6958ec..83c9d76f5a11 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1281,40 +1281,64 @@ imux24: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 
 		imux25: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 
 		imux26: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 
 		imux27: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 	};
 };
-- 
2.25.1

