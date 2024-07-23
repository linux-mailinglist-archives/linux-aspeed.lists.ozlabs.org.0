Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A65B5939D9C
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 11:25:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=hvfnUu4y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSsFh43RYz3dX8
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 19:25:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=hvfnUu4y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::615; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20615.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSsDz420xz3dTm
	for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Jul 2024 19:25:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAcSwZhx96dC9xpMqcyUP81Gdoyl0zZ05GOI6tDaTNMwBLaBx6Mxtz4yhDgh3M12wx1/6wtn+r29mCwLIHEOCv963dl5SK3ZwGqzNoVlUh9KbaGnzO25NY/SINQV8lDZEIMycR1xNZRlcqTyQ6zDFJ2c8I7lULikqZi78U6MQAhoRYcpYjhfdcTiP+GVdaOFBDFS3n0Nk2f+BT8lirwWsknIiyiT1/PaMOgH1ozt7kTlzIWZExdzQ7Qin1NAQRgfV1g1G1kdZB+GtIuxgou8xEFwM73CNH7v3BnU9gQGwCdrQ+I+nV7P08xPRQiThxKN3X/vdvtwXA+Kic+99FCMZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgT/6R4EC/XEEfY2gUrLR0f3dvDaYSzSpR2s+GBhOIk=;
 b=XcVdYFRiapY32RUjhO1Sahpcb7hzRnriYTxhhk+hEAZ6fwarcl4zeJy/5qjKJkdOitMTZBURDr+wco2ddFV16urHlnJUQKbkcMLLS+blxWaAP9uSnA4IqavIaXF2ENhwgErbfxLWKBtbb3IAFlXdyfL0PluyjjAIej5+ScgjjHTgHPpqUYkzIXkPSpeoBCe9MwT5t7Tqx28tLBX4ND/UgF7032VLEbsPUS7RwJVrA1Wq0A224DDYvFEbyVbKtY0FZI6f2WEhsIQAM+RJDlXUNfRRh/0AL6UaclEjrjO6Umn9ckRMlENWN1rCPbXDNROdSDjlLc1HwL8gPFickGKnHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgT/6R4EC/XEEfY2gUrLR0f3dvDaYSzSpR2s+GBhOIk=;
 b=hvfnUu4yTFFLICzKecJ7JnOz/T9YYjRe82o1ST5sBOcd3U3ap8x3kGtdatJDWyqqcTpjXeSRp4hcCyLTwd0L4OQeByEYAXdfqqovuq5zoBoIJNhVBzcaxK2+43MafE5aWg6p9rTiuvtRZqrOt69wERq2DPNkpg4HHln0/WdgPTJ46/ks/gQZHZcU57rK5sm1y1upFsffRWQf8LtC+WjV4F5lKjwRv2wzjk5wgLxHWqwdNJP2CHv8q7GBv9n0ovfUAgNLYwkRI7NqRg8XtuCAkhy2LKKTkJXz442Ct+yJMtuda5d+gHxq8z4bebpqrIQq41X5ukrsAA3Ayc7vAJsqPQ==
