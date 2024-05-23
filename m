Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5EB8CCDF6
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 10:11:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=ujqR/KFi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlLLv3J1qz790b
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 18:05:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=ujqR/KFi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::627; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20627.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::627])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlLLR11Hnz78mf
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 May 2024 18:04:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uthk+HCrtngBUt8ToHgqGLQpDJQYrrIWZuJCb+0A1B014tb1FJLE+miXRtv5PKi0RxyPCHwYu81lLtIUGdwl7GzxNaF7NdacSmumOA+LYv9ZdjRqsJ41Yg08WXPiXU1N0WjBKtq8SdtilDbTh5iFYPk8v9BZ3qjw4qHfxlm3lVhVDTUqMyKHK8pgXs0eZXEfM1G3AHKyBGiXkCXiXchkbeXIUfKckz/cVvQ09ozTbsZr2tD8ldRtY1wFr6Qo/2sqVj0lfra9XWhtBIOdOqkKR3M3/nePqrXSt5GABf6c3lhAT27JUWb1DJ3QLnXF7vXLVnLxUzLhmqsrEXB5qUKyyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pjrbPmUmdku7Zq8bJDb7/0Mq2EK7dm/UVhdSc/M8aE=;
 b=aq2+KMyhdLlb4V7kKwv1bQXgOH33qBfX+fE4PsFWIlW8c98HF3EeNb7QyedKVke4l3AU8cx0bX+TT3jUPm2Dk3d3gUr7zpuTcDBtAGLsNskacKCe2Trh+wnfiV+RHaWDRY3wST3yG/G7lqI3tYaSpT+A12v4BmgMJAdryJX5l+0gWzpHh5PgvnCqqAvIcnAc3oekFb5lA7JCI5sdnjAV206wfsRTsNj9zrOHoxaNmrXzec/zUeVBeyU3iHTnqF4r13pW9ojjPvPQJzRWc9mMR+8YQUzeqBlgeErOvxBFigzjvXPxfpIjC/mJrotDKm9/kIQ07chvOt2JjkP/misPGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pjrbPmUmdku7Zq8bJDb7/0Mq2EK7dm/UVhdSc/M8aE=;
 b=ujqR/KFiKU2RW06rAASJeALWxUVdTpzYmMzqek2uYrrqxRHuK6aobTItJEfj53lsDdPe1nSke4RGzpBklKKuFUkv3rVfRmbZV1qBaNigKBhpSHeKI2syswD1vwDu7PJVBUWOKTylupHzZC/KsrmV1f4jRKkkYBSejNwHw7hH3LsNyG5fmQz9ildWu4Pf65qtCT6KqdZlePKVzGpioe/2uGpN8P4z10m5qQVINZDLI9LWl8MmZi0P6eDZbsw+Y4oQN43GbwYgMvSa2yIdhYBV/1MwEGEiJvyjDHs3tNN6dOX2fmOcKR/IWtc2yAxXId1lTXMX2yld1LnG/47/QuFLlg==
Received: from SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19) by
 PUZPR04MB6717.apcprd04.prod.outlook.com (2603:1096:301:11b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.19; Thu, 23 May 2024 08:04:29 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:0:cafe::b5) by SG2PR04CA0157.outlook.office365.com
 (2603:1096:4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19 via Frontend
 Transport; Thu, 23 May 2024 08:04:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024
 08:04:28 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v8 11/23] ARM: dts: aspeed: yosemite4: Add eeprom for yosemite4 use
