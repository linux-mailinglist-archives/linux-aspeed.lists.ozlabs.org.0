Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA468881AF6
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 03:14:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=t5uxSgXL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0TXt31Rxz3vXN
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 13:14:06 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=t5uxSgXL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::62a; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0TXD1brgz3dXb
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Mar 2024 13:13:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VR6F8EoUXP10LbLB9ETHwBbzB4co+Rf8/3yaI7P0QzNtS9x2dIc69wVXg+d/00gnzXq3yW0tqDJwcwncG8qCF6Ma66cL9JXTUbPBGwrwjwXsPNSLn1pkMMC+CcIAuvcpnKZDXIAwQfFJekNxmY7TXu2FEoz/h0yMFPsdwGMp9b9ZDH9Kww0wY+cGjodiXBnEgnd1lSbr7bSZ7VYACP/L6YYakZMecFGH40GNgTnR9dQ8Sm7Lgx7nfvB/v0iZHZoDuYfMdUDKGxZQFuWUgf6aOfJmkbQqsFSgV+SL3bDO4L3xHkE0Zj6drgNEGvOm0SCALpE7/MTuKiBv0tKmkwDd0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPNtZKi2fUNRPIzzMuqLSUdtQ1FNVxrHfoCqREbxi3U=;
 b=IYMSViOi1PulnsO9vdmdfK08E0mR0xVzP9GeAkFHDMXSNK6XL5FZ+qCN5xBZ8uV9x6/9NiJNKxJVyopW3zSQttCOE18ArM+exAh1Kv7t7yxe8fLJsgouTBGjOlG3ByuyFR4tyxMq5h7U+DL1ptjzawc4X5uITxnw4Llpygaa1bn9YJ4wULeUfDuSUexrrnGzZUf5FLyRNf14MsKPa121WOhl7h3UNRUpQX49MgTAqe+lkr4B3EubH/05rUQVhCOSe/AcEO0mujM11WAdwA6qPS3Don19VC9xYWBm5Pj6BVvR3Bz3yDB0y9Z9XItAGyWY3LMKCE1tzHEIJ3dJp/YqFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPNtZKi2fUNRPIzzMuqLSUdtQ1FNVxrHfoCqREbxi3U=;
 b=t5uxSgXLKQGosa4RWB+JSY+9IeMR5Mi7sgFT48jYeUorfhsGe+Ac4VUq24X565IAz5dddlc2oNtOdCoSaMwG34epXktOLrjvllxjvOgOznyMj0yfV3QuUqV2XG8B6SWcYEkqZWOxw1BZtGA/WcdLdT+qZvi10GEpzHh96K47gEfmZmrlJgf2AbwyhHhylFElkDpQ5++46n3+6ZpeZprlRJFG1dy/ciorrDfC0EG+oPbKWsq+2qb3oAdB3sQoCRtML+KcuWzxShaL+fGBeoxyEikG0IcFDJ+S6v7YwdhxYfDsxUWjWC4hme2gktAG8zmkbUZq4Zl641Snc80kasn2fg==
Received: from PU1PR01CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::32) by TYSPR04MB7552.apcprd04.prod.outlook.com
 (2603:1096:405:38::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.31; Thu, 21 Mar
 2024 02:13:13 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:803:15:cafe::95) by PU1PR01CA0020.outlook.office365.com
 (2603:1096:803:15::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Thu, 21 Mar 2024 02:13:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server id 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 02:13:12
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v7 11/22] ARM: dts: aspeed: yosemite4: Add eeprom for yosemite4 use
Date: Thu, 21 Mar 2024 10:12:23 +0800
Message-Id: <20240321021236.1823693-12-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|TYSPR04MB7552:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b0b40bda-fa82-41dc-95dd-08dc494c763c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	62tlVqUhebK+9ukPKhQZ1CAWvITKBkqdWA2Bq52JJvTxXCPrhniRfS694J0zkwoRXvbqEGMJkShEkSEZMUtuENSGw6ivD1mI5JHP8vsYD8PjZ527nv2qpeAD7FxiYBFyZxaVLzhDr7t9geCnRDRiaXADN+rNWID1tj5s1/+klSFiiBzCU91VV4Ssmg4o5qsm6fdK93vqZEQLCFZXvMlxMrh8cHTMyiYNlLFo3njBBjSNyW4jKs15y7UZnWPD6t74lHiARfsc54O7MB6YVfAhujxITJJEe4AsCLu0apl9T6vZsZN5hjbIKRvPHSrJ5m6MfJdFYCnnhN+cMJXAVslrQuzOE2kGLcnoS/o1u3QTgDP9ocPJbqLziHvERorzyENM6LDqERZPVrSti/ICeI/d/Osc11aYK3U32lRJeneGfUUK2KlriownNeOU0zcWLfGrW3eCBBD45M5wsAVswf2aVgFg5iYhN/5JDKYPQBIlr8AUAYDsK+zAZJO2rsuRsOgJDMnvD6JpdP10qp321wwGKSrvl2woky7vRQ72NEfsfms3vRMBGZeP46IVcL98uGxC//WKwGz5NwUjeh1/lbdHDoCQ0JljFi4iPa1H26afCvYM46/F1SEaWlDXFEWbOTFExGswcwih/oPvOYO2R4LANu8aNRHRJSpS7CAnbdEbDGRwlbVVMRKMVs2MT5BOpDZJ6LVdmvrOb5Y5VIe7fGhKMUb8UNrOYISqqC2On9abm3bUcVppL0Txqb3gDnB8cpPD
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(7416005)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 02:13:12.7604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b40bda-fa82-41dc-95dd-08dc494c763c
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7552
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
index 175bb5849e1a..b52241b0559c 100644
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

