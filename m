Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DD9959743
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 11:42:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WphG00vkqz2yQn
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 19:42:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::628" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=mXryD118;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::628; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WphFx3k3Sz2yDT
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2024 19:42:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FoTIrVkGcyviKpN89dsN4w1KDPuHGcn1IIs7gIKKWRx3GPVYKFIzyYoCRKy8sLWWsefLaJY0aI4jiyNMqV8PcdYePQ9AVpTmyYzvXzu1oXqx75xHO42qNpe1uiOx8EBdyplwnbwiJ0VgsUzs2HaklSZHgC+YfIU5tyRquP82wqEO104+AJfnPmQuDAk24Y49s2HrBbp4CDvFADG5eJ8Q9ak8lTByP8qiDTs7GQ+9QNvEkOf8Hzpcf59v5xZFBbFW7g7dHmOxdurL2F6WmWqp57uVQ1N4GWXMhP7RPjFw5jVIqMn4Egt2SEEgFuo4fL5m4+JMnZwPgoh6oPm4iy7dNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgFXoaC/5DtSawXO9Z49kR8+2OHTKZslFpSvIDp6jkY=;
 b=Hcn+TMx8vV3iGIteD6FKCtHJcDaDwdNmItjbaNCR8GlvaMAmOhluo0G4KJTt5B5+4cMZ3ca1NEd1PfaH3v1EB9eEaCK/TCrXw+8qkBQhCO/V4sau65+cwv4FYqkjjGDk7/G5MUtc6SH9IdLz4r40NjSQ/34xg8cFolyF4QFueqHjsTivGEdnq4U6wrC+sIyMemx5McGJ4y2mZaEtPkgPtNRngVOe7Vf9+qeLkI1Q7WFztHnOa0QsvzPvWI5c6LOAM/cb7l2c9ivp6cBVaeVC1Yg+deG4rh2e1H3me+lFXMwQDmwqeI2/jpuTGsiZsQAqd1WEOYDVRG8Z3GQpIefE6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgFXoaC/5DtSawXO9Z49kR8+2OHTKZslFpSvIDp6jkY=;
 b=mXryD118VRLYMjM1prjBbXUeIfnV5mOccFfG1rCiF52B9Enzuzr+oRuvyMjHl6zBP/XzOstPnOzX+X30ep87cUj79mNBy1eYZycdS1DyNVUTGJ3g6hww/zTGWouBrB37mJDBFRrVqhZG+V9quPx5KBUhucL5fLL9rEtpLt0Zi2WBKGErvPhjZK+LbzK6MiT/6jXpVORpKxSbKyMSXIM/U8QWr9V999O8nnEwGPj7qq1QXQ2aP8zKMTLAByrXhVYvNWGVsYmr+VabH1jC6tt+RG/VCN1ibcaUsmcuEvz5lwlTPswzd4eNBDDuWy529O1voGfninJ0EveZkD+Ub4Oepg==
Received: from SI2PR02CA0035.apcprd02.prod.outlook.com (2603:1096:4:195::22)
 by TYZPR04MB7781.apcprd04.prod.outlook.com (2603:1096:405:71::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 09:42:38 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:195:cafe::c0) by SI2PR02CA0035.outlook.office365.com
 (2603:1096:4:195::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16 via Frontend
 Transport; Wed, 21 Aug 2024 09:42:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024
 09:42:37 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v13 17/29] ARM: dts: aspeed: yosemite4: Revise mx31790 fan tach config
