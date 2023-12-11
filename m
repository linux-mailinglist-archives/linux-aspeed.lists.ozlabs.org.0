Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2133D80BF71
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 03:51:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=YoNqOFWX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpR8Z4K4Zz3bvJ
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 13:51:26 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=YoNqOFWX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::600; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpR812ChXz3c3w
	for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 13:50:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7bJF1aEg3prR9YDWmEZ1uYPdN1l/stcffvEMuDVqnPwujR/hsNGIsw0tc7Nal1mrFozBVkTetbU5kuG/auYBimiloO/mJuoBYqSLejw7XOlyxr0JXLz1vxEE7sn7zT9co5Alligmj+/KdJJoCatTDtiZyKLqJWNhwlypvpet5TsmEyiwVZYbn/lpThgCM4yWbEa/WCqMSKCzZi9kJs/GYPBXhG8s4kdbm2rtEBg0WOnP1ITazisiWrtj+ys/jhyY+AW4yBS00x/BzQD2F9AW1hDpT3T5ODX47N6uZQ4RnOKXU463wG7pM9B2XlsKZlAdIF075gs1I0bY0tctUbWzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ngrZal1T5zKIoze4a9wDrSNcGDO8QNLgbJOqp4+OZ4=;
 b=DPv0y+6171RBacLULCN9kCKQo76r9+xQYRzOIgnVPZm0VlFmF5CzzS++bG59TU5cz8Xt15iRKLWEkfH7MDMR9gpwLQBtzCscTfrxN+6hAMUyK4BpoyvUA1yrgxtT9mmB99J0i6TUEkRqJ3bfqPd6BfReOCRuxEMnXGdnFe3xYJDbTUdLv7aLb3jcbKhQvr4dlqy4kmRaneYyGPdy65SYKx6jS/AKrxnV/SqrMOCx6e0zsDjX3i/RYUeGBiaOvYHfpNXXb5uCE5ry9oW5dak34pZw4ymbl8y+uhStAEDS9YSIUfRkjjLvxM9bD5M2Ru7aV4pVjDzEnyMpYQY7JM+pxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ngrZal1T5zKIoze4a9wDrSNcGDO8QNLgbJOqp4+OZ4=;
 b=YoNqOFWXxpeH6CI/O486oDcV3CAnu2fMUH+z5lBN/O/5yJFEOd4WYEsKVzJX9cxl2tLe74L8y0SH/JaSSvl/ExVuOEcTbBXlcelUdMfSZPsOmOIwrFhnstah6OgM69k/4mTmAIspQUYNzvQucroCQGGr8w6YeWX/IXVoLJUO7QVIAI0Q9xXhUhYaaQCIdITn7y8bl29XV7BuHjHDmUAMbX0rf3vFUtrNXkpV7NtuQBvU8djIDr+EUNLkpEpn5r3SInm7GWsLQ6ttmLdn06ZNnAetbgTIKBnIuB9AwWz0s10f2Y/zvqYFmVNW5f4c5+H0QJcszAcUWoJ61KHpRgjzeA==
Received: from SG2PR02CA0027.apcprd02.prod.outlook.com (2603:1096:3:18::15) by
 PSAPR04MB4424.apcprd04.prod.outlook.com (2603:1096:301:3a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 02:50:40 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:3:18:cafe::99) by SG2PR02CA0027.outlook.office365.com
 (2603:1096:3:18::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 02:50:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 02:50:39 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v2 13/14] ARM: dts: aspeed: yosemite4: support mux to cpld
