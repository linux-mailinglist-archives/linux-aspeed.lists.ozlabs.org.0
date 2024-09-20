Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE4C97D239
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Sep 2024 10:02:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X94ct2v6Hz2yVb
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Sep 2024 18:02:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::608" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726819372;
	cv=pass; b=WG/+xtaiRAZdkXJ+AOo4NM3OiaDEszZmWcoegrirFgtin7u+zBhSIYLFj5/Wa0eFqR8mIrht77rEuxsQH0BCqsW9PuBkzw2yX2bqNaZltpBts3OR8eMycEQB/bxqMcrGPa8gyRtUA6c8PbYxUNvZxLrhRGl+Nz+qA6DwDhhEA5CA33BeHusrMImOFT5n3w506YBVaZ4u/LgHTAqwFVAX5do43KA/+YjNWU3WeDxfIe2CS9WzqzN6pkTJQdeBy8AIKbkyOWL1w7EqJCxXRGg9og4+eBHocRH4BL5zhvvgWdKsSXxVRAkbe+6Gx1tT1O4o1gcA8SilDSr0g3ODGRlqaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726819372; c=relaxed/relaxed;
	bh=YCjI4Z4PhO+v3yk3B6XlKuJlSm6m/P2L9KbKt/2/bxE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=G/YO//jAwwXvPAbMt3HWEW8kliaDcBMSctCGkBBwzsSP4lQ7mHidols2tQgROrk8BcI/rYi5xs1taFy1WoUwI4F6FGWGdvWWYPEaHWiLefVOwwQTjcPhsTZMz9CKZuw/rH2o6glUhUlty2/oqaO7Rcl6ZPTv18RBUC9kbEZFLGNvcxgIZPfh2LM3alntC1LrtJ16kq+UVdZR2SJ52eTTdP975HAff7MhHiU8+nFsTBkuV799LjPbQUOnF3HHaKzd4FjtpN0P71RCWnJcmvd3tOJPewxvX2lcpzVg4/iZ43NdbWoB61D09nPXgj2VLtmesoTaYEVorom2OVg6ilD9Tg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=tGZc51sA; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::608; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=tGZc51sA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::608; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20608.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::608])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X94cr2Z5cz2xnM
	for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Sep 2024 18:02:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IEBTCIN9L09y12JqtJHDKBi30Bvt5NA3XZxvw1diqgLzIhtCWU3R85XhVMzskSQkXmsFz1aXSXE/V3s9Gy2mfGiBsIBxwKELvvuwRM/OqWsidDAm8H4vfFgiqpkADDfJLQYDDuhszSAOQCDzh+VPtXkEyeZqnnZd+q0Z2oIMH/N6j8ijewBAMqCD/Iexgtb/vRy5BCIy7XC2DpbhlHKBGcjGWyW2D4vYGHhXN8UB7b3Iou4N+nBTcJPZNdvuOSJZaA6i2MtkDzqAkErzINc4NNLycts7CNGu0cqBmXdSzk37B0aQwe+rctwklfJt08GcEkMv/bXo3dhXMSY/TWCShg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCjI4Z4PhO+v3yk3B6XlKuJlSm6m/P2L9KbKt/2/bxE=;
 b=v02EoFHeOtepwAwilYsWG1gBX6NA7+z02VRVnReMAXhmXhdaBXGYUo7GoaVNFKcVymFn2jtVYHm0/dYQxy34DG4JkszNDY9gVFhakdzSN033zs1piTJPpt86ocL8Bb9x9P6kVd3O6P1djKfEDkkYhM2gvonWRZ98f5pNKHaMJDLdYTUjl4Yi5epASwkxhuxQpcuulHcOyYEgzBm0pZuHbzGy0VpwiHrJCCwQ7KGq4LGXrazp/8sGpIBvvcr4OxizwLo792PF1sud+LU8V7DPiOQlVSkcOSqFWjgPymnI5tzGpQsVVh3t7FvndzpY7qMbXsNrsUBR6hZc/IVgRYZj4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCjI4Z4PhO+v3yk3B6XlKuJlSm6m/P2L9KbKt/2/bxE=;
 b=tGZc51sAnu02UAzkFWrWhew7afcUGbZTzHcn5vDOHalH4HzDMsqsNI0Uv0SFt+sA5BV/9eTFmN+tlIFkdBhayCvNArPJzseffo/YpO8ghZfiMHcUQixzKiWFP2UtX0Rc6f258EsczY5Ghmo5GIU9Wy7EX4TE695nOFEYj5QDwaJliDFDWYUXidCgvq2jBQYYLHmWUAJnMP/coXSVz9xXgTcqgQGk7YkD1uP+8GAPta+quxuG6iD9RSwWFf4xQVSgnCY5ApLNNvEd4ncxZei99wdcHvgNagPZuuGEj+arEIZosYl3FP0zPM6Lix31XFKUF6Zw480jcWHquflf7hwFAw==
