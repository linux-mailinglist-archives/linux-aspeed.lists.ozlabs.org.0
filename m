Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C2380C0E6
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 06:48:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=mmOHL6GY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpW542RJcz3bqD
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 16:48:40 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=mmOHL6GY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpW4v34xdz3brV
	for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 16:48:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOURqCWWzji3YwMVqlnH0ATEAwe2buvWpgNyYh73VgsYiOsoV3t1uY6kznEZ1lAXcpisHbFiRODmJrzkV6MS1r+qtHoxYcH8GDd7A06GRZT3eTEknoBl5qZPuAk9wl1E37WRxyWMFoDjtzEzabRm/LgGKSQbPu8aFKu19ARZxJrWYs9cvJm8lTurmipbyyr/LLzwvDBUL/C1z4U4nPpxlqtsgc/hN1sphClr3uUCvG5QYA0IUMKjjHOBO0DBOVXSpkotmAnmY/H2TnZPldfewynHpsfhkkFPTkoltv909aLLVajBcnBmrK4NLEYiyjEhgqOpE4KkhFPHPBCwtSZrYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83g37U5JYMWUOI9fyNbhOqOvY47pyGOSPX4Hsoy3xvA=;
 b=jaY1sF8+MBjLjF4KQduGIYqpUULod1uvIvpsXOY7xx3ZAutpseYAX98U7LL6QYsOBp/8FgyZYU+u1HKoHilrEGBwan/6tCFf31ueaitqmyVrLLrZCvaSfbTT13roUzWYuyP+DHM7Y7Fd8YBMqcju6DHmOkoSrCUlLxtfFm3Gcb5hH7jKKqHaylil8zBjwtPAcf6HgCa/t1T33vQHkxqIQ3jJd90uLs473azimWAsLe0OBDxCBPX+7Q4k1JqY266Dy2pGBZZsVlkk8ir7Zks3M8o9G0df1l8Beowj+0SKsxCFsB/WMn65dgDc4T3rPjCzRA+vBxg/2mQRnwIWyOGsEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83g37U5JYMWUOI9fyNbhOqOvY47pyGOSPX4Hsoy3xvA=;
 b=mmOHL6GYZVFak6fM2EYJkkECSNAY27usC2stNTE1z54/G7SSK+297VsTaxDuPWmdBnkA6vE+2xyMS/I/Y7M4n7jhuBhOXvNL9QyBnyDPvSKekPMzoCPj53vQ1w04xYLIvsKrxHw0mKYNrHYAWgvJ0NyLR7rvXH3iuK2JkGgSD7Vhsuwuv47TbujJSUurD1yyhu5I+fMKWIatXPAZ2JPYEKvgSK3PrP4Vm9GWx9dCAv2juD/tWETMDMmzCnol0Rrzn6v/Z0mo9Y3gvrFRk1tMB3lhBNH4YsESILwVjdJ7irTjjmCH3A5qE/nABL1UNBoY0UBmnqTgrjAMuwJclZ4uyQ==
Received: from SG2PR02CA0058.apcprd02.prod.outlook.com (2603:1096:4:54::22) by
 TYZPR04MB8299.apcprd04.prod.outlook.com (2603:1096:405:dc::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.30; Mon, 11 Dec 2023 05:48:13 +0000
Received: from HK2PEPF00006FAF.apcprd02.prod.outlook.com
 (2603:1096:4:54:cafe::11) by SG2PR02CA0058.outlook.office365.com
 (2603:1096:4:54::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 05:48:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FAF.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023 05:48:13
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v3 09/14] ARM: dts: aspeed: yosemite4: Revise i2c14 and i2c15 schematic change
Date: Mon, 11 Dec 2023 13:47:24 +0800
Message-Id: <20231211054730.208588-10-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211054730.208588-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211054730.208588-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FAF:EE_|TYZPR04MB8299:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d7c4ca24-7c07-4fa0-de9d-08dbfa0cc3d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	hR9Sr05EKlV4GNOW44b9TuTBpBF162vcv4ziQyRe85MEpU8Yp+IGHkDe8zLXNdTGFc+HcQM6e8epFa6EAlgfeyhhkmsPKhxMD9rT4YyQU7WEIg2TE6Uic1BX/yd2g9yfFKAwSA4j6XeG7fD3S7/cP/sv9d/bVqluoNJGbvA8idJm1H9Y3KEIPxX6YCfAoA5J6ERGbbDHrj8GfX8AKZPHJcBoiQ8QCb0/KKQcO6XE5gOvPPBBM4QYOye93OnjK9HoHd6t19eLp0/Iae8juyFgZBGpTgWBnPMM/YJGLfohwiRWV3hAoF2aj4mfKyr0SJRaAg2u+dfAZ2Hkf3yjlj6pFnG7rCDbLE4WKUh3q+1BSWaC77AO2d7c1W8UsLHGcPUBiQQhY4r7yk2/jN4e5FRbFxOGKN2ZSSakXl1Ghs1PSjFc5rJmLyt+04CFD+V0U9webQO0NGWnWMegQQZc8nj0KpR2q0kOlHrlgrYTbgBudiPuhGvRc5awBZwu2q2M/EjuLm3ZQUOzN7HFnJU5SexYdy8D1j2yepbUhSfiDcMZORJyQCK+41HXpS4KDn5GwuiWOkRtJ8ZjpsiVJpF4qdKs2c3aGioD8kKFWKTwmprLgf6Ccp1E6IuapkQjQbuRdUJKo3tXTMueSqvN9R0Ue1m4kCHANd4DHLRt5Gw6x/XHMwImb+aEbsuS/mbGjLoFozXkTLryqLnSA3SKEYDdYXB3lQ==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(346002)(376002)(39850400004)(136003)(230922051799003)(451199024)(1800799012)(186009)(82310400011)(64100799003)(46966006)(36840700001)(83380400001)(2906002)(81166007)(478600001)(356005)(41300700001)(82740400003)(9316004)(70586007)(70206006)(7416002)(40480700001)(6486002)(36736006)(110136005)(316002)(6666004)(86362001)(4326008)(8936002)(8676002)(6506007)(6512007)(36756003)(47076005)(5660300002)(1076003)(36860700001)(26005)(336012)(956004)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 05:48:13.2666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c4ca24-7c07-4fa0-de9d-08dbfa0cc3d0
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FAF.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB8299
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

Revise i2c14 and i2c15 schematic change:
- Revise adc128d818 adc mode for yosemite4 schematic change
- Revise ina233 for yosemite4 schematic change
- Remove idle state setting for yosemite4 NIC connection

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 31 ++++++++++++-------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index ccb5ecd8d9a6..ed2b1200603d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1010,44 +1010,54 @@ &i2c14 {
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
@@ -1217,7 +1227,6 @@ mctp@10 {
 
 	i2c-mux@72 {
 		compatible = "nxp,pca9544";
-		i2c-mux-idle-disconnect;
 		reg = <0x72>;
 
 		imux24: i2c@0 {
-- 
2.25.1

