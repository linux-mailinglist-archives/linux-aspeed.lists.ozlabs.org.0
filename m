Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 142078CCDF5
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 10:11:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=3uh8a5U4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlLM03Yyvz792Y
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 18:05:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=3uh8a5U4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::617; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20617.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlLLX4l6fz78qL
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 May 2024 18:04:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DaBFF6eiHRgfPx/MkydqJ2v19uaxI9bZvgCq6yI41goJYtdxQvG2n8Zpw6Xkee9TnVIkXO24+2kIcnOMlEjnFlWlv28kxrhRbfc5RtG+gQpYho6V9gNv63WVt9UHXnrDEZ4yskAT5UxtMcMTb2qvffZkltERNpoDDfYJje28tkDblrwYbReu8IHklzT6gMUcXJdpMnbPLqQaHHiNBp8jXJYVa6AaSeFBTEjoL9qP8jNA6+Ej7MkW+Rjwu9JW/yTAvOo1/zOsM0HrsNuPZ17NEHMMm3pj8jFgiYFW5kO+Tu4BUGGb/lvJ0QZMWic505Tnp+4UBgzl/1vbNRvsdIuQlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Q5MeEW03FNC2r/kxYIzAJUQLLsW+EcYLhskSOMMcDo=;
 b=Y/sV1HGSo6bZ2tIf88QREuXXJN3VOA9LOIcM4cIDLOqj8Cm18vvTgCn+9/XD95GdP+jWS3Ur7fXp3ak54675f8OrR9QdVSeoe0JZ8G9qBMPcWBguW482QpC5IfIGZlYvqKn25xeWgfYniQFTjmt2xc8g6X93amWKmQ6zXZ/f5VxLqRboD/rpeAb+68y0IurOKqu82mpPMkx0WXaAQltV8TvcSaNDjNFVjeOEsSz7RUawwuuc8jxydgD+X9AzisRmrsBcgIJfv0SCChpoHvF0ykPEsGhg7jzrUx1ZHI/DFGwC4S7hcEiVd5LQzNFekxz6+X5XaqxM3kvr2cDnWLMHBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Q5MeEW03FNC2r/kxYIzAJUQLLsW+EcYLhskSOMMcDo=;
 b=3uh8a5U4an7QUjnz4OQCsG/or7Lid4mmCPIghQP6jQj7ihYB0aVmOHOusaPS+QOyxbCiSmEVqBSFVPjBZ0jKlwju3xmofcp4P6cxmBjzqcbsol/2sYGJh8Yzv3ZdCowdMzSfTMFBWk7Ye73bhFtbWtcbnsvvjFga54PVW9Wcu+QtM8F1gbeyi8rvG1N/lxetubZCVPy2qy4ZR7KEyn/SJE0ngDnddC5hItAoKBSRx+OzPssDOPzS3UQumGn9RYCMJc50wFyKHoyo4srba70mUluF4/rDHfKC8Y7cGOHvmymdLHdU9s/GuYcbFnOM86ypiCDv3M5OOKWiOEHsqIqP1g==
Received: from SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36) by
 OSQPR04MB7740.apcprd04.prod.outlook.com (2603:1096:604:283::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.19; Thu, 23 May 2024 08:04:33 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:0:cafe::9c) by SG2PR04CA0174.outlook.office365.com
 (2603:1096:4::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22 via Frontend
 Transport; Thu, 23 May 2024 08:04:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024
 08:04:32 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v8 12/23] ARM: dts: aspeed: yosemite4: Remove temperature sensor for yosemite4 schematic change