Received: from SI1PR02CA0017.apcprd02.prod.outlook.com (2603:1096:4:1f4::10)
 by TYSPR04MB7275.apcprd04.prod.outlook.com (2603:1096:400:471::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Fri, 20 Sep
 2024 08:02:29 +0000
Received: from HK3PEPF0000021A.apcprd03.prod.outlook.com
 (2603:1096:4:1f4:cafe::11) by SI1PR02CA0017.outlook.office365.com
 (2603:1096:4:1f4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.29 via Frontend
 Transport; Fri, 20 Sep 2024 08:02:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021A.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 20 Sep 2024 08:02:28
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v2] ARM: dts: aspeed: yosemite4: Enable spi-gpio setting for TPM
Date: Fri, 20 Sep 2024 16:02:26 +0800
Message-Id: <20240920080227.711691-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021A:EE_|TYSPR04MB7275:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fdeeac0d-6cd3-4ab3-2591-08dcd94a9284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|82310400026|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?jW94vp0s6WfkdB0u1KNql1Up78u6DDtPfNmyad8mt+p/0RsmctZxHUqphDsM?=
 =?us-ascii?Q?9bvvFB0LBJpsoG0S7DO3c8KbO882p/bcUXaTyfSJ9Dh18asgIAiOOTC8jZLA?=
 =?us-ascii?Q?JX5XjJ+25rpEIPgt7+C+HBwJr4Jr44eCgXcLPZ3jWj9oIFmRVIZO79qokiyN?=
 =?us-ascii?Q?BgFWW7EbYDLrNS0xHPdwWslNqPD/no+LuDIqxzyQtzV9jesU8JLcEZKyZCI4?=
 =?us-ascii?Q?qa/3oQXfvSFi/Dqj6anw+2XAeWlNPzuK8nxunyMST/WQjjTdcl9v4baM7O54?=
 =?us-ascii?Q?WJ6irLJ5cUcr6RqsNzyT881rHroRZHmrG2XnqEZiY4u7hFopS/IMC15EEOsL?=
 =?us-ascii?Q?Hen3CK5rtNnx4mgdc5gAfE1whbfmtOl0zAiwD2H8NsBTSU/CsIO8JRAgHxgp?=
 =?us-ascii?Q?JCWwmHtnAdogwqxB+Al2kSR1G5GIdTHw9vpanG+44GQxt3gnfdjPgMZ3dLhD?=
 =?us-ascii?Q?Gs4abgD2BU+9h14v5/lMxKb/2hSe5EMiKt4EJYfSprgvTjKLVKD9nKTcdEkt?=
 =?us-ascii?Q?rUX5IS4N9akBWmcvryzpBUhaDDbIMkg0lMBXeeudzyJs3HecpuvRJiNXmBUn?=
 =?us-ascii?Q?mXgT3PlDOuARz8iLu+vYLHd/AZdyqjqjpwGGh9rPqYihHA20kFvO7nitJfr+?=
 =?us-ascii?Q?mROwjA4hG2MV1IpcbifRympZTZd4UVbgJBk7EeyVP7GuJgISweL3wfpQ47BK?=
 =?us-ascii?Q?p7UIVPJmyiPD92S9+ghNpnoSl4/YNbnsbU8JPEKeIAZRDkr+v0eq+fznBVBC?=
 =?us-ascii?Q?zVmKi8JJQzdhabGxO+wqGMq/FuX194goRtzDytGYgFkaIwpVgjxBrknlZpO2?=
 =?us-ascii?Q?yrTVg0v2H30+mJJ7Y+wNlaXB07cqIVUo9MByFF9nWMKZpllTUMa3KDDJAT8+?=
 =?us-ascii?Q?4nhUYSFRdxqvV+y8wPU0DuV7F8+FgY8Ej0MzjPvujaYXOD2QJSAxeVfZL9ET?=
 =?us-ascii?Q?NkF2j1yZZJik/AFb4q5AhHR00e0rnME6wxaDfYqCgTlMtH+8aJwMMzTcAf95?=
 =?us-ascii?Q?yzGDpjNNsXVESLMr7N9bNt/T6FFXdEBZXVIvzNk/crYwCSzxNXsBfhZzPeqT?=
 =?us-ascii?Q?vRMDf5y8WHNkVJl9hc/MIiq+gawuNCD6rdyOl+X7hO4NR+YQHKf841NO4px4?=
 =?us-ascii?Q?W100u4gt0EkyjtjJtXFjM0xCGzpELV5bd5amyIH9RhFiaIodke3yy9dkYay2?=
 =?us-ascii?Q?NFKgmpHSXyUnc2q5HQ2NINP/FOQmcBt5b1tUIMQoE+Vuczp7kRlDTV7Mzd9B?=
 =?us-ascii?Q?DxU2gAXVD7Z/lE6Am8XwfW7oSAd2YqmvtXhj5KRfm/Q2AofcvOj9GBKgGL1S?=
 =?us-ascii?Q?4uDmDji3ZyKaQi4Kcoj7j1V/WcuRFUM/Lni11u666RwFWn658+++4iIfxGuD?=
 =?us-ascii?Q?ER7SJcw=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 08:02:28.6365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdeeac0d-6cd3-4ab3-2591-08dcd94a9284
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7275
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

Enable spi-gpio setting for TPM device in yosemite4.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 98477792aa00..869aa8b3f411 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -34,6 +34,24 @@ iio-hwmon {
 				<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
 				<&adc1 0>, <&adc1 1>;
 	};
+
+	spi {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sck-gpios = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
+		num-chipselects = <1>;
+
+		tpm@0 {
+			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+			reg = <0>;
+			spi-max-frequency = <33000000>;
+		};
+	};
 };
 
 &uart1 {
-- 
2.25.1