Date: Wed, 21 Aug 2024 17:40:28 +0800
Message-Id: <20240821094043.4126132-18-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|TYZPR04MB7781:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: de28af19-21db-4532-116b-08dcc1c59800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?46lz9/xi2aO0T9jjxABZVaYkP9x88SeSgSE9APJvHFpq5nLbgRfd824vqTji?=
 =?us-ascii?Q?W6uaKI8B2EmOR7VKcyLZcuJsBdX34Od2XuOLqZhU5ip9EraZuMoJQYfILsaR?=
 =?us-ascii?Q?w2BVmMMq6RIrcUhlvNMjs5VG+xGg++mVP05ZixnfzXE8eNwZVX/+Oa8MwBFq?=
 =?us-ascii?Q?usrHsLP+ppppQecdqcS90N7DVuUz3Xtm/H+zNO/uWqDA10OpmpvpVxNdL02Y?=
 =?us-ascii?Q?KXnkSXRKY7aXpxNpRlvg8eZqQ92SV0tE4ps1FDXROArw7TMmy1Z91eNNXjVY?=
 =?us-ascii?Q?vv6TCuqJqT2K7zbsdgSVduQjMMUjbxhRxl0bdwVvD46bk/Zj0wSuF22Z7Yde?=
 =?us-ascii?Q?tErdFPtoV46USCpw8gMo9ftxRt3AdYYhehs6g/lZ4dipeDBybzQN8EYX5Cz9?=
 =?us-ascii?Q?n+CMGDlkN5ec+T4YgjF5AWRVAmBPen18JDxpdHGGdLoLNKHa/NxXxJP6fzA8?=
 =?us-ascii?Q?05P8c/GP4C54rH+8j5La4L9d7X2u5MJAoCL4iEgvS1/O6bW9FtugCamx4tYe?=
 =?us-ascii?Q?Dh1H6HAFbTveme0SzNVbbMrtsjhzSPTA9PRvn9y55grdiBD+PvKL69xU3YVw?=
 =?us-ascii?Q?hZfyawM/3kc1Kkj04DLov57ZzyMjmgSGRnRfAZ98tNR4w1riNdVFx98XK4HE?=
 =?us-ascii?Q?TcIJI3Wc4uBO5dSyfq/fAbtctjPXSFXZNjn7XDNrQnZTSn9sltYrsaNzx+It?=
 =?us-ascii?Q?3WwhQ1mG/Ku9wu1C7l4WUriCyi2B/8oSh5n04kWljFDU+0jwrQjAsd8l0WAJ?=
 =?us-ascii?Q?GHFlpabTQ5yRtxXAdjfnKp6jPUj5zUc7X+zXDKTWqRPYMMlJuoP96l0vtd3M?=
 =?us-ascii?Q?2PK61WywAqiSV9YJNBeNOzGvGey/rJPhflO2IdWaiL8ELs7wPniS/SfQJivA?=
 =?us-ascii?Q?TI7XOAH8+XbmOcHB+ojmtuFwwh+/hdirYfy2olElQfIrvig/E2NzEd6h9B13?=
 =?us-ascii?Q?pF0B50NURwsagPCrQH3+EtaUFdFBMPdpfkuaIZK+EAl0s9MyajGSSCswMK8w?=
 =?us-ascii?Q?EGOXET9kdgIm4GyJ+GETGKRWeWmCxKBVMGaGfbd9h5y27lwzIEXGvq5XAx30?=
 =?us-ascii?Q?4Jr3DZ11C5sdH4OZbuPputNrROQ2BSS0KtN74Y1YiNbpcKPNsqJQ3EOYUG5+?=
 =?us-ascii?Q?7boYkBiT2eScwFX6iZxDRshIvMp4I4dnQxx0XKHfwR2tuZqD0DITVcYzvVWK?=
 =?us-ascii?Q?hGCQKJ5j+cgviRoZhdpmIDUXdtpQfTdclNc17CemuhoftZY15YhZ9swkIGYK?=
 =?us-ascii?Q?Z0FDPvbbR2HBd2b43zSFImfTxnWiYEXk2ytXgUOye0V8oNoapVM0zzdIkB40?=
 =?us-ascii?Q?lGiphHt7zZD28lj1bfllZrvHhUw9iaTQpHJF4LcIQ2Wgp9C5OyKwEECt1Yvu?=
 =?us-ascii?Q?M3hwU5uy7Y/OAeX0Dy9veQO9KdZONX23kjwNIe2wAPVaFXLum4O1EtfS/UX+?=
 =?us-ascii?Q?f77YnD6avDVBXXdi7QO/ONH2U/IxmsaO?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:42:37.6377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de28af19-21db-4532-116b-08dcc1c59800
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7781
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
index 60743f9829a5..b46a0b9940e2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1103,8 +1103,18 @@ adc@1f {
 
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
@@ -1116,8 +1126,18 @@ gpio@22{
 
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
@@ -1153,8 +1173,18 @@ adc@1f {
 
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
@@ -1166,8 +1196,18 @@ gpio@22{
 
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

