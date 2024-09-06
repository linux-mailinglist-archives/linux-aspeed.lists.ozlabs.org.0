Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8B696EA59
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 08:29:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0RCC1bk7z3cLm
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 16:29:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::610" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725604149;
	cv=pass; b=H9RcHeY7deU6Lni+Dlr/o8HBusKqFC6BkY9UgJSSy8M5ufedWa8YykEpORyA6e2HGDgNiNHsGLSNL7TSpqY2cAQC9/l7z24JgChjp6c4jIRinsVyxT6W4XnCZ3nXk0KDus3ITb1Py+Ch3Yi+zQeIno5lWN73l8KXmYf73cLCPv/913PRtL4AI/kHA5V5chJ4VGIcdhgvG2AV1Q1xwa/HxcqhZfk7meP1xo84XjF1RXiBq2oZXdTYfr9IrBH7iHBg9e0BISlR0LSIuWhG+Os3QXIZFaVNSAYXAXCJT/NGXKAuGwykWvQY9G5S4SFj9FRzoE6ToNtTZ5QwqFgd7bZwwA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725604149; c=relaxed/relaxed;
	bh=LgT/6R4EC/XEEfY2gUrLR0f3dvDaYSzSpR2s+GBhOIk=;
	h=ARC-Authentication-Results:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:Content-Type; b=XpuK3zoENUMkCe4ZfmQtU77kPOUAXPpFCD6qHI1cOI4ptATe8SQ/7FwmS2eJdcOO4WfNc8PSS1632kiNfbs5ZOCR12KvTim6lsjKZ9ve+5kxKTce4zjcbvnXr47iGf/oUWSb21hjSP4YjJxEuvDCxskL6YeLOEWkcpLRzfEql/mLPchcs/oyDnmx2ZgE7cOHIJa2YwJpvBAhs8KnME4dKXrjTTV2H5Rp9VAdXc4HYdC32ywxk5x//hBtXEOXIZOgKzFtQmQbMHT26btKEwK2VEMSYlMJkOuIwTolqFzEIzGkkB3QyEOoLFyDTcQj8GbKX3ST9BahvO1n7S5NARLN9w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=iS0uNLFO; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feae::610; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=iS0uNLFO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::610; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0RC91NTSz304C
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2024 16:29:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouIPbbH0D25vYKwlSPhIQgpYXnN4iXSbpawCeag6gbx/TDZLasNQGTPFX8xdC2jQhYBWV6VtY6JMTXl34W/Fj7fkWZvrIIZ47Ufs/GYuq8Rt/IhmgoZOWFNx67gdPtnv0jDnimDSD0AKkrsFlGVnweA/trAG0+8+j4xS+P8p7yPMkQ7jzumrZDXiuI21cia9KMoDXI/mVzZzfGgib2HmvpHK907ADWar0xn6SrWpqqlPWayaVvL0XvqgleaejOQ6uAJgKFnu82ZYCQGRSHHGSas/xpdHZe/HVTszWk5VsF5pDhTelE3GaVwe45GHnBfJi+Mgc9KIIPuKC28yZib5aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgT/6R4EC/XEEfY2gUrLR0f3dvDaYSzSpR2s+GBhOIk=;
 b=LRf78R6H2Jlat+kB5lWPUv5/Jf8HfxV6MI35Bc0Gq5u4nYOk0ZyrVH2+HpDgUeQlVByHjeiU0YJPfsGYFQqLnmA7Jp4x3xO+24Yw7ZTWmOxSVBpm+xgpB7PqrMC51J1QpncTcrtsIgE+GFsBK1RAiYOmzFysQAIonw3rMZ2aavUpb3Cw1cgZEX522DR+sAQUuu7GL6bV3FqDk+8jidpCWUi/m2bEj0U52M57rCAfg5cCUOKL835iQ9YSiKZ3OIwSgAeH/7sa4v5Wdz8n0T8xin+3S+Sx2e5CPSQ/QbaEOQFXcdwh6R0VkRXxQFLiLyRDnTliDZmEC5jEIHlH7GeHWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgT/6R4EC/XEEfY2gUrLR0f3dvDaYSzSpR2s+GBhOIk=;
 b=iS0uNLFOJW2C2FLtmsMZ4wu7PlJlAdI+3p1xQe0Ypkb7Oph7khRqJODNiDmnYnzl1fNE9+z/4JhFaduvfNz24nHw/ebfSONqWcLKI2PEkNY0u67kXlIw/sfBtc2JXfsjUVT2wmYQ4aVeg0Mjeju2HuxEEui8hEzAqtI6ehgmoJgFoX+r8xSu4MTpVYmtnzkqkI+cSSn8YDEx755iDgDe1xHXdrqyIqABk5SxouH6ixgfPp8607UH0d1D1ooqOh0Cxc4B9ftcwloMm4u9AJQ+jSHX0duYO4j78GHtYXwGBaXUf9Rk5WuZEOV8piVeHGwnJR6yhHKCvVoOxTt+dx9POA==
