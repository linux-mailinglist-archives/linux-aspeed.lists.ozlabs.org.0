Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 908CE95456C
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 11:25:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="::1" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=R+mJAkTu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlc5s3NThz2ysd
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 19:25:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::622" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=R+mJAkTu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::622; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20622.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wlc5n2cs7z2xst
	for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2024 19:25:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njfzqSxboUS4gug8RAT1jk3fWRD38km5VBs4dEmYGI1CvonoCt8NyeeKVGVI2xrJKxCEdQ3g8QopXt7Cq1ik+7VMulGEGGIjIg/qdC52qqmDspoR7Zx+a4oPtnXLOvRffkbcDmk1QLllCdMQYzEyc2rrCUQlA/HXoP+cvd/Y8waeCtOkfIgt1gssEFSGE00kOZw2UCJxs95hM6JmEvU3pwaOk7Q8JQHfhA7FXBXMD2+6flAJlGhu4MHepi7pVOcT9RSCwYP2sPNyrPOL6RFA+FX6WZNlxE6CHejSH3c4rYh9PUn4jXNH8+xRknVT7eCCcM9neWFdNUuo9nX7GymcQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmNKl6yn93kcqul1yKpNviuiMr4uSmPfzjmHAX59pcs=;
 b=nRoY51ifdXg1lSUzwsEDcwNK4hNYg9uvECr7PeimiU2jJ/kWlHH0EmAvIJ4ZZG4YLQZyFp/bTTEeJUArOaqDMx6N5hUUG+258OB7THaDxCkxdZlKAX7Dsyf5E8NQQ8wQA4uzWYXIKQrCYSo4q7k3mlZ5I/VreMBjDaAgMvhsbFtwlcLT93Q39T953lt7Yq+vNzMuTJKrd+mYp19gThhsksxs+DVIHtFI7zwmUyVz1ddKikc3Gvo95/I2gBOlwmb+GpWIRkK/qNcHDW/+htbnfBGIqBPybwDbnUg6x9P9O3CH3b28JjX11hgifeXQ3O58RUDFc+uDb0JGGQqRrmTS+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmNKl6yn93kcqul1yKpNviuiMr4uSmPfzjmHAX59pcs=;
 b=R+mJAkTuwlSCq8F+RgXsEe/Ulb5ObxbUJJ0F1o8w67BD4EiS8O3vAbolAnJkiG7q0f6nZfYnQbD4phBa1bfKmB2Ex7gXbvX8PCzEByDvJRHMwcP2MEkynjLkCHwhcjsJz/5zME2oLjfd9PVh2V3isfDv7Qg5hYl+rJwfpkEIqBdbm7EpHf8uaNWi47Cl3ZlL6iFH2g4pKC7PTpY9MeNAv9J8ZT2PhBtT/c4nvPSs3HdGtStRuE07fVAjgxUcNCwvGJMmNv4SKEe2dkq8jhECaoxNlvpq/NTNvUUQbJIOQ5ChZTxFA7SqiIbJ3RS5OPKmtOvBi8p19xa/uXYOHKU9Rg==
