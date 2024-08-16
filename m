Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB12954585
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 11:25:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="::1" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=mN97FzQc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlc6p3mXQz30TG
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 19:25:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::612" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=mN97FzQc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::612; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20612.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::612])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wlc6l728qz2yR5
	for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2024 19:25:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUMIuwQqk/uboOwn9+3KaRgSbpNUSNMdX/PThbjKeMF2DeG6JzaRIEDGuA/7Avh5i4gKlWfWRsTeDzz3GEvEi20Oqq+rmwpVrpWd5XaliaXmG+KfWPwmDWpO9970XNvSBrBVRGY3y7p7p/uDNMLLZ2k948yQiZ+QJTN8D1MIb1WA5sKFE10SXJsS+4JSDhd4tpFbLEWPZ0jdubs9m6VclJcAqpxQ/yuLvaC5sEJ0/tjVEGAKdiFsx6PI/HIcnxc+qZJjAgfcNlDe79HpkE+T/+LwNBIyelmlNIgUgfVHSpPf3PEka1Qgx6CekMLPDPP3n0qUhkUcaGp5uzS2wpG3fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lo2LnZejiHLnr3GYBrZTsuUBWpB3Ws7w5C5IaBMRr/o=;
 b=RB5U//ya6ekyqKVfPvfi36qK4q/nqBNdRpnd0WTW/HHuEgwN7Iyy1mS2MGWNzBoQO5BTyUaN1vHl5ejLsw0ynihZybsUoL87fORg3aNwmtD9ZbXJ/B6HjOIu8YujJ5gyHGOCVG2p6xMCNeR1f1jKbNejrwLaVJKy6dFN8/u4/otaBlApgEI72sv0PCwfeXm2JMV6c2NT+cFapWIGWSqr33V+hO538vWFS58R1WsATXOlEUPQx50ew9gJHpMd3iVyzizs+onG4CO9Goq/LG3S827Xp6ODEehN1dSRWxNEA4ELkyA6i/VlGcTqyXjFTBvZ4uIn0tf0S9Z8DpcV77s4UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lo2LnZejiHLnr3GYBrZTsuUBWpB3Ws7w5C5IaBMRr/o=;
 b=mN97FzQca3EmraX2MUguRNMTrphbkBa2fYTPy25ZlRF/RmXQNL0FqA/MPdQfJSfNiWGUHaYJ+sgm/zBIi+aj1hho+atQtQoaE46GLq0fTGjrf2oMw5KKE3z24w4+0KpCaGT1qr/+pBuRS6yoCd2vJiJSSGb510bldeMo/QqJRxYkloiywGuPvbA6sCQR7nf1l4vQT6wVCE5S7rAdhq0f4UaOM8DcgPkWO1hFBS8nnNDWAU+1zeFHl46lpMp79lZqFlZpSGGmyeuTTV6pa7blRwMeQlZhTA0dizNRJqvKsKgz/O+gqFqoOchTFKCEoCEQq19JB2j6MVcvKB8NSrpu3Q==
