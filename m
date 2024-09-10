Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D873B972CA9
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 10:57:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2yJV4bVPz2yhg
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 18:57:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::61c" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725958647;
	cv=pass; b=PoGk1/d47jXfxMbnBhmQ0V6hjkSEt0w/XA66rjlgnudERD37zs5go7Y0FqVUNp5RqagxIsJ6T98ZZWhjYyuKML1TSLxD5r5mIMHayYBVK3uS3Su04y2ezUpYY8RYt6Hyp0v17hxy5o8Mg07AI1V6gHSVYxWEAUYnFaQBz3aYP4o2U0Ruk4BiA+twAeSb0ZtywNB/hgbMd/dMV18Cy+fX7hGs4AOoltphwB02lLrTmQWKku+HWsLGxYQmbMCC5rQAqy4426DcIQDglpU51kUxmnkjwyI6fycr4OW0MHpmik5pTZgbK3f6B0pqf4mnaWYbQl2TmntELoGbGvxGhXMyhA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725958647; c=relaxed/relaxed;
	bh=O0JJTMlcgRLbMd39pklFLnGtDFEGMHywr+9Fv0aXms4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=kH0pOhm8O/FFgWeBuYJZCbi17+cKV3UFihnjOjEsMwaRTbktFzhAw3KO0oS6OfqhJ29p8tQ2xZP0S3d1+y1f9Hn53hZ5lzEWI6Z04jeK3GgKOPfC0/5zSGR44zC4embfdUosZSsv5WsGnY0ZMpdlBc/5ifpeEUtlM90UYgdR1r69no7ZfuGOdGcrTKL1AK2xCV7ec7wdhcGIfwjdDw/+pn/WRGhHvPh784jguQKe8AVI3cD0f02t0j9x3K1wDnpcJIGZpJMM6z7tr274OJONCucLyrvU5pn0vMvdtwm9E1POMPNw86qfYOpdcW9tNS8GeCHyYC3vZd/gikzI7a+4Xw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Lh9fmEMX; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::61c; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Lh9fmEMX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::61c; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2061c.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2yJR4t89z2xks
	for <linux-aspeed@lists.ozlabs.org>; Tue, 10 Sep 2024 18:57:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yrGsAGYHL0F+OUPtSYwHmyHGWDWzUAOHMF6gm+SUAZOZhtUEc/jZSsyEMlVkAfa6nlM7V7I2/+6Fefvw7dSIxFOW2sC2/RrG8Z1LhR4+NK3KhJ+GZuqT7afdmKJ5DRi9u07FAeLwrXM622/ROJ7f/PVTAbAWVBURS4/7udKE1uSHvWeItULVYNYXEaBcSfT3CkhLHpevfviHC9JpmpQVFE+37Q55au3Y9fLVVaOMLZl7gqT93e0G0+m6EzrRhoo+fJIhZB+l9ivUQP+LWw/IN6rOZA/1vNfeaeJWZlDrBacMHHdIygwNF/cy8y5friHtN86dhkze1L3l9+VV4v8oOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0JJTMlcgRLbMd39pklFLnGtDFEGMHywr+9Fv0aXms4=;
 b=QcexKuO9NYomeW6MVySV5XNIhrF7ywGF66iJnMks481yU11G7/eolTI8RVETLLXeWT2zBD94Cw50B27wEcOSGhISKVPfQlPsXbCCrLS1Ac62F0NBKdW27234DSA6G4hudcPWS63Wm7OPXBCsu1I9Sg+Nh8tQmR74i1qfkOoTXL5sqGAtksYkmJlRP0Ux6JwsQ1VX0q1OMG+zCcs0uk7ZwEOwmUjNRbbDF2QHu92VcU0UvGpVByf5RqmpZG8LCWTs3L8q1NJ3A4MXg/PKpf/yCSw2DVGwrAReipf0ie5EXCbgLKFWomlMYGMAmObM+B04Kt+xho+/cxfcAA65zX2rRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0JJTMlcgRLbMd39pklFLnGtDFEGMHywr+9Fv0aXms4=;
 b=Lh9fmEMXxn/TAwDutvHMSO8385tk98i6nFdghwpZP+LUftgONxsjzeGz87VlaPgClnsfjck3fvzh0jWfTwU75/JC1JyMJ8L5h/cmGAtZrKwKWRjcRyvK9CU8/MUc0g6Nl8PGMzymXi9lmFLu72IGaslKlWDvso75Lwu/MT67Vfq+3SRdrjzz59Yxvm9BslohdAkFnG549FIzcIx67aqBkeJOxsQQJ7aWLYEKspTRh5HVonvR27BBaW/1KefymhTAX02SyLXtEZxQeM/AajSVQnnHXx6bEEBhm3nf8ZvTs43yCMZLz+cC7DsPvmzX2zqjYTxzj3geT0pil3eXh6N6/g==
