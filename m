Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E10980BF69
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 03:50:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=riNwzrPZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpR80709Lz3bwF
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 13:50:56 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=riNwzrPZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpR7Y4JCjz3bX5
	for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 13:50:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oValf3O14V3jggOioK0XwTAND46e0g8VbINmYPOOU0oVpmvVpheY1MToDEpq5aaKT84OiZT+5ymMXVV79YmSbvc50HkYZMANrFENsyBVE2YI+01HaTch2Gg42MRsMbsFohN1ODmV7UD+R5w5OkPgaQG36QUC7EqNVtWxuqtjFW4GW7fXOxHB//L4M4CODmhTN9vmXwTqe00fZLBJ4p9LnmfCC7Hq6+CZJYRDzqz2t7vGsIBxM1DCVs8TVTVy6DAo5yHAabzA0VxGyfyFDT7SDX6GCD2jEbAhMGqpBGVNNrjxBB7/8NzLORu9GsddLieKEqZGVtNUWuEW7Jhp/tF+Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S68zvDbwuc+EpYmRfn5ns/lT6xUCcZUwkslYayui3bY=;
 b=nynSKj3ah8kJF9pznSOcLRrm72LIzgdhu30SctDoYsFVoYxNkfbNp7YR7epiuCz18P76pv26K2grHytD5IcI3dx1deLJPOpn2ltCzJZ0gBbbu3aqNGsqCKq2zeUmK4H7EUJZrNdMhzmTtABTpwJKk7PDEZgbabwyLNebn7e0F4TJ9hJACClwM9jQ8R/cTqlOTYkPt7B9HXEFOdi+REfaM6W9VBlQDZ+VBfx7wDVhYoUsbNbEwdOG5pxIbAIENT3CqVAdipW2c+g2W1V0yInZ3Nx1oL68U/A60t9xbroRGn5VJQ2UCbR3XipCylPh7V6sT3zy4grI3oiEl5x7w/Fjlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S68zvDbwuc+EpYmRfn5ns/lT6xUCcZUwkslYayui3bY=;
 b=riNwzrPZt8Qs9GT3Va0dJ6zESPd6PUb686SIXqhn6gHxe2OjEUFn+mPfTVZf5qPVJSKRKeXEa7VMR06tX3fE5EdC53M7eWmunRGRhe8QsgMWrD0vXVBCLmdyp50LIvEHeuzmyZWw7j7t0hcpAOR2K4TBcwVO/nZ32MHGzHYAKr/QaK/FjrNtu4p48RO8+AON/G9gWLExBad/gNBhgCOUDXXwPKH4f95GlR9LZ/T3grl9XivmPSU+3W1Kgqvk4WnxzQM33tt3QaFxt24ggzanWze0Rwe8bnxnMJkUIaP3Ui2BUeQj+wPisvUh2e1fYGm4ahySAscrSBmYwiKeI5zAYw==
Received: from SG2PR02CA0047.apcprd02.prod.outlook.com (2603:1096:3:18::35) by
 KL1PR04MB7291.apcprd04.prod.outlook.com (2603:1096:820:101::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.31; Mon, 11 Dec 2023 02:50:14 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:3:18:cafe::b6) by SG2PR02CA0047.outlook.office365.com
 (2603:1096:3:18::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 02:50:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 02:50:14 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v2 06/14] ARM: dts: aspeed: yosemite4: Revise power sensor adm1281 for schematic change
Date: Mon, 11 Dec 2023 10:49:37 +0800
Message-Id: <20231211024947.3990898-7-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211024947.3990898-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211024947.3990898-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|KL1PR04MB7291:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0693a06b-7a0b-4844-12fe-08dbf9f3e6cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	k6IryIArICRIfE+ULmOahR5POsz81cxmXXprtDcmcfk+OnIz7dgdzXonZ88Hper1OSAwqwHUUMFZK9pR9KKVo5E/Q9bgiIHI/U6o8Bi5DzZgEPgJFC23cmSU5gxWyDhA2tdCz/VYymsV5FPNu06D2EH419wPAxothZzLF8umWXnNe58N4AIc18eC5m5+YorFkTwtS6HYNSu+EdLPkUdvsalxlh7ImEi/+htUhaFGdYvwS2DGUo1HH3xmBg7SYKv5s0neBdveHcUCK2Km21rObC1X+0y9/4qWR4yDHHEsbU2gA394GEtv1Hh4uppB3YTD+oGZVgrKG2thXwEOUyGpMMKdMfYeT1xZWgzPgkrUFeAM0pTnyMLYCxuuqzJ8sHVIaGeSryJRdUGEWWP9Fq8Wmtb8SVyQ1JSHFNcISNXc0YYbbRw9n7DBgtGoBZMiNgmL9jW3px5F29PekvXemWCZ6Ly7EpiBELr/5CoY4DzJmr8EudVUNwfvVaEKrcRGqqNHouRXbpZUusxf7zZZFrYMkPoMrsVbvMGvlFNiamuNARZLbw+nTzWmaT36GpPLx+qOtSJt85LDtTZ0IoSTTU/TqJpgnq1cIHwHOezHfDI8LcYDQAop2ikz+be89s9qz0WHK/3Xulx8YZSlGVZrn/Lkwz1JJYjyzsSSYHoDULI/Ffl7o/K1wylEqC/2NZnxfKa4e0A4W1/16f+X/jN/oX3JhQ==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(136003)(39850400004)(346002)(376002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(82310400011)(46966006)(36840700001)(40480700001)(1076003)(6486002)(956004)(336012)(26005)(2616005)(6666004)(47076005)(478600001)(6506007)(6512007)(82740400003)(81166007)(356005)(86362001)(36756003)(41300700001)(9316004)(5660300002)(70586007)(70206006)(2906002)(36860700001)(83380400001)(7416002)(8936002)(8676002)(4326008)(36736006)(110136005)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 02:50:14.0932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0693a06b-7a0b-4844-12fe-08dbf9f3e6cb
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB7291
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

