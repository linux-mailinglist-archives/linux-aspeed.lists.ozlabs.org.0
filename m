Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE4895973E
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 11:42:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WphFm4cxpz2yMF
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 19:42:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=snTMrlFh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WphFk43cmz2xjh
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2024 19:42:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtbZdDrHHzDSRLugrhzvRa4p1pnSi0ul6PjKResyft/uoo44fjizCdLYZuNe9y1CIuRX9lKuQ/0g6Lh4Diro/ZXUpSKMC/5+mbvhgm61biiS8yJGTGqOQN8pCvTZtDGTy5is/uL7WeO/xa22OC1Qq+lyd0Rq3jeiT1cPvm5icMxC2Y1PD7ZT8EJe5LNGdV2PUqlrlGfxOBNeQCtWYMJdFVLik6Gom/qmLU79+qajGd4YCc9IDSXRWv+9aSuJIUEmJO5378NXMsHYTBi4WHGk0NyRd+tAa4cO1nKwliDfoVxnMJMMXyk9nJzDlrHCYNKoBe82/u4YPtkLN24QKRVaqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKZ5ogJ9/YHI36u51f7OMva5yJpzuLKM9pz7+UUgD64=;
 b=sDDbYMXjF7d5OWlKJMWo3zfJvtBq2biHKOQNfLveCz8xVqO4Nuply0yXU9xO9n05lMkjF4JH9BTFgwQgf6QJIW79hQJm5oxbDfx0m6yYBimJU524SsCRqspy7aFcCwQ9tScKCDbv/L74abH9OSxIMBZZF23izYMzPs9fIaOYXzWHZ1z/OYb4yh/uqxURtefE1rQ3Gu2IJaKJRRJzL7Fwn0IzpRQ0Q0inGlN5B1P9a3PPg5usMjWeyRViId4/XSKgAuF5MQT/PYIT/wVxXn24W+E31KDRW2Gh0Cks4jR2BWA+cjibU7PQF9FqQM+G2JrO0yGpc+l44ad6O08yxUeCJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKZ5ogJ9/YHI36u51f7OMva5yJpzuLKM9pz7+UUgD64=;
 b=snTMrlFhSMRPd8nQSggFW54pk8HOjj1h19S+MFpYlkEyRghfgMuoQaaKs+JPq7Rs0N7bCO7jhhEKFUCX5v1R4A2MGmV90BqjW0M1Iommp+etAb4z6ZziA3g7hN64PlUUHNPDzfQqV1qIQI0FkSov+r5rrLUlG82/d9tnBFsNNNZ6GYUjTN7q/gb0eCqOD0+gnGxk15JVf1uBSp4RnW/lL/eTA8y7AODPFVYQyc41PJ2IAcyaypPkkfsj5/b2pBcFMDv4QqAUGS5lpR2V3MrTefImu6MvnTGaUMnN4ILzghNTIrrEPwVRy7SDFmdRCZn0lhA6jFQ7808aIOExXX2lLQ==
Received: from SI2PR02CA0028.apcprd02.prod.outlook.com (2603:1096:4:195::8) by
 PUZPR04MB6938.apcprd04.prod.outlook.com (2603:1096:301:112::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Wed, 21 Aug
 2024 09:42:07 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:195:cafe::10) by SI2PR02CA0028.outlook.office365.com
 (2603:1096:4:195::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.17 via Frontend
 Transport; Wed, 21 Aug 2024 09:42:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024
 09:42:05 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v13 10/29] ARM: dts: aspeed: yosemite4: Add power sensor for power module reading
