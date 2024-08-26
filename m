Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B17995E89D
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 08:26:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsggR477gz30Vm
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 16:26:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::60b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724653601;
	cv=pass; b=GXyM5BUZkwYBEbYyH8Wmucc4ens69P34938epZWBPD7MnLExDEYTFmMRvdGl2KAEktSbpoK0vd3bwWNOhl0yG4gIzdP6MQff25KFqYxbbzaN61A5QeN1zJwWvUoN0Cp3pEvmXoxwQt16s8nTRTnkQ3pNngiWUiwwx/RWjLhFiPn9oNfLXVwUbMSWpZclGUil7Jye9qzPmgun1KFTQr1N2RydwHquWOD+nl1+5hi2/+cdieMIvdBrFgm5xEOgIB5AW/i30ps83b7FZtKYV5aP2atDgpD6etB6Iy73LjQZpQvlL9pGeWN73Ly7pafS3wvx1qxNYeMmFiHFjzpDcvJRaA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724653601; c=relaxed/relaxed;
	bh=CE8IuzdQZjntYqD6nUPQnwn7C+BubHdv/yTEbKi/B1Q=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchan
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=ZxN0MchO; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::60b; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=ZxN0MchO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::60b; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsggP0qybz2yDk
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2024 16:26:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0NlWzgaViQPmhb/Yd8E2Q/LbM6o9LD0GuvM7c+D0CXVEfvQmQ4VJveZDQ1DgK2bIN8aYEkvcFRAnLDxIuajrH5KDUH3RW81keK2LpJ8QhH8JK+GpqyZeI4kBshhZ892Uyt7UYjo0rravMr9rMRsmBzLQlOea1+AfH47yM+jzpwX+5NvcdLr1nZSpXdyvyn4+7ouaOjepcwS/3OI3krb6lRr5mpZiwHtoXtfjSbswn/hBhVXOFGZAw25JJ1xSUuG79mbvhvmMMvBRwr3tsEvOJcaXa7kwfKkaOZFVOVjHQXAwcu1vxx6lYRevW8muDxdtncS6za7puiqvCkXqse+FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CE8IuzdQZjntYqD6nUPQnwn7C+BubHdv/yTEbKi/B1Q=;
 b=sE/fbpxJSyebFtKgugm/1AXzpNBe1eY3Gs3OZL/Nfm/1LkslMcBc4qcTocQfniccXvYuiPajhcu19j3TMQRGPLRrwCmltbmSxua1+PFQsk25Yu4VFil3oA1hOTd1CrcNbfXyxlhc4cf5PiTdmdneA0UWBk3R/cSfHg5qLu3lHFxB0YrMZ5g5eAQO/oqVsAuAgAWKP+dXm1vSNng8v7l8Pqg+/Pn0uVXtO+Vwyvo7IzFVYc1iiyCENKQRm6yaBNJDDEv5LXIesd1TLYSq3r56110sHWYE9+0Q8huFdEZ4XbdasSLYyiaKpax62sKpT8Q5zegrnQLcKKxMYjGhGB8b5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CE8IuzdQZjntYqD6nUPQnwn7C+BubHdv/yTEbKi/B1Q=;
 b=ZxN0MchOTvM5q/P9I98Yzlqp6I2eGH4XD7WkSB/b6nk4dUnFWk5vdBSxr0tLskXjkYjP+RG41hlEyCaFvsEfMIMQCQY5tucpcEaMJIkbXmNI9F1flNYnhmkTvUy4f0sYLwY1dGXoDcv0rkypSOSpMPeXO8vBlVm8X2mCTpCOVXqWXu5q+QTEHHJSf6Iy2+BtTfLoJxu4r6BXyuMEfrr2/Z8h3Xkw5q4qo7GRi4Ry0hMJveaeCXqjuDyZonGsxr9L7hjzAFUZotwjdwX7zAiB+yfjupHzFbo7MM2b/JBEmiTidklkXRU4T3gE+KTfjaMk9fQUH5nwtXByrNDU0d4/hA==
