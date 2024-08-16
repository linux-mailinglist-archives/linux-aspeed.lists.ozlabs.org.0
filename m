Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 840D6954588
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 11:26:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="::1" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=ieXH++6C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlc763Xrrz30f8
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 19:26:10 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::630" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=ieXH++6C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::630; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wlc740NRcz30Tw
	for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2024 19:26:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4Vp7MaUxSJYmSbKs+gNGNk3cMhpv/BQFeIJ2FnZgvgzxh2b5A3WSPSl/hovgve8/pE1EHE38pLiQvQKtcT+72OwI5F303ppm743864sYmyzQaQClsOIunSIHyMLSAZPABVDB2orT3gkFqGCEsixWmW8sbxHMza0zStPKxODEtglNM0qW4NK/a6OmYLMBG3zl7CgWayB1Lp4jglXRUtjDHe7PAi9QYwuQoc04yfdhsOBP/WNkE8Ea1Wbpz2WS+mzJ5dSv/MBuYmxbjdDi06eG+t7KFnWloOIl2p282GI5a6l6Bpm9/qHc02wRAaeVJVXzSWz8MWRzUUS1VYdFWRKSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=deWOYRp1IarhLB5qRFgI0h1ErIRC5JkaB/gNs5HJuG4=;
 b=MxRH+Uko1t88XpnHd17sN0wOD/1+2PmcmJJyPwnSEpVaNUBAvwFF55e9hynoDqBHqt7lxgY9QTW77fOHxhPN39vFk+8BLKakP1Nww3hvEycDl2JzHZojUFoscwI2kRjU2h3IP+60mOkkCsvpzKUThzcSvS/Ru2g8sB2EsrB4mXUAUvd22DxBMVekhNKPpLFXUWbyzKOdk7Us/8tIC09JVp5im6F9VtQ726ZLqa2gGW9ScYj+k8TiOyu2x80pz8JFsQIMgLC4f1CccgHHC8NWB3koQAbQIomM4rXX+uKsherMhTHn9Zl1+vEsaQ8y73/6sd83GyDvE/zqpfv7o2MTVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deWOYRp1IarhLB5qRFgI0h1ErIRC5JkaB/gNs5HJuG4=;
 b=ieXH++6Cxn5WaYK3wI/a/JzqGAnOXySxhqO2moyv0dmudHILc4VRWvhFQw5oIKs5KBEnxyo04TBZPCjFbXiuAdvZCaQJEvpxcIXuPBGx96vGUwzk5fxibZO26a4CXLHGBe201kQ6K9vZvZ00e3YpqSOfPh2/oVJgxkvZXen1EK6WnMBrK6lNZVsieNgs3XQmQIkzfuWt5Bz0DpP0AOBlfAOn35WoOFr3hK4uJQzNhedKUiX1UclutYnS8T2idJhubFJWB1Hs5hrmbXK64wz9XGeRm4wyEd2+nrKqJCmRtjQsAQcRQkeN1ERAy+Oixun4QthEf+iWNRQaoQ8uCJUF3w==
