Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 97FAC8CCDFE
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 10:11:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=pE2wyH3o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlLML5MZQz799X
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 18:05:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=pE2wyH3o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::628; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlLLn3kkXz78x5
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 May 2024 18:05:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrm1qaDe4nv69AXKOnQesQBv5SF2gfm5dCfHEbaDAEKILAu+RvWkPR8AEZZIaTWlbnJQeJalp4wcSdmXKouATQAzlwXwPz3KNk2Tl/0MhhP0xcupq42F3Rs4gmqa5xmnKWFD1aH8hmzGzKHws+TcDtX+dlFFk6JcAgxwKZCCtNiGWNfb9RG9qKB2wgqDbQuPCuI7Fpm1e+cTk8EveIoDnewmnItV0mUQ635/rZ2m/9ncSSjSuu3F4U6dwt2VQ001orxF4tY+8aKsdVpdeSvn3Q0GnmStNqIiro/z6qlh4e20FvSSuDTa8A1TjLlwldhEVeO70S1AQxVJdmCrTCQ8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajdRlofMdvo42OVOqGXyRTdshC61xKgWuLqNg7HObWU=;
 b=AZCfY/akHf0ndfwkVzNG3eGAsD4QBcXgds0jTMkCyluedOciaAjheD0l18IqeVyaPlMLpnF62yhii/CqLI+Tu1MAE4q0CRfnxp2QyTrgrXwCvTzGJkZ56XnCDN0Ke7gWeCG6/W+FKUqWevkisvsn+J7gby9OI9CDKMf32lEeg4w3qIW9M5PwJbnbq25zTYb45wqxhkAdSws+9Is6eIfTXbkg1jlKtE4U6f9UuGIfwi2gOe1zWqlkJ8N2z/hpGt0tVC2scJ95Rk5/rSj+ck5SqgmiEOnG4TorcZ5k87u9nwkJKd6yCijtyvzD+zmicr0ozc28CxBxQ98y7bzFy83M3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajdRlofMdvo42OVOqGXyRTdshC61xKgWuLqNg7HObWU=;
 b=pE2wyH3olOqNULkSKVv4M4vwY4RIFUFWyFnV6MXNEMi0Ixo/27GwJ6fE5JTpz7cGg7Vcs1UaFQHV5aNeYKQHqEy3IUK+fu3gfPaLuK+rVJRU15L6YOF3qm2+uxTjiFQDOOEgZeIRRhjLYWpgIRUvhoX4L97WzO3crSDrfjrbAyjNAZcnMB75M0dUZchZJD7Z8nzlGya3lz+U2uTYxo59SjaBN1lTVjMY4TzlaiEsYf1cGNLzi4SBcgNbANPJlD0FSHsDvz3c1Q0V/HRrQfs76b4zUIUxx2GfEV6VhK8okQ40CD3S8rEjzMt2PYyQH0i1MFaEpACSFfjpn8U2TFfUAA==
Received: from SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25) by
 SEYPR04MB6482.apcprd04.prod.outlook.com (2603:1096:101:be::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.36; Thu, 23 May 2024 08:04:45 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:0:cafe::89) by SG2PR04CA0163.outlook.office365.com
 (2603:1096:4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22 via Frontend
 Transport; Thu, 23 May 2024 08:04:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024
 08:04:44 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v8 15/23] ARM: dts: aspeed: yosemite4: Remove idle state setting for yosemite4 NIC connection
