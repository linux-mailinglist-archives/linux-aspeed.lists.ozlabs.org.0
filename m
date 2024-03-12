Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F547878E86
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Mar 2024 07:16:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=BLZlWrYL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tv3MC1sQ2z3dTG
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Mar 2024 17:16:55 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=BLZlWrYL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tv3Ly2JJHz3d3W
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Mar 2024 17:16:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CaUvVFroNsB37ZKwCLPe/PqXpFwXqg3BtRUuIeleXlcIZuLFKqH+1ATUiFp2XEI2X9Lskhp2VHDmG8GH8h7BQh0R4Da6jdn14YmDaAf+j/Xwl8GddHfEUxw9iDDs0Wzez/s0T1x9XfcsL2xt32DXPFsg7FPyxGfLNjKh5nLGdvD5oNLWMmgNPE4T07iwFWiS8B7n9CHyvUthzv0B37noz7wbWb/ZMC1u4LIE3DEgoGXDErdVVsK6Az1vY5bPH6LnYwngGy2SShNceseRngZlmYVnsZV33XimRtmjHKrN5OWBtaudTDXznpc1V76QueJpVshSz/PDIEAdLW65bTjMyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+rCbKa980zvtFSL+aiZSLIdHmQc5ZtQwhUuhOWMtss=;
 b=fCprGslSC5AHMREZ9SR1dZZYaFGd2wPSrU70ygaIO1gLr1FhXZr8cb08DVMKjqXa7MnLS8qdOihOzO57Mbh/Y6x920momnDZZh6u54scHyLZaF2DF9UfOejNQQFZII0KUq4p6dhBJ37dxvPU9jes/ijwqtth9PlMgBMV43mE8DJKdIivNCmtThrfQFk3pDJAE2D6gX1ADtZI9NYDuj5hj2dBXzhP51gQ95mGqopBgiTICQ2vOYvN0tkBfw9yiP307d8CnDEi/l4lVYncBabPBD50tG+VOxojLXuGIHIyIdcz6tHNABc3Cx3aajUMRPpYYtPkU1/4cNE0wMmQlbtt+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+rCbKa980zvtFSL+aiZSLIdHmQc5ZtQwhUuhOWMtss=;
 b=BLZlWrYLH28LKcvxgQp2vfjdi8LgLH67AXu9BzAJJyhjC4qQtD9F1undTYfavX93lcxz23R9sW83ocinSbX4UBrns3ndFmKK/1jywSr5j/KqmliW/9QyMoHMynpCm/eSbIl02c7SXzuHXsd2mWCqH+QagC+JwIBEvfSV2uxStssK+Ar/vuHKeflKerKiHmMkdlxOWWBP9eNqG3dqylzWnA3ImNZ2dpNoRvOTWH+TS7vlOAUI/IW7ZIRJic16IQaOwUtBYSjSJUFTrJMFte6Mb6/73y2g7a1AR41tIT8TN0LRLx7iR6tP1dh/Y6beksZM1Qt+JbSZ759FAc9yIHbNxQ==
Received: from PS1PR03CA0006.apcprd03.prod.outlook.com (2603:1096:803:3d::18)
 by TYZPR04MB6765.apcprd04.prod.outlook.com (2603:1096:400:343::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Tue, 12 Mar
 2024 06:16:22 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:803:3d:cafe::18) by PS1PR03CA0006.outlook.office365.com
 (2603:1096:803:3d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17 via Frontend
 Transport; Tue, 12 Mar 2024 06:16:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server id 15.20.7386.12 via Frontend Transport; Tue, 12 Mar 2024 06:16:21
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v6 05/22] ARM: dts: aspeed: yosemite4: Revise quad mode to dual mode
Date: Tue, 12 Mar 2024 14:15:37 +0800
Message-Id: <20240312061556.496605-6-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240312061556.496605-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240312061556.496605-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|TYZPR04MB6765:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 07aa9906-3d95-415e-7303-08dc425bf02a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	HQSnIAWriNUSql9Fehgv6M0tcaQLORFpzVEJn/LJRSLgf3anjmNNJrI3gn8f/h2/spwTTAqIzcDksT8im6Y6k6JG5fek9js9k6KH8niHSFZFjlhHX/U9Nx7/2zjhA+jy3Zrgvc0d0SrG/pBA9N5XymcwhVqShTM27yT3lPtJEy4YOGFfZPXPQXz7YTxqjDQDsqGRKJRL3c/NAB10wAWDfDjdeIZ5464NoKw9iooNqNupavmguXGcuL7PwfVmjC/TWEcycKp1W81fAd3Ygcqe/KCbsqV1aTU5EoxhldvLEo4V9JcrW2PbWiFRsjmCUMkfdAEHLL4hxX8I/rXwmp5YNNvrOvwx8xunVLgaA3vfvVKQaYzHHrNqBrLZPydXSiXik8PgkA3oaoqTAU1YnemPdrXpJCtIG8Jw5+SK8tHBxTzonFGksyT07JOqDOppXEznG02kzDoE8qSvpOSi1FTqluqHJDAAM1x9wm3HmSEC/EcYjXXWQKoALqbWjWWiGeBEraJtVOz/TPs8z4DaqqqXl0nnsyBtsv0cn+65yv8Rm/ovADy5ma+eMPQ7dgvYcOW8iihWPcDePXXyGF2DXggVoQVwZBT8ZxNZ9Gxd9a7h7dDJV45vlS/gGz0B/tTIm4sGkFlIOcQlQBhOCFNgGQ6foHGoUpxws3FVreoT0igwCYPNFnef8mVc64Q8z8XT/khyOxRUqDIuddzoZU2iDJIWpDl9XxOxMNt2rYyW1ZA2xTPS9a54BodA1SZyDcWZePk5
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(7416005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 06:16:21.6351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07aa9906-3d95-415e-7303-08dc425bf02a
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB6765
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

Revise quad mode to dual mode to avoid WP pin influnece the SPI

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index f8bfdefbefc6..23006dca5f26 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -149,15 +149,17 @@ flash@0 {
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
-		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
 		spi-max-frequency = <50000000>;
-#include "openbmc-flash-layout-64.dtsi"
+#include "openbmc-flash-layout-128.dtsi"
 	};
 	flash@1 {
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc2";
-		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
 		spi-max-frequency = <50000000>;
 	};
 };
-- 
2.25.1

