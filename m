Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E36954592
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 11:26:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="::1" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=OeHPLFuR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlc7f3vqhz3bSg
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 19:26:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::600" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=OeHPLFuR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wlc7c5gv2z2xst
	for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2024 19:26:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DIp0FpF9RlyV3Rhf85OCJI1Mmfr22JZtuOVXGYMlehV6rq9tRU40ugj6umKHULmlNfwze0DoUY1vlfZHM0x+eGTbVxt1SeRcCBXPB0BzAz6xJhdvgPaRVKSOHyjKGQGhS0XOlhCa0qFErxCbYeexwE+iH73Ztr/iZKby3J9JMqtcW02qxTrxAO4NwtDz/0wHLytvWNUTeiQ9RHRZwGWYGJ/ufRR/VXbCt/YID4OptLE79ylmPdJ+zV4vJALAzDZYy47BZ/acYc78chFpEL4eleJmzYQsbiVQsBINmYuFzQI2CHAuLYYugNYUjOePrGWId5wTjkeC2Zkfud11yMrg4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QU+JZ1MSglaWLSUKc8QjBu76ufZkEOMMNsu7ns+mPuQ=;
 b=hrZX7gNiPzd02SozpmeX9z9Dj9TI11aVoY6vYduLISbTSE1EcFd3+O1X3cY9TGoDw2PWE76uCClEvmkEGqb3Qp1MyhEVZDsPxH+5gxpgCCurScuaxBsA8I6Cteqa0g+6z4hhbJGayxOSxV7IaEjCPwlifhiKFYWSCG5d1MFsGXqNbFGI8SGPzZEujNFM57Yrxf49BXTAoDMhWcrgGKD0UiuO1kSXifXnFxLUREtemkKauCrCuT3S9zFh5dXrrzZl5SuM2rjmG19w1glHGVbSyC472bLNaw0VmiU/gDwxhu5zPJ1BpYAnDjHaH26VEglX+5T+DmibPcc37IMk93swdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QU+JZ1MSglaWLSUKc8QjBu76ufZkEOMMNsu7ns+mPuQ=;
 b=OeHPLFuRnNqOpsuS0j6JyFwrUUKlmjuhWfWJSfsyTU01xBfwKycbadNUlJT4lmIJsEWUQpteVP6au2puYD3P8gbUDDqhK3cz2Ij4s7Wc4r4vn4tTadNcDHTeJGRyjWzh69ozcgjfuwaOUFydP2aBUwArsJ/vHdC6tX2Pc3Rp6hSW5GlK1RwJ6m20TYj10gQEn7P1pQWeXgGk1XpfuUbkdGWbr07b9cXmuP9Zyz4/CyxwZW7FV+xOwxyTf2c76gl2jI1wKJXZ0F3ZO3Khh5wwXy364Sc9fQXkX3aHv/ccwB2sNgGMQ0hWcFi6MPnXnm/94KTUOGmArQySEtwsYVLBww==
