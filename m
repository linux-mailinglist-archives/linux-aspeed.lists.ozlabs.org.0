Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A277B878E92
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Mar 2024 07:17:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=rHPNkZ8O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tv3Mq37vHz3d26
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Mar 2024 17:17:27 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=rHPNkZ8O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tv3MK1Cffz3dLl
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Mar 2024 17:17:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUeNvSfU2leyDig/9TqrXMXEah2EOg+/NLd7EU0Uf74fleZdRZWdURSLoEFgUg17oojjAgVMVdBPbHAf8Zngy480VzHt3rLW1yf7UUEzBvzPb1R/LvHPSNWyuFF2x4Q12lHBSpoSzoqMmGBN6HvCxGNTe+ASNqATwyt55NQcMWZeS4FJJGe24gJ/yzNvDBRbvwQz1Zhdlq6RvYWhH71YIQHK3KsshpzelnFbsfktNXpL5Q7a57u9+J+qBLzeegOOolVBXL8Mbx6Aj0qmSGRBq6LZHN97tz+eXBhhzEGEulc62KPpH4G3NWCqL+SZvYsBigcp/m7jkCdZ+s/tK9vZmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phXviPZoJ6ps795hGiyy1iR8IfUBkORR79WtFgTj63I=;
 b=DNXCmBAS2w3gU+zWVlCqNULoF00IDyJQEszISwfQOOKnJIrh3YbZO4+s36MG+FLJndsLr6TYkUcupIDzr/v2gO1RVHSZ6uekVvjRZCa4aEsMCbHcSi0H2M+FZljzGyC7g7th00sYsheu4OjByV5zOe/BZQosV8Pb3EQDYfn507sGaIey6LpDsRJykBhN0ifgZLognUP/thOngw/s4c9onmg3g+wG/A1gyNG7OrB9bUPXxDisq/s2pMIbhNFt2FlGpiCA5xslZXP2tqwPwhAl695nzqlGICV2qG2zQvXQByGpUXrs3w+/33pNKIASA2tjbVYFu5Ey6vtPhrUxs0i1BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phXviPZoJ6ps795hGiyy1iR8IfUBkORR79WtFgTj63I=;
 b=rHPNkZ8O7SGhzinkNVrca89qljHFEDWEjGvIsM8sfK8yhuATQODL7TCFACu0I2eoUc+t4sqC01iLT4sYARDKUDc7S49yke6rvkClmvSTPbqv0TY1QfdBhfPu3ftgUkaxT98m0QcqEpCzVplR1P/G0QLtWo1DFrdfyOHI0irIZuZmUsSr5tW6S4zjkuoHSqoV/FWLQnkafpkTT2tqZ71JUotrL1NpEvwcAmUW6MVIAodL+0+6Z7LLBlbTvimId6weihGlxiy8l+4Zdp0bL38avcq5SWtZD7LHE6cbclH763eT7ywNNwdhLPh5gTS+m1qvDcM7/AZigROTxiXIptbQBQ==
Received: from PS1PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::13) by TYSPR04MB8111.apcprd04.prod.outlook.com
 (2603:1096:405:96::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Tue, 12 Mar
 2024 06:16:43 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:300:75:cafe::8f) by PS1PR01CA0001.outlook.office365.com
 (2603:1096:300:75::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36 via Frontend
 Transport; Tue, 12 Mar 2024 06:16:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server id 15.20.7386.12 via Frontend Transport; Tue, 12 Mar 2024 06:16:43
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v6 12/22] ARM: dts: aspeed: yosemite4: Remove temperature sensor for yosemite4 schematic change
Date: Tue, 12 Mar 2024 14:15:44 +0800
Message-Id: <20240312061556.496605-13-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240312061556.496605-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240312061556.496605-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|TYSPR04MB8111:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 419b19ae-7d95-4bc8-e019-08dc425bfcff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	xYbXx1LpXVeeHgdLNulLQ1U92wp9OOw6dZPIipY1KvGcy6Dn+DU4CaBZsuHMhy0LSGWBOUCFOO8jUJf1K9EcykSUUMUkyQdqq9GWU7VowzbXWWUZDTng79HmRnmVCZnDdMObyhfaiP3yopX8OVdRAQkcBQtiQd75rERAsBuhheNRmMvXqYXC1yHk2DbiqKqqOSVQQBYKBlYyBfsKw6UVbOGH96RDuPik9v75S++WJGpxabPO63rXAQ07yqGeKyURReNAG1KVoH0Vo6QiWmJDlHiW0KCKml3w8cb0KF4DVie8SrqoipJVgI+kSZ21oUvE+9ePEVC6zz/x/6lP1Z/6C+3J8OLABbJ3Pmxt6Szsi5+pwJNBkniE8duvoetz3kyTHWdYuVWsS2DfUv7aQ0BCkdaDBpY/uwhqfYE+3RW6QuEVgvldjGlQ4nKhnhr7Y6SWC0CPFz3BjczKEFSDeJCr4H1Ac3LJWAI9Fehf97TZMTTzHR8Zi1Oig2zIk/PJRbM7W+I4Obg21OWBPaT+v5SkpsNEIzjKo/adgHFv8pwte5l0GW2Kz+IGfXgxyNUoEO9dvIfDL+ndDKtC6wkM9IuHdCnPgv6d3DWpJEi6oYxOxhSiG+TLJHvhqFcf5DLArCxvVJTNRo602fRSGXGClcR0EWAtc8GQXkc6xJh8nhz3NFn13efMhpxfnb+SpAualwZUAPKferJfwlXxVAOFKisocN73qgFbsg8ZbpjMq83KtDASJCPDuwfpjFfRtAkeH5Ya
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 06:16:43.1664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 419b19ae-7d95-4bc8-e019-08dc425bfcff
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB8111
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

Remove temperature sensor for yosemite4 schematic change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index f00df378a371..bb4cba8f057e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -921,16 +921,6 @@ temperature-sensor@49 {
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
 		compatible = "atmel,24c128";
 		reg = <0x54>;
-- 
2.25.1

