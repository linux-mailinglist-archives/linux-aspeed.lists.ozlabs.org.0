Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB65989AF9
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 09:05:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHBtK2JHrz30NP
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 17:05:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::611" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727679942;
	cv=pass; b=fBniY37oF49nB4oFpajRF2oPOuCayzyR3yyRAkanHjx+DgnYMLo7XSVx3cCNGOJm3qFi3e+r7cfm/EH+0JjKiS0pGe2FNUK6SyH0ucgq+fvwmjcVH6P9Tyby37t9ja4POySueu6L6ubszionfZxJ+7QiB9GRa1w2y1pTnXRAD6uZTMpYKKAVubNmOm1lsLIQQlrVX7ws2/SudsZSdA6ihQhxo+dLACVWzX5lHaMN9tCIuUcBGI5I2zkydPALcSZJAa/Zuom8A8+bmLUYe//xw0WEYgK2K3UzNUEBOI+JObN0rpkfQDg4mwtr4I7xoqvbtMgQpTe9JMzYv2KIjtiXKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727679942; c=relaxed/relaxed;
	bh=dPdMT/cRglR++k3gSQFwFnG/0KysAxJkHL+SgK6IDxM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o1ARQBdn9Xssu+IHVAD2uhEQB0Q6eaHDjwRARAuUrgRn/gZ9rqY+LbRHQ+Nj2SY4L6WJ7KMSkcjVrDak698zmXVE7Q8aivhb1bKA+s90WTYTkU3PVz3c9KTUUwxKrwEi3QntjzB2hErvAIbOQUiJNi88TplZu/FohTlg9Pl3dCbZDLab0tprRQG0XHOmAbSUF6sfy+pF9xhsDnaFpHih/wsZkKuAG+D6mZFwZDZrgcrXshdR+VeTQy4PpR17JHA5R/EAerJK6zX+qeggpWW6JOrGMAVZUSPBrzLBdX0/hHqZi2yhczMk++nb6T6qUowmL/K+xQvhwmIesBIe+2YWBQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Jgx5tXPf; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feab::611; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Jgx5tXPf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::611; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20611.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHBtG2RH7z2yJL
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 17:05:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCEObr+RtCrhXFpsG/f+H4cnZomvtCuggBUNEULxiw3irbpr8+OnJ88ESX2/Q778ejp7jBy93VbFwhbe44kY+z/qfdGlq7xWfHmNQ/c4sRqWXG+V7ZJMs6klBtMsZvTFqPoSoTgFusE2SIWdjNBbhEVPM+WMXt0+Dau7FPa548xfczeqfx5r6SE1ls75gYeG8Kn3dTo3Q9fQwMPjraU6iYS5R+p9YByV8vsgdc3lCXRstmTix4hqpLSXGQ02IN/w+FEv21emSZknnGRi9gw0sgGph0/DnU2zTkYFVEH7XasYSLO7KB6w0mmMFl1PkH7ggZfDMzwUHXvBe6bbTfjchQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPdMT/cRglR++k3gSQFwFnG/0KysAxJkHL+SgK6IDxM=;
 b=p+buI95Q3OeBn9L/soYA4tulAvp+2HJL7+WgZQPr6bva9XyEuCgYgJuO8DxxHAaoF36AB4726ssNFABOvu2tyq4EwN+JBHzGPv9vYqmjYvZk+raDARt7jSRmpMXSmgcFlhM06m7kamn3OPdFyIa5xAdIo7rmt0Ccj96zVbzESG6sE4GfnHS4aSLdRjRZklIu4WcsuvD9HFYd6Jg3MBwCR9Jt0Lw/1LkZFNdp5nTMAnoJh0Tg4k4CSyV9trsM5b5bpHwYPBmITxQq5eAh7YWql0Q1y9aZfvBisG1ITDuBDTHu5SAsogZkX+NeSzL8/yJxLt0X995dgbnGExqZiqfHBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPdMT/cRglR++k3gSQFwFnG/0KysAxJkHL+SgK6IDxM=;
 b=Jgx5tXPfRlCYmmZ2wHWwbzwjJb/7n4BcbMhJQPqJWm+guLjp3VSb2wOBaO1CBC5v1IZP0A1TcO/ume4R4ZTcinWy8AB4fHHZIII0662gRkFpL42QUgH3UEHXNsT1DpTlLGkwkkIHB22xXsQxJQpDDRS8Aeg3HqRUsL3F1rDd2tMWACQgkF8YRjLXw9CfCm8fskidWIIp2Eg2ofq6BNao6n5mxk+qaDjjUa8+bQMh3CYiYS1NjwJkPeuw92IMzV4RqqvEULLfP7BhhevyXqG6192ddPiYxuOla6DyQwOVK47aWZmGKDCKtaK8ZOqCJ76X6QxpGO+Qgb1EyCnyju/cUw==
