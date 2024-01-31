Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EE184394E
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 09:42:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=p6qKu4vW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPwX641FFz3c8Q
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 19:42:30 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=p6qKu4vW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPwWm4jF2z3bp7
	for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Jan 2024 19:42:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1MKELH089KgtTISardo9nOiJEZlLCUF8SquYgeJnplFmJ4tOdT8T0luQ1yZUdZVhYDWOqH+wKFbd9PrkJEjClPyMhR4BB9ptpv3db1wHW+F/1q/1BpP05ZqtP973u+DzrY2Fo0QI8U9hZvR7LYLKXtsgsluzo+g/2JzYM+rnPvMemcfm7Vq6F4QFKTT4f1rxTmpOjP8i1woyT/hjWxPU3wF38hUqcNVz/RU0/MOBN+SQ/OnlI+/2HkQcCW3J7BH8EZYkomSnx8vF9vC5WssdetYE8vjMfXsql6G+EbO3/pD9/525JGosewFqvghvsesd6Fbo3KPnzZC1B6m8DPZWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXS/IBxr+oV5K2cp3jW9e7qRwk8DHsYfz2fJN3Mk/J8=;
 b=WMoIv5Y9j8XhWMT/eTZJ4uOJkZYNwrGw9fXMUrBwT8ifx2G9pbWgrjCg4n7z/V2txy3mt/SAxR0J6cjiC+AnG3QhNXo/3oTK2971mFRHlNQnCMJ6UtKXcmKoH9kt/Pj6OTaP5eQKv9DoNbktbojq4T8eK1linCZ7x/QaJW2DugbOP2CiaIu+sfi+hVHQp1UCtp657vMUN3ivTUgvdAYML4OnvGnc6FXikx/sFDU7dgqzIPnxQCZ9rXzMiXCUBbDhx/pE7UaREuiWc/CNJPdOFCzfn6htNrAXVZagNfm4Ff0j0oymaG8oHkG9S9K/BXSj/iHZfVNOfTBajRItUQNOsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXS/IBxr+oV5K2cp3jW9e7qRwk8DHsYfz2fJN3Mk/J8=;
 b=p6qKu4vWmdbtNPYQV8YfG6cbAG6aQ1lknDJUHNUTlBEeO+5CHTlGnobsUcpjFyHBw6ezU72MrGMuXamMVtDlzq472xN/DI7tVO6qHcsXr2pRix+s1OwWKnyh6JNfjZ1YZtHcQUj7hxCc/swOFq90dNozUTi4YmcnfTFEcgztZ+G05kkjl/jzl315kszq1iAhlk8yg9RtuvWmPm6/q/A3gitS2AOmdyiZz2Nrx7ObJ9n4R/v85R0kc60LGB/VeHNG52k778Kxlnp3Vc2ETaHuReD8gpDoM1rkGio7hKb5DY32H55UwaSnXYnWPYNASPxhy7cKb0kIq+MGMFooZBv2Hg==
Received: from SG2P153CA0035.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::22) by
 SEYPR04MB6725.apcprd04.prod.outlook.com (2603:1096:101:de::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.23; Wed, 31 Jan 2024 08:41:51 +0000
Received: from HK2PEPF00006FB2.apcprd02.prod.outlook.com
 (2603:1096:4:c7:cafe::34) by SG2P153CA0035.outlook.office365.com
 (2603:1096:4:c7::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.8 via Frontend
 Transport; Wed, 31 Jan 2024 08:41:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB2.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server id 15.20.7228.16 via Frontend Transport; Wed, 31 Jan 2024 08:41:50
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v5 03/21] ARM: dts: aspeed: yosemite4: Enable spi-gpio setting
Date: Wed, 31 Jan 2024 16:41:14 +0800
Message-Id: <20240131084134.328307-4-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131084134.328307-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240131084134.328307-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB2:EE_|SEYPR04MB6725:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 66f84783-702b-43e1-325a-08dc2238784d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	/sIBq1GCIE50flOv/QOeQnlP5lxgcjK2GOoScOF3bayASQ4nCyU/nmvdS7nc2eDIgWUP+uiLZ7Nn9YF7B4km2aJ+7tL9p5R4EigJN23KsnbGj3mnpfefB32VtjTQxcBqLWUvElnBoEpBHyJx2T0NPDBlnace/t+P0e/sgQrGYk3ixQpNuR72Ku81fHzx+XPfEvWWmOfnQDfWCEYRIcLAuICx+YZu81e0OIbw3P5sTWojKAYm4ctFGsaAYZBFHZyJozl+GLfz1GnSvITpRTdYHIXwSp1OciD3QvmEGOlwwe8L4fcKOgciHHbcuQhM7klqcMDeggBshy5JuNfc7fZcOj1VqOR8r+1+EaIgbevzPUrKS12U3Dp5IIFsum3RR+7/+IUEM5PVqhavHijDC/CzQRUZp8sMWPJHTU2qX1Rf8bqkXa3Bo3D6YuajBYXHjsCaxmePD+VpHwasGuI7zBC4SCH9CcBK/t3plGCzUtsHVZP2naIyA5Z3HtzjXimC9ig1UfFCzHYyEWQ6WJr2V6B1ffHthBU51DLbaW4d6kxefPUpt7iswhSHI5U/jYUpspxQtwWH7J02TqVjlAjCRYIsm3dOX2ZyHX6imHnozlBtUIv7rDrHurFgHp3M1QLpifhV2FmA0JK1QeExCyysp1a9y9F76eo3oqVzx5+CMBDId7Mp+ayJ3P7Mz6QbzeILtMN+PFxsyHbSEpKZd/rE0ZlX+w==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(376002)(136003)(39860400002)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799012)(82310400011)(451199024)(36840700001)(46966006)(47076005)(6512007)(36736006)(41300700001)(356005)(81166007)(110136005)(70586007)(70206006)(316002)(86362001)(82740400003)(36860700001)(8676002)(8936002)(4326008)(5660300002)(478600001)(1076003)(6666004)(40480700001)(26005)(2616005)(956004)(336012)(6486002)(6506007)(7416002)(2906002)(9316004)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 08:41:50.0043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f84783-702b-43e1-325a-08dc2238784d
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB6725
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

enable spi-gpio setting for spi flash

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 6846aab893ad..ea8fd3ec0982 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -53,6 +53,24 @@ iio-hwmon {
 				<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
 				<&adc1 0>, <&adc1 1>, <&adc1 7>;
 	};
+
+	spi_gpio: spi-gpio {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-sck = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
+		gpio-mosi = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
+		gpio-miso = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
+
+		tpmdev@0 {
+			compatible = "tcg,tpm_tis-spi";
+			spi-max-frequency = <33000000>;
+			reg = <0>;
+		};
+	};
 };
 
 &uart1 {
-- 
2.25.1

