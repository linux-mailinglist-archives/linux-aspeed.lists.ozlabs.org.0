Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A5B96EA66
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 08:29:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0RCY4qqxz3cSh
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 16:29:29 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::60a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725604168;
	cv=pass; b=arJT9BW2DRaEJrmhUiHXKEbLINTRNF8lZKanjzhzwtG4W+xfktFoVzrsCaDRlRXhBkJXkSz8RKeegnzjTqO4+uPRlUdmvVNwhzNGLTIsskhLMYmp2TvGcYClVYUJvg25XDfPwk9GGQHD42LEDtwIjJFNK8GGM0M2otY5kOx2WxnTHZnBTHc9GsozLe105Lm85dzIB9G9PkXmr21/NOzuOMPTbciv5UE9ioyNOKk133Pe6wi44JP9I8M58+CbtzvFhTjK3LLIProQ8L27zu8R1HPuANqOvyezjtKfft8CMZy9RX9ar9EyelkeLL0LWViQwj2o1cj4O6f4ABAkq8xw1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725604168; c=relaxed/relaxed;
	bh=nJty/Sn8NpSzsj8QpXuqGnw99pNMtTMnmTt569eZCKk=;
	h=ARC-Authentication-Results:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:Content-Type; b=Ek5WQB9zZL25MjHvUxFfwas0Z47xSKPrxSSWoBZti8XtWOaw9F38H9uPrRbd7+SUnhj6xRClZsDuTfnDgKKvLYcs6N30YqlupRwEiT3frKy8p0TecMG85SRFZsgWgTm8eV8mpc8wgbrxvdjNvECb8em3Xr9ALrSbLuqiyphMoeVsB75GP4xZvR22BvaiXU0pvVmfvwQVCWxkCOjg9VFAag4qSv07kx0bq01CnFRBokGRy1uV7wFovkOvpEd7mJ6NaCrligTgPC8K4FvueDS4EFYLRckYQ3BjI+/PeTg0LRmDqqjkluB6i9sanfGfp5zxgBFNs8HQBFbxo8OS1iHcQA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=kq0mkvgS; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feae::60a; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=kq0mkvgS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::60a; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0RCW69Kkz309v
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2024 16:29:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bo7xuqwznk8AReALj4yEhcWJAkmsQWgtcbJq/KNr60oks/su73sizWtpEl+i84asXVsYV9YRLa41SSgebV5MWT52hjWPAMRkJNtH7Rc7lVvL18vToveHvEUWFLVWkIKON23ZmF1N4AHeMtqnhg1ZXw8Jzkqj7wmk/oriXgw4VbZgEUy0YWjU0w3MyyPnb83vc1WUIZZkM1q3OVjQM8WQtHhrT5XYB3b6IS4DmUQHoCARjXsIAE5aNeD50mGFWvimAIX00A4d/Orko/x4wEX/sojlcNFjgzQilRS+Q/ZXJTNRD6jHQzRrZusLWV0p1dvVggvMNbGfKRb471te7YqzPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJty/Sn8NpSzsj8QpXuqGnw99pNMtTMnmTt569eZCKk=;
 b=Wgheg9YLTBJICpXQAWbs8/AWLfy9MMR/iy/kdxqi4+kagekD2qyYNXEMkt0eKHvnfKxzJzHv2fJjmGX+36LANVW4+UHqKMP+j0rbidQhCAcMclwPE9rsvoELmpdr5QSygkmA7oT1mcm9Jjo21Tzr6XsZ0yOGL5EUUup2Ex9WP+zTiKMSx5PvtkQlNtM0vBQ2QW8xqQ4FZfVuxwfbXlBU5HSlP6BDfkR/wxXLma9uq3ZLcjdWGB+fVupbguMHST2eiZa2ifK6IMOIMAM7TvY+HSOYNNenUYgjbOEEU8ixhP5rS5RtQayu/SsD0h9fS6pKGzWdZoyL/8qpjte3UOBnYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJty/Sn8NpSzsj8QpXuqGnw99pNMtTMnmTt569eZCKk=;
 b=kq0mkvgSkWoaNQWMHUg4T2HrvDVnGbyBKxxKfg4oKsbYdgZUTubwQCtzc4Vb8gySTzPUPL6r948X0Bk3a7r4PJW5kld8rQG7avPZop/3nC1+isbfJ6/msRlKjhXBnDFsXFlpAErazG3yo3Y23BrprI4yx2j4W2N2DNRucyPRQI004fynuG7qYV8/skWNH1IZqzRtw71psqEDmuEr+QuZ7Dx8XScQXnmqKIVeVxzkK2kIMAmZ9JXVcy5sO3SHVuA0q0Ssra0uBVv4yrKVBEAIFLLgDYnOadCMNEhrLaY+yR8YS/Bt2x/Rx9tyI0TeHMZgqoyAQWjEQUBxetPcOxlRUw==
