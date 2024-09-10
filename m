Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CF197271A
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 04:23:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2nYZ3kTTz2yTy
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 12:23:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::601" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725934985;
	cv=pass; b=ojjg9fJ1ItyzqZHybBKafI+yct5EeBVAnG9sP2UP5QhNs4BeHKEaW87swtekwovQbLLVw5x9pgmIBlfjb4mJG/a05MQaa8BuGj3g3AVf/irWH6HiU+SGuy3q3JLF4CvYcZ8ZSov0l2GyNig1lv/iCGhiWcw+6aXJquQHYbbfd9eD1tqAtqErpsNR8PKtOQU2v+stZiZIry57Av76ezm9ghgfqKljDqxFPrudeKr7AzuiN12SCK++xdueXRScIFq1eUYISLtWzMYQZ+nUXSKrqbQc7XtV8GCYZ92W/iXW0SUadAgQBEiftHDK1dNFwjAoQpi/+USIWJF/PPik01AtZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725934985; c=relaxed/relaxed;
	bh=4SNZFdiDJ6UWUP0Ebv25obxa6HFLGTGPyNGvWVcvhqg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=KwP55TWH5AaOicYOZxPP6gJ7sZs6g9Pt4AFk5rNHRwBC32oGWhBu7tCyVYE8Xk0yQtbe5LHRR4w/wZXojsTJaplro6oFEY8Q75knYWQqden9h9BKYXyMr2O9ymGD9NdB4AratqMqlmfGezhzwatpPjmU6m2FiJsGYKZX+t082kgBQE/BFZHhJMRkH+dfk8uKVL8uE1AkEVFfHZMWTEAHobyLvdJOC3Vf36m4dUr0ZYvMs71nvUL7XuOacG0bi0lVeD2hxAK9oj2sPv75mOfAv3bc3DE6rz01tVSLA3gGB2jFZs0+mXYr1m2oYktkEVuRSL8KDvRGWsR+mxA9WqP0jQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=uq/y+jfi; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=uq/y+jfi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2nYP1vdcz2xT8
	for <linux-aspeed@lists.ozlabs.org>; Tue, 10 Sep 2024 12:23:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ThhgeFfVeIHpLV4P8KuenkyCJNtZp3rImRwYjHDYj8CYlRhFxvSeHXB31vGt5nUgnsXIK+BwAsII2PWoEIe+kyiebbQrY4HE218qMHHB0LjDhmaEDGdja1xhXLv2biDKjdhc8q5w/kdXSMWhVRr9wpNVzgfMtUww4LK0oo8Utd9P91wOExfDrWSX2Yi1h+mj0iU4tEhWCWcH6CEOIWugWppyoA46KMBys8DNLIyOXdo7OG3FgmymrKsA+ZXKOk6QbLiEEx8OshzcP+5uSqgMp4mjA5A0YkSbM/cRCucNI3tfJyluBkHOP31oYaQo8bnIRQDY1raMEEJaQuUL3RQgQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SNZFdiDJ6UWUP0Ebv25obxa6HFLGTGPyNGvWVcvhqg=;
 b=yAoH2Yu0dG8brWPjJnpc1qieKr1XBnwVbzFX7rn9B39HCzjJ35Zo+z/CyjcN/LIF8/ekMgbZAKYsKp+vv6sYQSPxzdxg78LaUd+2N48zDkZC+0u4kf9+NuT04skWNc9LwkCe8sLHRHG6QwBMnUelinnTC+VbXIlR8niyZUa79pnkTac+0PuPNZdA0AcJWk5DLrlvIzmL7gnSN0peCu3jAs9KJUEOVuO+Nsl+Qk3sVBye+yAH9vWbrm4kTsHHFI8AS9JjM/2FKH8EK1AdUK2+8MPFdCqD6QrG27Pgnf/wJpW2LDXgqySOsipjaTRZWbGISSFYyYrVtwhI48D8SqVKgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SNZFdiDJ6UWUP0Ebv25obxa6HFLGTGPyNGvWVcvhqg=;
 b=uq/y+jfi5A7EzOyPyZHoNbTSHdCvTui51LZInOwcJOcI8qoOG1b7JBHwqqEjkMu7UgXaJJEftxg4VnYjWpsnSEAk0kqt3fYnnAJQEZ2N1zdgmhaB7Y2dF0BRs2L/mp5Q0HWPzS1zA6DP6Tr9mQRb6nR9XiPWyGpj/UuVrpiXMAZnFDqS/8mjJy+zdSnWYfTJJvFOQMx3J146lhwO1iv9NFy5YkyEXtIP1f/RfyBi8R2b1jesb/IpULL2JtA7TbqOwg7X/nhpPbpQxpCXTvkGwTacW5OkD2XAXzJE6yPf47sDNg2QNDFtg3E3AqP0XyqTmyURqX8Tk8fddT8giBRL0Q==
