Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8D99373A1
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jul 2024 08:02:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=md2pTfBy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQJwp2TF3z3fVJ
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jul 2024 16:02:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=md2pTfBy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQJvr6kg9z3fnD
	for <linux-aspeed@lists.ozlabs.org>; Fri, 19 Jul 2024 16:01:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGMO+/ifBGRTIIWVC2HiwvIESUztGTcXvNtrXAne71m/SsdBaG1xvDcHgZkNO3609JRRxa8iXI+Xrod3xK4ZyQUBpsBDzzS0C4Q1MzQpdM8pKOZkH/p4j9cP4DSskKeaCghOozGDdKza0/2bE/0g0MbEs71UGCh3/2jKn0ZnzsBR4yo6APXnZ4I9w2QDGhfHeGvlIkM8jIla9ZYSnF+8yeeUISwKVvkLUca17uAzsKwFtUWSrrEX4K0eVK+d0CMj7wQguWzdt46A4gJdB2YLCwidjrHHmMTJCXSIOwfGGBA4NHFBjoCJqtBgYSDOXnUs1WROv0uttJrYwmV9IpzZlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMDXk1/rvsAAHqhM7xPae/xOMl06+Tx5uzZbzGXhucU=;
 b=bZxveXkuIymq8k1IYCHn6bGb/wJo6ARMWlm9go9nl7KPk6HlXb7VH0pHuems6btEANpZczwU/Ou6T5e+5VIx8DgqCfGV+CO5D1FP44BlKTJ19ADMeS/XOrUEDF4kmCO5U7q99tlLMKZmGqMi/bLeGTuAoyWOQPKNHvD7C5vnEPZFY++rvpdjScdLggh/iTc0bxb5a2TbHU1BS1Uk7Mg4rkzfjO+YzwENH92G0G7JPrNXlP9Unh+u7veDHSf8YmaI9P2xFHRGCdRYweiejb8fD1p0hy1T9jz97CuFgcSsNyi6qfqhzHF8jnpgsGj4Ewlzsg1B7SoXOQY27sofc78pIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMDXk1/rvsAAHqhM7xPae/xOMl06+Tx5uzZbzGXhucU=;
 b=md2pTfByImpZw4pogf+asAs7QnKkVJ9fM+XT5Qb0SKJLIM/nk/RfuMIbvPJUk1pKAYdUTzN0mYmasNIYs5XQucTpeXmgQyxfaFjvvjAOBXQ6Lk5beBCkF0EqUC44FROkDMAeHZDnp8DbhNEA3sCWEpNSUdNcsUwrJXdsPZ/hU3bQ/moJzZAsGWfRlunHssDMJ76LyGEuhmxyAo7j2fHqHm7P4PXcdF68lJm2blRebfiZmGstxNyeX37KwQrpPOe5prJwN68jjaX8Q4+bopI3cIkeaSDMNBJfu7Yj3IyZU3PECXUmrfsFxcwSoclyyPdAGrQOavHacUNTcTIOZxIarg==
