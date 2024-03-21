Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39591881AF0
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 03:13:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=jX5FSUO3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0TXX08bpz3vXG
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 13:13:48 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=jX5FSUO3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::625; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20625.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0TX45Vf0z3dWV
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Mar 2024 13:13:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fS7UBQu2/LWXBIyVtauKkgrrv6XDaAn+1gOP3IbQsniX/inP3eO93YOHwSuZsuFKonKP1EpKYo2SWrJNUFXlbKyUuNXT/xQA/GwoEWBaxqXAsWv4Y+N3GWCmy/rHAjVDABdUa/+fNpJSGaPnD/uCGBriENxexAhXPrt5CrqIU6Jjb/nvsb2xZo21G0hYp/N+5nzbUwrDRvr13hGe0Z428LntdW9TBiyQq+HNtRAiFSkHDIhfpp/li4I9v4iQvLn8Yj1z9u1E1SFnrXm4S3LdXdVSVZtm21y5M4aBNNIW8njOtYL9tVrDLb7XaBUpl24dkQCN0IyqXxp3P9rCyAg/xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6eURwzLT7RdaeNBJqI62XJk0FsCqAYnzTzJ8lTXipo=;
 b=BiF1u2p5VpYgkOVKY690LeuoWPfP77c4bHd/i6Ep0X8V6t59tPbgDQSAse3M0QcMXfDclBZT/RkNWTNCVjBk0zXwSS7aFogFE2WgROMwxUVbTg1SZ8ZVnmV3mVs4la6jCTgSppR60xhk/q/4n1rl8ZIyH0HObII1Nn20rkCFaAEzqIF9f3daJttopFxavSmwn9Jtczcjm3pr5Ht26XYudbK/FwZz2he93CUG3FrxFqDh5N2Z1ckChxcspJXSoZL/OPZIoj7ZJr0KQUfxec22Btm8iUcH3lnqU5tptvhjj2GHY9bvw2BZnu++dMGeMBPMHDwemI02zkX8hNCWzhljAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6eURwzLT7RdaeNBJqI62XJk0FsCqAYnzTzJ8lTXipo=;
 b=jX5FSUO38LdZ+AOYICmOaVM6xmiHKl8g1e0bwlgMdCupTS0nDWggzoa8KIjPN3v5MQpRZJs4BpsUll1WuvzfszUFsRqucbZ7gIBONsHh5Cvbe/vqqqEvndy/abrGAj1zj6VQs8aitmNUZME2PgdyxzWI3wPfPhUnnpnyKymL2ZFUChjvb9mUCku4ggM+cYl+0T6tWxKtf4/ldBYgcqRziwd/G5i7gqKKAVVPWRjvv9asq+7gmPlifG14BupN+paKZXsdtS4MuPsLGb4AA2Bx9ThDD1De0rKouttd22oeDDvhZXoK6JaADmfR127+9HEvpIl3fm3FT9jLcyx2A6pYYQ==
Received: from PU1PR01CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::31) by JH0PR04MB8066.apcprd04.prod.outlook.com
 (2603:1096:990:9e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.25; Thu, 21 Mar
 2024 02:13:21 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:803:15:cafe::16) by PU1PR01CA0019.outlook.office365.com
 (2603:1096:803:15::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Thu, 21 Mar 2024 02:13:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server id 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 02:13:21
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v7 14/22] ARM: dts: aspeed: yosemite4: Revise ina233 config for yosemite4 schematic change
Date: Thu, 21 Mar 2024 10:12:26 +0800
Message-Id: <20240321021236.1823693-15-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|JH0PR04MB8066:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7026e2dc-5e24-46f5-21c8-08dc494c7b38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	v1g3R6ezUa/uChlT8XP848VKIJIm9V0IF+ZxPK+NY0ZcL6IcR1oOWFuAkR5iI88yISBHJSin7tDkMWtLg7qBNV7EkAna2lnyGiQVEiePBcs609qiGseyBfQiFTBG8f/eDU0Hz1GR+F4sK6O/ra3MmmCvEyxMz4KgMyvA5t7wyAk/13d7NJWmlcI/pupsv9VERS99Xpb49/tvpbnION5akLGWEoGAFgQtdqo2dZHJiH51/NfuwyJh14rxUco9Ykr8mlxU6PsO8tHN3QK1+OUsZ0qqFAJg0vCYSxu91prfu7aVfEFVxL6c4yPqUgU5S8K6Fh3zNK5yPHWSeMGuVPEN6HEmFCaIPAx4xVvKUW5tbulIPZ7Hc6EX/M9elbJ3ulof9n2rjglvsFbjoAm8dxQ8cfpMG7FeR57cKPbhRRCn0ZI5/qUTvDBOjH9Q3NSFBqRLouXqzL32WFE42XNVI1dENAWPVnBrILvk3427MUJjDftE1gindFWKjb+ukoTlBi9TpOf35M2EXRWMNOYB1xBaK9nTe5ty6nu7Fpj9XF9f7xFMrvXRtXFvak24ZN5itcMI9WFkqXR9i4KlgvF0lRYLXa7GK+xn/tlJSDYnmYLAqFKcSs+GAUb+baKwr2pGlQhmVP1l1BbcDcPftq+gz+q0XyeNDxaLaHcFooNcFzpEGepzzAMRE9JpSktNWdP05v5U4c4+DUOADhIRFtpEZJNEEltHsbyK9XjLqlWfimClraQQqNtVgnG7f6GKVWajOCGp
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(36860700004)(7416005)(1800799015)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 02:13:21.1198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7026e2dc-5e24-46f5-21c8-08dc494c7b38
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB8066
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

Revise ina233 config for yosemite4 schematic change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 130283ccefc4..011c8d0bba73 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1026,28 +1026,38 @@ adc@37 {
 	};
 
 	power-sensor@40 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x40>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@41 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x41>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@42 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x42>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@43 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x43>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@44 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x44>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	temperature-sensor@4e {
-- 
2.25.1

