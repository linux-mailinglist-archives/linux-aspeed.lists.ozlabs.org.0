Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 527D9881AE6
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 03:13:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Nd1rp0JH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0TX00gKnz3dVZ
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 13:13:20 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Nd1rp0JH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::620; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20620.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0TWl5wlKz2y71
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Mar 2024 13:13:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsTanZagc6FwZwV5LIjfFQ+RkJ9BGq5RBuZD71rKG3slwcRrQc8bq1UrNdkbLVqM2icPmSgGjqdq9EcqUJTNR0NviCNjsVkdQ5XuKgML5RXuxYyoSUyUlv8PaxdCACgpxFyJAej7aM3H6nf6ZHUjThwCfoll+SxHopXPiT4WrVXvvAJfrkBOF/9q85erfXYNUgh4lUnpr+NkaAaOHRY9673aUTIA3pMMxynvDgp8G5kzSRb6rALF8Y9huasmD8Z3eIbhkdyl+laLQkkn4WGY+uQKCJLADRLV1UhtS5Vjx8YhKed9xcSEfAQ2JONDXAm1Lxw5iclSiUzNQYIAOAAblw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kCO11WdUiFDfGWanOnHA5fSAvcgtGuDJsJBtZQkii8=;
 b=Y5HGknlpe0DS+4vPPLU4CQ1HuhEz6fLtyz26mX/l3bv5Wgb+U6v6MR+PfyFQLGvVQsgspdLifD+A3uoh7BrdfBLxukwX346NklvGKauUf1wS45kJAsdjfTVU/Ux4jXxjfw6bKP+HmOsVPkX91auAQtEHWNBvPCKZDbJXApaW6UJ6N6Dpw0aHHESMZ/A+r9tnW2QzZPTeCxzLF/xSNRr71XBvcZmtYh05oLNYELNsxl5Tt7dhtunYeTFZ8ZznRuEInOrTk27Dbyunsd9v0p4yMbHWnJlrw9tiRCVOjwe6MRo7KJ1+PY3yhaNpervb00wJA7aSvrKHyfXlBtam2Ul9dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kCO11WdUiFDfGWanOnHA5fSAvcgtGuDJsJBtZQkii8=;
 b=Nd1rp0JHUg+Gk3HCjoV3K0ZVfbngCYu49gQfdRYVG1tBKdKhMwdOozc4EszKZOUf8hdmVodcnfaOJ37o9PX2KKKLbPcUTfMfG/TcuASK0Oow1ewoieDDUBU4ovoOujG40Z717C3yQu/STtzTXAbamnNGca1S1ncT7oot0fJHRbyUyvProbFWL/CO2jf/iCdAuJUgtVbHy1SV5Zv+SxuwHIzP6jry71LZpfduZLW20JUywjkDzkt0tEJxGTv/YF8AsdJvnNp3CrSXGYPfb/zb5qweI6+lvnLaECxPsZFjezbljw9zgdf9c5gmgi1qnk/8R/P8cmnL0aetBgp68WBq7w==
Received: from PU1PR01CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::32) by TYZPR04MB7453.apcprd04.prod.outlook.com
 (2603:1096:405:42::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.30; Thu, 21 Mar
 2024 02:12:48 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:803:15:cafe::cd) by PU1PR01CA0020.outlook.office365.com
 (2603:1096:803:15::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Thu, 21 Mar 2024 02:12:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server id 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 02:12:47
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v7 02/22] ARM: dts: aspeed: yosemite4: Enable adc15
Date: Thu, 21 Mar 2024 10:12:14 +0800
Message-Id: <20240321021236.1823693-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|TYZPR04MB7453:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0f7f9706-3d8a-45b9-1ac4-08dc494c6732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	xk+ykW2Ml/EwEtICuGotzSRmn7emVFdUB2jSw8QCIjzdRu24A2fYTS02LVdNdf93e6WrUUpl0p8K5hKv9/fSOgOHYNuCKgJzHFKtzyYEBs7kiFlkGaXF+yehsG67a939YfkXpeh2eL73N2juBK5UKce1tXynLhGaOvggMV//qLUn9wOuis/RhO4SXORke2hxB3cbTIwvjE7hRi6nrQxkihksaq/UG+6Kzo1koAw8FlA4LFm2aDyvJSV7vFnSoe1k3GLceaTNiSsQBldv9cXZMMaaGK/dV6FAQeGcrkWJwvdhDvkq0U9H7Gix7ATqx/VXEH+VfqOSiwPMEaNpw+/bTsf/reAaeVMMw+lqY0HYDyRrV9tS0BYQ4oqw88TuZd7eBLhRFKsRNoXQdFY1Gs1SIIzgWi8/AQSoopgLsoTtYO2PhvlcEBkZ79efNFM1QCOM7Fe+2lkhtO4RZ/u48KO9gMtPb0aNnOXWTYkpBu7fd17/UxrPH2cWAy2WYtHttggoog1PVWl8bDiyMsyPspBcKZkhlMgUQpD8DzdQBS2tOhtL6shrgaJ4ZzwvFeAoR8S+eQHb+B2vFk+4o0Xd+qQ3SYn80wVB4J+IAu+Uo7wC99KsXYuynZ9ShnJbQHUhPBHnkZDpZHzdpEY3+biMn4sbGIFbglhr/RxbJDNcUv6GmOU04bvoo9JciDk2B1J/bw+2E73l/ajSZPH+SKOOe4Ac9JBgeO/2zBvYomV9ZzLgdpHdl/juDPpX4wmq08Tt7yFg
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 02:12:47.5259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7f9706-3d8a-45b9-1ac4-08dc494c6732
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7453
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
index dac58d3ea63c..6846aab893ad 100644
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

