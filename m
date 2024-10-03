Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC94A98EAA6
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Oct 2024 09:43:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=iaGkzbMz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XK3Zl5T2tz2ydG
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Oct 2024 17:43:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::606" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727941421;
	cv=pass; b=b0wg7miM7tOVMlcFdmaZFwYcLGGQatrFZYzmHuYLRia05RWmsVx2E/CLLgE3oXTWs4tnmd50T20Ggb64qcFfJJFBTIFgU4LCu5/jTZ6v8OwoBZy3q8dvCA+Q2fZD99huPmpYPq4W9l1L55QMdWnC7o8UdboQMr99Vf2MiFeovYDy70urEXNXRXI32LL6ihBix+XqR+NPWYr2FshJ1HwjFWS30RG6+3sJp8U85ZmtAmho29YcTF4grRoMabQiBnus36VRxurRiEw/k8PO7p6C3GnB387C3oKBHqWS+y3BwluIlz7Mtcb+I4jQB4Od2OuK9Hkozcvo93IpscnXE5XlzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727941421; c=relaxed/relaxed;
	bh=V8EXqVr6Gzq+ihzDYW3k94hfHuot/FrKhwqin4FkW+g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SC1ZoTuBWVJgY0leGw4sThejPBKputb29kw/abiUcrQ7rWxUx1OTW5ukLc/Izai0oscIJptxSsKORl3X9Csz/qZzOUvwr2SmI5J4apC2EDAgZG88pQi+gy8m7zg88te25Op2cpBjbLlxbVyqBjZTQKOXkg6mnBi+rc/Nqc79xtlgxbhr4pJuhy7ajvUcnPC5gzN2cKEBGqx5qgap9Y8ng0i5Y+7xhTDTnxh82JEsGYAPJ+2s9qtQ//Cj8pPiug840h/ucNxPllropnM8AK/ZAfw7XTF8thKVWmcJuuxuHT/FdIJ9xQPV+PInp6lyqB8OBrPRaPOxYWpWwWdOJaArYQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=iaGkzbMz; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feab::606; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=iaGkzbMz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::606; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20606.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XK3Zj1rrqz2xxr
	for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Oct 2024 17:43:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKlZeNrKhifSxne3BIsViC+io7+ufREj6T1qQMLpjiOLQl4eFKNy652ElbF3ZU1+CAOwAP0qORQkkThlSXwCNclB9IqoRilMXofgWuhSEMQEic9TJ9uJ60IltVMGP6krOJmQ0Nhgx7Xx0ckxUQTCBK5KWg9LSqt4Orw2/ovIVIcK/GK1Ljsq7jORr6QOHWq4eR9KMQMl7JPe+lJtIZqUGicDOMCqy026JzBLf8gIRfnN0ujBA9TjZzRDOwuBQuUh5mRZiD8kqtWyF94LbnXzjONQTge7gKv4y0fBtcIgMQ4RPFLAuoH1E1XPPXEGVAg74axPcO9En50d1EHEOnr45w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8EXqVr6Gzq+ihzDYW3k94hfHuot/FrKhwqin4FkW+g=;
 b=nuxZ2R7QwI+mk7TNuK/q5Zg354LHfhuv8+lTEpx8WcSBF8DAEv1Tq3+dXXa7dkoT9YQpcBerA5OzPyj1asekUCOyER/dFvbld1hPK7rMfsYxLQGnYzSicEqgLDhlxiigxDCtmbuJWp/aKLExy2il1RXmeOPe8ikXFEHUvyR4Fk/Fd6tUxzfy0dohvzitOfSK88TP0z46oAqQwsnqKMuwWniy+57K9Rw8JgXF6/pu1xdmCkUogNQKKDimkZPxaLxKDuNkEAZTTNHs8h+W6t+LRyvirtdMYHwuAW0Sh9s8p41cB4DA/WcP2R6FRc+lfx7+LwpP14YtF1akdnVTSvfH2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8EXqVr6Gzq+ihzDYW3k94hfHuot/FrKhwqin4FkW+g=;
 b=iaGkzbMzywjUelh/cSPfDtdFIpbQN6Q5nBTH/PR66s7lFcqg05ooYiuDECzlFYuF6JgKl0Ej2fpB69/izCUmlfmVSjoPXGHav+CmfM++zdfY4sCa3W3KVXy/sFiTwpi2ko+Hcu1L/1ZqXge/ujLYpG7fgrZFoOQ9LulpE2pts7QEJxPy+NrT+RLyRBeBX5pXYD5djyERvZy5v6NAL3XJqL/evMlf+qG1DPzvy8S4AjRcQCI42kfoIkm1E5hXJdtRQeyOLRAe51/r5hYZyPg6vA52QO0GG48wFnrJucmEtWB0joktXhfY7Iknvlham/laSbztyhoY+jVd1cY2J3FxuA==
