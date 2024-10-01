Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D9C98B6B4
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 10:21:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHrWG55LCz2yLB
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 18:21:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::619" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727770888;
	cv=pass; b=KIyhIF7POYqSZ8Q70BOqsNefqKjiMlUHav6JMXuIYIQvqabX6S3nmonhV/aukBKrdp0XBFPBnm9fVlu9pDoZ7Ao6HIFUjFM3AHHS9qHTPVl/+sENZyt6ubCO+flFOU6mFyMK/ayryTczwotxJYWgyDNmQ/LOEi04E1jbtyQcjNBdPYtExxpXnI07gcPuLhudZCBKBbDI7bGVBRqN8hikomDAxox4d88NRdnAGlbDHmhBPzrl7bcCjPMWRVCelbSQaJh3GBV6rJ4O1mZERCfQ+v2VrMzgG/LQed64SmByjQQwrXCd0oOe+yk9CGF0l3vJIlDTln1QpW8u1heNajguVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727770888; c=relaxed/relaxed;
	bh=/eZceqFKLddY5TxYoE9EYsI11S2/ZQET+IX3mxvnios=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tuzpde4moTxdDxx3j8OLaKsyi/zOXcFpoOcWN1XHfXd8m3F9nXCr5qWuJHOxnccZXaQXozY9IfUNlE0U6xrgkDHclKKRhPEk8ibUsuN+B1kKS+AUyUlYHWui3Ysv7tUYCtNIbrIfORKMdzoKh0OdEnHseS2fmNg+K2Rqbdt+fto/fIUL96XEzRRFBoQHUjO/wmoK1haBVwXL25a51IceRlxaoKio1SOQ61/Qj8PcZ60OMEAyY6zcDfdK/yszrIv/Vr9K74kU+7jKOrhuio06IzWqRwyemeWUgZfaB0NFBMSiNAc+QgCoJiNO10eg3KNrLow5z2twn/isGAUdARgYjw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=A6fmLMcr; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feae::619; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=A6fmLMcr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::619; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHrWD246Sz2yN4
	for <linux-aspeed@lists.ozlabs.org>; Tue,  1 Oct 2024 18:21:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJy/fjrFrVEjSnasLq/fL//mC4CAMul+MfRdU9nu+OEK3ztklJ4joFczT/QyncMWCQHNkFoUYrNbNa+5qwswxVOOP13KJzInqfLE0QPPqZbm0RGYZ8+NZSg7f1ON8z8WSgEEZgx7sLkhztLh7Xv46y1Bw70Jx6jkLDaAF7XZv0uHiqEZ9iV9sIm2Ln0GBwMA4fYdbRfdTyUx9p+XQY55+2s3mAAdho3Rj3LqZC2YGYXCVKvRXwWYUaExj3V9cGN566pUVmI3N4Io0wEBS4whfBMahfmtw5NehFw5RtmblDaVNyBPykUmIpRL3kftooxHq64RdxD+tcr3+9tNSqHu/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/eZceqFKLddY5TxYoE9EYsI11S2/ZQET+IX3mxvnios=;
 b=Bp2SGzI2ckikTZNHYRpBd4+OR23YCVqf2v+7X4YDQC0Fu84G0TqUDoh/heH1R8pWqQczL68lD3PIEsIR2pxZyu9xQzWPttXTk3KHKqyXnrajkXy3Zz37Kx873oNH8x0IDx9LLVGjjOdZphuFGdjhihXMkA3KOoJokW0B1suurhJ6XQLs1DvZ2AUI/3/4zGfkrMZOaq2GuooEUPckl36mOZqrsG0Rto4nOEQrU8/Ek4QPBoVWbKdixKLCfGFhJ/RumXHjjOqX4EMjo8+yZJCcE/lEhnXmT6W7oNec9M3A7KRL1q46y+722Ip4uQ3hKzdrCEmoYr0W2A++obs8tCpjKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/eZceqFKLddY5TxYoE9EYsI11S2/ZQET+IX3mxvnios=;
 b=A6fmLMcrHGWeh6YN2sFIQW99sqbhS3nJmhriaPg42gHBOXadZbpPxbTGq4bvY6WARI+2NsDQrZeeYEhzHye9ar7/bfJ1qcrJTEqbJ3BRg0r73B2HW7XYRm+vL/+ZBhHSABqbqyaH65MT9tsRf0QqC26aZWM+8df1gBsqGF1rSbRFT0e9r1hQG8DFymKjXVXzBIj+YcOXOWHVbMe1XKSUYsd42nQjix7sIfxnYgM29KWTSx9GhW1P0QBssUUVJhqPZdrEL0cvD497/qBUwvvVeu3UM0YbuMjiGHYcW26+kVbNVW+NBMPhFYQcOaa/6e6JikHWRhx6MGH7woZ8/BhwOw==
