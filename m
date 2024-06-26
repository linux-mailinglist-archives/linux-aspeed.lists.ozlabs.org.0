Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A09DF917BD3
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 11:09:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=oGNEDfMp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8G8t0d6bz3cCt
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 19:09:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=oGNEDfMp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::620; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20620.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8G8c6TTkz3cSX
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 19:08:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kuU85h6MYZVrSb9cQR/LqExo8AC9NNrze03QDJb0gD/ac6NrC36LuvaJ+hSr8PfxTamJYHsqQRvckletF3KwxautFzZ4fmg00TXX69PlgvyyArPEUBRQtZzTmafEzdnE5pGjm5fqQcPCFbYplmFTZoEBYDvJE6RqHMTvwYLs4sd/idTHlEfE8pXGbM3r0EpFPw3Pok8drLS6q+xEQis6gZOvK5AOMX5DKgoCh3gM/JEabKqPY6fVbfKv2wiOh+2y2meEnXE+kRe6lv4HZbw8bbF/PoADtph2umD9+KT59+G+fS0xhHRWe3wxkPdlQP4uMdAQc7tcdALQZNfL+PlxQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HypuHXBWroWYlUbZ7+/af+Usbe6kheKPtiyQQytzoQE=;
 b=VEFgGWgWddHJKnXdDHrn2ZdUyX14xElARM9rpj/JhobYBnHIYcIKVcCcIXQBVZTwAb/wctS/A+trEaRMhvkVjqHN4++hwLxSTsFK14iY4r4W/i9lIUyslmCySYwOaV//mwNgA3h/2PvRzyA+lhwSIc1Tw0q53Vnvo2mkIA/PBzPE7bXTzxmfHyOUXhfK4hUmAS3lmVt0lj2zfl2r73ZoO8AJZqcEQrC80K34o/98TyS6CpsOX5YdaFq2pHuTODeYd/2mk+72MQOH7yf2uGTAdR3HTRoRItR9S6uG3JWGwexhpL8RTEOypG9xOv56fXXVhGmEFwj06t/cECrs8SwkpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HypuHXBWroWYlUbZ7+/af+Usbe6kheKPtiyQQytzoQE=;
 b=oGNEDfMpsxJMgZqDgn5CQPh9fngqLbf/c6643kA3pAb1JelNKL3ZdLxVv490LFvgPbZvSYKJ+5/np+yHEFAC/EztDmJUWgniWqmQEfMSJSUYbPrc4Wj/WtZG9jJK4llsKTdtDkNDTlQKh/NFpR2T+0+WxF7yiQzk1jvLWbPZkyZSU0qbV0tVmgv+qaP4MWdCBcO9fq//wRxw/xZz4n4NU3KxtPDX11eowPU8jC5r9BgpZvBDqCZqCHvq+Mh6KM+czwA/K4la8plySpBbk2dnmhedTDTsHwIYtFvn1N+5NkqQCI73sqkwOGmXHlCmmFTXIDmtvwfq68eD9ZIJlygWVA==