Date: Mon, 11 Dec 2023 10:49:44 +0800
Message-Id: <20231211024947.3990898-14-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211024947.3990898-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211024947.3990898-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|PSAPR04MB4424:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 86a33ad9-a6dc-4258-9563-08dbf9f3f5d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	lVyTGDRx4uVAa4QSg9kcEqVAK/4ZwjU42oPZ5p6IghUqCseGY9/NuqrmBoEgNKbt6qZR38iW5m0nCExxhMkx1dLQdDxn61/T3f4qhox/5jAEp4v3OAys02ImMaidaua3f/5jL86k2ToCLMs18jJw6qHi1GyQ+h/aStsprKlKLj09ADnhkd7hDjRJqPpcQND0yoeV5IFgnrek1RWgs3EaeoWBDx3QBGa5KMj7L3sK3bt8t8J6R1/yZ0FcA4rPojyqyEvxvjdh4soaY6s6pEj0rEpMEgTC/T6SI8eLxsdiTKQi1G6BPUHGlPVpG1kKLejvxhAnQMw4QGESirtPB0mlOp7aewsvDOHYMjtlNNIhn59O5onJGQyP3y++u50uTxDRUq0LSSnipmHtcTgfDfoL/icseNCotXBpTCrzMXiTxADH2IVs2aYmn+XSf9ebfPwZ+yPekGm/fMgvtVFh8bIXNMraP/8rM3d0RveIuWMp9vEfOH+Mme5cVDrVwHiOIlFp3Asd7nMpdZ/DZL1dVj4M92Vv7ZN8QxteXmJYuua8UL5BQwkm3Htu7onSsDfrMfmyVM394P/zR0Zgn6i7ZuAIoa+FGr0jBJLg85M8yuTtL3B0IZLTCMcx+vZ3fQjd2DaMx26WBLAjBmQs2l5OiYDvpUytKbX9krczXb4crLqIi5mlB1BmYssoUl3IsPaRsLRyEXWLJ0+qMQDsxDDCkZaz5w==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39850400004)(376002)(136003)(346002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(82310400011)(36840700001)(46966006)(41300700001)(9316004)(36860700001)(47076005)(2616005)(1076003)(956004)(336012)(26005)(83380400001)(82740400003)(36756003)(86362001)(81166007)(356005)(5660300002)(316002)(8936002)(4326008)(8676002)(7416002)(2906002)(6666004)(6512007)(6506007)(70206006)(70586007)(36736006)(110136005)(478600001)(6486002)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 02:50:39.3279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a33ad9-a6dc-4258-9563-08dbf9f3f5d5
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR04MB4424
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

Mux pca9544 to cpld was added on EVT HW schematic design,
so add dts setting for devices behind mux pca9544 to cpld

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 64 ++++++++++++++-----
 1 file changed, 49 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index c8e3a85b7a11..fdc33bffd467 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -36,6 +36,10 @@ aliases {
 		i2c31 = &imux31;
 		i2c32 = &imux32;
 		i2c33 = &imux33;
+		i2c34 = &imux34;
+		i2c35 = &imux35;
+		i2c36 = &imux36;
+		i2c37 = &imux37;
 	};
 
 	chosen {
@@ -951,24 +955,54 @@ &i2c12 {
 	status = "okay";
 	bus-frequency = <400000>;
 
-	temperature-sensor@48 {
-		compatible = "ti,tmp75";
-		reg = <0x48>;
-	};
+	i2c-mux@70 {
+		compatible = "nxp,pca9544";
+		i2c-mux-idle-disconnect;
+		reg = <0x70>;
 
-	eeprom@50 {
-		compatible = "atmel,24c128";
-		reg = <0x50>;
-	};
+		imux34: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
 
-	eeprom@54 {
-		compatible = "atmel,24c64";
-		reg = <0x54>;
-	};
+			temperature-sensor@48 {
+				compatible = "ti,tmp75";
+				reg = <0x48>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
 
-	rtc@6f {
-		compatible = "nuvoton,nct3018y";
-		reg = <0x6f>;
+			eeprom@54 {
+				compatible = "atmel,24c64";
+				reg = <0x54>;
+			};
+
+			rtc@6f {
+				compatible = "nuvoton,nct3018y";
+				reg = <0x6f>;
+			};
+		};
+
+		imux35: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		imux36: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux37: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
 	};
 };
 
-- 
2.25.1