Received: from PS1PR03CA0007.apcprd03.prod.outlook.com (2603:1096:803:3d::19)
 by TYSPR04MB7446.apcprd04.prod.outlook.com (2603:1096:400:468::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 06:26:24 +0000
Received: from HK2PEPF00006FB0.apcprd02.prod.outlook.com
 (2603:1096:803:3d:cafe::e5) by PS1PR03CA0007.outlook.office365.com
 (2603:1096:803:3d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14 via Frontend
 Transport; Mon, 26 Aug 2024 06:26:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB0.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 06:26:23
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v14 24/31] ARM: dts: aspeed: yosemite4: add XDP710
Date: Mon, 26 Aug 2024 14:23:58 +0800
Message-Id: <20240826062408.2885174-25-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB0:EE_|TYSPR04MB7446:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ccda3cb5-c89a-4afe-2d78-08dcc59801dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?U4raCMl6hEZQ/VmBPvzkVmyjFzv7PvdzjtrzdVtjfLS3OumIsJC07JW9GFtH?=
 =?us-ascii?Q?FoimjcTt8BWeZOBJ+tUbOnvElz1EnS1rf0gD+dnftUptLxqpIDgqZBECx0Jx?=
 =?us-ascii?Q?m933yqRkLIWZy2gzzXT8s4gPmYW/FN7Xd1VQRUk9/dsDnv8X86C49sxaTIOs?=
 =?us-ascii?Q?XDDyPpASIdL1EahXy0YFcVM14VpkoqLUSDKicSxVzaPBXqdBhC5GSu0wQDPn?=
 =?us-ascii?Q?JXCiPQCVD009CnapiJI53TAj81q90DXVGKckRXTf5xCPWfUI+8zk9L0/ko4F?=
 =?us-ascii?Q?1tUaeHkr0BUZZc1n4ArPSt3/JCi+p/vhBbFDV84zvR6vVkWPt1HgBk87e2Ca?=
 =?us-ascii?Q?bwxloMaA25/HgTJEsD1JWU272GyZTQY4vRAKgUqQjuNp9a1Q0guGgRJC+wrb?=
 =?us-ascii?Q?j8dQxQHXGTAnLn4xELEHJzHSYtGp3hJ/mcx6r8aiedm6Irzv9sNyPD5OeNdM?=
 =?us-ascii?Q?Eoy5bOV3ENhGXfKoZvNHQK/dNs95hnJC3O/bMn13UUu8wplf2mgfM/tfA5qY?=
 =?us-ascii?Q?xWfP/kq+5PWml74rlUIc2Gul1YH40n8zFAEtCrZ+MUof/BR2BbrgeAsj3Fqs?=
 =?us-ascii?Q?gNqwfqlJc3B41Bbo8mGedwv6vwsuYdnaRTvw1cGVJx2Ad3D0k3Pa5YriQB4O?=
 =?us-ascii?Q?BkSAm71xW2e1+Lclr1kRmovayBC0A65BDZLXlecZDVmPa0CjJ2rENiontpr1?=
 =?us-ascii?Q?7SbbQ3SdNixmmavIWamUtCxeSLlAypb0e8gChLgLSl8SAH8pJHmIu7OHi4E2?=
 =?us-ascii?Q?zCBNw7kay3HENH4+dULIpC6S17YzIeKqHCiDelEU1LeVAxe30bXaA+aDh0Jm?=
 =?us-ascii?Q?uYgysPXdcq8f6hwFf/iTUfQhCCIhLfF/Ld85B94meDyiNxALOJn9iGBlVHFg?=
 =?us-ascii?Q?0+cFNjuOCL91RHdHUTenhTrZ9RfyP2BSi8Zng8v8TS0Djzv7x+vdmN9ZRzvd?=
 =?us-ascii?Q?tzgjNtWzPaSibwYwMbdkT8dPdTH07wtJTfnVmM/z/GNSy9WoTJsdlKrKeULK?=
 =?us-ascii?Q?7SjtiqALE8nfMjZ4Wja5elpDlSXebD/3fxYg86a30fnhf0R/a1sy/bcJ9Or/?=
 =?us-ascii?Q?6/n6AD/tuHOBvvou8VwUqbcmxCOskhlXhjosohTXJ2Mj2buN4WVqltugrJZO?=
 =?us-ascii?Q?uiWqB3h2bKVr0hi0CYy9km+T9fVUyEXu+Vhd4WB0+Ci/kvMCHEakKHx6XOBW?=
 =?us-ascii?Q?JswKxphAR0HEdeVwWZd0yk3YLCRBd5qGWkG2d3DkQQ2nBR1LvwdaMyGWSc3A?=
 =?us-ascii?Q?jtUrpLFchP7Lsw9b27Rx5thraGaMeEh8QHjL31QNzvD/+Jx0f4I0nqDYZaMW?=
 =?us-ascii?Q?kU9gDkqJEX7eW/CUi3KEjNRPcs6XYw0CKxftqMDZ00DSe8mLwweXgr4RjCX3?=
 =?us-ascii?Q?AmjRa2ORwdM3BH2WI9FCggi1dGWaRh+pmqyMq3JI/Ip3XCwv5KWKWu5DjtSJ?=
 =?us-ascii?Q?XsQJ+7+gDnYQbdTFZOhzrpbomOlHyiG4?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 06:26:23.3928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccda3cb5-c89a-4afe-2d78-08dcc59801dd
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB0.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7446
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

Add XDP710 in yosemite4 DTS.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 2f4e9c5edd5a..f73719b3c2f1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -978,11 +978,21 @@ power-sensor@10 {
 		reg = <0x10>;
 	};
 
+	power-sensor@11 {
+		compatible = "infineon,xdp710";
+		reg = <0x11>;
+	};
+
 	power-sensor@12 {
 		compatible = "adi,adm1272";
 		reg = <0x12>;
 	};
 
+	power-sensor@13 {
+		compatible = "infineon,xdp710";
+		reg = <0x13>;
+	};
+
 	gpio@20 {
 		compatible = "nxp,pca9555";
 		pinctrl-names = "default";
-- 
2.25.1

