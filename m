Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D521D917BDA
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 11:09:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=PK9voD05;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8G9K2fqpz30WS
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 19:09:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=PK9voD05;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::60f; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2060f.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::60f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8G8v3xtvz30TK
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 19:09:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5uvL/aCu7HT6oqQCgtTI9xK7gqawt/WtIG4yQLs9vrbfXJEU65yU8kW2Phn2EIvp+OmcxkrZ0OsaL8GwHmKE3MeQyuao1wkwDCSoOBJ1fQErnzfFkoms8skGYVQJV9Aa+76kph6QiMuYo4TseQbEGXvyWZ9TKq+eGvpb1d3xtSc1YGkyRM1UX+DMrf2uszoZ7jcS8jNRxTT0qCYUZvpc9Uv0XIvR9EZhh97CNqX60GqEjr2XavLSvrHF4Gu8aVC1P8PBekR7xAqb7kx0C64HdaH6jKRpeTX0QFLCAU6dYD3YIOEQBIP9nTbofUlayo/ZPk0Sj0nhqmmaX9fEPHTFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vQQ3x+PmWObjM/+/9aZu+RrnQuFpeCkTBq+qesncHc=;
 b=mtC72/ozfNLoDYoZMAF4AipsJRAfQ0ilpCxHW1suDwGopQsSe/82rbsWOpQ5K25KeSp4juKSRidnT5qYKnw1JWd9pSxVhBjXtDjazKsarvV904YpxRhMEbaRvVA92M4z3pVZiJqiXDInUsASmT2UfyE9SDDpajUP9kPyk+j6pPq56R60kzS5697nElbvlOQM7tPs9o9UfwjGMEWMN9WGsDanrp1xH83OOaZK5N219oepiD2X3wfvW9k7irP4zzUBksB9Tkjt/97fCABZoTeigqiGaS47A0qfGk0QbomMOT9CzgyJ/OR+jjM09uUa5GZ6sGvU8dvfunVS+PUkHjpItg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vQQ3x+PmWObjM/+/9aZu+RrnQuFpeCkTBq+qesncHc=;
 b=PK9voD05snNKTatqE1q/touHPxVG+IIYC2CWM0rLS6iTW7qq80e61ZuSLqtbzaYiBHEMbtLe6WxGaNETID/W2fziddxvoK3Ym0DrCqFqaCe3kLFOnLDvs7Q2DXVI8quVgViVpA6En9htyLiliyGHIzfRaGfj/B0HOxUC7gneOM9RhQfg44hcu4vhm/nNncr1bDGVQ9+zta0ZLqEOSS5lTt2C4AWi9HAAJORTjfTiowKvpGFS8iZbBULRF2lhZLWPPq6x5df3Q8a+g2zt4icDqZEJKUxwGk/wgOc5973AJWeYIbGeArRp781LCHPVV1VtFDOIyGsrVCeq/3k01iuxdw==
