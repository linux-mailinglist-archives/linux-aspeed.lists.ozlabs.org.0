Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0254881B05
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 03:14:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=0VRPZXN8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0TYh3QqCz3vbd
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 13:14:48 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=0VRPZXN8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::621; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20621.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0TXm2QMLz3vYp
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Mar 2024 13:14:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCjwuB/K8JUtvs4xvHODN17ysU9mz6CepCvF+xQLwV2f08eRUeysCP8aK3QV1k8gPTVeNf18/iphmC0EQS2qp25yRipW0ywecIC0siFQXcdwVfuNoLsnShz/l8T9+xchsyEWnFIZbVB09zUzI4sU7No9hxdzbh6Yfm3Hfk7az1UFQ2VGRKY/yparMBBDfQkwHGDG7hCEF7svxEcndErkGwjMd+7NpPb9n8nWm/y9XBxRJtNVIm1B9sBRag9bV1vpmV47wtXss2FpLqpXYLBWywDhlIa7jF7Fo5KZSDvO+vXm6/5ucjE/XUzsKYsHbzpHLzVewm2VOWQd+hCYsCnRxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6nf06x5xWOlcO2bdyMJICgWSfEMSlRC7fbpMNNkPn0=;
 b=A/Xzzl1cuCMc45T5NYPj8HvOwqL+UcH1lD5BLDBdncvKvuCOHMY4df2rWwSxNTYR3WTXb4AQHbJZCpaJiuJNdD5740HLi9Zn6HbIWCFEAx/bgc0DMYC9uJRhslsg4HOuYr8bncKKLD1x6f7yMwaFvYKiyVm5qb9s+blrrIxa0c7a21yQ8b5BZjHzR1esYvMVAveGWAc28IMiulQpEiMossp7001Lu3sQjifDNvSsXax+0VKKzv75wc6Ihpq72SNwMGdHLrf/rlETxyOVabsDDVO31iTB46LXP6coETf0h0ykM/1c9lZ9042fJq42EmytsjdEarYTKEP6LNWxJMtdZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6nf06x5xWOlcO2bdyMJICgWSfEMSlRC7fbpMNNkPn0=;
 b=0VRPZXN8kV/lnuBaAOE2Slt8/EVJj+tYOhSnbSY4wxY2zP2gMHfxO2q6R1JqJSYU61lN5d5+PJsgicTebBDgL+kizSu+y1Iol0ee11YUx+jDkM6zW0vepvT4BzLmBXhZ1yINeSgKwR5CABY2MuP71AoicPqKpLayhOuOKwd8al6wQx1sOD8DXtSugJnP7WnsCq53uCMDSOPdbkzfJdwNnmc6TbtBt2jlnTx7MevIMOYo+PLZ9krYGdDyaKcsKx086ECy983AO8KbZS7XuNjbW37zrvDkcTw4/UaWHyyuE2BISjFCrl8fAMzAn+X1+xmCRYHgrU6DxdKMFVy79gT9lw==
Received: from PU1PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::20) by TYUPR04MB6672.apcprd04.prod.outlook.com
 (2603:1096:400:35d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.34; Thu, 21 Mar
 2024 02:13:42 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:803:15:cafe::b2) by PU1PR01CA0008.outlook.office365.com
 (2603:1096:803:15::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28 via Frontend
 Transport; Thu, 21 Mar 2024 02:13:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server id 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 02:13:41
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v7 21/22] ARM: dts: aspeed: yosemite4: support NIC eeprom
Date: Thu, 21 Mar 2024 10:12:33 +0800
Message-Id: <20240321021236.1823693-22-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|TYUPR04MB6672:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a7f94e1b-c64f-445c-47ef-08dc494c8764
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	5FCCJxuD6rGiky76xUc4vDTpLAB5Jh1z4KAi3OOzqI0Bt5UcHGoDdUq9S9KHPsyDB/p5eWO3T6zGViC2Mhju1qKXg5f/ioqfK4khr+XJafrE9IxpkOrCYmdbodHLjw84PvkfOpICgkdWom8dRrcMkarkNLzECaCxZp1dKt1Ggmq79TkkUN7aPhsWbf6UD5TVJpo5bkQNNrT6DuUH/8+MFzUfrOtGwisn9Mz2gSoft7Xi/FejPwWTFX39W+c7XNMXHqQFEagzNT+9FXxGpm3YqkV2t9VIAHHGl2WJCHk+dOqSp0fDG64YuzhmzF7sFX3o3FXjaM7nmB82Wy8YHnnJx5Jx4kd7ot7bY18etyhn47QAcPsUekKHA5XuEIPETo+NQbzcNafjwD+jW6BAwld7xiZoA4PsbQXIPYRVVV5CaJZ1QjrrdSq6X2NHFbqzzgL1C4oeQRqU6Fluo+yZi/ONYQNdOzUmjFfhkOFAAvTpIOHF4QGV4DW+uK2mbyR0P6GhGh3zvz41G/ojaypooJaLINqmqpgYZigdfT5HtCOM5UdZaDzQdG38+jm+aVxC79O1G//yST0GBY4dSYRh7V0VscOB3nvftAFlAswL7la5hEeDHNoguFkfVCmR56O8V6qTy+VnGvDMijnV2DY1W7Y3RsVIhi4YpEy+8qohu8YY/8knQ4CDs/F9TizYH+5egQIA7H3LHrNkkjARGUVV8RGUSIIHCwaul+nJjkceGkuiee9L/RAFu9dar3C2bE9AsDLG
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 02:13:41.5574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f94e1b-c64f-445c-47ef-08dc494c8764
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR04MB6672
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

Add NIC eeprom devicetree config

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index d2ad6c8ea165..c7bba7d68ce1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1330,6 +1330,11 @@ temperature-sensor@3c {
 				compatible = "smsc,emc1403";
 				reg = <0x3c>;
 			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 
 		imux25: i2c@1 {
@@ -1346,6 +1351,11 @@ temperature-sensor@3c {
 				compatible = "smsc,emc1403";
 				reg = <0x3c>;
 			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 
 		imux26: i2c@2 {
@@ -1362,6 +1372,11 @@ temperature-sensor@3c {
 				compatible = "smsc,emc1403";
 				reg = <0x3c>;
 			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 
 		imux27: i2c@3 {
@@ -1378,6 +1393,11 @@ temperature-sensor@3c {
 				compatible = "smsc,emc1403";
 				reg = <0x3c>;
 			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 	};
 };
-- 
2.25.1

