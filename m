Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C9C878E95
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Mar 2024 07:17:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=cRswmvtW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tv3Mw3ns1z3d2x
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Mar 2024 17:17:32 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=cRswmvtW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::611; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20611.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tv3ML5Sstz3d26
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Mar 2024 17:17:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzZf8yLzcYNhwNyQYq+NoYRskIRe48YBpaRjGlh+6o97fXpxhNmbs3fcMLBM3Ree2rNPqnTXDiO7TB9bt0HY/8ewFtONp08yg0akPsKMr0+zvBixhbFuLq7+UibFWLOYAcBOeHUrjsJJhkicSUxD0f9EAVp/od/1xgEGLDz1grWOTQly2IqIhWrHyAj2ZkFGcMb8/K56lyAekYFTJ/yRCQM/F15zWJ3NehvuBe5iiTXjUu94OpUjWvsXJ2ji6qDRdwM5MmmKs2JPC0FiX2pJF0SLfsgKXzQQLYYzDZv+8Ra8uT6UqVExl3W1eXaMA9f1Tl9J9j9LjZZ9su72G1ndBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hXRdHGT6gclcd6zL4e7K9sLHTZfQudcpy4r0rsZRUc=;
 b=cfrc3Lr83GBE5rg4atYJvA/YhVWqKvLeSeskpjZQo0Pf4evhUK2dASl4C+g2hIInU56a3jdiEMZ7c1zHSWII6JUo99XWLwLmFT5MqQIkyRlPBlYpHTAAtw7UWHb6Vk9dKOfclsnjKjixQURnmk/WX1mAW4PXq+EP2WpBjF22kB1GGT6PdpzITdkbLJFqv2SgX1ooQN7L+wRqTydKEBSazcNhnuDFFup+Fmu/5S6yNQUCt8n/OWMefCLSqWctX32Vy/bdNumhqEzBYXZj8Ia1JkgVit/u5Vsq97qgDslenWbckVntLFKR3BK8/kRxqzFXjTOTzpoi+Xt3tVvzp16VOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hXRdHGT6gclcd6zL4e7K9sLHTZfQudcpy4r0rsZRUc=;
 b=cRswmvtWF5oLGzf+Y1CM0s08XVZzV/w3qOoWvZNdf/5l2XOT0A2OJk/ovl7L4iqRlTLxEloEGpMboQ9q6lbgHBw/iUeQnMu1wjGnGZ96S0R8HoWL9nJJqgj6b/YRug/uF5goNYW+PAClegZL/5KcxT9AN9I1fVKtdiMB6Ceu5MaEylZHM6315OnTmpGZrAYe/ge625RZgjx61MvI4E/2ngP9E/BJJInYXTogUTZKclVXvbusDdO1LFlLSOHoxO/P0MKYPouc+zGFjS2j5ZK27guWf+4A2qJk34Whs7B4aPkhkEfi2GRdPCQPbLOMPHyb+BkyD9NIl1FsiVkkR+6yMA==
Received: from PS1PR01CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::31) by OSQPR04MB8043.apcprd04.prod.outlook.com
 (2603:1096:604:2a0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.33; Tue, 12 Mar
 2024 06:16:59 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:300:75:cafe::5c) by PS1PR01CA0019.outlook.office365.com
 (2603:1096:300:75::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36 via Frontend
 Transport; Tue, 12 Mar 2024 06:16:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server id 15.20.7386.12 via Frontend Transport; Tue, 12 Mar 2024 06:16:57
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v6 17/22] ARM: dts: aspeed: yosemite4: Revise mx31790 fan tach config
Date: Tue, 12 Mar 2024 14:15:49 +0800
Message-Id: <20240312061556.496605-18-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240312061556.496605-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240312061556.496605-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|OSQPR04MB8043:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e365bc82-e110-46ef-43ac-08dc425c057e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	GFcWp7WEML5pN2z/OkLMUMp0xfrl6Rvoi2eBPVuJ+9pcjOnl1nBlS2B43HECrjejh/n628bXvt3WaUkB5aeEb0WQSDjlomRlgwiYh/z+YWBQ2tJWBCl6h5rkvNh3Ikgmqt2Rkc0HLqw0PFtXc2Yv/Or8RGigtxA2HH5F9ufYsQ+vAeMm5pROGtmdoRpKJe2K7FW3AV2BeqvQ+Sdd1l0KOFyfcDvlK5SRuRFrnt0nepHck3FsHRYZlv9aG5OXndUgPsJ5L3KBLsFJ1M5dK+iueGxewRCYN1YGBKWIuPLRboh99DvgLY2NsXQJp/ru6Qt/KcTA3oN4CzAYnTUwkp8MQtisc2mPNuQtfr4SKdHbEzZ6j8mh0wADeACA14tToyEtNqgaWpsbA+zH08BaEnz9k4mU3gSXFaizvkLPPgAuIVFkfCkFvHQDVWDmTmIuA12oKMbf4HCej8t/YBJqDwoscrKBQc6MCbnLUUqRlQCdbrJAotnm+afndOle0TVt6dO09Hi7nTmzIjVg1Lp1hWDtkPU5Wn51FoA2POtWYXME/Vs448Q7CILF9TM1lxzeJmZZ7L+DnN+MZ/X6BCxXGbMLtSgi7KdRx8fUnVProhfqXAjxdLPDPZcCx4aoqulOVdl9Yh3LsyGvxPxMkFp/eQQvSISDf3ApQozky8txTwgNQrkrLFW4N/J17Mztui24Km9cdZV4+CHlmZDQY/0aRjkP2l/8PgzLtVf2raFxVa1QY7txOAJRzZMYRBJJ+djINrvb
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(376005)(36860700004)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 06:16:57.4165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e365bc82-e110-46ef-43ac-08dc425c057e
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR04MB8043
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

Revise fan tach config for max31790 driver change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 48 +++++++++++++++++--
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 1b91821b019d..ba7db2693277 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1095,8 +1095,18 @@ adc@1f {
 
 			pwm@20{
 				compatible = "maxim,max31790";
-				pwm-as-tach = <4 5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x20>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
 			};
 
 			gpio@22{
@@ -1108,8 +1118,18 @@ gpio@22{
 
 			pwm@2f{
 				compatible = "maxim,max31790";
-				pwm-as-tach = <4 5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x2f>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
 			};
 
 			adc@33 {
@@ -1145,8 +1165,18 @@ adc@1f {
 
 			pwm@20{
 				compatible = "maxim,max31790";
-				pwm-as-tach = <4 5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x20>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
 			};
 
 			gpio@22{
@@ -1158,8 +1188,18 @@ gpio@22{
 
 			pwm@2f{
 				compatible = "maxim,max31790";
-				pwm-as-tach = <4 5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x2f>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
 			};
 
 			adc@33 {
-- 
2.25.1

