Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0D1939D87
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 11:24:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=H+etTdQ4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSsDc1q5xz3dHC
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 19:24:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=H+etTdQ4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::630; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSsD85mYfz3d9V
	for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Jul 2024 19:24:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F6ZqjeE4FNh8cPVIRoLUihq63vKK+1WGzobJYlpJj6qc+EfPMMwodEYD3YNNny/17YSpPRxTRvinB1L12+1kAA5B6q/idEdp1L4W/VenrMjdCx6Y5KTNTMWTXeHGuKRtDbA3Dq9dXja6NEMDGYdJhCOuzRGf2lH7gT8AnhCsD+kMA1vDfVKdQjd/WLjCizeLaIA91FpEP+zoDJGNlwRMKnCifV8Cu4ayvJHKnqQ8xyg0RQCvna7iRUkopX/xfr3UioMagxiGHUEksMDpAPYL3SrOOjfNzAZU6zNwtu1DDTTg8DH6ty45Drv+mGwBcxwsuAMgzTPWkSiTINf9V/3Skw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZanMQdXX7mf9CZbizY6qTm7CHfPB7I8RHeI6+dlIZ4=;
 b=C5f+rLttCRZOnUe3Rc+1AKeCPlfKkNNWA20oIs1rXDabAm7O/xOitL/DhK3lLHlmjp4iUEfd3MgInINakM1awIPpW97U5ltcj6BwSRYgZKkHjdcLhsVayLHVFr38DEi5jIZKVljC+jhGw11fP+doiqaAiRxJ4EBfACjeC9AhRXlWoybI2qYGE6qgLDasuCGiU5GAWZyutnOjPiMsUk+TjBEWWX8gqMPclMoiF80jP10yyVejjStgBmBPO3uBWfSqdDtMUcHBLnhc561lYUXrxBcrdLhMxCYGUwie9sXHCUJnOhv7KD5fdFm+D7RUscnKldTZW+UO6chcLhAS2ilAIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZanMQdXX7mf9CZbizY6qTm7CHfPB7I8RHeI6+dlIZ4=;
 b=H+etTdQ4LASvhq1nvtRxmS1aQYuHF9QKQSgJd6ZmXmLUVKg7gKjzOjnZ1hMUXvxmhKSoa4trsr85wpy/QG7Iz7rHrffxjS9wIj4vt4+akiLJHs7R3JL6/fYn9D3R5jWXLrJ+MitH7lZP+CBvpMlEb7NjtLYiRSQjyqzbwzXDGjzbyV1HMGfPNQzpA7NAwM27iRXVOVhOokpOWIV0lOUWvWJg9a5MkcTORseoq5X9mJwepgswF7wILt5izuZA1A3xtNlBAlGYdMBLKgJKr4bVKK77qdkSWXKfHCDY+7Qc892wsVNX33M/JmUdlSZwhLdNKj9t2Z2fXuqCmRs7bUrilA==
