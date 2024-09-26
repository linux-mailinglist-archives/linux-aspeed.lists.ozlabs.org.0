Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 352BA986B6A
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 05:36:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDfQ76wXJz2yY9
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 13:35:59 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::621" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727321756;
	cv=pass; b=FRIKShqXAmmmjI5wZVjsyeKLichCvzFhWfoMQZX1bpszsT2JkTXTk1xVsHiFEGI6ivucmmq2Mj1b69w/r7kHweFmDmKtcxa4A4HAjIW84PlG/9wJMC3ZAO2CEfZOEPj9fhhzTHtJ727XSeJtUcPXWuC0+m8RFhR5nnXjtwvq+RuwGfj8Dhr0v1ggWKKF10CxNwbQQhmD9Mp4Z1BoloU0Yy0GFcyz1wDboRk/sw4NM27uThOiupu011lErWfIaHwywVLUFLdb3Kk0G6ZJpWi90DHM2/L0Lc2sob8VXayuKV04kA8ETvapsXWBtEoSEVwQ2ZKW9ap5Tg7NX5g0jgrTJA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727321756; c=relaxed/relaxed;
	bh=jsXIwyIUN9NziDpxCqaKPL0RZdSJ+2HnJW7nsdwhxIE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=P6ZWex7alcfFtcgSXDzOcFVeBq3jLM7vlLLcZ1Ck/NHIFjN342bPGYP+RJsUj25jz9+6BkET0DVU1MB26e0MHeBQJBTi9TYGrhTfG9y2kYZbuecIjZZWC7nq0OgBAoMcL6lvDpkwRSj3amB2JnrnkgfF2Zi4Wi0dsTRLopGvX+CXCal6FhkcsPDXaEHykkUJ1fyu7P88J7Ai/BrW0Co1pW4Bpr8c6KlotG1xLFv28Yfgwm6G0VaiCoue9KmpjQDLO85I+oow3+QdmbKcmMTCX/s2RKWhIWfq1TpsbEm2XY/ZxT+W83O18W62HMAcCcLoc8ezIm1OTBJPM8dyf0NvnQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=0E9Acv91; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::621; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=0E9Acv91;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::621; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20621.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDfQ41S1zz2xnX
	for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Sep 2024 13:35:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNK2QbsvMDeD8Wbr9t2UyXnvkTL+plfEcYWeYYA40rowKyjyRxsBDeuHxAQJkgyxwysn7zi6pWmeIBDYfk4wT6xi/m1ZZZhs/kjHDYk6Fcc7wV99aEm7gs8gPMDJibzdWRLZy9nH2PCopko6pLx7TwPvyVUIU8WS1N1ezAR/Tn1gKDZKq65zbVhLkunvsFwQY6Uv0nvrwykoWC8rfDoiUBENB/VVzHV3E5ZmIa+j59fymPdx9+Nn/brJigJeuzhr0YgTZJXHFUAuERyX+z5RKqZVSLHpSlIJLv9OYHf2XUFksgH+a+Hu9+/owN2hoiR+De9lFDemjE9vmNbo62941A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsXIwyIUN9NziDpxCqaKPL0RZdSJ+2HnJW7nsdwhxIE=;
 b=MZgJpA5zvT6+uwdt+lkXH2YqAvSlWaDVsN9DEJjJrkMLbuSh9vvvY7sY1l6o48R2oLYYUDatQl48l812qDs3ye6dvn0WcG7Y6Wq3fePyvHF5zZegHntQMbx/SAAAJlp9FSLp+KUN3cBRSSzPd5q0F6YoMtxh0TjL4zwP75xzBwOQnzuHpD3m3idEHM+KoltP7OY8x+h416gtNz5uJIWRNO73CXZEmxhI6Iv6zewmmeDCJ7UgqjUi0OZr7g1s64K49p+HjDDheUo9otRzGvgiHDF8kLQKoAfn3ZM4GB5SBGaUM6dn2v9FANVRrzV+RVx3xOU4RcrYfbj2ht9AGc5tUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsXIwyIUN9NziDpxCqaKPL0RZdSJ+2HnJW7nsdwhxIE=;
 b=0E9Acv91ePHPQUHDs+4N58l4deczZgkevVAYkxiErZeJRrYx4tHhd0cD7ANsV3i/fmBCP6veSHJOXHk5qLW/xgGBJmBaLs5tBvsjb6LUwgWYNxuWQCJiaVEK4Db5upxTzyl+sJ5RlM3FG8aOjZpsim545+rMDprNEW+ZXhtm8yB1mZGc8ZN795X1VaTdJU9CKYcRiVjccrNBtGZgrGyqbSCXKuyBrAOwZ8HT4WLCdsGj10hFfcCvMxSbNmh4cvxTrVWCOsNS0Y56WIeNfnPEM68dP+Qjaejz4jxFjTjLjzNiiMZIWr4qdzu3Ccc3TVooaBRI4Hgp1rDLBu7x25BhLA==
