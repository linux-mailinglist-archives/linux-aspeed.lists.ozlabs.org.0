Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F67095E87C
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 08:24:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsgdP0wV3z304f
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 16:24:57 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::610" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724653495;
	cv=pass; b=jCGEnH/FkDr/lrWkuNiHrlTJgT4ZwmBfx1cIPkqWNOCupb6+I9cMb66DHkZYYJyQqI0bwFtSiSHZ+ycAAP/Y/gFSNeWtVb+gCVkLnHq66jZgAX/dFzOENjFHW7iEY7HP1u70GFxrl0k8x80q8trNPu+oMrns11KWAlrqn/0IdxuLWT6hJFfcUIrNZ8DJrunK5uEV9xwwSfNLcoiJQB3KQ0rKi4UPPinoxpPS7W27282n0bL9qhVtj8I3/lLBEsCDPSq0H/5Bpj+qQ2iowO7JYtRUFhBJws2sDDayzK5zyzlc4vmouykcTajU6bpQkbNeIzRZNtVGrtvfUwBeJE1mpA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724653495; c=relaxed/relaxed;
	bh=dmHAwAuLtww6S7Kx24cCQt5tMxYWDkSMHxAXTvM1SXo=;
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
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=JrtBwP3R; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::610; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=JrtBwP3R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::610; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20610.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsgdM0FlBz2xfK
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2024 16:24:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjrYmWjZeSdksw8ETbciDNL+rpHxOsvKXg+NKDghSbLsHVsdDCpqw4Izeu8Ms67klSOLSHJePHVV2/GI0caOpBiH/lyrFjK7wJQN6tFzrOfocWHMWLzJg3LKznfTVyxb0Ipyt4amf7A4lXeo1CLXLU7yxDz5vGZkyhtX3Hg27nFc1nG0aq95dZJs709VNmmJfUylYgGwIlc06FZJ0m9IxSnVE0q4nLoyFk4I5yI4iKJPt2+6zUDSduhUBflltQvDfN5n8o94WQyNZU1b5b7F2vuJwaZ4GZVUS3ZwRP3depktk7QTGeXTxKCMTPtAFsajyez1M8b6ndDNG9El3CIRIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmHAwAuLtww6S7Kx24cCQt5tMxYWDkSMHxAXTvM1SXo=;
 b=K995UXyr68bd6IcIslqcrrJ7arUezaET88gIU/eI7lknx81T/9jBnxzukOu4eFe0YKkuRkrBHiWqHfr4Cw8s3A9nwQN7ejF+df8lFmcdlZZHLNTTi0V1c/nGhNR8Ol1QR/8IGPd9lUvqy3sZRTNSy3Xv4r+gRGYBubSSYrX0Z7sDgJTnNhWi7Ol+J2RQVHQjLMpZyOVrofXjapBcESyop+KXXxNWlisG4iiccUZW3FgaV4/glTO4P/LU+PwSYqfgFaVAjp7NyQ54hp0+g9d7X+L9iwWWrCiz3xVNNQ0gnGlngByzUR8dqbNOQxxaY6ReXRgKI5astb7bzRnyKWE36A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmHAwAuLtww6S7Kx24cCQt5tMxYWDkSMHxAXTvM1SXo=;
 b=JrtBwP3RJzgkNwhvBoxGwzI9kiE7X6u40Do/lcNv9nILVgG1hIMiHiQgeacO+t0ToF47sJTKmZdE7hGzeEFYoXFOw77+L8GyqvSbQ1ddwv76zk6TtBzW9/MKzdLvRcUnJZ5TcfAG1cYoRDvFP5l9hpLbZqK8pDE9Lo0hMEFpJMzMnGWPWEIaUD7DAXgKmyCoC2UzdR6+7A1HnLbOOpbbYVxKV5JwxV5k0jqZsLkOrStmkUJOE4WVA5dW2tu/GpZ+I9PKlVo63OvGGaWWgEFQGfGyG29Iu4p9+u4G8o+OsiXgur/aW/noEXSxwy3Nt6NTE32HKyxRyua7U6Juji4xvg==