Date: Thu, 23 May 2024 16:03:20 +0800
Message-Id: <20240523080330.1860074-16-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|SEYPR04MB6482:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0bdb1fc2-e412-4299-6fc4-08dc7aff01f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|376005|7416005|36860700004|82310400017|1800799015;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?Al963LmPrQZPqg27A6NXzQKBbPReIaJpNmpnnOUbQxnDVwogcBSgmZlKTYtg?=
 =?us-ascii?Q?1TUbumznv6M0jNfXUK6KMDDTOF2IPQrz8TTt2E204+t5CQz9eZ0bMM20i0hQ?=
 =?us-ascii?Q?wJ+GKCr8C1DpaZ6THTvr3CH+qG82qkvEqAmGSuefQuz30lpCCJK7iUsjRq+y?=
 =?us-ascii?Q?ISdSepaQdInPBm8myAS0hpSb4q9vGohEdf8ekVtNn5aXT+4uyHmkS0hM8g3P?=
 =?us-ascii?Q?4qwQu8JsLNGIAKaiYnNRQPSrVUfYXVscvwp2nCNN8bTwEv11JWHMJFvdB7Tm?=
 =?us-ascii?Q?FAjVT3/eEqMupqi/4RtxtP+G5sNBRDyEasG0SW/OB47CMC9bgY5hkN91hjlP?=
 =?us-ascii?Q?fcyEhg1BEedADs2Y4kM2dwgJCuIoDAWbrTfdbu0HEWEafotLH8LtRX3KjYIO?=
 =?us-ascii?Q?kjVKBSQllzpcTtdM7OJGwcCTBF0FM5ZbPBs3tRh2Jjz2WcoQl5UBkyC/kGM+?=
 =?us-ascii?Q?Rdl8EQ/mA+BtebIlcS6uZuZNs0rH8bnWA/n5eW4cqQhYTnyZ5AlVX0ZBaSC3?=
 =?us-ascii?Q?Y8oGwZncFeRKNDjN7IxrmZTkAvokENCpL0z45+MZB6Jj2HteAFnPSXwWSuzb?=
 =?us-ascii?Q?/eUEVjVBvBWw8jzIPsgOyi9+g0C9l2PggQNxzUe3n7ATXVezf1BQN9/+eu+5?=
 =?us-ascii?Q?wrQNuxda2SttNwvbboAAw3CU41u+fvn1tyna2tFUcSDSpNeMleX1ytqHChsF?=
 =?us-ascii?Q?N3T04Hx9b/xPuBMEdJd3U1d1dbiRArVYkfOI+Ocfkp+V0AI/0mcpoHBB3WK5?=
 =?us-ascii?Q?4i60yYPUBPRoO6taF1glGHCEfQ3rlGEslMot2XH14o7369/ULBwhwIENr+Va?=
 =?us-ascii?Q?7kR5FBwKdRdja8urezcoLp1fjhYjer+iaJQ9FZDvseC0znhLPfxBV44jeFK4?=
 =?us-ascii?Q?TTuQm0mf/LE6yBuN21dNs9Z/fzHifDg/E/BFJL5fAB3tmCJHMamO+1E+Crmp?=
 =?us-ascii?Q?A3pJ9oV/PL8HDnWQNiuHIY5R+BgTIDKv7oNv9GoS8PDGlWS3vjaM2G4A1QW/?=
 =?us-ascii?Q?Tv8x+rWP/Rw0zq9gkUJ6diJxQQjWsKTnjahHYiKJJzTwr0DfNnsy96cl5qWw?=
 =?us-ascii?Q?Yv/dkVDo0JLuMrshB4ofDuV8vEkE/8JAld1+DHPQIonuchdmik3767tfjy0+?=
 =?us-ascii?Q?wmGd0Hkb67QMhdMnv/NQqp/JlO3h13neFPrAnc1FkfuWwhFXU0UmNvEaJVuv?=
 =?us-ascii?Q?QSnGFFzcWeDT1SWa9DxobXkjLlQEUAYkMiMFjNDB0JcvU2I3I/sa0pXY8e7+?=
 =?us-ascii?Q?6iW5hO0XG09CnWV7/V8ILK12oMEmM+jkq9liSRGuZe/5aYSuEzrRVZowFiY0?=
 =?us-ascii?Q?5nLk10YQ6Ixr5rBo++ovENu1g5Iu0gtCQgN4NjL6xXChhMhpv3vTsrr5zlvN?=
 =?us-ascii?Q?FGPMeElqCA7ssAnUKdumv0vCS+b4?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(376005)(7416005)(36860700004)(82310400017)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 08:04:44.0157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bdb1fc2-e412-4299-6fc4-08dc7aff01f4
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB6482
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

Remove idle state setting for yosemite4 NIC connection

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 67e3c787d675..8b23b012d6f5 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1235,7 +1235,6 @@ mctp@10 {
 
 	i2c-mux@72 {
 		compatible = "nxp,pca9544";
-		i2c-mux-idle-disconnect;
 		reg = <0x72>;
 
 		imux24: i2c@0 {
-- 
2.25.1

