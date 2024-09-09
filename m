Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEBD9715AE
	for <lists+linux-aspeed@lfdr.de>; Mon,  9 Sep 2024 12:54:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2NyN6s2tz2yRG
	for <lists+linux-aspeed@lfdr.de>; Mon,  9 Sep 2024 20:54:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::61f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725879290;
	cv=pass; b=EkUEEQOdagd7a2eXTzLcyPJjW7o/okmZ1u0LKYTA7X+ne5QNeZirlYo2EYzDOnPQ2zX+pV/iNxjwruEHfWLrXdTOBgF3Qir5zaD0Y+pQ7eLx9J609IRPH8VdL5BXLjfDApANomjbAUGI4LogN2tJ7hYRwEX8adkONdBUiwwzMbLv4MSl/NXX0n/FialdC9E8vNkUHXatS2aMeRwF5LFmOP1+fWZCGBPLaWsINZVn0mZEeQLLHdc+qj+YOsvpcvDm58U9atCesCVSQ1Wt3XATzf1N2mFU9/rc1WUoVe3nTcXhUOUlmPtIkdWnh4XE7eTvf9cWb3EWT5iFd3uWeY0Ypg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725879290; c=relaxed/relaxed;
	bh=4USzMxeBU9EH3DrSJM49cRXUWi0wRlmxC1ux7rp49ew=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type; b=AF/lJzDE88ITUZKGyw4l68bVYZxHorVzWB8cf0mhb7doTaVd26yfMTNM5JgULwAbcrKzdhTWQ2OMEQKiEK7tY959mOpWMfuxbJNaXqXCwM8mrAqwIOHVWuLPrS5qH6wB+HePyVQm1Hiz/LXpqburwyi6++HumXBQfwpziG9eDMvGlaExkgYAET1JxQ0PNorgsAA4rZTuPnlaEQ8UZEIAEPn7TzZSr7GbbOFqLK/b5zSf2wfSTxuEAAqU8TWhPBTiHfVFUs5L/KDeNSEHnBAoXuaLYPxvtqtB2T/4kZsf3k4QdvgUtfyJPBOYjJVVQtYvo+veVSyxRbqWInybpYkfhg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=yAb8Ds2V; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feae::61f; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=yAb8Ds2V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::61f; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2NyL493qz2xZT
	for <linux-aspeed@lists.ozlabs.org>; Mon,  9 Sep 2024 20:54:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2sggSh1IwB/yPxMk7kNJnD77+9zOzz6OA3tVFJ+oplh/vmJU5LyFPdjFwhKxfniNqJt6Ft/huWL/f10nZ5GngCeRq1B1Hb1dD8yQARhsjYEDgugsutnuG+EgCBnipPRHhEzqudlWKyNA6OxgwRCkw46n/cQ+Vm2HWvtaFlivMOH4biIWg1GcTDHghLYbeqVKGUQRDNJ4UnLCpQZdp/Mibg1B5PT1FfYejNR7gqM6nFHTSCeM5g4l+NlqJlpnjeDwYqy9RYOnrPNVA5W9UN7O/HkEdqtsgILsa89/W9vwVLKQHRI9Ghr25pOL27bWW/etBNZk4mCxBnUd64YOa7Psg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4USzMxeBU9EH3DrSJM49cRXUWi0wRlmxC1ux7rp49ew=;
 b=sQIqyfdDJWz7/LJGL7aK5OIVef6kGEEaj7ct29DkNBq8MBoWJ3E+1ZwA4XHX+Y70bGoOlro67TMMzDvbrEqiZyllC9RlMEspJ2C5bP4oXjp5nc/QZAJEhRtIordV495PFHEsATf//B0ORmVT6f2QhMJ1v5HIiov7r1dQvE5+DIxK0JY21vvWiLmO0eqCohJ7/tTuqsqceqDgqNSbC/muHxL9eih6wKrcJ64Z3yUfkTKnj+QC66wC7gawOG//qG15DAmTAX1bv4Ib+WNj6J2g/BjVfMDTz/5viG0x7jr4ZTn878dwnHTU7asCSQqzGdqlDoCyzrYqaSavDk9Sd5uUDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4USzMxeBU9EH3DrSJM49cRXUWi0wRlmxC1ux7rp49ew=;
 b=yAb8Ds2VwWBSacinX1sDIoHM0/D9ZuL9zPBE21iMSpZGaSwtatMGMkhMnjA7ZZEHPS/3Muw107/OxpvXnGg8qzON7jiV46pqf4vkWpsV4znzt8WZ9yv2xF23JyrKyim07dQviXeCoPoHsgAt0QxZl6SH8J6Oo1u0n3Y2G9VAjemxSIKTffKRPQlqZXZ15ZNuBR6LTZd6pieRV3Iw2T3DkUp05EIhxe5qrbNnwusbkWUk54MYMLWo1ezww0KC9ZzFjjrdG4tk3J4YGNix+PV/481YhDCcIs/8hX3pMXLHvvRZPJaIsKijDSZ1VuuhENrmKcklCZp4g7J+rfTwBkH6Ag==
