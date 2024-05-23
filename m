Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id BAA6B8CCDFB
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 10:11:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=qfuxwC0e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlLMF4mFsz794y
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 18:05:29 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=qfuxwC0e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlLLh3Ngtz78tv
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 May 2024 18:05:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ceOuv/YX5+nuMe+Xjd3JrcXOo0JNqSE9tag5TQF4tnhd3BGcvrFdmPBiAteZ/0JxxD5bFGO+7ibiKYJJ38WPNJayHIWkOGBkCu9wrrmNxngN0Q9bcu8rU0kRlBfsM/SkmMziNv+CtroXimQ5x9LL9f7XPMoU8y/Cu/pE2hjt1wD9Q8znyy/DwsrPQvKDzPncQ6tfUfPiOWnAJkk+bGop+VvS8Ri0g3tH21ScnNpQ83PgEujEBkkvwNRFICBW45OXz3lpuf4eUS1pNxPEXplDcejVixxjw974T1QsHMAZsImBQmbTNVEQFo68nnsmPuk6jyWkX3cJwcQYPl6dzVFCwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vQQ3x+PmWObjM/+/9aZu+RrnQuFpeCkTBq+qesncHc=;
 b=jdODsdDvYLpSAmljEv2eXgwPyudu1go6qAv5MJhmC5W58tHOGOohFnAza2ELIQ8epefPChGHonnA3NKy7r4vFpmedZiMegp6+2IznhfhWgXgdIzFtNPXDyVpmue2oHE3ToSU4WK/ylIr514BHm2RDki2/Q79yG2XUtYpLux8AagEhTSjq2b95oiFQGJiy0xadnXiwbd/gkktjJQWidMgc8tnBc0sADf+xhbOr+XsNsUT4hdajmSvs/tyorZiQ/f+ZRNL7Tj4vUQa5gTHS6W0E7PoaAtd7J3cDPLj7o+CO1LIpKIC4og/CkI8F0vtjOtT38szHOFS3zjf+DeNSDh2FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vQQ3x+PmWObjM/+/9aZu+RrnQuFpeCkTBq+qesncHc=;
 b=qfuxwC0eKOpQduTpbH/O2usggAmT1tl9fT/uok8nu8rYUbWqKhzymygG+tAo9dgRzPaTVq0nOMZlmw4/OQH3M+KxPrZ7koaLG9ISn61bqVBuNcS8jFpig9QkyHTcHl5n6lrfYI+IX2Hpc3Yph8cUvuzYlZAh3elJ3cQe8sKl0LcIV4r+wcEgazHpIiWMkgpcIKFhqZDBv11TQftH9PtZbpfzBLc/ggePcxc+5QH+h+icksLlWqsmXEdc8cDHNd6n/fHMd9cC62RPLUkKf+HILiG7tTUGC84BzibZ2pzZ66kXTo2sk8EKSKRAZhdU1eYc4TfaaPDhNUUyD6es+nZUbQ==
Received: from SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36) by
 SEZPR04MB5946.apcprd04.prod.outlook.com (2603:1096:101:65::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.35; Thu, 23 May 2024 08:04:37 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:0:cafe::49) by SG2PR04CA0174.outlook.office365.com
 (2603:1096:4::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22 via Frontend
 Transport; Thu, 23 May 2024 08:04:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024
 08:04:36 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v8 13/23] ARM: dts: aspeed: yosemite4: Revise adc128d818 adc mode for yosemite4 schematic change
