Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9DE97D300
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Sep 2024 10:50:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X95gv0csdz2yVj
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Sep 2024 18:50:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::630" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726822233;
	cv=pass; b=VLeQkUKgKRKmhoJdPgydWuwVevHkPCI54ULveg4yZu8BFtyf7C5LKquS0NkeeOlW7iEewl74NWjGNOOUC2xffXZqdeQFn9WBbWwefx3cuJjWMoWWV2M+/PKji9WTzn6qR5bw1GkmD+C0vUAU6sdd8E3tw4HDd6SyyiB6Pbc4gYisRyZYhkxl+zVnWUvgeIrGeIfqvrwR/r7VlI5ujfES9iCmm55eP5PX4y8A5/QgadWp8F+vyRleKV52qNXslDSVYnXE6dCmNneDUoJp7OlKWGRaq2D5xr+eM4C8GQPGJ+leLLzd2PFVH7tHLyPZZ9mgfWIZwVyaLuqhcFsmV+Lsyw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726822233; c=relaxed/relaxed;
	bh=mHvP5SNNJU64H3j5CiQuYovnkukIg1pumSF1+dfbN/w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=MLdhZ3mFgRf/G8K6EAEqlby4napig9d25/qrod7/axKoCU85MtcOxFNRUXd6Ov6DD1KjlpYTniKXShUocL0/DmAkf97S+1wB2B5swXNrBZqC5+Mmxfb/Dh2GLq0D5v5t0GpG7K+2zync68Ng3B02gAq309uMq9tvjOAsNl+ZNFTLsxnZT/w6IBH1zSanF2KGJbN0z27fzo7eJ3wShwwjcisu+F2r19Yy6l6fQH/NQZc7IdKxt6FnHaZGfsHtQWual0NjfdtIwmxrui9fXSaJUa1XQNMICyIqPSjCzAs9bQbamefw2lE5zQ+9OfL7k8H3xQ9dmD3ghd56hK+IsPLsqQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=FAX5S2vz; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feae::630; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=FAX5S2vz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::630; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X95gr6G4pz2y8p
	for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Sep 2024 18:50:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=naK1pldSk6qbI0Xg3T7xJC7qaV9OrWbaZpkM4EWBH3gvEmjOuEMzO368VIzjZTwd7fzQlZZtWq3zx87Ae6oebCRdTBuPVrv2f4wMSb5gEZSMILGOGO6zOGTCvuZ3Y11DlxTAeGQty7+CEdkcqbR26Za+D0VEgPT0v5Kkz77dAHml06/aqSxKgHUKiSVSNQldDSxZGXws4nmbqXmK5Id0n9gqXb7kgVMOq6Rc0qGCkLh5pAcqtDoMgfzcvjEWuyVp3yCsrotgqUIljvuYAiMU4f4HQkPOSkxYcrOZdQJB8kGOpSetw0QN0/EdIeNJcOLrqZ3i7LV0bnMyo+Te0rCnJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHvP5SNNJU64H3j5CiQuYovnkukIg1pumSF1+dfbN/w=;
 b=e22/SC1Nmj+JDW/+nt1b3IGQ2+KnKt3NlBRaOss4AlMyRHBjQMyODQEFkwfCKy9pzpfwGkWuPwOyPlrbo/a00YSrJPoAe6wvVrxlykwoW3nAm100rnPW5CLDC5wWrJsD0QvEMPYsHPjt+supetH9jTN4zYukDynbCxiydEHRhWDtmDVTWRIlyZywzVIVvxlAlKJnjmPm0OcgOQqDEgby+4uu2PoB+JBKMURmrKtlgGyJElvEupD47Dvj2d4Fw+iGUlRD+YPUtCtvq0HW2Taba1I/y6lV6SsDMS2qrZk+WyNP4p8S3eNDqCEb4onkHLO//9PZ+nK1AAuocud+0xV6mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHvP5SNNJU64H3j5CiQuYovnkukIg1pumSF1+dfbN/w=;
 b=FAX5S2vztN72tz3A6KdUdyP4wfbveUOWxYSNjNjQoTYUiPtBFjzXNg0PVxxG771gb4+ahQX6HIUnl0g7WrurXJN1vRlgGXwFvkZbSF/fjsmu5xJtNJbu7NM8PsAUutN4Q/So1LII5MnHzHs8IrneBvULcaahzxBpypJ/IxPyd/WzuLcGXsnd4GN9F31J1gL9Crc8JdueGijMmx/xkjoxGB2GSRAlouXeXP6GiGUPScxS2beyzbs2h2PB18kW/6nS3/MtAqsAMkqG4ckVG/im4WQeewsXsgRUdPAKTT/UzRGLeYt1r++LhODBEI3pLFzrOqxyyNyAMIKHo+T2dbmNPA==
