Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5B8959749
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 11:43:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WphGW1hLYz2yMJ
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 19:43:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::61c" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=QnIQbz6P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::61c; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WphGT3p71z2xjh
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2024 19:43:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w49S6MyT6PsbO0d7yIjSPp+GiJETRBgbZrV9Ehz6eBDf1J+NdzI2t/LfIJeK8ZDSmG+Mwjiuy1nOjyb1WV+PF3UZ8nv2/NJRwhcojXCwFnwYYumdNaFolCoxHaQevtG/8SQjLOuApVMxbvALj4Y9xZBuXNw14MRLN0KPa0qhhXuPo1O2yoDPdPReWHkR62VJ3pUAqoTtvQfciseSFcBHyTMl6R31e9lRh0Js3TZ33YEYQWHXKg18pnsEqo8M+4vo0UzvwoWH4MTHun5tdfi3rzaH4c8WNMc8C1WN76e/Pv9+WQnKMk2mv3YabHTqaG15TDOqlHiUxwS0ag+ysYJzoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKDiGhY0qi6Zhw5yz3X3KRvVupBpI62BiZwruuZTFwI=;
 b=XsB3z/YoMXit90BjXYwDcDuxIuVeMyXklguYqUEIcNJNFAneBhwHELFIphbvS1SlQRhAeQmB2xPnagLTsVbDyukU+Cs7BVf6KZ+6rxd33GSUq0orXvmzW91tTvbem+VtJcW0XQGZTntnTvQGCLp2xI0waG4F+jl83fIXuI+SUA+HwG+L/u0AxNsR/P2otn9zvPyR8ZPXHWLp6ovAZ4/boD//6FLDFgJDSNgCJkGjx1A5zudGVLQw9YIieqkhFP3Oz4zc0TclDdEfL3weBFt1DISwkWWE6z8KSsqnF9zGUDHkmhTWDDbLyqfaPgF8cHjxVILL6YbxX25V4A9K7NsU2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKDiGhY0qi6Zhw5yz3X3KRvVupBpI62BiZwruuZTFwI=;
 b=QnIQbz6Pz+L2aq+NA3ccM1Ih17yytUmvciiYYsVHwYy0bZ3rnwsP7g7qWKduvfGwCjNlDjlk27eqXcpr0KOMQJvhlWEl1qZp3jD31eKUPoPzjVOjgBhjOYH5CnZ7ybgPnjzKZ6V73OBV98WHViG/8kOKdfa+Ji9Nf5BRtakcsWAoNPv0qzjgYDJTfxiAeUE0keDETaIeP5tSdfm+MfbKgkrVtoIifIEh7Qg3z2xFYgFZVqJlD63sL92TdQohOyu5/wgWLEXsJf5errzh13hLmH9wlgt8fz1BZ+uWLCPT31/U/wa2pX6U7wJWdmetJc7uc95KTIvE78nK7Go79/Ptzg==
Received: from SI2PR02CA0025.apcprd02.prod.outlook.com (2603:1096:4:195::21)
 by TYZPR04MB8298.apcprd04.prod.outlook.com (2603:1096:405:db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 09:42:53 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:195:cafe::67) by SI2PR02CA0025.outlook.office365.com
 (2603:1096:4:195::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25 via Frontend
 Transport; Wed, 21 Aug 2024 09:42:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024
 09:42:52 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v13 20/29] ARM: dts: aspeed: yosemite4: support medusa board adc sensors
