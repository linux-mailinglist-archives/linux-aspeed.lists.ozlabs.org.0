Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1097972766
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 05:03:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2pSV4yjDz2yVD
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 13:03:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::61e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725937430;
	cv=pass; b=GQwZTWis7udzYpn2xV3q97KrEgNHGwDixUgfDQuFkMkKFh7psdbijQrkqi0jSVbYUgVHtkEQUeO9VTFqmhUVdQOzDK5xLPv/fOCLJfvPpIvVCE6H8X8Tj00n2KXBupkDjr6jn9FWGVRDBdL8ceUM/CSrbcKMAcKXjF4sAbVGuaPJ3Yuksb/zlfKeADLsp1qc0Tp8gTTBSrtyLJHY6yJasySSNM/lrON23llNcbbM/uAKDkXeZQFQ2ILXjfMoxB3AS2yvoykuDBmB/pa7rx8wHGmjQlErvKd3j0BmdYEINDfd3SA+qVXbz4f6VQcbKdYr8KdOR+BRcEr5NPNT8Re4ww==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725937430; c=relaxed/relaxed;
	bh=n711xcEgwGmiAV8g2KeohqJYfUwIrqGeCPOmSGYRGa8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=OdEGQ4Z4qK9suhxj0My+4Cy+F2ehiRBau9hh7ln9cwOVILIB0OvUmVIWw0xgqGd/9H2FLM/N0CTYTjZFoZyARm03wsrD6HNV4ORvmgvxdurvIj0DwvcC5bfnCeHkKjIUe4f3kz2CCJc2nlQSEJI6gvgpVDeFeS/YCTg3Y4jGPbZ2lsusLnRzNwLxXB8+yeL5FT1j9Kbs4NrNjNCu81mVyle9N/34lkJdj1yP1lPIBEZwEk6jLW9x5M5xdlzTZQh1rfiie5CnP3uOvu0QHqUVKdMoezrrOhUk7fluuW9prJnN5RcSpUMRG3ll9YZ0ShNJ2d352E3g13I04AWgZ6N6cg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=G3XtO9eW; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::61e; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=G3XtO9eW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::61e; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2pSQ0l7Rz2y8h
	for <linux-aspeed@lists.ozlabs.org>; Tue, 10 Sep 2024 13:03:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ltBadatRH+XtC9hvRR/QKWj6e2NSrHCNq5ppl4nC9DfK0ZvXcTGMejwynT/6UPpl2sCKkxNmsHYXYoCjoAAkelFm3M7Tph1iymY/3T9c/tuACLEpWhG1GU8AH7WJ8DW2JumJtcds2rEFJNhmGmZkPCIrrJ/IDskh0MXLou0IQ3BB7akm/wazqfKEDFGLcRMalCF6Qym5GITi9iV2Vp/5BbD8eTQtqfgT3SPC/+3oITnGheOnLtau7BW0rHqX5/Q14adBsZ5wDpUK9RPmXJwPQ9owd3ZjtFmxct71WMgANADPMwYqIx/9JrA8FWselxsn1Qq/pldZfW0eKuNFmTWT8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n711xcEgwGmiAV8g2KeohqJYfUwIrqGeCPOmSGYRGa8=;
 b=PVLmQ+redBeykvXdUSgMADWUr2Q9oxSd9KjiPgkLFemAniCpt97oQKJUyBftuvDBuF5fiZ0CSPVxFvmGr3eOdt4/tTXUwSKnmFYwjGKGq2k7CnQrNz4W8p0fmIkgs0GG8M+Z9MMfcsIuyE0CxJnhqltaAh/ntTcrkYSrTQkHApIqVqoFcB/9LT0iEPg5S++6H9kUCTjaRdo5Nb3r9twVdY6csz2pYaV7Li6MJteVSV+fro7NsYbQ3fd05U0J20l4OItK/Y1l2sjayUlM5IUxCbDVub3ed+s3eljWHIo39uGyUhfCVGWB7tqMm2lxlxg3XC1UJUaTY/tgu7QY5Edysg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n711xcEgwGmiAV8g2KeohqJYfUwIrqGeCPOmSGYRGa8=;
 b=G3XtO9eWTCPHRfDTxWpt2IUunhQ+GP9UQdN04uIqkvCnYlOsCrzF4Xmr39YIWIJiijvv8IX2gblRAyeiXga/7VIMMBpTDIA52OGDp0eZaD3lAhBdZ7GkXzua51UsNn8ORbkU+Hqtdgd9HiiMkXCzPKmpZlLwdD2R+B0At1Aaibi2GbOljZOC5m8S7UfmBL3j8Ijm3kcAVv5NbuParEZdJ95eo50w12DOYcCDMo0TH7bSq4nepl9wiCf9xwLgjxGCX9JLfV+6NkU7J2M+RE9id2fx+GWu1xLMqb1n1sYGvvFIIwNx6FkdbsW5zPeyU9M5jMgZV/DnsaHZMGpfbytHyg==
