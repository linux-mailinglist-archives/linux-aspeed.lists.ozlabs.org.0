Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3E98CCF2E
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 11:26:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=bX4Pl8nr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlN001Tbrz3vcn
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 19:18:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=bX4Pl8nr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::625; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20625.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlMzr52ylz3vYH
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 May 2024 19:18:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjVuOKPGrh7s6VZgmN29IxLtt+E1NSQZ+90FCO78gkrcB3oc5NQuvGMZ/XJJaxXdzNDvvO9uJH8nERH3lqIhb6LaHlRvJ/u/jnbKAigAFxN/3AghLxoebOZ1TLM0vB39svgrtMpqgiSsKHfoa7fxYQZiyfhRht980574KubE5DUJnlN263jovwPUnIKZxjW6urzXqWbSoVUxmhWQLXWKMRT5AKEwODfcLjoRhqWyKvRFkm/w1cJ3EBixuoJwMJ8kXZQ/We62cEp8j0OB+R+Q8c/bd+IJVqfLb+X0gCtD0Hviis7UghkZkAkd19v9UUhO3ofwHAx5vV5fYIVFoSOSTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsZr14PNPmBXIPZ1202IghyP5Yyu1YMx3BAbXzof8TE=;
 b=aArcK89M6InGEJrAw+DPPZJDp5YUAXl6rCwd0ub10g630T/dLPVqTTDvUpFssklnPsrrYKcBvnaF0rFbzP7H+TvCngcHq/uLVbClfKHcON8dxrgr9SeCf+XrM7XJDy6qmAp5a7OKrc6m/deOvHBSq2Jpx5abOKMBq7w11ez2DSqoC5ngPeGhb2zNQ8LgFzga1odQJdz6U2uMA1A7NJl6kCUUXDajE+yeu4UECUeheH3I8WyYr7BqxuM1d8KDPRQERKZD4jd7564ug1wcyT7rHqTXppoN/R501S6cSVhVgkiGqv9Yz4+SSuUYtUOK6yvza1mJKcpcKPCKxW+9TZteMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsZr14PNPmBXIPZ1202IghyP5Yyu1YMx3BAbXzof8TE=;
 b=bX4Pl8nrdVy4X4hTv4w0cpLyV9USb/eh8RFQRuH/fmDo95+4KH32cj859QFfSi8c+KgrjXjRo1+ukCNYMjayN0ujN3YPwoL7477Gv/oCOJWA4CcxZVh2zyj/u1il8qaFZWXPEFtuSDVxewr+ogScN8McbdILor16ZKrjJ2yegQlckhWn6xe+YYpp+i6JqX5jIuBxo/GrwGWUO20YToqtm8x/iirWIGgx3zzsdeI8QVy+kuATXzyDUJH5DKAbX6hwFvzh5sscfDCkR9NcZOv5XntdTzyrPPMkR34R+Qji0uta2YzUKJGOUAqdkkRoFrVE/cPMuHfhulfoWSIZHLszsQ==
