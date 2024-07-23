Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD74939D89
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 11:24:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=rXFrhyW7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSsDh55Bfz3dJV
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 19:24:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=rXFrhyW7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSsD91L0Nz3dJk
	for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Jul 2024 19:24:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WI2y+kZTOcez/z2ukx+U5L+WPug4unOPbGQeUT+exSR23ReXLGLMlrLc9C/J9n8d1UrDtJ3WlK/5VVhfvk7lWYdu27+rSziK+pkv/HG6IvgY23Os7+FL7pTPGVZFD+H6ksWoG8Z6fU96rsEDYh/LSA16f0j/1UmeNTd4Q5icypcZOBsqBHqsYuAhu8WJn6X+0Y7oxn9gqiczMHnZ3SP3y9XHFnNo4K8tCCAVMP44XW826kF0bPNrSBKcXei96+PanXSto+tKSb3OQhByfh9zAGm8C5edeZN19QjBeZ2JZ3j5RyNWPicFhEkA0dY4L8QU5EW5dTzsH0HLVU8V+eE/WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQ8R9uD5dS2CYOtc4xvne6zIrhYDAk0BYpQGanDefRc=;
 b=FRQbTttvbefKBbh+KWZ48ybkq9kvowxfvpoW+D6JZ6kFfCHLmUzP7gUloMb2BeGq2aFr1F2HFkAFu7EvlgAQ+ibCfZgRGea/oQmO0o28Si9HPVdedQs3sSO8lmJz5AGv6e3eLkgNZZc5bsWLqqah3ZNgkZWz1mF6cAFije8jZ9iPljcldySsigJlraMxwN97cVH7pap4kioa4nwil4608F6vooZMF+34owWVkdNo2Tl2AHXWVhvVvNq156RHMZX9D8kmChugbXE9Ut80xsExO4DoyoYuPBkOLhp0vxI6jpjvjZfQnmAo9wGVpSuc/ZA2GpHBbs4maC5XusHsont7Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQ8R9uD5dS2CYOtc4xvne6zIrhYDAk0BYpQGanDefRc=;
 b=rXFrhyW7r7Fbn6aVUNp4rOsQpqge0T3gezI1WhYWNdUV+PPxD/wp+icCDRXFC30ahSTtk+6NfeLPsj8BkJJkm3Ni5Ll/0NC5BIWoQsbc4O76IZYNnB96kDyb0mGL72v1h1Okaon27cw69c+NuHLd9STRUBW+RsSEBbtxl6ZqC+x4I8sLcrj1d36uYH5TXqMJdpOnIBRJvAG66c0qDZpA8XVnscLHZK9GEkFrq/gjjO741XplatZLA2ywyWW7SwaDCumvF4UsyHFH433NU7y4ppeuEgOrKIQsxYYFKTIwvfrGx3EXq8/+tpQM48jTYi4Sac0LqjUTB8gb7ZTcH6sZQQ==
