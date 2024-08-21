Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E83959737
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 11:42:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WphF2743Fz2yVG
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 19:41:58 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::60d" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=EtwalTLT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::60d; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WphF03wzkz2xjh
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2024 19:41:56 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmnqvC0Jqx6tqceXN6nTmn2XYf6y/3h8gjlWLyVsOk64fafWiG/OAGJbSROOPId0Pe3TYWc51wGoiVcClfhrhJ98w2VCAh6zosDRruXQIgu9PwBIIIUoQ4YwY+2Cbdh8KL/83TaSGlFEggOO4q+Jou3BStwDJG/lIIZE72qpxbEAoU7XSFkYcyxBFdAJW9S4wzFA+fJbfWDTCjvnZc+EkLrB1RzNI4udELmOgThkwMrmCzEAHHz2pxzT1/Q5/sLqgLxkLBwTR6BILuVCh61/wN8BOK61TKjv3vrqCeYp7h6sdN+BN8OyOAG7/YiVmuV1PuYjmq8P+jOSxhQmy0+9Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmHAwAuLtww6S7Kx24cCQt5tMxYWDkSMHxAXTvM1SXo=;
 b=W2Kw00DxJuXkMWZ7Os7LTxgsi/hT25438urbtEboELiOZ8O1QrAnSnmxh1tNHprBm13WicKu9Jj9m2DFyjCmDZeuzgJdZlZfWsnhFEWpQDy2pijaTJHqWWIqP88dC/1FBSIQfO9cFlgjR9GyJGgL8sl/p/zbHVF6AYmt/ayc3FKssDU6HdlLloZloo4SYbaVLiK5y3Zc1cfdb2NNqL3bClEJ0PQtPze80q9f/Pfh6gEIpCVxC8KcyiaWGwaBWz1bqvn59tgvN+tjwC31PJNr/gp4ZgpDXVBoQ4v+UoaB+dIaGRX8E4COorEnJC2r6x9foZp5U4vEOnyMLGC5g8mGNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmHAwAuLtww6S7Kx24cCQt5tMxYWDkSMHxAXTvM1SXo=;
 b=EtwalTLTzPSDuIUCAgs0Yh3FhYiI2OhET/aRnBPPC1I956+3y8h/GbMwsNW6NJyOhVTuigGeCMxcYd3ugiiSTbjtuq7TgsCSENfLEqzMhu5qN0duEYe3JBTVDDFuFIZWyWPKn/UXt8jKQ/JDPW9NU1hI11QjnkOkPcCp8XbdCN1l32AHrzoF2P+BHPV0GDxcKeZbeMqAy7253wHVaV6Iue35MnSAa6cZTHZH9Y/nyE7hj20Rxrc/1nT3+imWYvD/1sMLvTmZp+7qLDhdIN4ZM68xRJTe29vn3gMp7zEz/VSJLzOQsRlb62P6P6AbP6TNrPsINn1yjfv14q/sgQVgbw==
Received: from SI2PR02CA0031.apcprd02.prod.outlook.com (2603:1096:4:195::16)
 by TYZPR04MB7507.apcprd04.prod.outlook.com (2603:1096:405:43::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Wed, 21 Aug
 2024 09:41:34 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:195:cafe::9e) by SI2PR02CA0031.outlook.office365.com
 (2603:1096:4:195::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18 via Frontend
 Transport; Wed, 21 Aug 2024 09:41:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024
 09:41:33 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v13 03/29] ARM: dts: aspeed: yosemite4: Enable spi-gpio setting
