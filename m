Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3871184395B
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 09:43:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=RWGV4FSj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPwXs0yDsz3bw9
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 19:43:09 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=RWGV4FSj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::620; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20620.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPwXJ6TBLz3c40
	for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Jan 2024 19:42:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZofAvuCg7b+BTypM3Mt44/wHRmzBhVFPiHSPk/dv+k7oCc5zR2XtIWCkhD1i9RZvPgMY/dN1ic8+Y7CLUNrr6IoVvZlTeliaApjgBB0PGnI+/CdIS/lWRkIeDQz1Na7Ntol8C2FeCHPHCjJccHuZP3n8M96zrAKA0o7P0VnXJaJeWRZMLGeKpv0lgv0spju23QALHinthEddPgMWO3cMKOYkbukp1TIdwx9JXvb3vh4NmY848GlUv0UCs+IQ+zn1k/aoLeT2kWi3GOsXBOLl7lxzoeMRNbMz8t1pnGWDi2XFyO5R54FNh7QVjRgzLttjvQaufsubtk2q3Rt1OaD+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0G/0w18p91abLzXYuBsYuPzEWdrZURAnJ260VnL/nkc=;
 b=mH3YcRTWTmw/vNo75MUhJFp+gQCf2fTqtrJf1TLajLsa4ryg754YGwk8yRqn15YeaCDjpNCiDRbbs9be56ifVjhmlgbMLdayiUVu+ek9r7o5d5hYzU2IKuCy64Cz2bvmCf46fEGZNrI3c1SqoqbB/hRyurlr+ruD9n/y5ntA2xfcLxTv1Xibtv+Qv5j+915KBMLbhIVlLMKTqwW6wSGAsiaJtCgIS1hMAZQ1UAWdPcfS99x+hwXNP4Gv66WJo9Az7mS5YRagq7IBrEnhex9wIMjCarmxyHWzNKvPXfco1GokU5aVbozdmnlhSieHwP2fJ8E9t7ax3XudBoEYCnOIsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0G/0w18p91abLzXYuBsYuPzEWdrZURAnJ260VnL/nkc=;
 b=RWGV4FSjsApb7ZvWmlxL6Wy6AYT6AJQ7k78wWRaBb7E1qDvsnxbCcJfgFLT3HCCX+P3wagSbtSBexq0VZaqDLJw878o9pwF8cqWONzM7VBdek70ah9g+RSPOjFw5PGpCinKdDQKc/y+07d8EIVZj7R8ZsxNDSmduwz6xK7cQUyXNVTX6Ffm4ECENsQCHQOi3vxM0uH0bLfOe5cEpM9TJ9lf/bUecpIBlrXHjlhVQORxqm3/2rcXQ9FaTjXD5ozqdIxd8PIhRY26+wVdKtaQyPVbk4/8nkEMprrVTtYNufPjT4z7t4noo5Re72y6flhTPELk6KxLFYYt6i8YdMT70Aw==
Received: from SG2P153CA0036.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::23) by
 TYZPR04MB7886.apcprd04.prod.outlook.com (2603:1096:405:b4::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.31; Wed, 31 Jan 2024 08:42:36 +0000
Received: from HK2PEPF00006FB2.apcprd02.prod.outlook.com
 (2603:1096:4:c7:cafe::d0) by SG2P153CA0036.outlook.office365.com
 (2603:1096:4:c7::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.9 via Frontend
 Transport; Wed, 31 Jan 2024 08:42:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB2.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server id 15.20.7228.16 via Frontend Transport; Wed, 31 Jan 2024 08:42:35
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v5 14/21] ARM: dts: aspeed: yosemite4: Revise ina233 config for yosemite4 schematic change
Date: Wed, 31 Jan 2024 16:41:25 +0800
Message-Id: <20240131084134.328307-15-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131084134.328307-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240131084134.328307-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB2:EE_|TYZPR04MB7886:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 67c9fd02-144c-4cb3-f5c7-08dc22389358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	1fLf9o0RYHVjcw10Nwa63AUJfoYrHeThuG22qzm4QB7k0XxDHehmjb3w0NPsycIR47wyiYTCCLJL6Nv0kXdDgB/siECw2RQO/PQMza+cdfX6UiyDjbcnFoiIX2JDwG1I39ElCwDUzreefYGVWGSX79mMWOJrVG7/qYhKsYM/gguEkTEyLBzka1B7rQcHffFxoch21FFzk2feH8eJsJPgme5W+Ly2vpt9UmqvbkoF/cRTCasSjWYIPQPOEHLcG8pf4BBSQYYgolRBH3+LEX2Nq/bx7xNg1iFoIQETkmzS9FYMjqS0CT2K/Xv4XVIftGGl4TC2nltomgGdbySoyCiBG7iIQATPBwX9uPSenIfTm29FpdgjFSJ4gQzHSQmaFaT2n693YSjztu3M9OIc8VDXCopvYWrIzual8UATwVEhKYkSGyOQ5LlGI0browgQkEV6KnKEfNctj96xf3ucX21mXNEGzjjx0ljO8KcqEbnbTb3Lb0RdXWy719bzf03bV1eDtXnDarxypBN1ZequS3OkZkVhS5T7l0KM7rFROrZ8GoCB/Sp27ny8NR2zYT1ZzPFTCk2YqObRxpXRnJ6vvUK3NFerjGMkH7+F6VuW7M/fAfYxFZAfgpS5GzaNos3ZXjSI5XZuhimFJne05vNcDAwTVlCePrEmvdRpLyLDWrWkid2HDQmKFzqVzp9gwTheeD4totDLEcq3tTxDF7YVmGU3Sw==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39850400004)(136003)(396003)(346002)(376002)(230922051799003)(451199024)(64100799003)(82310400011)(1800799012)(186009)(36840700001)(46966006)(7416002)(5660300002)(9316004)(2906002)(41300700001)(36756003)(6666004)(6486002)(70206006)(36736006)(83380400001)(70586007)(316002)(47076005)(110136005)(86362001)(478600001)(26005)(6512007)(336012)(1076003)(356005)(2616005)(40480700001)(4326008)(8676002)(6506007)(8936002)(956004)(36860700001)(81166007)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 08:42:35.3955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c9fd02-144c-4cb3-f5c7-08dc22389358
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7886
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

Revise ina233 config for yosemite4 schematic change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 4cf4b0ca1024..f0e93c74003a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1026,28 +1026,38 @@ adc@37 {
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

