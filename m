Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAA9917BE6
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 11:10:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Y79QuROn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8G9x4S2hz3cCt
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 19:09:57 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Y79QuROn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::60d; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8G9J3Ypdz3cBN
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 19:09:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMBPmvHzk10gs6DUP/1k+WiUC70Glt7tWpLwfn4oKL+XsRhy40SbUz1bUnuYdXB6zDwbBux5n4alk0+nVtoh9yKAbzxwAUZJCHstTfdU/EZ1uYUUv66iumfzM9b702wBT/hCNjfOWa0Bi2rgCPBMqN2oMusgc2bpJuJ90b1ENs7z7MBVtUoK4G/c/DroFtmAC5BlHUCN8pKfH58SoyRXW6tPlEIZGGxMaVHUxNJal6LYV4o3GAh2dKjxLzTcjvh3K4iCaL/njlKOW0yPrH3MWu5UJxxdEUtm0BIy/vgi0Ay/RmcZEBINd5iLAU+k2maSX0yWbCIPpxJCQ7oDq4g6uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foNIYuXpkItBjY8qUhSUDvLy6XuG5cw+SWa9LoMYeno=;
 b=dWOzab7ED6oQggEjWVECe9xhnTzWW8g7gJ5fDx6s1EvBSulGgum/+V2nQfTIO0apsy55oK700knpLywIg3IYX7iHZD4l+Ue2ORptMPhH8wMwvOaHBtK/dxsjY97LpIo2MybUGTuPv46OtMiO/mnE3YYszbWVOuqY9vQrErx9V7WkfVp/i7yn1WkNXpT/m+B8mZ9TqraXgF6HoTEp9A2031xx79NQ514m1pIJ+gBh0pag1iAOp6ETRVYtRBy2PKwJGleLNX7sn1zlXs5v+HdWVPWx8qpL1HkX7zH8kvvxdnK8h4OPefC5UJkmmlVBVxVApsNYrEB9lM00Y4PnupdEew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=foNIYuXpkItBjY8qUhSUDvLy6XuG5cw+SWa9LoMYeno=;
 b=Y79QuROns63cy1AAevGauOSLL6dpD2QNjPeadUhAX2VeIE0bV1aqlG3X0KZBJqwsWzSt6qsNe2gvIcEKLaAo0rx9+HmU4tObdQqUglXHsRn80SXkycwADeApNyNGYVkBEIK0W4BVAbv5W8SLFm6SfKb5Qf0FxMpi7+2uc311lAnpgrZPH6HHljVJWyG6GKYjxCDkx2EWli7lQg+m0dJg9yk/8zAkzXTzarBFbhmYKKpy4JYi434uaJCXbYLtyMFqg151eoRq/ZbbSfBHHKHwWdmpD+AsYP+4KAt5WibXy6Jm0mBv/WDbL4prHwGDl77TfE6E8VDIjQI/ssubzRqltw==