Date: Thu, 23 May 2024 16:03:16 +0800
Message-Id: <20240523080330.1860074-12-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|PUZPR04MB6717:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b3996899-ded4-41bd-c235-08dc7afef8cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|82310400017|1800799015|7416005|36860700004|376005;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?njcaihONUIZDvt2F+6eeLWaaDrkvl7TOnOWbUSq3VmHgtsMh3rpXhSpBNjuk?=
 =?us-ascii?Q?8Jnbq/ZLHMmodFgaJXx5hp2nwpNT3OeupnMXyV92+mOf99v2ZFVoVHJBIeqd?=
 =?us-ascii?Q?yvilIF2OES6w7L/idHc8hpZuwwEA3jOIOU27EzZlBMkfhHYV1Mz7Qig3EyIZ?=
 =?us-ascii?Q?YIPLWkaEJ6SVoiKn9WvCgdsvTSqhHMlQF9ADTyhZ1Rjxyw5sJpNYl8lZSQIy?=
 =?us-ascii?Q?FfesL8Qaoiexq5mFIqIblMR5Ng1Jm2Spxd0yINlja6Xr6vXUyeuW3/FMTFGR?=
 =?us-ascii?Q?883u08VO8Xw8lBqA7DX4/mdJfYQjwz43Non2MuVQYbl5llq1lP8oqGHH6Gif?=
 =?us-ascii?Q?cf5jEv0rwt6tTR666gB7Y2TIStvwvqgyDUb9ts3gNcpHjqosRN4B0BfSPgxU?=
 =?us-ascii?Q?eJqcUOzZi4KGhmASHxs9I/+c2VCHD3TC9E0WoY7lrwMJd5rmmAW0mjKMW0RI?=
 =?us-ascii?Q?5OMxK+TMlyM4QrpmScm3cqlyjHC+8Iu0HSuDngU1by23DRvK0+ph+KEiKkyS?=
 =?us-ascii?Q?I6Q86cK9nSM/e5mRJMDz40HfjzQbJSEzLEZR4p0SD1Uq/vxOVj5kX3YrLtnn?=
 =?us-ascii?Q?h1qOdWePfnc9kjw6A//Od3PwfCzpQvC5BDG4ngiUVt2iNuIQGXq2gS2PcRN+?=
 =?us-ascii?Q?w102oP4HUsEZ3bOThSsBS2/u5xcJklee9QnH4lZZViCw+e1jdEeY+0rI2MBG?=
 =?us-ascii?Q?OxXlq1ITKFEYTMCPneu0fkXKYW9C+nCCHDVQ+chp6FePjGyBZQLGPwvHKUy7?=
 =?us-ascii?Q?lkyNvGD5rTXPwKuzZHCWfRXiHmizCtYVlUCJ+8f84RQjzXMrvhMkewMtj/yC?=
 =?us-ascii?Q?csj2xpI2IC+HysEZVYRjFcN71uqXod/sKtSzM2Ghy/eTBBmorG/LBGgObu+y?=
 =?us-ascii?Q?dgYfTTjxGOUtJZK2/+BZ8yxjcgGcCyXFOCJeOX8El2X4jPrN+31k0h+2gGzL?=
 =?us-ascii?Q?RA0P3LD5nVn6qNBHCz6Z69McaGWKbx0/9gE7DiFkHBsFJlw138nfA6kPMWJO?=
 =?us-ascii?Q?xnMlvdclb8JrbzqtRGfi+Ji59u3bWlH1DdH2kixOb1hhFTdGjLxRrZS8BZxZ?=
 =?us-ascii?Q?eqUWJvB7RxzOplHR3QYfIPKeTl4e07m2nsA+vQXvj6yG+bFrCyLJFIvgBMJe?=
 =?us-ascii?Q?Dyafk2kIv1D4xRyXPbcqHE+Ud5pWNFdmAo8/DB34Yy78CgHrvsmXZt9zO/bV?=
 =?us-ascii?Q?29yx76x6305TtvZu7yMDMohs9F7rVF/favYj4p3F/0lsG5+3/cMwvBiNr4fi?=
 =?us-ascii?Q?f04cihWdlJ/35zyefeLJZBxwaTxLjS9C5LUf0lgEi/rzik0Exz3Gh0fJlkTd?=
 =?us-ascii?Q?8t369GUYWBuNERC2s+KJKcJAt4vUshkXb/fooOctMbXoWWMaWWkTbM3Xhr3c?=
 =?us-ascii?Q?8cI/4Fw=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(7416005)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 08:04:28.7655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3996899-ded4-41bd-c235-08dc7afef8cc
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6717
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

Add eeprom for yosemite4 use

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 2ac872878acd..9a14f0220cf6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -932,7 +932,7 @@ temperature-sensor@4b {
 	};
 
 	eeprom@54 {
-		compatible = "atmel,24c256";
+		compatible = "atmel,24c128";
 		reg = <0x54>;
 	};
 
@@ -971,6 +971,11 @@ eeprom@50 {
 		reg = <0x50>;
 	};
 
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+	};
+
 	rtc@6f {
 		compatible = "nuvoton,nct3018y";
 		reg = <0x6f>;
-- 
2.25.1

