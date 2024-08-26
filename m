Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDC395E885
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 08:25:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsgdt5Tnhz308V
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 16:25:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::61d" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724653520;
	cv=pass; b=nP24ee9kQzbSkCcWxJBsJOpF0fB+Ym+vf1rVCLOBtlBpfAoVUEFsfBUZ8T5uipDN9tRim5yzvFtnktgloYqbme2zf3fuV2OMzRTOqymkQ+cs3jG+eDl9gcnRLd8U5XaVtvBQTvcyOiIVxwOq886VeZG23DlLV350iYSNkpwXHrxosJRxkedNM/if3aMfEusFfw7WX6Xxa5ao0OcOcJ2r7PS/3ELOJQJNCt1TCuTRg7x0yNViIjYHx6rgb87towR7zw38JQVRV4kjPSlPWTcFUOjVEvaXFrfJEc5qOzaiAj4rGIyuSCbqwoifmyJCCYalUpmukh+rThnvuceCeKTT9w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724653520; c=relaxed/relaxed;
	bh=fKZ5ogJ9/YHI36u51f7OMva5yJpzuLKM9pz7+UUgD64=;
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
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=lZk16yI9; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feae::61d; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=lZk16yI9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::61d; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2061d.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsgdr4NdGz2xsd
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2024 16:25:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nCz0PZXgvUEAZn4CEn3KDTyK0tS4WI75ZwKxqUJRl0wRmRojuSSmBnBpBUQOEPkpPA/UC5E1dqJJV76igj/0q1NJeM/wDnM6LSzY7Oh8DKEvhEKyPDP+6YDVMwNt8j4FUGR8NwDj7wOc5+zdNrmBKEedetmBvAWRfEMdThTLRJCr+60EdV9R2fM80kM8K6Y//FKFtZCx2sT3ipJg6Yg4R7m8LXA3nN+JvQnADWH7Orv5j8iP9YounKP4U0tO2LpN8i+U3B0HbD5lh6ETAuJbtgYcAq595VdO+so8AQAKKEKkiwrsEh7/qskwygd2HiIc4VNCQO0nqCqA/VL/h5Kprw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKZ5ogJ9/YHI36u51f7OMva5yJpzuLKM9pz7+UUgD64=;
 b=sQ8rDYxCY7lyk1s8luQRxhjHzuQjFn4s7mxzFvLprHU7XKiQoGkqrDoav5nO6ngeBeZR5e58vQndS2hc1H/ayXPwspBbd4x7SmBduiYXF6627VACqQMGEvU+Yjv7TanGben6Xhvf0mH5oRrCL/SX83iqMGcr7JHUUr4OPcaPrB5ZJ3/7gH93rn9zKiw9EkvszQwHA283V3APrQR28YCDRD9pPpYyUm0SfB1eqjKl9uny2eSDAnrcmIAKn/jzgUeThGFAtcbITMrCeS2WXM3xVyygF2sqvx5hKlr8BHjA46rya5rnmAGjM+cz/vVYeMWuUgTa+tQ8hXFdzISrjyYMlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKZ5ogJ9/YHI36u51f7OMva5yJpzuLKM9pz7+UUgD64=;
 b=lZk16yI9Tg9THunCu3oNaKS92QnF1Px3Zk0uobUBg1W8RmAvanibkagMqZ5Jsc3gCbGMLHUAIQu0zaK7mnkuqnVdjPIDedsyXxTYHPF2dgm+ZHkALPZ8r32xnvpjaJQWi2/qlbh5NPL6A8Fw9oBQrZOkeXuTtmgccDwaCtNuzKdRInTWk7PcM29TzR1lWTCpleFPAsRmg/8IImOCHfJ74q1+hHVzW5I5E4JABFepcmUs9QsrYQbguqxIRVtaZhEsm/bKNpmVmTefx3ds1zmZbLBDdA907hyBfUQSEaEwpVWzVOhXeoXf/0j7MTFUk9S87Tk2El2W7ieUTSdxPZNOQQ==
