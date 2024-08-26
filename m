Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FDA95E8A8
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 08:27:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsgh302l6z3bTH
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 16:27:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::606" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724653633;
	cv=pass; b=MAcn1mEK6kfS6gzp5AV5RFCMzKUkrhI0NTEUlA/KBdTsVznx6sx+HYpwFH9QiaKPWvMtfnfs4Oc8ZiaUBDDHttApaQttQt5nLPM15VBlnbOKmA/25Yftf5QY5yy0GIwx1VVAbXCH/OB8RcElxSaEfAlkso1XRa91Zbopd1Pz17SDPQJSCa+M0yiuBt8hpbajh01rVCJKwUE99VocZv89v9Se+gIdygLknVLepQXveKrk3TxGTsYjAwWBhxWX9CeulauEapQ4uPk9Mgk5OmLZt8gdClzR6uK0leU3PH+ERYbUKQsrD7NRAcRQrB2DjLz6mZLLIFav9MH/8ZwU4mmPGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724653633; c=relaxed/relaxed;
	bh=PjaARKguKay68g4+E5ltB5cy1A5x8bWHGkhbabGTogc=;
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
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=tjyAj8/v; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::606; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=tjyAj8/v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::606; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20606.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsgh12gpvz2y7M
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2024 16:27:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0UbISd4GGV9bNsDjsGqO4oFwIknXA80IaF4qH0JDiDDiKZX8u8FRfis9zVFN/45yLLDC2q3ZyNsbYnKHHf3D9LS3Fw1stOdK778Nrbn9EmYTWU2fdDmuaRTF6FmVlkviHOdLtZO5kJDzQ6uS06wBFLVl30tJSa4PcMl2umSZBDELXJicMvHF2w24v/NrteJtNHg1khv2XNaWcXIozd6guRumRRCj/6nW+lg1j3Sv+wFi96xQ2zal4kaWgyghIEeyZcQVKt+r+iZEPUDFvxBPKHJP049q8uG/FZUOEbTCBb+j8HmPPvF0IQMTEMpSgWD4CKEjZGsq83WLHSLWVIb2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjaARKguKay68g4+E5ltB5cy1A5x8bWHGkhbabGTogc=;
 b=FR/C0c13D8vgcS073nfKtN9zH7hMU/DUJtBK7miiM0sIwBmRQl9Umfl+EfOgIvY1AdtCqfs/KG3Og4Rqz+XRq/1m3HZeIMTpttoMnYxcREEIZrLmmGsw1aKjpl4jCqHajQh7xxT2YPueX+5MyDXTjHxEAzfsgBLZnl1nmiG8XOoKiW7tbqL6itG2QW7QwBiG+gWcygRt09eb049qeh3ZXKGnMC7n85Z1EhH2DqgQCNLuzdglAotRBKlfHJEUhoeA3aPYXAumkFydG1kUliyLgm+xR9KnzH1E6bWhzoMZwxAFzihdnwem3M9ZdkD6t/+d/jM+ND9KsLnfLJhXmurjbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjaARKguKay68g4+E5ltB5cy1A5x8bWHGkhbabGTogc=;
 b=tjyAj8/vs3LS/0XBGG4NRHw7OrRBBwySSrpl0/bnk7/YtuAyv71ZDqnPtIjk4XJ5aekSFft6rGS6Krwl/GDeER4uLPg9gWBHuCQyfyT+Jv0uFq5sdhlhe2d0bjGfUyFlL/6kGEsRV2zfk+uct9gpjqL+Ixw2t77Q1h2KxgVZ6dnPsWLwhkoISF3zKisZU5ea6StBu/oBRGVVfQ/Xaao9dE4CK1/eciuT+y9AFTbAJ4B7W3LW8wr1tbopoWPstSur8YP1zgEAgtYMfadi2dpBuM0UoUIeIv1LAdwn0JyKWzBKN66zfTmjXFx/G1Tp0iLcGFY83OnCUBRDQ5sAEUPGOg==
