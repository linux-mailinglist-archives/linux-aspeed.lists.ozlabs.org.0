Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B885917BD9
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 11:09:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=DVbE2Ldc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8G9D6twjz3cR3
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 19:09:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=DVbE2Ldc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::612; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20612.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::612])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8G8q1mCHz3cWF
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 19:08:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMlEV+wB42w/jsTgIobdcI867555X903AqYdds+8uDp61zNExrKxxQwjC3vn7j4TObYIrWWCUFKTU37lS6+SFgFH2mkkkkUOR6odeV8haGvJBnPStU6iMe5rdcgguOKt4dmn2K2x6WwX+eS7TldZtjy3WoLQWX8L1xZ91qfTW7p5pny1bRUq2m7zVXRxQiyiD5fz/jChEHq7HGEn/LAmwzFJ2sMfzt+FDrWE1dcMkoKid+yN7dx5dWKDk1iTvfUmtQ/jbygvWXQv0ayzql8PecxzosPs02n6iwjSN+tf9tkPxG0m79g2LRoQ6fOjBXt7iTazxzlMu7B1I0VKNKV3Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Q5MeEW03FNC2r/kxYIzAJUQLLsW+EcYLhskSOMMcDo=;
 b=MR06LKnqlNbWvzXJ9t6BwZxdh1z8AehiuW3uRL8SUGA+3TUbKh6yZC63IxfKOu0J3lAS+BsuSqVVQi1mJaNKtS9/kXWsBTUcTxq+lXaNwkKZLhnguY8m9XZY2WdggISMH5kmUeU57IL9Ggvk5UQlAk1i/VSkm3vbuPbXuyw/zIRvIeJ9Mz/BEsVITYv/VrlxfEYY+ZhOJgHDN+qIl0muhWGBQulkTevp2LUQwg+zbDRs1f+Cxf1Li0AaxP0aTMSjdhNJ2C8oe+5VsAM5dnu8YNiyhrZbat2FUwERQFZ2HEt431Q2vyZlb2cftrSGMgyHtWb+h08cppR3KYm7BSGNCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Q5MeEW03FNC2r/kxYIzAJUQLLsW+EcYLhskSOMMcDo=;
 b=DVbE2LdcDKfz9ohuq1imcCA5dLnYqFy3ZnXhJMVgozLL89a7OGzPBBFAksPOZIyi6Te/AIC+U3OvVcXpwLmUzCbLXJmzIDfwmWR1DNYaewrwOIZS28LDAv204Inr9xNmNzY0tvJ8Z5IAMh8tbEEQ8dnQYOU63QMJEirpWIlrMPHWXbX9R7MkJ4oUMobz7yohG6hERR7QZFgJXQmbc5pructcpXJvlzuwtiwnBV8659WcRmINjb6MARFJhhkOvRJ3bUvVeSFJCSUSVysQwhK6zx+Ybp6/oijRj4xmh4c+lfmj6eMvNIJOz+sxoZ+xgelTJsOmoAoUF+78LndCBE48ow==