Received: from PS1PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::34) by TYZPR04MB8094.apcprd04.prod.outlook.com
 (2603:1096:405:a1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.9; Tue, 23 Jul
 2024 09:24:04 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:300:75:cafe::7b) by PS1PR01CA0022.outlook.office365.com
 (2603:1096:300:75::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Tue, 23 Jul 2024 09:24:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 09:24:03
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v11 13/27] ARM: dts: aspeed: yosemite4: Revise adc128d818 adc mode for yosemite4 schematic change
Date: Tue, 23 Jul 2024 17:22:54 +0800
Message-Id: <20240723092310.3565410-14-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|TYZPR04MB8094:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0d781960-fb26-4586-9be4-08dcaaf931d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?rAitkYLyplswYYydep63d/4lNmYeCyB9PIWbeoyTkTuiL2FSEJvth4m1CUd6?=
 =?us-ascii?Q?WEakI7IhVcNLCZ7IH1x7HamiHoqlPzaIlNhvNnAMHlWDP3w6/oPEp6KI6Qb7?=
 =?us-ascii?Q?oNx1aClfEOYGEuANQaHyBC16gQ5SP9gRVguLpsLjw9YozMdQyp89V4sH6etA?=
 =?us-ascii?Q?Jl9OhGBaQ155YCn1+q+GkU/inZcXwRdr7pViTvCZWISz4ENqDf4jnWqrf4mh?=
 =?us-ascii?Q?h5vcHWQeXYU6wF/WbziDRMkZFN7lEjhUPEBKNkO6naCRPpALeOjulgHU65hO?=
 =?us-ascii?Q?LscsAaVn+R3sIO5/Oppzc6jOzUQ/qAdU4NPl4aWM0Z39mBoO8VrklFdgJXyr?=
 =?us-ascii?Q?kO/1TGdannKgYlCsFo1b3AWHAOzS6j+th1Y4S545c8tzCn16RAVRQTLcKg5u?=
 =?us-ascii?Q?1pd2q0KVd1UhQwQQE73POeMhw7vaIxUWAyPna1wNrIIdKbAZmsjX8g9LVb3S?=
 =?us-ascii?Q?JwY75PBGb0aAFrv77gLIX4DdeSrP7sR0Ow6d4u+0a1rHYE5/3mQXiSTSq50F?=
 =?us-ascii?Q?P0jhSjB90WmtrHmKvugj0Nj2QMXNy/IS0JhNn4t1sJHrjNuVR9kIc7GGS4d8?=
 =?us-ascii?Q?TxbAPUBsI0Br13TcFpx62ln6XR/6wfPTV30G/bXvtPqynef3BWxKeublUj2n?=
 =?us-ascii?Q?Zb0H9OSxYo+htTHuUXde7PnQCbEQgBvIKPYMQOFkeD149iSWjo9OZnKvQ45X?=
 =?us-ascii?Q?kug+vpJq0A7jhkATviAac8cDzCaDtRfglmUTV2xT4H9CHPGQUjTRXrvqTND7?=
 =?us-ascii?Q?JHPIfw6pEO9pqf592OfkM0R5RF63Kxqbl93DDXzyMIpAyRqBGUgX8tiT3sJR?=
 =?us-ascii?Q?akcRGef3m7qCvqa1d9O1hqWO5OMG5TEt4M69hbNhxnhGOkSKWqLX2/pRa3Vo?=
 =?us-ascii?Q?WDm0lOjhgFGTgokI9Hmq1vu7Cmzq1A8xPwPZ0a003zNv2mDeG/8m4fjE55Wa?=
 =?us-ascii?Q?m3XdFtCWeYUitCM6Gd/rlJnqdcnriHRsNTmh8obHshOoKkSm2FwNNLsaHJ8y?=
 =?us-ascii?Q?CqueFDHdBnkDqxL2pOqeCUC0R98hpPib1mTvd4rP+W4Pq2PnoVj9b9giMuoQ?=
 =?us-ascii?Q?5Z+wJ4M7wyY+h+gnppyYu5N3FHczoLPy+q0csxPLxJUq8dUOgUSSKdb5HNGU?=
 =?us-ascii?Q?1e+6mZZW/V5dz9fpdhbAdYEHzwhYPNyyK2+bybNtaaFRNehyuPv4/NP5mShg?=
 =?us-ascii?Q?PKlMKP+r96mOQ99yUoxfVksgYrwFXiWYfqRPLCha3OmorebB1lNsNPZxRIud?=
 =?us-ascii?Q?G5NB/qhQuOHJw78BQt5H++Hng2yiLFxQGnwOWe2VhM4KJY//v7xVMkAIhHPc?=
 =?us-ascii?Q?CoHpOH/9h2JYG2MfGUW6kbRzI1+vaQid3E+ELFQewF7nt2x12vsGgoP6izwN?=
 =?us-ascii?Q?pB3FZYP8rq+bRO3j74LoGkzpqCRWv78ttvp8Lianq9Q8lfa++lOUtqe7aciH?=
 =?us-ascii?Q?GwzU5Ys6QSCVn01IuaS3z4daI2A5PEci?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 09:24:03.6913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d781960-fb26-4586-9be4-08dcaaf931d0
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB8094
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

Revise adc128d818 adc mode for yosemite4 schematic change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 2c0c37b3ee5b..1765a0bb70d7 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1018,19 +1018,19 @@ &i2c14 {
 	adc@1d {
 		compatible = "ti,adc128d818";
 		reg = <0x1d>;
-		ti,mode = /bits/ 8 <2>;
+		ti,mode = /bits/ 8 <1>;
 	};
 
-	adc@35 {
+	adc@36 {
 		compatible = "ti,adc128d818";
-		reg = <0x35>;
-		ti,mode = /bits/ 8 <2>;
+		reg = <0x36>;
+		ti,mode = /bits/ 8 <1>;
 	};
 
 	adc@37 {
 		compatible = "ti,adc128d818";
 		reg = <0x37>;
-		ti,mode = /bits/ 8 <2>;
+		ti,mode = /bits/ 8 <1>;
 	};
 
 	power-sensor@40 {
-- 
2.25.1

