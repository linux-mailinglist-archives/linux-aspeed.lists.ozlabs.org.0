Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A914F827F39
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jan 2024 08:22:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=mTQVEWZ9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8MnR2q76z3c1C
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jan 2024 18:22:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=mTQVEWZ9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8Mmr514mz3bnL
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Jan 2024 18:21:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YW29uJX0gtZxkEFJy9EtdYAXJH30JNJzbHBgQq9P6Y0wmnmarPvvxYrIAi4agzuEHYGY1NV1l1emTHAR6c0cwB4f+9AoprkJwRqECkvth9UPBF+jq6SIUGCpIcHyCmJMpsJ3OZptIeLkC/AYGF104CyXO0MXgi8xzN0/wi0qL7zvSIxJwhpRarPBUpyg0llrNEd79ybWH0BWPaQwdhdJay1RU0sgiA8FUQysgpHOm/asZdEJWYj4RCeRiRwsAWkD2Da7afJYBlGsXi5vFJXXdlNi5VWZqWxSFnXPNV28a9t4Vnu1E+XI6vr8clJk50RaZQPF2c9mfeAlxN88x1hW0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyfzsiMTiBll4ouoSSuk92xJoh4krtds9VMlLuTcNyM=;
 b=j5t18rXk4dwSK0akkJBVR2zx5fEaIlnWkeocq9YoxuNdx1rexPoI3MAq2kqtVpfEVWs8s9keixc/QzX0f4UeBa/HPLDPr3BjOwNDGXCG9A64WBt+Z2/0VIGcKUfcb5NQ6J2rIBRyg9Lu2kaT3p1nPrNGjx+KNgm4w0AtgzKVDJAs3O+qqH2UMt3WfbOBN5wPYgxrut3mBHS0++VVE830pkoWT5Vu5Lq2gNkb10O+cg9di7VzupC5vZ2kQLMVpkSYoa/AaeaFCzGLfll1TdVXiFiaE/tBDcVDOFxUnEZbYwVguuDoshcgXTUz1BqUtm7jTNTe3iY4WITOKR7usqacAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyfzsiMTiBll4ouoSSuk92xJoh4krtds9VMlLuTcNyM=;
 b=mTQVEWZ9cZrL3SyjJ49EbUvHsY6zWqLOL88uGDZ93grlvTS7kZq6Y7L6mqhOFt0x0QX0lSval+s6mWK+HxBjJSlb/urnLYAENZY4uWhWWm3vLadKWZvdcoN4Mv1oEFwhFnTNCt7aXlBmIFxDjX8AN3/KCSrgDCIA/K/ckDJbL3JKapP1u2MAD+Nh/JRmav+/cgPEYpfIE9LR7zXboqrS6fOp+G/7eHUc5drBYbDjGpCUPFahIA44Wwgrc2VINItLn5n56Y92S9mmYrC1C6dfu0JvEPKomifAMol6FRXpf35rhafvF5eqS21qX7ir5dclEn4JAltQZKPyV05bN8KVCw==
Received: from PUZP153CA0015.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::13)
 by PUZPR04MB6960.apcprd04.prod.outlook.com (2603:1096:301:113::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 07:21:11 +0000
Received: from HK3PEPF0000021E.apcprd03.prod.outlook.com
 (2603:1096:301:c2:cafe::37) by PUZP153CA0015.outlook.office365.com
 (2603:1096:301:c2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.6 via Frontend
 Transport; Tue, 9 Jan 2024 07:21:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021E.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server id 15.20.7181.13 via Frontend Transport; Tue, 9 Jan 2024 07:21:11
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v4 06/19] ARM: dts: aspeed: yosemite4: Revise power sensor adm1281 for schematic change
Date: Tue,  9 Jan 2024 15:20:38 +0800
Message-Id: <20240109072053.3980855-7-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240109072053.3980855-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240109072053.3980855-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021E:EE_|PUZPR04MB6960:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3b8d6f51-c935-43b9-8033-08dc10e38e9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	FLL8TBA9GyluXchd/T6fe5a4GYQTswe8luEdJwLqOQS+xl41/lQoA5yZZq6CKkylUSvBHMg0fxUjS8F2zfHVcGK4vYU9bgHbRTMkkDCEQC92DQqwBQRpidVxF52om5Q5IyrCbNpoFlCK4YxcvwT16q28QDLySosA7iAFNroBP5aWClsmCef9cOQdLpf4h6ArTcZkKAHJOBy5Jt2hDx4gzVbTWNaJJSgkKWh/q/6eUFWWGDCpcQe0xIK3w5218eRBLt9HOaewLesACFIjJ6qJiuO/CaeVOjhKxr5/CCnp/SOyMa+esUt6FN+TWtCyqDracrI9GsSCrpLXc+nsePqbDVaQ1kyhqlgXO39R9bGef/7yL97jMBat54jpxfb6p7D4jq4JxyyBIwClnB47wEv18kaWoBaztXquewNidOcNIEKAc8ABJwlc+8QRsNleEQ7bquAjDmBYEZMNi77KAm/A5HBVVAULjecdQGvrXx4Xdi0xmSWq0/Re2lIrbawx/uCDmCYsW5E55DtznuLjSUryWKETqw/4MalvBWe05qkWP4VbgSMrvGGKId42xm93lnklFePGoJqbKcTQQixC0PwjHhhxoWaWqcnnShHa4CJLzeBJ4XgmqhybWqaQMIVopbzTGjvT8xw9+fOH7RnaoIPtfWonaeV015NC+b9HxWoL53dB10tb1aFs+fz/h3vH7zXA8RRk813m8JxdiyzS7f/WQA==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(376002)(136003)(39860400002)(346002)(230922051799003)(82310400011)(451199024)(64100799003)(186009)(1800799012)(36840700001)(46966006)(9316004)(5660300002)(8936002)(6486002)(8676002)(4326008)(7416002)(316002)(478600001)(36736006)(70206006)(70586007)(110136005)(2906002)(36756003)(36860700001)(86362001)(82740400003)(356005)(81166007)(6512007)(956004)(1076003)(336012)(26005)(2616005)(6506007)(47076005)(6666004)(83380400001)(41300700001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 07:21:11.3978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b8d6f51-c935-43b9-8033-08dc10e38e9c
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021E.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6960
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

Revise power sensor adm1281 for yosemite4 schematic change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 23006dca5f26..af9f7067c57c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -176,8 +176,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -193,8 +194,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -210,8 +212,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -227,8 +230,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -244,8 +248,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -261,8 +266,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -278,8 +284,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -295,8 +302,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
-- 
2.25.1

