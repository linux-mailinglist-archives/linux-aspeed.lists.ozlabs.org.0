Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0B796EA41
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 08:28:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0RB32KC2z3cB2
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 16:28:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725604089;
	cv=pass; b=RdzThEQe/FYllk/pXhdlkdyHOI27oV5nBVoJ1EWZpFrtt0gGIYKzwn1nrit73h/31BElOM0zZdZMrkx3+6WYTKoI+wfQFdKrg1+Dv9PoxYx/qPPXNaYW3JUQa0nuGrD/gpIFKjxXaXytrViMl+KIgVbnh5rR7+RlJcaxHJ/fZ0hDKnZ35BdXwFJBQTNlO3+YmznsMlgEMl4iLPkaS6bUWT33iOY0MQl/QIHKWeplf9qvT7BTCAjcSWV5Xfr/E/wgTADhHZi+YIMSDeqBRbafkuyMzIbnUnWNQkruPhfE9xFc4u7SXgyx1L6DxCeGcmGx7TnoTydYV7P1LqnqhIhr2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725604089; c=relaxed/relaxed;
	bh=Lo2LnZejiHLnr3GYBrZTsuUBWpB3Ws7w5C5IaBMRr/o=;
	h=ARC-Authentication-Results:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:Content-Type; b=ijZ6brKGKXgkq8Zo9jOnsyfQ9qABUXVbzk8XOMD66n3Y7Z64+1KJpJCjTIsoORAmxub1v3frzL5bIjQ8ThaSTbx6ERQOFQS2uP0PRuHinb2/BR+dvdYwgisQLrVCOJmhzhB3W+PWAMwNM2R8LP1UytLTESP2X5H0xwI3P1QKBb1YLoQnRksnQL2lh+N6yCv5qGacqi/JuaA9XwVelWabWMhwZyiE34pDU2vC9m4DgSijegnsschwTlfXGfkNG1yEZwHe0jrFbuD8dtQlpZmDnSCK+MFt40mMuIH1VshsGVjRr0wof/o7b16OjP2r0At8tC+fIdM0NFdvrxxqPBgFGg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=YR8RGOeI; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c400::2; helo=hk3pr03cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=YR8RGOeI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::2; helo=hk3pr03cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazlp170110002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0RB10NJYz304H
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2024 16:28:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G8gSRZbgy53gW8qMWFSHnSPNQQe7vjOvSjeV/x9I3TUi7VVgnUz1//3VEDk2PiM9g6U77oWADRm3RJvXDtbbTb0vkXlOlitejKSOlIjW4j5rOqD1tzKxMVMafly4hximdfAA96aXf/IYyuodPG3eYP0tZhRYh3lACKdTs+O0QKadGPJGZ1Y5zYF+PPn1e+XouPGVvfy3SeYbv/QtvoAPzapVJCCbPju5DncjDYpYtqLrFLfELWtNxV/cTFkMYfD+JbI3rly+zGLD5hY/fQ7aX7QLxIhW5QZkkfLKeqQCDlHiXa5TgmTyvz14BFJGl+Q3EAZxsTNtieJQrX3OmZGWIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lo2LnZejiHLnr3GYBrZTsuUBWpB3Ws7w5C5IaBMRr/o=;
 b=dPwochVdpj99lmYzSGyPdauVQKArIThxRJ+cwOwJfVcxKhTNh0NxsYM6egz9PB5fFQh9/re5fwhD5OnN/enJLgXkKaeJLB1Tw68BMwXJMacOcR8eBZ861X73Hs166vqNlgaNHP7VKffOj0Rjozm9uBadq4h/mhhhEq2sxDq5MqoMcRpSFg/jnoohTYjRJkz7kKZiye7Bkr08WJPXk12K4RUTa66UUFKL/82oeZOf7iyFJmt0ae3RCMASeF5fSm0Hz9t6P+48PEFQ5xoZUZlfFB796kt8nWQB3ChJWsYA8OrsGkJhIFncAqa0R2wkKybrh/n/VEjjf+aIMr3CLvN5DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lo2LnZejiHLnr3GYBrZTsuUBWpB3Ws7w5C5IaBMRr/o=;
 b=YR8RGOeI9kIuEhpaZHTAmjhczOItLoPmqeZx7Wn5iM9YCOUu0lYIX+OJ7+yjiCT5tpFsJ9j/U3ZjsrgZIkdVn35XMJz043yUlh5F1RlrNGLGh8nIBG8sElTyxcJFiUqfrjq2MfXCMwFdRPriaq+VSgereOLjBNc/S7LTSAzsnRDgTWUq5tCfcnod7NPUmV0TtAs7pYu1URd9UYVd9KPQK+zK5s62j/E0hWN5z5nkOieTGY+25WW4PkWzmHyqxjBFhuY+j7IiYAiDdqMi7jBD9hyDEDoFmkZ0oQeErxfEqtt+MM5J69HAktL3YXmkAq6ITcxdJBL6c4MBpXHwn3iPAw==
