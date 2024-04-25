Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D78A98B1AAF
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Apr 2024 08:07:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=ay6JBWHJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQ54Q3vtbz3dDM
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Apr 2024 16:07:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=ay6JBWHJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::615; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20615.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQ54G6f0Dz3dK6
	for <linux-aspeed@lists.ozlabs.org>; Thu, 25 Apr 2024 16:07:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8WbSc+tHTxqxiiKymnBx/fGcEzbouJ32G+gy6LT/xploYRi63ngsmoOrFHDuoGZ1RBmEBTlxizylPpDfo2pFTbjv9V9SarzfJT+O4kLDoQbYcL2xNVBHV03X7pqXUH24UsnZcMi1+jOZR2BdNXcGnjmJIbhuFBQN3ug3ecTsnsQU1nfkeJQZNBF8fzEUbK7pOj57q3Vf4p0emA+WPGddE0ipCsHZXZbod+tfYG8J537Omw8yYNb9IYHeXsVQ8OCALbR3H3jit/zVRJj+QWNREWX2stt5LOsHlf4eZ+MCO30wAIHAAWW+FuuCn9R7EzbPTbnKs/R2b6L9yQMnjTgtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhKd5eugbyroswwz7UaRSsSWJlu4McTkV2n49tT+a+k=;
 b=ikeVoz0xQs9y0yepvR36O3dGjc1dLug/DcXgFtyqicMw9eR1mMZ18HQiFxD4KZB1+GUinHu22bgVLzvM26RXn1GJlnn0jEsLMnQdIsiHsxpraIXBkGk6J3R4cIPn5ctHo6h8ihjQ9sOZrDhIvn4MirrjG0FWMKD6Png9BbuFclPKreB59/cDcttjMpsn5G3TBw+hChtD6zBk3yQplrS4JdNsG/5nyONmHcPLw5QGeiqbCHGopMBE0+pd1zeBOyk7NWqHiyf1UasDbYUUp7qjWOmkKPvNoqDK6Upra6KxdW7859Lll12F1K60V3KCAWuwfUY2zd6IQSqXuy2siw43Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhKd5eugbyroswwz7UaRSsSWJlu4McTkV2n49tT+a+k=;
 b=ay6JBWHJ9bSXJvf3ejxAcQ9DlyjmBvtNosHY/qc9qeFrg3WY/boXCIfeE0MlwQkgunGfr3ugdp3IpBIKNcBioFYWFV8tEVj2z+21md5PEQcAv3fDA9zAvzb3KqDcKcp+PRQgmm3uVQVn0K0ea6Mo8dY390hwSHdM2REgO0mqbh6cuZ7mr4OBR6tP3hZ9Ax2FkTn7LYfvQs28c/wKv/9CPtzKWD4pyzv+G+rkc2NycFi+49hUCuKJ9LZFKnVhGCgSt3VIuKIb5dHOULUJubET4PjfwiYEAYvfueC5b4sIGjtFVR5pRVP0NuGpQKSJN+Cfy12Mo3FpqP3uF+NKCsi4fg==
