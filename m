Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5662698427A
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Sep 2024 11:44:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCZhn2TgKz2ysv
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Sep 2024 19:44:57 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::619" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727171095;
	cv=pass; b=RDmuup5cOFWV/uP1HpxBucIUAA9ELjuxlFDJ0ZJexYMxhIFzUr4gwMblrGm0hlH/2kd85C5WOWJcORtSRLWwFsDdlzLsdKfhUVuS3ZQDwpsA4A3OkXEoc58GsVmfgdE0fsQYQswYGZ1OADEQDYr+S21ADgBEg1b5M5rTFyn0orHhUcHZogcZTt6z39dV6ygfsUjD9KJGSwpSv3ldDmDJ4HAnTL7ndpmODOQ0yInp8HaLwjGfzpasWkJxDAzAYpvGkzCsrnjGa3ATGgw27PocGmt9j/Yn2DY2/VKOYizc4av/S+h/dtPjzFGSB/2x6pOPzyOyfyG6H3UzNviYPwgU8g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727171095; c=relaxed/relaxed;
	bh=7kk6GgUvLcnjii1vbRoyfZhv5UaItrJfLB5vufjvVXQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SgoD5V4nGFKutNFLJVTgL3fUGKURyfoq9rPbMOmHBj3ydxU8uwXwGRQpC9yJ6EXUvcsHi7SiWDGf2hx0eZCheAMgulDMzBcOrwJ5dl4ZD2n1mqgnYv+QiviDZXsJ5NeVcGx7liv08+IPafbdA+TN7ge1g40C49fFjFTXxcY0hDzrCXowd3ENpgn0vrg5O5v2+05XHQCguu1+4EauyzoGkdIXPK39EmZhDs3XV2Vn0sfhGqAMkbF7AkUAzg7k7bfJKFDvblr/ggrnMbQvFOBfi3kYvzmnuc6IxyAlpBfvAnujsTUcLk4Maz9Nd0YBH5ivutHTgu11paERUyVh091zPQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=EMtWo+Oy; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feab::619; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=EMtWo+Oy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::619; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCZhl1Npgz2xHF
	for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Sep 2024 19:44:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=baQLV+Pv8brRzeL+2QZ0El//NSRyMCAQMAI1aMfx4p0W0SgClOdFkHVHgFKzoI3hjdqAhvCjovHoPYcNHesxeJMhIMJAPfYo9l2f2giw5z3VG1YH08jOStBZyquoVPKGeYhj5klm3GkgCRHdONFrbPl8cLTp8e6PwtTxCZT137Lid7EEDTP7ebRfuOcgVONFNHKagH31zdelfphD5yjfa7sQPiAH4gRZ6u46GTeQYajo4KvvG0GuT1TvcCCzltgiWWxCIRaq5auWXka3aEvujEfCOMYIdVGF1ubdXcUkAKbL9+5ixlKpA+SO3NYJrBNVwfSGAC8iiENdkgMidOcHGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7kk6GgUvLcnjii1vbRoyfZhv5UaItrJfLB5vufjvVXQ=;
 b=cIAuw1sm+XzS7+YF09QMyeR7cO6kIDQBXFyDa6ZrKoqLghWMl+UDKNXD2TeYd0omsi6C7DgDcrCQnPd8xbVOoxR3qC5F8EW4AzHC9qpP7OYkPjenRDhPsxeTUSjQuafYHeOeu/++8qfTR0h9lXDCjXYmKKP/zAwQJEjvdn5Onb8OJhKJXjeH4q2odPDAKj8z2ffxmQERdMqLiWYshxHHawZ0qDDeKr2biyrWId9tUWQbzKnyDPCB5JWWrk2KLz2KjJsOkeEVwEJr2Ahowsi1aRxMNsB04usDpjXMzxTf8+qkvnJTnegZR5xfi7b4i0affJoQru2Yir+9copAha3V9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kk6GgUvLcnjii1vbRoyfZhv5UaItrJfLB5vufjvVXQ=;
 b=EMtWo+Oy/N+G+hZoY3Np0AEnJivey41W790l+91JvQeSzy0mS3QS97XB9oX9S9T1YFo69Iv7a1bvaPfnBPcvqTzHDXfTgyUf1AAOkERMbHOgFX/zxPOJWzI+zfpY2s9YWj5FkVELgofXgzFiyuGrZ+tz7uD0xInFiKqBq8dptCgHAkelV1z4FqeIs9dN8Pd1fhJCxKtVWHMAVL+QTSYZdavSoV04Bo0m6iW74E+xZRLeCOZeBTSObm/Eheqj2x9lZwxaSurmONdYAMVgk/vHxwsnaJWkOULQdtx15+SHXKgKr9pPiuQrBcKcBSsu0ui+Q2fPO4Xto7hOwwfJRndGTw==
