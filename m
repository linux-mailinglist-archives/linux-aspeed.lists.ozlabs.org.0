Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A45954598
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 11:26:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="::1" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=qnm5cUEM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlc7x5ydyz3bX7
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 19:26:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=qnm5cUEM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wlc7v6mVTz2xst
	for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2024 19:26:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eS19YW9gjo2qEe52Bgt71J8WBcD41wcskTE1WZu0elw6up+fbeEzR8oMNCf0gbL9JB65ColFU/jGUXJDqFHoDF8yYbOyA6gq3K24OfqJ94QN7vl8OFYJOE4e0ICkIsxa5VR9iGhdhAea6+mX/8IqxQ+RihVvjhxjhA6EGqHmGFw3H8y7wHSmnDq2qsEkygJY9p709IL42zrse1Eyy+bFIX7O3sdIX2PJzowodz4GzSFUIRkxCOeKI3ziuw0YxvLsvvhf3fXF640UD1PnG55pD7GXFKExAVR/haoHcl/pjb7hSZQrT2TfFVG9eALPAoE30mckRto+dTjxN9Ytu/AOkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pXz7BSWZBdMOtEGyFa/mxHhT1h94fl5HKQ6bKEYhdI=;
 b=Qkw+ggAJfs0/5eYIvdMDhPtQeVQVpFM8jC1TXxY0OnSp409sABfkb4WkGT6Xs7N22TpLOcLpGay+Ai9zzIqaw2GajlNTBlPJOsL4ktOehjc2MBNfRUpXnoDClczpIAVotMy/OettXyL4xtJ2m1p7u8w+VEp4QaPvLao0KNrH9+LIXlhg5iAJS0VuYs1epY+PyvcRT6Xlq82fC005gAbGrl8VeogAdQ3h7unocjLPRSCferwRSxacz29/2mW7mlcmtHv1DD7jy/A7YrTaRBt98SwU+hDEcNshgkAhPnO79cnx+2pVb7+ggqTDPUc2TrQNw3mebtuPQiEtf7FPq3oNAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pXz7BSWZBdMOtEGyFa/mxHhT1h94fl5HKQ6bKEYhdI=;
 b=qnm5cUEMHmvVF1zixMX1Tk3SS0ToI5dHYct5SZizudSt+ZwgiSrFzCnB1CswsKeK9rku+AfumB9bbArPxRoEfvzdxPUHv94pytQn2UPAW0Pryy0X4s7FhtxcGmTh5ZxjJDBdlLhFJqKH54+3nE1Z0HaRoWbztepyDuIs0s7VZDDTdkomaKoIAILrwoCMSxnpDkWCuTJPNxwJOWNpujYYhtTX1l+wwDgd8OLhlbkCn5j3VQrWQraWo90SVwpOYXxoJzZftUtMDu79htE37c8CX7VJVvdXuQpCxtFooizm0sDTA2mITa++DluG0O2eM3TJdA2OrMJCLKt+BLmWB3hdPA==
