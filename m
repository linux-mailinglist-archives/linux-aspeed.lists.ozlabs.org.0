Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF7B95E88A
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 08:25:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsgf84gdDz306l
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 16:25:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::62b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724653535;
	cv=pass; b=HqPBWQVChYCT4r88Kx9nUkrH/lubHmQ4FgvUxcMytkBOzJN5ZbC0nDlghMgXe05aEsQxzMZ6sUv83XSZoKTvQ2RqZnb9tp4cAZc+lqSJdUqQhfLMGxOOBQANKIQKxlCcs2if/33MXomy1DPQ3MbUdTlmNf9fG9faMAOSZ7t2nGknm953lgYq5gK+Ho4Vh3YdPvmkx1AV1m/fAXE3MaN6vrnWwcx5IZ2gMZ9hD2v4U2BlQfSkYtQjS3f3t5HCw9hRwZ9a8j0+eb/6GHJ/xl2A4dQ6JUUyaroNIxLA/ZFydiIpcIOdEr8MULumn8z4rx1WwbT8F31l8Er6D5TmIu8PUw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724653535; c=relaxed/relaxed;
	bh=BZanMQdXX7mf9CZbizY6qTm7CHfPB7I8RHeI6+dlIZ4=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchan
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=oRMXnyPl; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feae::62b; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=oRMXnyPl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::62b; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsgf66d33z2xsd
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2024 16:25:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ta7pWk/QI6aa4DugI7IzVg47SOZIUcuQjKi6IxijSGn8MUCIU8Yas/go199GaTTZ2aDkTK8clya8NEn+Oc6ha7wxU2OQ3+CuM+69bGaisFBP4w1J1s2nylwOeIgsvF3AJYZq09fGMS3/UNRY02vhmHBd7tM9ATkXE2xj9GOfhQXf4WnfO2KIN3uDP/lFq7kBwDbiR6fvQjoI4Mbg5sYJ8o+PmboVUn8i2u6fCd4RmysIb1fTeLFGUSTFHH/4gEZEcobOymluA8l0B7sY1XCBRSrPgwA/MwUr4O5Yz8W6d1mTbYiAqMtMQjX/1KF1Iuz+upsfj/QsizPQhlA1F3q80A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZanMQdXX7mf9CZbizY6qTm7CHfPB7I8RHeI6+dlIZ4=;
 b=JmEQvP2r0doqUA++rPd/TrNXPqxJuC6y/i+y0YPTpnxFS0Q4eD6zuq4eyMh4HIHT6avyR95Bxqpd1AwCxGIWj7j5Ftof0VGmPQtfxiA+4owwZMkACrXGNLZceNRBGUweTooU5T6rHpCliVRS3GDGOUmdYKT8bG8fZMJvSAa99C3uVgk3bKF2kLN1pkxSpLEBtB1gwcIueKZKsH0rtsU6oalg/lh9QB//Df5Zd8AITe0TF1h+KW/wQKYQE+eiJQO0T3N2YbzMnREpKycc5TCx7NHprUghjmj4vBench/a+SVNmnCNwypYEg4x6G3RqzruhILQDGCyVzr/oVrxeMoZDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZanMQdXX7mf9CZbizY6qTm7CHfPB7I8RHeI6+dlIZ4=;
 b=oRMXnyPlQxhSAWQ8/17+09LnTbyNIztxP0g0CG7IBz1kEearlw96KYjnRGYULNaiDH3NcZq5HfODPaHAJ0Tc6h2h/mzhNY+LVbqzXnf3tzZjVaesrizkcrx3SB4fcAEQIxoZFKo1Do/hUH46RGE0SVpYhiMcdE7PlR7yHTdpEPo5182VxKEIlN0xQ6H0zXJwn36gs9wOP7xqgOtpckdUb3RhElWPHd/usaCZjxPjDWQ7cVyAhQxOPlM78Bur0fEV+jNhO12C6cExwsXVpGP1aO6hR3NRCuYCnJpOO/WKQ1vc55weSqbJFgNKBQkKAZLy97eDermiNuT5MhTuhd3wdQ==