Received: from PS1PR01CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::32) by TYUPR04MB6837.apcprd04.prod.outlook.com
 (2603:1096:400:359::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Tue, 23 Jul
 2024 09:24:00 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:300:75:cafe::2a) by PS1PR01CA0020.outlook.office365.com
 (2603:1096:300:75::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18 via Frontend
 Transport; Tue, 23 Jul 2024 09:24:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 09:24:00
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v11 12/27] ARM: dts: aspeed: yosemite4: Remove temperature sensor for yosemite4 schematic change
Date: Tue, 23 Jul 2024 17:22:53 +0800
Message-Id: <20240723092310.3565410-13-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|TYUPR04MB6837:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8eba4109-53dd-46be-9d61-08dcaaf92fec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?p4tXR8iHyUCzx3bKEBQUK7TtMSpCKml61VTH8kAl/SDvSri9f+PBI7NXx5qg?=
 =?us-ascii?Q?L7UqXkuYyL+O4xS+x8N7tM+CwGgKT6Kp5UObRqE7+7wHcU3RL646U1ID97cY?=
 =?us-ascii?Q?taqA7pBm+n1FUVfLL4PiV5ok6bSwrlaxDImbd4WjBSlHeshLPa426y6zeaYW?=
 =?us-ascii?Q?NCsL/wXmGrjlwLWjq70p/TZOshg/SZoG1WKFHzXPp4z3ZEMYmLudy+eoLuKb?=
 =?us-ascii?Q?UZqIU1Iq7ZMq3kaFzxzpp35wgIPBgs7LSLK8gR0vViPJH0iPcGqIX+svG1bm?=
 =?us-ascii?Q?WE/dA/qd1H2hAW/mgzBmQVwx956NZ+TDlmjop+NOO7IrsNzdWes9QfQOMBGH?=
 =?us-ascii?Q?AKTPQsjUmM8HJ3Hsa0zKL7C/QnoStW6HluDrRWWXKQEJnO+Hytp9GUxORn1N?=
 =?us-ascii?Q?QojCNhcEgB9iowQX6s9cmTRMX1vLMqw6piW+Y+K95HWBWM3ajfjKQSWnmEVF?=
 =?us-ascii?Q?52cQ+i+jKg2jfYmLepu9Hz5AFXCg+YWSzroRwS5xMfGMKhluL+r2FVd3E2ec?=
 =?us-ascii?Q?CjsvQcqPDdxeMS/vgM9v2PRMdp7g5Sz2L1UpIpO8ZWBi4OZM8yajdvo3ooiZ?=
 =?us-ascii?Q?+7mK+F/9mixeVT/BLanC7dR9iPWRpT22JoCQTCt7ac3mJM9AjydYkgx2dEQs?=
 =?us-ascii?Q?5MpznsRfpqe0ZVt2mQVByH7Z0y7tHAnsncuxGELs+K+G98gIOSlkTNQ1LX2r?=
 =?us-ascii?Q?2YOjEyEu1QnlBNSDe1EMTiOQMzcr+v2BYENCAjaGLDtkF8KwGsEnz1A8qh3O?=
 =?us-ascii?Q?lb+gMH6e3JLxakMycRGa1DuzUTGS9Qau/L1AJMavbNUyNmiH03gf/yp6vgyo?=
 =?us-ascii?Q?oadgg/aIuKPA31kBvD/6BK1qUNwpYphd3IOOOwIuRhpF41B3anTsss7E/AWU?=
 =?us-ascii?Q?pnN9kVBkBr9eKt+XEIgCsRj8UqwZQWK2YiH7sCy21+2usWW/CXsPbZjLQg1j?=
 =?us-ascii?Q?HV1GOQnikkdCjb8UJhjzXLp76hFmq7aY9QKy2k/z5KufB/ebJpD4p4BJNP5d?=
 =?us-ascii?Q?IJxtjMTTrt4jzjRI+NxiL8LVvSJMO+ihZLCj6/TE/8z4BI+CycKDqg1U2UMa?=
 =?us-ascii?Q?6YKsBX7X4HRibRci7MBBdf7VZ9xb+B48oQFykvWL1dKVfB0r+YOxvovT83a9?=
 =?us-ascii?Q?1oEXmfuItKboLNwUndaAk/tcYgkrSwodaj/BasAE0aIXWKJnwXeAgAnsYFyA?=
 =?us-ascii?Q?lHZC4oYhDuSYoSBm4ypWmILpR0EVjpR3NTRqa1oFuI1/LdoOpHZYY3m9+deB?=
 =?us-ascii?Q?IwyttOcjKLzPirHLgYQ8s6BdIWvM+aFih9b5OMTSK5ilPvye4KuaOhc6w+Cl?=
 =?us-ascii?Q?IAk/gDU8xaDPxGY+NuCkFK8Kvnd+zSskTm23YWafgkoqPWH2kxwknAsO9/YA?=
 =?us-ascii?Q?Xilyr6SABxEz/C31h2hFBBfCNoxyUJKCk/TadDVIq6huNFlzXhPK3XM8HNyX?=
 =?us-ascii?Q?jx9oFX6frNWxrGdxssoCZT6BwGVoWG31?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 09:24:00.5194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eba4109-53dd-46be-9d61-08dcaaf92fec
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR04MB6837
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
index e83cb51ac19d..2c0c37b3ee5b 100644
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

