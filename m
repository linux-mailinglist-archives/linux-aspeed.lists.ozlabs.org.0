Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F0B917BE9
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 11:10:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=YkVRbC0u;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8GB700w7z3cMX
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 19:10:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=YkVRbC0u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::60b; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8G9R50dtz3cR1
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 19:09:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifsjb0UdaypTnaht7YI0GogX4hAe1VDprPL6shY7VWD2vR6/F+yytahTPiwjbuJ+rUhtMtReZ1GnMuZE/eRqwEykEVItS6kUza3kHR6yTAKV8/YILGfddV4FVZHF60RusiB6wgfAnkF/QxvCUnfwksluqCo3RR2YWmfKpNSerXWM/7ubOpLg7TM7JA/Iio5KVJ6DjfBr/4Mfuqt6gyoXCWQDlxfLySr3XYxpWGjtBL0AbKEe83m3i2C+LThpGnavnuBgRlfNius5io91fvoxuISV5G5r8SBQDp1m/5kwLD215DkoF9lMPmRMU49K7jZW+zmerx0vFp6c5WmQ+nywQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPuO9qcjCRKT1hG8tAOI8QlF9L4C9eaYFzPaHsZZ6p4=;
 b=j9Px0ETdwVGbwTCQhwD7SAR0TpNqT+4vXxQmaHlSmxenb3AXeQHVyzBwK0NXPORU4ntkdnCioT0Ai1aISkMo0A492hKtc/C9w2HHk4OKjB/sqKHAc9SKxDWo835NN7vfl+dkFWsmZ7mP0f2aENsFxPbRZQhy4kFIfaOXS/NR+UYdpyb1jBLoKDu++y8jAZk2Uw61xYOULpnvfXQgDNsSXUf0O3Z7Yh9PA/9pSAWPydRIda9e383puVFQ9QBTcdoXFKsWrM5RhVQ02fDezvApbnjXoqo0MDletQhJNg28B4MkxVVrSxPQCo7NV6YlWUa4zPumNfe/YC5f3iSuiUSReQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPuO9qcjCRKT1hG8tAOI8QlF9L4C9eaYFzPaHsZZ6p4=;
 b=YkVRbC0uE26smsAPR4xlxJsZYB6E7Ml8gb91Hhe6+1hXmKOAgYffxxCJgre2LcFyj3dHJLMQh9YEQiYJni9s3pctAzRMfPdg00kOe2qyS1j+DpIkBtO3xxVNpVTzMXY6YbqCYATUmMFlfbl6xj6+tNV8Ge33+RFKP4P2p5T72io66wfmZu8GYrDAT117Ik1ZuFw1dHFXhlXrp7tpM5xXSHsNJ87wVNI+mR87UreqTG3YrPXG0hVhblUIdNGpHkRZyrM1wCXXMovV4nde1Whr6LqGzjVOuj7K1l2sLC/L2hxeRdesdehMXa4N9uNUZjvk+xB9RAxfc9eP5lfkKkI8oA==