Received: from PS1PR03CA0011.apcprd03.prod.outlook.com (2603:1096:803:3d::23)
 by TYSPR04MB8339.apcprd04.prod.outlook.com (2603:1096:405:bf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 06:25:14 +0000
Received: from HK2PEPF00006FB0.apcprd02.prod.outlook.com
 (2603:1096:803:3d:cafe::d4) by PS1PR03CA0011.outlook.office365.com
 (2603:1096:803:3d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14 via Frontend
 Transport; Mon, 26 Aug 2024 06:25:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB0.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 06:25:13
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v14 13/31] ARM: dts: aspeed: yosemite4: Revise adc128d818 adc mode for yosemite4 schematic change
Date: Mon, 26 Aug 2024 14:23:47 +0800
Message-Id: <20240826062408.2885174-14-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB0:EE_|TYSPR04MB8339:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7b67006c-bfec-4f8c-1dd9-08dcc597d805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?f3pvi1dzjpJZEoDojiNdqowEpkimbihQlJj0SjdyH4prfehvS29ZJ+DX7V6Q?=
 =?us-ascii?Q?BkdOpsxoX6hFbAahEXVYv8OHSscuU8HEpYhf/DPk2UqOt/T7JcyxbNa4Fxs/?=
 =?us-ascii?Q?G/sOrMYu013iFgTg30UjCrlxRJH+NJMuYDO0FZaI2pbZdONh5zTIJa+03hHL?=
 =?us-ascii?Q?FHRI2qT7Z/vvodXFg/ba+nwcbz34zGa6vvRLuGk9Nw3ZQY//JXKW/tCViW0m?=
 =?us-ascii?Q?o9DXjX+EHa5hDtq0xjmggBAGO93sT/jkked/vjOd3BX8nEroXZce+Fb+J39G?=
 =?us-ascii?Q?EbzWQA6gsaeYfcjc2G5DI64pTSRWSao1+s3otGCYjBblahoUfnviqOOxy6lT?=
 =?us-ascii?Q?VhiAJo8MDSyHirLTqHoejd6dR8qwmOjOxh96OudclN23GIyNe7cMtdZvdQTx?=
 =?us-ascii?Q?U5FbuHDIu0y7cMjuKQpTeEVdj1Zl29CuF2g2zNGIy8q0rd1mn4cSkI6rl+Sv?=
 =?us-ascii?Q?n8PkS0AtEFZi2k5/Tx+u/ZKj6w00O2P+hk7sY573mG40zGx9dnvT+Vpyg10i?=
 =?us-ascii?Q?tzXs6KOucQXMVfOTsULszJDgxvzelErwN1Ejodlbq1nu4E2jZA3xPdMLkZ8h?=
 =?us-ascii?Q?+0cnJjKLNBhTAG0VQ35aDhEKmFCJaXBrFiH8Y9o0OrcnOMP6iwpf8vrBQ0p7?=
 =?us-ascii?Q?iJEaWwJnnGpkNnxfdb5x9SotdsxCB0B8l28mogLZC+hnsSX/Ud2QSWHeFQEf?=
 =?us-ascii?Q?0ojUc1EyfOE3cgsn0M3dpsOvkmlPdVmdeZsAjTHTvok0XMg8R4FaTBgeqhem?=
 =?us-ascii?Q?PDNNAI6ObaTV9u+wGO9G/dqypyJlUh14TP8fLOu5lBRMPIDh2RHRatqLSU4M?=
 =?us-ascii?Q?hXAAE+Y/xpxUQLLa8omHX38hfVzcjKv86KW7GisIk36zzXuMgQ7HGeA+wf5Z?=
 =?us-ascii?Q?Pl3cAlMoyG5WwwjzwYrMwWyYJxG/0hWnWrwLe4leR1nWUCnGspPkDgfugXIZ?=
 =?us-ascii?Q?pMq8/t9zWrPcJOn4HsnDXdVlU3yaUgBaZ7XgE+Wvk9lKLo7W7jYcvEV6IizH?=
 =?us-ascii?Q?LtQbBIPnyi10FdHuUUt/erGRyYviC8preruJ17Hu4vZKJnlO/5KBKuiN1LkJ?=
 =?us-ascii?Q?TWVyUTvwnTMldIJMvMq5T1jFzWueFp3MSxELAVPK9fCBbLDQBWj+KGlSTbtL?=
 =?us-ascii?Q?mGyS7CpBPXaHIeCVWOpuxfPF1DgHNQbsy/Int9uY63aKYDOQXMCWkx8Ri7ER?=
 =?us-ascii?Q?r0OX4FFlDOnrkO60bC13ahsN1jonQkq55BbfQpJ+xS/uoE+ZWryz7IwO4vXg?=
 =?us-ascii?Q?R3yWBMm6YlhML+E6/FvJIwCyeJkuK6gthZlR0b/chGYbso36+RRPphjIeqXL?=
 =?us-ascii?Q?dvmZXkQXf02F8vtx33RhMtHvrniSfiFOoNkNvoRaezByIYAiWfTPm1gnSMet?=
 =?us-ascii?Q?+mzRV/0raYd9OM1hn8hrrnDnty6542vvIP+adNkwzG/70twTxzYLBQgGQ/HZ?=
 =?us-ascii?Q?W0Z1G5N6FEBD+lkYjuli6Zj3kONtIjzc?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 06:25:13.2527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b67006c-bfec-4f8c-1dd9-08dcc597d805
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB0.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB8339
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

Revise adc128d818 adc mode for yosemite4 schematic change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 2c0c37b3ee5b..1765a0bb70d7 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1018,19 +1018,19 @@ &i2c14 {
 	adc@1d {
 		compatible = "ti,adc128d818";
 		reg = <0x1d>;
-		ti,mode = /bits/ 8 <2>;
+		ti,mode = /bits/ 8 <1>;
 	};
 
-	adc@35 {
+	adc@36 {
 		compatible = "ti,adc128d818";
-		reg = <0x35>;
-		ti,mode = /bits/ 8 <2>;
+		reg = <0x36>;
+		ti,mode = /bits/ 8 <1>;
 	};
 
 	adc@37 {
 		compatible = "ti,adc128d818";
 		reg = <0x37>;
-		ti,mode = /bits/ 8 <2>;
+		ti,mode = /bits/ 8 <1>;
 	};
 
 	power-sensor@40 {
-- 
2.25.1