Received: from SI2PR02CA0012.apcprd02.prod.outlook.com (2603:1096:4:194::7) by
 JH0PR04MB8155.apcprd04.prod.outlook.com (2603:1096:990:a9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.16; Thu, 3 Oct 2024 07:43:17 +0000
Received: from SG1PEPF000082E5.apcprd02.prod.outlook.com
 (2603:1096:4:194:cafe::cf) by SI2PR02CA0012.outlook.office365.com
 (2603:1096:4:194::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Thu, 3 Oct 2024 07:43:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E5.mail.protection.outlook.com (10.167.240.8) with Microsoft
 SMTP Server id 15.20.7918.13 via Frontend Transport; Thu, 3 Oct 2024 07:43:16
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v3 9/9] ARM: dts: aspeed: yosemite4: Add i2c-mux for ADC monitor on Spider Board
Date: Thu,  3 Oct 2024 15:42:50 +0800
Message-Id: <20241003074251.3818101-10-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241003074251.3818101-1-Delphine_CC_Chiu@wiwynn.com>
References: <20241003074251.3818101-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E5:EE_|JH0PR04MB8155:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fd6e5f69-fe71-4236-670a-08dce37f0b63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?poy4lyke/PXCRrvCcOlH0wOSqjJoXbUnXOCNM8VMixg4VNrrZW2QN+dTP97D?=
 =?us-ascii?Q?XdTt8ZO4/doKKPJu7RYpxxiiuxRasEHjmV+bvFNPXuJPO9Dp+bpGmq7Y8kAT?=
 =?us-ascii?Q?p8UaHUmw5/66UgLRjVdLS+HubFdXdZ5/Poj734GuStyIbEZ9Zulf15DpOZ0N?=
 =?us-ascii?Q?x8qEQ256noGda0dpfhsjqpsBKYxkNSLwbN6cfTrPQnn1IKTxYNsqEWmrixPo?=
 =?us-ascii?Q?YbsPTMUvaSJ3EuzbQZQ27MChAsML+ah/JGLpRFKdTDoc3Nvt40ydmtVtKwNf?=
 =?us-ascii?Q?HrPLBeas/k/ZJwVpCrS8DciRiRE3sa7s6uPqEhKL815wzIv5niPwSIj2vuaf?=
 =?us-ascii?Q?9BRNcSHVoRV7w+hHlBaA2KqB3IuSdnTSHwsw/j/5dvtCYyg58kCEx0XEX2vY?=
 =?us-ascii?Q?ZpWxR0sY1vYV5dSqm4kOBWhI/Sh4TKMD9kcGpCcASQGqDzXYEjD+4N9Dk2as?=
 =?us-ascii?Q?34GmhgrDOocB2goWrYCpy5xUwi86U6BIRDISK3N7PlKPmj03OXUUX2/z0QQL?=
 =?us-ascii?Q?S9An21jAMcOJrIjACbU/CNuNo6XpG/FQnrhA7wyvY4MDIdsd8pU2PYslIgjg?=
 =?us-ascii?Q?jEuBnI4JtQVM63zHs4u0fpP+bG2EorTsvEvWln8BBOX18XRGeQUOYVjtvKAp?=
 =?us-ascii?Q?0PDdDEbFDdZSG1aplS1qwQHe/SgCyKjzIYWJeslbchEWdy6ppWnqWY3y4AwQ?=
 =?us-ascii?Q?fXFbsbxKJnEwgjcsgRPmA8p1R0MTWxHXg7qZ6BfiOyzmWQA39kH66OO1UbUG?=
 =?us-ascii?Q?L01AJjw+Ds1ugbyNUv+08Qv/TjVSzhNq10fgdjdvd7j+QqcubIVZjR4HJsww?=
 =?us-ascii?Q?+9a/6/edDFl+3zrD9DtbAE7+Jm9G1O3BllbLbJ7ilaA79K0TFNMeJZFpl7zJ?=
 =?us-ascii?Q?cus9mneTffgmFL213tWIPqh9JYI+jbuxV+ayrv6UESIVpgUx+f/L59A+5zn7?=
 =?us-ascii?Q?Jh0GnZMoGEqBsCidF/tcLXd/FoyVdhh5uuo3SNy9ZHQI5mUI2SbMLEp7ypXb?=
 =?us-ascii?Q?vnGe+Hr8Q4lumRD35sfE9fM3KWi5NkPKi1uldCUACT+whrMtC5u8Ekslny6E?=
 =?us-ascii?Q?x8PSY8av6kneq6Qh3EEGAJ2O3lVAN++fcciq1BAKLCskiWOegU0VGcjQ4lKE?=
 =?us-ascii?Q?VEbMHAMIAjRcsInrSJ/HqC1LXZjaHr7oT8NQbsPKs2s7u1yxW55kl7m67CWh?=
 =?us-ascii?Q?ojz4mlLid/VPLvfKAqC8YTrOM0lr9O74D59vpjMfSxMMhETVKTWcuEZ5eN2L?=
 =?us-ascii?Q?c4/yrOlLCCPknKfo2esva0TKnbxKEDaqxQR0//oyiJHuc+xwD/wqaySk2ZOn?=
 =?us-ascii?Q?9WbIjMZVskmIwBf9tA3u0VkV8jVTKXGgj4CBRwaiGUdBdVsVJPgZWNRA3aTU?=
 =?us-ascii?Q?jxFR1mo=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 07:43:16.1026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd6e5f69-fe71-4236-670a-08dce37f0b63
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB8155
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Add I2C mux for ADC monitors on Spider Board.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index bc25c11df255..ab4904cf2c0e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -34,6 +34,8 @@ aliases {
 		i2c29 = &imux29;
 		i2c30 = &imux30;
 		i2c31 = &imux31;
+		i2c32 = &imux32;
+		i2c33 = &imux33;
 		i2c34 = &imux34;
 		i2c35 = &imux35;
 	};
@@ -1100,29 +1102,25 @@ eeprom@51 {
 
 	i2c-mux@73 {
 		compatible = "nxp,pca9544";
+		reg = <0x73>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-
-		idle-state = <0>;
 		i2c-mux-idle-disconnect;
-		reg = <0x73>;
 
-		i2c@0 {
+		imux32: i2c@0 {
+			reg = <0>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0>;
-
 			adc@35 {
 				compatible = "maxim,max11617";
 				reg = <0x35>;
 			};
 		};
 
-		i2c@1 {
+		imux33: i2c@1 {
+			reg = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0>;
-
 			adc@35 {
 				compatible = "maxim,max11617";
 				reg = <0x35>;
-- 
2.25.1

