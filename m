Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3467B7DDEFB
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Nov 2023 11:07:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=ejNdn4dl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL2jq0k0yz3cVG
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Nov 2023 21:07:11 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=ejNdn4dl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::618; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL2jL6WF3z3bPM
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Nov 2023 21:06:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dS6wnxm/7xh5UeJ53DXPtFLUbHDxal++usRYvDETqmkDnuEEwmU6Jw9b3lkPdEzgRKR8KN+UDNY6LFRGlmM98HplO0KRsLS2IgvD1ktgKh5a6JNq9cGFpkvXNmdwz70hNb0bscOgaBJ8yr+LT0jUZaPHIDs6b8ZH9pHcz2BeFAHeSOqE+kt1pPc9HnmW/uOcs1FjheShrQhxqd46rvFYWeDrK0fXAs+hjTtUfMnhP8Ch4MOgUoGVnY91gnW0ix0QImJyGc9mOXqOT/6TsQnHfl1OJy37pcXSq4wQYtqVhStjaTI6zJ5s8zPpQWqKP8K7OMQeEpO42bfyza+ZxY1Nmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6eUXb3yAB6+1sF9KGxuPj9S2mmZlucBK/+y5NgEZCk=;
 b=EdGYROEYTsbYc8BST1sDJyUl7MpTcwmvaQzoiD6dCMV0isY0sUr8/YpnI5rA7F0fSHpbLbpiu5xoLzFaeMmnqRs+vq0b3HJLwngDyjMxT9veugSJa7jXwwp01XTWsxwTmuOzQUBE4fDNuE0mtZHUDs5XblsbHiz78WqI/q+ZYoVkivxKhSm+x4luuXRkpMZUCMA8Ltviqwmr7P6WWIjOTTTrgbrKX8Elqx6RH2d/iJ11EjtTl7h2i+eRKXTwuaMUY1099qBPJgzizcZo6t6drZjoBFrd3FkweCU45Galy5w0UlSpaFNrz4+RGRpLvPdesIFCshUIPZQeiY6Ut8Z+Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6eUXb3yAB6+1sF9KGxuPj9S2mmZlucBK/+y5NgEZCk=;
 b=ejNdn4dlS/v6WYW3D5OmTlS1dWL49R/SWseATCQZe5tJBcfI0Q4RfKJhJzh6VLJVODmm37bfBLVAIBb4IXEQSvj7Wkccv3f5f1CfV/4Wu3oN6ogWFf7QFXNPnAZBhqcU7fgAfD0cGTeygVMM55xqxLV6/ygz0s0PuelhW9ajmALIkkVsxREk2EYCarG1qr2Muv4UtEin4uNz+WHodVad+a0qcq5AarOqrz3hgRw3pE+EV3gD/iA1BO9qXWG3FTfr1+Xu+G50ex/nf61zg1hgDbGy5rHjim25+jYhG0Zgrw79N/0LkPRHaxxlLmnZZdGzco+CHt7FOZSyopOLESKuuQ==
Received: from PS2PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::14) by JH0PR04MB7624.apcprd04.prod.outlook.com
 (2603:1096:990:62::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Wed, 1 Nov
 2023 10:06:26 +0000
Received: from HK3PEPF0000021C.apcprd03.prod.outlook.com
 (2603:1096:300:57:cafe::4e) by PS2PR01CA0050.outlook.office365.com
 (2603:1096:300:57::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 10:06:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021C.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server id 15.20.6838.22 via Frontend Transport; Wed, 1 Nov 2023 10:06:25
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v1 04/10] ARM: dts: aspeed: yosemite4: Enable watchdog2
Date: Wed,  1 Nov 2023 18:06:01 +0800
Message-Id: <20231101100609.2516844-5-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231101100609.2516844-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231101100609.2516844-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021C:EE_|JH0PR04MB7624:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f81468c6-0067-4fff-49b6-08dbdac2352a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	d6TuVGXgl01I/QtEm7Q3gIiHI0ZKP/K6ZISM51SrgXt007L/zh1j3dXS0bs0cAaS7h59fbwr/Er9pecbaXmVuKyBeo8Z6mQzLvEJeIl3L4y6lPiI4v5k1jOQXmQfDSX72UbKMHyjbOXzuBSEpES20qgrCfPAQjTBRNHEaTsR3MJ3Udj8LSSQMDkqRH4XXfHS+DutOgUgFUX8ZWXFpNXoHmKYnK1ap5QbFoVMNtpxYiWnFWPzQ18ucPd4TVL7sM3BKDoKxoc9A7V9YjMsvRdi3vqwuJ9wT8+drYtcV0P50npUOAGf9hIF6S6y8VOScF+OAzIrxZvqR79G6bCqio8/BFgDTG8wJcJFOvS2vgmYL5Q3MEQebkN56CqAFY1cbzHypJFartbI3pb2rJxANWq9fRjXi6Fa6FH/6s2ai5IohkWYcWOiZFYziWck/oemjQzAcntEny9Idx6dUUazLOXiKAJx1GiH/UIv4v2cCZJAUMyzUMqO3yRN8xa/9gPaSPP+91z789bO4T5eVJGG3cHJ9uP9SMHV+pVnudrlzQB29jZQkMofo7UjwKVBueFHKa/GKZQo55jPT3s3ZWfgxoy/MRRYNg/spKA9SC0m89tOJaaZPjy9Ra1kRBv9eX2UK3wjN2Q0E2U/Cx6UMKnMs5a5RxcaBVN4BuxDRiVyu5rTcc/SESgIXBpSrW/MqCXsonX2nI6imWlm2dMIJrf0Dk+0ag==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(136003)(346002)(39860400002)(396003)(376002)(1800799009)(82310400011)(186009)(451199024)(64100799003)(36840700001)(46966006)(47076005)(316002)(956004)(4744005)(86362001)(2616005)(336012)(81166007)(9316004)(2906002)(1076003)(26005)(36736006)(110136005)(70206006)(356005)(6506007)(478600001)(41300700001)(36756003)(6512007)(6666004)(8936002)(8676002)(70586007)(4326008)(36860700001)(82740400003)(40480700001)(6486002)(5660300002)(7416002);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 10:06:25.1344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f81468c6-0067-4fff-49b6-08dbdac2352a
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021C.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7624
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

enable watchdog2 setting

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 20aded2d1be6..bcff232a1782 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -120,6 +120,13 @@ &wdt1 {
 	aspeed,ext-pulse-duration = <256>;
 };
 
+&wdt2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst2_default>;
+	aspeed,reset-type = "system";
+};
+
 &mac2 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.25.1

