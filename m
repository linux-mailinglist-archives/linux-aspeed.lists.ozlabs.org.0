Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D4780BF5E
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 03:50:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=1825T69W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpR7Y2GpCz30Qk
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 13:50:33 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=1825T69W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::609; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20609.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpR7K1jcQz2xYt
	for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 13:50:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TrW2WERdnKa8z62fwRoQMsLMQ3GCylRL6Pg/4HFRTzH40AF8QyXdDCuKu5RwjvYxn41zobfv4J0oCEJfKU1CLQGi+Ms29Ytq0UiswenvCnz7afQbu35yISBGwvL1yF7kKBu2bwGW8rMrHLx3oKneAU6lt5xpY73RAdrRRc59/PWI4alMZ3yng29bZvNWeZQnuOjBZ2PAuhu7mW7SiIfXJgaktdy7Loqlw3Zhm8Y7EvR33tzKFoTsLrFlhPr9e7ruCazcTe+6FXdX/Av/2llZfh7B8i6iHDTbUHODwUs0cA9MbthIOaa7gNtWo/sV/EC82fSB8j4ptgWSQH7wJHL5uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9POU9qli8Y0G3IvdZsP/n3F+xvU76du76ssEtkRE+ao=;
 b=DH2xZs5cIJYoRglhmQQWQBIJjmofTiJFqBc7/msfBg/HCYMkY+DDrj2C8HfpIabtIQgHPFjnvvFPsO8bWF3DRABDhnLbcMc5IUOQUhU3slr0W0nDN7QCxrfDd//3fWSKgVsqM+KduJRFoVmGb5IXNrSsqBoGjC0T0Vl7qnN+PGFWJFI7ywMisS1sBrqhPecpgJNpeYh5r47oA68kK2dY5dA6jDBv13YarjYYe2kXgQ2K3yUor8uMO8ZT3yqCbdevp4zfo6QWyyFWnfadt4DBQ+qcOk7kFtIArP99eXfUe8OXGrzsHT9wmpLMyaPr2qIWu/p6kzz/i2xf+orswmon0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9POU9qli8Y0G3IvdZsP/n3F+xvU76du76ssEtkRE+ao=;
 b=1825T69WyCAHi/51p/6GE2HFEypEfEFabZYpJI+p2mwzykVdhtdmnBjrAZJoznequebKJZAMhvK+9K2bFhuz4uv/jkNd69zfYvNTdk0iLMOVwNwkFXfYDTod8JOYy/RivfMxCNZb2wxXPMQaI8lPygFywUmkUR5Ju1PFRzuyxxk3v35RKsr37Wk7Zcrf0wwgMm4VFBrHPKLLbYv/aIVX2WgTcALKJQYJW/MH/llBvWpl2FWAsYuxSDvBFJ+StRJTxu+Sc9J4TBryEU8ydocXgH90al3vbhI4R/oZblBLKXzBLESMLBCh1TnweyJczY9msqh2R4GjL2JNWtfm2c5e2g==
Received: from SG2PR02CA0047.apcprd02.prod.outlook.com (2603:1096:3:18::35) by
 SI2PR04MB4122.apcprd04.prod.outlook.com (2603:1096:4:f0::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 02:50:03 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:3:18:cafe::e9) by SG2PR02CA0047.outlook.office365.com
 (2603:1096:3:18::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 02:50:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 02:50:02 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v2 03/14] ARM: dts: aspeed: yosemite4: Enable spi-gpio setting
Date: Mon, 11 Dec 2023 10:49:34 +0800
Message-Id: <20231211024947.3990898-4-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211024947.3990898-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211024947.3990898-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|SI2PR04MB4122:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 81e4f611-ba8b-4329-71d4-08dbf9f3dff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	fKZuz32l/uUZJGqDYlkB+k/0m8ltjWdytdPyS8jDP/2jl1izVXGNSXZ3Xmae0AFqJk+DI/OTmxiL5KNKEwnRUphV9tZTjWntwA1jDsT/WfbBFkpdXyD5VqxpBVyR7AeFVcjc7QXECB0mJnlt8X0Gs17QE+Z31so6xrguOTy+M+L3/Fc0MCBKU2AsqW4xxgeHyUsIKPb6J1cK7PhVUNefvzL6i7z2hwOTOveNqU+19Epxz9b7NIheqN44xeBuNjFnEa7P5lR+nIhen93wHtiNUl3KuWwR9TW60YCXCPFaBeDfDAiKbt07COIr0p0iuJWc7n/fvSlxoSygQ7sG4Tb76+YpEOh0s9t7ab4nW4Bi0WJ4P2VCGNWNMobHlMGHQLaGG67nazcKCPqDv+UvYbqPfeItpSBwrLb+1urxsHOff5u54dqREUHhZWBtCpqckaCQ5U5lOJiSuqsXx0YD1te+SvGpwNUma0gtKuRkNkxyijrGLDuLztS7edHMjBkfqOwZWccKzMYhecQysf8qILpr97IqnWADpMHCgTyvjZ8P+EhI2D7qbzwFqc8yE3XoOmRoFIBzTCwsclBsY2v7FlVHXAJpx7jJW0JiIHvG82IQgDDc5xUXVGv9UBL02eUFNSyd2QAMX8djgeZgqBpXkI0akUaraS8V80rH86mia53IRxsM0qClkBIMAt5chLH3z0vfI6tVYlN0K/fa6Ovoq+8uyA==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39850400004)(396003)(376002)(346002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(82310400011)(36840700001)(46966006)(1076003)(26005)(956004)(2616005)(336012)(6506007)(6666004)(6512007)(36860700001)(47076005)(5660300002)(7416002)(41300700001)(2906002)(4326008)(478600001)(9316004)(6486002)(8676002)(8936002)(70206006)(70586007)(110136005)(316002)(36736006)(82740400003)(81166007)(86362001)(356005)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 02:50:02.6399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e4f611-ba8b-4329-71d4-08dbf9f3dff7
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB4122
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
index c32736fbaf70..0449a7e36ff6 100644
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

