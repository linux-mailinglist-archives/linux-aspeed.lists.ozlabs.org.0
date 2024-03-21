Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF77881AF8
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 03:14:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=A0yIjS2T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0TXy5y8bz3vY4
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 13:14:10 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=A0yIjS2T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::604; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20604.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0TXG0XFyz3dVm
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Mar 2024 13:13:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETRHGQKw6PLhuD+cCI+1OXzei3U3lEEafIAohfc+DTuOFCx8PEH6HmShA8oJr133Pt7oFswcizvJFUwW7S8Dj4wUNxt/DoCDlNglEP+yzhNmNz5iQ0eLd8h36DDRZqJ2TBf9f4QGVG/JIO8ax1azMm5DNvRJlsk0a5EnJ+iUOB5JofqdZui490c64E3pHGoWEkmN13ED60JBI8eV6d08KGbSVZPhtjo31m41K1LrMMOAQDhAi2CgUpN3f6jKXurfoNgWLj3LM9iCEx4Pik70/HGMLGUt48hjYHMZ8itD7ZRP9A4B01rRR2Oa0oBoN4JTl6bina+b2bkSWdorTK+bdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzCsl64ZHVlfgQUamfuum3pvHbcM8f/GHRvXk9OMp/Y=;
 b=FaNRQAnri3YFZt6yzFg9DnhANMeDfWFFgkF0CBAbS+2rA8VRUN+JZYA44OlW7nvJuU7JMPrR1w8W0auLdNAO/YnGnC0DKeb0T3TYi1oYeJM1IKAKc1Mzo2vPmLvZYmFnd7H2BNFVcUgpYcEXR8TU6FNkB8Z1tjEvy7poSHNQj1abt+waQyTUTzgWZPIM17dhD3qM1ety4J7O1UxYP2qQlHhhPUzPNDEgNojBBM9uKGoyshdnXQzwS7GZf9gzjrWHlllMryxiw7Sahups04XSLquHU9aVHSwdl3lKsrt3ilPmiMVPD8nLyZiXMgcLaU7tAJXK+iAixEuQQYE3L4RZWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzCsl64ZHVlfgQUamfuum3pvHbcM8f/GHRvXk9OMp/Y=;
 b=A0yIjS2Tm+h6vUI/7/ODqwrrWiV9BodwYl22GWCktiZbKc/DTcTE157OHxLNvJz03QeMBLr5asVz1R0ZuNQnQ9jmmndx83MCBmJrZWDx9nKxinF1k7hFVkNRuAJclBUr2/YtGyyaTO0OFT0f9MGfsMyEOHjMm5hiAjf5ei+6EbzAo72JtkOngcfQpwrNfPLLen7NW9Nqcde2/pAVYmYEy2tvuqNOOF6qjzFVpgGuL1Prg6YxOhrBD8MLbPSO1+0QTX3jnMCED/aLZpnGATyXGWVPtA7y42x6oaZxsfkY8tM1AL2zfaMLzK+NCQPFLhWQf4OsqOimVShZx44SMMB1Qg==
Received: from PU1PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::20) by SEZPR04MB6372.apcprd04.prod.outlook.com
 (2603:1096:101:ca::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.34; Thu, 21 Mar
 2024 02:13:16 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:803:15:cafe::30) by PU1PR01CA0008.outlook.office365.com
 (2603:1096:803:15::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28 via Frontend
 Transport; Thu, 21 Mar 2024 02:13:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server id 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 02:13:15
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v7 12/22] ARM: dts: aspeed: yosemite4: Remove temperature sensor for yosemite4 schematic change
Date: Thu, 21 Mar 2024 10:12:24 +0800
Message-Id: <20240321021236.1823693-13-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|SEZPR04MB6372:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e06fdb8e-8552-44ea-4748-08dc494c77f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	LczXgAcnVPflRgEe7ECOrlldKuUyKakMI/WVGzN4xPPZ9m4f/UkD3GdkRX9IjAY3tuH0/qllkBkUfFBxL1bYFTihSZoL250v8Z59FyroGFt3dxnYd1qdxlj6WbdQz1cf4hs/dp7a+aBrA3RipN9MrioccJaBBwMprx+r4zc1paHDGuN7XntSl4EVnheyOZMRZD2f1Yh07h1xXRN/uX6qjap64mnMo5vbypObmxAvdfY8VptdRdd7uY0yK4Pli/RUpNTEdZI07XFq4+FaMXgwRVmG+Dxf+s6nWuPDg5oG3evpI3HbfYLBTtI/CH1SqQcDfwW9nuzLCiYg9ynIUFtUyUg4GUq+ZSztZkjNdQFKdJa6FZtTw9ArDtFkQ/8u9M0cF+mPNdqZIFo8TPonbXWKVEwox/vkmX45d/9LLru9/05zUZ4/awkeY5/2lR7ArvcvZrjawYCiSNXsqMi1g2v/jwkn3XQP0xTueERqTkA+4pXu0LmRxTp9RUWsZXc79MxiYPo1QHtPMlTKgOQLhE+NVosul5vQWsbp4lExG2qTJ7HSF7ryIAlcnpmAiE4SGhf/L2Weg4O420a5Nm027eEUbD9QPYjjudw21LWbDUq+6cUNwkN01wq8b0uY/Pn3oDg6V/8i8XyFaVnAljjPFd9r/DJMsFhBRudekqFWRkDFFIn44+djwC5IP/t7qyGmmiZ0Rky1OD/G/d3L1tRFmbEBJ9Bev5bUv7CnSZsEtH21sYxYf3GDhV2fBHz9i4heY+FZ
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400014)(1800799015)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 02:13:15.6354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e06fdb8e-8552-44ea-4748-08dc494c77f3
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6372
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

Remove temperature sensor for yosemite4 schematic change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index b52241b0559c..95901f651f7a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -921,16 +921,6 @@ temperature-sensor@49 {
 		reg = <0x49>;
 	};
 
-	temperature-sensor@4a {
-		compatible = "ti,tmp75";
-		reg = <0x4a>;
-	};
-
-	temperature-sensor@4b {
-		compatible = "ti,tmp75";
-		reg = <0x4b>;
-	};
-
 	eeprom@54 {
 		compatible = "atmel,24c128";
 		reg = <0x54>;
-- 
2.25.1

