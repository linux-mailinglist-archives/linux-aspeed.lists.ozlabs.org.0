Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7174A95E897
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 08:26:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsggC3Kb5z30TG
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 16:26:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::600" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724653589;
	cv=pass; b=RecgCyiw6u7cHUPqLskjmXNlpNMUDLN9OiTFoej+T3iZtVWJCdoBjOJvY7VFBwWZJqNDO5ZFS7zKHIkTwJBw23rgKYeaXhEgVlg1+yEW3+cMMq5rhsw8rlCuKZUXdAaeBWfcL83m8Qq1gx+FxI/rPBxWClPUVBblXBn+Agt5Sn28/BNFeAsCGWhyzhKRuMOzszxS0speKTTibQzYVJBxFJM/1SEfVfXP5GhvYhiGOrCARM3rpFNNv5dI9ojfpV3ARywYHBpqNZYWOTFxfnkLIoZSz2A0C1F2eK46JEb3QrHaT1R7X2Av94BDgYOwSZw8sKqysgjZbWUoGQZL/O0F2A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724653589; c=relaxed/relaxed;
	bh=xKDiGhY0qi6Zhw5yz3X3KRvVupBpI62BiZwruuZTFwI=;
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
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=3y3BdL+c; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feab::600; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=3y3BdL+c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::600; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsgg9373lz2xsd
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2024 16:26:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8LbeHyhgeFbXaGlHTWsGYGHm0PqcwCQusqidssOKVs86gsNpbe8xmdyi1gPgq1/HYYQwFrjF/cetjcOV2yBkMdh2H4i8tf+2ogH5vl7crqwPbZI7DhYOgSGTKgY0fKD3yetuf6U4f98BOHH6ylmGi1MJB7b4WsLpk+MIFtDUbyswKXwM0Q+ekumv7BjL2fA2rXK9IDjpCLzKP17GsD8uy/j48db1vFXeMX1DCcQPQ3jSGOvch7TT6Hz+vlqZWrQqtlW6i7AUQ/kEh9g9VbQGh9/FNwlS4E62Foc6zDwhe2QzRG+wGDhGC99fJQWMhfS+10kvckR0r7uZU9wNGROmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKDiGhY0qi6Zhw5yz3X3KRvVupBpI62BiZwruuZTFwI=;
 b=qDWain/U4MOt5oBFYTOajMyEzp5GdusGta85RWNrwfpgRGZReBJKqVNCi/EZ8OinP2cnAyhDpxPvfl7yYBC4aGwc3iffq1Dz5rUtylnZ9MvKwagRDQGZ3kVElGV8V1cYEQ5Q9uMbMNBUBtAujS7TtNSTWjX50xfyhV5nAjYZS4UJdiiHFudg8GMNodxuXAA2vyc9gnKT9S22Vzbou3y6L+DIfzLJjfgcBFA+Hs99DMFW7O7rJe5Sm34/L/1cWVG/hyG25UMga2VrJAs5lwqwNYz3MEetBr+qqm9cAevwPE4jp09jpevftaAPpOr+yH9L5rpPigGw3CHmlpH/g6MT6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKDiGhY0qi6Zhw5yz3X3KRvVupBpI62BiZwruuZTFwI=;
 b=3y3BdL+cl+hj+glrQhW4xJq0++U2Bve5/u/Mw7FM0NOIj4s10XqoQZpvOR3jGny6vFlCpQAt3BWnmJQzlgUQEtzWsDRsqjVF2JgzC36j1VDfnelvf1NbGlm68bi7iW5RgB+riSCFZuxsqfX+2IxwAxZFcytFmw+oIVlmHxNhIAFuQGWuP+HmqXtF5Ru+mxHT+mmLhS/tIJcNnysHaGsgQmyf8tIzQq/jEFswexNx/wOJpBu/4Wx41ZB5+vLR/ALkDl6LYEW8PsUSxxQI7HraW06o8zGBvXdZ2eVTX1ikGyQFiISJeeuZMEFp5KROBHGClFO14kF2UHh/9qyCqis+cQ==