Received: from SI1PR02CA0036.apcprd02.prod.outlook.com (2603:1096:4:1f6::20)
 by JH0PR04MB7604.apcprd04.prod.outlook.com (2603:1096:990:6f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Thu, 26 Sep
 2024 03:35:36 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:4:1f6:cafe::87) by SI1PR02CA0036.outlook.office365.com
 (2603:1096:4:1f6::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.30 via Frontend
 Transport; Thu, 26 Sep 2024 03:35:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Thu, 26 Sep 2024 03:35:35
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v1] ARM: dts: aspeed: yosemite4: Add i2c-mux for Management Board
Date: Thu, 26 Sep 2024 11:35:33 +0800
Message-Id: <20240926033534.4174707-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|JH0PR04MB7604:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8a9ae576-de50-4709-699f-08dcdddc487e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|1800799024|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?bNopIWk2Cg/B5z3XYFOymA4r1swY5EiqL52FZn4HOMnZsFYoCD07M6GWAcY4?=
 =?us-ascii?Q?ww4pV7WDiA6mZlKEbuRam+iMJyhEnj/esQRkL3raYbqBnluKnshUNbYTeUV+?=
 =?us-ascii?Q?b16YJPLbOGq1XOH36iA8n2pz8im/oFqlgjHJlxwCFfJQqvU24sY2vr8kYu3X?=
 =?us-ascii?Q?MEnR51FHhF2yfsdgLuScZzo8j3p2Dh+mRXQ9QuA1W5RkkQe0vhdFMEB6dOpw?=
 =?us-ascii?Q?KwOnZaSohOe6BEtl0fivJhOopbiDTG379KgUkENi9am4DPXl084lP/XrKQgh?=
 =?us-ascii?Q?jPNive61KcIN961r9glAaK950j1so3/F++UFDUkHA3g76v8CaTyXkmRKmYyg?=
 =?us-ascii?Q?oNEIXiN3Ip6Vzb9unmjFSPP8aDg6PyEXq7fDwwZ82OImqUvZJ6OziiSyCyHr?=
 =?us-ascii?Q?JmVp8163tbd80bN1EIq3xv/gwAgEHeAboWwOuWbt0potRy7PVhfFs1R7DPLs?=
 =?us-ascii?Q?QJ17ZW5qbMZoKGoIOVFCApfNGiB5vwL6JnXiQ5TnRNvF8EJXhspMT63pfTXW?=
 =?us-ascii?Q?B8Uv3BFXCzdXGfwuRUM5DkllRfyHhNtQR+qBFbMXJ/WBT079XgIlLod3sLDh?=
 =?us-ascii?Q?2iAyxHC44UKrulKKXbqqZA4UbW/XrMPwaUlHCYAZ5dAp344paM9nsHvX2fmZ?=
 =?us-ascii?Q?TZxMO7JM2/D+rR9WE/ukQL/nm34IOVbs7p/QYKH1vcSfoEipe5BiQtECmizi?=
 =?us-ascii?Q?8Gx7QTGyDR3ITW2v6gXN9U+gCnDUVnNGpE5Uy9wLMrRLc/cMzJV+5QSqDYLr?=
 =?us-ascii?Q?9HI6q3kWGli66t8A8V4K62KFH6Cl2kdbEfzQLclrbHhcCu1env+914h9YV5D?=
 =?us-ascii?Q?V0yaSOZJTx+44niGvWBF53tBCiU5h5f3/PqaKO/TaiFjEQ59RTmftUEAIfnb?=
 =?us-ascii?Q?wAFfRrk9GnUMYkz3BwmxzucV8kgvoSja5cO65vi/C9+6e76CW4/IZyJjyU9S?=
 =?us-ascii?Q?rf7klEB9/kVhOBNYK9RpEfp5YJzibgwL5yeYsHIrHZavjRgmssp/Pba1300U?=
 =?us-ascii?Q?sPZxUSGbkK30FHkC5A1rpiHkM4FmcG7uIGcq9kNJvevHH180vIGBtP0qC1dL?=
 =?us-ascii?Q?aNmioL271QZLAYoxvspt9J4uLDDcPqi44Gocql/Z3WLyb3h5e98XVUTsjf/h?=
 =?us-ascii?Q?kC1k7l8MO6cUOXs5RMWgLEmknisWvAxVnBTApnTMpZwR8ZN/GKlka13re77M?=
 =?us-ascii?Q?VYE/DDSMLPtjNDh6EcSA/bcm0v/Xp74hJgK515TA0wHhP4IHVZ2bPHTh773m?=
 =?us-ascii?Q?PRmKRg5585UVTy5ePaWEkQhDSzCoTuB2xryT6LMd2krieXtXR7czmu5iC8MY?=
 =?us-ascii?Q?4/fv0601G/qhtyYmyuCxrXXxrM5mMOTMFCU6GASpHBtDbV948BEsZNgaquFH?=
 =?us-ascii?Q?J4/vTVfmfF8NW5tmGO9niyT873vY?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 03:35:35.6055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9ae576-de50-4709-699f-08dcdddc487e
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7604
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