Received: from PS2PR04CA0005.apcprd04.prod.outlook.com (2603:1096:300:55::17)
 by SEZPR04MB6995.apcprd04.prod.outlook.com (2603:1096:101:184::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Wed, 26 Jun
 2024 09:09:07 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:300:55:cafe::e) by PS2PR04CA0005.outlook.office365.com
 (2603:1096:300:55::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Wed, 26 Jun 2024 09:09:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7677.15 via Frontend Transport; Wed, 26 Jun 2024 09:09:07
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v9 20/26] ARM: dts: aspeed: yosemite4: support medusa board adc sensors
Date: Wed, 26 Jun 2024 17:07:36 +0800
Message-Id: <20240626090744.174351-21-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|SEZPR04MB6995:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9ebb037b-f6f2-4d67-31df-08dc95bfa25f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230038|1800799022|82310400024|36860700011|7416012|376012;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?Id86MXAv0LlCysjxTfmWQb9lTL6mA+4OcI3JOxxN4ZZGBNsJvwp4sJhFdtav?=
 =?us-ascii?Q?9gt381XumeZnAMmZScFb05+Xfhm4Lzl0CFRE6F+iW4awoH8I+C+xwaYedWqS?=
 =?us-ascii?Q?CIWNtgX43LFG4lFlX/wtfwsmCrKGL8F2QDsyuAndeiKw+Bx55rsFcaTBwY/F?=
 =?us-ascii?Q?IQ1vq34j1C6nLKhuy2hNgAc+vf6ROIPFgc0oAFOD7Rd+TG+UViJYaAg1Hlcu?=
 =?us-ascii?Q?yAM4oDurNl+3961gPy0RSEI2Fe7xVTHm+U8RxVsigjNMcw1vkUHdzW++tUhQ?=
 =?us-ascii?Q?HxWaqBuVf2QMUJ0hndLf6HbwhFWp4SpIVxDaQkN36E1Wo0PidmIMRotpA0wQ?=
 =?us-ascii?Q?eHeZr3dtrCfu2B0vADgpHD3ZzBpFowlUVw+mps1EYjACaGuOvui+/5UHiyUS?=
 =?us-ascii?Q?VndkwfcAD8Ri+c96xMOxRSOk/BLYfgspJupdoKS/u/Vt323142tyPg49F8O2?=
 =?us-ascii?Q?welLa1z6fq9Xm0baJbAd61gNzL23q7dCJV4YBbpPRoAtjqx3JNQzutche+dn?=
 =?us-ascii?Q?M3ydcOQ25sf6oUcfuwG4399sF1SlputgQawIp+XigaQo2hNNJbLBT7tXf3CT?=
 =?us-ascii?Q?p7cJSyA3VM8i+bjXwiVpy7LbOJe4mFHspcXj7N/g97omLmB4qNXAgKMY7rso?=
 =?us-ascii?Q?Oc66iKQGtL0pq+TOrZmjmN5pPacF4WTdk9qFcdTChL9pC1ToT705W8E70pje?=
 =?us-ascii?Q?H1w2gQewZWGYzV8vZLumqiu/8xqe0xQVYGIo4gDi8vpZG/afhDLAtulfckR/?=
 =?us-ascii?Q?jUiAh9Sv/J1Kyfd9n/OoiKrr2I/Cscxz551nzWw1mqeg9VT2iAlnoN6ZvesC?=
 =?us-ascii?Q?UffJ930GeGjNyLdL8YaheBUL2uO8v14rnkT90le4lpsGANk/TOGpYNzQ1cti?=
 =?us-ascii?Q?RotxJZsJrfByG6BU3HYNM6Erp0tIP0/8Dqbb/dFPVpaHEPrF0WyssOaSnTh6?=
 =?us-ascii?Q?9Zn3MYLMTHLwXxazyBUXOI7JckDB/Vuc+gW2sR/J6vK4hhvUHguZIIMfwQGv?=
 =?us-ascii?Q?w5qk8ZIlo18KK3xurWbQIubvz5LP5Lfa2trgcVhoqvI6ZmoYoj9cs4N+/MEg?=
 =?us-ascii?Q?OdxJVEHTFs8iM370ZF81YLt5cenG+OEy8aB0LI7+KKY2MUxguKV3D0z2moh5?=
 =?us-ascii?Q?ANXTFvQfBNx6eNBByk8T7dhMjXuIAH3lUB0cpiSmSG+HQr8lqeVXeQ5MvZuu?=
 =?us-ascii?Q?oGLeV6pRVmXea4YdhPXC18v4HrW0Kgt01YNzId/r7UsbA822H7rqGSfw96j1?=
 =?us-ascii?Q?NETbb+1gSRKRaIOQrSdx6Rm3SgOYJDbS/nK4ePT6Myj7mGpb4J2YhhmoQI3+?=
 =?us-ascii?Q?tBZPVX4LWi2IOFH8hQgUOHga1U3b4OesQd4udYDdJZbPIMQxAWIBJQD7TyoE?=
 =?us-ascii?Q?Ez3UhXhc2sUKtWlIzHOwqSXAXE5YheNdjJJlYrB3l46ggd/XcA=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230038)(1800799022)(82310400024)(36860700011)(7416012)(376012);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:09:07.3020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ebb037b-f6f2-4d67-31df-08dc95bfa25f
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6995
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

Add ina233/ina28 support for medusa board adc sensors

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index f4e37187bd5b..bacaa2208734 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -915,6 +915,19 @@ power-sensor@40 {
 		reg = <0x40>;
 	};
 
+	power-sensor@41 {
+			compatible = "ti,ina233";
+			resistor-calibration = /bits/ 16 <0x0a00>;
+			current-lsb= /bits/ 16 <0x0001>;
+			reg = <0x41>;
+	};
+
+	power-sensor@44 {
+			compatible = "ti,ina238";
+			shunt-resistor = <1000>;
+			reg = <0x44>;
+	};
+
 	temperature-sensor@48 {
 		compatible = "ti,tmp75";
 		reg = <0x48>;
-- 
2.25.1