Received: from KL1P15301CA0049.APCP153.PROD.OUTLOOK.COM (2603:1096:820:3d::6)
 by TY0PR04MB5910.apcprd04.prod.outlook.com (2603:1096:400:214::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Tue, 10 Sep
 2024 03:03:27 +0000
Received: from HK2PEPF00006FAE.apcprd02.prod.outlook.com
 (2603:1096:820:3d:cafe::5e) by KL1P15301CA0049.outlook.office365.com
 (2603:1096:820:3d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.5 via Frontend
 Transport; Tue, 10 Sep 2024 03:03:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FAE.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Tue, 10 Sep 2024 03:03:25
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v1] ARM: dts: aspeed: yosemite4: Enable spi-gpio setting
Date: Tue, 10 Sep 2024 11:03:23 +0800
Message-Id: <20240910030324.2256698-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FAE:EE_|TY0PR04MB5910:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4c2ed7e5-8c41-420c-d0c4-08dcd14523b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?cxWW2u1gxCWbF0d/o5bEfotsYKkKYOi79owQF5IQTSOFdWcBGfOTo9kzGHQN?=
 =?us-ascii?Q?fsPAWAYYTkgnd8isoQLNifNw7DO51NmT+dPJzGYRtNpgpviGGdfaA7ALxNPk?=
 =?us-ascii?Q?pvGEi4jnjyRYVI4UJC9UAIOkT/WK4eOBsNG31Kl6vrL2FF0+GeCnvErkQsol?=
 =?us-ascii?Q?HW+EJtQqS5AOjv0EzRkhuVsV0wA8vnA7fq3KebOHPIhmSXO+ZNqbN3EjtSmS?=
 =?us-ascii?Q?FXFaNaIaPRfH531yQdKvygMnZTAC87AmM4edJENHCbR7/2Fi4z7c/nTYPJF5?=
 =?us-ascii?Q?FIFvUtigqhJct3CaviSe2qhGNzaFDLLOKoWK6d+zVuiuyZDs16J20Pe5MoWg?=
 =?us-ascii?Q?p9B6GIXG6TcdaE5UJmSR+SdCla4KunE50qYz7w7figS7YTd/G/4czUGlcvdo?=
 =?us-ascii?Q?s01uGFEyIMx4aptbo8LhQ72Rxg19huttebAkDfaU4zX03L4h8+3ocsdWmorv?=
 =?us-ascii?Q?WSvMJBjzR8x700FQGTmdRgnOjuAdfWG1tHdVArOl7uU0Fnh2Qo/tAysuPFfQ?=
 =?us-ascii?Q?kHdyC2Z14JjVuMvBr95xjpqfWgjkzr6t/VbKu1r3PmeLtX6J/RTyd0roOPci?=
 =?us-ascii?Q?djWNjFeZjAdB2PhLdZHep4qwh6qUIv0aSmqhFcAbgJRwv+E/z5/ys8elBhCs?=
 =?us-ascii?Q?7yxCznA89ZvC0jVmQtksxY5UmeJq77JGqF0XcYG5rpILmHOWXv2XW3meHtgf?=
 =?us-ascii?Q?N6+OHsnzxVNekxmCS7mK69bSNEz0eKSf2x3/X0+zl6j6FZ5e1DM8WkNvX9ab?=
 =?us-ascii?Q?TbRNkayvE7WfPYbxI6dA7VXFH1CG15WGyNU8Iz3CB9d7DUscKhKjtxxa614s?=
 =?us-ascii?Q?5rn/J9A7yhMgGVKCiLAFIPpBoXdlVGdLqCphUq4rT3+VAVM9Q4D5M/9mZoJS?=
 =?us-ascii?Q?X5BpqFabA+dvzdwWvGKLH/TdSnRfoetoxaq7mW6rYG8RaFJXvXvUjdpxlWkK?=
 =?us-ascii?Q?/HdhO64SiWSPmF48E6xr9PhWJP+TdjgYUN15sdSIv3X2gfA8ZBDRMIzz4d5i?=
 =?us-ascii?Q?KpafdY2t3nPwwi45yYMTFBkWCqLHUa6vkCZw8FXclDLoN17bUFkHNeYJnjUF?=
 =?us-ascii?Q?1m6/QT1AXNQWPcIJND3BXxDcKG2rK1pODR5akRzOrqhLDcFzUy+q1URh8vll?=
 =?us-ascii?Q?NvGyamqCjgnCzyr/3O8N5XwkyeM5QuDC3V7U50kB7h3k+vYiv9+ROY0YqX6I?=
 =?us-ascii?Q?f5fa6oBX47owS4Vhog7s7fMYI5qvdd9wxT317H4VqZpPHvEt8mvS8t9ofzsz?=
 =?us-ascii?Q?PX2KezHLCzAtOPL8bMq/tPVn2CBumoEkg7ydSUmWi33F9RTXXoRYn9lRA1LW?=
 =?us-ascii?Q?3oQ4HPCYv8d2CtrnHHkryInIgfQf/T3ZESdRT2AcuuBjdFuRPRurdfE8QWnt?=
 =?us-ascii?Q?jZrs2z+KcCYPBf6ymX+eGSRm52LBJl75QMD5MAIWab8OQiVTA2ElDZc/811D?=
 =?us-ascii?Q?LQAXrB/9dvGpzWpu7uncD3A4WGJ/u4r2?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 03:03:25.9490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2ed7e5-8c41-420c-d0c4-08dcd14523b5
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FAE.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB5910
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

Enable spi-gpio setting for spi flash in yosemite4.
Add tpm device under spi.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 98477792aa00..fdf9040d655b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -34,6 +34,24 @@ iio-hwmon {
 				<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
 				<&adc1 0>, <&adc1 1>;
 	};
+
+	spi {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sck-gpios = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
+		num-chipselects = <1>;
+
+		tpm@0 {
+			reg = <0>;
+			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+			spi-max-frequency = <33000000>;
+		};
+	};
 };
 
 &uart1 {
-- 
2.25.1