Received: from SI1PR02CA0047.apcprd02.prod.outlook.com (2603:1096:4:1f5::15)
 by TY0PR04MB7401.apcprd04.prod.outlook.com (2603:1096:405:16::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 07:05:23 +0000
Received: from SG2PEPF000B66CD.apcprd03.prod.outlook.com
 (2603:1096:4:1f5:cafe::97) by SI1PR02CA0047.outlook.office365.com
 (2603:1096:4:1f5::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Mon, 30 Sep 2024 07:05:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CD.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server id 15.20.8026.11 via Frontend Transport; Mon, 30 Sep 2024
 07:05:22 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v1 6/8] ARM: dts: aspeed: yosemite4: Change the address of Fan IC on fan boards
Date: Mon, 30 Sep 2024 15:04:57 +0800
Message-Id: <20240930070500.3174431-7-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240930070500.3174431-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240930070500.3174431-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CD:EE_|TY0PR04MB7401:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c480fe7c-9867-417d-dec7-08dce11e4104
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?vnkAaeXxDTp80q398VTxHv7CQVElO0w2OfkKul0Dbxx5LtJzU2dVCzqr6F80?=
 =?us-ascii?Q?5QAACNe/XlZmIj8qdYthvAdYHRFtcc7031ykagl+SRVkyuKuX7+Om1L23QYq?=
 =?us-ascii?Q?iv+UvHwh/bgL21pY/4ZGQCWo+Y9eDdbk1v2nWJJwiecOUelc0U7G8AkX7w9+?=
 =?us-ascii?Q?2DdyFUtV8wjrTQ7dpoMsxNSFeBIHHDHHalkLenzp3/sk8TfqJlU2SXBZjVs7?=
 =?us-ascii?Q?mYgbM5hkAajHiC90BCUOTiWNV83I/5g5BPWeck1WqBM8y+mbapY7UmjgQFH4?=
 =?us-ascii?Q?dEqQhYHVFTzveJ9Htxa4AF3L56suVHJqRu+2lzpQ7k7WSzPSBptwm4B/HrR7?=
 =?us-ascii?Q?hCfWKC4G5UTcBQ6c0OXE7FUpRmVhYfjs5a7TWzoWstMln5xyIYpVo5gk0Xlt?=
 =?us-ascii?Q?v/acBn1VOLUZaEXPHUhbCpgn3xZOdjgmFafECz1auOIvmWzdXkJMqVZY//7Z?=
 =?us-ascii?Q?mysVtZnAvceRedCEvYBg347ZFFL3lZQlEbXtkulafjTaDmUAkURNT0a1rHni?=
 =?us-ascii?Q?x9tXRxa9fbHxT7tZ9j4Prwp+tCKrCezKXEcueg67D8d0JkIGVKostMx03lgz?=
 =?us-ascii?Q?6yhDvHeX0rWXacAZ78mAbhDc6DSGWO4rrxvS4AM44jILeM2E+9n4fdYcc61Y?=
 =?us-ascii?Q?4DGHwtHWcmgWrwWk7okrqbGL6N8A3D/9SYqetYAKKxdy/mAMLltKgzZQe2uu?=
 =?us-ascii?Q?GyoPf2HaJehVlho80pgVXBh/iXcYK7dfXeDgnoo8ciYBH9WRM8zFwaiMIuCR?=
 =?us-ascii?Q?akBA2czD1LQWvL9x8YcBw4mJIM7vE5siD4cBEkWouiLPvK04EFKBqTJ6vosy?=
 =?us-ascii?Q?QV3DYajnTUlo4R4zuW2l27Nyf05I65tBypZJuiSUW0U3Zm2q39rObLFGy2qT?=
 =?us-ascii?Q?CvpICaMtFjQHAZBnpJivb4Z0CUjWu5NxigCcHXNqUHVlp/cbO2qm6JGzsNoE?=
 =?us-ascii?Q?n+7K0R/GCRlF/YO4PiNJEGPqhRLUx6nCZvjcUlG4pTWZ1d+UAyVXh94gq+nd?=
 =?us-ascii?Q?FNb/jG7pNw3m3hTTBmZSGQh83wfzwHBZFozrF50iF8fNApHMcWmOb3naTwbH?=
 =?us-ascii?Q?l/1ZYQfyf5+fSB+S6z9LYSpS35pq5V95k/r6qIhdOir/HvamvjTfEbPer80R?=
 =?us-ascii?Q?cCZqgEMIv97upl/b5Wyn2osHwgblk4241GKUTRDC/RBwi0D7RB0iZy/ac5tF?=
 =?us-ascii?Q?Zv7I8oZFNZZOluJ0EvaA8QPzBUYE7X0xt1FF+CcI36uP2aToDbJSnRySTFpd?=
 =?us-ascii?Q?ZJ+S4K29nIRicSU8+Jgd5ZbwE99RRSUnOYOC8sukemWoD/u2qXRh0IXhqheY?=
 =?us-ascii?Q?wZWpze/bWDHxPBOcrdTS88Asn8ISWMMwnDGVYictooFIEMv+pOaAnk7otCkK?=
 =?us-ascii?Q?7nZ+9pQHY1WjA0PIzmEtwqL9x5jd19EPIPin/vByJGCz94MvV0YblN2GQBza?=
 =?us-ascii?Q?orFMx8vTbbFY6jnOZMnQm3stAWFyHQDZ?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 07:05:22.8999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c480fe7c-9867-417d-dec7-08dce11e4104
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CD.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB7401
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Change the address of Fan IC: Max31790 on fan boards according to
schematic.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 01ee455c41b0..6a1dccd23225 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1188,9 +1188,9 @@ gpio@22{
 				#gpio-cells = <2>;
 			};
 
-			pwm@23{
+			pwm@2f{
 				compatible = "maxim,max31790";
-				reg = <0x23>;
+				reg = <0x2f>;
 			};
 
 			adc@33 {
@@ -1236,9 +1236,9 @@ gpio@22{
 				#gpio-cells = <2>;
 			};
 
-			pwm@23{
+			pwm@2f{
 				compatible = "maxim,max31790";
-				reg = <0x23>;
+				reg = <0x2f>;
 			};
 
 			adc@33 {
-- 
2.25.1

