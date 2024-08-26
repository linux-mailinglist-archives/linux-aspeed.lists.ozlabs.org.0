Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B80D95E889
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 08:25:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsgf22BzTz30GV
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 16:25:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::610" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724653528;
	cv=pass; b=lTt++jFIsTdN4qZB82opWcB/zaUyCCVKnO1e8eAe9Y+c6EJX5/RnNv74nde6BhW/fkRxLClqA/as/YJBqwnrophR9ai7+86/rruxdeXr3OGZ7LQ725C+1Mknpbh7/3m1yUMqIg8ItCS4c/Ddm2xNLekSOu0xCyuSkouy+U07fKku3sxmD+0lEyMqElisu1lmdstwG2dhuTroZETACk1iK0KPqO/uJw4tIWnAmA1ckB6TdmTKNcgqduKHteRn6pekF4NHVYCmjcEG/QYksgFC6j6w9fc8aYZfi8cyQj6ULvBJfY0NINS6yEUVUjkuvINkpouoOU6AGYNVpvVXpeq5AQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724653528; c=relaxed/relaxed;
	bh=zQ8R9uD5dS2CYOtc4xvne6zIrhYDAk0BYpQGanDefRc=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchan
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Ecagu8cf; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::610; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Ecagu8cf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::610; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20610.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsgf02FW2z2y8n
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2024 16:25:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pD+MaOzgj5PwLGTo/PWnBiriNg/tGHLIBjMfoGY6MzpIYcQIdaFkYf6RCQgm51d19//eaJCUh4CNrMMVh8eSuL/wh6vfXxWqpnebEbRDDbMbEUonyrriTY5Z5T1CxA0gapWX+tkqFKbhv0LWoZUMvxpHtelmwmRcfmPJuJbDgrhbGRIXAbJ2blTA5EL6aNI6Mtr3dhFUBSpE6ZeV0aLTgUxSMIYeLsONl9vsIy4J9UQY8zTLLBBYk5mOmuTHLwSDYtY5RR3MyISt0/3oNUJ8V+5luiWGUWeLITUxFhJPDifTrqmX8me47uzaBizu1QHaWqs2l0SK/WvFliKbx8NUhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQ8R9uD5dS2CYOtc4xvne6zIrhYDAk0BYpQGanDefRc=;
 b=X77iVVYNX5hAj1QEYEbbIPjcn66/c7c1NEpTaZPrrhnwbjlV+drFbVcu54fOnhQ7G4iwieBGZRWLl0uNBZQMaLK5WzLar202XvkzMbXVndgf7nPh5DCwTziH21dxrzVzekxtyVdAphe1uAwzCMU6uVO6ZJWOxqxsqwhXBJMuBBxYJ0I0V/2CebJEGx1gW6HUcxB+OxeKmNGlGnXwz1xpevd6Pv4skRgXtuMQPBRX/9yxfNivAhPNjGuKluDYYydnvBszyG2+rDhdg57sn8COYtipZ2kdLEQg3hJjOz0Th4VuDwzAmlA5qFkWsliAfKgKXl9mO2c3C++VohuUvuhDbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQ8R9uD5dS2CYOtc4xvne6zIrhYDAk0BYpQGanDefRc=;
 b=Ecagu8cfIaxZNqCs3XOxjvUJPil7/96elXcL0whZmQbvdjmtYg6oQiDOYtMlTMUc4V9uNDbTZE4GaMZOpKF8ei/bd7hhZGYJcw6TcwHlhvZT03+xXI6gGfMh31begLdjPGKwxvl1goQFc0NxnRoZ0EKoG5vhQYA2MaEYd3tmvBHCs7KKS+eS44q9oG+12c24SG3tecs8VSNsATv7mhIM3/aBhrx0CwrnOE4YZ+L8aDuAV89l/KH15fTDMuqUjlVWIQGtcQ53FMaBd6v4hKoKf2T7zFypw+AZYeub5qw8YTNaqGB8zANsYi/DLvMixN8xJLXksbapSRzEA86MYl2cGg==
