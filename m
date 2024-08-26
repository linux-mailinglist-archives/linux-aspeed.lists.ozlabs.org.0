Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 764ED95E8A6
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 08:27:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsggv3SF5z30h5
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 16:27:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724653626;
	cv=pass; b=EAqw8mioFL2RGZ6R+EwpzVd+04JCZidVREflCGzHZ68Dlrn6gBhkFJ+t/RAmKP+sSjjikHSBNoGqKjjO/xOC/OX0XzWO+hbL1b5GUeHCAApw4qq69P2s+VxVD+VZ+iQ6CPh3sEnxaSPzLboHCMDM5+uqGQPTO+4DOYH8PhoDAsZnW9k8+oWAPlKmgSiPF3RtEqQFphsRm9dBX4o57y9wJwZF1nF9wOwt3shbjXTw07UOOL7GpdZfxscbAHhqpKzlm9CkEddCB8JztFFVmK4srODDm2apPmN5qIv5pisaqSFU7LjjI7DyoXJ/oVUjTw+Z6vobemFmt2iHs+fVbpxlGg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724653626; c=relaxed/relaxed;
	bh=3pXz7BSWZBdMOtEGyFa/mxHhT1h94fl5HKQ6bKEYhdI=;
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
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=gLB6giVT; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=gLB6giVT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsggt2NWyz2xsd
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2024 16:27:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NuXpaHWBTlpg+QWsDD1FrrCdHVKmEOVQb7MNr6st42kOIUrAvcHVxLHs56jISRT76aHlev+D6H5YjlS/7FiRZ1g3xcBtBbcyXnp1I4U3HghPd2/bxng5zlTTGh5LZEmyVVg3IWQkLhh2m9VUz9IOGQx6qvl+JgTHk0eRBf8aAw6nt2Gjj6BdLRmSOJCjfE4CzkbHU85PPHjeFJA2CHrd6g5+rZq2xWyaP3UVXY6wcFTeG68RIbgcvnDrAGEMngVjL2M2wLDDKMfYBf6lH5+DfYprgJIz+jlbbxiE3vPdMBE1PMIens4ixb0SIo00NBfnwV52GrOkKd7/9+3rDAI83g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pXz7BSWZBdMOtEGyFa/mxHhT1h94fl5HKQ6bKEYhdI=;
 b=E1sXWTBpT7w3Dp/LkTl6WaKn58wO0FmA42iHvDIPjkWEHVpTCkFmkvRNRr9DzeIMuuZacfeBkN/6Gm9yoe5zH4Ct8H978LDa+L2PffAY9YVa6Q05D26k6HtOY5dyJJsty1rknbqo+XmBOwW7PyHB66b3Kbz0uf1k6UA/WPHObhiFtSuZCDsN7lZD1KW/93LTQx0ve0xuThDpqRBg86997+r5wyYp6uDtunIai7voPFcSuhGB2idR9JOxNrPfv7LLEt2lrFxUNfE1gY6J/j/d0dWJbiuvMTB2u5m0CKxKYtuhRTBAroexhUCPAuk4aG6Dt362EXZJnH5egmjAu3NxCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pXz7BSWZBdMOtEGyFa/mxHhT1h94fl5HKQ6bKEYhdI=;
 b=gLB6giVTveKBqwmklKK1QAWkr2xfHshh4EzWJFx24jBbZFrbc7+639PJDpbZcolyjwfFNT91h9FF8czppNBVnCXI07NNlhYG9EqcMRGEU2/jHXqFASeAaGt7gMcWEWLf4R8bi4cZ/vJOz7oxGA596E4Z9Ah8IOQosOnykgB3ux/9QBhpMYPylwUXxUrfOcz951LbTUFrMmB3U8ZGZLPdY3FQbpeyv5cB8gc/odUcDtBpuTwEhkP/7XNBjAJ3czeCiqOWONKZbIhGt84smY9ReHzzUomUYwCCqdU25xXn/2AbEjI32WPLj6XvbKMHWcI7gNtNRkY7g9JKQT9CDCHnLA==