Received: from SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) by KL1PR04MB7292.apcprd04.prod.outlook.com
 (2603:1096:820:101::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 09:25:48 +0000
Received: from HK3PEPF0000021D.apcprd03.prod.outlook.com
 (2603:1096:4:193:cafe::5c) by SI2PR01CA0051.outlook.office365.com
 (2603:1096:4:193::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.24 via Frontend
 Transport; Fri, 16 Aug 2024 09:25:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021D.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server id 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 09:25:48
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v12 18/28] ARM: dts: aspeed: yosemite4: add mctp config for NIC
Date: Fri, 16 Aug 2024 17:24:05 +0800
Message-Id: <20240816092417.3651434-19-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021D:EE_|KL1PR04MB7292:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a29d4a29-6cc3-481f-f47e-08dcbdd56a0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|376014|36860700013|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?mJv2gcv7fRWAQEWgMw1uRX+ud3jSzw5BAS5nF5FqQuSh70O12syBN4VKWrSD?=
 =?us-ascii?Q?B3fcTxdC7Kloeb8/Vjjm/FSC5pgUJ/bU2ggyhywF/VEvHB/Yr7qhs+qpfVO3?=
 =?us-ascii?Q?GT0+krrywswaXrd555PA/b8Rki4yVh6OejMYJ8GmhGV7W4v9VUjqdpJPSWu7?=
 =?us-ascii?Q?dteVaZEDCCk+ExGQlSKcBsRkRDikCRJJ0lIj/bMeg3LswiFI9H4oYgFDQB5W?=
 =?us-ascii?Q?gWrIkNqiiYVQQ2XzT8PdslbZ9b7O7/kABJDsj9RuY3X3Tm6wlX1cqLEy6NY7?=
 =?us-ascii?Q?XiuFkwlQV7iPF84Lu+07+VmbhewMsGLh+ImTk3d4LjhOrlLOK82iRxakd5mJ?=
 =?us-ascii?Q?ytZU7YR3z+8KbxzFa5AGqlbjuPtVhNFsa5zwR57fIqPiadD8sIiGRLIVibne?=
 =?us-ascii?Q?vDtXMBvfgppa5WQfb+NqYo0+iBO79YxXR0NdGhyo+MtXx+5XZDQZGtedpJYN?=
 =?us-ascii?Q?LAJ5YCI2dZfTwogJRvpIh5zdVPCDYGeI3h7zNHJbE6Rz8Nx13LqlY2jH7D+j?=
 =?us-ascii?Q?T67tymqndyThUZH3NOSuSg8+o24K/rPaLYwFJfSKh2/+PEIe34UBwtA7Xd9R?=
 =?us-ascii?Q?7TuRQV2f9MOLKHBM3GPkPUH8/xA/u3d2xO77JMcO+/Bh+0nKGlniKCbhsXc8?=
 =?us-ascii?Q?8VgX9d09UYAFy2Sk4LN9tm1OlHkpNqNgrZUl7ywX+xGXAvLQqhINWsELT6wQ?=
 =?us-ascii?Q?LoPtC4QYXKpefr8S1o1otqrFuCRsppdi5ZHbpWCsaZ1RCK3AKF6dd+nfhARq?=
 =?us-ascii?Q?iGjcTHR1fwqMRsMtEbafDfzQIKEkxcnc+T1gufsJH2D9xRkxDvrbB+otimvk?=
 =?us-ascii?Q?pRRhwEZwLu2HLFTHT2Oa9auGMFRI/TJ8tkql/rCi6QQY6zlaAz+EqNTOn6//?=
 =?us-ascii?Q?A5HELPiDA5hG7fJv1JeAqyVhbnH1fMShhBWIRdJ9JhQ9aWn0jvS1V03V2Bcp?=
 =?us-ascii?Q?12qqxErdVU/vtpJHJc09NsR5rn3ZzrW8UEnshTRsv2LilodUVUA79BYOcLzY?=
 =?us-ascii?Q?35y0W8rA3NtKbYAD8jrl6LxZ27VyqwWLf2Bls4YjW2ACYjf6mm7MRZJCWWue?=
 =?us-ascii?Q?RkPBIGnNM3a75MsFsLKhxd8SX+TN8gbVNUrYVekpRvm9vf5JbDh39uxBRMRU?=
 =?us-ascii?Q?WWt306O9gury7E+/n45OknJn9MojNae/jsShVvO7cn0r3neetP5sExC09zPy?=
 =?us-ascii?Q?OJxoGesZvFyV0ndAIrt13USfU84pV2e0qTa2ZgDP6SzuOb+ZljV47+xD/Jg9?=
 =?us-ascii?Q?obtO7gDlHsZsvRjgAYYR/8brPSbbZ5qb0Rp9893O/IHQJg7sOiKvZn/uca+Y?=
 =?us-ascii?Q?+N4+Vy8+AQJSmB5Em0fm1wody9rWDfCZG8rPTnhwNpo2jx1LORarvMETsKL6?=
 =?us-ascii?Q?1jdMa+5yol7xW9t4Ed05WcgRHixHqU8XVoh65Ozb92FCuMOrsmxhgL6XuVVV?=
 =?us-ascii?Q?lilbU7mWl5u1g19xbczkQhlEjjGP+cS9?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 09:25:48.2003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a29d4a29-6cc3-481f-f47e-08dcbdd56a0e
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB7292
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

add mctp config for NIC

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index b46a0b9940e2..7b8a2384d99d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1281,40 +1281,64 @@ imux24: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 
 		imux25: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 
 		imux26: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 
 		imux27: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 	};
 };
-- 
2.25.1

