Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B02C29728D4
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 07:14:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2sLx5LlRz2yyJ
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 15:14:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::625" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725945255;
	cv=pass; b=RW6KY4SeOb7wGZhswtUe+7Nwj1Zyh/nzmgmhzK/WZRk4aVkMs02i6XThW8DUGuQe+ABr/rLQAOtrQCuaNNS2ve+BTAF+CKtWij9IU2q5S5ixAn3bWg5KndF+4cYJ1fhCQyqL/Mg81QhWabqh1ecWAWzcDTil2DuY6RaeGJCRJkZoSQpR+v4QPigS32uCKBb+RWLyzO+Q/2Qq3UPj2s8YnyxyUjOM5m1A2zfFisFvi+RZ5XggFaPwp+i7k4mwYjXepH/MasJNFop0BhZdeRwBY2xe+jgNvT26qee/sAWVot5lSa8PcKrH8jKT+KfuZRzfQzAyAdFwG2WEnI1AY+ixxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725945255; c=relaxed/relaxed;
	bh=oY/TWRr07SZO2pez9pWuWd/uW1vFIoQquPFI2Sx+KlY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=fg+a4REHGI4/ouV2VuL+c+B4bUdntgRkyFIn/bbr+xOL6O2W6pOX4nwvTt6yPdhwniYP7yIrY4OaLl6jepq4RhUeuKzpaTs5+WMagEp6ADeHUVVdQz4+3ifWQkSg/6BQzXWGBuJJQfxY8Apq6UO19upCh9oLA+9bnv8zD9dFCLngGYdgG/Lp2NwQFY4lreVqeZMHv6rLuwtI7S7pYfBkHD5u6fSshvV3zg0oMfyYei+fTBq70rYVelE2fEdtLJclNN0p46j8P5vM7Slt0d0TIm5q1Q6iL394sDbAHqSVHqtHfp63J4gLsgCJxHKuEQlNaVPhScRrnB22HyinAo2f4A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=lmxYR9IE; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::625; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=lmxYR9IE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::625; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20625.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2sLv5zLlz2yVF
	for <linux-aspeed@lists.ozlabs.org>; Tue, 10 Sep 2024 15:14:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FP55PAllpecj/ajKIBDS+A+cha5SS5Mnj5IrQ2FMZw1qsUY0upuaOcrlGcg3h7GekOlmv7SdvGe2guyG8/X21uPee5YpK5JjbPbHY1cqmktaJmyjzomFk1dj0kSS8DyHGcOuppsB6wQE5hldTjk/kKhYYk6bCLpi97miBuzf+0ArcNG+TPDt3TeeKA3RkloFLj8RtOe8Jd5YDn4WKAqM5T/BVMK+9iIEtqD/FXGruyRmW2yQQsuioRGIyqk3cg37unNgPxlPnoDFYwU6PVm7ya4sg9aTeyGHO8vTTpRkTmRvjVKlUpOOhQrQoxbqT2ArzrbTUIKgZHkGr8hwFc3ngQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oY/TWRr07SZO2pez9pWuWd/uW1vFIoQquPFI2Sx+KlY=;
 b=JK6zKwOil8gxSEFbLwu+WZsKuD7x2CJ2Wtf5ExveDx1k6GE2jq2nb9ymEYtTcJzKgbNjtAwhf6spXrZPKCsXQ5nYVQ0h95mHa3/zd3AdYHfhTMmjOm19sbk/tVimj2WsF8xRr9K8g916er9U4OCq40Ar5Q0U6Q2O4AHyax521TK6TwNkpdPaM8S1q+8y5736KHUyex6xRY1D22j9TkkrWBpEqqsHAbPrXYC0wGyvG99BJFD9v0OdZlgN8W/sV86zKR0w7ZKnKacDLxHW+4AS6QHGqHX+VmYsIyPhStSj8/8ieSXEoy+A4N8AT86DsPCdcFVYE5w+mbSjmMHmNeSQmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oY/TWRr07SZO2pez9pWuWd/uW1vFIoQquPFI2Sx+KlY=;
 b=lmxYR9IEEDOSRPCNo6QVUAQDQwiT3kuUBjgwZCJsMdrIwjvA5ns/+SLSZKFyx7aLQ2pCYkRFxsZ2aDDYwQh2rb1LuqckcWNxwiM+IwC+Cw0NV2bAjffU+kbNa4M1/IgkmDO+GqgPiaAt9+n9Ck015138cNAbUnNa79IUUmITnMZkGrs/e1uv6dvQxSY2rzm0fAWBhHWl3kHGfSSW8Y3il1axmAXy774TajERNISZayd8EAGhjZDR44+gCu6GCiAb/wujF1aOsz7z/c9e2pkQjOJqrrVRsMUMmFTR+auhsDOQtUxf+UgQOxIPEkMQ2H8oyT0KpWI01DbA7y3SZ8Uv+A==
