Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5552878E99
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Mar 2024 07:17:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=umghL/0+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tv3N93Pznz3dT4
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Mar 2024 17:17:45 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=umghL/0+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tv3MY5fnzz3dVH
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Mar 2024 17:17:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xu+0ww9FT3/AMLaReG5h4Ou+WdQT7y0uqcU/TWxxr6bRWyJH20nCxwsfkQ8qFbOJzJoY9XpBw/jMNtsQPf2PvZW/GFifWWaGTTJ8FKNUgRDfYq2tg63Sjt/taOrfovHcnUhzP01USHcA2kMW1GFp28Apd9USoTG/keIN7rw2dYPGLgVJ1d8qwg8ajFL+yQXKB9ONUvojVajkA46XdMFYB54+ygpolKfLIwONmMsQ2Z9FhMLM+3QH6PaKy0NpE5vxB11AyPwzahAplOiMo/SnO53eUfdDJJWjj0xx1MTX7s/3F/SzAcUqX1a+fwtBz3MYClZ09cSS/6llyHIx/UoqKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBq9VnGrz2DEHMXloeTKdDOzMCEqUFDFsUmpXJcyMX4=;
 b=VY5BaYvK/+wiThxkEzv0LOGfmm2q1X1SIUat8k77VzoXPyKSANhAvzoUzsU+YePZISx345dGP+oBL7shOu1dFgxzWQnbsB2hMlCjNFqsS2kHtg6wKHqF0j2O3algUF9EbkKXHsY0403JlWY487g2tq1zx9Nr9trai233AIBZIeCpduFol9U9kjnSNLoC1oRq08dxHbCR2WN9cmbh9sGqNwbqioVD0gK5c3d96+22kCZyB8vwNaequF4cDmgCT9f68K4A6l5pwNf8kHtXpQmQ5l/jSZBaAOCYiEaTW9gk72iesvcmjLiG/O3Cjezch7qVD2RPIE8iJVjnZKmcxnEeMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBq9VnGrz2DEHMXloeTKdDOzMCEqUFDFsUmpXJcyMX4=;
 b=umghL/0+FhwdVECiwpowfgaMrp/57Cts6CHFxJ8xfAhXUafaS3WSpzC0Sn4RIw1AJ7+RR0eqr6ODups3H0vG1k8ID3lGtu1PeMPXn/lUBtmkKREOJ9jpFbdHM1KYrbdQp0UI5h3nIb8Oa9kVesMF2to/bq60bg3rj205li5I3Qdd5V4TlXLA+6VkifpWX1WJ4pmUBBtdwDXAGiNk7lVmYHiZ61kPRcB4KDRqXmF3Mvcr0ZFr9pUDEiQuceEuNkzwukAu7Xul8YG3FPuq0xkcdI/i23y48zFEE9zzpXZoKsdQ4xkpkRWz8od2MXqGsbr9FgYasdGVHvt+y4w2dN47jg==
Received: from PS1PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::14) by SEYPR04MB5979.apcprd04.prod.outlook.com
 (2603:1096:101:8d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Tue, 12 Mar
 2024 06:17:07 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:300:75:cafe::38) by PS1PR01CA0002.outlook.office365.com
 (2603:1096:300:75::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35 via Frontend
 Transport; Tue, 12 Mar 2024 06:17:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server id 15.20.7386.12 via Frontend Transport; Tue, 12 Mar 2024 06:17:06
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v6 20/22] ARM: dts: aspeed: yosemite4: support medusa board adc sensors
Date: Tue, 12 Mar 2024 14:15:52 +0800
Message-Id: <20240312061556.496605-21-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240312061556.496605-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240312061556.496605-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|SEYPR04MB5979:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 02cad1d8-c20e-4dc3-a004-08dc425c0b2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	q730AiXFsgySfVXXJdVViBDRqO5i3kdzV87a5leZDpKo5QE1LY33ZSF828jx/euGn1PgolYrl4zrdkmhsFWH5DsJJBu+T4Ig/0Q6cnCXl0il0TLd02ZbLKTDMWeSZUsDJGh85ucmAcepprLCg1U0wHjG4cMP7qk/trjMzBIVFjceTbLkP+t6qYfA45RyRSWwf8zmtjREDHzqg9VqtKS58W/h4csVmbx02Cw+O2Kif+RfOt8pYDy9B8dQ548KAaCx917qo+RhmTefaBmbhs4PuF++2jo+ri8FCFC1SAYhuOxRlD7H+TS2G8Ig+iRcbq0tDkqBAt5Arn0oJe1Sv1JqDxPUVyzuEu0dqIvKwqplTgWwu9+et+6t03shD1wkiTUTyLJf6Q3WR32Oku2cuI4NbHXazdtPpXaJeXDqx0hpAIe1qdNiE7Ksj4cqVldU0hE8idj9G3gx8IxyzMfb6vfYQt/e/o32O3Xn7w0a7Up8Mb9nru9+y9Q9gaH1j3OM3AsKgLk1msXC6ZSd4ZkiMhmaDzPGYW3Qzn5FNvx2VDseGSw0J9jhZvYbgCTxRihPSCrCvd5+YDFIkUzua+0yde5CikH6bKq/5qTrzJKRoERapdrZdc/AZuF+2ZJAk0pjpWE2GhxoASlPff7KpV2LO/H019NlbX1FMLpXIKkFROg1g9gMF2t+NLqXSG7UMYQEp4y1vUR4FWwAnLh/guwLcDdFsJJzqC8cb+1ArDLOxFD0WmxNg+bYDpk5QQ//GvcgIPYb
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 06:17:06.9634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02cad1d8-c20e-4dc3-a004-08dc425c0b2c
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB5979
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

Add ina233/ina28 support for medusa board adc sensors

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index d85c29cbb286..db195213a848 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -915,6 +915,19 @@ power-sensor@40 {
 		reg = <0x40>;
 	};
 
+	power-sensor@41 {
+			compatible = "ti,ina233";
+			resistor-calibration = /bits/ 16 <0x0a00>;
+			current-lsb= /bits/ 16 <0x0001>;
+			reg = <0x41>;
+	};
+
+	power-sensor@44 {
+			compatible = "ti,ina238";
+			shunt-resistor = <1000>;
+			reg = <0x44>;
+	};
+
 	temperature-sensor@48 {
 		compatible = "ti,tmp75";
 		reg = <0x48>;
-- 
2.25.1

