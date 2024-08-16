Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C2695457C
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 11:25:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="::1" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=05ub2pty;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlc6S6Lw5z30P0
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 19:25:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::60b" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=05ub2pty;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::60b; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wlc6Q6MCyz2xst
	for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2024 19:25:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyTWIM8kiCXhliZDwifHDEvR3PupBJ6SK0HJG5j3Ovr5UlrGsF+YRgAmhNWcj3tnwC0mtwVLVfu/utnpoNLN3BG74HZ7VhCflnZJDH6Bh9yykeU9eoysIRBfyyGZ19BXb5idstepEHv/zYzEjdocjnuYEQmL4yIPagO/Xdtj/xvYE4ZRNXFlUQ5Onok9OBNQEpRxpMgEeK4BQvLCzKMBthowzqeiL/IQYu83Bgwe/IM3rr63cE5+iisNvf9LCinjGvdjtBdfyNBMGB9tIGU/+aa9NTGYAf9APnVwb0wXx2aKtnH86X9p6FvC4bW5WFzaFfrExce3NDcUNf31syimxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKZ5ogJ9/YHI36u51f7OMva5yJpzuLKM9pz7+UUgD64=;
 b=G8TJGoY4/KfYNbTXKDpe4Zs7gwLKAfOwSIGnzsFA4O6XiZTDM87J5vMN6H7KYzyhTPoEiTAEQ5QHyrPNJY53InfELLeice4yTqnlpK8a0pozJeiYjxArAWN/ivq1LYQn+lxtee4vRJ0JAKImpMFydpDL7PzruqH8IpbOOQU1KM470FO1+ecue7Fwl95My+Byn5IJNMD9ezQpOlLJtnAH8l6Y7ALeAzGjBtVGMeODsgvI90fr4fCy5+GQp8IciaUvB/MW4NDXa9WyZa2BZRouGKfxhBlXuahUS16A3G6heGk0EkfmjMrIfgku0H+G27FhNs5pv5P1jaG6bl09Bny/6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKZ5ogJ9/YHI36u51f7OMva5yJpzuLKM9pz7+UUgD64=;
 b=05ub2ptyAc9AAgIMIqikOUQ3DJu2aTvqyAUCtXJCvNdknrWxMnUNThtpE9huL/NuOVjcpRjLWOkRR5fx0Cm21zfwZMj/8brm+PqTrMbLo6HPofDt8yjhawVIbpyXq20lslUFwwvpCIJ2965nSh619EkgVIR0SIpt1pst0EeP65PFixx2RY7ggXHKVtI+Yq5wXyNyqcYouDU8hWuvwXG2gCrD0on58xkId3zu1x1InZMg19UEVnlll984ofgw8vHGRSZh3+lRqieoA9YB3vLpd5PTuXQJMT/r5b4kpOyi3I7ZLyCa7csTT+VuUleZGQsR0cBJOFUtdBiY050ED4EotQ==
