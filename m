Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD16B98427E
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Sep 2024 11:45:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCZhy6Q5bz2yxj
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Sep 2024 19:45:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727171104;
	cv=pass; b=DYMMDzRwiYCgEzoxxlGXPxoEhQHchsadXpDjE9inVeh/y2YQPE+/LlLAPnskSE46YZ72VikE/cXNRI1SMPvNrb4f1DzMTYCaWpo8RkQDJmNuBDFG1wvrsEasuee4VsXvsG6dBDsBQoImLobZspRwXWA/kELRxtMve4yBCWAPc2Gh4e/FnhVkNk+J2n5AXt17XnKIf/gE67eCxdOhFeVfznnXkq1ILLvK5hK8vl6l6TBCnTihTI2VXF0wV0y2q4/BOns5mC88DCRY5MEBWuY3vXS/Cj8+v44bjwpdvMn3jMtuVCyY055PlyrrY8bL1NkOsDXsVqp/x3JMow8oTW9K5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727171104; c=relaxed/relaxed;
	bh=PjVVlilETkuKBs+q3A2Yi9YenXOUvetIRsgGavR0h+g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i8Q33rXlzEBjPzUaq3WO29BeoARnq7H48q8sVViK3y1jHdUzoJS8VuJc4jStTCwHlsG6sTRpmho5HTl69cvVAsxb6zRqBPynV8Qlvw9Iq1sVfA9HwtG5A7QLTQklIljr5zA8iamooeg2DU8cmgOri2BK0dw3s8/rmoUJoTLtwxHZABrpATEMvo0MIM/gJzGgAI+uxhxoz5WutgOTsoB85vK0Qys+kfcehsSq9wHmEzWOZWZ2ghkPEs2gfLy6xYUvWW143tGaQgD/LR3ldRJJtMI2n7gY/WqxJ6LbadZgSXn+fAiPIbbf4J7l4lS0DuxVNKucYwufpHujTXgJl9NVQg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=jXLjKIUf; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c400::2; helo=hk3pr03cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=jXLjKIUf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::2; helo=hk3pr03cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazlp170110002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCZhw4cjkz2xHQ
	for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Sep 2024 19:45:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFNZ85tnxHdpPnz/wLfgkc9W2zwZa+8O3iABCCcg/rL2cKw+Blm3TgIIRYK+PEWyGGcWwQj+dnYQXyGN8rNKC9cbmlxdzBzxT3h6oAwQYOjctREhTVIQgZxRerNfy8pTSjJKgkEC38Y8xTT1dOKoflUtxKTuKOdWx0E3ay41SgE/7uNK/A820vB4xb/xMGqJQO9JSgwhGU8X9H4acIiCeujLR/qwg4RrregGn+4wIgyMx8saVfdCXijBF9Vm+WY9ytY6mq9ByA7CBk9ox1t/Bh0WfegY+8sXLY/XC16zkICbEMZh01aH/qkGQk9qIW8bqG7H0iHpBTNSJAvjkam2GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjVVlilETkuKBs+q3A2Yi9YenXOUvetIRsgGavR0h+g=;
 b=VacgNsAimzO8tmEhq73C24LQXVtdxaDYEnHz3lSnNgEoLYJO/s55YKsul0NCzzhmpgp//wzUEMiwyuIT9KPZaDLjpfDLtLU4w2ssmRyN1TbJkiB81QeMdCfXNStwSBjQR4fp765aRpCGl3s45uEn15kL5suc1uom/Is/blrUjyFTJxlL2ox9BzmGLQeLEYdmKMDbxuDSzAS54W6+hIgzLTOJ4wpOt9PvigMoWhJk+XCL+UjepfH/4o3KJ/9NvTfdxUhizfJrYbY5+xHuwZKrv2OcC7qA6kqHtbDAPjCtiuJ+e3h7VhE5BxJmaEIIAK2XYaP4uYycLS0ky/jYVPfgKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjVVlilETkuKBs+q3A2Yi9YenXOUvetIRsgGavR0h+g=;
 b=jXLjKIUfrXoVQiPagf+NtOkP962azXOBkIXy3CLmxJKtfqp8hVm5nuFDnyrQma2Y3W2Fb9YNf6zdmdDlAhVEoa4cH2jSvmcwNV823Tr4jVVahnjlygq5b+B8iMignPSx6bnIIwM1trjAP7Ir2t3sn2Gome3Meq+CyjlRntuHao3VFaAnStVtg9Rs4Jei2K7sKs56aX6LGj93IX8M0UhKPiwH06vdLAsdXS8MRP29eYx/ay0sfaC+91j0BYD/BBHG3Mh6DnrvCXgs6/oKPr/npZa937mjHWBAcPqTwW4hd0bbJzJ0kpbEsn6SoaiH1mNSuVztfuaCtF5wQxPwNHswTw==
