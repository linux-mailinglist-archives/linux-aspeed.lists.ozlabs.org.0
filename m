Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F46C878E80
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Mar 2024 07:16:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=ItNhVRRs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tv3Ly0wqHz3cZM
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Mar 2024 17:16:42 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=ItNhVRRs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::62a; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tv3Lm4FtXz3d2B
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Mar 2024 17:16:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpxt2sqbz4tDAoWZ8XI1jpWVXf3MIUyfq8cvE7sOgS9ynANKljDHvRM5pUNZibvs0oejqCGu87rz2e3Amt7tM38Qp2bkmnGV+yKd1qeEDiWrulJzOBV0BzYNeFBOzqAM4HicE2XIFQ7QzYeI87r3r/QW8R0dF62gLe0B+SpwZxlARJPw5Ld1Pph+KAMjzX93QBDtyCj7Sf1ZljDi4v+uAoBkZv7kR3iIOuC3RlMVLaG5Btx40N3yDewJGtfB1RudHZiYGBDi81QdmbiZuGkcJP49PCp651McA+3vt7CObwOCmqbgPABbVcaH2wc1D4ruLr0MEt52nIM5QPrKWnxR4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kCO11WdUiFDfGWanOnHA5fSAvcgtGuDJsJBtZQkii8=;
 b=M2pk0rXxmIACjTb9O2Jsqji6oPJW0E003jkw/n+XdWSHDcgpxEm1ln5ruAspEWG9x5EMDmLxglXayuiD8gNA4IOCFVs4VwnVaLMDizLgIs72nguAWFaJNErT1Nyy4kRGudwLdT/yvPmhIWOz4KP1JCCh9ImK7Ii6uzDklSNqGSyQnG5kHqRxBES5GNB4ILXYdmXyoE+M0I0AR2dGZDTfT7GYb77SdbeCNG3MDyto4EQ7rODFUSQJCjU3/hOURgfRy3PjyKjNKk5XVWE97raj6lgnoZsbsR9+6bbD9SjZCUIhQG/M8oFgq45fNsa8IujbnH5+5LUUpe4GvqrPNF8Lkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kCO11WdUiFDfGWanOnHA5fSAvcgtGuDJsJBtZQkii8=;
 b=ItNhVRRsGME77CyIdOnk8UbQl9u14eltDppkIwaljVFQ06wK6rLq9oFwlqpuaNDpip/rEGwyQDjNj0K1BWU/sn74iAtgc966T2tWNfnFLA0rAH6RoW76v7asyAbJMfviw50XmCTf2xDmVVU8STrqr07SA3nyEQDPlYbWqshzU5K9yRMTQxmJqI3jD8lUzGU2VMuhyT2tNtZVyvCq3AJeLEin0oByMXnmue2NR82iX0ami6AT168s4RdiQQBPWQT/r3e2X7Ya/jhm+7zHvFT+v4nK7amyiKb5hceal4i/Jzdau1JdDczQP0X4KbEabU/yR8xS369mGrLs9y54M48nSA==
Received: from PS1PR03CA0022.apcprd03.prod.outlook.com (2603:1096:803:3d::34)
 by PUZPR04MB6200.apcprd04.prod.outlook.com (2603:1096:301:ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Tue, 12 Mar
 2024 06:16:11 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:803:3d:cafe::21) by PS1PR03CA0022.outlook.office365.com
 (2603:1096:803:3d::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17 via Frontend
 Transport; Tue, 12 Mar 2024 06:16:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server id 15.20.7386.12 via Frontend Transport; Tue, 12 Mar 2024 06:16:08
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v6 02/22] ARM: dts: aspeed: yosemite4: Enable adc15
Date: Tue, 12 Mar 2024 14:15:34 +0800
Message-Id: <20240312061556.496605-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240312061556.496605-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240312061556.496605-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|PUZPR04MB6200:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 77067ecf-8fde-472e-a493-08dc425be863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	k/OJGeVgeqMgvgMgSgOXh6oi0aJ5AbWOD57XR0SKMnz8A9gc1A+t6r1FQlYNktCxxI1y26dBkMuxU1tei+xAZcXjvIKlhx90/4S9pfv/kdflxvTb21I6rkrCUMkFc6zIQ1UigCLNEew0caOwnOU2odIPlzbRTtZiy5W2LIFglYKorBrwK6MvRAsjwQ7D8Ijp+Dnb1rW3JWIWg5yniz/wIl2j1IImYlCbPetfMExsQs7X24A5NTaCrpCdMBs9TM6dI9WWNE4RK0pDnnlimR6TrPKDpfSyi66YRXX46tmf7mruNQOIL1t/eE3m+n5o6/XV9oBMtx4Fo1lsdHVzrpYA6KzvSJ02vDeaYt1ynGr++oLm7I8+avdTFc6HhHsVbZfV7r0E6dF5WklWbqvM4KVCJdFuyzosFUSVcCawMvDbNvE8eMYWBWDghYeZZTV3DisIgqUVAVH+wBTqaElLC2ibQ0lo+pX6krEhseZGd4P+O5kGUoAvPxygv0e6PDB1w9KRzdX9LGK5NTv7broKDGcYRpEOQlqvLtqYkj/X0Q43Wylg5gCIWjeOQpENPVe+ZTC4l8A1q1F5Ux9wwFtyspqJ7DNEow0dMHGsJwKJ0IF59RY6V8gffZ3IKIhafyT6v2iIbr7NEcwX3pKJrVLKlOV6IdPTp31Jl6tCFy/yHRjfO/Y3IrWiV7THZkchxZz6LLPtVqwb6m2WTnmvZrgaGQ8O/pig/eDL2WYX+tQ/sfyS/dwYAq1Z1/Lkhpmvr83mgu/W
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 06:16:08.5881
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77067ecf-8fde-472e-a493-08dc425be863
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6200
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

Enable Yosemite 4 adc15 config

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index dac58d3ea63c..6846aab893ad 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -51,7 +51,7 @@ iio-hwmon {
 		compatible = "iio-hwmon";
 		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
 				<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
-				<&adc1 0>, <&adc1 1>;
+				<&adc1 0>, <&adc1 1>, <&adc1 7>;
 	};
 };
 
@@ -920,10 +920,10 @@ &pinctrl_adc4_default &pinctrl_adc5_default
 &adc1 {
 	ref_voltage = <2500>;
 	status = "okay";
-	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default>;
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
+	    &pinctrl_adc15_default>;
 };
 
-
 &ehci0 {
 	status = "okay";
 };
-- 
2.25.1