Received: from SI2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::10) by KL1PR04MB7078.apcprd04.prod.outlook.com
 (2603:1096:820:fa::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 09:24:37 +0000
Received: from HK3PEPF0000021D.apcprd03.prod.outlook.com
 (2603:1096:4:193:cafe::a3) by SI2PR01CA0047.outlook.office365.com
 (2603:1096:4:193::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19 via Frontend
 Transport; Fri, 16 Aug 2024 09:24:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021D.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server id 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 09:24:37
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v12 02/28] ARM: dts: aspeed: yosemite4: Enable adc15
Date: Fri, 16 Aug 2024 17:23:49 +0800
Message-Id: <20240816092417.3651434-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021D:EE_|KL1PR04MB7078:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b703381d-fac2-47ed-6f46-08dcbdd53fd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?qmHpKBGcRPpYhaHX+k6OgKBfn92d+/rmXpbFJ8bN3ENri1+pn+cF12LuPV7y?=
 =?us-ascii?Q?nziL04qsKiL8VojGfBj9L/DyBNqsragvKUNgFJrAUITs13K4pvnlyfA3lpDy?=
 =?us-ascii?Q?DwDKwvlCYT5mcLxfEntXpLdEYf4+KUPhI8wdVek0R7UYwhdbeChTzkvfrL8D?=
 =?us-ascii?Q?nxR3Az9t9ajkrcETcFQHhmkH7oq3+U8083XchU6rK3Q84OkMfxyy4zYBvW/E?=
 =?us-ascii?Q?cMF5tEr2L0AFv7B08QsuL5oLQH3cchA992wvxFUmiOKZZCE511DjWOgVENmE?=
 =?us-ascii?Q?eyCCS5rgrGeN/DLfMQ5ypVRNVwnz6f5PcghxYwRyS9em7/Bj6Dn/vWvtDHmn?=
 =?us-ascii?Q?IhbcRB8joDhhIj6Xq6CTAMsc804m4Gcr+8sL89be3RQQgF4wLC+X+wwThgMz?=
 =?us-ascii?Q?oOr94q6WgqiOETqhOisAy/uBFplXE0IDb0N1la+ZHYN75RMDOW397d/NdA5w?=
 =?us-ascii?Q?6MhPiJHcUsZj3d0SCnfPuPEHwsVGmE4eu+1IL0qjhYyJ+q5THv3b29/6gVok?=
 =?us-ascii?Q?i1YQGPtFkP400axKa7bAmdH9UkmoCrpY9PxKJ1mENc5pnscPeere3norIR1e?=
 =?us-ascii?Q?+7szkS/pydlTn2K6W21PBc7MgqLVstJ8mLUtvOWyLM0jlLIu7gNemlrq+V1C?=
 =?us-ascii?Q?kUs+fDhZzB0g0K2H50WhP+sGdW3LhW9uWuUaZ6F7vqbpwFtgTuqH6pYtTq5o?=
 =?us-ascii?Q?lJYd4Mo6d8uzwAwWZk+HBGnGqWwGfhdGbpJZIKYzILqL4NU6lnjmr6SzXgDX?=
 =?us-ascii?Q?Vsod/GS2ZmvhHOomRs5AP3d7nROvTOIjkA+k2L0gw1TNRmuJmuQFR2wla+tm?=
 =?us-ascii?Q?mzjeDUAt8c+cB2SL3uZiWPbFiLdrwmi6z4pVTU9BB4sTANMxIomTOdI9XtgV?=
 =?us-ascii?Q?KQkPHwbIH1JPK9QNwttbsG7XIWUgfx3oV4b0Mllx6TZ3CcbbwJxihzbbiL1n?=
 =?us-ascii?Q?uPIcKgZ47mzWqGVgcXWdtEAeZITQ2qe2yWeL8etfuSo9g4bF2SCSk59HHX4o?=
 =?us-ascii?Q?Qk7W2wbF5WReWM1ELggpc88vksMrgNTHK7d7E1Aur1U51zvFrIbIYpDCPwJe?=
 =?us-ascii?Q?8uANzDnlnw9J/5HKdbVhEB8xPitTucXasVvptGYYE/8c3SYHWN4Q9/SwYGhf?=
 =?us-ascii?Q?S2p+ai3RYIrK+a4PtfRyn+2m/bQ7Q/681Rapu/W3USUDTD7YBukS16AE1/BF?=
 =?us-ascii?Q?pwBPEyRUWLjXXTVS/rOyTSly5UoaMDlYbmAjETgt54Br5uRurYECggQxgiKi?=
 =?us-ascii?Q?GbGkjlt4aV0tBmO753TnoWtGSfv73AO16pY99nB89cZv6DwDNc9iFY2jioLX?=
 =?us-ascii?Q?ZodUsblI5+Y63srvJ28X4Yfw0Bw1GrQ57RqPo7eqi0A/jZNXbWKVykEG+eVL?=
 =?us-ascii?Q?6xlG/cQAzqn142YmFetAd52jGk6aNV5hwxYKx7oaKOgMj6x4L/5mMAJ15omI?=
 =?us-ascii?Q?Ea/+cu6S07s=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 09:24:37.3566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b703381d-fac2-47ed-6f46-08dcbdd53fd7
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB7078
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
index ce206e2c461b..0d659ee2bc19 100644
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
 
@@ -925,10 +925,10 @@ &pinctrl_adc4_default &pinctrl_adc5_default
 
 &adc1 {
 	status = "okay";
-	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default>;
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default>
+			&pinctrl_adc15_default>;
 };
 
-
 &ehci0 {
 	status = "okay";
 };
-- 
2.25.1

