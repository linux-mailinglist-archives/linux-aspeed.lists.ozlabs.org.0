Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CA695457D
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 11:25:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="::1" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=NIQbfenh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlc6W2YGWz30TG
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 19:25:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::61a" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=NIQbfenh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::61a; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wlc6S4md9z30FR
	for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2024 19:25:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2gU3hN19eEtC5sSTM2RcV4Z259WZCIdVfz/1PZZqJhBEiEo5EpZEoNnWIxW+0Hh1TLg6A3k/CXbxmDIEaBCHLdV43Z8+NEAFXItCCZfH6R36op2egs1CVfAgmlc4gJCvqskGQyz9l7JTcFHgfiv7j30/I78IEn5lLYQm1jujGLldfuLgkQbMaXpDifSzbkgf+LADbDtX4n9jgtIToNpThcWiOK/y8QdgRuxJtsCCxMj+CK4u09napZ4o0EVOgGq7G4KaaTecG7l3RQu8IqdhkX1mN6zgQMjVjLnRS49R1OE8lu5KeCLojHaXBT5TF1fReY1gDJLmsCCLDyQH+iAbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1Mo5JFgxGn5H6HKsVEDEaSyXk72X/JC48fJnaRvMS8=;
 b=byEfPe75HlvnpWcMDNuyvoMNx4blVJO39uutUafrRTUBQTJ20vMD0kOc3Q0sJcC7byaswmVhw7n6HLcaK89gw70FOrZHdXcVmLUIujxCrGaG4Ov1J305MMfTymeFB516CqnGc6vxOk90nxj3S0Z0yTPOgzDpw4BpeLb/gMkZLUbRQ1UzX0tRARIT18/wWnnhPWPMKBXE1NjKKcleKSRLtrXMMhAL3Yu5XGTfXqwlE+MhmZQ73L2bu6owEbG0FGC6+yxIgHQ5rg1I8N1gwpnlHs1bhL+2+KtSBS87vsoEGiQIoY39JMf2sowCeQ51A78l6iu2I+JPtxpBY3G+1KTSFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1Mo5JFgxGn5H6HKsVEDEaSyXk72X/JC48fJnaRvMS8=;
 b=NIQbfenhkhrLzrCOZy6H2gzZRHEA+IQWgTy1ZU38JP1O67sX5X5CEBFp29XC4nCv7RuO2NxVl0jNTGb8PYtpwoGmCPRC7+n0oEphDvEzKchNBzbFxcsz5xKG9qrgSTeFOFJnFWhgV+XVBfvxQa5nKD/2PjsyndMzYPRkOMJUeFVFgGmCrafmcNv4hJE6QcKBy66Qg0HC0p6WiXDahGuSs55/H2frhynrqIxJjOxtxonzw3aifmjvmXTF59qvyptR8D+pJrIRdM/jW6KECIMA0jcnMALS4rAdE6LPjc8n/BWPeA/2Nti72fZvm0N9e0xwbJ1XAnGZeQBgPfCxsJmxlw==