Received: from PUZP153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::14)
 by SEZPR04MB8215.apcprd04.prod.outlook.com (2603:1096:101:230::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.23; Mon, 26 Aug
 2024 06:24:30 +0000
Received: from HK2PEPF00006FB0.apcprd02.prod.outlook.com
 (2603:1096:301:c2:cafe::ef) by PUZP153CA0018.outlook.office365.com
 (2603:1096:301:c2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14 via Frontend
 Transport; Mon, 26 Aug 2024 06:24:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB0.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 06:24:30
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v14 03/31] ARM: dts: aspeed: yosemite4: Enable spi-gpio setting
Date: Mon, 26 Aug 2024 14:23:37 +0800
Message-Id: <20240826062408.2885174-4-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB0:EE_|SEZPR04MB8215:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: db6276b7-534d-4687-947a-08dcc597be74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?U9x4mpP83cXWbCwbpV/B8zF3sK7BOIjRR4FNkRL1oVBJppzLokA23b5WMJiC?=
 =?us-ascii?Q?nMQ6AbK7Fl5VlqKwXeJWUFOuqt9G1FYHik/Oy3GRIOkrOr8nt7FTtIdMsivI?=
 =?us-ascii?Q?2+c4qng+Y9xrNuF6Z1QrkJEpzPLqFLdvNq9YmsnqdPvDAdsWb/p9IQSRq+1u?=
 =?us-ascii?Q?f8mQp/fihpQJZha8IRV9bHFwlHDoc83FaafmUpv3VBG7cP3DSHvaCv37m1O+?=
 =?us-ascii?Q?fo4EbdFKpmGFYwWgrfVbA9Y/lrSCN0/2SgOlFjRgbgftKq+gYImj1kRyyLiT?=
 =?us-ascii?Q?9NOgj3WH18/SIZ6g1gPDX5RoWR31uZtTW9bOgWnLVTIQsuRXSXF9YmTQjQxv?=
 =?us-ascii?Q?QLR0frBFhuuu5QvF3n7gApni39SvlmGInMeY4jfyCDCpTGtvfkbJ2F2CR2IH?=
 =?us-ascii?Q?Aqxxd98c3VMM+Nct2URMcaF63QqZudaRaeoay4LHmTiIpzKPHlgUDWgTVWI1?=
 =?us-ascii?Q?UT26OvHSseNGb5mRdYxRJ3mfKygdHlIOAvbhYexkKm9wkQBHEvSD6r1e3b2L?=
 =?us-ascii?Q?k5q2WM4T0Zi3mB8j/W4vGzaH8LT1y1INjKEAi3/DeLMsCApSELTPQta7uvLD?=
 =?us-ascii?Q?EBx0OdfLf9oiybas6To4dPU30zruUQkxojCt3nNjRrs9uv2XBQp8ZsxrGLRd?=
 =?us-ascii?Q?1a92o67kezn/2A1VdpwqPv4iO9rV0M8pVNawhEML64vAuWJGeiT8Fxu8dTIQ?=
 =?us-ascii?Q?9G3tFL5WOWCfbO28jKYgUOHauLtORpB4J6W53YtMyPL3nQ8x0dDVZ3oBJTNE?=
 =?us-ascii?Q?o9gfCOAPrWgvFTyrv9s9QWMcBgH4RgoS0Cn1O0vq26Z1wiDXlxWzKlXa3isx?=
 =?us-ascii?Q?SkssEh+Mcjum3xOuXBKVWpY20oDTdw8Q5rqPH3Ys2EQGDlx4Im62B20JQ+91?=
 =?us-ascii?Q?mFREpHGopRj8b0IZZibJuksrMeSARm7kmuy9TcNktaviuNOIRjiJ3xS/qk5v?=
 =?us-ascii?Q?rOPEAB2SeBSt8DuyYAAqY3koGiVv6SkDXKVYMJSWIrBhbzuY0A8Oa79FWlnF?=
 =?us-ascii?Q?XkxzFTO5XRyHrHXj19aGI3C4P4qhXzpgA2lflYABsagQSuwN9ZLOKvoAHgDc?=
 =?us-ascii?Q?TcygiGtsB7CUHNgzymfkjNjk5NTY6CCs8FgG89LEvzxBTQGcIidoU7pnsDue?=
 =?us-ascii?Q?x3m340UsUS7TUtBdY1m/NiVk9jYX8UIgdVIdq+vrdirdVogviuTpCvKFmxuk?=
 =?us-ascii?Q?rNFp/GrLH91lmDVZaXXat6IXpfuccR8R34hYzxyXE68QByKKVc9kpHZVfj3h?=
 =?us-ascii?Q?kVLA2+eAj4rQ6mmcPI1Cu3DTXBoaEHKS4RBFhGENG1djNRiljgWBrXRFNn+t?=
 =?us-ascii?Q?oXeSsvh7DP7JDigGe+owehYgmF4bNQakHRFRdMhz7si/pFAhvNS56K68Nerc?=
 =?us-ascii?Q?Eq9nZjaL+3TNy4LAND/MM8KvIc5GsICwOdwc1kX9ZGxG6VtVMgiyUD7gjzUc?=
 =?us-ascii?Q?cYOPO2xXI2JfmWuVD8sn2MpOm0Y6k18C?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 06:24:30.3625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db6276b7-534d-4687-947a-08dcc597be74
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB0.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB8215
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

enable spi-gpio setting for spi flash

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 0d659ee2bc19..575abdd530df 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -53,6 +53,24 @@ iio-hwmon {
 				<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
 				<&adc1 0>, <&adc1 1>, <&adc1 7>;
 	};
+
+	spi_gpio: spi-gpio {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-sck = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
+		gpio-mosi = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
+		gpio-miso = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
+
+		tpmdev@0 {
+			compatible = "tcg,tpm_tis-spi";
+			spi-max-frequency = <33000000>;
+			reg = <0>;
+		};
+	};
 };
 
 &uart1 {
-- 
2.25.1