Received: from KL1PR01CA0151.apcprd01.prod.exchangelabs.com
 (2603:1096:820:149::7) by TYUPR04MB6692.apcprd04.prod.outlook.com
 (2603:1096:400:355::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Fri, 20 Sep
 2024 08:50:11 +0000
Received: from HK3PEPF0000021C.apcprd03.prod.outlook.com
 (2603:1096:820:149:cafe::a4) by KL1PR01CA0151.outlook.office365.com
 (2603:1096:820:149::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.29 via Frontend
 Transport; Fri, 20 Sep 2024 08:50:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021C.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 20 Sep 2024 08:50:10
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v1] ARM: dts: aspeed: yosemite4: Revise adc128d818 adc mode on Spider Board
Date: Fri, 20 Sep 2024 16:50:07 +0800
Message-Id: <20240920085007.1076174-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021C:EE_|TYUPR04MB6692:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 93d091cb-ec8b-48e8-b024-08dcd9513c75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|82310400026|36860700013|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?sVmX402X/wPF5gx17Ki1O2agvlEcuIhMZsrLPWVCr94CsGseyE2dib/n5dKD?=
 =?us-ascii?Q?GTx99i1+pXxBx93SaV0BIuasiws5XFI7eTGsJtSidWgeuh/rIIsfFIrJRUvl?=
 =?us-ascii?Q?lWAm4JjH+hevkx0mvAV31RgWP6DfPwfU7IBUeE1FjwH1n2pknv4BPqbjzxH7?=
 =?us-ascii?Q?pqJ6tgne3rshwkFgbUGAIzimTt++qnRKhIBj/Ibu1lLb46QaBlIXSpM7/cOY?=
 =?us-ascii?Q?eNBR4B8n6Se9YZe6zqJq1Dkj3O4SAXa1BDFBs59XYppthO0EmH0296NXnnj7?=
 =?us-ascii?Q?BGYdXAMAS3aKcQxKc40knroAKPuNaA0LwDOzPYV6KL1tYPlM4ZGw0xJ20rjH?=
 =?us-ascii?Q?MWpH629sg2/lSFlF9gMp4EdT2Q1K9Jqe8vWFNO6z5FAi6W0Y8gM/FHXmMYr6?=
 =?us-ascii?Q?TssUPmOFQ9dnnibbRdyS7DREllbyasUyMAHTd2HNmCPiRuEc0as9H1SMjvxp?=
 =?us-ascii?Q?bAfYxu2y3ucB82srZFKACCzQ1vo0ZmkJypsH5W0Cc0Pk5LKbXPDka8lXrV71?=
 =?us-ascii?Q?jOeN1i6Gg/wk/zVN7Ji+LWuTchUVmu23LKb5TWMRs6LmF4at8uxD+fzSMO3O?=
 =?us-ascii?Q?Uj2BXnCzS/ibs4Hsdd0QRL5zsVOP9ckX3mFFraSMESuADZ4pv0BKDyC6eRNB?=
 =?us-ascii?Q?eb38RWcR77R7O1uvL8zSCdq+p/iaNRNc6XQoaYGjzu4RrS+7x4/BkgYFeZic?=
 =?us-ascii?Q?DldcZVDOCfDS8GEoZ23WuPbf4cxtH78JyquluUFz6I4LxIm6LN9fCdh87AFS?=
 =?us-ascii?Q?t9Hiy8frLShSoPfH39NtSLszNfZaJhDYCW4Hk4f1ctlje/Ik4+1k2AEZ03QO?=
 =?us-ascii?Q?3M6xFVYhDjZxPxIQvxbVL/EQqncaawdl50ZydMhD8oTw/o6bntZSif6giJsG?=
 =?us-ascii?Q?rQtrT4jGxWb6n+vEUufH4VofC2ecG220e9UQoqWn2YqY8IEaHQstwLeZTmiy?=
 =?us-ascii?Q?m/4pgRj17C4duN+DDDmWJPu38XRbCVStwInaK7rxNdk/GZiPhcDKEj6oJ61R?=
 =?us-ascii?Q?LIMunaIN7dFfbwOc8vj+0D+kHhvRWJQV/38VweQa6sEBaWLbw6is6xbgH04I?=
 =?us-ascii?Q?gzKk5joV+S04gcIbWMERYK5JXN23CrgqZ3B+6i5d3tU868/IMd3Q2JaoBEX8?=
 =?us-ascii?Q?hoqlUU+xCCmtBYwyDrdWYHcvsYd9Z1VRBjfk2uPBfMBFWElYf50u8mbsbV+E?=
 =?us-ascii?Q?zUTuy8sLYh+djFT0VRc5qTsnXqighg724Pp5f5R8eTdLTuB8tUo86pngW9K6?=
 =?us-ascii?Q?NiuB/qJ51H99Ro5eQflZW9l0LbTtSiOYseOjHy1TApywtUqDBM2RPqtcRm/U?=
 =?us-ascii?Q?/QnJl2gZOVsjy9dMwAmAGa9njrzyCWyQ0ftBmuJoikJEBtz3xiZf/MNi1xFu?=
 =?us-ascii?Q?JMZtEudjSWq0hCQJ0lskqXKf/CfEXfK6pt8YHcRD/96xmV12zECxcDhFuXpm?=
 =?us-ascii?Q?14vfODTPAMwXfJKf1iW9NdRhPbSD4LR7?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 08:50:10.6254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d091cb-ec8b-48e8-b024-08dcd9513c75
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021C.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR04MB6692
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

Revise adc128d818 adc mode on Spider Board according to schematic.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 98477792aa00..84b7dca88ce8 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -385,19 +385,19 @@ &i2c14 {
 	adc@1d {
 		compatible = "ti,adc128d818";
 		reg = <0x1d>;
-		ti,mode = /bits/ 8 <2>;
+		ti,mode = /bits/ 8 <1>;
 	};
 
-	adc@35 {
+	adc@36 {
 		compatible = "ti,adc128d818";
-		reg = <0x35>;
-		ti,mode = /bits/ 8 <2>;
+		reg = <0x36>;
+		ti,mode = /bits/ 8 <1>;
 	};
 
 	adc@37 {
 		compatible = "ti,adc128d818";
 		reg = <0x37>;
-		ti,mode = /bits/ 8 <2>;
+		ti,mode = /bits/ 8 <1>;
 	};
 
 	power-sensor@40 {
-- 
2.25.1