Add I2C mux for Management Board to separate the I2C bus 35 for
updating CPLD firmware and I2C bus 34 for the other devices.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 80 ++++++++++++++++---
 1 file changed, 69 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 98477792aa00..234ce7019fca 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -17,6 +17,9 @@ aliases {
 		serial6 = &uart7;
 		serial7 = &uart8;
 		serial8 = &uart9;
+
+		i2c34 = &imux34;
+		i2c35 = &imux35;
 	};
 
 	chosen {
@@ -348,22 +351,77 @@ eeprom@54 {
 };
 
 &i2c12 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 	bus-frequency = <400000>;
 
-	temperature-sensor@48 {
-		compatible = "ti,tmp75";
-		reg = <0x48>;
-	};
+	i2c-mux@70 {
+		compatible = "nxp,pca9544";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
 
-	eeprom@50 {
-		compatible = "atmel,24c128";
-		reg = <0x50>;
-	};
+		imux34: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			temperature-sensor@48 {
+				compatible = "ti,tmp75";
+				reg = <0x48>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c64";
+				reg = <0x54>;
+			};
+
+			rtc@6f {
+				compatible = "nuvoton,nct3018y";
+				reg = <0x6f>;
+			};
+
+			gpio@20 {
+				compatible = "nxp,pca9506";
+				reg = <0x20>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@21 {
+				compatible = "nxp,pca9506";
+				reg = <0x21>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@22 {
+				compatible = "nxp,pca9506";
+				reg = <0x22>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@23 {
+				compatible = "nxp,pca9506";
+				reg = <0x23>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+		};
 
-	rtc@6f {
-		compatible = "nuvoton,nct3018y";
-		reg = <0x6f>;
+		imux35: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
 	};
 };
 
-- 
2.25.1