Received: from SG2PR04CA0209.apcprd04.prod.outlook.com (2603:1096:4:187::12)
 by TYZPR04MB7132.apcprd04.prod.outlook.com (2603:1096:400:44d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Thu, 25 Apr
 2024 06:07:24 +0000
Received: from SG1PEPF000082E5.apcprd02.prod.outlook.com
 (2603:1096:4:187:cafe::8c) by SG2PR04CA0209.outlook.office365.com
 (2603:1096:4:187::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.25 via Frontend
 Transport; Thu, 25 Apr 2024 06:07:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E5.mail.protection.outlook.com (10.167.240.8) with Microsoft
 SMTP Server id 15.20.7519.19 via Frontend Transport; Thu, 25 Apr 2024
 06:07:24 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v1 2/2] Add nct7363 in yosemite4 dts
Date: Thu, 25 Apr 2024 14:06:25 +0800
Message-Id: <20240425060626.2558515-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240425060626.2558515-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240425060626.2558515-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E5:EE_|TYZPR04MB7132:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5d7d6c7e-4b38-42f6-c74a-08dc64edfa36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|36860700004|1800799015|82310400014|376005|7416005;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?r2wibwp52lCUxka1Oxullj4jDc0nZ+fLRbaPBlwbtlZTVjr4FPB5ra8H7JUM?=
 =?us-ascii?Q?a7tNquuhGmBSCyYGRKr1LkIWIqEF3UaDCOYTUTOCnUpq0sUdVTzQryxQbrs7?=
 =?us-ascii?Q?RPav3tDReM7QVD04O0v2NfyEDHhBeyELkXZC+p7Jx9szwLAfYBUSmo9qCezP?=
 =?us-ascii?Q?bIpPf7q1lhbg1Q+2Mp0CBExLQ7k4wgyPwmmcTDob/bEAMK8qWPi7gSAtA71S?=
 =?us-ascii?Q?CZycsl0zcy3MQ2VDN0RIVKD6q7/Lj4/LQOs89MCrQHz9QIZZEGpYOAs6p+AR?=
 =?us-ascii?Q?12N9uHo1gc9KyRd1WUEHAS9SBnW/qN+RAIKP6XkHA8jATcKN5Z6dV2MFzqUp?=
 =?us-ascii?Q?3u650xFuqflG0uoApA/pvj7jk2iKIf7lFwMpl7mPtyrcn6c4aZ2gviH2VBOE?=
 =?us-ascii?Q?24yP9itnAvzV/5dj5H3UOM46zWSTUVJhsW3T5Qw3cj/Y+Juk2nL/BPn2sBvs?=
 =?us-ascii?Q?TC0fjuffIso6EmtZviR55K2CJeDrNxYXrEQaE0uvLCbg91j6A0xcU8+ShLqw?=
 =?us-ascii?Q?hCkXr/XhYUPg/CAXHH6UykvSBJPO2B3UNYubttheQvN93ot6Zr6H4GMgqHfu?=
 =?us-ascii?Q?b5kAFHLAe1+ujfkSoA5uuwcod8BsLihvPnnND4KX696zEynZaZbLtyxhDG2n?=
 =?us-ascii?Q?Zy75DQZCgEziXZpQ7eywEDmvrKHKDifVIUYnCD2oR6cDlXiDiiaFweTbMo/X?=
 =?us-ascii?Q?xyxoDU5SepndKGO2yJ/oBzFGQYJS77bb+pzVOf7SKkxSNoti9EdisD+Ac7dI?=
 =?us-ascii?Q?D1YC8bBKfxgRMJSVS5YioLHUaQ3lghtz6RcN4+PWb61mGvAdT7kxfnF5oTNK?=
 =?us-ascii?Q?dKEJ70zzJkpvq/7jnDV2EJanQp0s9H/K7NXg6jJUSO82rlXawfsU1jcMtX5n?=
 =?us-ascii?Q?lhWCrbFG/w+LNy0HP8eNI1IUiRWAAXwxEM6G43uqq1EFpw8kjWTt6vyB8E2c?=
 =?us-ascii?Q?8mxdOJC50KZA2tClXZPjaJVltIwqcRdHAcNcqUF5EPnLmubwKFRYm2ZgEqLK?=
 =?us-ascii?Q?ePjZMmjhounWze10NUSo2Uv4o9GYI3o0/01FDW0RNCeEKS9dgBq2Y/kNQQ+S?=
 =?us-ascii?Q?Sqh+/ffkfGIwgewuBWk+IhXuc2ccAyNwwghvWyhozKQ9WdX1cg2qdjIyILdZ?=
 =?us-ascii?Q?mkeqDWQAneCUuililCZ/zM2/eA3SCKfDQHWSlOui4fxyADpTa5rQm6eAGoCU?=
 =?us-ascii?Q?omXvLKnnfGcsIreU37FFR/F8oCtI3hc+VCiyz5bFN948zbPg3LlWHhVTDUyU?=
 =?us-ascii?Q?5bHBUXAOI1m9QWh4HZLTyh6Tx7OgJJmFkRBcpcNLD+7nHuBxA6WIE/1cmt8j?=
 =?us-ascii?Q?ihwY9UeK44lPR2laIV6wNLrEbWtUpCfIuaVhzN5vUldhogiJUKECJEImiQlJ?=
 =?us-ascii?Q?J0+NTLw=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(82310400014)(376005)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 06:07:24.0344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7d6c7e-4b38-42f6-c74a-08dc64edfa36
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7132
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

ARM: dts: aspeed: yosemite4:
Add nct7363(0x21 and 0x23) in yosemite4.dts

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index e45293762316..06b709b0a706 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -467,6 +467,42 @@ channel@5 {
                                 };
 			};
 
