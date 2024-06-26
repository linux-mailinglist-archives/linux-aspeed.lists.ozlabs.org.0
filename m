Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2102917BC8
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 11:08:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=reTlWB5k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8G8M2D41z3cT1
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 19:08:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=reTlWB5k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8G8G0FqRz3cRY
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 19:08:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnrAATVs/xw+UYH/RAkUpaeDuES0ex3U7dsPvy8TwBYfjO+0ONHGyyn8eknZ+o7RZa+/KwnC1jHrwfLw9SE78KrO3zRPgEllppNf/RcZ0tt9pzwGKTqBawp5ZHIbSWJTZXQoT19zA2FMKWoQ6HTCMxGfDbs+8cIOFRLx8IX869oFzCc4oAgDhsBinIpBDAwF/XNXzO5CmMUXwErgSvOr8MDUmkmqo6EWS/fpmaQh3N/YDFksH+OAb18lltFNrTJQGkShGVe+HvxmM4uVihWLwLOu2TfftHwrUnU5UGrp4c1klnqp273+lCBT+DoM4Unu7iblfgm4sP3FN+azY+LIWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsZr14PNPmBXIPZ1202IghyP5Yyu1YMx3BAbXzof8TE=;
 b=Y6FNsChQCc5WcCycC04NbmiKh06d4yo9420SoqAx/QiR4gvfhtUZUSSlf2qDADHmyNqxb0U+yAVgnS/7etiDyGBZ1r1gL6v9h/ct9zyDQaSbQZNQMkPVmts16m503aWSxZvP4YRqeKekD74T3ZQHV5cCeb72BIkGDYZ0IP2WCjhV0UDzqPm3XEWWeBFu1l4GK5bbpYTiJ1Q6oSawk1n3Nst1QIlzPHiAwoakhE+H4yPUssYIROLDrSn7yVkbKI+fYIsmBrFrc0DAoWt2jct9QVdJGwysh1NbrOcEUzJJkvF5snwV6uQeRQrQwZShj1VH3mO388mxkwC+WAlDzTBq4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsZr14PNPmBXIPZ1202IghyP5Yyu1YMx3BAbXzof8TE=;
 b=reTlWB5kL1L//9jm4BavYUuOCzPwzvLEC/EbhcShMh9u9dWsTRb6h8sXios7p7gBNyfAP5+jcugVObG5E8rH/1BNEw8PTGEAktG8GF1K4ZKWZUhzzYkKFC8X2tqhzoEvHGrTfVzDtB/DmvgDnaLUY5TfhsMPoVfu4sG0gv7LWVDM6hHQvzlu4VWBgFsVJLmirepLaX96qIaCt0o6lCWqulwHVXf575h4uN53Qyksc/0PACnPr1X69U5uqqs6rCCkf7slO45gIoV2UzZx66KNu4K7EZYJFP2H/2ThHOFXxSMJZl62THo1DDQo44SlobbeITGUmkrVCHleBW6U3ruluw==
