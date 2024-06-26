Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC354917BF0
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 11:10:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=SsYx9Aq6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8GBN5hyVz3bpN
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 19:10:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=SsYx9Aq6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8G9b520mz30WS
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 19:09:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+yVMldZWwSxNLxgt0UcOTB5Y8DLObFQQOCWTlzz2bZJ3zIpeKXqQ9MOdDZ7lMlp/qmLiv4rFqjeNEbYEfgL5vBfSK4f+yOqJ8cBxLkIKKunI8li0kBwiV6itEMU/sjaOC03kM4Mfc8JXsnK0xkp7xYs5Uel+TJOrPMDpvq2ahiDnLMEU4fJwTpwBhhDGG4jqo2tJryrCnN/F5LCUbL/+E7V+7jfbY3iot1aZDYgFVyv4pHV+9DA3plUldx2+u/xHmF2HFbK5tQFMns9wRZ3XGU9/XU0FKRHulcd8v5HHnlpp5aQeN2Qiy/jsEv87M7289hznn9wEglJyQDzKbs/qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ao7fvAjK3IQD6iJqNX5CwQBfagrwWymJ/gnXrH1K0Kw=;
 b=O5kRSxa8sVfMR9ZDG988uDuoFeGOKBeAe9Mz1WmY8dDQutYiMiVfGKApQ7oThj/ps4T5yl4z9lhoJHicDvXRHa71i76h0/BygD8eodmJ8XgavKIVobHkFjpixkg3o9+ONKqXxHKTIYy8FcfmMSzJDdgaa40pDCRNnTQDUCnPbKiGwlJJvwi1Tj+cFLRlyUdmdhH4SvdQDbvgUgkH9QrDKfNOVNsGzx9FuxvSpNe8EghFTa/YJuoqFA3IsOka+f15UDyRTawHdw8CQqRVjNxdoecSdM4x91dCZRZTwAHsi2Xc7pW5m/jqHXKZjw5/J+dgGOXMfRF8iqASZxwTJzHvFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ao7fvAjK3IQD6iJqNX5CwQBfagrwWymJ/gnXrH1K0Kw=;
 b=SsYx9Aq6O3JLpmobO760QxshmxgeSfIa2CQSEbedz/EKmm0S0TUbJjmRNOJVAnUWZNmeuusxq9InQWyQiqZnE6DbMdQBYR+Tql7fL1vNiAsw+W4D6mJpSmQXhEFYPTsiGeHwsmRvC7Xi7ziG09qe79qq+Rk4V/Lh4kY1O3bfq96I1w2rBbLItL73wNyDz1vKLnF0N4ehexaYZl+uDGf+wmE+Cbyp7U0Vh+KmHKO2RqpOd6yIS5RLfGRX3aDFFCRsxew2iT0Hn67Dqkbs1P6Z6gwQNXwfNf5dwYtX+QIN4qlSpq3x2imGoLaQa4VHOdCOeF5zkC3Ws7qemqkmHah0Aw==
