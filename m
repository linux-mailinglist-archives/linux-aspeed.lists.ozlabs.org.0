Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 000BD878EA0
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Mar 2024 07:18:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=txk7P1YD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tv3Nc5X0mz3d2x
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Mar 2024 17:18:08 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=txk7P1YD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::4; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tv3Ms71yKz3cy8
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Mar 2024 17:17:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKz7Ms4KzJe5aQCp4wN4TzapyXsexPzJ555D3WKtBU8CzdJ4t9tgET2sP4gIlMK6lkpSFaNYxtF92h/15bYLvcChrZmOGVzAGzI1s1HmDr6zWEOxGdAU5ACZ76oaP0siQUSffOG53pwWUMw8nCYiA4cKxURQ6MJRRH2/Eo14oXxbmkzV4prwU2sOeZlWj5vu/NkMlu0d0/IuNOAXx5v9Bgjr1mWtARkp7fHSUCfNBoXdON0XRkA6ftlGh8YZSP6AKmQJLAUggTLH7V9tvfOhuuuoEhzG6ZaAHx5QkzTNx6HGfmBMKudiQJBsXLmmJCSX01Ld6iHqgIm3YZNb9lLYkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdxfI4PjS5CO6uON/CHP5SOM/e0DDCkLYoB1X5E8x0I=;
 b=O8IoglQUb1OdgRFDEiBaiwEOr2eT/pu7PJ87Lpq+zOtP9dR+ji17tvNESiqeLrkuMKz5mTfZCGRrc/7L+JlSZH3ukLNjbt6r0uW2HrYAOlidh6npuseETB1GzhyP94Ka6PxAIAQzaZyxzVDZ+t2z+jA1ttAqbTpMFkG4YYD4kb2yUh472PnZYWmOH30LHIj/sGuTYwXtnB7prfNCE9aNKQDVcoQ5GnjUh9DjYKY6zLjqqK97xOy8H5tuKs4RZuiR0IGFZAWWmlAZg1VCz8YIZYDe72RI2pTR1Nw7zB3DHc5xgBMSzUSk/B+qqMnd/J+Aj0C6TrJTtd3rYCZTkRzCGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdxfI4PjS5CO6uON/CHP5SOM/e0DDCkLYoB1X5E8x0I=;
 b=txk7P1YDCgqgOf/h0jKyHUklaVRESEWYxKIMln28QoX9AHUXQvZL0fLShj92cLB3qs2wZZ627Qv1I3NDX4Wj05plvX2Xek8YefQkEzPWJtiDlRXNV2cwplEtB1wL8UqRBVquX19kiMlx8HuiznCeOtPphqjJNRNScjwIsLOMZcJtXBQXUiS0bQTRCWEc4it8/uJB/KrIucld2VdvFfppjQPn4xxCLkduGs/R/g5ohYU75VpJxV5AwuQvOzx8NKqAV7lZT+R3dWBbGEFWYkMx5/rb4PlbaYaxGGEkEIuUME9yMI0wazyCRqT69hKXVwStc6/r7GsC6X8Vdn+A2YDaVQ==
Received: from PS1PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::23) by KL1PR04MB7683.apcprd04.prod.outlook.com
 (2603:1096:820:11b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Tue, 12 Mar
 2024 06:17:10 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:300:75:cafe::f8) by PS1PR01CA0011.outlook.office365.com
 (2603:1096:300:75::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36 via Frontend
 Transport; Tue, 12 Mar 2024 06:17:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server id 15.20.7386.12 via Frontend Transport; Tue, 12 Mar 2024 06:17:09
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v6 21/22] ARM: dts: aspeed: yosemite4: support NIC eeprom
Date: Tue, 12 Mar 2024 14:15:53 +0800
Message-Id: <20240312061556.496605-22-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240312061556.496605-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240312061556.496605-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|KL1PR04MB7683:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b6e07951-281f-4301-f06e-08dc425c0cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	8tDvhsNFac/dsXNe0JEfCyM/0I6LKFdeX0L0OsLnPsmLKzKEwP3x1l9g51miSjX2LFgg211/PISUVndRQGjVkVFyw6OW/HO+48LJHt/2YqOxyQwvf6f+v396Q0R6JQecS+H2HHtBbhKYfqaTJm8dYHYu9Agkjysl9FyTSyxYePmbFCvBAFGh3ovf/k3KS4b5FcihoNz/0s3mnIN8sztC/gqbhkMz8MZL5zx5hSyeV6iI0AxAv04gmfDK9n7KleZrzFKCcbq6Pygklte/r7Cx4Lh7tWIItibUrbhxnRGf5KdLm8yMICYFhyAWJVafcGsdVMC+/BPvtDQgw4QgbwhXIRQTtor014AkZbcJdXVIdQ3esYnZlYWgzv6mgmYnnw2aC5OoyTGISuemJzMiIqxqOtFlv1TcxxgxxBs+AajGIjpkF/VyRPsul+ehvuxKevTrqH/Q87bfrLBU8Z80Tux/Zc+TYPpQL511UsAoqKTw/e2h2TFRQ+sDk0UFgbkJ9TaKuMRzFH7d5ZeiIgYSYFzjkA2RZoQZTNJM6+1oiESJpVYO85KnPFiXZ3psXIBINhDuWKFvhdBVCinN6zeFoNj1fabDb5f6PTqr8C6LozJf/y+ZGXBPd4Gfu75+ulU+UQElR2D3qLvyPZX42jSHHmsAeP4Czue3KDuyKa0s5Fw2BUs+sgDCrH9OLxEsmn8xntJlLa8lA+6kCT52tsXn666pPk4NBj0Exc0DJbHVL3PqjrpmZIwKugJtfYI7CUS7iymO
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 06:17:09.6041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e07951-281f-4301-f06e-08dc425c0cc1
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB7683
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

Add NIC eeprom devicetree config

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index db195213a848..c2d184b21567 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1330,6 +1330,11 @@ temperature-sensor@3c {
 				compatible = "smsc,emc1403";
 				reg = <0x3c>;
 			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 
 		imux25: i2c@1 {
@@ -1346,6 +1351,11 @@ temperature-sensor@3c {
 				compatible = "smsc,emc1403";
 				reg = <0x3c>;
 			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 
 		imux26: i2c@2 {
@@ -1362,6 +1372,11 @@ temperature-sensor@3c {
 				compatible = "smsc,emc1403";
 				reg = <0x3c>;
 			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 
 		imux27: i2c@3 {
@@ -1378,6 +1393,11 @@ temperature-sensor@3c {
 				compatible = "smsc,emc1403";
 				reg = <0x3c>;
 			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 	};
 };
-- 
2.25.1