Received: from PS2PR03CA0020.apcprd03.prod.outlook.com (2603:1096:300:5b::32)
 by TYZPR04MB5680.apcprd04.prod.outlook.com (2603:1096:400:1c7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Thu, 23 May
 2024 09:18:23 +0000
Received: from HK3PEPF0000021E.apcprd03.prod.outlook.com
 (2603:1096:300:5b:cafe::69) by PS2PR03CA0020.outlook.office365.com
 (2603:1096:300:5b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.9 via Frontend
 Transport; Thu, 23 May 2024 09:18:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021E.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server id 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024 09:18:22
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v8 02/23] ARM: dts: aspeed: yosemite4: Enable adc15
Date: Thu, 23 May 2024 17:17:49 +0800
Message-Id: <20240523091812.2032933-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523091812.2032933-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240523091812.2032933-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021E:EE_|TYZPR04MB5680:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 81f66b82-37e6-45d2-3ba3-08dc7b094b77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|376005|36860700004|7416005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?FO0MNGT9esrzLlsS0JFtJiXr1BktaC9c6QEv/fWZm+20rL2C2H78yjV6TlJE?=
 =?us-ascii?Q?/F/e32fm1/lk+JNllahq70hz+QOWvMEwBuMEJMZzROm/3SDDaDvMb1qmoZul?=
 =?us-ascii?Q?kJl6pYcxBmXWE6Bu9b/+wKGOLmv0CKd2jVeqQsoN0OPRh1uGmyU++nT0bCRe?=
 =?us-ascii?Q?X1ZHVa1SLVPPfVddjjvOw/PRm2fDADWhTyeQNQe3rfcpgJ87ozZ2egKCf/2B?=
 =?us-ascii?Q?aM5/Iv/BWqJP2vEQyzymfksCe9GdEQufTqy0CkHQo9Y4KssWc5HI1QdAEXXB?=
 =?us-ascii?Q?q/P32YNJH3J2lFt5F8OTy98BhopSlzRTl6TKzLK3nQvvAq7Bp960WqfqNKo4?=
 =?us-ascii?Q?7Kp+uIJnR8EWFQBcHT6gBg04UUfA3rR0ZOv4kBMb5pjyoNqNMdEH9co0HSGE?=
 =?us-ascii?Q?i5GDW5fIQNtlbuOx9I7tYpPMhAQD1wtzx8X919MR4Fi5aaix0PxakNKqbSS9?=
 =?us-ascii?Q?ZGbnDbBSzi3Tpwa2MGRQg0t46PuirF4xHsVCZZqI1+6oKAdBnQh3D0b/80eY?=
 =?us-ascii?Q?KNHhkYS3YxPB3vgy71NhjuTPyO4sdU8BjUelZ+2lbIFptkyeql53X7kP0rNl?=
 =?us-ascii?Q?mFLGx67Ul4RTQu76896boDOX16ZwgrRsG0WDOiiDQ19SeP7rf6tQZS53fhE1?=
 =?us-ascii?Q?87zTWK1UctRslicz6U+VnDSzya7AY0VKrAv36VjEKJPNZ8Elal2qS98RxolP?=
 =?us-ascii?Q?VWsph3nl+a/9vLlE7rPoF5uc/bmZRNemSBRH+x9xxAgBgOYBn1lU4sdKOUrk?=
 =?us-ascii?Q?SeXsC9gCy9UNGNuXJqR6AOWhfbNe0ZlEr1JZJgP3BqwGIOXtr2ni3oQHDa8c?=
 =?us-ascii?Q?m9BaTl1luWleIIYU8Sew6BV6WdTf9yQXcMV1Zcc0QjM/Ug+nO8k3Y6kZUa0Z?=
 =?us-ascii?Q?2aExpXCtJpu3HOe6XP7U+cGps9lsjzYpiwCiOeIc9NnHub1q0RONecwiGe7C?=
 =?us-ascii?Q?pWrNIQCE6hO6c5gcnrX7XUM6C+0qHONiEWpt+3hZY3uxC8UPcZ/Q+2FhqgZy?=
 =?us-ascii?Q?y4wxQ/9q9uszYnQiLLlxrGkrxMCOtuxNXdMC6DvCFHbPNhgOETigkO7kQwJC?=
 =?us-ascii?Q?yOG8r0dR7Ctfjvvb6zTeZv9xxYeJQjD1RDW8fgmhfJJNFFCpbUAjx2Hfbzao?=
 =?us-ascii?Q?decmaSRe+bGgWFxNq0Bc0FGGBP8V4uZ+zrFq8lf6EJmiB+mmM89rOmfbWekK?=
 =?us-ascii?Q?kz+4TD5d4CQEGWzrBk82hIolg8StxYusMSg3mcvoN1hekf7mw1OmldFozD2J?=
 =?us-ascii?Q?cAQU7X69ikRP8OhMUCs31JMwGn3mYUt0IKwrup+Qh7xt6yD4Sg5ph8UtLOh1?=
 =?us-ascii?Q?k5LBT7SjJALnIUToMNTnGRr4nFrUw/kgojaH2KwQuAxLz4xOivwwQw+cbo3U?=
 =?us-ascii?Q?5m5eUJs=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(376005)(36860700004)(7416005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 09:18:22.8138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f66b82-37e6-45d2-3ba3-08dc7b094b77
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021E.apcprd03.prod.outlook.com
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

Enable Yosemite 4 adc15 config

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 66855efa0b4b..dd88be47d1c8 100644
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
 
@@ -925,10 +925,10 @@ &pinctrl_adc4_default &pinctrl_adc5_default
 
 &adc1 {
 	status = "okay";
-	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default>;
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default>
+			&pinctrl_adc15_default>;
 };
 
-
 &ehci0 {
 	status = "okay";
 };
-- 
2.25.1