Received: from PS2PR02CA0073.apcprd02.prod.outlook.com (2603:1096:300:5c::13)
 by SEZPR04MB8026.apcprd04.prod.outlook.com (2603:1096:101:238::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 08:21:07 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:300:5c:cafe::20) by PS2PR02CA0073.outlook.office365.com
 (2603:1096:300:5c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Tue, 1 Oct 2024 08:21:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.8026.11 via Frontend Transport; Tue, 1 Oct 2024 08:21:07
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Subject: [PATCH v2 05/10] ARM: dts: aspeed: yosemite4: Add required properties for IOE on fan boards
Date: Tue,  1 Oct 2024 16:20:47 +0800
Message-Id: <20241001082053.3455836-6-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241001082053.3455836-1-Delphine_CC_Chiu@wiwynn.com>
References: <20241001082053.3455836-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|SEZPR04MB8026:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7369422b-3555-4f8d-f50f-08dce1f1ffaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?F9pC1OtHspG93VhWO9MtU0USwr61KO7Py+SwICLnpxN5YdTngXc9dBOftS+D?=
 =?us-ascii?Q?N0OR7VAK8vtxTD0VFvn8tkJo7TqRlc3QstfXpAxhEOkfvOnU8b3p3Ll/urXU?=
 =?us-ascii?Q?zqu9GpAKrk9iie8iaxBwLpGn8aiQeuDLviiLLBEdfxMvRBCisgZxAR4w2XMJ?=
 =?us-ascii?Q?SJugIK3W+RsomfYz5DfdnCadYo7dAbsGZNml/VgpS+H3K0JZ3Y9dygezYkJV?=
 =?us-ascii?Q?/n+bbLZKtWbA/6SBwK8meYmYCQ5QJh/csjNuM8pU8Ey53SXg9SAeICFItziL?=
 =?us-ascii?Q?KrQObpziJA7+/8G49VCw8AIt/PhuwDk7XEqkrh+vkoX4WKlmAlgmBdm+6BVh?=
 =?us-ascii?Q?e63unRTMqpa12vfF27tMdmZDKPIPZtAxMtR0FTa2hfIX7TPKFYixKQY571D7?=
 =?us-ascii?Q?H1hFhFRiMbtJcNhKu22hp6CgsPT/bClKZdslXWy5ZwFsgDmQ3RfKIQqhLXeg?=
 =?us-ascii?Q?15yEcbRMlvD6lWnCSrGcio4lpGwFrI6ajMlNpRxmNQ521gADH2dsJgGezqjB?=
 =?us-ascii?Q?hOHK+gUu8s/OmILgHXESAUQ+aH0MZGRtOwXqVU6XMfu69tb7nUIdujvPRHdV?=
 =?us-ascii?Q?btJ/Pj4BKU3EJPylx4NSRAvLphq5znE0huvAQkcQFxMd6RH9KDUwyxLvq0TB?=
 =?us-ascii?Q?+bKoDbyWDJBiYgJtxqBDxoezAH4wZiBxG36VaIAlVe1ZDuitlsVRde66n6cm?=
 =?us-ascii?Q?skSzKzDAPFW2fRHJpvDH+X7s3mlvWxZm4nV1EW83M4fQNOH/lRg1cIvnN1xO?=
 =?us-ascii?Q?kfOytg/JI3TSj+jct6WgfxBArvK3rgK6bBBLLj+/qevWhSFhiy+W12GP0Lkc?=
 =?us-ascii?Q?78dT3nesetoqIiASLXhLKRLCroi0S/Qhv8qKXmk8iCiCjrtl3dL29IVg+wX1?=
 =?us-ascii?Q?deI8fYLHlZKcGvHBPp8DodTyyAfrVTyBW1Ki7Df9ZLiskmjAN1+JKsUZQK68?=
 =?us-ascii?Q?9CJb5cHjcc5b5uS6q60eWcoexD6OdPBiwfhMuc1TtXlEaUAFsueqKdZv9vcK?=
 =?us-ascii?Q?cQXeFjpd89ORZtz/JwsrldA98HlBzp/ZNwPePf4UC9jPfHDOyLKNVKv5V8f8?=
 =?us-ascii?Q?4lgsdPSUJHOVHYcsEXbSE5s/6A/EXwIuy5O3u35jDrQ4nug3t3Wx8OuyY53P?=
 =?us-ascii?Q?3bSD7GPBJgCA0P8EBxaoc7mePhnDzvwNB/3lWn48sZN7l5lp+eMvJBqaNoph?=
 =?us-ascii?Q?e6kAIsmJJdOF2S79sxPe/wQolO8cMZ6Vvc7StY1pnrRw70coHCSkZ/jdkDDy?=
 =?us-ascii?Q?t7wO/0CSH2lwtwhAiy/nxWkGS+yJQm2Jn1crMp42liTrBeJrbU+jGrEJAZ1I?=
 =?us-ascii?Q?gDTkBta5w+2yKMCk4hoO7OEJuyNfWp4dhRoLOeGqXIe5OSrjJnJsWcQg265o?=
 =?us-ascii?Q?7wCMNE4tJGKzRjHq012XCBBlB1S/?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 08:21:07.0185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7369422b-3555-4f8d-f50f-08dce1f1ffaa
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB8026
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>

Add the required properties for IO expander on fan boards.

Fixes: 2b8d94f4b4a4 ("ARM: dts: aspeed: yosemite4: add Facebook Yosemite 4 BMC")
Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 26e0fcbed8d2..3ff22ec8de02 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1152,6 +1152,8 @@ pwm@20{
 			gpio@22{
 				compatible = "ti,tca6424";
 				reg = <0x22>;
+				gpio-controller;
+				#gpio-cells = <2>;
 			};
 
 			pwm@23{
@@ -1202,6 +1204,8 @@ pwm@20{
 			gpio@22{
 				compatible = "ti,tca6424";
 				reg = <0x22>;
+				gpio-controller;
+				#gpio-cells = <2>;
 			};
 
 			pwm@23{
-- 
2.25.1