Received: from SI2PR01CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::16) by KL1PR04MB6757.apcprd04.prod.outlook.com
 (2603:1096:820:d2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 09:25:12 +0000
Received: from HK3PEPF0000021D.apcprd03.prod.outlook.com
 (2603:1096:4:193:cafe::9) by SI2PR01CA0039.outlook.office365.com
 (2603:1096:4:193::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19 via Frontend
 Transport; Fri, 16 Aug 2024 09:25:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021D.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server id 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 09:25:12
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v12 10/28] ARM: dts: aspeed: yosemite4: Add power sensor for power module reading
Date: Fri, 16 Aug 2024 17:23:57 +0800
Message-Id: <20240816092417.3651434-11-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021D:EE_|KL1PR04MB6757:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d721b589-5c9a-48fd-7a01-08dcbdd554aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?7pa49oYdwJ0efriCl2AHwxZW7OuBBeSToUIc5InIEW+Et6+kajK3ApGeyMf2?=
 =?us-ascii?Q?HAMZXw5zg4L8Jf+mrPFdpocAAC8Cv1t6uIhnyTMYxIaFCppTHUNDJ3Ffu4Hp?=
 =?us-ascii?Q?JJgKT4U6h224Sdh2rO8duYVkigOtklE80oM/380H31/KdyIIAINmEQNASSXU?=
 =?us-ascii?Q?0KPIEF2Dbnxs0a1+UPTXIn9rdHH6QFPVEQirCX6iwkyciHWNjmB7/MqH7fHJ?=
 =?us-ascii?Q?tT0rkvN0gb1cMdvftzYkG8zb+3JW5VUGpLBLh5vkc5Wfe6tf2T6D0qqwma4n?=
 =?us-ascii?Q?tmklujk/WcugIsC6+fuimKoX47mnmWmIxknuGhlNoFFD3UxfOlMArMINxKLW?=
 =?us-ascii?Q?knmWhm2uncRfEfMPZQ5V+JROVz63C0/5NRHV3i2Bj1pCizcp5kZDCZGHQsUg?=
 =?us-ascii?Q?eoArL4CwdGoIa+Axa5fJbtJw4avMZT6JESsmIdrJMYxg3pOQsfXj04WjE0Tq?=
 =?us-ascii?Q?6Rlzo23dVyA0TWxWf1g+zwJZiIDNQ4hMs+E17QgWyZq45nL7ICPjshLDCC2C?=
 =?us-ascii?Q?bBgLeaZnHicX8BNQT/uRJewSybRjPuJ6tp5j215dpZ+1Xhd6n0eN4q1T3iQa?=
 =?us-ascii?Q?tZePoyohNLCv9XMlUBe3K5fErdCk0mPKThVq4ij0bVoejEAEamJNPObVda1T?=
 =?us-ascii?Q?M1hadDXXNNVnRdBpG3Iif4YNBYbZtXNYMzG02ex5ag0inEfJ6NvykeuG7qNC?=
 =?us-ascii?Q?RvzKkDYlxw/CGD4EySwAUr3aK8XwVv1uVkoFshAxb0yzODgHzSMTBZWgxkrh?=
 =?us-ascii?Q?1MHlsV7oEtBOBDfdCy8iN49F2MkAsJ7HgVp9SyqrOOv4VvAIix8sfrv6eMXA?=
 =?us-ascii?Q?4yGcqG9u5s2YcIbtaf7Q+PJtn9lOXgK37jjs2CUKm67o1Myo5hxlm80haix4?=
 =?us-ascii?Q?LlVXC3PdrYwb1qdZFIPxl+T1VBGnFSeM580mTx3R/6OrNkEfBWM20Ui8b/BF?=
 =?us-ascii?Q?49/pEvTJk4LKAtSVJQEA21XoUFhVVa3tgUfkNUTXUGOf6TYIOlK3Zj2PNvD2?=
 =?us-ascii?Q?0yu9knNLWzFXsg7u0MdkhVql6IArEYhyfa+0ipoo6uLM59iIVtJnEOQsoJm8?=
 =?us-ascii?Q?TIQbDsc7DyOLWD0gqbX8JQuBLsFIo078NQcvDqeMmUwjfE9ay0882GEA22Ll?=
 =?us-ascii?Q?kV8oU0jxZob1Dimlty3Hnnkk2uThQjPghqVUOMnLwFqXpTkrvvgCnDtD+2Pu?=
 =?us-ascii?Q?yRTwF6KFDHknxKEYUhDoSQO2vIVT8iL6yxVVnIMODl8V5nvA6esEhPKOsno/?=
 =?us-ascii?Q?ES8E2olVHgf6VlbitoLODYgb3bS6Few5YZUJ7VQhKWtj3H9rOSTJq8xu6MbV?=
 =?us-ascii?Q?onmUWUQdzygKXIrUNZltD0h+tTbUKeksvB4DmiB1GPbd9R/PbRO1GfhPEPDj?=
 =?us-ascii?Q?10jRzTd/MPWXkl6AZ+IIJerE5/i+sgQwarSDp+8uvprmkTkmjABS+kFI0+Qm?=
 =?us-ascii?Q?2VvDN0HrmrL4Z9Zeb54YseuI0rdmk2tV?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 09:25:12.3722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d721b589-5c9a-48fd-7a01-08dcbdd554aa
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB6757
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

Add power sensor for power module reading

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 09bbbcb192f5..139a09de24cf 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -906,6 +906,11 @@ gpio@23 {
 		"HSC7_ALERT2_R_N","HSC8_ALERT2_R_N";
 	};
 
+	power-sensor@40 {
+		compatible = "mps,mp5023";
+		reg = <0x40>;
+	};
+
 	temperature-sensor@48 {
 		compatible = "ti,tmp75";
 		reg = <0x48>;
@@ -930,6 +935,26 @@ eeprom@54 {
 		compatible = "atmel,24c256";
 		reg = <0x54>;
 	};
+
+	power-sensor@62 {
+		compatible = "pmbus";
+		reg = <0x62>;
+	};
+
+	power-sensor@64 {
+		compatible = "pmbus";
+		reg = <0x64>;
+	};
+
+	power-sensor@65 {
+		compatible = "pmbus";
+		reg = <0x65>;
+	};
+
+	power-sensor@68 {
+		compatible = "pmbus";
+		reg = <0x68>;
+	};
 };
 
 &i2c12 {
-- 
2.25.1

