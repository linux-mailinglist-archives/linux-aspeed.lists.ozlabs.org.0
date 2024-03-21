Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 436B7881AEA
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 03:13:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=I+wMsoKi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0TXG0MHDz3dXZ
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 13:13:34 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=I+wMsoKi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::605; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20605.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0TWt25Fwz3dTs
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Mar 2024 13:13:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KR74mHQpcf2fGLzzKW8cgRYBLGKtCfGAjRUfyYZ6G/+SHPcKLo8/N8GvGIrr2auNt9okwGPlT2tkxFZhuYII3n0GMenZWFLPFfSG9pob/cADRxZpYLcZ0Jbs65eUAwVvLXppPP/NL0kxleR7ea8GBYzVy947t1fxFyTzbEV/7G738wTFzj3Wi0hLzu7xe3T19ujt1qSAsKqoLI3f7sFTm7JwcWiVCEMbFdyQ7vLnjEvhhWOssHyLUrTx0qj1qz/51lQS0LSlUUj7ajbEP4mmsIufHApyAGJQurKwg/42juQPQpvWvRJnVgsHQ3/KqwUTZJWCfrz/3svDRWWS76b2IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+rCbKa980zvtFSL+aiZSLIdHmQc5ZtQwhUuhOWMtss=;
 b=ghCNvsRsuXH6ZN9qCu2qrCv/F0YXFTwQ4VGRN/RunPcIXq42bYrtonhluCynMm61Q/woIFUHH1Pod5odG5eRnOoC1G7ZSmCyqpcZO/9ivCyXPFDFHcdGfCGaTk/TLYbrv+T2ovnmW3KlNcgajc8NptmHXmAswfCbr90Ci7euLMs+rIa62j6R9u+hnKSxK7dguBxqcpr3x4fBfhfzTcKHnOognRWunzVkEBN7R9g3Mj4RiVL8achhh75mfJfypV8xi8sz+Nit8ma1m9Gtml/BhnFz9yuo4RN2Ytksh5iUunQLSQ6NdtuoHcAl8zYpaGX5JS98jKoqSwSdRIR8K+Os7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+rCbKa980zvtFSL+aiZSLIdHmQc5ZtQwhUuhOWMtss=;
 b=I+wMsoKiYsxqEbwgHVRiuhKN0x+Rx7nKWYBx1RFxkWn4gVIdo1yzGVKIxs4Njd/PSNQOpjoCQplrQ+d+MGpzM4UbVSVbdebqpO8qHdRuiKBfarj0a0Yxr0NM4OLc3j+CkRmloRa8AtnNmsvRvywSVSK5SycLOh0bmlqDbc27h4lIrCv9DYdgWdTXX/OhUUjenhLlhLa1f/sG2ItjZD179q56G0s6OtkRTBWYso5So5gABd7q1RPPCRDysetdTa6nnbCu9C1YChCT7ie2j4p1vAV5IqaqEH+DmGgp9Lpq1n6pJJbqsjJ8ZjUBKdjvVxS2WhVeaSqoih93XmWw0MkMFw==
Received: from PU1PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::20) by JH0PR04MB7943.apcprd04.prod.outlook.com
 (2603:1096:990:99::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Thu, 21 Mar
 2024 02:12:56 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:803:15:cafe::b7) by PU1PR01CA0008.outlook.office365.com
 (2603:1096:803:15::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28 via Frontend
 Transport; Thu, 21 Mar 2024 02:12:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server id 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 02:12:55
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v7 05/22] ARM: dts: aspeed: yosemite4: Revise quad mode to dual mode
Date: Thu, 21 Mar 2024 10:12:17 +0800
Message-Id: <20240321021236.1823693-6-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|JH0PR04MB7943:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7cdd5808-378b-4311-93de-08dc494c6c1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	WISBBR7BvLxxJtpz9wWl0TZ0cpK7wckKbu8ktU/jd9ySRIQ+nIA88tV2AIeOGFpSinovneuDuLaGD/nL+r+y/SH2ENPFePMiOFwJrFYzE+sLoHNLr2gN4XEwadu9M7RXGS7kUrsHbaygMKDDIDU2775Q1waWFgECezPE5aDd9s7PvbtYqrkWZRsPr0QwQ/GbvLWqnTspM4yNolQusnZwTKgp/iHGGcQ9NcY11fDv6EeMif4VYvz1dMFV601P0pvodWeRSEoWtL9XN8nAFfcXThSTjGS7/Nj4AWNLP4NJXAjwTMCrbUJMkLruqGNl2y8q0OUyY48F95BL0csRqmnsBltXgCF1h+had0f02x1Pu6f/n/hkLjZwLbPdT3g4LZszbXUbZp54VvywUkbj0fjagoWtUXO9lkR/hELpvAn6s+1Y1dhA1S5t8B8piKia5abLtGzbOomzWsepo8DtVRCeFyrRBRYdg2hT+jPrDSoHIpDfQJaWyRBs5pI0AyNXug6fCSmpVUFSiLoXPFgDaPwHKRSsoWjHmlrM0a9qQQ2umL7oX/69yFi63qLTjafnk7ALs+/oiJREulDDmwDorwwJPqWz8gRNUm5ifFqhzH/b7lK+iesTQY4dN+zFtxYh/5tUIQ7jJyG+/lpiAiN/BHFANvUiZJzBLy6HTO2/EzHdqDx7YmMrgxMUJSzROaD1l/oP5u1UOwLrKQsYcd3kgT4/24FmRGmd+ZnKZVJmd5xJutP0DytA/XSg0pXBjRYS46gN
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(376005)(1800799015)(7416005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 02:12:55.7603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cdd5808-378b-4311-93de-08dc494c6c1a
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7943
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

Revise quad mode to dual mode to avoid WP pin influnece the SPI

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index f8bfdefbefc6..23006dca5f26 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -149,15 +149,17 @@ flash@0 {
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
-		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
 		spi-max-frequency = <50000000>;
-#include "openbmc-flash-layout-64.dtsi"
+#include "openbmc-flash-layout-128.dtsi"
 	};
 	flash@1 {
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc2";
-		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
 		spi-max-frequency = <50000000>;
 	};
 };
-- 
2.25.1

