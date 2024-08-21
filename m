Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B551C95973A
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 11:42:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WphFW5mNnz2yMJ
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 19:42:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::628" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=qj28OOiB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::628; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WphFT4S25z2xjh
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2024 19:42:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5o2ouKRwahtEtPgokSNOfUx6isNhcZ8V3gazfcBhGYYHDZUXHbSgtQbaQDLkf7+UbqLWu8Y/Og3u17SwDCTkODFGVLi7Ev68M34f2+9kVHPNVe5oGFf2JuNzWHUvIwDp5g91Dmm/eEDSM5tOxB9uIR/INwpibnru5G6fLKfNVU2Zo1X4S13flbdlecDHR/KTf9GDd5dpX6HbZ2/toLAUPSAnhjmKKLj1WXC0ghI+qpc064X/M43RQYdKTUSetm3Fjy//znt9yJnvn48f5GBcRymwFz7GCUeA53b5xmhlz6gLU5kLbaxEUtxqiSZwmRZWyFKAfbaOD/0hQ/yWIzOiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwPnCRRMIs7FMuQZx/G2KDCYulqMsDb1BS3wTt124H4=;
 b=JITx9TYJYfZhyzd+rriu7j9CAys8qOxhB6LCIYWlvltK9RNE9IJbBejtJyuXedsVEuvxFVBo7+t/DU4ULhzDVR8nP4hkEfZmfUBBUIeS2K1gCq8mF8WMEGUBC0weT9RKc19SVYKI0aUmZiysXTzuJbi7+ys3Q3gT24quy8WFgDIsn9ke9tSUE+mx7cJmA/gkjt5e4blhn0TXwI4xXcHhwczBBqrmAgY7ny+iUa1uyG8zK5j5KnAnaWl48hSUBx4rHAelfC3NMzxPAW9kXz/dN6MJ6jozaOJBlDsmRu/pmmKGKoasiwZHESjOk9Pw+tcVMGhzhj+8okUuZhk3LsGiQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwPnCRRMIs7FMuQZx/G2KDCYulqMsDb1BS3wTt124H4=;
 b=qj28OOiBLc+TJGNPSBPIB04f55gaZqClyizH16dptkb3ftYWHiNa4+/8Q1jHzTdg0C04XjYzeRpolagyNadm7t4jeBq4UOi3HAZ3YncHKeR0/xfCwKmVmda5sXmGXTRZ8/FdzdabPc5k6xIH27/H9ZSNg7Adn58LOcz9SGxFEtkToWMO4D68xgCTXVCKlnLBW8NLcM3V9AsNFRuDgJP7qX0/1T+pdx4QtOVLpFRB/V+xHVf0vbLArYX4thgmv34+stHhdMXOjoJD5sA+fMjxXUF6iT6UmGiy8EkZZLJBS0XM9/ZwAX0z8G+fbMlD7tesXvpDHXx3QNsmRrf3MrIRfw==
Received: from SI2PR02CA0035.apcprd02.prod.outlook.com (2603:1096:4:195::22)
 by JH0PR04MB8351.apcprd04.prod.outlook.com (2603:1096:990:89::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 09:41:58 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:195:cafe::17) by SI2PR02CA0035.outlook.office365.com
 (2603:1096:4:195::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16 via Frontend
 Transport; Wed, 21 Aug 2024 09:41:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024
 09:41:57 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v13 08/29] ARM: dts: aspeed: yosemite4: Remove space for adm1272 compatible