Received: from PUZP153CA0010.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::15)
 by TYZPR04MB6499.apcprd04.prod.outlook.com (2603:1096:400:281::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.23; Mon, 26 Aug
 2024 06:25:01 +0000
Received: from HK2PEPF00006FB0.apcprd02.prod.outlook.com
 (2603:1096:301:c2:cafe::c9) by PUZP153CA0010.outlook.office365.com
 (2603:1096:301:c2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14 via Frontend
 Transport; Mon, 26 Aug 2024 06:25:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB0.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 06:25:00
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v14 10/31] ARM: dts: aspeed: yosemite4: Add power sensor for power module reading
Date: Mon, 26 Aug 2024 14:23:44 +0800
Message-Id: <20240826062408.2885174-11-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB0:EE_|TYZPR04MB6499:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0893c6ae-3674-4df2-de53-08dcc597d066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?PLZOiNSMk00fWMyjArtY/F7Ta64KC55PQoPvusjR5mkIxFS3wMvhcjB28Qp+?=
 =?us-ascii?Q?IulaIVeAW4qHRtK/DfdhtQxpXAS6wlOhOx+MTwVqsIjNYcLXvG9bGVupvzX5?=
 =?us-ascii?Q?ObeVHptQCFHS/L4z1I4TV37SSK5AVRHU+sSw4mFPXMBClCfPLShwmAvB93kX?=
 =?us-ascii?Q?6qMdhogdwDbPPVoGOKHCQu84ZofOuipWUm/yV0cwySn8tSukbSYZUHYR15EL?=
 =?us-ascii?Q?JjVmxcKil9A9v4DYVz2ovOiL9aHoVUT/zyoSNeJYESq1/cNaKQTfHv3092pD?=
 =?us-ascii?Q?iAQYZ95yoIKiZC+TksRO8I6OQI7ggml6QxCJx4nyqPPGEa/zYRuWwBExQeTi?=
 =?us-ascii?Q?ODM0azNq9sb3rucMtHIbU7sXiojW31QyH3fF1Xm1t2+di1FTu8f65NciQc1g?=
 =?us-ascii?Q?TzVJlKezkJylWY6h7slXqkOWvTyw43c7j0bE/J1/2monelJ19pb16ig+Bx/N?=
 =?us-ascii?Q?BimTe5yQMl0k/9j0vhcctSkEpZBoWwHxgWe6HzheVnYYNQYn1WXWmydKfcGl?=
 =?us-ascii?Q?deP0tdeArAMPHEoiarXTWWeJxVmj41pe+paE53M0biVYbwXZg1oP0B4m//al?=
 =?us-ascii?Q?ewEyeYj9D65zDp8S25wnB8XwoH4k8ATkuD14qTZrtG1BXMV+t7KLrElWujyH?=
 =?us-ascii?Q?YfWff3utTDcfaQU7rJy9Q29eEnun4LvZAIn8COSbMZARl1/upeRTQ1CLkmFq?=
 =?us-ascii?Q?JKfGzzFKHr7ekoiLYypVaw4d0umTmoBIwma5pkJ8OaXa6LQXLTcU8HUbK3fm?=
 =?us-ascii?Q?0xMCQiLjXVg5L2RPSviOH6U6sAWYrE+PehGAUfJ822pbSBlUXXh+6HPHpUJN?=
 =?us-ascii?Q?lkKfiQrfD6oboFLNMFaa86zXpY85q1FMWvY+KBt9beNJKWpOQ9TTMx4g+hVA?=
 =?us-ascii?Q?rhlRy4kCrZmW8V2zHXWtq9L6tJtxuwykzMREKVHSA8/axO2XMadG7Q2cV7MY?=
 =?us-ascii?Q?i+xIRWI2Om8K1L4eDajvvIXw0TaMn1na1xnoTprg/FrXbr49ukBtTDxFz97d?=
 =?us-ascii?Q?wI08AuhKn37MakZ/IBxbvyp0+CX/AKmiz5g76efAqhgbAI/eulPrwwsEPjGX?=
 =?us-ascii?Q?NBJgb9f66baGnzAuiSNtNDwFqkMjRmXlxRLErf3bVBmFzxEaI4g/cRMTyLMr?=
 =?us-ascii?Q?n0ihfC+CCj2STmtD1IeqYdKBQP3P9imn6deP4dmxGWQS+82v/4aZr6UILjEJ?=
 =?us-ascii?Q?hGt6O90j7LzEV9B6J9n2/tc4iWkkaAkPaNlgnzwOoEcRgc6rj/3udTegCmj7?=
 =?us-ascii?Q?EU9yqryeGU4CcTCRDxAfoKzu0BmafwnEQm9ZCARcHFyjY6BtbuCdXsG5Rw2v?=
 =?us-ascii?Q?PenvSCnyI/V1AJWn75NTevu09B2C/sMRp+k/H/sQtjzGpzkmyK9Vvb41ptQj?=
 =?us-ascii?Q?C/F4mFE56jaWkMkg5EFXRtZKB7E9diNt3ax2xKrys+iIOlUlWGZF4hLw8dqA?=
 =?us-ascii?Q?J1I6YsvPU/fukgFDVpFUKbHIIrUBapZt?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 06:25:00.4716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0893c6ae-3674-4df2-de53-08dcc597d066
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB0.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB6499
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