Received: from SG2P153CA0051.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::20) by
 TY0PR04MB6375.apcprd04.prod.outlook.com (2603:1096:400:328::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Tue, 10 Sep
 2024 02:22:39 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:4:c6:cafe::2a) by SG2P153CA0051.outlook.office365.com
 (2603:1096:4:c6::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.5 via Frontend
 Transport; Tue, 10 Sep 2024 02:22:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Tue, 10 Sep 2024 02:22:38
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v1] ARM: dts: aspeed: yosemite4: Enable adc15
Date: Tue, 10 Sep 2024 10:22:36 +0800
Message-Id: <20240910022236.1564291-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|TY0PR04MB6375:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9efe5c7b-3eac-40f0-d3ab-08dcd13f709f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?2IJvcr92O+AQ5xmAMMZf7u7kpIIrm8q52GiG7v6FlE3+HJv8jGZIqwK3fhR5?=
 =?us-ascii?Q?OfPEEvQ3Sbnlhwp/amKI7yZSfOJC8TXP1M6gVRevhXZVZQuurjVlLglNsHM7?=
 =?us-ascii?Q?dRiQi1Rp+TxQFJhllt1xiPFqXI98KeuKG/EJtRSs08eR1H6//dY0JYLydFCP?=
 =?us-ascii?Q?G0z5XuMQsEAhVIObUHbja1FvIvGJFMtjv2+Cr4r7h1rQRLmyASTwNErei0mT?=
 =?us-ascii?Q?tcn6h536SQIxJoCAJB7+0RIBTWw0jgFOFbjwHF4BfrSRoNTSuwyqyglgFsls?=
 =?us-ascii?Q?ms3gj9/uM2Nom08bAvIVrTQPZ6QsCJNcvJUs8fmye2isgFsISLCi4m9blupr?=
 =?us-ascii?Q?KCSiojWPKm51Ejh07pDuQv6zpQAFQvbcOCkZNwPFSYU75m7+O4CqAin0Zrrj?=
 =?us-ascii?Q?+2KHWT2behF0hGq70PE/3E6lN11jS3B+clipRRu/0lipNxG/Jrx8yjuGmiy5?=
 =?us-ascii?Q?gyqi5tfbi9+vJfHduwQUqM6BFBh5QybWA5rSR1ZOWM9PPSrnDAbmjgTxA8Uo?=
 =?us-ascii?Q?AvYj8B58WhzU4TB/WS3R2R7N2vEbCfQUzJElEIXR0X9Z7bfl3d/skNgfH8ul?=
 =?us-ascii?Q?zgaUHr6mJ4hGGS8rQUB/QE9M+Fj0uZRquOoyZ9bBLfu9XxgBV42h2c/fzn6L?=
 =?us-ascii?Q?QX8L7CGvrqmOQAw8WBwOKB9brfBvgMO/55iHlmAkiWsdQ6FO8UtoBJ0CzeAO?=
 =?us-ascii?Q?ZtVGb83YXu9MTkmFzy7AX//L5tG4P41IE3BSGGry1CP14hp8l3Z7f0P9MrZu?=
 =?us-ascii?Q?sAS6ISemOzL7sAFvqNDrOT00f95RKAzRH1fgYgE0BOIQVjkY+qAMvEJ9WkrZ?=
 =?us-ascii?Q?ugMutnHqkQ3F5BEX4vcfH1oCFWYrJEnl/urKv82yO6hHUeZHDBDohYWtjMLt?=
 =?us-ascii?Q?N6FFVgJwb2oRAmy4iRL+Caxl4R2UhZIdAOKeRu6SXhUJczDkD5MqTvEYYZJZ?=
 =?us-ascii?Q?PRUt9833GSC6o5Y2DEc9zeA1gQs7bqG371HxkYKk9Kcpo13ce9NKP5tSM399?=
 =?us-ascii?Q?8Eb3BW9zF2xdM0A0WclnMJSdRPv35elBc4LauBI+syQOQCrRy5Tbgvp7KXWm?=
 =?us-ascii?Q?VpMgGi7SLt3ARIjDw/NgmPrv+j4LQBqVCxYIcCz60Aj+XS0UBtmTuHoXP998?=
 =?us-ascii?Q?P5ntXJJNzkCOA8dldU/yHh9AQghlVfHU/toPGEkCN0s8x2RRqCpdOyNfbYQY?=
 =?us-ascii?Q?tN3KU3tPiO5WL88RqZAKK9XfmJcWqoC/H0YaQssn2R4Cr7GJfMUJnn8k20t6?=
 =?us-ascii?Q?CNzd3tU9eSOBP0RokpusWl41cP+YOJPgxRq1nF0yEGMJf7Z9LILGW+0LLWfk?=
 =?us-ascii?Q?QPwndTAm/MDtbsp8RTH0SPaqRDVtPDffgI8CIWtyt2ww2efTWsM3G7Cbre5o?=
 =?us-ascii?Q?oxqDvaYOxozq/kcYu6lDEm+QhBNdDmvtidhwC0xWPveL5yT4piaBUcV3ow3T?=
 =?us-ascii?Q?tr/o7jh/c6Y=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 02:22:38.0091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9efe5c7b-3eac-40f0-d3ab-08dcd13f709f
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB6375
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>

Enable Yosemite4 adc15 config for monitoring P3V_BAT_SCALED.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 98477792aa00..2d46f7d40ed1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -32,7 +32,7 @@ iio-hwmon {
 		compatible = "iio-hwmon";
 		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
 				<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
-				<&adc1 0>, <&adc1 1>;
+				<&adc1 0>, <&adc1 1>, <&adc1 7>;
 	};
 };
 
@@ -612,10 +612,10 @@ &pinctrl_adc4_default &pinctrl_adc5_default
 
 &adc1 {
 	status = "okay";
-	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default>;
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
+			&pinctrl_adc15_default>;
 };
 
-
 &ehci0 {
 	status = "okay";
 };
-- 
2.25.1