Date: Wed, 21 Aug 2024 17:40:19 +0800
Message-Id: <20240821094043.4126132-9-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|JH0PR04MB8351:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 20ed24e5-76a2-45f8-305e-08dcc1c57ffb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?FJOfieY3sUWW4p4OpTUwXw/HL9JZCHSBQ5WM4GTEjMQqYLKdnQqaqqN/FkJq?=
 =?us-ascii?Q?0718dQI78ke2OKC2VELlOMzkdwfbBxUrj+H/vrysvYbxZFG5sMVUHTJPnLXd?=
 =?us-ascii?Q?aa7GrbfgjhxOOYpDyGLEK76zAHkvfMxULlK90OVBZf6PzuVXWv+stbtP65B/?=
 =?us-ascii?Q?tOpR5F609FrE9677gk6jt7x2u+Pvejs5+8JiIfV6OgbKluQjCNBZnrqC/r1m?=
 =?us-ascii?Q?t5GTWq8CvxjmO9kewI/s9xGtqKWyazIc6XOOMTSLNoTCeVtzlorHNXS7c0vM?=
 =?us-ascii?Q?HIb3H5nGQ6UVUStUghJSCfla5fMR9RPF/9IZrZ2RtYoAyIiMkrop0CfDpWp7?=
 =?us-ascii?Q?S0BC9LjYrA1AAAWkBsR1GikSY3iRe+7t1d1Gk30zuIlfeaMyChF89JDhBUwk?=
 =?us-ascii?Q?DPnDnLvwONRWdvujTvBf5F4lon4jko61ALc44/qUZ3742/uYO8IAJ9b189qU?=
 =?us-ascii?Q?Kv6hmTTF/lQPHXbuw7zEEKPyhzR2OQ5L/h485JrtrVKfkHyDFy277t0wI3Jw?=
 =?us-ascii?Q?LZaKmswXdRT28o5MMvRO67bw3cenPHd7P3mPYlvkAxMi8lpeqAqFZIy7MBaq?=
 =?us-ascii?Q?wQguulqMqDW0Qix6dLFfsR/lxXwQDDMfKeCM0SsqNAsh+spkn/mVyPTjvG40?=
 =?us-ascii?Q?Av/2P43xnHy6jyMtOQs0qlzz8ZMXrZvuSNETD5n5pPRLmsFx/VbwiF4t86YR?=
 =?us-ascii?Q?KopG72mpeIatU0y2UeAqogV1rB61BsGUXDnV1+g6mUToV5ovpGtaQCGNW5Ta?=
 =?us-ascii?Q?YPLCloJCJIkEN6I8AAngJTmoT6jEjyCnXIDl/O35e5J6isnmq8V8lnwIf7Ww?=
 =?us-ascii?Q?tZs1NCWMgDiRZaAO/69iIqlxv8CQGwBG7Pdo5vmbmuQH5TBpwLXW6oPQ0NBY?=
 =?us-ascii?Q?AhCnR4dlONQ/cWpdr7WrzvVe6DgcTUgbK1ZvLC6W6tbjXyyo63LcfVOZeZgZ?=
 =?us-ascii?Q?k6TRvc10g2tQ19/s7TFs7rCjVEfgcAsQnUGyKsd4rog9a15GQ7R0GgADyQ1u?=
 =?us-ascii?Q?dNfMM1uw8UZZtkMqp5JaX7a/wQaPVevHGcrIprLV0azKwd0XzUTO7N+LxDf2?=
 =?us-ascii?Q?ZBZiKdfpLXl96DuukWlRMn83swnaotWoNGxqYsotG9IkHeCwkkW+bTCxyiXP?=
 =?us-ascii?Q?MvvQcRlGoWBzyDcfFrzSek3ZYBafGI9o/y/nWIaapxU7QH/mz690p2eQDVC4?=
 =?us-ascii?Q?5fK52BPJY8NgVxGjhKuc/Wno2P6V5gAC97mqXdiLOk3pehynA5fArylgRv66?=
 =?us-ascii?Q?hdVAau5mWB516rxktLGIpHuX0//Rt7BwgScJlRz4cN1rfNoz8REOa6VvtviI?=
 =?us-ascii?Q?t8b+HwUxPoKT4LE4Xr9uG8kF5Z9odvcByuPN+IBuPdurDP8JGBGJdxDxObWN?=
 =?us-ascii?Q?xb0ar0Tc7LLH8jk5NHfp0pTsQdrWPd/FVFhtynbme4Q8QEuezfBwLmhi2vNU?=
 =?us-ascii?Q?4U5Caqcin2Ke74AiUZIBySNMT/FjL2rj?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:41:57.3247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ed24e5-76a2-45f8-305e-08dcc1c57ffb
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB8351
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

Remove space for adm1272 compatible

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index f4d27f1ffdb8..b11951c2f71e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -821,12 +821,12 @@ imux29: i2c@1 {
 &i2c11 {
 	status = "okay";
 	power-sensor@10 {
-		compatible = "adi, adm1272";
+		compatible = "adi,adm1272";
 		reg = <0x10>;
 	};
 
 	power-sensor@12 {
-		compatible = "adi, adm1272";
+		compatible = "adi,adm1272";
 		reg = <0x12>;
 	};
 
-- 
2.25.1

