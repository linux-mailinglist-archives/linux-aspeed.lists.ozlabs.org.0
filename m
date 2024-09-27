Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6219880CD
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2024 10:52:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFPP55fwGz3c7H
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2024 18:52:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::61d" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727427159;
	cv=pass; b=dM4zjkuVmPdmGQf4kzmGtY33fb5JoF0trGky/oBZoxvGaa6eUrug8CN4T9EszZ5K+PR/QeiH1tC44jQnLwRuFtE+ACoOWnrSPOdwh11nHMbWtgeKnezatVF9H545+QR3ALRsOSzfUKvW651O6njCnCEYm33BUvqmrtueO8VS77uUTQZ289SGU4J2AIzi0bIiAdSbgfeUxVRlQ/Eqp/QkTTdXs2fDxjb530mCzdwFJYWHlNBVS2d5xZ8a0jShyLroOOQuTU+qdb5AMpwQAAf2lVLbFTjFkjkD9PbBbVqkGzCWF9B+VbtleClJRa+D2kre+JBgxhKgV9oWc0UMjaGvlw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727427159; c=relaxed/relaxed;
	bh=1ARgh39l7gmHpiDQk1h4RS1kZ/qfr4kTQbXG+OpoNWc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=mXVmLDdVlJwsuz1UinOy4TBadvv2+roZYinPpG9i7RooYuhc5TxLrrqIBtLLKBqRhbjBOV8VRJEAFMIKVGiC2RDzticwzppB3RPbgY7wv++pyayIodJdD8r5aa4c10Gd2p9jJzWMUNJDeV9bE/p8IGgMyd2aSest0zHe8JsjhFEMpDeX9BXqBbqdBPTjEKNGMi1Ujw+414kkFVFqxu9DJp8yq0cCI+X1KrriTk0HRmQcxgvnrVgY/haVcrI2qFDwUqnfXnIBCqWIIl2h9toDGEATn6OziA9bar6vC0Q8tejbjClZujSrLLhZ/hdjfKJO8TTz1Lntlu9WaLNcyBh6sw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=WsbSleqG; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::61d; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=WsbSleqG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::61d; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2061d.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFPP310nWz2xH8
	for <linux-aspeed@lists.ozlabs.org>; Fri, 27 Sep 2024 18:52:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J8n/0TcixkIImlDAoQ9u/SZqhwrf7DytbEUKIo058AnIq6xcZgByBPgu79ZhpbbCJDPDzgcEj5QJVAp4j/hkcagxaLKbtYy84jAisibQcXSNNLfUuY2ywe9NgbTIS1o5AZIDb45CN/YRKlC6Yn5Lf5ikDaFLAEw/LX4hUCYGV2OPTt8u8G4OYCk8B65uyu0+wJ67r1Ws1lVW8GldtUqwm6BVhfT60IYSd6u5fd/VZXbNSH64eoZ9lgogk99SzaLB9gpqjIsH+W9c8CP2j39q74tEwUiOE5wKS3bnN6AT1fQufDSPhgxM/PoTvM/UoOUl/tCTkGuhmhJhDGZQmBl4uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ARgh39l7gmHpiDQk1h4RS1kZ/qfr4kTQbXG+OpoNWc=;
 b=M7hou9gU4t0iFFQCkuFx8C749qUBhmjW4lJDIxbusJYYHZMvVL6QNVqCF3ScQJMzKY+2XRjN/6KMmTgPzOrw5CL8vSTrFWiiJu/dOpY+cJR8tekqQd5ruyKRt8as6Gf0Lh94k+Wq3rmgnFPM+xxuCOpIF8Vu1g/nHjpRzZ0cgoaKIfVK/YW4eS081FJii3reEEs/ubWCwRQHntHY4mGi0FXmC7mxtdCAzDZ7Ltpd64FMcFkW8h7OzxPiWWrGG5fVkDTQQ6zbBbJ1G3pWp0eBnte7BXz8w7Q1cK/R9NZYpXzycEKnOnf6oKmh+49eGz6Y3bqPDDT8ayVY1Udv7/7o6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ARgh39l7gmHpiDQk1h4RS1kZ/qfr4kTQbXG+OpoNWc=;
 b=WsbSleqG9DY22m8SS7Zo2jWDCM0GzB0dXEMFkcSMqFJVIQDL0Lsqj5tIdib19HSVBGobmTLCUobO6SUttO/dsOfOxPNAq9gvVnjlh1mppdQV8BdqeE4039e54fI+RPoXYvAnxvjOTI89/O/Q+BwyKsb4emiP+DuJe1IM0jSQhgo5Nlw3q2M6p6IBPOQdNBxR3UsDuthDxGDHeUWlK3pIHLvZo+lPhkZ4y7ore0JdmcKdWVPpQd2k92lPm10vRCPpRgowbff9CfdprVvomIAREBppmdBDseey6AKr/zqzFkdKEgabPCOw1WF2temrumYzM/GBYVrNhNWs8eWHY9c74Q==