Received: from PS2PR03CA0002.apcprd03.prod.outlook.com (2603:1096:300:5b::14)
 by KL1PR04MB6927.apcprd04.prod.outlook.com (2603:1096:820:d5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 09:44:37 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:300:5b:cafe::bf) by PS2PR03CA0002.outlook.office365.com
 (2603:1096:300:5b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.14 via Frontend
 Transport; Tue, 24 Sep 2024 09:44:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.8005.15 via Frontend Transport; Tue, 24 Sep 2024 09:44:36
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v2 2/2] ARM: dts: aspeed: yosemite4: revise flash layout to 128MB
Date: Tue, 24 Sep 2024 17:44:30 +0800
Message-Id: <20240924094430.272074-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240924094430.272074-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240924094430.272074-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|KL1PR04MB6927:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ba440ff0-300c-4c96-6fda-08dcdc7d80b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?S/pzinbjYsZvQGMD4r7xIH/CUIHY5BCNqBm3LS6nTa/LG8a6s5Ge8uqVJ29l?=
 =?us-ascii?Q?7UNBFcz1Gs6a1FYUT9K4KFNlZ+Agr4S8Yok/GvH0JpH5r1Zf1e1zpateWRuJ?=
 =?us-ascii?Q?TNlNJElntmL/0CFXz1FSFQdgnLOcLFJ9nC1RVHfA3zAqsjQ2eg1dVZl3Jyhh?=
 =?us-ascii?Q?JjtFLQhr1ZK8qJHegzt5HwJTqri4Mft5okxIKECqaCO/11wxQPHxujpA/7Pj?=
 =?us-ascii?Q?4aOVsT/ZhbgwjmTNPwxl5RUBEVu0BRiDGWrzD4jslkR8wPYUr+v0k4NzlU2v?=
 =?us-ascii?Q?QENwvKc3H43M5z0e4hnsTozylfwr1zaX2pXc7sd8iBYZ7Bg9quFhS6/DrG1X?=
 =?us-ascii?Q?NzaLGorqklcP720Y8iSkNYIkGh+yfS5k156Uxk1UswMPZrQRZA3XRxtMsaZT?=
 =?us-ascii?Q?ayV0zMuuCEZV3KPV5yJvc5a0oHtxBS/cVg+kxdl9a4/+0rpUd6oB3sUqRl6T?=
 =?us-ascii?Q?Zg9hJ+pu8w0M9kkbR/hdvn+lvZrJ67+RrerTQr6KR5NYm14ycPgA9v9z+lPb?=
 =?us-ascii?Q?UOjZpV1i5U2Uep3+hm39yF+V8OTJcrx/wjUb6dRHRfhZwQ71GVxay1K4Zhh7?=
 =?us-ascii?Q?iQPtc3lZF4SKqq9w5TgMwcM2p5KB8mYuZNoFXLkuLtyzP48E59M/2BtxvQlX?=
 =?us-ascii?Q?cJdJ79+kFKs8jnlxMb81F6JSkMH4IwXshPTLaNKqphKjWJmyyf8QV3BiKNwl?=
 =?us-ascii?Q?Uc+YWMZgQkXBONLTBmkNlpHAbzaPp4sC+2csqO+o4NLX1JWADfrmDfRjuSoD?=
 =?us-ascii?Q?9zNWoYi7IiL3G/Vi/9+e+FJN+FPS3gaEFf4aBXnamf/0OlbjN6moGfXHhnx4?=
 =?us-ascii?Q?OwL5dTfaM6tJ08ksVE2SEM77rqYkd4vpkJI+w/ZwW4eRm9rRUu8PEHrw3bgr?=
 =?us-ascii?Q?W6MA57/wgm1NYE8+3thvxwDk2k3sOH5M3Dpk5soFoZcY/FY28QZZBdnAmNiD?=
 =?us-ascii?Q?SCuXXDoLAIYr8zvJ+tRb5sTm04ppsAVE5liWSSJo2NuowW9NaDTedzN22L9f?=
 =?us-ascii?Q?EOJkqLMzk8ydOeKlDlA/EXSc7sv5GPhm2Dhme7MIN9OhFvJVo8o8rps+OSnx?=
 =?us-ascii?Q?IpVLos8ZC0m/Yrgfqg9QtVCH1EQ9K4KclGdU3hPKdXseqRl2Q6prbhnNGln3?=
 =?us-ascii?Q?7pf6TFOpvKHH8j0XjNNtXq5xa7dGGJa3DyW3ve4jmZGvyaWe97oar3RPYhgp?=
 =?us-ascii?Q?6AR8sVEIwJOhIhrmq+WjpfmVsAYaid+llkFzHIh3OVD3w5DrIbE/n31CXWEW?=
 =?us-ascii?Q?AkA+ChJ1g84GAeI6TKQiAyDMrGi+bMvb6mN87m9bu5te08qutcTxYwbFDqcp?=
 =?us-ascii?Q?TsLfiSiCKtqr40QnIA/g1/lagYFErFxnLwFQu8uqf1ekHJM8Vx3pn5R0uWMP?=
 =?us-ascii?Q?NYUlbiYulVSRiUBdV23ZHKK9W9Y9?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 09:44:36.5755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba440ff0-300c-4c96-6fda-08dcdc7d80b4
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB6927
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

Revise flash layout to 128MB since we are using 1GB flash memory in our
project.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index c4af50ba6999..3073ade6d77c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -108,7 +108,7 @@ flash@0 {
 		spi-tx-bus-width = <2>;
 		spi-rx-bus-width = <2>;
 		spi-max-frequency = <50000000>;
-#include "openbmc-flash-layout-64.dtsi"
+#include "openbmc-flash-layout-128.dtsi"
 	};
 	flash@1 {
 		status = "okay";
-- 
2.25.1