Received: from SG2PR06CA0215.apcprd06.prod.outlook.com (2603:1096:4:68::23) by
 TYSPR04MB8291.apcprd04.prod.outlook.com (2603:1096:405:c5::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.27; Mon, 9 Sep 2024 10:54:28 +0000
Received: from HK2PEPF00006FB2.apcprd02.prod.outlook.com
 (2603:1096:4:68:cafe::8a) by SG2PR06CA0215.outlook.office365.com
 (2603:1096:4:68::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23 via Frontend
 Transport; Mon, 9 Sep 2024 10:54:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB2.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Mon, 9 Sep 2024 10:54:27
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v18 2/3] ARM: dts: aspeed: yosemite4: add mctp config and sensors for NIC
Date: Mon,  9 Sep 2024 18:54:17 +0800
Message-Id: <20240909105420.441607-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240909105420.441607-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240909105420.441607-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB2:EE_|TYSPR04MB8291:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0a01817b-dd81-4875-2361-08dcd0bdc6a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|36860700013|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?U/YDvLuHuT8ZJPNvYOrftj72DXanPsSmgwlBfG21LElH6EANv5OId9tBEzxa?=
 =?us-ascii?Q?87oY7PmCoK5BZ2ZmFIkPWzIiSmeUPIC3e2o+ZJXHX792yhoeEK9PEpaUOriQ?=
 =?us-ascii?Q?CJqOzvW+XxMr+ilGO2BAGwMO+R0iOC0n4qDh3GFIZEiqW45uTjyzu5Z1DFQc?=
 =?us-ascii?Q?gHWkdNYHB5SL0+jDHS9EOtkMC7g4bhZgk/+0cEpOsUqz86NQiai8SXzSJ0rO?=
 =?us-ascii?Q?LYSNyUWEGzrbNSqnRQy2n4auNHearMRrWwdT1IQUTtT0mKLcFE50REcfXShF?=
 =?us-ascii?Q?HpxJc7j+aMF05ldYkPR48fwTE6d8knNRwsV85/bAET5EjcHrXmcauMy0znQd?=
 =?us-ascii?Q?v5TLypmxxAl3xj2uhOqqFqNg5fPcIG18ZxpB65xpJjE+mCALENvqRNwkzKfF?=
 =?us-ascii?Q?AbsGSG7d75VG/aS6tmhjDVIuGP+cT1LhL1naEmpv4iVxC3OSgt8Jkt8nHVhd?=
 =?us-ascii?Q?ulbExYwnCeJDAqpgdwQD3liGRrU7jjQbdBKSAELO2aop0/4w8U5d6ftvNJoz?=
 =?us-ascii?Q?a+dgT7fNtGWsMy0fUWcEppDu9aE8o9sQrBS9sp+eoAVty2AdL5WOtvOrFfZR?=
 =?us-ascii?Q?wly+y/Eb4g1fMkqRZECkVsUWZce3fsXH3BAly82oYfdloq59FooE+5p/ypZ2?=
 =?us-ascii?Q?P+XfFyskwYyXvcsTWrGcfnGYbhvLUHe3ghI122/Hc+Rxmqepec52oDK9A9mC?=
 =?us-ascii?Q?6bnoAsyxWrL8m3JvoGwFFOaCiBgkZUdIsSUsXkrpFtUymtEx/FSvP7pkQmKj?=
 =?us-ascii?Q?2k0EHYL3XapymLB+d97OJqYPrtG1PAtI5Zg26sX5hegVjOEF3S28BTYePry0?=
 =?us-ascii?Q?OaNKAxms4g354KPaXuSgXLmkHxgcmt20OI7EKyWpY+ln0KEBGUbi7vzxYcvz?=
 =?us-ascii?Q?2cCyph2LB+uD/QD4hUKqhECPz4TugRO9OGecPXXHPLNu+Uk+WqTlZtdx1WgR?=
 =?us-ascii?Q?5axRpq642uZsorY9gUfzrGeXSpRsZaoDrmIbebw/2Btv1mztBCRq1NQOrBPP?=
 =?us-ascii?Q?MpiFbe0RNva/lK0nW+pbuHJW4I/WqGWZ8L5esXoI0hmH01ygRnnzE08LgC1n?=
 =?us-ascii?Q?gKpKu7a+T8ANNWu7FCh1IYkLSxixhDcDk8HLjvthtoO2TQPOgEIsCSVJv3NX?=
 =?us-ascii?Q?pMnGOW/1cPvQ6O+WSHObKsc2kfZ6ZrQqUgREe8aeQ8qj5HeKF5Kv3WAABQ8u?=
 =?us-ascii?Q?O0/XjMVrNZXiRBeSwiW1K+rZVSpOZ8KsIi2Xd3k84Qzrav8sizzWw+Pk1B6z?=
 =?us-ascii?Q?8kFqRUHho0uPTIreuKkGTdr0T7TC1ZsDFX5OJL3A1b7zosV/iYVcGHBrvPpI?=
 =?us-ascii?Q?GlLqV8K+Ius0yUS9BK1Q0wNk9PLvo+7RkhRAe7HAQe5M0OWJ12DzkAf1M5MW?=
 =?us-ascii?Q?Pqy1o9KWmjAHfNitVntqhTGHJmccY1WV0Nw55xkiLXl5i1eNtzIDBVg2cDM/?=
 =?us-ascii?Q?SF/KnU2OHK7VDgUVCwZK4pajsQrjC+sC?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 10:54:27.7531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a01817b-dd81-4875-2361-08dcd0bdc6a5
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB8291
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>

- Add MCTP config for NIC and remove the unnecessary MCTP config on bus
15.
- Add 2nd source temperature sensors EMC1403 for NIC.
- Add eeprom for NIC.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 49 ++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index bed6bf695496..7898c4c94b9f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -938,7 +938,6 @@ &i2c15 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	status = "okay";
-	mctp-controller;
 	multi-master;
 	bus-frequency = <400000>;
 
@@ -958,40 +957,88 @@ imux24: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+			mctp-controller;
+
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 
 		imux25: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
+			mctp-controller;
+
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 
 		imux26: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+			mctp-controller;
+
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 
 		imux27: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
+			mctp-controller;
+
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
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