Received: from PS1PR03CA0014.apcprd03.prod.outlook.com (2603:1096:803:3d::26)
 by SEZPR04MB6300.apcprd04.prod.outlook.com (2603:1096:101:a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 06:26:39 +0000
Received: from HK2PEPF00006FB0.apcprd02.prod.outlook.com
 (2603:1096:803:3d:cafe::a7) by PS1PR03CA0014.outlook.office365.com
 (2603:1096:803:3d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14 via Frontend
 Transport; Mon, 26 Aug 2024 06:26:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB0.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 06:26:38
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v14 27/31] ARM: dts: aspeed: yosemite4: Adjust ioexp bus and remove mctp driver
Date: Mon, 26 Aug 2024 14:24:01 +0800
Message-Id: <20240826062408.2885174-28-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB0:EE_|SEZPR04MB6300:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0c66b306-1717-412c-fa1d-08dcc5980acd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?06OjCDNzMDraeHGIe2IxmGC/Yjx4toa6rf9z27MQ4JYY31txTKoDOSf5tIsJ?=
 =?us-ascii?Q?Eg4qFjScELUHh/jBA7w2bKR2LuK/K9InJ5PcOEwwvIl3JDDXfDNS9Gl17YUU?=
 =?us-ascii?Q?M58+lN87bIAsOXlURWfAon2trzNu0FApRfrIndz17Yd5mNBy/a8wrgGdvXs2?=
 =?us-ascii?Q?PA9VZiqBnwIabQqgloMHMcHfrRNkP1wNXu7tsZJxwuJ15ByBctNDCvt4V8wc?=
 =?us-ascii?Q?GYYUeXxdg2iM21bFGue1m4fwDo4GLl+Sll7anAL/DRRu4VuZntLLoxQPOdBC?=
 =?us-ascii?Q?Ty4xGAZqIJRKxiAi2DkLgwBsqL0s0K+mz0jNnlMH0XG+1mU3zdhQ0pdEAH2n?=
 =?us-ascii?Q?zcKIeP1Yx4LEbWYLEWklSZV2NhRxxLau7UkSMqao90LEByu804/TKWb7dHnt?=
 =?us-ascii?Q?0fY9/kmZ/Neob1DSbAgftEvrt5KVzrg33Twr1aVUOs9DmvCntUGL1aekVNTf?=
 =?us-ascii?Q?Q0PoTo9//3pUee4Nc8PCBK7WbPL7CjjH/xoko7KExi9XzKEaNDbSIdEI4juT?=
 =?us-ascii?Q?j65bkp7bjIUYx0WHaKyP+mF0F4WmEBFwOp7Huko/e0ojrxEE0ZQg7owx5hS+?=
 =?us-ascii?Q?0RCn7k+6ZuMUwdeNwB8MMBJ6nlqtKvuIN2QMDpl1puU9tl3xqqYjk9LNHF4t?=
 =?us-ascii?Q?hptCwUxQU6ujA8/hOCcar6mwixQXipLg/PBUi3tWCmZTOlqH/DfeiMTndBn9?=
 =?us-ascii?Q?n1hTcq2aEtQuNxV4jTjC088IassevjrVU86h9BHA3L8hWK96jEYFj8hEwU5E?=
 =?us-ascii?Q?KF+oZT9/e7eD5b5Jh7gVnTlAl70mh4J8IJlryO0mq9oxYeEMkk7EA5f64si4?=
 =?us-ascii?Q?0Q/f5yzbfg2urYQjk9XI+LpyAYRWgn4u7220RtgHA+OZi+6bd8doTp/sDtDV?=
 =?us-ascii?Q?KQ+oJZMjmqYbE8z5bZrC6j9/a7COJKJHFoja8E69AyaAwm+g+WcJMk3A64GF?=
 =?us-ascii?Q?zlhuVRe1OsmNV9wuvieFcSPVt7/qlSj5PaNTpaaw9Ox3uzcprgiQpAqOjN2n?=
 =?us-ascii?Q?VDXUTT2eOddkxeHzN/PmGN4adxE9DPRCthXrSylCPvHNAH1+mrHzDGtiLXuR?=
 =?us-ascii?Q?/wzMCDlkprPv3SzvsRRui0r4HN/PcRQyTHLDfKFr2BJ0up6X8byUVJcnyHEH?=
 =?us-ascii?Q?wfdNUAcuxexYZa++tG7uoYjN0iQVcYL/G5cjI+yfHr1mgKUCHO7rzXWJnLWO?=
 =?us-ascii?Q?qVy9cWKo6ZRoJ5yG4hD6IpG2kEkUeupb2aH0Ij1EsmG99tA6rIF3eGuCcan7?=
 =?us-ascii?Q?8kV4JYaJUl2nNn+n/HUmGwt4tV9bzLvP/EOUxs8KmxWvHhWgHfItGB5tYvhY?=
 =?us-ascii?Q?7kXqfSR0GGjk5xXuEGbUkpkDLxxj/k/ALAwM15YKbLPfNYCIldIF7nlI35LA?=
 =?us-ascii?Q?oTVoakixJfTGsSBgF6hmbQbun2k/VU64l2eoYPbzm4GSHsph2VIgeZeXT3zR?=
 =?us-ascii?Q?e8UgQ2S9oQgCCqSbuuoKtBmaxdRg5sul?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 06:26:38.4552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c66b306-1717-412c-fa1d-08dcc5980acd
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB0.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6300
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