Received: from KL1PR02CA0005.apcprd02.prod.outlook.com (2603:1096:820:c::10)
 by SEYPR04MB6893.apcprd04.prod.outlook.com (2603:1096:101:da::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22; Wed, 26 Jun
 2024 09:08:08 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:820:c:cafe::84) by KL1PR02CA0005.outlook.office365.com
 (2603:1096:820:c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Wed, 26 Jun 2024 09:08:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7677.15 via Frontend Transport; Wed, 26 Jun 2024 09:08:07
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v9 02/26] ARM: dts: aspeed: yosemite4: Enable adc15
Date: Wed, 26 Jun 2024 17:07:18 +0800
Message-Id: <20240626090744.174351-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|SEYPR04MB6893:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9906d297-d94e-4c8e-a081-08dc95bf7ebf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230038|1800799022|82310400024|36860700011|7416012|376012;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?y7huoOKRjfO6VUpjNrwJHkGj9bQlBUc2FMvD8hPchk+6r56M0jKUA6mG/hi9?=
 =?us-ascii?Q?TMaPwFs9l0RY/F4t4TKxQZwsx7WjQLOfx0JJ+JyN49yW1pL4/5FtyLmHq7Oj?=
 =?us-ascii?Q?rlfmylCOqPw3XXswGVMk6k5BnWwZPeBiB+FvPxNgqbWKEfqoRpgZRurUXjbb?=
 =?us-ascii?Q?lNYoV9BmUMqi3EWNsjvvlRoiPgyR5BLvlGK+8dRD0b4t6gUezwyNREG3aCd7?=
 =?us-ascii?Q?Rqh3DEFwH7fRfUt+e7FxzSdBxq9FYM29lnPvzcjJyepoK92uwo/pjAF/tHIi?=
 =?us-ascii?Q?t6XvAF89rkM65GhWSXQ3hkV/Bh73ecjr42HuYgUTpEe69ZV2YBDWpkbO5iTO?=
 =?us-ascii?Q?228Zk6jLlLAogCwB5o412ayiwrhLpXAfeV2XH2NH7oaq0qSC3vRW3dqt6Br7?=
 =?us-ascii?Q?j/2exxSyfHM2l6DPO73H/8l385xiPwgWad56jUwxcScpA2srJS5iiaNl98WD?=
 =?us-ascii?Q?kYYWTHXYpgCV1gETjlE86LLzzM5PcxCzheQAvbxm8EkQUCoIU4zEXxV8NU/H?=
 =?us-ascii?Q?OENwxL716FDTX7loA0m9L9pSbm5Ujz4bPzbUY/1IF5v1hD8AweipVHtAO+Se?=
 =?us-ascii?Q?D4QWPdbeAfiWSe++4yKprX5UZEGQ7ILVZ3+Cb/bXxQIvK5k1irMAQKDdRZZy?=
 =?us-ascii?Q?FqCYkk9OQWNeBwokJZs8WIHJq/HBQHAbBM15l5MXh/+qLyiM9Rj7DtW/PQ68?=
 =?us-ascii?Q?UzEqw851TVG9hZIHbYBrPSKDU9rzGAryeUs85W8zmBy+z7weEmQEdKkUyi+f?=
 =?us-ascii?Q?7WEN3th9rYIY0AtyxlR8vk7mkRJ6er9dmgj5kry/KksrX04L+qrRVrl/tI8m?=
 =?us-ascii?Q?5SbfmqPVNvbfUUiWlbhTH+mgD32oy9hAzptXKVLS2HZS/PKuAQ8V7CUFdQ1y?=
 =?us-ascii?Q?JbZd116QwbnZwQFal4PujU6IMkKNZHxXL+ZN12eV6xMmKMCWNb3n0ABizcAl?=
 =?us-ascii?Q?EmD/aoRJDd3KsVAc6Kp25O/6qtTGyoDfbYHXZh4x6V7YE/3Xj0bQNy8cK4oZ?=
 =?us-ascii?Q?qQQmjr9sPOu+utwrCyoQeguJEQhrnksitu1w6RBCOAPDKCBCGGLDMWRwEsd9?=
 =?us-ascii?Q?kfRFdn7zvTe985a5Jb7vQ3wXRdTQB30bJfIvTYIgwSVNuhzSqBytgMRHVL3s?=
 =?us-ascii?Q?xqRHHZf4DYt8O3jwpnXsrB9WVkGrfuJoHq3H0AaLB2bBCLQTTyhtQmUcEw1s?=
 =?us-ascii?Q?n5ffgRn+8B3YwiaEqW4V8ioRAZx4loCjpOWn53eqL/8znzUIQlpVjkwMQrpX?=
 =?us-ascii?Q?FPQHeUydsQP1gzGnvHRiubZumPjxNW5OGctl0XgX3+Qm3K/SL67y9Lx+j6IO?=
 =?us-ascii?Q?ckfzQtGXDnSbIkyWp1svBHTO89bBaqYGYSf01lVeNhh8y5fFq9JpSxPey0kF?=
 =?us-ascii?Q?86FsvmWECUEAwradnrQILf0gAshy+uCJig1yQu0QoWK/fA6POg9z3EXIovmf?=
 =?us-ascii?Q?FPJdGpg0ZAY=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230038)(1800799022)(82310400024)(36860700011)(7416012)(376012);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:08:07.5360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9906d297-d94e-4c8e-a081-08dc95bf7ebf
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB6893
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