Received: from SI2PR01CA0038.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::20) by TYZPR04MB7757.apcprd04.prod.outlook.com
 (2603:1096:405:72::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 09:25:16 +0000
Received: from HK3PEPF0000021D.apcprd03.prod.outlook.com
 (2603:1096:4:193:cafe::d1) by SI2PR01CA0038.outlook.office365.com
 (2603:1096:4:193::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19 via Frontend
 Transport; Fri, 16 Aug 2024 09:25:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021D.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server id 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 09:25:16
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v12 11/28] ARM: dts: aspeed: yosemite4: Add eeprom for yosemite4 use
Date: Fri, 16 Aug 2024 17:23:58 +0800
Message-Id: <20240816092417.3651434-12-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021D:EE_|TYZPR04MB7757:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8a53bbfc-e559-4f6a-fddf-08dcbdd556d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?t6TUi6n9g1AOqG9FpLn8pKqH2DDPsPl4S91MEIEEfkYA1x1sYHcSntzRWChx?=
 =?us-ascii?Q?tDcyfz8nYIqdJqgh/U68yqyKNzGSFx+gW4n++JYBpbmyGeHL9xpdUSdr2YSi?=
 =?us-ascii?Q?1kGsAWhbQl/NWzip3W6FOq0+nXP65vQrTUsEsbn9iLki3EUdHjpn5tcxxNw7?=
 =?us-ascii?Q?vwbMiJu6eFr9aB+K9dNJ2qDvJvhWyye9EQlKYIL+MHAA7erqYaOwB+ft0HsE?=
 =?us-ascii?Q?b0jaGxB/SORnOI1yT2C36faLDq5OXTYskX5iE0p5lxUi9sIqOZzmCXigY5lN?=
 =?us-ascii?Q?KK419pjR05dwO1v2I2MmsCg4rF9vrAqFFPXh3qDSsHYbLzjB2v/+0Fb/nRDB?=
 =?us-ascii?Q?zuhwYZmvTGoJVZe2sqtgsGz7YEeKarYynQppoWW5Z4QGz/FgpZumwITY1Y/4?=
 =?us-ascii?Q?XCt4JxKRpE/OEKqF5xlKv74LMT5EJ+Xg+P8luuDYZe8yMLi0+4StD9yOHswf?=
 =?us-ascii?Q?85iDy5B5qgaRfdQHxnKe061fgFmgPIp18PJt9VRQJatCVUFZcsq4akeUoOBc?=
 =?us-ascii?Q?jtTgcxhpRtXlUFJ0sndH9xf0QGkqM+eyvvdRahOoOeRa6uDOexCBeb9uLJwM?=
 =?us-ascii?Q?Fc2xr4vDpk2hThNvKHP29rsjvJiKzOAh1Z7D0zln0nqv5oG7hD15qquxMv2y?=
 =?us-ascii?Q?fKYwxtHU34gZ8TY9xE1sNea90zTP90sanIkyIt5Wr3/Y3Hd8jxH1fwvUlHKF?=
 =?us-ascii?Q?nFZlMYXeqaGj9NnI5sq2ikXMZYbqGL1iwggm15cThakzLEC3jgHlSPYJ0FCV?=
 =?us-ascii?Q?1sbOEaYlkPZcxaDLYeF7GBdn+D16ovCLc7WmjXIxRG9JpU9NCGgYx0Cs/maa?=
 =?us-ascii?Q?RPdHg8M1NB+w14JayqO8up4MYAUGYHR6ge0WlOyj8i7TfvTAT04QkE+H5Upy?=
 =?us-ascii?Q?ueDbfnDcwAqXETfR/hRTbYv9e8DsomlKBUFfT94xSERv0yjJvAk4KWZfOFhT?=
 =?us-ascii?Q?qvVNY7WGmofRXZPICgTVX3To6A4XNgQ+hvFTdsoVZWvHiemGhe4VIT/vC+fJ?=
 =?us-ascii?Q?okO1MAF4FeU7nPvTWbcUHGClGlWZxHYgbdO3I57rwDYDGKVVAKrNKBuPbSjy?=
 =?us-ascii?Q?JN3mxLQDMdAJxMAOWVqlLX+tqzMvckfOazihu7iFqDR98eOpI/uDxPk4N6eM?=
 =?us-ascii?Q?aMXrt1wlNxd+nc19Vy3jwIb55CW7+4FrP2G2+AT7MsdFCrgrpg0Q8TvTfMrS?=
 =?us-ascii?Q?cdzmu/fceCKr0neHuVkK7UbDKDM4cWULuHOvJ6l61VhWvfgQITw2cVuralJE?=
 =?us-ascii?Q?0X0rW2WbHvNBCYLq/5g/4zfPrW1b4BwArFr4tzb/ZafALC8XmoDV6Ng3DPgL?=
 =?us-ascii?Q?qlHkTpRxm03u4lmIMiQiaszh6OTvaxZyaYfp5uv6v8lfRtcbrsrQpD+xu1LO?=
 =?us-ascii?Q?EG7PKkmIvH7Kxamoq5gnpjECticEq+i/klQ8AEr5rJdUoJ7ZS+jjs4tpIC/p?=
 =?us-ascii?Q?Ejd/X+DXaQhYppzTlCLhRBfkflTESxh4?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 09:25:16.0128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a53bbfc-e559-4f6a-fddf-08dcbdd556d5
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7757
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

Add eeprom for yosemite4 use

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 139a09de24cf..e83cb51ac19d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -932,7 +932,7 @@ temperature-sensor@4b {
 	};
 
 	eeprom@54 {
-		compatible = "atmel,24c256";
+		compatible = "atmel,24c128";
 		reg = <0x54>;
 	};
 
@@ -971,6 +971,11 @@ eeprom@50 {
 		reg = <0x50>;
 	};
 
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+	};
+
 	rtc@6f {
 		compatible = "nuvoton,nct3018y";
 		reg = <0x6f>;
-- 
2.25.1