Received: from SI2PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::23) by OS8PR04MB8277.apcprd04.prod.outlook.com
 (2603:1096:604:2b1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.16; Fri, 16 Aug
 2024 09:26:12 +0000
Received: from HK3PEPF0000021D.apcprd03.prod.outlook.com
 (2603:1096:4:193:cafe::53) by SI2PR01CA0042.outlook.office365.com
 (2603:1096:4:193::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19 via Frontend
 Transport; Fri, 16 Aug 2024 09:26:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021D.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server id 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 09:26:10
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v12 23/28] ARM: dts: aspeed: yosemite4: add fan led config
Date: Fri, 16 Aug 2024 17:24:10 +0800
Message-Id: <20240816092417.3651434-24-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021D:EE_|OS8PR04MB8277:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5e780fe4-93cd-4b77-8fe8-08dcbdd57799
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|36860700013|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?IxkUa27tSr+nvSJFa1fwuiOXo2F+S+KDHuc//6GHZKLVusjAoQpkw0dSYEEK?=
 =?us-ascii?Q?y5+VkPYIDj7TXSXzqb/SvkzRXAUf7I2SIs2RTEV21DkLdSm+3n+nqt72zisF?=
 =?us-ascii?Q?XUeHHL7/EW+wTkn63f5BSXgj7ODRAQfwbTDYJCzpI8xmvjL8kXVw+94SikLr?=
 =?us-ascii?Q?HZn7H+5VRlDucpCE2g+ykuKersMWxMls4zYgeS1wY5n5pBQJ7x/zp0RwazWN?=
 =?us-ascii?Q?8s07tEZOCQ7oVGMBmnSne17jHe5WTRZ5HxskwEFlUA/AFBNNdTUTflzegaXK?=
 =?us-ascii?Q?vX9dXk6ALG8pS9YUqJscsKKQc/Vk6RmLLfuD7lpmAFcRxF1eMYQX6wGekI8C?=
 =?us-ascii?Q?KYLGBN40r18yHoopj+14HXf4wLvz4Bifd/6A7P1iEjyLg4IYvh8yNCrr5ywp?=
 =?us-ascii?Q?5GI0rrGvWMomXnY6MVHiG3UPaTm3Feexb2S0M5OAoeWMFcm/ZH2h8vZQ/hmr?=
 =?us-ascii?Q?XlzJUg+owuHSpGRk30KHjP8sFyVXfmVtdahQ9ZNL8FWBZTXWKde0ylrqNOaf?=
 =?us-ascii?Q?WXiflu8MmBH6bzZzvY1l426dKkw/+0gi87/xIdL7MJiINkU0cauF2jZJa8vj?=
 =?us-ascii?Q?4fD21d2vv7vEBHo5ZSEbm+eXrbCIbdz8Io4K612dWAysCAjiOPn70yux2kYQ?=
 =?us-ascii?Q?lac9flsx9MgimPFgsyFYdFhAqNMP0apDZY6/WrzNgD2HtnGko3qliRJDhcST?=
 =?us-ascii?Q?roSkSE02QHXdSLyKh9nNSLZJlrDxBIIjUcmggHOZnWkrtjoMmlcwsDwRKEHD?=
 =?us-ascii?Q?o22NUgtZd/7GpxhukfWT73H2XBb6RIQd7ds9FzCC56XK/s2mX9ncfChAIUE5?=
 =?us-ascii?Q?L6OJc9v8MVeAB7vd9o7DAm44cV2LNizeImcGRD5XakWDHa+cXHgpnGaLLWMe?=
 =?us-ascii?Q?Lz9ef4obd7mYVgFaP19MPbGsDdgNs0qOHErt8+TqlIXIOGdW8/rSeubMUnk1?=
 =?us-ascii?Q?pv7ZlmqTuOys4Hv02MafUqd9f63XXaSM35VZW8LoYh5J2kMeqZQo8bQTCiJk?=
 =?us-ascii?Q?a4O6wlL1RyZ9jVK4PgOe/9NvCc5hx/VF5uRB/7z7R7B09+1sOudzTTwxgYsj?=
 =?us-ascii?Q?NT7MCuoO4nzIX1FWPpi4qBBLZ7DNYGu1AiL0JpFn78V3OYKSXTUmSVnMIabb?=
 =?us-ascii?Q?iaU5LIbWvdPoDDUBZFWulD0yMJOmi979Mr04nzFE5CC4kTQv8Mz5n7xBzI6J?=
 =?us-ascii?Q?kTAMwtVuOPg5cMSoWV0kt/tLknKxPhLUAvgGUJEbu4stzb92vTvx/7WKAQID?=
 =?us-ascii?Q?gkdyFUUQ7091CNhqbUn1sBxj1Cne+qcUaKJifclcxtoqR+Hh8obHEiXrDLWb?=
 =?us-ascii?Q?eC9FEP1eK781/99wot9iOwqak/obeTSekmN8OIePhW+q3Ow+zicXKMQG2PFy?=
 =?us-ascii?Q?t5th4dRee2RhQFjFoSFkv+W9I4BDjAqTfCSk1CZRktGhAK+XDAbHdZdiPtaR?=
 =?us-ascii?Q?nSPh4QeQJHfTubvGGg/+eTeNDGHW4OSd?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 09:26:10.9816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e780fe4-93cd-4b77-8fe8-08dcbdd57799
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS8PR04MB8277
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

Set fan led config in yosemite4 DTS.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 152 +++++++++++++++++-
 1 file changed, 150 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index c940d23c8a4b..2f4e9c5edd5a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -75,6 +75,154 @@ tpmdev@0 {
 			reg = <0>;
 		};
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		fan0_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio0 4 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan0_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio0 5 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan1_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio0 10 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan1_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio0 11 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan2_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio1 4 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan2_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio1 5 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan3_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio1 10 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan3_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio1 11 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan4_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio0 2 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan4_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio0 3 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan5_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio0 8 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan5_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio0 9 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan6_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio1 2 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan6_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio1 3 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan7_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio1 8 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan7_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio1 9 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan8_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio0 0 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan8_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio0 1 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan9_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio0 6 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan9_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio0 7 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan10_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio1 0 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan10_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio1 1 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan11_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio1 6 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan11_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio1 7 GPIO_ACTIVE_HIGH>;
+		};
+	};
 };
 
 &uart1 {
@@ -1198,7 +1346,7 @@ eeprom@52 {
 				reg = <0x52>;
 			};
 
-			gpio@61 {
+			led_gpio0: gpio@61 {
 				compatible = "nxp,pca9552";
 				reg = <0x61>;
 				#address-cells = <1>;
@@ -1268,7 +1416,7 @@ eeprom@52 {
 				reg = <0x52>;
 			};
 
-			gpio@61 {
+			led_gpio1: gpio@61 {
 				compatible = "nxp,pca9552";
 				reg = <0x61>;
 				#address-cells = <1>;
-- 
2.25.1

