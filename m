Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FFE95E89E
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 08:26:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsggW6SSfz30W8
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 16:26:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724653605;
	cv=pass; b=a304snZ8aAqcFykICsJtuuRiqBFQtod9N9vInnXg5f1G+K4RLmS8DEOX92kZ2/nlS/XTJbctlVudz/AHaeC93rjwPbwwGfL9kJUYS0YUWcFVutmy4vVzQe9usRjrfEGrqGhekAF22jTR/CMexLY41keLsbXJaVSTRBh3mkWlRlEFMV/Q8jOY7UK1MqS89E/tub6ibhrnIVcEPKBGw14/p+Ikf5OEl2GLWl5QAbLurzqDnen0TuN2bUM38OZTx0+ELpl14duXz2cI+3YGYqdBGtak6kdy3Gac7pZs+9c6SAWSbxuSzNFAsI2KqXGBseA7RPv6WcZHQ+A3jaO/fsvXGw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724653605; c=relaxed/relaxed;
	bh=QU+JZ1MSglaWLSUKc8QjBu76ufZkEOMMNsu7ns+mPuQ=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchan
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=U+0vxYyV; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=U+0vxYyV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsggT4yy3z2yDM
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2024 16:26:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQuOK13DC69/usftEdP2756Hyq7CmPgv1CkwHLIijMMCtacLtY4Z0p2XHklVvbPcOrn6PRHW3Fxb9J7SD6N2NKfoXR59fdCZb077hw1JhENE6TDPIyuLiintnUgahvcV/jKh3XsgKaPDMcOFjAPFWzPUasGagWywNttSbhv5X7s4ZE29dzBQ7GjDT2PGaTDLiqpli2/wjKHcEH7iUJYJRf3Rn9bjuXxpet/SFCRC+cp2l+sw0ngL8aSzy2qdFfelCljrJiEgJ+FKUXbIo7zZ/THPs6Y/ibQ8KpEXJHaxYpWIbGeD8xvP+LTdJg4wAlUgG551lnk5zgaYyXcxydL4Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QU+JZ1MSglaWLSUKc8QjBu76ufZkEOMMNsu7ns+mPuQ=;
 b=Tbrc2R6Ay77ZvEYF2CyF9PbQ7cO7WCqOzueNy8evMbTZV0CU67f1R4bO5RWeJkFUuK7+4UdymFwJZpBfUYdKEwkdkk0qD1NQAIWVxSXOO7wQU+O9y6Uxlps84+/VnU9hqZ2GmBUGAZ/y/L0sPfl7IAPvrOAjTGNtWjFa81UkMp+6LRE/7FrtlG++G2WyvsbcgwDF35qSAksPaw5gv19ig0zlGCdwr5dlFRj6dzihYzVrTM2a+disWkNUj0JcGysfhmHExs5EIQ2hHj1swqQleaYstVcp334n7j1ttezEihgNzxX/nprKJgNC+yCT/Bb5raXZ82BmJqHIZZ+TH96+rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QU+JZ1MSglaWLSUKc8QjBu76ufZkEOMMNsu7ns+mPuQ=;
 b=U+0vxYyV+u06IahDpqc7lo5LjGW8I6vhgfM2Okid6myk5JvEq5XJiBv8UiqLbJ1KIOfJq9Fabs/5ky1Scs0TUl49fSoRE7wGfRKt+b5p6OzafDLAxhndaiDaEB8jdXI+NuKz5rNI6vutYeQmA5s7kf8umCy9zX06PxUFirO/ebSPy8Q+OFd7hB/QBOHmz7KkHuiUWS9k30NeTu1kL0sb1RdFFrnjh8cpOlfyJwZMExG8o7PLTJkyY/lnbKfxiRbSXMuP2/0WiPa8uDZ2slY7SHUZMgInRSC5tKPu8yWgn8Gj/vb0C3XuyrmGPQdiVGpr0CS7xsyQ/m2en8UpOEA8IA==