Received: from PS1PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::24) by OSQPR04MB7946.apcprd04.prod.outlook.com
 (2603:1096:604:29f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Tue, 23 Jul
 2024 09:24:49 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:300:75:cafe::fb) by PS1PR01CA0012.outlook.office365.com
 (2603:1096:300:75::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Tue, 23 Jul 2024 09:24:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 09:24:49
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v11 25/27] ARM: dts: aspeed: yosemite4: add RTQ6056 support
Date: Tue, 23 Jul 2024 17:23:06 +0800
Message-Id: <20240723092310.3565410-26-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|OSQPR04MB7946:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ab5b3556-383f-40e3-f5e3-08dcaaf94cf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?o8/4CeXnBZul53mPpWSUY43Eg2gYFABUv7YeT3FO8Yt1OxlCLFAyOSUdm3xf?=
 =?us-ascii?Q?CzqQgCp5DEJHHcdqhw2aM49TwzuvC4VrF8Q+VWmFcURF6Pyi1s6E6cKkqGms?=
 =?us-ascii?Q?1Y3ypB/9oxINcBIUhSqlKAfVE50F1mC494Z0N1doqLrdCqGKf0NDSfqWkiy/?=
 =?us-ascii?Q?NZT/CTkqX/sAp3wLL2cTLbHec/nc/VMKhonqnUOcPwq1SuFzeYHKzErx15vj?=
 =?us-ascii?Q?ARBnyMKXKA0u9T+Y3pmpI+/0NKiKKTqnzjYfPRJ7v+PsmCYO3x6shPLp/mZ9?=
 =?us-ascii?Q?8u2qgO/fVrR9aXgogJTtEgIOgaNVzCujwG11oW3AAyEl5gxJ0ah61SFhb0Do?=
 =?us-ascii?Q?KZSM4pFQTf+qu8zjKfQ6E9SqYeNP79japKwmvFgsIv1vCcWgfQEQltO6mf+J?=
 =?us-ascii?Q?2e7KzLZtylCAriRzOw5Ln0kx+yHRlD8NWmsq06HPtZdbIxwN/jVKREXOIPgg?=
 =?us-ascii?Q?DxCQkszGoyaBGct92mwk6UKNIcS14QXo4LvKSgKEo3n7MG6zGbDBYv8YKmt4?=
 =?us-ascii?Q?gGELtGu6jv9yifBkmuuYU1utxB20U9eZbsCP/NUTpwIAQ2ZzvFR67POTChh7?=
 =?us-ascii?Q?1+9DvUjq6LYdil3Ydw63wO03203FjJyN5HgQBy1JsKnvIz0UoEg5GL584vwA?=
 =?us-ascii?Q?v5xPQN3Lg59jXGyGSLByEnxbpyPTV9NWpzQrVyd1VVAd6demHI7u85MA5gUV?=
 =?us-ascii?Q?bThEXvuw4QpE49DoWRL4j9lY/Esncs7NKbP/UWFujW5M83YKtT4OwJp2gstr?=
 =?us-ascii?Q?ee4jxgvJlBkq9von4Cp0Jm7FQc6GZcR+qL2Rc1HhQg5iRptV6EpH6mEy78RG?=
 =?us-ascii?Q?A5nzrf+EU9mVPYB9Q3GUVzH5x4f/SNkVe/wCtLZ3UBc1Rr/qatPBWP3LWBMI?=
 =?us-ascii?Q?zcBUnvN3WwzC7D/Ka9xHMoHSO4vmZz0uycB42Ibx5qSow529N5hKVB9XIM8s?=
 =?us-ascii?Q?46HI3X2eadkScqi9JzHkC8UOeYbdSrHgJO7uVVyo4nzhVbVSEzxzfHkHgBAO?=
 =?us-ascii?Q?Xa/a2c1Gw7asG5XgdbJBgcl49lEkEELIeGRp6AfixAJGlXfBlnOFd7kzrWXa?=
 =?us-ascii?Q?iwIxlSh0Z8c1mxeOax0mg2tdD6HWYqI3wYRO2joG2NXiKZrr/BZ4L8+kVVkP?=
 =?us-ascii?Q?XtdoH74f6NxiH5a0Go3P0+pD4tjBiFpSihmECbPU2Izu2na+lk1gk6IGwRVL?=
 =?us-ascii?Q?ZGPRuQ1J7DFkU+uK6wiQ6q1t61pS2E7WgCnDwcUY3oOeXdlP6d17IS0xJq2w?=
 =?us-ascii?Q?AAPUjPM8P11vY2W0RsQBC9163gODRCpnJHj6ad4oOzxyCLJRN8sBMyK/0nqE?=
 =?us-ascii?Q?rNDtvFoNGE/QeIpPKPbQjOHBiQ9W6JPzgkj8zHpvNj6cRnFnqq8gf8mL6jqq?=
 =?us-ascii?Q?ptDKP9K1+etzl4JbYi9/w1yYdHxzUsn/gjuLm1D0dpRrlMJl1+f/igpe1sgO?=
 =?us-ascii?Q?VNAmvzHEZUdJZ2sWkJBTFqlBILvFyUA0?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 09:24:49.2543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5b3556-383f-40e3-f5e3-08dcaaf94cf8
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR04MB7946
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