Received: from PS1PR03CA0004.apcprd03.prod.outlook.com (2603:1096:803:3d::16)
 by TYZPR04MB6685.apcprd04.prod.outlook.com (2603:1096:400:33f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 06:25:09 +0000
Received: from HK2PEPF00006FB0.apcprd02.prod.outlook.com
 (2603:1096:803:3d:cafe::2b) by PS1PR03CA0004.outlook.office365.com
 (2603:1096:803:3d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14 via Frontend
 Transport; Mon, 26 Aug 2024 06:25:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB0.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 06:25:08
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v14 12/31] ARM: dts: aspeed: yosemite4: Remove temperature sensor for yosemite4 schematic change
Date: Mon, 26 Aug 2024 14:23:46 +0800
Message-Id: <20240826062408.2885174-13-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB0:EE_|TYZPR04MB6685:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8ce5bbff-8c8b-4f67-7cf9-08dcc597d518
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?t0X0yIbJqQc0nxF29pNqq9pfHAwenJ7sWcIpVDgBMPZ+ojajEOXydg0DGTHm?=
 =?us-ascii?Q?PJOLUu86519VJCkTa0KnEsPPkMg9yc7JwjwUIP9lHi3FQMuLfE+EX7RIM5EI?=
 =?us-ascii?Q?0SeFcVAblzLluaxDlwrDcChYL1qs6l5oNN2u7Low3vzZ8qOI/IrMPMw0PqTp?=
 =?us-ascii?Q?RUj3Ja6cGdFDS/C0dUkhUebv27nbDfMvBbk73MU3lZzEJ2iUOZ99GTxJ8NBv?=
 =?us-ascii?Q?xTMV8dhzbEo05Aucj2+guRWX5cHE17Z4Yk26lmAp/hQLC3Pj9RoKl0lFJVB1?=
 =?us-ascii?Q?2/3e3ukMutvNRlmbeWT0Bs2OW4kJETV5ZO+CcZNZ0G+xqx2peWtWemLGxbuY?=
 =?us-ascii?Q?V3ZI60+ZCqiDY7l0OZTyBhmjdiziPyUmn6/klx4rkuExP6LKOTYmWnxx6b4k?=
 =?us-ascii?Q?bXEn9YxMBKcz+ty3tcDZdVYgkkTkFBt/NOIlmLNFMzgS+SIgjm553TCykP99?=
 =?us-ascii?Q?Qn0pGT+VPYdT0/htM5ZDCUpQt2vAYzDHTUZXdUynboziXbdrzy5G+BJWbYZY?=
 =?us-ascii?Q?ORXMv/FX/32kwPgUZstIVD/2bq1JH6N4zGlfCDBTOWToYuYI7MitKbdEyUjA?=
 =?us-ascii?Q?SJESeHqvrWQGAwGzZaOGC9564CGG/I65iHz7npgYJnKKHqmqwn8ySmeL0scN?=
 =?us-ascii?Q?sPAQBLvE2cwuo2JZ0vEFHHdCWPC2GCBAv/uzr49wIvvQOg8cosbsXEk6GL5M?=
 =?us-ascii?Q?1RIsObtkiVJGBSbZCmx+Jqo8EgvtELZhMCY+Fk1beoJghLC0ZBUSO13YHLQ2?=
 =?us-ascii?Q?CymnFp0qQP+e9FCTf7MTmjsjwFbLtJlk8SWssT2XV0zNdeNbdXeqXU2S/3xh?=
 =?us-ascii?Q?1030i/UZzhxQrAv22o5rtGsONtp/6lUsiFxlfQHT0Y92f9nsraWtq/4Zp7gC?=
 =?us-ascii?Q?RjWOvuS+NNzrJarXqSMdEaP+Zr64vw8/cvU5zgE83JfOGuurfQsAWS4Ql10Y?=
 =?us-ascii?Q?FFDnh8raMytDPn5c6HKqwqFfgxU4B7i+Hsj9W/pDF+IQP4L/k5OJOhRw8g/R?=
 =?us-ascii?Q?CqdNwkPwizRyJuOfBm3bPjwNMu2XSABMGTB1qMFdtWDIbaz6Hy2kWojYN3Gl?=
 =?us-ascii?Q?9GuVV3GRI1jk3VaT8H2H9lYvIdZSF8fY1nkfFdOxqkHADNYSdJLnaKdG38rz?=
 =?us-ascii?Q?FM0lwmLlya7yW/J9BI/YGfinfMCbrIUSLpPtNeL7dvUjo5yLQjHG5+EmbkiF?=
 =?us-ascii?Q?pKg06KCJ6zQa6V/vmtUwrYLfe8jIbCK1W/oQ4UcMCakPCf/bvc7FhdIi/tMV?=
 =?us-ascii?Q?Mjb0hO7Kyj8WOoJKC1hkGJGtpirwpQtmh5oyuwYx+D0Kd3E/bhHzy7DkXyO2?=
 =?us-ascii?Q?5kVp8USw72024Ls4Tz974uEo3IuY1gocdvDPYv+4PLH8sQIPe/gK4WqjqiM1?=
 =?us-ascii?Q?til6oGvkaQdTpRG2V5NImDZIMsxUQksgpq5NVbN9A2nK3xOE2ETqN4sXjmpD?=
 =?us-ascii?Q?834lFP+DHWN08fxo72BkqZqn3xZfgU/K?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 06:25:08.2996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ce5bbff-8c8b-4f67-7cf9-08dcc597d518
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB0.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB6685
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
index e83cb51ac19d..2c0c37b3ee5b 100644
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