Received: from PS2PR01CA0068.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::32) by JH0PR04MB7071.apcprd04.prod.outlook.com
 (2603:1096:990:34::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Fri, 27 Sep
 2024 08:52:16 +0000
Received: from HK2PEPF00006FB5.apcprd02.prod.outlook.com
 (2603:1096:300:57:cafe::22) by PS2PR01CA0068.outlook.office365.com
 (2603:1096:300:57::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22 via Frontend
 Transport; Fri, 27 Sep 2024 08:52:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB5.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 27 Sep 2024 08:52:14
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Subject: [PATCH v2] ARM: dts: aspeed: yosemite4: correct the compatible string of adm1272
Date: Fri, 27 Sep 2024 16:52:13 +0800
Message-Id: <20240927085213.331127-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB5:EE_|JH0PR04MB7071:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c39a8fd8-5e98-4211-bc51-08dcded1af64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|36860700013|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?m+v0aiiiNhuZHZdLhI60KmNQqerigdnHmbpnpWXcoZxzI/hw7+j5+nTomUgj?=
 =?us-ascii?Q?yjCnQodEbplFdxHW9yqPipSnEE7A2GVLMtZMPbrhy0ZGIsjNjXZyZaBbmt5U?=
 =?us-ascii?Q?oMtQrLDDWcEXbmGhuNPINZEv7yJ6mhnrYs/cm6FpuczE6xK6jpkl4kuIshpl?=
 =?us-ascii?Q?l54nLNckw4t2op/pQTb+bTZd0uEoooUFk4ZIeQFPErEI8Cs/GXGhLf7igueQ?=
 =?us-ascii?Q?DcrhDON/oN0AE2AD/3gaKudU5hgH4NzWbN8sHDAXL3r16+9NSs8gfYUi5TXx?=
 =?us-ascii?Q?Cfngl83/ymglkTzSZ05hqPXXJm0HNii+4kjmBa4dxVnRrYeWO+uAS/ynbyRT?=
 =?us-ascii?Q?5jmsTLQE0obeQ3qI/Vgy9vuBvgZnkhvOAFHJhyMxLjq9NpHLCkTKhHd/mz0U?=
 =?us-ascii?Q?djDqvru/9VLCUyQRMddI7U3QPc3R6WiK4iKFlkGKhQxptTOPu2nr2IQtanH9?=
 =?us-ascii?Q?zzo6pMiAQqMWp7+io4NIfAC1plwVInVyzZea3RrHYJzkKN5rbUn5lSKi5l6F?=
 =?us-ascii?Q?6uHx+Fr6B8kSgEbEaV55WKR4YziTNpbPsXWfqNmRXDyqSZmtSdCsmv9Tyrur?=
 =?us-ascii?Q?QQ8bLcuUD9VQ/05PyZvj0gtWpB2pF8aXO/xJiuQMzB2SOGmLXZ0LMpEfA5Mq?=
 =?us-ascii?Q?PI9xOfq55v23zO9rXZVjYPVz91pcfQowJExMSOal7iS4KqFgaJSr011f6Mjt?=
 =?us-ascii?Q?o/V180eWzlTViAikHHwbyhcfP++5lXYnVDrit8tdM91GYjPn5rMV7FkiRCS1?=
 =?us-ascii?Q?RPbLhMmTeSFXrPBEFtrhsZ3wU7J1QlO/6NW2Kw3r0Ck+B2qtX8THG0+Mb08S?=
 =?us-ascii?Q?6rysrWTA+Z12JAsjErsn8yabRbFUEYNH7LYYxVIclESU+hdn84d/E0HwQ7J9?=
 =?us-ascii?Q?f5ZJDW+VILgecEDlJjpjeX03FINWSI3OXOyEW7x9dtOAeuY47iPojKDlbRRR?=
 =?us-ascii?Q?56P71jVRP1aSlJTlr/w7a0pPHuCApR8bMlvMjf+JPla4RzSaw8SKU74JHCOD?=
 =?us-ascii?Q?2hG+6LR2XCcpuVF8ULlQQ8/m2XlIYf3rCamsRki1EqCOY/CXGcUc6+RODCN2?=
 =?us-ascii?Q?Zn79GLGYYmi2SLY75AqfRSw/ctm51awzJTwWHHkVy9vbY4B0twwBWo9wO4JE?=
 =?us-ascii?Q?uy5zwKZoNlZor48e6g8suQd2Y1LrQK5ogjI0hw+/WFaRtQVSB46xBQ/HuZ9P?=
 =?us-ascii?Q?0d2i3YEBS7h9R/lszyYOF06wDIbL9T98UdS43g0NA/OrPnAY9EvfPleGD8Pr?=
 =?us-ascii?Q?m0NiLKAJmzFw2Zi1i42IfF6ldZ0IYELVBeG3R43xsx9gnU7WHjgccsqO4q5W?=
 =?us-ascii?Q?pIQ5VME+KuL9vO8O5EIXswUGeiSAuL4ogeIYDtEKcLJBLiGPZ0gwzE4flbH5?=
 =?us-ascii?Q?TStApNcZBQcAo2AQeFiqMsqTK3/FNpjwiFlPADCqwrJYFlyxhGXD4W2xZmaT?=
 =?us-ascii?Q?M9pPIiA4PBhjicUmliBK6sfgQ5byaEKM?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 08:52:14.9413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c39a8fd8-5e98-4211-bc51-08dcded1af64
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7071
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

Remove the space in the compatible string of adm1272 to match the
pattern of compatible.

Fixes: 2b8d94f4b4a4 ("ARM: dts: aspeed: yosemite4: add Facebook Yosemite 4 BMC")
Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 98477792aa00..7ed76cd4fd2d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -284,12 +284,12 @@ &i2c10 {
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