Date: Wed, 21 Aug 2024 17:40:14 +0800
Message-Id: <20240821094043.4126132-4-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|TYZPR04MB7507:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 82489bd6-8af1-483e-58e6-08dcc1c571bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?6c4mxe+Q+wRPFy1D68JVuIbkigXXnHq67R3jX9mMmfLH2rZ5V135PdCOVOHL?=
 =?us-ascii?Q?yQQEpznp3P0NLgZkf6hAwyf4CX9v/grhiihz3YWYx9deEn+N4/U3lnPV2Bqv?=
 =?us-ascii?Q?QcdAUQkhAW1xwCr7xZvpD1E2DmVQgnzzrCJZkj7Cxi0G4Y3vMZDJKgpeiHZH?=
 =?us-ascii?Q?9XDssbqk2CMyq4OoYMvKP0eZ6xJu6bFCijha0v04CgYmaZyaMsJNHmcjf2r0?=
 =?us-ascii?Q?8fxbB63lPyYorWy2iU2UHYTGm5Ugs10ZGbPNzTaYSqF0UbzP1CQkuGxMDm2O?=
 =?us-ascii?Q?y0fFf2BdnD2pv7vSz9zv+vG3VjTcTMiFaSv/FPGmVk/U4KdKntJts9ZOpRQ/?=
 =?us-ascii?Q?8JishfTA/KS05fip3JLUYvap/XiZV4swIqSU86y8kFrNj0L84Rqgiifv7iUx?=
 =?us-ascii?Q?7ELUlm/6pmOuITBawZa1q/cglbq+uIbtlak4ix3t3DyL0A0Jd6+DV2AtkoS+?=
 =?us-ascii?Q?gjkIXiwLV6oABg8F6KKpzXHKKPvUnRq3yP6Qu7icl/k7U1XRfocDK26xsr/w?=
 =?us-ascii?Q?F/k1Allx3JeqLXEn1fQVeAVVZK6RfRDeotSovLKixzfV4AKL93RldQXCZMCL?=
 =?us-ascii?Q?6CB4eqYcRVe/S7uGjrqXX8V2U2jqRwHxqCXZJ59zjSNYb4AMfLfBEcR794gt?=
 =?us-ascii?Q?Hsi5lMSdwbBfSc0BP/8CnlFuZpIzuThJrnv9ptGuQ33S/gYmVeyEqZTh6+6A?=
 =?us-ascii?Q?syOrvQHk9iydvhpAELAORypGQx8RKKFbez1v+/C6kimVShZ+fV17sTyNoxG2?=
 =?us-ascii?Q?WFbDor05gDDJO7Hwa7Ylc0Gw+v25wZ0vIs3Hywa0+f3Wxo083IrjobZLYpA/?=
 =?us-ascii?Q?O859vJrSZHs3ENXb1ZaZ9NzYolJblL0ydlrgEirty76AVfSqIKizsZEOxGSz?=
 =?us-ascii?Q?oIvpskkEKOkoaT2ZNmnreARnp0lxDHG5bHdxzyfQ+gI54xertJf05PHKwMwk?=
 =?us-ascii?Q?A/DvIcwN9H+CjagaUpLN8YyEFJWkq8iwUdeQR1ooqRS0QY982oRXEVVf/Bj3?=
 =?us-ascii?Q?qlnyBJkyWEe8MsaZ6fpeHJlDy+eApeHXx50ucEzTcRvpxis5bQZSMrGWvLnl?=
 =?us-ascii?Q?hJpFABcNbgkBGn7gQXbUZDbABQ2mFr295W3dPP6q7jXJn9RceDF3hdLIVe7j?=
 =?us-ascii?Q?XhFkFk5fkZQOZCSQLfsRMnMZNqgbKRqjrEyF2iNDr47pWX7RIeiJqea+1laS?=
 =?us-ascii?Q?8NRtnYlyeZ4zbWLfkGmynWVD9T4oWNmOnXcTDiQQW7M2K4bs6l92jHJvlJah?=
 =?us-ascii?Q?EQRRgLq6rbwoSqB7NDSGn2IbPF6mC0DDbEYS4kgYbTAVG7LHjAkfydGnwkPE?=
 =?us-ascii?Q?AUztIEnre+t9F1Jda7wEgHcvzDJ5tXWMiykVFUmNx2ohvwYtsHoNc8itl4kN?=
 =?us-ascii?Q?vc2Pe4CquAyiqkG0TCGonAKKnTuG8m2WwMOjlmIHBqCBKluZnivSDYXCHBUS?=
 =?us-ascii?Q?7EQ5FX/J0V1RmMfdZylaEuTaoYBDaAqc?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:41:33.4339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82489bd6-8af1-483e-58e6-08dcc1c571bb
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7507
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

enable spi-gpio setting for spi flash

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 0d659ee2bc19..575abdd530df 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -53,6 +53,24 @@ iio-hwmon {
 				<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
 				<&adc1 0>, <&adc1 1>, <&adc1 7>;
 	};
+
+	spi_gpio: spi-gpio {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-sck = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
+		gpio-mosi = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
+		gpio-miso = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
+
+		tpmdev@0 {
+			compatible = "tcg,tpm_tis-spi";
+			spi-max-frequency = <33000000>;
+			reg = <0>;
+		};
+	};
 };
 
 &uart1 {
-- 
2.25.1

