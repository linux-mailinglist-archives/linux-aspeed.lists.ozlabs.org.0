Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 988F680C0DD
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 06:48:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=pUO+oMoo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpW4Y0M0zz30gs
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 16:48:13 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=pUO+oMoo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::62a; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpW4M6jJbz30YL
	for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 16:48:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5kSBuYSI4wI/qIy8WHFG8TCu7jhDxTf3SENAx7o3mQMUgrrM6wnaektiloz8P2ACp/oe/yv2JX6cc+OKZF+Mu5a7wrtAMO2zvCfNtllRyQdD9uJbXQHuviq+jE9GZUHUL378ZITEWwhPkkRtajZHC6j4MsOVOuv5/QhEEcNO04d9UzZhSIZulPB/eM3Vxhj0YcQZ3eaudPaX96tSyt6jMwrqB9QtQulUE76v6mEbd4jzI/IwdioVs7Gk+Oi66vNqwgp2wGzLvlIfLHyURphSCdyB4t+H/pBHbnM6z+vk938/DqmCWlPbVli+4xrTM18dEtlE3ywikLWkhkDpbE8CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTdra8Q6Ty+kafVG+eRTSPVcdelb5hg9red0Vwq21ms=;
 b=dpNjU27aAJLmMWVFwCWJaQk4SaxRYAu9JsdMD4H1edt7bnJC5JoY6QuJe6uEaph8/m1eL2ArlKId6tuXLeo4br4kgK/uH7fZsbb/gTKilgEJ5evrSgnSWLa0FplMYvJgbnu55rw2+L8qYQkZ/F7oPE7I4UNE9WsqWyTPUi5z/ATDT9SQ44nfq3enPsfmyp0/PyMroMc3o08NvVLJ2Oh5mkgEOImg1jB2tyvwvU7g+nNcObaj64RAE+a9oXVX0Bzy32/Ru0A32zN70uJBppp9VNMj0dNDgYgMr3NBkSouS7QaZfucbAeRRAHlg1C/D3l387I9AQbBFfblO85rsJ41qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTdra8Q6Ty+kafVG+eRTSPVcdelb5hg9red0Vwq21ms=;
 b=pUO+oMoozb2+XBcqAb0M7ju0Hwkc9mG7JWvOaBj9oLSeP4fqvwjpo4P0lVMsc6BTkYmrZJrShsgr0K8/drfNnqmEOxl+tQDPyR6iOUup2TmTTq9JRoJMLmizbg6W/D0LRF9hBoNZ7lciXEnkcslf7tZX+JizrpWPtgmb5MlV8/Kv88nixtQPwIPc0MzhP9WZvxJmUG7vTxV/rdqTMs7in5xZZpOZac8b6Wk+5U4FpaO+zOZsStdrmaG2YN2S0ylZCg+Nq6qQD8254hX6aLJZXFC6M+8SwUCpiK/p6mFZlZxx2jMqxA1KclC6nP5KHzdJgfChrHkiV8ZFuH4CUUL2iA==
Received: from SG2PR02CA0072.apcprd02.prod.outlook.com (2603:1096:4:54::36) by
 PUZPR04MB6352.apcprd04.prod.outlook.com (2603:1096:301:ea::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 05:47:41 +0000
Received: from HK2PEPF00006FAF.apcprd02.prod.outlook.com
 (2603:1096:4:54:cafe::47) by SG2PR02CA0072.outlook.office365.com
 (2603:1096:4:54::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 05:47:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FAF.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023 05:47:40
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v3 02/14] ARM: dts: aspeed: yosemite4: Enable adc15
Date: Mon, 11 Dec 2023 13:47:17 +0800
Message-Id: <20231211054730.208588-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211054730.208588-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211054730.208588-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FAF:EE_|PUZPR04MB6352:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a3a6ff0a-1c10-4f3c-95e1-08dbfa0cb02c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	9fmG5cI12Xqk7lBHHwmIlBPugjao3NzE+etWvpHgvwdV6hyoYbqWF6EPqfsl+nQFNj7SRstc5wXDFbPlBX6uVipaA1GUjnX4xDCFl0OCfVnc6pbD5C1UQD8s630HHK5sivSkY133Kw82rtx839r6JOD5jEDjoxrMEUhTZKuX6tRIXq6NW3QmnrjVFG204XqsQE0GVVuSr6PRI+sKW6EHRJcEN2A5qq7lO2rZHJfz0fWy8WLh2heShh+X39j43UnDrhfCUzzywLjl5jLo8Sf0sNLGr0STdHGexvTaNPW+p4mef7c13aKbgLyacFQKLW33ycTqukyHS+aIbAUZGxgfG8dCy3g2cOg6P7YqPPyVqGDgdnPz8rAAxYpcEkKot1bJNgCbUU73qLAlx1wW20xrnD8p87MulL0BhztNXI9Rp3nInyb68d/Ze5G+dSKcBQM13pwK09uG0BaFpnemPs64P8bbNLZ3REhZWNCmaii0MMK+PvCUeW8+4lyrbA7Ah5a+BBIYPcDEzx04KJTuv+hJGWg7Ku6e3qjukwC5NRHAcWO6uCiiRmjzDPEhCesM9j5zVh0K/ya3HilIPDYApE/hRF7hnQecRSCZXrl+Zw+/TX1zJ7gG9fABSnt2lJU+0yP2+lNO+tXiyikcBOH7WTNnzGRb9w1J7OYOR1rwlMCUnz6N5iglQ/VFYkJoTJRNziiMceORF+AELgEUIUMRTSKjpg==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(376002)(136003)(39850400004)(346002)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(82310400011)(186009)(46966006)(36840700001)(1076003)(26005)(956004)(2616005)(336012)(6506007)(6666004)(6512007)(36860700001)(83380400001)(47076005)(5660300002)(7416002)(41300700001)(2906002)(4326008)(9316004)(478600001)(6486002)(8676002)(8936002)(70206006)(70586007)(110136005)(316002)(36736006)(82740400003)(81166007)(86362001)(356005)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 05:47:40.3133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a6ff0a-1c10-4f3c-95e1-08dbfa0cb02c
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FAF.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6352
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

Enable Yosemite 4 adc15 config

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index a5b4585e81e6..c32736fbaf70 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -51,7 +51,7 @@ iio-hwmon {
 		compatible = "iio-hwmon";
 		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
 				<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
-				<&adc1 0>, <&adc1 1>;
+				<&adc1 0>, <&adc1 1>, <&adc1 7>;
 	};
 };
 
@@ -920,10 +920,10 @@ &pinctrl_adc4_default &pinctrl_adc5_default
 &adc1 {
 	ref_voltage = <2500>;
 	status = "okay";
-	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default>;
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
+	    &pinctrl_adc15_default>;
 };
 
-
 &ehci0 {
 	status = "okay";
 };
-- 
2.25.1

