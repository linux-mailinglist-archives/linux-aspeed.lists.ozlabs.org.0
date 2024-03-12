Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E70C0878E90
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Mar 2024 07:17:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=x2NhRcqZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tv3Mf5CZHz3d3Z
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Mar 2024 17:17:18 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=x2NhRcqZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::604; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20604.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tv3MB17Znz3dKY
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Mar 2024 17:16:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKY/aDj6Fy86d49px4+rTjiRCRCcQspYMPMa7FacjvFbbCrJAcvHBDnCwr8ITZM7i54CqAorSaUw5uK2SChKbL305DTF+XJbvHg6iyK483CAg4C7XPa506VzPjcaNo27UNey496DFfXHEgxIZos+0S+zaokEu3rsO8ds+TwFaxb8xOsJx+uJci5s6SERSHofjnfVGuVx9NsrA88pP5fzzlZD7oyL41qTuUFI3/NdaxR4I88SFi8vRqSdRkCk2G674+IDNIbOenopiJBATrRlBLETjD6t01t//94JdrWFmk6xWgINelMKg3WV2uZ7i4A3dz8zhyixYw1ZO26ZvwniCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DosD6Mfg6HM5skGoPJsT5gKYffO1qIysmMfEeqUA3og=;
 b=SC3LW7nG5i3vlyNBfwMtXMLxdPXs+YvtGB/wSGsEZ0VH0gnkv3zcC01VB0Xj2c2SPeDaU6hthy/vyKmDFeJwH7FHuuOEzcib7Kvi1QCnmOX0Sa9yVmdHZT942st4KiFMloWeO5XC1Uc7gQgaBVHUYJSGm4hU6Q1CLHpyBpEMmv4YqhSTc4bj5y6cOGRiu7m11MHcndiLvgTXqzM3B9YEHDZwrRZE77ObvV0albwMq9cHu4Ure29W+Cs+ENU1ra55D0t/PFZ99xwpgvj0XAV08aPV/OmssYYMNkr0TTSuF8xtGTu03nauVe82UW4pxfQG69BzoqLTK9pK1F0z72dINA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DosD6Mfg6HM5skGoPJsT5gKYffO1qIysmMfEeqUA3og=;
 b=x2NhRcqZfB/gWAIG+w3MF1xt4tUeNpDwBUR9WJU5vHgKAuiat5Yps4GBIqKIShqsjNePnKNl1VbEyh2fECw4MydKriheNIkAI+mNiyJOVqzRhbIsAtYMUuRT7HVNz8TkTkobKFi5esa38rGOSA7yw0OrEEmrAdJvTsPVjeT+g/yEgSQLaJnIOrbqTUOYlZwC08aBnZ85Sky/Nfq5c8fVtyK4z7jLz7IcRuxbytgPYZH9w5pUlqf1iOgzUzcvXm2fd9CTuSVIWqxZ2Q3SPFxv988xMhmUQFZMya+owqBZPNiOTpzDZBI+ekzr1snAa0jDsFGyh3iAg8vMH1vVg+wrLg==
Received: from PS1PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::21) by JH0PR04MB8037.apcprd04.prod.outlook.com
 (2603:1096:990:94::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.33; Tue, 12 Mar
 2024 06:16:37 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:300:75:cafe::76) by PS1PR01CA0009.outlook.office365.com
 (2603:1096:300:75::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36 via Frontend
 Transport; Tue, 12 Mar 2024 06:16:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server id 15.20.7386.12 via Frontend Transport; Tue, 12 Mar 2024 06:16:36
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v6 10/22] ARM: dts: aspeed: yosemite4: Add power sensor for power module reading
Date: Tue, 12 Mar 2024 14:15:42 +0800
Message-Id: <20240312061556.496605-11-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240312061556.496605-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240312061556.496605-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|JH0PR04MB8037:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ac55aa41-b136-4d69-d29e-08dc425bf905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	7C/fKVCkEJJZpZJsOW6Xyg4iq2aSUEZn1fBgtYYjhDRAbX0K1fKnm367zI11GVe/UrNpyGLxueDU2GxqyvoVxs4Q9JDuaYp5PZOqHDoL68aN15rgVKgy9ip8aERKVsx0TWMz3A6ZQ4wHCuN7/lZ+2V6BDq85CTmCmV6Ztl/CLbS2Z01fLGR/0KRIuw4NCPaZ0soA7ptg9MhkNL8Gmec2Jk5NvfraDvWcnaP8NkuATLODv/6omi20yP/0XGpAS0SD6sahcsvXucLppC8PN/osuR/uu7knkw3mfgud461o7+O22eHVsACAIUN9GeZ7rKgeOqzv2v4DQ+L2w+HpDcEbZ12xoOz8l5S4X3p+HJk/VDXfZwX+ILDsk4UBXRf3B0q8xLCrzKjQVXQHREP4ztlAP4fQda9+8uqX02QxZetkwDlIn47ZF3v1sDw0p+BrAnAC+ATyi0TYxsx+tYil8G8SBrDlhZCkagsa7W75D4hVsNGsXvh3V17f8l6HjNnGF/Pq+Rn6dx76xdiXaGjJLpuCrmdiaTzY49qUyoVNiYwGQrWmjaWc1cO1e8ifpf0vP84Jqmlepzk5I0p/VQTZilRcYpwY2sasCNl4Z5lLtIFc8YzQxNl0gtKjyuNEd0vETkc+Z/huqKldjlXF3FseLABKkuJdTXWQv1pg/wfSvsOrS0bUqzhwYwIkPpariiwwLi/i/yh3P2WRnVYOhB7i6DqHwlPoznZG6ESSymygBGnpY6dSvpQTbv7gEomez9AmW2L4
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(36860700004)(376005)(7416005)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 06:16:36.4945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac55aa41-b136-4d69-d29e-08dc425bf905
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB8037
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

Add power sensor for power module reading

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 4b23e467690f..e8d7eb7ff568 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -906,6 +906,11 @@ gpio@23 {
 		"HSC7-ALERT2-R-N","HSC8-ALERT2-R-N";
 	};
 
+	power-sensor@40 {
+		compatible = "mps,mp5023";
+		reg = <0x40>;
+	};
+
 	temperature-sensor@48 {
 		compatible = "ti,tmp75";
 		reg = <0x48>;
@@ -930,6 +935,26 @@ eeprom@54 {
 		compatible = "atmel,24c256";
 		reg = <0x54>;
 	};
+
+	power-sensor@62 {
+		compatible = "pmbus";
+		reg = <0x62>;
+	};
+
+	power-sensor@64 {
+		compatible = "pmbus";
+		reg = <0x64>;
+	};
+
+	power-sensor@65 {
+		compatible = "pmbus";
+		reg = <0x65>;
+	};
+
+	power-sensor@68 {
+		compatible = "pmbus";
+		reg = <0x68>;
+	};
 };
 
 &i2c12 {
-- 
2.25.1