Received: from PU1PR01CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::27) by JH0PR04MB8065.apcprd04.prod.outlook.com
 (2603:1096:990:9a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 06:28:03 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::9d) by PU1PR01CA0015.outlook.office365.com
 (2603:1096:803:15::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:28:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:28:02
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v15 14/32] ARM: dts: aspeed: yosemite4: Revise ina233 config for yosemite4 schematic change
Date: Fri,  6 Sep 2024 14:26:40 +0800
Message-Id: <20240906062701.37088-15-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|JH0PR04MB8065:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ab209c88-061e-4e66-d727-08dcce3d0fc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?yWl3dSPMdN8kMoIm4TqFqN3x2H9ImYgPzhJomadVuu6A5gFjTky1ND9QZJ6u?=
 =?us-ascii?Q?GlLy9VG9TJfdXU6MN1kL/8q82C8o/DHc5vWoPAix04HwXF3n5ps8ww4+x44Y?=
 =?us-ascii?Q?FBr0EN2u+cvOln+gHs+w73Qbmf92vmX6DMosbUx66AtQYQLDoMo/4Cno6+NG?=
 =?us-ascii?Q?cjp08AbFEhk77oxxDcz8nU6QoQLL9iFTarMAUwz9P+xt8qGZUmXs4zpGssNH?=
 =?us-ascii?Q?fawYeICzb9uoeg536wN0vtm1hn+/Zan00qLUtD7NeQlpfOQzEVxIUdI/0GfY?=
 =?us-ascii?Q?oXHfdFnvdXS60geZ/jETmNIko9Zp7bJEcOM/ClqGKMthWCzgOnI/mNazr8Ya?=
 =?us-ascii?Q?EVvl6aFDZkPfTJ3oI2BO/ub0l9ZgMmPMhSth1jB8zqvxYrmLLAy0AqiYQ3A4?=
 =?us-ascii?Q?kCB1P+fUhZPDCkJki+VAR+i0xh2wt5LaSQXOgG6I/6p91tp6cW3HKKCzzvw1?=
 =?us-ascii?Q?gL3019VZmYZTPl2YIkCOrOaVyrGXGTMWKKqQ5kFlsU3hoBVWmB0QnNvZ6Twl?=
 =?us-ascii?Q?2T3KJ4GxNlp/NQoY5gOL+LEJKCm+R8LMaJgi/nQjWA1U5fs0/zJXtOgGKqLU?=
 =?us-ascii?Q?phTJnboRkLyXyWxrFyFH3UwIxnm02VZEY4fGOWmZLp0QEYRxt6qrznS78rtr?=
 =?us-ascii?Q?lztTrYqDJbAIQiq/b7urNQai1xRmaeOI3ODvjbCoCtpMgIbK+3c6TQOZpsaZ?=
 =?us-ascii?Q?omezeUG9C5tSfGaehXkK4AkxlWTABu9m0m4q3OPCm1g+cGLg9glQLzYNokFv?=
 =?us-ascii?Q?dWT8/b7lXLa984NpFckWpvK7cTq/aZ0fdh/a7CLeAeNKne5TWu3zI0hhDmW7?=
 =?us-ascii?Q?dWJK/OPWoOVCqe3jvJlZakah17e4i0xZNvZ1sSbbdQVzDzG7FIk3gW+3zDnE?=
 =?us-ascii?Q?GXeI/HYvt4ytwfwpxlveG9y/RBRYWkfEl1/rumUxUWhFhSROFC6o378EosKP?=
 =?us-ascii?Q?Im6VxZQ5yyIfD8NXKd8Kzjg74LrMZEe9lh7UA1I0Y+fd4lSviS7oME+iS5Lw?=
 =?us-ascii?Q?7RqDjsXOaJr0yal3dJ0RBqFcZZXsWy2NpkUXH7hfoYJ0Jlr0FGGWxrJqvk5Q?=
 =?us-ascii?Q?xMaxXU/POd6RHBztQUM7anVSEYRlGcBPcKgg26PRanu7yxhKjECwjteVhIzv?=
 =?us-ascii?Q?FgxSneM4WI7fyUZUTZpDzvtC+jNdAwyVZBw+51yv3aCtcSugiVAAvfOkguzy?=
 =?us-ascii?Q?APw3Ik5Ze+AA8XLLRMjXvwQSgdsRpU1+AcnaAOxM1izmSAphydwfKWU4cChm?=
 =?us-ascii?Q?Eso5yuiSPQnTpDfwpNxRfNI+sZsjcRHpnnuV5443ts8qdPgkPGF38eCjr89b?=
 =?us-ascii?Q?B4aqA4Z3HvWeUh/lw0XM632A4CO6aSp3jVAdyIlyhLGAP/z40lbpdE2wMhIn?=
 =?us-ascii?Q?dja2JvsDXs0OhGGOtTgRxKoCbUK1UccYjigT0QAQrprolIae1UWLsQ5M44yo?=
 =?us-ascii?Q?vXPr5DQuoJwt+NDuocSj7LN2mwySX8Fr?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:28:02.9906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab209c88-061e-4e66-d727-08dcce3d0fc5
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB8065
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-aspeed@lists.ozlabs.org, Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Revise ina233 config for yosemite4 schematic change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 1765a0bb70d7..df389b506b4b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1034,28 +1034,38 @@ adc@37 {
 	};
 
 	power-sensor@40 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x40>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@41 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x41>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@42 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x42>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@43 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x43>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@44 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x44>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	temperature-sensor@4e {
-- 
2.25.1