+			hwmon0: hwmon@21 {
+				compatible = "nuvoton,nct7363";
+				reg = <0x21>;
+				#pwm-cells = <2>;
+
+				fan-3 {
+					pwms = <&hwmon0 2 20000>;
+					tach-ch = /bits/ 8 <0x00>;
+				};
+
+				fan-4 {
+					pwms = <&hwmon0 5 20000>;
+					tach-ch = /bits/ 8 <0x01>;
+				};
+
+				fan-5 {
+					pwms = <&hwmon0 5 20000>;
+					tach-ch = /bits/ 8 <0x02>;
+				};
+
+				fan-0 {
+					pwms = <&hwmon0 0 20000>;
+					tach-ch = /bits/ 8 <0x09>;
+				};
+
+				fan-1 {
+					pwms = <&hwmon0 0 20000>;
+					tach-ch = /bits/ 8 <0x0c>;
+				};
+
+				fan-2 {
+					pwms = <&hwmon0 2 20000>;
+					tach-ch = /bits/ 8 <0x0e>;
+				};
+			};
+
 			gpio@22{
 				compatible = "ti,tca6424";
 				reg = <0x22>;
@@ -474,6 +510,42 @@ gpio@22{
                                 #gpio-cells = <2>;
 			};
 
+			hwmon1: hwmon@23 {
+				compatible = "nuvoton,nct7363";
+				reg = <0x23>;
+				#pwm-cells = <2>;
+
+				fan-3 {
+					pwms = <&hwmon0 2 20000>;
+					tach-ch = /bits/ 8 <0x00>;
+				};
+
+				fan-4 {
+					pwms = <&hwmon0 5 20000>;
+					tach-ch = /bits/ 8 <0x01>;
+				};
+
+				fan-5 {
+					pwms = <&hwmon0 5 20000>;
+					tach-ch = /bits/ 8 <0x02>;
+				};
+
+				fan-0 {
+					pwms = <&hwmon0 0 20000>;
+					tach-ch = /bits/ 8 <0x09>;
+				};
+
+				fan-1 {
+					pwms = <&hwmon0 0 20000>;
+					tach-ch = /bits/ 8 <0x0c>;
+				};
+
+				fan-2 {
+					pwms = <&hwmon0 2 20000>;
+					tach-ch = /bits/ 8 <0x0e>;
+				};
+			};
+
 			pwm@2f{
 				compatible = "maxim,max31790";
 				#address-cells = <1>;
@@ -537,6 +609,42 @@ channel@5 {
                                 };
 			};
 
+			hwmon2: hwmon@21 {
+				compatible = "nuvoton,nct7363";
+				reg = <0x21>;
+				#pwm-cells = <2>;
+
+				fan-3 {
+					pwms = <&hwmon2 2 20000>;
+					tach-ch = /bits/ 8 <0x00>;
+				};
+
+				fan-4 {
+					pwms = <&hwmon2 5 20000>;
+					tach-ch = /bits/ 8 <0x01>;
+				};
+
+				fan-5 {
+					pwms = <&hwmon2 5 20000>;
+					tach-ch = /bits/ 8 <0x02>;
+				};
+
+				fan-0 {
+					pwms = <&hwmon2 0 20000>;
+					tach-ch = /bits/ 8 <0x09>;
+				};
+
+				fan-1 {
+					pwms = <&hwmon2 0 20000>;
+					tach-ch = /bits/ 8 <0x0c>;
+				};
+
+				fan-2 {
+					pwms = <&hwmon2 2 20000>;
+					tach-ch = /bits/ 8 <0x0e>;
+				};
+			};
+
 			gpio@22{
 				compatible = "ti,tca6424";
 				reg = <0x22>;
@@ -544,6 +652,42 @@ gpio@22{
                                 #gpio-cells = <2>;
 			};
 
+			hwmon3: hwmon@23 {
+				compatible = "nuvoton,nct7363";
+				reg = <0x23>;
+				#pwm-cells = <2>;
+
+				fan-3 {
+					pwms = <&hwmon3 2 20000>;
+					tach-ch = /bits/ 8 <0x00>;
+				};
+
+				fan-4 {
+					pwms = <&hwmon3 5 20000>;
+					tach-ch = /bits/ 8 <0x01>;
+				};
+
+				fan-5 {
+					pwms = <&hwmon3 5 20000>;
+					tach-ch = /bits/ 8 <0x02>;
+				};
+
+				fan-0 {
+					pwms = <&hwmon3 0 20000>;
+					tach-ch = /bits/ 8 <0x09>;
+				};
+
+				fan-1 {
+					pwms = <&hwmon3 0 20000>;
+					tach-ch = /bits/ 8 <0x0c>;
+				};
+
+				fan-2 {
+					pwms = <&hwmon3 2 20000>;
+					tach-ch = /bits/ 8 <0x0e>;
+				};
+			};
+
 			pwm@2f{
 				compatible = "maxim,max31790";
 				#address-cells = <1>;
-- 
2.25.1