Received: from PS1PR03CA0014.apcprd03.prod.outlook.com (2603:1096:803:3d::26)
 by OSQPR04MB7989.apcprd04.prod.outlook.com (2603:1096:604:29c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 06:26:06 +0000
Received: from HK2PEPF00006FB0.apcprd02.prod.outlook.com
 (2603:1096:803:3d:cafe::d4) by PS1PR03CA0014.outlook.office365.com
 (2603:1096:803:3d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14 via Frontend
 Transport; Mon, 26 Aug 2024 06:26:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB0.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 06:26:05
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v14 20/31] ARM: dts: aspeed: yosemite4: support medusa board adc sensors
Date: Mon, 26 Aug 2024 14:23:54 +0800
Message-Id: <20240826062408.2885174-21-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB0:EE_|OSQPR04MB7989:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 64a62c9c-3556-4dee-c4df-08dcc597f729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?UUihK21i9+EEgVctpecCoqLtHjtzaW1sTaGNx4kcCbxoz6lvO9/3Uy8cztJG?=
 =?us-ascii?Q?6Y9V99oE9XeacKKdIADDVHBUiiDgMK2U5UojoHnkBuZyeDie+eE7h98Ezwxn?=
 =?us-ascii?Q?g5lJ5kuO5KH6Q+dQZJre0G/i6u2grjRZmSzOjsseZj5cWOLnEGJm2ddA8rPp?=
 =?us-ascii?Q?SU5vfUB5l6Xe9noW1QO3roMoI8rQw9ghC2dcXFOyarBAGGk0eapHD9H35OaN?=
 =?us-ascii?Q?w5vVj+ojYV05Uit+fKh6BBC8XUKF6HX0zoh9TE4ZiAaaIB3nBZiC9a8VM+Zq?=
 =?us-ascii?Q?j4I6KpR3gFb/3tn7oMsgjh40/sk147Zmf+Q9rj5pqA6mivUZ2xYiR0uc/uXm?=
 =?us-ascii?Q?CfjYMmGtzx/8+k7BPpe3KdFH9OBfApNPWZCyGugHT5cW6R6UXzi+KPtvbIyQ?=
 =?us-ascii?Q?QSTaPPoYxqvB8jSPlcI94vUP4obYvE+Fv6QH38UZD3m5pPkSgw1AOtJ/Q0hW?=
 =?us-ascii?Q?WKGo2BSw92zXlC51IbcPranC+aYz049QPpFWJBx5f0mIj5c4CFqPZzAv389U?=
 =?us-ascii?Q?wMBck8wLIKz0yQLg8SkEN8He8iAFA3k65F54dd8d9BNmOEBqgdYcaf3WQRtq?=
 =?us-ascii?Q?BfXOaPVyJ1gUY+EeTfbo3o+YWppicoW2O6gTknFbI/uVDEBqqp09QovOZ6wu?=
 =?us-ascii?Q?iRuswAKLOL0jDwNKa3vSK0LlviVlKJ5AdEway61moGfr2fNrlx6sLXxaKGVY?=
 =?us-ascii?Q?vJufUS2LlXQhHb5x6su7sGWsJ5AV4NpgfdVBf/5iMRYv3EpyX92uqB8RwQKZ?=
 =?us-ascii?Q?nbCEqu7TVMxYjnt47p9SUXvmoHQpY+99h2naenVt93XaTsFMZhYBHBVwaVCO?=
 =?us-ascii?Q?FUzi7CjUB2yEN4kna6ZJmuxhoe8+4I/JibCpgVb9CpYt0jMlvpP3rY0wMPie?=
 =?us-ascii?Q?sit9fQzLmnjYL5DyNSw6MZd1CcAwp3Z9wEcY4xlsdNZlJJSMmE6XsdUskB2s?=
 =?us-ascii?Q?n8j3Fis7Uw/AyYOxJwRdVBmV1cAKlDCiX0ZS0t6yDvdmueqJ1H3R4CKsu7hA?=
 =?us-ascii?Q?yJYH6+eoHxfI/JnVbwiRn21/tzWMBwp8Gaaqg347pe1kAjzfeDapRg+hkL2k?=
 =?us-ascii?Q?iLl86WOrY4kRdFq03Xcw5xaivJlbYsRwh7F/kdk6N6aCRPkhUWEbbm+sebru?=
 =?us-ascii?Q?zM3GNS6QyTTiOmiSHDUXqd0J3JZsYCidw/2nmfqSz9f0LNzcUyTywX8dgT7u?=
 =?us-ascii?Q?4SEfXjd9oWWIqZ0YbHZ8oJ7Mso/MKYQZFkiZubUS9J4LGubh48RMlagPUt6I?=
 =?us-ascii?Q?3czZ7uAWa2v3srEuiaXHB/gufCfkcPHI1QNPCWG4mOaJgY4mZVUJikZy1mtr?=
 =?us-ascii?Q?zMNlCrsKSgqJe6SylmQUDoHPVKNvx1jzqBkUNZQv9ISK+Q61X3wYLrbHfhSh?=
 =?us-ascii?Q?HvRDPiZiSjBFLVEXPDTkKlkmzfuAVGWvaPDIBJR/840RAPKxZmWKfEsN4fnt?=
 =?us-ascii?Q?aid5kkUk5JJLuLkUNfm91XrMVbBMj14c?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 06:26:05.4867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a62c9c-3556-4dee-c4df-08dcc597f729
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB0.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR04MB7989
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
index 98eeee49b082..49500db53a13 100644
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