Received: from PS1PR03CA0003.apcprd03.prod.outlook.com (2603:1096:803:3d::15)
 by TYSPR04MB7923.apcprd04.prod.outlook.com (2603:1096:405:8f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 06:26:20 +0000
Received: from HK2PEPF00006FB0.apcprd02.prod.outlook.com
 (2603:1096:803:3d:cafe::7c) by PS1PR03CA0003.outlook.office365.com
 (2603:1096:803:3d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14 via Frontend
 Transport; Mon, 26 Aug 2024 06:26:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB0.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 06:26:19
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v14 23/31] ARM: dts: aspeed: yosemite4: add fan led config
Date: Mon, 26 Aug 2024 14:23:57 +0800
Message-Id: <20240826062408.2885174-24-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB0:EE_|TYSPR04MB7923:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7752d2f8-52df-411f-d49c-08dcc597ff7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?zO+aakoeWXIHv3WFq3x9fTGLKUTQubxfIURZkR7Q1nAFuPf4hymOOzOLyD/d?=
 =?us-ascii?Q?D4V7xrcYW4hHBfYQdGcSfHzlUxVHUj4Ml6ymjhLwULCBRCc0eeL1BLqxOjoR?=
 =?us-ascii?Q?eLX3Q7b0GRnI3YyOltczikAL5Jcq0dpkjAS7ch9t4WGP2DEBCgA8+Li8ASoL?=
 =?us-ascii?Q?DW7f34Dv8nR591kC0RGD8Cft8BzMFdERPUpndlyb3TaWUd05Y4YwTz7hF50t?=
 =?us-ascii?Q?fkDjXdLAaYKFp2YMl5qfXGAifCQUQxmOfw5BQUgSdzVVr7a6sF0FomIeinar?=
 =?us-ascii?Q?nwnM5NBnAc9BRz6Y23WybsblB01gNEfm0IIa0FniQwfZALJ4Yp5xORA0nUkk?=
 =?us-ascii?Q?vI7WokouDdIY7o9mjJs8SSg5MVIuHeNpHuJzzqsahNh6b0HjC51eL2G18xFK?=
 =?us-ascii?Q?IK8cK4PZ8TPNKKSTKGXpo1aDVD97d7dSYH+P+Me5qYF5cVjkR0K6saWLR57Q?=
 =?us-ascii?Q?Xyv+3Cmg1TRuh6Zublbw6Ff2ADu2HZYhbFyZK2l5/JfSGEbPAgD17FBdvxk5?=
 =?us-ascii?Q?ihZ1VuoFqI9k4oBjCBeuG3we/ufh74giQaaYiFgysRqOeWq2pxTfDk47WD4P?=
 =?us-ascii?Q?2jW5rnn63uEANXSIyn1dGKx2xi8SRjA+JJfzFDU1Um9HZ4vsTwNMoQOpjl57?=
 =?us-ascii?Q?t2qudHxxPx/+dtKwY4KX/7rhFWaM7xzTTQkc05KokVZpbztiXlMbnQVpP9Aq?=
 =?us-ascii?Q?pGikm8Jl2aeS6pI0zxjR7I8qhcbtZ9TX7EoElCq1AkbBOJgYrDpmLO4HV4gt?=
 =?us-ascii?Q?kFp3oatEqo6VvuZBeezOSIG7jyMN3hslwVNPaEfBiazAVqCsGaSrMMO/yGKR?=
 =?us-ascii?Q?NpPUBM20ug30TLMlP2j502HTlnbVp4u6PVSpzmHVFzJoJ89Y7ChDB3pof2xG?=
 =?us-ascii?Q?3Z3LMBoNHhqhw8EPl06xtRo1hwIlMz3nSM/XNbOGywodYFX/Dj4pjYlf1wj8?=
 =?us-ascii?Q?QwT0AD02HXoQuv9uizQ1fF9oUw6MJA0wfrMq1gUBz0kSAMgqJTJpZI7mhBxU?=
 =?us-ascii?Q?Zane9XcyGsUEP4i91gR410Y5YLoV3UGOsZgi6iPbAYNPb2Rvieuva+hfOKah?=
 =?us-ascii?Q?vYn/+rAhkMvkap26NMPHFrohfXdjzm3BVluIc/ZMWAfh4GX7ChnRdvzLGkP8?=
 =?us-ascii?Q?IijG1Kmmk6eIH1lWmX8yW1esuO7cPQKl5O7VfshH5xPcWBUpW8cw1W3K099j?=
 =?us-ascii?Q?APW4mo6Yn/0OnrL9iPYhuNte3lPPJCjSFsDfyBY7odrPjbSJqo4SbDktBWCW?=
 =?us-ascii?Q?La8xze8FKo0BcydD9fJSPVYCaiC0rfRsmneLIIeOYHvfd/UzPYi6Cyp+w+oA?=
 =?us-ascii?Q?QWyfKWPUa1AckTJkMwQjS6xCy5AjJxVFRETbbbZHL2oWw/H6bSW/D02ascBc?=
 =?us-ascii?Q?6ZXK/oiDlKdLrkp6M/iJzOxd7ba2xFlbke/X2XxKfC+pvfM8bLs8qu/MynIL?=
 =?us-ascii?Q?yRCn/zwOWpkSBePIFWHEi7mGa2HABhJ1?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 06:26:19.4553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7752d2f8-52df-411f-d49c-08dcc597ff7a
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB0.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7923
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

