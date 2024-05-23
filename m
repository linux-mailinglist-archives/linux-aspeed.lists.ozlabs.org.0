Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 0035C8CCDFC
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 10:11:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=M+ivt296;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlLLY2Xh6z78qg
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 18:04:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=M+ivt296;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::605; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20605.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlLLF1l8Bz3wVN
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 May 2024 18:04:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmwCwXg/BbSaIxE0h86NHcfL/cpkLIQlfDxVEemnvLIiYdVnHEgX52b4zFRR7kLJLbX/U5zWhtxu8SjkU9yFXDFbLjpjPifYdvNW1hlA8mO6/BD0kzFDtRkx+R5FTz2KEu72aJygEZAFJ9gM4iOU57R0DDwH1oxSGn/p0r2JLWaKovEx09T8V1eunpdCRhhie4KH+aaE1duqBQDhCc8Ra6G566YMyaBjZRI2cqnjKhtdQWX9V8+pWcjewGoOSH9vdQ/ibvCyR6lvU41lqcTbJMusU9gcnOTpLN7RPzMp50cHYQFHkLya+/4QHv5iFIultJbEIlxlO73KeGL8+MpRCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HypuHXBWroWYlUbZ7+/af+Usbe6kheKPtiyQQytzoQE=;
 b=T2xx+XIZiSwSJSGWIeky/jw1nl+OYknYcfpRjFqrVV3xSLUETxV7vVcTsxdtK7+ZF17Ya5fmzXh7TOAkOL07qdRWFpVjXemrNKIBgYpP9o+xCiu2Xbw9ih9nOsWMj5ZDJOK1Yt5qPpK0jzeq+AA3vHVNLuNtoP/CIWe4f3TAXPe6qCj+u5fnBCMKl3wUaXhQkf8qIDSDxoFQTlkzLyr4uNlwaXXhBG8nKC9WPLaY6xcMVIw0fWwM6baB/GREtC2c7NpPf3J5UMGTIwakThJONAOvJgDjk/cJDpE0XHVpbOAOqGF8PO8IDwZ0DwkARgNVI83UTh7fJor/3gewJh9MiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HypuHXBWroWYlUbZ7+/af+Usbe6kheKPtiyQQytzoQE=;
 b=M+ivt296ZGwFwGXAEPwWNQtQlKUrhmZBocuOsi7PwJT5AxoeVzSTchBMM1XkuwHP+53b0PoSilTRGEoaaUfCV6NoWQ0ZWG1pf9ESnACOQKL5teU0hheBvAttDIQmBAD3vOofJIcbpwFQR7TSDLYIX7duFS76GHoadWxyfO8U+U+GLEd9gPv0WJ9+cIuTqr0w9TVcgDor3EDTeRrarh/btlc0Y5LpacCMTGWkf7cGdbsiT/JnCB8tzDuCFTVSyUmayPAYPenRS96uU47HS57namTeb1zmnGlLU5/uXXe2lkROvprZavHDfs3/RgrNqfPCREvod3OohBbiLFHdjXnFoA==
Received: from SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34) by
 KL1PR04MB6925.apcprd04.prod.outlook.com (2603:1096:820:ca::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.21; Thu, 23 May 2024 08:04:19 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:0:cafe::da) by SG2PR04CA0172.outlook.office365.com
 (2603:1096:4::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22 via Frontend
 Transport; Thu, 23 May 2024 08:04:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024
 08:04:18 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v8 08/23] ARM: dts: aspeed: yosemite4: Remove space for adm1272 compatible