Date: Wed, 21 Aug 2024 17:40:31 +0800
Message-Id: <20240821094043.4126132-21-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|TYZPR04MB8298:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cdd22b0d-932c-452d-d60e-08dcc1c5a0dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?f++Ji3FMJJbMaR9f50piTS6VR7tY4gO5VP8kcvHZMvbHvbRBBcMFe9pKwxul?=
 =?us-ascii?Q?w/dLNdJMu1C7JFt5jLrx8ZjeJyfw05kvJ74qy1YnF7SyLW4G5Vg+7765JgTh?=
 =?us-ascii?Q?dq3WBFMTADzOVDLDfkSpliRWp8XQF86ZpkxhRZyaz14mfxkxbOhVIhqDNeQD?=
 =?us-ascii?Q?fIrxAFRGALOK1PUZI8VE3G4MkUshUuvY9/FzSjnnYSArrk467Dxuiyko5KLp?=
 =?us-ascii?Q?gQWTPwvV+ss7UiWj/6yzsTkOyHxDbz8NjsAWoxuhJhxoi7Ija7VX47Muifk2?=
 =?us-ascii?Q?FbIdkSN3pfkq2uGEGhjEtC6A6Lp1MGLwwDGXn8uLb1jOpd4QHPKrxr2ZDidj?=
 =?us-ascii?Q?Q0aTzi0t9xxbQmxwsGOpyflN3ifxiz6oxhXKUYcepdtIp0/MwdrduY16nkd5?=
 =?us-ascii?Q?SpcMosNGGSKp/IHa3Y4l5nJVv6471KZ57ysAEMdjmMd0tBweYgchM16mm0FN?=
 =?us-ascii?Q?lzVh+Q2Z7nfIGb1kulez9xILG+F3rzFzuYnC+yF+XLcJFhekmUi27pHToi4s?=
 =?us-ascii?Q?zsDWOZv1AVRYprGSJmEU3SkiHKMJn3JXlw9trQ7eWaYitrulyFurczFX4SSn?=
 =?us-ascii?Q?vWiorObru+pmVe93hIi9WNLfjHo2I5vQ5+m4iMd1XZlZKAW+D/ob/5P3JwZl?=
 =?us-ascii?Q?JV0aop+yXGgVIyrVt4hM07cC6izMvdamtpCjsY5NMJkPsdnuFdTBOFz6AawC?=
 =?us-ascii?Q?Hj38ti5bq2l0ijODz3ldBRANmGStXS0Im2ZA9EnT+UbsN1FK/A/5d1FY7XtB?=
 =?us-ascii?Q?Nsk00NKkyGhKtXNrt4XCLnRDa5sFTBJe9dddCUiVAKMW3GyLJ9wgRzmfbVXB?=
 =?us-ascii?Q?VskTzBkA/6lz9mkGsETHFesl1fOYvY3hLTSe3JVNSpDgkuZ6+ijbB8F7lU++?=
 =?us-ascii?Q?zW2hj4mvs4GHHmycXoj1JUkoquWwZgFYZDD7bvTflPJ2v6wGqLdgpyWx/SFk?=
 =?us-ascii?Q?k77SpmnDOyYjvaCnx3xqfNJKWJYccOq9fhABd4JLICBgqkAME8npFMDz2zHu?=
 =?us-ascii?Q?GzEdut+7wGMQXOHLja8k4iDdwilVy575eSZW7AgFRGzq7MtENX4oCWnF3p00?=
 =?us-ascii?Q?s1UEcFnlfQmxzxb91LsTD0oTTqCY89JYuTDAUM/YPWhv3ULQDd0BK+qJoO59?=
 =?us-ascii?Q?SY6P4giRR5nUm6FcSjA4Yj7oPq8RgOjc7DuI0BWyFnuukqhhc8B6kLzKd7Oj?=
 =?us-ascii?Q?ZJfo72gwYvdJP0QCkM3+v3OxJormsFralSMG688XYPGsdZ+AL3Ms+XUva1uf?=
 =?us-ascii?Q?p6ZumIYF/Av8qUZviayFOKTEqZLiYrcSUk7hDr+pA0xzc2blDIrg7p29tfvq?=
 =?us-ascii?Q?zefKjyGUYyync2PH4cnQKGbi8gBIJ2NPhYa2VbyU7hmifCxtlDePysfAszBc?=
 =?us-ascii?Q?EVhhY/dkc4mTI8XlYG2QlOxTuXbgplKz7xmOEci5qe1py6pIRBCrxSvlk4/e?=
 =?us-ascii?Q?0vOKPvsZbxI+q8+HJwEt16dThkResymZ?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:42:52.5128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd22b0d-932c-452d-d60e-08dcc1c5a0dd
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB8298
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
index 98eeee49b082..49500db53a13 100644
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