Received: from SI2PR01CA0037.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::9) by JH0PR04MB7250.apcprd04.prod.outlook.com
 (2603:1096:990:3e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.19; Fri, 16 Aug
 2024 09:26:27 +0000
Received: from HK3PEPF0000021D.apcprd03.prod.outlook.com
 (2603:1096:4:193:cafe::a8) by SI2PR01CA0037.outlook.office365.com
 (2603:1096:4:193::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19 via Frontend
 Transport; Fri, 16 Aug 2024 09:26:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021D.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server id 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 09:26:27
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v12 27/28] ARM: dts: aspeed: yosemite4: Adjust ioexp bus and remove mctp driver
Date: Fri, 16 Aug 2024 17:24:14 +0800
Message-Id: <20240816092417.3651434-28-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021D:EE_|JH0PR04MB7250:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 464ed230-76f8-4675-6be2-08dcbdd58157
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?N26owPVYo6uOqmz0KGxnq01QdOHXMce4BhKUx2vJSvTpiarPezZK65A2P2O7?=
 =?us-ascii?Q?+7dCl4uN4C1gThGmw6wePuKDHQHB1Qho+Fa/MV2ADQ/Ur93BRyjAAQ6fNo7L?=
 =?us-ascii?Q?iKwV2ExPKuyiub4p8G+toiRI6+2BZpK/KsYlYah+kRzoloAfKC06LbtGj9cC?=
 =?us-ascii?Q?bXI4hLZWuK+jV/Az5lH4lQUlGa2ZVjQhAAY489ksTbkdHWGzUPe1XSRkCU+2?=
 =?us-ascii?Q?ah5v79KX1lo/NXXinAqqdAhEH5nGRR7E6ryuHNGKS/NBQ70fq2WIII4Gy1EA?=
 =?us-ascii?Q?TAF7RI0wq1F58ia+GMio6FzEA4m1/sR0Th+aHImkyVXBfro9qT8ysMKRX/6w?=
 =?us-ascii?Q?kam2G20iHuw/uASgfyLLCP7eFTQ+0YrYvTxOXtaLPIVyEi2cghFkSrIisv8a?=
 =?us-ascii?Q?aOEfXbTVPWCGjb9bOOuwJdKiXlpPN0xnq5TjnwhxB9w6dP0KL6t1L+5zB1Zn?=
 =?us-ascii?Q?aaTH4CzPgnHamKgzIkloeXzKURBd+DyuoMh0K8seY4oGyyhSiZJmyIY1wBGc?=
 =?us-ascii?Q?du8gm7PwxuxTwC4SUthiJ5j22vwPZGgAwB3vkbpm7OG8CaACRB3bk4aW03rg?=
 =?us-ascii?Q?+Xl88hLtgFywXaiCWe/fNiJ7TCf2/RYMtMu8zhCUEM/431r/P/wgVc6UA7IW?=
 =?us-ascii?Q?Zhm6mPPjVw4645qAFGNWCErwM8cvgRY4rHkQDL+AnsFTyd+keDBDJ2+2SWQa?=
 =?us-ascii?Q?9NV4ySL3HttZHuiOxNKdwwgYNPVeQ24clatyhAnQE3O0Rd5Ggdhmaj34M6wS?=
 =?us-ascii?Q?YM7D+htkX3Z33L8lsTNINXZPSqMFSjArIJ/m9aglhkWchUi4XnkeAgssW/bQ?=
 =?us-ascii?Q?07xI3DNKzfnwIkMH9CTZmoah2xR6WxhMAjZrkM7BZS5iR/QW2NFeV90zTzlT?=
 =?us-ascii?Q?4h3yjV8tB9Q4bOS4T1qqbZWaQPmA969BddW2Dbtt6YIpCmL5h3k1I6uj0F6R?=
 =?us-ascii?Q?B7PTKnqte0R9FGzplgJ3BTGquJYQ5S+p+wwOXA/fhz3JsyKzJd3IqThze7uQ?=
 =?us-ascii?Q?K6LE5XTa3AqScwRdvWGQev3PGkjkE1UJN3HiinLsY1BH50hq57BUcRDxXupx?=
 =?us-ascii?Q?qr2T4q6YJn1Jh+k5uij3zmn8K81EdjPZ37xmuH0r9w6n3NqOy9a60o3Y2S/Y?=
 =?us-ascii?Q?jHNJb/pRPUfHOlmuEqXepUz9m2ddoWrR6olGPtdtN2rUasJbJgM63ndiPXY9?=
 =?us-ascii?Q?1dq5JdUfsnPognJ3bjGKitr7wcXrqsVbFasocGa/r6iTUadY+81H1ItMhmag?=
 =?us-ascii?Q?KDku9kfRAqnoPaPowlXr03IP/a05FwCspdx7B9iI9++lls3x1nAaRpqniLLz?=
 =?us-ascii?Q?LGptZ9nsNsRHegbsvRiJX95Qv1FnCsrP20oKz7DMM+jYIpzb2vvYmBGCZF2H?=
 =?us-ascii?Q?6jk0iIY4SYV/r6hpQgzMjfE5IK4PwAN/clbVJR36hQWMVgHo8GjV8EiEfgIQ?=
 =?us-ascii?Q?mLSBUgQ/FM0FmRGm4WORrPzPRH9Nq0ue?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 09:26:27.3254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 464ed230-76f8-4675-6be2-08dcbdd58157
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7250
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

Adjust CPLD io expender for PVT stage.
Add GPIO name for GPIOO7.
Only binding MCTP driver on the down-stream port of the mux.
Remove unnecessary driver binding since there's no MCTP device before the mux.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 59 +++++++++----------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index f139f426099e..abd4a9173de4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1156,6 +1156,34 @@ rtc@6f {
 				compatible = "nuvoton,nct3018y";
 				reg = <0x6f>;
 			};
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
 		};
 
 		imux35: i2c@1 {
@@ -1188,34 +1216,6 @@ ipmb@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 		i2c-protocol;
 	};
-
-	gpio@20 {
-		compatible = "nxp,pca9506";
-		reg = <0x20>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
-	gpio@21 {
-		compatible = "nxp,pca9506";
-		reg = <0x21>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
-	gpio@22 {
-		compatible = "nxp,pca9506";
-		reg = <0x22>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
-	gpio@23 {
-		compatible = "nxp,pca9506";
-		reg = <0x23>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
 };
 
 &i2c14 {
@@ -1470,7 +1470,6 @@ adc@35 {
 
 &i2c15 {
 	status = "okay";
-	mctp-controller;
 	multi-master;
 	bus-frequency = <400000>;
 	i2c-clk-high-min-percent = <40>;
@@ -1680,7 +1679,7 @@ &pinctrl_gpio3_unbiased &pinctrl_gpio4_unbiased
 			"FM_BMC_READY_R2","RST_SMB_NIC0_R_N","","",
 	/*O0-O7*/       "AC_ON_OFF_BTN_CPLD_SLOT8_N","RST_SMB_NIC1_R_N",
 			"RST_SMB_NIC2_R_N","RST_SMB_NIC3_R_N",
-			"","","","",
+			"","","","FM_BMC_SLED_CYCLE_R",
 	/*P0-P7*/       "ALT_SMB_BMC_CPLD1_N","BTN_BMC_R2_N",
 			"EN_P3V_BAT_SCALED_R","PWRGD_P5V_USB_BMC",
 			"FM_BMC_RTCRST_R","RST_USB_HUB_R_N",
-- 
2.25.1