Received: from PU1PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::29) by JH0PR04MB7621.apcprd04.prod.outlook.com
 (2603:1096:990:5f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 06:29:07 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::c5) by PU1PR01CA0017.outlook.office365.com
 (2603:1096:803:15::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:29:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:29:07
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v15 29/32] ARM: dts: aspeed: yosemitet4: add RTQ6056 support on 11 (0x41).
Date: Fri,  6 Sep 2024 14:26:55 +0800
Message-Id: <20240906062701.37088-30-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|JH0PR04MB7621:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b3fb4b3a-03bf-4db9-0b86-08dcce3d3608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?sxsDx6HQXq4s6TaRUCPoE3E1pY/gj4k1Lsb7yyUmOTpn6eec8WyzM7/+6dxy?=
 =?us-ascii?Q?2wn0+jbS2K6dZl4TwI4uQDma28WRX90DGeXZu1y++L9qFas6GWG57J01QjWj?=
 =?us-ascii?Q?CwthCprrs4IG6BcuzfcnkgfEjtyy0BJ2+9t7GHyTlvBXb/zabwcJcZdDFvdq?=
 =?us-ascii?Q?jv177ZYTN01xQvpETmkZ6kje/vxv7K/5UjOZcjEIWvENOb5MsAnH2UBrj3/M?=
 =?us-ascii?Q?BTZOGCwK+qwp2VxM2SXqZi+sXGMvfe+XoKQ04eePKDR60GXUTuk86u17xNkT?=
 =?us-ascii?Q?AjxSyPHPinm4XB1+7lL7KGCXaS60N4AYRTPcc8L0Jr393tCFFpk0dWu5knfL?=
 =?us-ascii?Q?qCZ0eDsi8smzvedzcxo/tnLG5cMaRvjkbGvRwE/hpX6y2XsQ+smR4Su3hLjT?=
 =?us-ascii?Q?zt3EWxR5jIbqisG1O5Qyn8P3ph/Y8a52rpvhjTh7GTUyQw5LU80rJbs6DGS+?=
 =?us-ascii?Q?VAbNC4BQPXrZOdfJBaXPbeUgvRoiDUeNvQqFc/uWhRQOKFTbA4xbVSmtJ0iX?=
 =?us-ascii?Q?LNpyQ5f/PKXKZ/JvvHcx4dM08UFK+D6+cbgEC4WZCWhZvpDuJptkkyGipzZ4?=
 =?us-ascii?Q?ifx4YVCOt8LzSQydrwK4zpDHTVY0Kxoc/3DUrRWWP1gFyKEFNp0RSlY0Tr7E?=
 =?us-ascii?Q?AeqOKKATOfnSHsmQ8NADPMqyagH+OlSvHzEMo3opDza1aKVIiQwj3ChGdFmL?=
 =?us-ascii?Q?Cmci5rTsq2ZYkeL2nopHjMJIBXB+WlzlTaxj6an0mVJUMmmXOXqmhzkOPG3a?=
 =?us-ascii?Q?lpgAQUu9WxoAAQHkYbOzk6b8kqHION9ZqAPxalz+YgeApJCTrUQqdN0g0eJB?=
 =?us-ascii?Q?Vv79RRY137fCn/xPpXj4Vb2cg0UXMoUnZ1dsXqqA43ILKObxmXUh0S/qAvhi?=
 =?us-ascii?Q?nYGcSUHKiFoCwz0hE89+FTpHznExlD8iH6qW6ld2eTffWCWj6obpw8gx9XIG?=
 =?us-ascii?Q?/Jyy+NIqsnh2x+kbnyzSkEF3CLUdPbgVGhpeQzArtj/K6a8RHAD83yz//D5c?=
 =?us-ascii?Q?1hX4mOG9QRqkC9lrnEoTEGoVO0iws8JvDCkOX6WeBSHoSP+AkYZsQ03iqw0d?=
 =?us-ascii?Q?Y2/wlfjAGkwoAIHiZKFDRp4pSY0KUZvRKMMX7RDar3xBancKcRZBZfxfd9dK?=
 =?us-ascii?Q?a5wSjjQD1RgCNfFPheP0K4td3O6GdAHvxoQkdva0ii0CjmzS0GAHsCu66G/q?=
 =?us-ascii?Q?4g0AgLzh7zXFPNjfShwIn5E7PLzN/yP5tEojX/pucLcjkscqx2zByI8rSC6O?=
 =?us-ascii?Q?cm40dtfZnn0oOKVCLhDFq/zDRONQ1xWy2V7BPZDvhhUZVF3zMAdUj3xWwG4Y?=
 =?us-ascii?Q?oZQ615uIp+8Pe0lX5GsCD8yCU9tNYD4OFE18L2ldcMrWzrCIqRMwJp2QEhsD?=
 =?us-ascii?Q?lGY13qu060V8nA55jhquTwE0edDz/VTKiuvs3oZD3DHJMotd8tr1K84a1YPm?=
 =?us-ascii?Q?ZSG+7b/RLtbEhe3OBnqXU0Ukn+E+b9yg?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:29:07.1779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3fb4b3a-03bf-4db9-0b86-08dcce3d3608
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7621
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-aspeed@lists.ozlabs.org, Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Ian-I-Chien <Ian_Chien@wiwynn.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Ian-I-Chien <Ian_Chien@wiwynn.com>

---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 4090725160f9..d056f6d5ff6e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1081,7 +1081,7 @@ power-sensor@40 {
 	};
 
 	power-sensor@41 {
-		compatible = "ti,ina233";
+		compatible = "ti,ina233", "richtek,rtq6056";
 		resistor-calibration = /bits/ 16 <0x0a00>;
 		current-lsb= /bits/ 16 <0x0001>;
 		reg = <0x41>;
-- 
2.25.1