Received: from KL1PR0401CA0027.apcprd04.prod.outlook.com (2603:1096:820:e::14)
 by TYZPR04MB5904.apcprd04.prod.outlook.com (2603:1096:400:203::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.6; Fri, 19 Jul
 2024 06:01:06 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:820:e:cafe::d) by KL1PR0401CA0027.outlook.office365.com
 (2603:1096:820:e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17 via Frontend
 Transport; Fri, 19 Jul 2024 06:01:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Fri, 19 Jul 2024 06:01:05
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v10 27/27] ARM: dts: aspeed: yosemite4: Adjust ioexp bus and remove mctp driver
Date: Fri, 19 Jul 2024 13:58:56 +0800
Message-Id: <20240719055859.4166887-28-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240719055859.4166887-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240719055859.4166887-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|TYZPR04MB5904:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f6228078-df17-4ba1-71a7-08dca7b82d3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|36860700013|34020700016|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?ki81l56q/TdRkZi4bkeTDlbaMlrZVg3J0eoNA+GGZlJz3FMRw0XzZOFyQgKS?=
 =?us-ascii?Q?W2e/QX//Kn+lYJ5oWCIFKgocqURfE/IRD1cd/07swD1hTdh6UHpu9CRFnITV?=
 =?us-ascii?Q?NRpIQOGhusgrr0gNwf44smGusoEmkTzZ28Vo9xcuzOwcFaUy4KHgbcAD88YD?=
 =?us-ascii?Q?K1pRTr74uvZlHPefbj3byjtcFiy8nvAdPFemNv5KdxJKDBx3rd/Lwx+C/RM8?=
 =?us-ascii?Q?yWUkTabbo669LDh+G0qZuYu5meIJ52o59WmKneWsyikxNDISO5aMGrWOSeQA?=
 =?us-ascii?Q?/v2k5MRCKnWAatuGLM9eP3AdRE7tRmH/A03cpLyj598OSC0MkzBm8Wfu0Erp?=
 =?us-ascii?Q?r3uTxVuhzhzRb+rr74ABjDdPXIb0CT3L3s7ztgpEbjQzhZ83CuM21F+Uk+ao?=
 =?us-ascii?Q?NBd4kGXJY+6n2squ6ZDMdc5/h4N8XTxBQ7/fPHtpr4MA35d9zGkHqhsKIqvM?=
 =?us-ascii?Q?tf+jTILEHVGXc8PnNbLgIGVebxUoah70lf5vivIzq4CviY/9eJXzbKCtbuo7?=
 =?us-ascii?Q?i5lA5Tho72REhqLeole3KgDMtC9iETFJqbO3RF+0NRLVjo6g8KFf/Egv6jzD?=
 =?us-ascii?Q?Efgp/wvOeNPyxZPsHlolvkmRJhOZ8bVTMERaZWTc6fEdvEPFF/pJ4gL0YOQH?=
 =?us-ascii?Q?m3gWrTgRg82xIHpAdOcPbMYfusJ8NwW1rSmZ56YjkXOmQ2X4hVmi7fE3bMbH?=
 =?us-ascii?Q?749ltQR8U7NOknQC7l5bTK4GK2a+jd1An6lCr5qHcusN254Psp1nUaZYlYT+?=
 =?us-ascii?Q?l4I3b2VF4E4ONGzzo0CV2XjEpPg0F6b/XI/JCT8VoQCgbje/y2IpQYRO+dVj?=
 =?us-ascii?Q?6eDbZ6QGyybZ5pkQoB+79kHQsLuyptnjEx3sIA4fMa54PsQ/25qWp52b+P0L?=
 =?us-ascii?Q?5CFF4J2zVgVzXTtNQG9hYngNpNM0/7hd+0OuRTt3FRWCm2E3KYUDg77P8GHM?=
 =?us-ascii?Q?DaJ4MtJFWo+4bKNQBIOQYdu3FxiYcsinZuxMN/TVhsCLDdZ9eMLzhlmrioD+?=
 =?us-ascii?Q?RUyV2Q861AdHKwJN7JlIL+BSBrDKkj/q7xGwl+yCZ8Klu9wKZr4GwNQW/nem?=
 =?us-ascii?Q?79YPJm7OA2E6jqr5qbwmIuK9UBGT9mj1LkTT0uSNJx1TWKiFkh9BcMim0lU3?=
 =?us-ascii?Q?fiRULKihj0ExbohZGsPnBcoBXjqJ8wx4xbM02995TzY6a/mhoxqeTHtH8Dps?=
 =?us-ascii?Q?+IeHbHMuc2mw0XsQmp1/YpYZooj7npWzNoSwzmE0ldG/jpDbv+QAp6+wBN8G?=
 =?us-ascii?Q?yzJc+XIKNidK9xOFhe8OONiqQccK+ts6DidgKXfAoPAwQrmnfgdJpR4sayi7?=
 =?us-ascii?Q?+EcWNtpEbUQKh+Z6ncxs74/9oYNXcKh9TRrqyFuwIQ0HKT8GU22wZCm7BLwd?=
 =?us-ascii?Q?Gt/vvx4O4EyDe43Okf7IRoiL6qxHTOvVZrQ7LB3dp0GFo+nvEHnfzfXWZw95?=
 =?us-ascii?Q?x0G1iBVyV91x4/QYmnmQjEgngA+kZfr0?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(34020700016)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 06:01:05.1112
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6228078-df17-4ba1-71a7-08dca7b82d3a
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB5904
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
index 7ad080e3f432..1edde3923ae7 100644
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
 			"FM-BMC-READY-R2","RST-SMB-NIC0-R-N","","",
 	/*O0-O7*/       "AC-ON-OFF-BTN-CPLD-SLOT8-N","RST-SMB-NIC1-R-N",
 			"RST-SMB-NIC2-R-N","RST-SMB-NIC3-R-N",
-			"","","","",
+			"","","","FM_BMC_SLED_CYCLE_R",
 	/*P0-P7*/       "ALT-SMB-BMC-CPLD1-N","'BTN-BMC-R2-N",
 			"EN-P3V-BAT-SCALED-R","PWRGD-P5V-USB-BMC",
 			"FM-BMC-RTCRST-R","RST-USB-HUB-R-N",
-- 
2.25.1