Date: Thu, 23 May 2024 16:03:18 +0800
Message-Id: <20240523080330.1860074-14-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|SEZPR04MB5946:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 28bf7d02-0752-4a65-05a5-08dc7afefd5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|7416005|36860700004|82310400017|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?owujsYG4mMfD21hkIt6B2ndgZE7DVlFs8Rgun/ZbLcBm+l9Z+deTayGiknCN?=
 =?us-ascii?Q?GDHl7zS7prJUEt5JJhybPD6usHuh62h883MRDt/7nymXY9tdr7diESlwBoio?=
 =?us-ascii?Q?K7eCscZlbs67MBz6M3Td7iEaFpZ9omkZnq+tpAswgBXQamZvC1QRkge6iy9N?=
 =?us-ascii?Q?iuO4Vrtf467vjRLzEocRHrpTzExiSGzGGXlsqpjQx3QdN9dwtwbtmDHOwe1h?=
 =?us-ascii?Q?7KB6ppl2gtnjjSDVz5I5UyiYNL8Gu4vEev9mJeuGRy9+UCD/WAzETFnKV95U?=
 =?us-ascii?Q?VFHL3iB4tZwavstTnhaMgEpGhEKyUzUUuSWq0DXhd/CbZLW4MvUjXzaiTeOg?=
 =?us-ascii?Q?aSnxxiTSztgdfIVNgC+3cuR9X0UEweGfzTCMpWZtiJyPm095IYTzKHjxKxNY?=
 =?us-ascii?Q?RkwU2A3sg13evQX4xboCTZEZivFaq0mvkR0ev8hJQ4T1UpkotGIJEEwQ2HcS?=
 =?us-ascii?Q?9hi2diG87HqhbmHw3lfv9x3lxNIr8TwVB02vDCF8QZjA20oe9D45RuOMZf6z?=
 =?us-ascii?Q?YM5X0sX82Wdg/ymaNX+my0MfATCrv2qmyL+48g7aC85FkZTqQJ2jxigKBwWy?=
 =?us-ascii?Q?56VDnBYQU1EMKdb01QvOMgaRnMDIhGiRlzu9sckJlQ7w+YTxANzodnjDj9O4?=
 =?us-ascii?Q?Kkmhqmi0Y0Jx4xBm+Y84xagUwYY1r0F/737KcMpjKDVi7Z5QguW8I7NniIF+?=
 =?us-ascii?Q?ishPSCsllf2f9W8lP+uZFUn7sxElz2e2B8awTIryZghvahOMFGbrJ6bmzg4l?=
 =?us-ascii?Q?iq9NTVJotYn4EbVxRGbTw9Tu38NUQRSULQjc2VMam9GR4uEqm+MDggqHFuHW?=
 =?us-ascii?Q?Wqh4ro74LMeOTqs3UIZCsR+2gxn8a9/B9Pnw6GEhvvZUbLPgkY3a5NXfxaO4?=
 =?us-ascii?Q?Kwoz2DoeWGB7FldPwDK9vEVFx4dOLCJFSGo5yNt82pkFrsOy5Ego896Rf6ks?=
 =?us-ascii?Q?MVFVqqwco5fAlFeitEY+jPv3CzZJ4QOJZ1zUQuM4B19tOfyqwjpHuA/WkTWw?=
 =?us-ascii?Q?Gx0eTac7bVb93GkDKJGDCdNeeD8uHPS6WKq4GwGuvW8qOyuzoYsXb5qctIdz?=
 =?us-ascii?Q?W7ihm75JMsuVTzEY8Fjr37zI4XPWvLZSIfbFDL+NyR1b3vnr5Y9++rAbbKey?=
 =?us-ascii?Q?WNrJ6BmCQwrMU5PU2WCfOQayzcLrPeMNUq/kvTmMV15S6Y9hNwzXI+AsZWi/?=
 =?us-ascii?Q?Z4wnL1v/+XSDruI60lt2JeuCQ6r4SqfPPMKTOzndb1rU6B8IVo9sXRegHKOU?=
 =?us-ascii?Q?ZuZR6f7JwWbequsY04KVUvzAxRzWx7C6/P72ljreMrZ+oRPIikuxBxXjDYxH?=
 =?us-ascii?Q?Qng/j72XPRhHd1+OxdVpBeg7aTYcql0zUp660lRqnU5DhjLleipBXXmD7OdB?=
 =?us-ascii?Q?IP8nmSRoaTkAmX02ZXJbN/qAF71d?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(7416005)(36860700004)(82310400017)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 08:04:36.4219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28bf7d02-0752-4a65-05a5-08dc7afefd5d
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB5946
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
index 8f3bbdd1bbc5..0c7d85ff4360 100644
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

