Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E9980BF60
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 03:50:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=fF0J4gMl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpR7d6fZNz30gs
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 13:50:37 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=fF0J4gMl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpR7M3tbVz30YL
	for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 13:50:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldJ1WdnU06LAkhBglysoIFHlTbXcyJ+wPQoPLB5D7kaycNbP+JV+143YnKfd0/H9HXXsOXM2w6WBgfm+jCSYaJV+h5lDKm1jq/pX95K6u9JyuhDDXWQQByvk/ApBly0SRC3YybTVE1z1qGrwL+PoK61pCmSuX9cUXDnGShQQvVllSMcoSYnuXW/V3tgGGb4PF8a4eUvMqc4dN5DXMsKylIIfgpPg+MAUVZoB6QPPAEagbwiQibaUr6zJTMeiS7mIZUADhXxfacMZ3uhma+8HKWzNW7jIEloC4nrHXlxDQwoaBA/2fGn8D/ONOWgetGJOarZZBQcMjfh/NITA025svw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTdra8Q6Ty+kafVG+eRTSPVcdelb5hg9red0Vwq21ms=;
 b=jwWjMoxoMzvjNlRE/nBMclPGu+cTuHb38yEHqo+DXBmqqoXSzwTCA58Vkg7HE5Ggy/WuT6wqrmMrXQxWCAqRvioKRZSoMD+MROKvRQbP98j5DbYBx+ayctbdfSQIPkMHCBpbZUwgQSAa//r2aeQ5gPzq2eYQTlJuZJDkqGKoeodAexHPwei4mcoVUFX9WvtNmnI7tNa6EnA+F5DWidleZj+Y4/c14JZxOaXDlfcN5/wBOYwO6C8EVI9Z7kfdCsMwim5VhB40qdn9TtV7fQuDHUe4CipNCU7pMlYy2TNG1xyI9RUrU1yqzRn+VlDpsVzzHz2X6vy1XfUqhG5lboeGTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTdra8Q6Ty+kafVG+eRTSPVcdelb5hg9red0Vwq21ms=;
 b=fF0J4gMlMIydb//oVc4u2l2yVVTP5Rg3YuENkBVH6jAA5/Y9Xz+nfS+5wOaG8NyL0ONDnIdHW9ru/6nssYptPrd9a62NzWbtP19p14+0f9RMDLckTBrr8FuhaJT+UKxnuO761pbWg58htWId0e75xXfVrLytlQbS4mhQg6oPlYYIOGEmVFIWKQB4DVAiwljMtnP24S1ebbSYldP3FpZOuVXoDz5w4G/C4cMhPTNmuCJmGQxMp7UncFEv15rG2ozZQC5yz8ywW9ODwgBReqGX5ku+YDLGOY57714jru3Snf3JCZR+CtDckJZ33owAPOiuJQTyl76oAbC1/KgxOmvjPg==
Received: from SG2PR02CA0030.apcprd02.prod.outlook.com (2603:1096:3:18::18) by
 SEZPR04MB7298.apcprd04.prod.outlook.com (2603:1096:101:17a::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 02:49:59 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:3:18:cafe::3f) by SG2PR02CA0030.outlook.office365.com
 (2603:1096:3:18::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 02:49:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 02:49:58 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v2 02/14] ARM: dts: aspeed: yosemite4: Enable adc15
Date: Mon, 11 Dec 2023 10:49:33 +0800
Message-Id: <20231211024947.3990898-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211024947.3990898-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211024947.3990898-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|SEZPR04MB7298:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 607bccdd-7f68-4c9d-8f19-08dbf9f3dd4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	voQs7blMOSVSBOpEqN6CrAOwCuG8VhqZ4FtnUkA6MRIuoGaOeMGuc15oqP0Y8Nl3SQ+9E90VYC2PlXtg9mE+sieFVhJcqxadajmCYvqkhpD4IWPx6xSolLfzQ/B9NuEY+SQnyvNeUAaDd/XjZKWiG9k4P8BZpvlhUPdQl20nzm/XMDcBYPnxOCJxSU1NiDHasL/fANLtKd4ops4ZNzYzRuf0QVa+qc9cu73BGp2Vkc0vhfMLM5V+P+rV4pWeU+uv/0ibio3E8ai0aLz5ZV4PHWg+UVdFaEoAHbtg/HlgXpvUAcA8hM/FcpUYpr6ZduOlHAjr543M5sz5T9OU4x95n90QMFB8o6tr7JOEZrbOix0jDtwFHzvgIvJC0sMFYQPc0inegj6ba8b+kbuUkZpKC/tUPKQiBDEms2exBf4cJ0wGqIiecuWtjjoK3W7cSDya8pDhKfT/3xf6wur3jSePe6CtEXQXpbwkL2jQtsfu69ARt0jYM0btSvAlNbFL0aJBKX/xGdQq+zms/vknbq9Or7hl/va1WBYtNNeVLF7v4pAjjOJlxltI8PC58fK5Fxl1Sb+6XJWKf+a0RQjkvxGSzrhZHliG0GyrLuYgUTOCQhWgqYvXvBhYzgBoUUMl9kqpewS8f2BUTpig/6kC5doerN+2flwHauFsdEP7osj6q/AzGC4mEm6z72SrmTnxFODBNqhmPx0gCDvF+jP8JJ9EmA==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39850400004)(396003)(376002)(346002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(82310400011)(36840700001)(46966006)(1076003)(26005)(956004)(2616005)(336012)(6506007)(6666004)(6512007)(36860700001)(83380400001)(47076005)(5660300002)(7416002)(41300700001)(2906002)(4326008)(478600001)(9316004)(6486002)(8676002)(8936002)(70206006)(70586007)(110136005)(316002)(36736006)(82740400003)(81166007)(86362001)(356005)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 02:49:58.1711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 607bccdd-7f68-4c9d-8f19-08dbf9f3dd4d
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7298
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