Received: from PS2PR04CA0006.apcprd04.prod.outlook.com (2603:1096:300:55::18)
 by SEYPR04MB7261.apcprd04.prod.outlook.com (2603:1096:101:16d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22; Wed, 26 Jun
 2024 09:09:23 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:300:55:cafe::ff) by PS2PR04CA0006.outlook.office365.com
 (2603:1096:300:55::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Wed, 26 Jun 2024 09:09:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7677.15 via Frontend Transport; Wed, 26 Jun 2024 09:09:23
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v9 25/26] ARM: dts: aspeed: yosemite4: add RTQ6056 support
Date: Wed, 26 Jun 2024 17:07:41 +0800
Message-Id: <20240626090744.174351-26-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|SEYPR04MB7261:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2c0ca5b5-4a6a-43dc-750a-08dc95bfac00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230038|36860700011|1800799022|7416012|376012|82310400024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?B6S571HPiWAPQHvOe04XtckwkKBOC6ARnvi/AgX99/XF7yFmGCoFT+z41Zs4?=
 =?us-ascii?Q?GpEINswzybziD6+1mPMiNh5FXy6SSqGXRWHgbxmYqUTv/lJs+DfkIBFojmuG?=
 =?us-ascii?Q?HPzRiRUFOFefFrSEL7S9FB6PU7yDFRMkmy3+wKnfzEYx+SJGBu1YtO5heVOF?=
 =?us-ascii?Q?TdnrvhlnxFGR+Ks+Eevf4H/TG6CUaPj/lo2+OwghUc9E+irBAufI/MDpv+Jt?=
 =?us-ascii?Q?u+omYtc36c2bE0sQIEiXVk8QyTLtulTW3I5m0BZxvfQA4P3mmM8omMzKj7rA?=
 =?us-ascii?Q?owRwufIQsudPKN2cw7DffbMZYH1SI37A0yRHivsK/t6dfa7DLY7nbuwTjUff?=
 =?us-ascii?Q?1sAoEFXRoXSiYaJ0USIkCDpnPEq9lmJ6V4/NuIeQ8G8feplB3LM0Igm7r5w2?=
 =?us-ascii?Q?O83XAna6nDWe72zv06jhPcUw2/3x2wjaWZLUyUr8KPKitM32Jk/WmaKrAkhz?=
 =?us-ascii?Q?5BJAVLVgEGuhfjR4/SQLwBcC5BNSeCtnBLvxl0jWtGk+Fa5rOePR4jNxbk9b?=
 =?us-ascii?Q?qymqS+iWureIF4ovdzxhmyGw5qYQcZ8GfNC0Xxlt7B4ciqKQ3VmSY0nNP5R4?=
 =?us-ascii?Q?3E2NZu9nL1p8m47VjDspoOUaGpcTOB62HjOXxxO/uijhkmt/RHXV9QAwzb8o?=
 =?us-ascii?Q?nP7idwok9C4zy8H5oS//bPIt+xWl13ujAxiaotBdTxnc3UsOT5HdpwiOrkDN?=
 =?us-ascii?Q?n6gzDfI1SNjkYGz4dE3InhZcHh2fjX2XyIK27K/Z/L+r33/5VxGPGrNvO9jD?=
 =?us-ascii?Q?ydkODdzMhNNltsL59NQDJsEbHcD05RcsOnY9pnRCKkTdsUXt8zgvCyiabR7x?=
 =?us-ascii?Q?isq0XI4Kkk6Fq/BWVdSGzhqTJHsb6xQCb4o9x+5FZvL7E9wLF+Ksz2CpxGc+?=
 =?us-ascii?Q?RIkYsTa2YSEHa4PyofsbTLGs3Qe9k1fLJWSaXJETu46aN4SW/RQqw6iRdCeI?=
 =?us-ascii?Q?fIaObJFX7audONnZL9Egg2jf4luAoKSwX8mA753GouTy43P+echoxPjfCHtN?=
 =?us-ascii?Q?p+m1xW/qhSwz88nfO9kjkqeC8OaYm+2sYJrE6cV4JvubRrsXryf1AbXuXmZi?=
 =?us-ascii?Q?MgfqAc0Vi6GE+bSBCB7Q5f0EzQ0uufhY94YozPlcPQ4GNq1JX9hw3nldC2bb?=
 =?us-ascii?Q?dFSN9AJ0ea8Vg96hWjZefrzm5WIy2GUe84zpF+Zuw3AN/IMj49EHx8gcn3Ec?=
 =?us-ascii?Q?Fy1MPLKLr4eVHTCiPymYVSvNew9RZQiFDajypXIqsLT1O8hMrRnnS3CtBNUh?=
 =?us-ascii?Q?7EAWgEazb4FZSNLvshx7gnyRb43lVEOkpS6uyllej+O21HWRroI+YYhJMGHP?=
 =?us-ascii?Q?kXkbkH37bp69WSKkAjr53cN7nivI/WodVP5BlOFs1f53qsoxGeltCl0YW7ZT?=
 =?us-ascii?Q?27tTIucrAK0Wjyqd4GayR48SrQAqpsL3uR3hWbDrwCh7bxGM+g=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230038)(36860700011)(1800799022)(7416012)(376012)(82310400024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:09:23.4583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0ca5b5-4a6a-43dc-750a-08dc95bfac00
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7261
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

Add RTQ6056 (spider board 3rd source) support in yosemite4 DTS.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 05f109687ee2..b0eb38f9aa7e 100644
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

