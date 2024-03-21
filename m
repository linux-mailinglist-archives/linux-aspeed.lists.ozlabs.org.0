Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCC6881AE7
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 03:13:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=qDz0kZWO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0TX43TBmz3dVS
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 13:13:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=qDz0kZWO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::600; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0TWn5R5pz3cy4
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Mar 2024 13:13:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRetyafCICwHsJvt1vrJEnxNEEWTSc/+PcZxgQIG1sLp+2hNOlXY4zagXzDxAUhsElDP+kgKOvFwIbXVVre/zdTObUurv+GL1pErUgGosckEpj0UT3uSdS1a3KOA32gqb9/CGKTfZMFOXhPi/WEGH6XBPCWYaiX1/HS/tuj+SW3wHH0j6KK8ncYd1azZJsyPOEsPJeW8sDFo/IdWA2vyPf5prqW6X+vV1ozEXZYrPaq+lFjt22/yzf9AUgO8+UQIi1KlOWytJGPBrnBGaM06WUSGfpDWZyIJ0p3rj6pq++n19UdXi4M/LZMc8dzLtOrfshd7e/wI7H5p6Q2PIpShNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXS/IBxr+oV5K2cp3jW9e7qRwk8DHsYfz2fJN3Mk/J8=;
 b=QvmRsCHOX9JGb5FpWk4cMXEP14UWo5+1wuwBjpqfFkTkmndxD86LvTeQXdPAlCAR3tLqQ5/WK/VhL1TJAZh/dBYW5RvneW5ZPqWeG+tqLFUwbv/tDQV8ognKPJnsWcV2N6WdAETGJWQDg9U7ogjVHcrVUL93jNzqwdEl/39c1zatlO3qyiLLNhUFD8cwA13MGlAOx2ACgL0NCvf15JU1PVlY/FMjsF+fd2RJc/SOvQHchby2atxoF15NP2nMX9nZkJJE7m88VmhGaohAekz4xQdL/X9G30bOsn7TOdwnABV6UEMvocpMmRZIvanspmIbInZBg+Vvm5elmpvLsZQgjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXS/IBxr+oV5K2cp3jW9e7qRwk8DHsYfz2fJN3Mk/J8=;
 b=qDz0kZWOLUUvmD9tz8fJS4MjyuTlprYVU/kX8V+Kd+lJhyckn/r2CxxbwjWdU645N4ZO4end3eNFlJLioz7l4+3P/uWCXgLcPUdMJ+JeX8Y67PGe+j/p5UCanTvzwIh8oDGod94Dy7heYminUydvVVcUcphJHztzKOBUXF2yduGl+JqhpqaiGGS7x8XGYQazCAA7n4nVCy378eSmYA+TfxPEiRk3EjjmipMwKm48ABlqbx63ol+I+/7mNPTWAuJjL/Q+o1n1dnQlco2fVt/jFBpY41Y9qYeATTTLk6SDCeb+w2GnzBKjaSZ9MNanfUY4QAFPs4ovhjtJKJRwKGMXng==
Received: from PU1PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::34) by TYZPR04MB8229.apcprd04.prod.outlook.com
 (2603:1096:405:bb::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Thu, 21 Mar
 2024 02:12:50 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:803:15:cafe::a4) by PU1PR01CA0022.outlook.office365.com
 (2603:1096:803:15::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Thu, 21 Mar 2024 02:12:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server id 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 02:12:50
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v7 03/22] ARM: dts: aspeed: yosemite4: Enable spi-gpio setting
Date: Thu, 21 Mar 2024 10:12:15 +0800
Message-Id: <20240321021236.1823693-4-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|TYZPR04MB8229:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 72e071de-c2a7-4199-a508-08dc494c68e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	/05l/cod+XDcYo91E59B3GmWGA7hUzKRwHyPqu7NUDz43yVyDWe45+V4PR8hFfEICZKh20mSRswEtNsx0m37p7hmCh87ag9MAhMzo6Ce7rE48jbbR/ma+3vNPuuWSFTt1n1Tr1pMuNhop5Lb0LPJHCsvYBwJUpHqrKH+XU5bWFsGh7EHZu8tMtvRmi8DgxneMFE2TMV70fPZ7+q6EEPUBr8X/4t5JE7Pqmul6sd6HGF17sSBxG6Vpb/qsJmCyonvbAfAxZnb4TC5uQz4NpFh0/CENNGL20waMB45JztLOwRSpCmtGLKCVdTtCiqcwMXcmQdyoNBOfQpqGV9wEIggHAsrR2Ioo4S71EsYYtDWjDZA/gchehn3/afgC4x4FNFWmYUHfgjWM8JTW5SnKmz15c5CoWO8+1bMoq9+KlIP4AGgcEKUg9BIFZXgHxXRpfxeGVrv7qlmfZXr5ojkK2Y67ZbQ9mnnfrP4q6NKMy+35kYdOM8HPByNm04tdqt5VwM1rlx6wS+jgyZcbI88sYgNi2IXcJyDJyKZtbj20bX6xeVcb9GSdOpCjHnhaZ3VlCRniYAX0qYxaetaTmNkkRQb6HybC8KB3y+O5prw8OajgMZWcc33vQM0+1nLktocyHawEQ4FDAN55iGcEcwvnuz2b0kxW4coKbL4F+fsKFIcMGCjxGW68+opaQQhS+m6EGRsT3MZN71G1d/Ru/lh753cQ5+G3wnqukP7HCO1tHREF0KBNZeFLz5AlFYg1VlULADG
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400014)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 02:12:50.3071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e071de-c2a7-4199-a508-08dc494c68e1
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB8229
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
index 6846aab893ad..ea8fd3ec0982 100644
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

