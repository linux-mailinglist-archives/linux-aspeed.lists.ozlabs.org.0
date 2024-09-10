Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BB997278D
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 05:14:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2pjD3y7jz2yVG
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 13:14:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725938090;
	cv=pass; b=Uao3d33H0e/pruS2LVS8sAav69Xug9HoAjCJEBwZ7sArfFdUV3rIDfEqgP6nJinJ4NcK60JnEMhILFCmI96OYvi3HkXXJub9egtRfHx6Ph+GIvVQ3m9pvPC8jL+wmYWUneW/LY3lqQuNsQ58HxL6p4G8mBf+lLd8Qhf8nZ2Ytrycabc8dpMIa/XbrqV40F2SGHl75tyVkuUve1VXSde6fINsCQRpp6NelcXSfjQmLBGmPaJhomHglXpZ3YVriGI+LBrpGVeco4lI9x1TjaaE3gfWbafTNRAxALt7dfRMoIP0cJKt4vdfQ2n958TPYyhMK50IQtiOMDsTHvs9CRbZXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725938090; c=relaxed/relaxed;
	bh=8eLOfRy1O9CIq8PXazbJE5wEMn2JL0rsvV6UeIi0NRo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Wpy4EVY+4nc/Gh3l9ke3EXniygUltWMtixKyi2fCgGFvulE92uUnfQyq0z0dh0Fp520sS4/qHE8IH3flOarZX2omQMIsZmDTsaQChsYgCfsXpOxtsTWPSVeTP4eRUUvLx9TDr+deegQrt0SQvgptmMEmysaJcvogdsTbaXQAm00r68TMQPWRfWUeVmNoUwVRVxL6vyR9xeyAov2IV94y26gT65ZI+VIvYlkk4ee9VoURZii2WUZPb0Mi1J6LniW8KUQWrt5e29lLuNhScfqgNzhCUDYqAJNoS1f8b22qMGJEZVy0xqRAQBsJK8Far7UOQ8fGSBa34OEnyqH07enjLw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=s95YbUGs; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c400::2; helo=hk3pr03cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=s95YbUGs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::2; helo=hk3pr03cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazlp170110002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2pj65vyGz2y8h
	for <linux-aspeed@lists.ozlabs.org>; Tue, 10 Sep 2024 13:14:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XgNLmhlC4DhuW4PQf9weE6ksxJOBx8IDsrqSyisk41T83OR4U4ZTlBJaoAFqq7byfSbEwKfiaJUy3En1c7RWeK5eb6kmdCtzpYmBVOgkpKggDNBuBBlribdNCNTOCmLwU3cpoJxoW5460dfZ1SMBkltXh7cMbSfTpJbXOnpATfZgZqRUdAtSVvKvTNKnIlmbmyGpAGmX2gTNJG9jvJU0/z67GyPXJgNRLMul+5sX+uhLe9p9ixu/cdxHS+S8iZ9DHd/XRZwfIgGkdMMQTZcbCPfK30mRIGzAjK9tLr4XjcDZL4sGiWuUfdWH+JIZeogNLq1K9LvmCichHHslBViS3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8eLOfRy1O9CIq8PXazbJE5wEMn2JL0rsvV6UeIi0NRo=;
 b=o4xMxdF9ovQP5MmmsC+hMne9ptcSl5RMtwzx1D4V/dBlEIpJTv/iP96zapO8sIu0EiLeDb2UP2zdDadCt8qsTRI9kszjGgR/4XPESa6kkawC9K7bPKxE7ukrki27W+SVU7ma+Szqo1t+F0qBUbNHFyUfIKjImatW34loePwWJg5qAiv5CUnFb0ykX3WsC88BHMpQojVltp4N5lIgXHVVT06UODVsLUZTMtMqeJK23L6/c5Io3YrMdHjG0wYeV/ISlw9yjriTycQYfWabBQ2hWlvuyFeawkmiqg/JrdvCVidbboRsHOGgefPqWmice+W51Wduf0KSILqnXWGns37Zdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8eLOfRy1O9CIq8PXazbJE5wEMn2JL0rsvV6UeIi0NRo=;
 b=s95YbUGsq15pWo9NSNILEZ9UaWium8SReAvWi+pL0gD3i10ysyILIB5s1Lv1jams2IBn8now1s94pzxJ/oPIWXznFqOauv69//MBHpEm2/ic+RVReOYdJfGL2rYBhJHo517fJXqwcz5miQ62YH328Ddh86/u4hZnUThNXNXG0dLHVCd7/g7F/IfE4cp1gR9gOB6b1p8wC13zfknhdeP+FPELr9icuIwVyF+VzXzWZo5ynl10bG6FEB2oQJwvajIdABit9zQcl+d6qq1TR6Cq3chZgoifmkIJ1UQKvXbYJn4B3uO6l2df37/yye8c/oN6DbYhwvkcjuBeAcejyml4Hw==
