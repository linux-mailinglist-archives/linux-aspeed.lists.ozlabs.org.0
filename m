Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 772FD917BD7
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 11:09:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=hlYUKZzA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8G9769r7z3cCt
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 19:09:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=hlYUKZzA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8G8l2gwGz3cDR
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 19:08:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GkPfhaVdvdfIaD9NAGTbzTDg+SW2Vm2Ql9dcvbvemqoTlC+5JtfkM5vCDMlB/e4yKsVfZrRtYZSpS0m0a0nxoaQwNrDnh4bW7tW3gZVq6eqNXFl2BJo7GUDJ+3WXQbW9g9z17Q0c10v8wtX9dJcUWXYXVpsfKvWkJcaD6WYl6un7Dpfpue89B4zU5Lqmc563+cxaEPwmIT0VxlLPum+ZNsNOvc1vT1Ei+y9FCEysc/CjdsRALwSeTRSNwdyjBlOwRVpl7jQPP+gMgKW9MiP93goBPl2umRUhFuiJfiNXCHuQYkGzvEb4AcAJUV4TnYq5L01kyqgMjyejm3UlO8ocpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pjrbPmUmdku7Zq8bJDb7/0Mq2EK7dm/UVhdSc/M8aE=;
 b=OOXR7dybAEAktk3JdQocim3U/7FFhWAvmRaIOl/O1KenYe7xYOQqcnCBFUgcbpDryWr2Cd0WfM4CJNMol42uVQlG77gZsED3GdU6ZNQ86+VuazB5Z+vRS2h6MTVkJh854QJZ+HVSSfMh/BSept0yVc0mpCXhd40ISkB4ZJvlaJuoINnEYLSHelUbJ2S/XUWI53aZYUBiL0jqp+EHoL6IKsyKlK2U2u9Z4otp5OFz+KCH+w6jPlyhW0KnDWlDbndiwSAETLKPyG+n4Ut1W0mexBhFgTZDO+yw/uWeUA4RQl68ambSkMTwJfwOPgZHXyk3Lka47CzdI7juipSXR//81A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pjrbPmUmdku7Zq8bJDb7/0Mq2EK7dm/UVhdSc/M8aE=;
 b=hlYUKZzAOOv7nENViRg7W3CbBrq/P8J91oKVaNoyhOlIL9t8vSOtwVJp5QrWsSxeZsDq9tZXaQ+THcBPHlyw0siiJJmRyQ9zBUP+EL9cMso+zXOzZy2Q5CbKclgNLcQRTermgH4ivXAT4oBb3WrpODbHmw5/EaTJQyxy0pwKvuLCF5z1DO+cmFdaLw2TgycbJ7mTWhLykWufkJEImE1K4F5xOdwBy3zzPi72pMlxYQfWpxSmKJG7LuWUcLnXh3ps24KQCahUYCgm7lASeAvaRWHF8Ixs2WkghfYs8iIL/s3PWAz9EK/QVTkQX0sXXYVyDyCJBZpQGf1ghEGqLbiFfg==