Received: from PU1PR01CA0016.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::28) by TYZPR04MB6088.apcprd04.prod.outlook.com
 (2603:1096:400:25c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 06:28:50 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::cd) by PU1PR01CA0016.outlook.office365.com
 (2603:1096:803:15::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:28:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:28:49
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v15 25/32] ARM: dts: aspeed: yosemite4: add RTQ6056 support
Date: Fri,  6 Sep 2024 14:26:51 +0800
Message-Id: <20240906062701.37088-26-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|TYZPR04MB6088:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 20981c6a-a06d-4109-8897-08dcce3d2b9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?gFAJ9B7xAMJecA28KkpDU0BG/tGZK0wZBNPX5XLZExAurLkPfx+E3cLwweQq?=
 =?us-ascii?Q?0SD1r5NpRIzsjBIBg6bH49qp0Q5txACsF4gti8XzWYAU7XXqxIU3F2Lju4u/?=
 =?us-ascii?Q?U1uKxK8fanNAOm7eTbVLPM7vCaHCRf1LJdJsV7Jdx7tb7MP6mOAHAGV3mqZ9?=
 =?us-ascii?Q?dj8oTazz3X3NlGq1MOqMuH+rXf/AZKYyTcLEmyujYCrRSQSOQWy2Nfq6nJZX?=
 =?us-ascii?Q?/9pJ9IxFZoBqt39zo5pViCcqvFymDZDIOsKaB79uZkQwoW57ePlfBm1SfvI6?=
 =?us-ascii?Q?MVmkgUp72ndODvtjAp6rPl9pzLIyBX9jLf+a7weVBWvC87oE2lonO+3WEk9f?=
 =?us-ascii?Q?JaDnh6BccfDyhTPGPn0lzU3B2Q1kvnnFTyX/rW7lnXsop87FyNM6VJBXZwnM?=
 =?us-ascii?Q?iT25leOndBeaBklx8vwSL+uX6iVdvcmwm2YNUfVyFKOuY2OCvUzQF8itzZiM?=
 =?us-ascii?Q?hYm45jTv23ACOKQ4ZT+4bhBrMl66iW2z0WPYP8mJus1CER8UOEC+2Gb7YNfD?=
 =?us-ascii?Q?MpOMz9pfFKXUDhLZnBA6dbETHSeudJZaSHRA4UHPyklpYiMN4wbmTIbfJqSU?=
 =?us-ascii?Q?4nRQ5WSxXrL46+c3d4Xg/RWaUPbRq1i9Dc0wzThM/Wz93fDSFkeDqKNsowss?=
 =?us-ascii?Q?guVRbAZwzN20JmY9D63oXGuhkPBX1eT6Hc1Yrr1wwgrQA3urajJ/qbm4p4th?=
 =?us-ascii?Q?lNJNM7k0xNhMGM/Fnek+dBViuuJ5D/Qqf0pfRKkAvaX31977SKD0TC88rjVr?=
 =?us-ascii?Q?MR26OKng5g9JEScKQcmdIlfk4nmRX740IVYfQ5OZMl152+JF/g79Xgm1RuLu?=
 =?us-ascii?Q?GbYH/o/WIzijaJZhTdgrCjmfUCk5NfuvKTNnVzlzk0HmOZyA2GxNKXElCwq6?=
 =?us-ascii?Q?ksbgpEAfTtKqTkjjvsfqO3au6+Kqy1KY8VcLfVWoC10qzArtM277ExrnAPrV?=
 =?us-ascii?Q?62wZ3s4CphVtvEHrEIJvHyB3qoddjWjtQWv3f0a2YGuF5OIue0X55z+sPdP6?=
 =?us-ascii?Q?BdmL79B7qRcaOfmus2zfbUmhGpgvlBcyANIGPA9Q90qAODMzLbUici11PpU7?=
 =?us-ascii?Q?U6/n0exlY6XR0M6K1OoS1HaQl7bd3iK5hVym0PaonxBnROFAx7VAqaGpHRL8?=
 =?us-ascii?Q?IznxMOd1SmDzzLGehoBmHosmcbz/mQM9r+baS/4lobrGZhF82/irGGaFp/qR?=
 =?us-ascii?Q?BHrzupXDXJwiY1ca6+We2a78/PvTN81HWauygY1p/VL3H8k4jqEXottKlZ7v?=
 =?us-ascii?Q?PKpk/G8WlSKn/mm0eJLks2WQhX7oqYT+uO7OW0IeDi/FbdaogTZ5+V2Frav/?=
 =?us-ascii?Q?mEykqgYsFUdCQXt3c0VItSB6NHfh1GbKFVKuXoALkOnl7ic4yybt9PR7E5b7?=
 =?us-ascii?Q?xiScjPiutMoGe/ps1t+kTpbXkZiVponG4JjBnEytWYh2PoKg1z+VPc9A0g8x?=
 =?us-ascii?Q?qH83YfP5fMtl0HRp9pS0IlouHCg7YKba?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:28:49.7092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20981c6a-a06d-4109-8897-08dcce3d2b9e
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB6088
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-aspeed@lists.ozlabs.org, Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add RTQ6056 (spider board 3rd source) support in yosemite4 DTS.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index f73719b3c2f1..03a1e41312e3 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1240,35 +1240,35 @@ adc@37 {
 	};
 
 	power-sensor@40 {
-		compatible = "ti,ina233";
+		compatible = "ti,ina233", "richtek,rtq6056";
 		reg = <0x40>;
 		resistor-calibration = /bits/ 16 <0x0a00>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@41 {
-		compatible = "ti,ina233";
+		compatible = "ti,ina233", "richtek,rtq6056";
 		reg = <0x41>;
 		resistor-calibration = /bits/ 16 <0x0a00>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@42 {
-		compatible = "ti,ina233";
+		compatible = "ti,ina233", "richtek,rtq6056";
 		reg = <0x42>;
 		resistor-calibration = /bits/ 16 <0x0a00>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@43 {
-		compatible = "ti,ina233";
+		compatible = "ti,ina233", "richtek,rtq6056";
 		reg = <0x43>;
 		resistor-calibration = /bits/ 16 <0x0a00>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@44 {
-		compatible = "ti,ina233";
+		compatible = "ti,ina233", "richtek,rtq6056";
 		reg = <0x44>;
 		resistor-calibration = /bits/ 16 <0x0a00>;
 		current-lsb= /bits/ 16 <0x0001>;
-- 
2.25.1

