Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9751B7DDEF7
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Nov 2023 11:07:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=kD62R5mJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL2jk3svLz3cS5
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Nov 2023 21:07:06 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=kD62R5mJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::62b; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL2jG2RmWz3bPM
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Nov 2023 21:06:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpZ25wFj40yYsZOFrWcOdYBDc/iwsMaL3PvWTjl5vQpQB009YBEakSdIYQuL90owPGG5eprZEQS61YppPaQ+EzgT1rkpfndZfrj6s0meQFa+ycN1dNhCOPkpy7ADmIRAHFeQi1ZoWBebpXX7fcgFvkTmwUGG7N0bZ5twh1oZ7jWPGAaF+CItqrNMLOWt+ce11N+9bzzSSfwjdAlusOsa4d4hIoIE1bILwrmMIl34M9Ij7m0KSZTLhQ3h/16vF40NMzE3XBXMFvm+H6vdu4ISuy0LFDOWe/XtAblSeERX70yx++wRWDgDnF/9hWiaBUiTi89ij/A6ktY9ezgMtIeN5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vs37e3uLYionywV8nQy++I8XXaMF93EjkJaduQZOeZk=;
 b=oLPugBPQK3xzGAr5UnapKxFmmXYtm9rR0rzEp0HxuGEAn4TF4EGqDXD/3FTGoZDnK1IZLloP9mKb2YQ766FEezVonONiw5sfw5baFdKFlko65eITTJ3eWfdYTpicJHW6pwk2CpD0Wouxqbr/e4tPkrbFBe55eeYQ3QV7IAii1vlNi62A0C7Ub7mT+PyduBARm2NBhC/a0CpcANLLLCnF0/F9fo55uoFi38ZLiFDBbh5p18XIa7XvoSBtFL7oCXT7wN4F+fO9J3Y07eSw1pytaLzYO/EhAZBcTmSItik87EAvVNtvHkHhe+g0eQNEcO+yLqcmqgS5MpQ4x8IdGt3I3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vs37e3uLYionywV8nQy++I8XXaMF93EjkJaduQZOeZk=;
 b=kD62R5mJxFTO2Nc/kczNFFdc9fie3VSsjRscRnGzRf42EouiYKlfgFIjVRDx/B+PtAc8PQCFdJOn9D/ik4TeW17kL7147jBSt4NZy4XBN6MeU97vIjP6qn3vKfSZ/0/CTExUMxd4PObK8dyb7FrUdQnQvu/a9qeSmFtBfpPkYA5Nu6NQen7aT1burE6S5lmjV3e1KgEVLVsmVaGktl8n4pqxshfJWCXtGRGAKWYFrz35JAVy+6rZD0vIm6Ne4XsbvJhdoLjVOsBLARRdMQi1yngEhjUJBdzy/X3lnwWVcU3PYkwPKIzYTFLLI75r8krAgb6L8hKSz6ZwJ42YgNes7A==
Received: from PS2PR01CA0071.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::35) by JH0PR04MB7070.apcprd04.prod.outlook.com
 (2603:1096:990:30::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.27; Wed, 1 Nov
 2023 10:06:22 +0000
Received: from HK3PEPF0000021C.apcprd03.prod.outlook.com
 (2603:1096:300:57:cafe::15) by PS2PR01CA0071.outlook.office365.com
 (2603:1096:300:57::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 10:06:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021C.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server id 15.20.6838.22 via Frontend Transport; Wed, 1 Nov 2023 10:06:21
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v1 03/10] ARM: dts: aspeed: yosemite4: Enable spi-gpio setting
Date: Wed,  1 Nov 2023 18:06:00 +0800
Message-Id: <20231101100609.2516844-4-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231101100609.2516844-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231101100609.2516844-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021C:EE_|JH0PR04MB7070:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cc02f7bd-8253-4289-1366-08dbdac2330d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	BgV04OlS/tGbcnR8FgHuRFTwP8RIzWIY0hQB3gvfdgF3Mu9xeWGfVv+3j836QvgAJ2iX3+yXMuwTUsTpfG341zxJpmOoRy0uB6w3we+B/b7+8oEcpt21fnJY10xm/sqlFiqBPuz/eBGOVSNnEjvS8fsZuqJOPBaMI511eaeqstnYV00SA/1JEJSF+M/iE+gPeoTxXaIVZIWxvL12Yfi6W2HZ3CMrFpr+EtXaWqqr7KBrB8JEoIXHtys8she8al7XhtdP8T7MXYw2Uae6u+b/vmsEePH55Pm+XQsi3m2X4Eq6i5Y4TxYPQIWITcXaNN1O+y4kxbDo56DicYVDjA7ZiRoL6p+GRtfmtmJFWLhjkiZapVZG/LyhsFlUza92MTaJxISsVbYF2pWuxVvihRYwUYPhk+y1B0Ioi395DtA1pMkFJbLfcPsfFW14I/j00oWJ9uLpItFv6IVZpFZXu+oLbCr7BIroY8fiml2Qnvz48wRX+ETq6oYbZTZiiRuocT9MVtvascAlbZwJ7c4/0NCGtnFk0BJSfEN5+rDAvN+tYAcCu/2hNRxN1XHkH0Z4unenaUkbvMe1GZ1MhBmGnEDcZY1YIDt9zpsOJDosBsABIJz+Z7w1hcnKLWaRBgDUeIeqgFxk+/nj5CZoezb4OTEBkvLKwxWljEkxtCi43p6YuvCNgSOJT4RHcMD/MpZ59G/2acu7I4pOqBSGlNqZPrTF0g==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(376002)(39860400002)(396003)(136003)(346002)(186009)(1800799009)(82310400011)(64100799003)(451199024)(46966006)(36840700001)(36736006)(36860700001)(316002)(41300700001)(47076005)(8936002)(82740400003)(8676002)(86362001)(70586007)(70206006)(2906002)(4326008)(110136005)(6486002)(478600001)(40480700001)(81166007)(7416002)(336012)(5660300002)(356005)(36756003)(6512007)(1076003)(26005)(2616005)(956004)(6666004)(6506007)(9316004);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 10:06:21.5875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc02f7bd-8253-4289-1366-08dbdac2330d
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021C.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7070
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
index c540523d5588..20aded2d1be6 100644
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