Date: Wed, 21 Aug 2024 17:40:21 +0800
Message-Id: <20240821094043.4126132-11-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|PUZPR04MB6938:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3b6864a4-a555-4681-9578-08dcc1c5850e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?pqU9UTaNoAG2l1eDOO5Ep/TnvdQJ5HOH7jfftP92rHM2otXKrk4Yt7+Hhkve?=
 =?us-ascii?Q?/6feHxk3R48I4HoG9MRfDG4KDk2pSmqjgc8XvovXh1dnRF+Ioijpe8v9e0Ny?=
 =?us-ascii?Q?xXM4lwVYFC0KdBigRM4cw41uTQU4xJvCHMI/lmWUe8JABUcXORRsYqepxdV+?=
 =?us-ascii?Q?hxMM7sfcvnNf5zGqeph8x7ezcvDw4yKfrNkvtWv63SX5VCCm8Bah0RD0mFgW?=
 =?us-ascii?Q?CorzoKYSz3eem/c1rEapokp5oPXDygNKRQyMXQ3khTvk9Ih7w/JC7g/zMKFN?=
 =?us-ascii?Q?0gxhC/Wg1Mqa+FHUVVBlfNYVvp2k0JHCSp0dJFJJORq1BEppSWjKDxvVQUzo?=
 =?us-ascii?Q?a5reKGYEmRuVwtDO2Fk22yBMuVJOpg6gZQ+DRN/WFZcrSnyi6c1VmSQov5rX?=
 =?us-ascii?Q?YSlUhE05vOFnWlv8f/fdo5zZooDETQmu7H6x775ySdVsYtGS1jcgQo280x0K?=
 =?us-ascii?Q?lnHKW2nAlcbHS0zPDgxNXP4RcoNg0Z+DQVaUb4wBvTvVXVpx6rIbUMpzPAqJ?=
 =?us-ascii?Q?qf0PYhk7nzd/0SvRaegYcc8fiQZ6mmcnPYVnW6kMYnzUfNSnN2ceeftaFxy5?=
 =?us-ascii?Q?g9Nkkw1YEEaYvLBWbZYdwgvrn2cJBRxQfculgwR7ui37luql+BttA5KtqEOY?=
 =?us-ascii?Q?8XjbxE9yEokKHF/Q4hJ5zFGjh1H94oTbpD9TkrCVofoQgOIELr/vCwMOIz01?=
 =?us-ascii?Q?4yYqJzDfNUYwLFzGgJo0opuMOsecpzw2M1p5e7/LMGpC7zGULGYVUbo3A/Qn?=
 =?us-ascii?Q?Pd8NbTnvfto76DHayBeRU5q9bav2kweoZuiVfn1+dXpLQ4BIPpbzgZor9Wuu?=
 =?us-ascii?Q?YonefhFvw1JOl7e6WtuDdVuijF4EKF/Vuw6heIZYPGYb1ehaUFn6WMFvP2iA?=
 =?us-ascii?Q?xA9nQPDpDDOhKY5w1vaqbM9ckHjI+seeDe5G77ASxHnKNvozJZPU8XN5L7kB?=
 =?us-ascii?Q?YqKkUv5IHPLGhp8fxJzbK0y/vM0g08gRP1iNiVbRmwoWrffsHSEYITJBzOHh?=
 =?us-ascii?Q?crtvJgrVs0TZTapwhScWObwto8IY6VVB6iqJ4CJVjxjac0pnJxsGdKU/fdew?=
 =?us-ascii?Q?0V3j0N6OvW0YaRICkwv+Fy/YBuaP/+0FEwgnNELZXSC9asgl6BVW6GkjaMcq?=
 =?us-ascii?Q?uMAw8Gk5BWRpnDiiYzanDxegBv/ROvW5D5eNyioJX5VCyP5amAWXcppiDQde?=
 =?us-ascii?Q?Z/LSp6MI11aR40aqUmwvKrH/twqp44ISYSsPmVXlP0hfZ3zYv1IcDyW43R+k?=
 =?us-ascii?Q?LOWgtTdKdNkB0DDrC+zxD3NDZp+yJK6iLFSm3p/SX8rkrGQ5i0reyMDuBRf8?=
 =?us-ascii?Q?AtxVBwiUAWvpw8/kxCJCsSvJXbE3GTNCYU5oz1/a5rv3K2AXwvoM1h0C3SVI?=
 =?us-ascii?Q?Z9nU3pyRJvdiSk1ALSw4ziqT8U5W0W92vDYCsVCLItxVN2U/9iQo/IGyftpi?=
 =?us-ascii?Q?j9AZAkUdlnl3qAehgl6GdiFRBrcK3Oy8?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:42:05.7780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6864a4-a555-4681-9578-08dcc1c5850e
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6938
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
index 09bbbcb192f5..139a09de24cf 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -906,6 +906,11 @@ gpio@23 {
 		"HSC7_ALERT2_R_N","HSC8_ALERT2_R_N";
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