Date: Thu, 23 May 2024 16:03:17 +0800
Message-Id: <20240523080330.1860074-13-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|OSQPR04MB7740:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c37daf02-e282-4881-d0e4-08dc7afefb01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|82310400017|1800799015|36860700004|376005|7416005;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?P4uJYFqXj4SHhXaHac67RbBGSjSvv4sSuistWf0OaR15hVi4e/2DnJAvLGsp?=
 =?us-ascii?Q?91KEVBeOLwO7IPqFoUoc4ut48/Fa6k0Nne0zbKzFAvtgEiO2uksjmthMQm+O?=
 =?us-ascii?Q?roQghE9hhWuGN8MEbiQYWWbU/IeE8wUTqcVdgN5Q397/q0HNg+z68D/MzuXG?=
 =?us-ascii?Q?mgAL6RQrsDIf7n50cWUP987NDv/wcw+zkQMj+/NjHQ0xi+JzzUnQE1C7dEXN?=
 =?us-ascii?Q?vsLrCeyDFiq5bCNVg5Jxfbk9zOdYn468gaSgkqueCCpiPsdiU5p5sGwIGPtO?=
 =?us-ascii?Q?4Auo1KHjtDNBoJLoyzLzFM4KxcsneZHfH7bQG9u0Ocguk6LKivPt/RusXRvH?=
 =?us-ascii?Q?YO8HQg9wA8LSTwg7dQixN3rXc4xHfBNBHOLT5UsBIbJCssqtXLpL54P3pNlV?=
 =?us-ascii?Q?zlpL0Gv2OhbRbXstB+85R2xZnUl2XYWGn8ATjp3OFFPpfKgGvo/y7MPtxZnI?=
 =?us-ascii?Q?al3VMPcxz/XE1tQpcaGFaSmw5PzZTm1kNNk1AWuAJHQo9c8IucyfcUGHeWiw?=
 =?us-ascii?Q?KUneBcw5pBUcIoyKUFb05dskYCPhaQDgBvwHlhuidGoKGcF4pPsHTgYB10XS?=
 =?us-ascii?Q?I6iFC+qooda2YHBtIWzk66pyLF9QzNovpBdS1Ds0zoFg48tqSm8ZrUR3JGCV?=
 =?us-ascii?Q?Ru8JhbxrcoZZNVh1b0R/iaXwotlXT2APvttzkKDL2/HM5CmQ6xo7CjfpsOrJ?=
 =?us-ascii?Q?47nnUZVgJ5EXrACZN3fklx3B8i2AMmEot+eg04qc55t8J0PRWTAz2PHr1v++?=
 =?us-ascii?Q?6rjPDe5cSAb83qNagZLl8IuaZ0lZdtCLzswIDq/6EDKzUV8caBcEA22RyYIl?=
 =?us-ascii?Q?OQCtOJYTFmAHWbtSS+kAM9KIfjSriQF3NmLaIgkq9ABlWCrqEcn7ga1efCiy?=
 =?us-ascii?Q?rhvcFcssaBmXKpoBMrXKBNx6EzUjoRkzd4WI2ZyrF+vqrLLB+gtRVyxwdqVw?=
 =?us-ascii?Q?GkhSuy1OJHK+ApPlMshrKuZDL/41lc5MNkvZOdELwdbUSmazn++CNdTaJ9Mo?=
 =?us-ascii?Q?+29XJNC9a8qo1XqIj6OlL14i1Sa0fLT3sL7MtSLMUz4BsVxod8F1ScPL/+Ob?=
 =?us-ascii?Q?9qzKBSbzBjQG5cptGfF091mM/T4dSXWrB4hriNNuTi/sjrraiR+5EUMP+VFo?=
 =?us-ascii?Q?dkXA/ZDg9sJyXIL282yjy1dW4HNcXsbm3QeP2EYFhrvr7kWauULQz67ZKFIu?=
 =?us-ascii?Q?5kDm+RszORvnna2t57wE2Ad6WE5HXFiqg5/fiy1WcTQc9Qse9aU6/uqv4LTh?=
 =?us-ascii?Q?Tgk9Fq7Fv/t6Se9eIdMsKST/fw2CXaw1KJ3yyiA9yumci6cReXuF0Up2xE+R?=
 =?us-ascii?Q?Vql4LsliSMVFDu45W3E7EYtVxsNBREBti6L5id363qGwVUVHsywsqT868dAp?=
 =?us-ascii?Q?zS9odfyFJsfN4vt86QCMjpS57dTt?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 08:04:32.4687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c37daf02-e282-4881-d0e4-08dc7afefb01
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR04MB7740
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
index 9a14f0220cf6..8f3bbdd1bbc5 100644
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