Received: from PS2PR04CA0012.apcprd04.prod.outlook.com (2603:1096:300:55::24)
 by TY0PR04MB6469.apcprd04.prod.outlook.com (2603:1096:400:275::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.26; Wed, 26 Jun
 2024 09:09:14 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:300:55:cafe::a4) by PS2PR04CA0012.outlook.office365.com
 (2603:1096:300:55::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Wed, 26 Jun 2024 09:09:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7677.15 via Frontend Transport; Wed, 26 Jun 2024 09:09:13
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v9 22/26] ARM: dts: aspeed: yosemite4: Revise i2c duty-cycle
Date: Wed, 26 Jun 2024 17:07:38 +0800
Message-Id: <20240626090744.174351-23-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|TY0PR04MB6469:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ed527b74-a782-455f-0832-08dc95bfa601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230038|1800799022|82310400024|36860700011|7416012|376012;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?dmALihi5UD2XtE4l8Jdkjs7ZmYGJmt3kZamJPoqLDlNCGICjvjAfNvZ6SxMz?=
 =?us-ascii?Q?yb4oIXKQuxONO7MqvMvnlYMtal6i8gb8jQF2P90C6h/x6uxmq7+hZcWS8XgU?=
 =?us-ascii?Q?aYlZnfDYKCJc0f8wYpMHK4Ub7mA7HqTxRnsvh00byygnW26JDRe0BlAEOqoy?=
 =?us-ascii?Q?ER6KXNP70ELycAw3sejUzvNQ18Oe2FyLvsNrFUaJSzFNnR6NKgMOHMtEEKN/?=
 =?us-ascii?Q?rDsyBlNJ98jGPkK75Z0Tjjudp5k2Q+0GHn7lKZ7B2QZUrgm3hH/fxtgmZ90V?=
 =?us-ascii?Q?geNF+VjrzSsThzGtPR1YWs/2JQm3oNY5R1MEP9YXAK4a9gQ/He/DZAfYq2xv?=
 =?us-ascii?Q?u6E93TI3NPbwmPAUMVXlj2apxySNafAGG/7rQPrWOgxFAgxq8lD+G/47Fixd?=
 =?us-ascii?Q?xwBC3Xam/Tzge+cDe4D9RDAk81645ph8A+9/KegFqO9M6/+nORtj45SjWHCl?=
 =?us-ascii?Q?JoTI3ySc1KPquh/7Pd2acXrYS+YtXPLTfFWbhyvZmUk88LWh8Dw5r/graUN5?=
 =?us-ascii?Q?1P9+R75PTqZyKdR5hGpgLC1hZsaZIDyc3wf8Gkj9yLpdr3SEes/6UKHjZCRM?=
 =?us-ascii?Q?FrtUzTbkdJd3pwiFAArhE+/t95EsZfIfR1Nr6b0RIGcbAqwtlVVe9lOvT8m0?=
 =?us-ascii?Q?hzOJvKxnW1BflysSbKomN1OOxx5FSerWBOYT+AfaCUlZKaBD4IA12NriIuD2?=
 =?us-ascii?Q?oWo+UOdNC3F6Am4CYRTQDMHdgWM/hJjD5EYOIuNfHxPSjQGiOT5q06vFzyRK?=
 =?us-ascii?Q?DxLsgBkAGW9tI5HzAmfVtZ3LZ+4jt+fRgOPvBd2MX1aVfZa10VjvPHbN6TC4?=
 =?us-ascii?Q?4BzHGTJq7riMDUGSiTzVlbz1JiNePSwy3EKfuNG71j13G71G/oK+blruoN6y?=
 =?us-ascii?Q?YdbAq4hKsQq8VBPKxxhmlQCGsUpnpP8C9GxTsOriwKwCEwV1xNQRYs1nuEUQ?=
 =?us-ascii?Q?TvAV9yGXAZ38DeB7u9wBdI5WOrjWax3mP/hBLly/wuJInFpAsQU2X+2EtQKg?=
 =?us-ascii?Q?ogkgH4INaAm16Psq8fnRI1lxJnjNJnkZumIDQOtPY6MaDHNAT/owhhkPbD9S?=
 =?us-ascii?Q?Nz0qxs7MFcstrCY7moJJAcUcVaprJ0rkEp18EKUeaC1qO4K/mmaEx+kClRc8?=
 =?us-ascii?Q?l6kMlGagESRXQe/4Jy+1cddzIBzwvspj0Eiu02AUgNUFIx+8zfzmy9FSuzwl?=
 =?us-ascii?Q?Bw0Ajjov4t7gtg/uek69lKW3bvmR/X6CLpFruntSY6FF4XDAWlAiT+AskjYK?=
 =?us-ascii?Q?o8POwJeh1y91dLbTOGKaLTE2J/PklgF96UXsfLry7IowDufd+4hvGRtee3xe?=
 =?us-ascii?Q?GHp4eX0M5b2p9FVcYdAExxWRGvPjmllxlgarJGbKRoKG+TTL4JKbSX8NOfrZ?=
 =?us-ascii?Q?jKAYPbnhK75q5OmYSSD8L0NZBKFMahSSwImMN/IylSMoqkek7A=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230038)(1800799022)(82310400024)(36860700011)(7416012)(376012);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:09:13.3957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed527b74-a782-455f-0832-08dc95bfa601
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB6469
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

Revise duty cycle SMB11 and SMB16 to high: 40%, low: 60%,
to meet 400kHz-i2c clock low time spec (> 1.3 us) from EE request

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 62dfe935cbcd..21ca22281ef8 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -761,6 +761,7 @@ eeprom@54 {
 &i2c10 {
 	status = "okay";
 	bus-frequency = <400000>;
+	i2c-clk-high-min-percent = <40>;
 	i2c-mux@74 {
 		compatible = "nxp,pca9544";
 		i2c-mux-idle-disconnect;
@@ -1314,6 +1315,7 @@ &i2c15 {
 	mctp-controller;
 	multi-master;
 	bus-frequency = <400000>;
+	i2c-clk-high-min-percent = <40>;
 
 	mctp@10 {
 		compatible = "mctp-i2c-controller";
-- 
2.25.1