Received: from KL1PR02CA0017.apcprd02.prod.outlook.com (2603:1096:820:c::22)
 by SEYPR04MB7364.apcprd04.prod.outlook.com (2603:1096:101:1b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.24; Wed, 26 Jun
 2024 09:08:45 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:820:c:cafe::8b) by KL1PR02CA0017.outlook.office365.com
 (2603:1096:820:c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.38 via Frontend
 Transport; Wed, 26 Jun 2024 09:08:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7677.15 via Frontend Transport; Wed, 26 Jun 2024 09:08:44
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v9 13/26] ARM: dts: aspeed: yosemite4: Revise adc128d818 adc mode for yosemite4 schematic change
Date: Wed, 26 Jun 2024 17:07:29 +0800
Message-Id: <20240626090744.174351-14-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|SEYPR04MB7364:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0fb5732f-68f1-4852-9237-08dc95bf94b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230038|1800799022|82310400024|36860700011|7416012|376012;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?ZaGEfXUfkDIzMFSZ/09NyFCaUIxCJvP0R/flfzT5UJNruA5pS6hQnA4Vb+OZ?=
 =?us-ascii?Q?E42RcJg39xMby8VcunzE0dSt2G7qwoIxi92v36nSvN7yZA2+rV5WW+G+aZc8?=
 =?us-ascii?Q?NKRkFKeZy4o3BWdyRPUEvCxDVzqE9yeVJgD09tZexKAL0H8Fz5slOEEKqYFA?=
 =?us-ascii?Q?uCK1L7XySMUmQFG4r+E7RzMB5txSF/hCooSKP5VHgaksGz//vM+Z7hczD3WW?=
 =?us-ascii?Q?CHZ1o4CGt/QRNcUfb0DYNaet+4hBze8+LSRPybhEannFiiyXlQiqk8OxD2aQ?=
 =?us-ascii?Q?xvnq3x3+ocZr0/gUak8d5uifTXkMRFeKrT+tCWnt4wCmsgEmwTYFE0Vy0OGD?=
 =?us-ascii?Q?3dT0ykQ9IuifqyBB3/aeiY1NKMR9kwr0rEvMDOmMe78t50HrI+dZHa00fZvr?=
 =?us-ascii?Q?Ko5oeyItOHYd+WhjtJAOEignjydcrb37hcqwmQqud6Tf2oP5r8h1UYPcB5z6?=
 =?us-ascii?Q?YyS0j1RgHXwyN5jHvxXC78Xspec+XEvCYw1eVfScPMPdSxWFcJPicDocgFHC?=
 =?us-ascii?Q?0/rzvKe8shZ/7npbznihGa5JgWu6TQNX2AflViYDBSwoLNQ136P9vumP8DgX?=
 =?us-ascii?Q?U64Kejk1WudzcYaTKQDVLutIINdYEqR05XKlpNyT+MGooXVqVI0jUImNpP7X?=
 =?us-ascii?Q?8k8fRKSMscfr+wH5vmN1/645k4iMbfWCGg1FbkAsQhkkPOKIa+6OkxoUEQGL?=
 =?us-ascii?Q?NyZgtraWo4zsRtg6efqEQFs6xDfxMkRzqG6qigiTzmmX3FEhS7l6BjtFtrKR?=
 =?us-ascii?Q?m6fw7++Zfk/GTPIT6zW2p/ka/mIBoKQjWAMJX/LKllrHKjTHHJpJXpL7sqRs?=
 =?us-ascii?Q?mzdWaC5RU3ZVXFS6zhBCWVbLxNr4wD9yX/Uln5POiLIq+tHchDl8/D3Vib4E?=
 =?us-ascii?Q?gREGExNam5Z2diLmRiJ4/OtX8TrkypGSJEnWLdy8PJVZl+jsVD3jLod4VRSH?=
 =?us-ascii?Q?q0M/ONTxafaLi0UXACbxySTiNHBIWfVFPVGUjhiyqVppXBvoiAmRMgwL+G3s?=
 =?us-ascii?Q?rFTc8EOx62aVCVc239SXmZMGoj+nkhkvCExLxPB462uHeTHbjqwv5XMwfNW7?=
 =?us-ascii?Q?P58O7bLgZcj+ABiVdWl32BFHAn1rZsg7DbkHyesuT2RmgrgzX+363E11XYmf?=
 =?us-ascii?Q?dxqyyYM7JKKzs+k8gWN8q+CBisMPxaZdLL0X2Qz7hWBLXWQ31xGzf7XK4MT7?=
 =?us-ascii?Q?8985U7cwtbOHB6n3xyMKuLedJVMJRSkbHwMNGi+VSqwFv0ZtPTouGzhlcysu?=
 =?us-ascii?Q?V+EZnH6SRFLjVD2Ri3hlEpihGyrPYDOmoijvpUmTLSH91MqjIYMQ9IF1+grq?=
 =?us-ascii?Q?IsJNynHFQO6UMWuP0kLwyabCrYbA1oPMmrIQ+BxhcXv1LuKg27CM8up8Rkre?=
 =?us-ascii?Q?hl9LYvXhvs7Rh9/aFC3/fYnc+7dh9F4GLu45g0Mr7o60xmSpv5q0CoJS8xtv?=
 =?us-ascii?Q?I5w8YOUhabipTd29vNScRsOp1yx4SBUG?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230038)(1800799022)(82310400024)(36860700011)(7416012)(376012);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:08:44.3799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb5732f-68f1-4852-9237-08dc95bf94b5
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7364
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

Revise adc128d818 adc mode for yosemite4 schematic change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 8f3bbdd1bbc5..0c7d85ff4360 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1018,19 +1018,19 @@ &i2c14 {
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