Received: from KL1PR02CA0002.apcprd02.prod.outlook.com (2603:1096:820:c::7) by
 SEYPR04MB6505.apcprd04.prod.outlook.com (2603:1096:101:be::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.29; Wed, 26 Jun 2024 09:08:28 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:820:c:cafe::37) by KL1PR02CA0002.outlook.office365.com
 (2603:1096:820:c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.38 via Frontend
 Transport; Wed, 26 Jun 2024 09:08:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7677.15 via Frontend Transport; Wed, 26 Jun 2024 09:08:28
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v9 08/26] ARM: dts: aspeed: yosemite4: Remove space for adm1272 compatible
Date: Wed, 26 Jun 2024 17:07:24 +0800
Message-Id: <20240626090744.174351-9-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|SEYPR04MB6505:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 255357e1-8018-4c03-b2bb-08dc95bf8af7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230038|1800799022|82310400024|36860700011|7416012|376012;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?AYZja8d85ObeszaO/qhUjErlcvD30C8NVHtMkLNxOGX+v00NP7Wkz26YJtwx?=
 =?us-ascii?Q?S8SIBneCAPgwTyLxO981V0fq+VB72kNc9nnVAQAU8OwwrhJMVQa0kMxtKRBj?=
 =?us-ascii?Q?nC5Ux2SGnzLk1j/T3uDCDj2gfU+7eQo2HX211kOazrNnqPBFf4nC/SdYhMG2?=
 =?us-ascii?Q?9D16vUsJwIOTfptQ8RpyzI9nWgpFCOJneOEJYhzCXb8LB1E6/tPVNRuWS0sX?=
 =?us-ascii?Q?PUS7JrjfIfd3qj+rhhLE5gj85iho8JX8mEqxNPULFTzPimn+DRo1GebFCeMV?=
 =?us-ascii?Q?omKVgKP+HqM0wAswHaVg7e7i6InI33lJq4E1vR1TtrqRl4x2bIQ9+/bvR7+d?=
 =?us-ascii?Q?6UJ9wdYw7lI/wTgrRAf/zqkGVAIM+JXbY7A52jlr5eftO32dBMaaY775tozR?=
 =?us-ascii?Q?BdWgxVkO8XUDcYaab170e8sqQ/bZYs9R/pY9XXxAxHWX55eGaQRxcmSnS8fO?=
 =?us-ascii?Q?H4HiOBe5CPxxQhxFXhgefDZ/1UqgwEzqRolyqBbLSVb79S1GixIRuip0/eUl?=
 =?us-ascii?Q?GzA2iV1JFmQlIvQkW6yT1eszGITP8FnOk26cZ97GgU5LvRhRTBtx6fYPIDJp?=
 =?us-ascii?Q?GVjrA4NsfAqwcaCFvpoVT/dNZa8DGk18Qdv+Y/0bBccwoP1bzX+sg3RdUqJ0?=
 =?us-ascii?Q?FHq1idt3RKoWnOPlYvnZkrOS8Qwbc2E1EL8yJXpX3cDgV21oNLSopJGbYseg?=
 =?us-ascii?Q?vtkOInD5nZsTrr92eYkDbLvpRTZK7WD24MiTOemMxe/X6DJx+qzTEu1XWAVE?=
 =?us-ascii?Q?JMxl3UjvS9PItHMHylSKkyfZcLELPHyCQ14H+b1Vm4MGqdAZk9VczAjoiBeF?=
 =?us-ascii?Q?6Z9AZXLW+dTthPFDtiwWyHEsXe/KY/B1fSjISefOPUPz0XtmHI9YcRIIMSWP?=
 =?us-ascii?Q?WQGJsovR1MEdXpqsquqQhdfnR22wzw1eprXBGF6fzL3vCPCosFWIrkLKF2x4?=
 =?us-ascii?Q?3Wk69zzQY4ztkd7Kh90Yi/ASf+KQJt1+ehnpdAzeBIkpcrtcRY8rpk/60yHf?=
 =?us-ascii?Q?AyKcpVugmG4xocRD6o3f5fFNMSjT+umWEd4zPIXRwtKgo665zEKt6nQoNQw/?=
 =?us-ascii?Q?yEdpEZJg51zCqmZSg43ncAalNE8i8w0bJyvI+o8lS48bM4Ld0Rg0qDT19T6A?=
 =?us-ascii?Q?+ZzyL8vcsVFOOt9JeBcsA4rBLDJhiJsrkeRLaCBuzKFyNcIF7JXoDOaeD2ZF?=
 =?us-ascii?Q?JvNyUr5T7FbJnamaPEiUZSORYRh2u3qusMf/7q8cVA8Ayi4anEi+0JYIdsYo?=
 =?us-ascii?Q?RC0taL9LKIa3nggQMuPtDjmvGk7cz6k2hApgrutWqrX/hRVwhI0q5eNojxUi?=
 =?us-ascii?Q?+gyaBbj8meVskzJzEKq9H+mZB8ENJgy3qiUTbM4IOkC7AIiV35YqzvfQ/1aj?=
 =?us-ascii?Q?EuetxcUGTsRca3S6MEzZKUB2wyGChrQxd0+lHdio5Ev0547n9pOvfh77cxh2?=
 =?us-ascii?Q?FNtrjjd62QZZmMRGj1j7azQpt/KX0Au+?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230038)(1800799022)(82310400024)(36860700011)(7416012)(376012);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:08:28.0361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 255357e1-8018-4c03-b2bb-08dc95bf8af7
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB6505
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
index 33dcb2451ae3..ee11b3b8e81f 100644
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