Received: from KL1PR02CA0002.apcprd02.prod.outlook.com (2603:1096:820:c::7) by
 SEYPR04MB7776.apcprd04.prod.outlook.com (2603:1096:101:210::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.22; Wed, 26 Jun 2024 09:08:41 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:820:c:cafe::3d) by KL1PR02CA0002.outlook.office365.com
 (2603:1096:820:c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.38 via Frontend
 Transport; Wed, 26 Jun 2024 09:08:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7677.15 via Frontend Transport; Wed, 26 Jun 2024 09:08:41
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v9 12/26] ARM: dts: aspeed: yosemite4: Remove temperature sensor for yosemite4 schematic change
Date: Wed, 26 Jun 2024 17:07:28 +0800
Message-Id: <20240626090744.174351-13-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|SEYPR04MB7776:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 37d3deb7-d51f-4341-3232-08dc95bf92cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230038|376012|7416012|36860700011|82310400024|1800799022;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?QjocRnz3Lp8H3ELAe/r6mVaZPigjTqcuLqIutHeuMtE5p53zlUWiOni/jAoT?=
 =?us-ascii?Q?GRGMrjE6eUQXvqZMBOvh0xwmxgW+Faha95VVPb3NyHzEpwzM7F6vee/KcfXr?=
 =?us-ascii?Q?bvSZH9Gfd3HT5ROoRgBA2ben7qXTehNZQVvzTKKs4UsY/+WdaRRZwXxGTVZW?=
 =?us-ascii?Q?pCnF/XX/19gHZc9WiuUIc+wLR3NQht4z+crh/CQSd9AatzPkGZAq1RCIrgyc?=
 =?us-ascii?Q?7cDLf1P+R043M86GOpOsjzTaEc3CGhzf8TAoaSvvXpQCM/T2IcjYMpLJNZK0?=
 =?us-ascii?Q?smq4Us0wFSIfH+9dTF6X/o4Jg2jMjIn5ZBy/HDuvKY4npqRnz4yIpSnWJZyS?=
 =?us-ascii?Q?UTaQFM37oq9IXS5LV9iMl2rthdG1/b7794fvuJur+s3fZngejP1b4180f70H?=
 =?us-ascii?Q?pYg3PZ09rduhV6NaZlkcQS2fkyKiNRhhqjov4+pbyO9rdpEWAgKt87y+pZXD?=
 =?us-ascii?Q?9wDXwvwYoigWuz8oiF3W04uPrWmbAukf29TapFtPuhCo9Tdne9PZr2LvrJfg?=
 =?us-ascii?Q?XJNdZC5yXrl0Hniuyo2Jp3ot8CpzM3hgvxppRem/vPa9JLC4Rh3268QTU8Sx?=
 =?us-ascii?Q?hMvaypTDqtXpZ8w4wqYAX07GDNKeZsCVukaFBiFDX+9GrXE4Xymha2dgYcKu?=
 =?us-ascii?Q?l6aqGhW2uf64nyK1KYqaNbiIQPrvmcvKTg7zqfLSPbX5A35yn6WTG/auCcMJ?=
 =?us-ascii?Q?4cIVdzn7nvbwBt5n/7Kq5U+JQVY1YKZMO/UgKr8L4q7kBIWJf2Re0WVutLrY?=
 =?us-ascii?Q?x5UjY7YQDwZ0OmMQWVIvJPzULa6KHRjhR8Y6cF1cHy9ipmh4B5gnPBW/mI1E?=
 =?us-ascii?Q?s3wL00QhaUeuZF89WmYc8zypqcqQfoXzCIxGRMLfwdF+N7zHE0jPcjjd7a06?=
 =?us-ascii?Q?1/E0bMXF1431dddaO5KzBjdTpz+H7VVkZlbSIhhwBvc057XbwF7AlX1ibP8u?=
 =?us-ascii?Q?EPwAx4FE9ETMpvq5yhJ+fbXY9t52IFU4gqFfje8WcJkJLxrp02ALHyKz2iKF?=
 =?us-ascii?Q?UWyCcEQTbe9Dhkv2PZqRCvKIkL+VWYZVD8zakOPRkhWo+E1GFjUvNfc9+OfS?=
 =?us-ascii?Q?sJqhIaqiTVlnbKtUUKvPeC/MiFeQ3R0Z+OWCldcat952f/jH3OPFxk2fV+Uw?=
 =?us-ascii?Q?mFL4o4gmPSpivBn8RlYEDwFLNslUPNQByjUe7tcHVPWvGU1rnu7pA+4nJi7L?=
 =?us-ascii?Q?0Am0NqKVVJy1r//xH+eyIPKWPKKaEanjBaeDFdSZRclMxn7nJOXgjr+jNAu1?=
 =?us-ascii?Q?w4cZ4FvEzOxDz3ZpGec8RK7W3syGzv+O8eDopZpuxNR5Pm1VuvkUPLcHy5EF?=
 =?us-ascii?Q?Ncq3+aPugYxikWas4cIrrAgdtEqcntEERdWYWNMonanENqqnNA8jKNLSUTlr?=
 =?us-ascii?Q?4nTzHA3HQKWJeGf5JwB2CawnP/1pcrJVQz73BaFHig0WzdES4w=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230038)(376012)(7416012)(36860700011)(82310400024)(1800799022);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:08:41.1299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d3deb7-d51f-4341-3232-08dc95bf92cf
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7776
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

Remove temperature sensor for yosemite4 schematic change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 9a14f0220cf6..8f3bbdd1bbc5 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -921,16 +921,6 @@ temperature-sensor@49 {
 		reg = <0x49>;
 	};
 
-	temperature-sensor@4a {
-		compatible = "ti,tmp75";
-		reg = <0x4a>;
-	};
-
-	temperature-sensor@4b {
-		compatible = "ti,tmp75";
-		reg = <0x4b>;
-	};
-
 	eeprom@54 {
 		compatible = "atmel,24c128";
 		reg = <0x54>;
-- 
2.25.1