Received: from SI2PR01CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::16) by SEZPR04MB7997.apcprd04.prod.outlook.com
 (2603:1096:101:229::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.16; Fri, 16 Aug
 2024 09:25:29 +0000
Received: from HK3PEPF0000021D.apcprd03.prod.outlook.com
 (2603:1096:4:193:cafe::54) by SI2PR01CA0039.outlook.office365.com
 (2603:1096:4:193::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19 via Frontend
 Transport; Fri, 16 Aug 2024 09:25:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021D.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server id 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 09:25:28
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v12 14/28] ARM: dts: aspeed: yosemite4: Revise ina233 config for yosemite4 schematic change
Date: Fri, 16 Aug 2024 17:24:01 +0800
Message-Id: <20240816092417.3651434-15-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021D:EE_|SEZPR04MB7997:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 61882525-6093-4040-58d5-08dcbdd55e2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?xipGJomg0Y9iMoMIkNHArklPN8zspQdYh1SSeAFefwAlFqEJw4AekD4yzhjT?=
 =?us-ascii?Q?cz9f3sL8z7o821b5E1GGoVz7dXyXyvDQenafDDsunLPrCWFALtc9mJ3MJTou?=
 =?us-ascii?Q?G1blYvhbhrs011bkvbcjXcIc4kIb+64bi1cg+JNP3FHMaTIIOfu1V4zmVMW7?=
 =?us-ascii?Q?FQtfCW7mTdzXlY3QA0ndxH9urFWzJF2ZMdquvBuutmeAWAJlvL4RphvdM2ul?=
 =?us-ascii?Q?TxQCo/JUzdSQ+v/MBxHzrdn5x4QGlbccGM5Ivpt4bftw+hqK/iO22ITkhmG1?=
 =?us-ascii?Q?MLmSrlEPpfy2CP9QF6+EUF1Dm5bu2hIJO1zyxZHAJE3LXW0xw6Rq9Kyk6KuN?=
 =?us-ascii?Q?5NHv5M7qRaMVOxLQgHQpudkzG0zZWS+ENddiI/Fo+vhIX3YPvjFQeF/dP9kO?=
 =?us-ascii?Q?z7L0W5JuQliC+m8Cs2JTpfhWzDa5m/PDYSiANcK0gnHPy2MdKP2PUo0rDjHX?=
 =?us-ascii?Q?i8d3+w92b7WtG8y3RdZRhYbrSFxLGqJHdknQwLOeTWomJ3KSswfYMHBmV+21?=
 =?us-ascii?Q?XxIdJ+uaPj8nrmLbtNVnH3mci4Bvdafy2h7I2t0Yfbb5BRv4U6+KkDxVK8mn?=
 =?us-ascii?Q?pfvvrEdp++c8y+7U7QSXBw13R/e4uUd6UpTAxM99ceZg0jVEG1WZaDVRRJxa?=
 =?us-ascii?Q?kRgrHRvduoQ9VCiZh6D+S/JTH0qMkr9LpfSzbFiNzZQoiabOV0ZNtzbb7qDt?=
 =?us-ascii?Q?yTVYaJguWlEiBJTQEy0h0h2NdvZqHmsnOnBroHT4IMPSFO/573wLbGV/FR0z?=
 =?us-ascii?Q?rciAV7R2ks4fPOfvBMzp/XneKUu1iRkFHTJfWi+51qZfkHVIWvMaWxCvDbXt?=
 =?us-ascii?Q?1km0U/MMr9gIH5yuPqEoZEE7viPmwLvcWcYZrkvqBtYNe4t34LecmghATLZ5?=
 =?us-ascii?Q?VXXUgRlVQ2K2d+iQcpwsc4cWUDmApKaYwegF/fwhqbOt2ezmCpjQBfYbru2J?=
 =?us-ascii?Q?j5AnCxvkNAS8IWFY+tERX0s6oWu+2ScOWxmE7CPBwlTLYJC7aQnac8o1PEQB?=
 =?us-ascii?Q?UV7UivCoGfVrxrTBLyAcin/W7Yb2kI6HdXazItumyyGDuer4fvSjeZ4GtCco?=
 =?us-ascii?Q?A8V3imHwTukWeFi+JoxLFKUukuNDO4aoKym/WElI5LgQ9LhlBShVmY01hOtm?=
 =?us-ascii?Q?rocPoL2gHmO1k1TiSS1pWabcikFjSnZg/3g9Mqba/fDuKTIihR1t+LxKWe4e?=
 =?us-ascii?Q?AOyWHawdob9U6AcP9rCZyc2mdko6W0FV+hW3VVctv4Z2eRliTrQ4dJKce0m9?=
 =?us-ascii?Q?TZ57eZQyfjs5XfyidDZM8BhXf0jO3QMRjeskCkHxj3OiGSY89vbf8evGUpv3?=
 =?us-ascii?Q?OqgWwqt+jN4GukAKQT+dPlwnr+3ldF8J64MRxoR6b4xpmoWnD/X6U5CZDpQO?=
 =?us-ascii?Q?wrRwzyix4bGCAQ8xnSFqwAqiAPI+PYBdRFfNFXPAr9zUA8jmrn4T5SqV7iBC?=
 =?us-ascii?Q?d4qSoOQN9JTkUTuvcNfBwOlmC/rMg2kE?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 09:25:28.3097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61882525-6093-4040-58d5-08dcbdd55e2a
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7997
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

Revise ina233 config for yosemite4 schematic change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 1765a0bb70d7..df389b506b4b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1034,28 +1034,38 @@ adc@37 {
 	};
 
 	power-sensor@40 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x40>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@41 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x41>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@42 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x42>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@43 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x43>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@44 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x44>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	temperature-sensor@4e {
-- 
2.25.1