Date: Thu, 23 May 2024 16:03:13 +0800
Message-Id: <20240523080330.1860074-9-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|KL1PR04MB6925:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b38751c4-8858-4aa7-f058-08dc7afef2e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|7416005|1800799015|36860700004|376005|82310400017;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?qWfT9Lwo1agfF6Yzhqx+eic+L4/boqG0JHDAfjZ+e4mQYkHLkJjlyaHzQqfy?=
 =?us-ascii?Q?fSgBhU9buTpVp0cK4JsbUaqjmnJpfQTrt+fCyhI5gpWSXPRaOVhWaj4XlH+V?=
 =?us-ascii?Q?w+XdUTw5TIAqp3VMDZFV4CTF68aZdzGLf7VzD32qt0/FsTutiQyrrtZ3IgXC?=
 =?us-ascii?Q?o2hINoc3pLdLl6nAFUGDrtb6xEqLVg5nFEpYgESj3zTuH0DvJU390Ic5I0wC?=
 =?us-ascii?Q?FgRCr8a/TkNrGaSowTfzRk0o/eCLquuO5X4puqN/rC/Hx9+eDhZccCCSVUdg?=
 =?us-ascii?Q?HbfFYDqnrUM4Bcjn46ZawZHhBGHltJPDtdNzWO8oK6GjMc3tY3dlYyE9wGHK?=
 =?us-ascii?Q?UhoMOAUZooR0CT0T5pOb6xyXIJ2zJXUSoPJsYV7/B15puR7K10ZRfFKM/8V0?=
 =?us-ascii?Q?Pa7bcjPbZ77ERAe1A1Woz/REOPCpmJ9FNh43639ynqsdkSb0zli6XIyDsM1R?=
 =?us-ascii?Q?boN07TbDAskGOOyfDm7tfgUVIWfYTlI1eNh9FcsUO3ZgnT4D5U9fMlOxo1wi?=
 =?us-ascii?Q?vSy77kRbAzP//RVJ9vJQAqjr7qi7WVIlZzLcf4alBw4iGlVzVp6TV2kt8e5Q?=
 =?us-ascii?Q?uza4noQPuv5i12xIoVne4HSbg6JzVPf2N7eLI77zkI1Krt7XhlW6Fu84k4Jh?=
 =?us-ascii?Q?nh5tbua75ryYVx376ynnLBxMaLnoqKsoSwMzGDIywhhBvYlsrwCWiwuNT+vK?=
 =?us-ascii?Q?ZOSizY1TIR7QRL+ecmV2Tet8mzeq9yPRxSBhxFSDmduZ+UXwgS9u1UwsZXJG?=
 =?us-ascii?Q?vV0f/NMop9Ulzrm8oqtmQVVKJv/j6OUtVeaAuWVZYCEDIRGK1c7fwvo7palt?=
 =?us-ascii?Q?B8o9XpqEC1Oy3xI6zNjWMMweHtVRnTWDwsO40ovbKD82El1SI9eEU4vJtxEX?=
 =?us-ascii?Q?krq3gMbj3P6xWBPmrLZ2bHMaLEARdHqX99JmYc6RSLFUOCahlYKgLQDAiLA0?=
 =?us-ascii?Q?zDtD9k6YKCwPh/JrHf+V0gtaomSRMLfhONWCHBMdUp6zh52rrnIXQvj1Vlbd?=
 =?us-ascii?Q?Ug+ECa7b/iKQNNNA70HoWhIMzf843kFlqyQ97LL3J2T3V7uaEQ+BNUwBvwro?=
 =?us-ascii?Q?FqZunzWxnkgsPZIP/E/0c5Uy2AZvs7inE09F8aJS+idY/GMVFmr3UTjFJalt?=
 =?us-ascii?Q?rm+sClOVLX4WkySoIFB47CqVsUA84BYKb19BprE/Y9EhvI0qHluaqam7pLXJ?=
 =?us-ascii?Q?EP0tuy9ItsUgU6ttSsYhiswAXoiTto6Kd40pNZEtMLgd+hhjyrgm8VQYh9F9?=
 =?us-ascii?Q?pe80soQ3+xrVFo8Y2oV2MvCT7c3oVDc0pQIRrwroJpzQ0NSq4T0dtAu+v/jr?=
 =?us-ascii?Q?Ue3kEMATU3k8fwOWhaMZV++krewVOfHxEF81xFRFU5awNFVrV473hGrz/uHu?=
 =?us-ascii?Q?j4Q/w1Yr50+WF6QrWZBUdGZ8wLPQ?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(36860700004)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 08:04:18.8904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b38751c4-8858-4aa7-f058-08dc7afef2e9
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB6925
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

