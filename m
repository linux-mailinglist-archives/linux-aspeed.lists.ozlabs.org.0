Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD8580C0E2
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 06:48:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=lGi3DRAN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpW4v3C1Cz3bsX
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 16:48:31 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=lGi3DRAN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpW4p0n08z30g1
	for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 16:48:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqAl4Lu1R/+DXvg8ZcfbfZMOzc2Ns2tULxXvqnsnduShPJTm17aK/fl46vN1p2MnJttj8BqPHc761AU6GKoEpnJ7lhdm7kHV2ei2jFVp69J2Ru4DCN/1O5y0P2fBc0JtrYBCCADuEXoJ4Fg5Im7i5OCo/jzhwT4iqpESxKuK/yC/FdcSYzytKn+gBSO65uzEiWpEcP5aCqsuW8ZUxWtGJwnmKkSIyPuycgVGaxQwx2UZVBViCHKCzeB3OxraWK7DzZ+3z4Mz8X6ioxvniCP2gT851wTqSfOUjeOrHLTSd0gj4ERwDfXnUziFMp5yu6SX/C3ZrQmzPSxlK4b6BxSIPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S68zvDbwuc+EpYmRfn5ns/lT6xUCcZUwkslYayui3bY=;
 b=FRTaZbJoUZr0tEuyyEIKK+SIMxNgNwnVzd+J9pvjLpLjoslh+mOPlP94LU0lCTG/ek39Xn0VSH+rdKnY9mpV7xC310CCBN899/l566fMlEmKBAU52jvuyVcJZBcsZ20ahPz9gC9CR7+k6WUiRzA/0AzF3kIj9f1wJ3WhIebhGgs1cZGaxEK8jHSMjtk7ZRc6jlLlS/7PBQIy48iuhGLLk3rHWz1MCU9uY4qxeUErb0bwitXrRezZ7FM4p+uK4nPdAB6sSPH9hjTYhj9TY8P+z1nq2BPwmEYGRWsEfiqNgln7t1uxSnZPadmUZJoGl8cnMuIL7i2aw9wGJL317cKr/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S68zvDbwuc+EpYmRfn5ns/lT6xUCcZUwkslYayui3bY=;
 b=lGi3DRAN6XZtdlgFEB9rELjYQSc2mgcXUZv4MUGH53tfGxNCb3f4rZYfOO442RSofOSyA4ZuZGPItqU4RXix/98W08CBNlpxd15ZC8gZ2J4HWwCXNmanBpaHGIK7+shjUKl1neBtC2b64vZTPCIPC2Q5vuBr+tQvchl2hHNVi2obExiLVkICdDSVxd9DMF9stduCTJr1QfSHAIgbt1y8C95r/oA+TtaoHiyixwgKWgTp+uvPWy1+NLpS/zVPV8YZTtj325H/Y6jWKfhe23oSFGEqenvc5PfZEB+7dBcl0kXwusy7AXs9azkASEkqU1n7e/k5VuvG5BwFz3wOkVxoQQ==
Received: from SG2PR02CA0062.apcprd02.prod.outlook.com (2603:1096:4:54::26) by
 SEZPR04MB7531.apcprd04.prod.outlook.com (2603:1096:101:1f4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 05:48:02 +0000
Received: from HK2PEPF00006FAF.apcprd02.prod.outlook.com
 (2603:1096:4:54:cafe::c4) by SG2PR02CA0062.outlook.office365.com
 (2603:1096:4:54::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 05:48:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FAF.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023 05:48:02
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v3 06/14] ARM: dts: aspeed: yosemite4: Revise power sensor adm1281 for schematic change
Date: Mon, 11 Dec 2023 13:47:21 +0800
Message-Id: <20231211054730.208588-7-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211054730.208588-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211054730.208588-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FAF:EE_|SEZPR04MB7531:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e6637422-76e9-4674-eebb-08dbfa0cbd2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Wp4ovXjEsHzRSGcSKYcIji4pbb2Es0OXYZhmaDB4sqARKGPzDnqkzNlISGu0itg/KRV2XDrsRoa24b6bIm1PB7wKY6NjwsWG6ShNl8vq6GXIFjSXLGJjKoQb46kXEqD6q6sJSxtWlPVKsyLn3ZonGJrXvrDm99fYhE7rq1H1OyoQsqn+PPPnD1bKUx5d7fHJKQ6Fk31tkm52PKMJLuHJdEuiHiu7r17wClDkDtdYdhSukJpfiJbZpGOcRm5441rFDL8SWn04dBiymPxgZEY2Lf3dsw0BKO5KhaC7zaF3VJO8eh75sM9dF4B8EJCSEKzqZHNjZ9zlxHZOgkklSDO0Pl29JjazQPnRuT1LMUBuic9DHcAcIdGCU+fwUeB2r8aRTg49QutOlc4AqspwygpfVGKIkWl7/cwnkEpte8VHdDpKtigMd0Zpodyk1Vk6NGeXRoOBDSD4JCJ0ZrqPkoVrDOT2JWVbiEISdOyFsah1ZmHTJqrf92fWryZmOY6SvQ65kDeDvLvKNNQdQ3tXLi/u1OMuGV92ibNd08Uxpyt87i0DSmsMMyuSgfm9JfzicPROcJ80rkOXXYATSD7XMAnhLXZEs5wfgYhmnGDeN3v7dD2nsXCVe2kinvyDteUHZVyVV+kGXgBJdjx8XS20KiMoNNMyY0F8LJUCJn6uWpRmPkOIFca/wgI4hXWgI1JRfcrVxm9Y87SCTStK3NT9IizmyQ==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(346002)(39850400004)(376002)(136003)(396003)(230922051799003)(186009)(64100799003)(1800799012)(82310400011)(451199024)(46966006)(36840700001)(1076003)(26005)(956004)(2616005)(336012)(6506007)(6666004)(6512007)(36860700001)(83380400001)(47076005)(5660300002)(7416002)(41300700001)(2906002)(4326008)(478600001)(9316004)(6486002)(8676002)(8936002)(70206006)(70586007)(110136005)(316002)(36736006)(82740400003)(81166007)(86362001)(356005)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 05:48:02.1259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6637422-76e9-4674-eebb-08dbfa0cbd2c
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FAF.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7531
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

Revise power sensor adm1281 for yosemite4 schematic change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 7fe80ad271aa..7f0134fcee57 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -176,8 +176,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -193,8 +194,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -210,8 +212,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -227,8 +230,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -244,8 +248,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -261,8 +266,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -278,8 +284,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -295,8 +302,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
-- 
2.25.1