Received: from PUZP153CA0003.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::9) by
 OSQPR04MB7990.apcprd04.prod.outlook.com (2603:1096:604:298::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Tue, 10 Sep
 2024 05:13:52 +0000
Received: from HK2PEPF00006FB5.apcprd02.prod.outlook.com
 (2603:1096:301:c2:cafe::f4) by PUZP153CA0003.outlook.office365.com
 (2603:1096:301:c2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.5 via Frontend
 Transport; Tue, 10 Sep 2024 05:13:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB5.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Tue, 10 Sep 2024 05:13:51
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v1] ARM: dts: aspeed: yosemite4: Revise quad mode to dual mode
Date: Tue, 10 Sep 2024 13:13:49 +0800
Message-Id: <20240910051350.2580971-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB5:EE_|OSQPR04MB7990:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 72943a29-e0da-4183-c8ff-08dcd1575c4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?jUXa/b8f6HToZuj/RQhq5vKiTr0ni+xrwEu5R7WbwqJct3EIHq7BKI8SXvRk?=
 =?us-ascii?Q?n3+8583ML/4iQBWa0g1KeuEF9ktYiCqKmC7gCoaD8IjRbGziYXn4LUGM/NfW?=
 =?us-ascii?Q?yr36pUvf4inOd1RDH7qzxlE/FIC83bodACCCK1EO0D6Yi9blMqOIJfT9y8Oo?=
 =?us-ascii?Q?mvbreVKEfBLGmrrmH/ZnNr83so7HkHMO4iSK7Ssg342iZK47ZYifHCatVeAf?=
 =?us-ascii?Q?E9yXNIu0Bhg6N1FnQPDKDa4FOkgeOeCTxpdrPUT6tqLRQav9gE9SMk9wlCJ/?=
 =?us-ascii?Q?wR4f2hs2/8Dy+UIjutZhzs6fKeQNGIT8k/aV4kTnRpGBE+dXu+ozFYZ7eqeJ?=
 =?us-ascii?Q?GnPA9oYhE818jwY9r1M/4UoZYtIlGeHX8vuROd6sy0sP/lgxHfMYtSba7duT?=
 =?us-ascii?Q?04VN9AWRfLZhJBn31IPxtKHzwQbuixcgeB19B+Cm7aJSd3X7xN1KiQp9qrYG?=
 =?us-ascii?Q?lZAItma+OCwPF8h2BdcvpBMWm+1ZS5YG2BG45u/rj1xiuVlQMjy9hKpedVS/?=
 =?us-ascii?Q?GBufeiguuShk+/8c4p1Z/dFk23tWj9OZMtPYEv22Re9QfPXamZKmJvaJiXIx?=
 =?us-ascii?Q?FLqvmlH/FCpvoEYfSP97R99LQ9ZM/+IfvO8mQblg8rX7EVumAGiuaai5/SXU?=
 =?us-ascii?Q?iknda3NKVEEMuoBl3rc6zJDkwy4jz7w8u5XlLJlIl0maq49Hba2hv+agZNe9?=
 =?us-ascii?Q?Fl2vjDf0H8BH9tBMvmKWsjeDlxaSOqF8fDSzs9KlyoTxjV/bVx2ZcwlEml07?=
 =?us-ascii?Q?r0EcrqIhb25JaZfR9siEWLT1IpqHHi8uAVtwHmFQYv/jq50mq43Uof+qr7HC?=
 =?us-ascii?Q?w94nVYwHAZ1HPVFcjqwGbaRbjDcxhP0QgcI1vHD0cjyzubanzhgAf4U3PMFl?=
 =?us-ascii?Q?H7bN9L3G0cnSvyiaxxf6GFfbyIshd6lqRU1AUA0106LhggtVQv7jSCdbjoDN?=
 =?us-ascii?Q?fs73wefjLJj/sWKmsq1lxRzqmmO+8fb3De/aqrbVxb8O3SVFzq885Zyv+O3m?=
 =?us-ascii?Q?hKBRXcso8Jg7GjmkdkPvykbhZ9mBmGfr34Qcuxzc8iDJ7X4BPbsO5qve65CE?=
 =?us-ascii?Q?kCXq+YjLjoQlFjVW65UxaA1u2UClFyLlFG9SQD06br7RfFjBYZC3QxR9ZsFl?=
 =?us-ascii?Q?RH9gHeGGA1bjqaLRAaHb8U1uZieNthYA3LGQs2W6RkQtZ6jjAEsvbUDygjhd?=
 =?us-ascii?Q?6NcJo0+fnezmy1Oe6EbhAfRekWnhpjb8QfhttTYfcUX1Y0jl46YSOTn51Mzj?=
 =?us-ascii?Q?pEAGDZG2D0yTLVaxDkuFOYpNiCZFTLbzPikMAeGmEhO1ixOlkSbH3gFdNGmm?=
 =?us-ascii?Q?51MY3DigWGt88Z0BsGjTKvJ/NRwDTReQM17Fs2MK0VsmTA2qSDBSYpsp6OX2?=
 =?us-ascii?Q?EVPfsqcFR/rx0E3qARBv8bjrjBCm17jcB9pKjDlhaM98nDhUuB6gPDP5T3+4?=
 =?us-ascii?Q?jV6TyC/u5w0o/51gICQPzsGZ3K0k46uj?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 05:13:51.8516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72943a29-e0da-4183-c8ff-08dcd1575c4f
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR04MB7990
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

Revise quad mode to dual mode to avoid WP pin influnece the SPI.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 98477792aa00..3073ade6d77c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -105,15 +105,17 @@ flash@0 {
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
-		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
 		spi-max-frequency = <50000000>;
-#include "openbmc-flash-layout-64.dtsi"
+#include "openbmc-flash-layout-128.dtsi"
 	};
 	flash@1 {
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc2";
-		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
 		spi-max-frequency = <50000000>;
 	};
 };
-- 
2.25.1