Received: from KL1PR02CA0001.apcprd02.prod.outlook.com (2603:1096:820:c::6) by
 TYZPR04MB7455.apcprd04.prod.outlook.com (2603:1096:405:41::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.28; Wed, 26 Jun 2024 09:08:38 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:820:c:cafe::ca) by KL1PR02CA0001.outlook.office365.com
 (2603:1096:820:c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Wed, 26 Jun 2024 09:08:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7677.15 via Frontend Transport; Wed, 26 Jun 2024 09:08:37
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v9 11/26] ARM: dts: aspeed: yosemite4: Add eeprom for yosemite4 use
Date: Wed, 26 Jun 2024 17:07:27 +0800
Message-Id: <20240626090744.174351-12-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|TYZPR04MB7455:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 962309d4-97c4-4d20-3529-08dc95bf90cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230038|1800799022|82310400024|36860700011|7416012|376012;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?bmC0gVPt/qOCF4+0oEQ+EVhFNX2CKPqbJ1O0l0AJemuNEymhMb6knIitR4kY?=
 =?us-ascii?Q?CWoEqJOZqxPVehpuareL7+emubtsBKIv30m/+5nD0MbQyr/AuuAVtQp+bzls?=
 =?us-ascii?Q?c4YiXQsZdfPDqtP0qLeT8LQQ5eDlqJQdF7ojODk8710hQKizbzb+RZYwBvnG?=
 =?us-ascii?Q?xwsJeoTgRCAj8Js2xFkQYYmLPW15ICIfW2Ji0avVZeImcc0GDZZJQShEdGH6?=
 =?us-ascii?Q?NFqJDE83ufMW4Msy+Y90OdGumAoTPy/q0DmuDwEdgTfjZlHJFAchkn6TnPbl?=
 =?us-ascii?Q?2p38On14ZgJP6Xdm7UxrVjGVp4HB9YkaNxmCwv/0c3Tq/3Bis6Qimfac8SUg?=
 =?us-ascii?Q?xuPJK7xYP3uLnU7/VAwC3T1SeDvgMn3ZGH0wbi48NgWpwhd822prPwYcsDLg?=
 =?us-ascii?Q?qAHnn/3vOMiaA98whyPmKiygW/aQrvsP4Fy7c2b0905mfE+W1CxqzwutL7so?=
 =?us-ascii?Q?GSpOfMS6W/OERwbS1nJDG3tAjPBrPlZO9U8/VZSl7rPoOejQnFmCv0c8OLO0?=
 =?us-ascii?Q?axzszAjggh4nqqE6i6W2LXoJO3ifq9wiR0KBc/hg4seyT9Mu2xw9Ly4sOTZI?=
 =?us-ascii?Q?bnlFC5RVE7+FxohvmdmLgQ5uLYdUtu0kFbktJi+ugyG1eil7WsOusDtzh7TN?=
 =?us-ascii?Q?W/LIPkU4nC0utw0sYytyjNLALu8KvJwLDK5NqPB0Oq2//G/3igryBFmV2dog?=
 =?us-ascii?Q?yX4LwAn+PDihFc23n8845bybXAYrYsGJBXQ6rYB2e8x6KkKo6sf/EQWEqgY6?=
 =?us-ascii?Q?YxWD8W0QimSu86JPPo8A6Aozn4tXmzDLGeniRMSUjl7O4cwCMzuAMHMC3lAr?=
 =?us-ascii?Q?L1kKSzhPplbnkpVqI41GYaKNsePRJUcyK01Tm4Rpt3Zr7uB9Qqd65OBMs84z?=
 =?us-ascii?Q?CBLXZutvLKPcBBAH9eNVylglEnphBe+rxvoUH+qB1tqF5xKfLDRIeAe35ZLZ?=
 =?us-ascii?Q?yQ8EXhN5Xjrb4IQI8G9d4KYhNvK05DRwwTvTMWlC9zDQ7m3xFJbNUVp/1hQH?=
 =?us-ascii?Q?TJMvU94AV3593tAj+5hc1n1yzmN9kxO83JxCfOCIWkyhOZ9paH1vc032QqU9?=
 =?us-ascii?Q?3NovybKDkSnPyByDzRt8XGKf43oodnNrWoWIlwVYktf0uAnhZxqIbDCeP1Vz?=
 =?us-ascii?Q?Alp66u2S3SMDwMI79DQ+OOhikZg4s+yVWwczDvAhyPYMqMPJKTW2db9tuNsV?=
 =?us-ascii?Q?4N5O5Kbn0lwjdxovbU0P9QTxiwwf/NgKb/Mnjl9GiheNSC33Rzil+dYJ1wva?=
 =?us-ascii?Q?YSvjujrKp0/AqhWbI/2J5EGMgubSLvESw5I6oXszdjRyGGXd1AFFiyuC1mA1?=
 =?us-ascii?Q?ir6wHMmk6MqnZmSzswzTL71xyBCFAgKughEV4xycgv61SMhRBR9BwpVOoxXO?=
 =?us-ascii?Q?ltNiXCcv9mh0dk4FwOyra74xhssqUW/NDBhb1bVx1oYrkvJtxvP0oFklI98C?=
 =?us-ascii?Q?xd00JqivStOAfOoUq0c/ahOJyvsVoky9?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230038)(1800799022)(82310400024)(36860700011)(7416012)(376012);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:08:37.8174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 962309d4-97c4-4d20-3529-08dc95bf90cc
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7455
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

Add eeprom for yosemite4 use

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 2ac872878acd..9a14f0220cf6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -932,7 +932,7 @@ temperature-sensor@4b {
 	};
 
 	eeprom@54 {
-		compatible = "atmel,24c256";
+		compatible = "atmel,24c128";
 		reg = <0x54>;
 	};
 
@@ -971,6 +971,11 @@ eeprom@50 {
 		reg = <0x50>;
 	};
 
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+	};
+
 	rtc@6f {
 		compatible = "nuvoton,nct3018y";
 		reg = <0x6f>;
-- 
2.25.1