Received: from PS2PR03CA0001.apcprd03.prod.outlook.com (2603:1096:300:5b::13)
 by JH0PR04MB7477.apcprd04.prod.outlook.com (2603:1096:990:6a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Tue, 24 Sep
 2024 09:44:35 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:300:5b:cafe::16) by PS2PR03CA0001.outlook.office365.com
 (2603:1096:300:5b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.16 via Frontend
 Transport; Tue, 24 Sep 2024 09:44:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.8005.15 via Frontend Transport; Tue, 24 Sep 2024 09:44:34
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v2 1/2] ARM: dts: aspeed: yosemite4: Revise quad mode to dual mode
Date: Tue, 24 Sep 2024 17:44:29 +0800
Message-Id: <20240924094430.272074-2-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240924094430.272074-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240924094430.272074-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|JH0PR04MB7477:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9d967cd4-445d-4691-577a-08dcdc7d7f58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?erdgqQ3BSBgIR7FDutlTC0LEZBxzQMjatBHd+R+HyFX+5I1nOjT0vYJezKBM?=
 =?us-ascii?Q?CavpvDfbTYPR+w0UmhSMxSNDKpJMUSTP5w2NGdgvncgXjyQ8BwnbSJcdUoWq?=
 =?us-ascii?Q?5L07aY1G5yOiMQdaSwJZg3RsQbNCA3a2sqPZZ5OvsMQjXH3vduGAvSjkuGSD?=
 =?us-ascii?Q?ysoDbPdsPyoxTrL8EtA3SLl0IJnXaCaZYBdTPB627SCVhTI9hlAmDXAqiTLb?=
 =?us-ascii?Q?E0L9rv+mmVEGIUYSVdM1/Hkhk7rjR0wPMGvNacKaiOEw5ufqahwVwN4iWFze?=
 =?us-ascii?Q?ihhMOlywQTUbuK/mGeQvgw2IFxwe0pyKrllmMTXDP01lovsY4mljBVYGsXKA?=
 =?us-ascii?Q?sGfp0K/kI4HiF7JZjnwoqb3WzivQDiDVOSbbOCQsSbGjR/xZYIoSnvAIXTjE?=
 =?us-ascii?Q?DkrMQrSYNkryDaIJ5aXNurir6FezvfV3WedAuWs76jyPD8mzhenSifmq9js/?=
 =?us-ascii?Q?GtekY0xLcNMY3KhTtcSB8T+vJnSpf+bk4ZlFXvM0CvCVoOpU1UbCAcOxP5p8?=
 =?us-ascii?Q?tH7TaSoWD4Anc8Z+c0mIbshockw3jXyH2sawNIqK6tRg5lDU3EB5IraQRDKB?=
 =?us-ascii?Q?3+GLBwxoyv3v/aYL42eFJ4z3Klvy0s14at/u1nQxIT3RC4bvBLxnHWlZkH7P?=
 =?us-ascii?Q?v6gKwjvrWRTxT9ZrbBVWpnjxxdbBbHc7rmr45MVMc9Tf0eR/Sgeq2Z272yHU?=
 =?us-ascii?Q?ks9RL+yfhGNx1/CQWs3FA80cSPTVmeLc6a+6o/wpA0G1tAtNimf45kGLSq1Z?=
 =?us-ascii?Q?JbA7HWnXs3kEnbSKiYw0cEgtIXtQO/0pbAiDQghT0dRukvXYGN+PE4IvnDl0?=
 =?us-ascii?Q?4B7Sl7GoRjAuXJUCbCj9dW7C2AOwsP4YzYyuUGNPCGSvoopo0dgQadpp7SWK?=
 =?us-ascii?Q?aaTSoAJ0HelaQFJTXJieZ38HCMy0923VdFSi+SmNbbZri1Yd6E9GKoamKYyo?=
 =?us-ascii?Q?MlZQk3lAGjgTivo/SpvXflk272WBrY17jWeheHiZf8CBQ775Ku9eDcE8/YQm?=
 =?us-ascii?Q?lGSU+8CI2qs+8s+ooX0Oqfdn2/WnxBBIv2h21SYK6h0h7Roo7sk3zimkXKDp?=
 =?us-ascii?Q?j+hO3YvrLjvgKhpOwt/y9l2MzbKCYYQJKqxlQwlPYyMmWoJsdSRwmvW3EcuD?=
 =?us-ascii?Q?n7gvukY8iyDNjqW8SqyLsHpatkSXl0W0jFl4WCv72keRqWJH+Lq3rB8gJBeg?=
 =?us-ascii?Q?E4MLlTrwfvLGyMCr4gqdqKWGluN0W1eQWEsj8LtNMKOPpMe1+Advcaevn+4d?=
 =?us-ascii?Q?sFKsKKA8N3dXCr/T509c54vhpDr5q7fOjHdAoffwU5IG9EbzFaqg45cFOMsA?=
 =?us-ascii?Q?EGl34XvgpWye3EpvXHdL/m3VuT4aihQU34zJNLUF1uwBYgBxrF2GYuLCK7uE?=
 =?us-ascii?Q?EUd2BDk1bAuVXG5CdxvW98GsNv5EgCRwTa0GGm4AMlMmPmqovdWuUDakxYJ1?=
 =?us-ascii?Q?f12BqrDI1bn8UGMVs2zsrnqjVYwp/iHp?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 09:44:34.2942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d967cd4-445d-4691-577a-08dcdc7d7f58
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7477
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

Revise quad mode to dual mode to keep the write protect feature for the
SPI flash because the WP pin is the same pin with IO2 pin in quad mode.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 98477792aa00..c4af50ba6999 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -105,7 +105,8 @@ flash@0 {
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
-		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
 		spi-max-frequency = <50000000>;
 #include "openbmc-flash-layout-64.dtsi"
 	};
@@ -113,7 +114,8 @@ flash@1 {
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc2";
-		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
 		spi-max-frequency = <50000000>;
 	};
 };
-- 
2.25.1