Received: from SI1PR02CA0029.apcprd02.prod.outlook.com (2603:1096:4:1f4::20)
 by KL1PR04MB6852.apcprd04.prod.outlook.com (2603:1096:820:d7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 10 Sep
 2024 03:14:23 +0000
Received: from HK3PEPF0000021B.apcprd03.prod.outlook.com
 (2603:1096:4:1f4:cafe::97) by SI1PR02CA0029.outlook.office365.com
 (2603:1096:4:1f4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Tue, 10 Sep 2024 03:14:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021B.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Tue, 10 Sep 2024 03:14:21
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v1] ARM: dts: aspeed: yosemite4: Enable watchdog2
Date: Tue, 10 Sep 2024 11:14:19 +0800
Message-Id: <20240910031420.2295727-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021B:EE_|KL1PR04MB6852:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 623474df-3c40-4201-68ba-08dcd146ab14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?u+pvcp2Y01QwH+/jR6daL+8c+3k3gkLdcsiNeXoVyzN9cuC2/CgRKndRoQqf?=
 =?us-ascii?Q?MkZQBLQl3e9TlHQbV3m+P3Cz48xxMYe50gc7Fmkt7b6vhrxve1vruPOB2ooZ?=
 =?us-ascii?Q?LyesShapuBr/PKTtpMZfB+ZPy99qx0LEcy/k++duA8LRHiXxtwSULTtZDrPk?=
 =?us-ascii?Q?Zqf5Ib9NH7ceqIRabhiC4sotfREXKNIA78Y8tyNmZ802gZAAKuXO651oCEu4?=
 =?us-ascii?Q?wmwXmWzNHqYZ+1adrLtfHXGhUqS96sAf+sTXATlQ7WAxCy8VcAGyoFNQ3IHz?=
 =?us-ascii?Q?VBoMnvJ6aKTQvIdhW6svYJt3udogh6REnoxx4rGYQID1rmYYL+R7tOUBnDIE?=
 =?us-ascii?Q?goDt2QtCxvAK2CUfOtoGW92S9WrYmy3V4JQgljwBugpgjr2B2JdNW0Q73hPd?=
 =?us-ascii?Q?TJsay81G5AdAYbcx9IKSY5URsdTsYA68KRjJ6Xe2boAMShXPEUUdCBzq4vNF?=
 =?us-ascii?Q?rmXz8WRwxSHGzWVTQ/Yxz5lz7//fe74NcGxO3a9kH9Pq9pT3uAJR23czsouj?=
 =?us-ascii?Q?1fM6mTDSLMYHa+HoB1I8BRc1Dp7aEd/0feqKOgGMlYIHZuRgc3bH56f+qWjj?=
 =?us-ascii?Q?btpl32LVEmoJRnl1d6OL6lq9F+1FckVANk0hDi3TNDpdVhP9LA9qXLi8HP7n?=
 =?us-ascii?Q?s7w/2wikvEFYCm7EhKn2mk5+3D90so7WCsR41PSNjhG17ubAS5Ek68z9nJWa?=
 =?us-ascii?Q?KqHhLEAoWVTQpmgzcv5tjRQGYXTClBmZGCUsGPpdypflDw2N4AI/UYm6vJjk?=
 =?us-ascii?Q?1dGiyc32N7dXN/MYy6S8eNUdHQJDzjxn3l9DxHKyxKilgmB4PfXaweKjfKwN?=
 =?us-ascii?Q?8N8f+tIm4/lWJ/+IyXoElnC+UweEohM8A4n8aUihpIDB8YaOEOmrfrXWDmXQ?=
 =?us-ascii?Q?NNpdd/wNSRNUUuPayfOTSNEI+4kF0dSlOdqI3jtu4Ms9Qi35jcXGZmWaaMrA?=
 =?us-ascii?Q?ejC0mu6i0oXVCoD2aH6AZaRCF9wA54PfI6PZ+emXwqZwAo5fCVoW6PkcYxcs?=
 =?us-ascii?Q?WCoudp9t5yW9O+aemuMt003NWZc7I08pXPynsoQS6dyiRLwCvwpUFDWXm/EJ?=
 =?us-ascii?Q?sKkdaIeh982gFCsjLURQSYjPaFfRDPjYoJVG8dyZvN+RK409Cz1dmxnu0Y4G?=
 =?us-ascii?Q?z/RfGFH2tBlGvb20gZ/nnXxFQWvvAtv3rLPEivF15TrJk3Vn4F8Qgf/zn+ko?=
 =?us-ascii?Q?YeEwSbAnOt5ULGiClW7jItiERXROJVSbxGdIxzTmwUxF7Y74Wf2CrYMn2yAc?=
 =?us-ascii?Q?QN3dM+UJE1T3/Fy94YHLo2eA86MYWEcaovk+dzmQB2QsUX2MjhuY22QdRIEQ?=
 =?us-ascii?Q?+TeB2gNYpNx0nrsq7ZO6VBi6PQEmOCWTtm3oniywN8PSFiRyDOy1hwgSeUYm?=
 =?us-ascii?Q?f5oumiBK73PAch1WlzgjwJ2sVjA3fBSSLTMWBvT465S4VDAw7HDx1ylNyCU1?=
 =?us-ascii?Q?hEwhVuXipVJST8GMu2FOsNrb9E3gNtOi?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 03:14:21.4800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 623474df-3c40-4201-68ba-08dcd146ab14
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021B.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB6852
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>

Enable watchdog2 setting for yosemite4 system.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 98477792aa00..c2dd17e0c5fd 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -83,6 +83,13 @@ &wdt1 {
 	aspeed,ext-pulse-duration = <256>;
 };
 
+&wdt2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst2_default>;
+	aspeed,reset-type = "system";
+};
+
 &mac2 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.25.1