Received: from PS1PR03CA0016.apcprd03.prod.outlook.com (2603:1096:803:3d::28)
 by PUZPR04MB6975.apcprd04.prod.outlook.com (2603:1096:301:111::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 06:26:51 +0000
Received: from HK2PEPF00006FB0.apcprd02.prod.outlook.com
 (2603:1096:803:3d:cafe::74) by PS1PR03CA0016.outlook.office365.com
 (2603:1096:803:3d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14 via Frontend
 Transport; Mon, 26 Aug 2024 06:26:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB0.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 06:26:51
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v14 30/31] ARM: dts: aspeed: yosemite4: add SQ52205 support
Date: Mon, 26 Aug 2024 14:24:04 +0800
Message-Id: <20240826062408.2885174-31-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB0:EE_|PUZPR04MB6975:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cd283e1c-e9f3-483c-4dcd-08dcc5981260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?V2VM5vw8HwFiDZyOKC+1lesPo/YxhvZdtyEVvf0CcowelhVNRR6a/EzX2mKP?=
 =?us-ascii?Q?mCuPPWgf9guJnoKjj+JMYHoGvP6d4KFaLzcteuUAIjZhikXS921wYnvjAfx8?=
 =?us-ascii?Q?bLrGUtzQtzVoC9hVvbJZ4IZ4M42OWVyftMGTfP5lMIA10n3Qu7cmIr6+oR9J?=
 =?us-ascii?Q?YXLt6X4HfM04J2IJCA0PnQlq9Srbb9M2Ux5kd5NO1hPmiHVMM5lZ5xTFjkNu?=
 =?us-ascii?Q?QcUi87iUZLJHPU7KNTXVumCca+mc+qhXX13ml19RgT20/1mm2Ar8ZLCbxm8f?=
 =?us-ascii?Q?gAo7krLmk6ZySZ6QNaKS3yKqvp1LKz2p3VK4RV6H6rnFyj6fbj2dpte0MGwE?=
 =?us-ascii?Q?exeyx3Ct9Tyg+QiRyE9Q6XdiFMdUROzKvhnBi0WjXj4MR1dCcHQt3bWqrKKt?=
 =?us-ascii?Q?XcwOTp+pLNLv5ZGlUpBYVSEzyJUhCGVJnlQ9YzdmNbubwtFrLH/5VfzGMFa+?=
 =?us-ascii?Q?RZ3amZk8odv85jKeoFLOWlG0Yei9EO8sM9QELWNP4G9iTXrv6EkOA5gBtvCo?=
 =?us-ascii?Q?8dFGdVD8o0g1vtXl6Ta3vuR1WIA3xvXK156VB2tMLCTy1/l0qYh6KANVjtxU?=
 =?us-ascii?Q?Qay9gL+hhfg+g9OoSYB9kWs6U1nDpL+4QQvHdQim6vK9js7ywLuCb9V/YsQd?=
 =?us-ascii?Q?d12kQOoYCOmj22F8FjK0H/30WOPjHLOhMY48tbEU9GflNH2Mplrv5pxAGryQ?=
 =?us-ascii?Q?o9XYe6H22l5LRWLRJhnQlgamXOzdbAoVu584+nvEGaHMNopCt5ISPMM3dxRE?=
 =?us-ascii?Q?/cMYpOCGO7Qmw0ObumOnnfWkM/4hig7sAFQilydsChBtVGglhh8NO6os6hbX?=
 =?us-ascii?Q?Kg7mhPARxKQu/hUZj3bH/gwMy0HNZCMbCazVTHvzYIQe6unPn7LNwLHKLhDe?=
 =?us-ascii?Q?QuVBZ15cHze1HPACTQlBU9k/mE6dFEI9q1ek8wazGEjBll66caecM9GjdCGp?=
 =?us-ascii?Q?e8fmEl2taa+DnTCYO1Ijfsn+//IPp5+l1V4RC2v7mknAEphU7+xhyoKJSr8e?=
 =?us-ascii?Q?MbcmoTF1Pyg3gjUh13SghHs+mPPchZBfH+l2JkNUIZBnMb88mRcKw3T60tb5?=
 =?us-ascii?Q?JZ5+pn6F/aNSq6uE343OT64edfaPypyuQK9V+sm+TeEx3GEh/eR0mTTEU8/1?=
 =?us-ascii?Q?vRtYUS1WgCjKsEreL3oOLq8KzmS1dob2O+CbXBVG44LUfG3jJxTIz4wS6RVR?=
 =?us-ascii?Q?WlWkAm47lt0KgzYxvQpbfXWbxbuY9TykEdU5hgyfKANN9601051wshcLTGeK?=
 =?us-ascii?Q?EpSELIcbenRBrM+xOvbls+Ba5rn52xUhYfDJ29yFscKXd1JZxVnOEYRJh7I7?=
 =?us-ascii?Q?yJP1y51P4yZ5DD87nEFZQe2AEubi94Wti+Z9dXlWX9IxWw7kt++dGqbAtl/L?=
 =?us-ascii?Q?J6DLBZb9VuUzsFwga7bC81/hvX6t4If2ptwir6JYclfBHB5ujznAZgQIr55Z?=
 =?us-ascii?Q?CQBhRJAcoPJ/SN9lT9JBvNhXD4VmgM3e?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 06:26:51.1270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd283e1c-e9f3-483c-4dcd-08dcc5981260
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB0.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6975
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

Add SQ52205 in yosemite4 DTS.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index d056f6d5ff6e..04aa428f94b7 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1245,35 +1245,35 @@ adc@37 {
 	};
 
 	power-sensor@40 {
-		compatible = "ti,ina233", "richtek,rtq6056";
+		compatible = "ti,ina233", "richtek,rtq6056", "silergy,sq52205";
 		reg = <0x40>;
 		resistor-calibration = /bits/ 16 <0x0400>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@41 {
-		compatible = "ti,ina233", "richtek,rtq6056";
+		compatible = "ti,ina233", "richtek,rtq6056", "silergy,sq52205";
 		reg = <0x41>;
 		resistor-calibration = /bits/ 16 <0x0400>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@42 {
-		compatible = "ti,ina233", "richtek,rtq6056";
+		compatible = "ti,ina233", "richtek,rtq6056", "silergy,sq52205";
 		reg = <0x42>;
 		resistor-calibration = /bits/ 16 <0x0400>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@43 {
-		compatible = "ti,ina233", "richtek,rtq6056";
+		compatible = "ti,ina233", "richtek,rtq6056", "silergy,sq52205";
 		reg = <0x43>;
 		resistor-calibration = /bits/ 16 <0x0400>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@44 {
-		compatible = "ti,ina233", "richtek,rtq6056";
+		compatible = "ti,ina233", "richtek,rtq6056", "silergy,sq52205";
 		reg = <0x44>;
 		resistor-calibration = /bits/ 16 <0x0400>;
 		current-lsb= /bits/ 16 <0x0001>;
-- 
2.25.1