Received: from SI2PR04CA0006.apcprd04.prod.outlook.com (2603:1096:4:197::13)
 by OSQPR04MB7828.apcprd04.prod.outlook.com (2603:1096:604:27f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 08:57:04 +0000
Received: from SG1PEPF000082E4.apcprd02.prod.outlook.com
 (2603:1096:4:197:cafe::9a) by SI2PR04CA0006.outlook.office365.com
 (2603:1096:4:197::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Tue, 10 Sep 2024 08:57:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E4.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server id 15.20.7918.13 via Frontend Transport; Tue, 10 Sep 2024
 08:57:03 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v1] ARM: dts: aspeed: yosemite4: Remove temperature sensors on Medusa Board
Date: Tue, 10 Sep 2024 16:57:00 +0800
Message-Id: <20240910085701.3595248-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E4:EE_|OSQPR04MB7828:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3091dcb7-1e39-4c5f-4051-08dcd1768a80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?ASdKewJzpE8SNECBI5VhayIWrUs/4YWhrRguyf9HO+8bd2qE4V7t6XKGkUXY?=
 =?us-ascii?Q?ub3eUyddYhRXTAkKATyr6ydC3ApD7E7dM3gxNfiD3gWpmjiO/dNHNSqxD0+s?=
 =?us-ascii?Q?YND3yfoH2RMWjWUO11FOoVzcu15RXCz1ITry/iFrNhTAqiM+Fl1ZYufnnZc1?=
 =?us-ascii?Q?C7fj536uihnvfmIh4JkYwzr9XZNeHywt7jcCm2+PDqWugqIM/UGxS2o5GZU2?=
 =?us-ascii?Q?XlO1Ax2ZF0IFrCz9VQU/SVHUvg/WxC3npRi1zH8M/uja1k0/TRMxOW2r7ZY3?=
 =?us-ascii?Q?cCuBQsn+D3c5J7qii8+EgW+pyMGZfnFswrEDdXx0FZFqCyyUu1i4spbnkOIv?=
 =?us-ascii?Q?uODe3zNHPCfCCakQXZDQQCPuwk+cFXsamVZL5ubGA8xQpppeQNgd5u4U/nlk?=
 =?us-ascii?Q?TWYUo/aPiSAt2O644JZHdZi94PyuaVZ641LyM9epucj3L0ePXnlGGumwtxyx?=
 =?us-ascii?Q?U5vWG8ir4NDOOmYEb8RKoj8rcyej0Ni8SC7+UKkL1IKroNHSZJHJI1y9egFS?=
 =?us-ascii?Q?em7xjT8OFseuncbmsgqbyePKTpwN2vz3/UZTzHIQ4Elffr+AcDTRFLS7GHC2?=
 =?us-ascii?Q?qr7dn76pK8KiKkpljHzBQKYMj5OK3E0LXF3XgrBOFTe4/mq675LIs2V/Vd+k?=
 =?us-ascii?Q?nCuzUJotFVYpz5RVrdmD6Tl9gVi4T6MJs2ve5c7p8995/qI9Hi5M29vcbUFs?=
 =?us-ascii?Q?0wT5yGNbx2sezA9oG0JN03LjXqu8WLdv7gWFeVeaPGlTfRfCpInJ13/bWGzy?=
 =?us-ascii?Q?JGeHnrfzN3lAm/Lon3UqDQSv4/rfBZZJf0m2PAWZwE3cBcAiIWmJzb5J/5IZ?=
 =?us-ascii?Q?HLayOVpgVvkHDDEjdAXaGXB9R8u1Fct9G2usEOjexOpgRZoEdprEpp/aeNmj?=
 =?us-ascii?Q?AvTh7KpDVatfosX6HcBC+Gt1bTyTxpmzhcZfSBH549MEGmEjx14Qr8L1bcBz?=
 =?us-ascii?Q?1eJA7XfZppXtO/Hc9PEuG37Y+N8FC7BRvLWCtR1cuFylXgEj5NAAsJJics+n?=
 =?us-ascii?Q?AL+w4jnXoZiRl0ylnYOCaPwfHpFaXVHx19PNht4CM6qU8lhgAZ3lIhoqBz/u?=
 =?us-ascii?Q?F/BzqPvP0iRDWJiUyl9B1AIaWa0DojdO8dQg8pD8O9LH1lPE6fFyXezeosTN?=
 =?us-ascii?Q?SkQjDGUFoguh6IgvF+W2kU4cupCZXf4N4NJTkX1+8pNh229zq24+fAw3/Wa/?=
 =?us-ascii?Q?Np/mbBds1+mgX+IxBf9EKFvzUjW09V+HxlttgIwHdcZh0K5rGodiGaIJTomW?=
 =?us-ascii?Q?5RnMCdvoRTmDOcm1h5NdI9YP/D0txPNemVfm/BfQ0sQpqq+Hxi785CsLRnkf?=
 =?us-ascii?Q?zGq9O2bZKnZHO4hb5OvY0J0MNCr2v9z85aXE3wXBl549YSK7plu7XiklgdsV?=
 =?us-ascii?Q?kQFagr94R7t6btz2Ks3E8AZCdBJ8BcHupbTtiHL1GISQugc188yUv8YmwfoP?=
 =?us-ascii?Q?cgWKFawR5D3W8q5aIWNd1SO3W189Q1Bc?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 08:57:03.2587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3091dcb7-1e39-4c5f-4051-08dcd1768a80
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR04MB7828
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

Remove two temperature sensors on Medusa Board according to hardware
change.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 98477792aa00..986aa707de64 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -331,16 +331,6 @@ temperature-sensor@49 {
 		reg = <0x49>;
 	};
 
-	temperature-sensor@4a {
-		compatible = "ti,tmp75";
-		reg = <0x4a>;
-	};
-
-	temperature-sensor@4b {
-		compatible = "ti,tmp75";
-		reg = <0x4b>;
-	};
-
 	eeprom@54 {
 		compatible = "atmel,24c256";
 		reg = <0x54>;
-- 
2.25.1

