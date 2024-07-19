Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 280E6937371
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jul 2024 07:59:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=rxmlZyOP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQJsw0PCGz3dRH
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jul 2024 15:59:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=rxmlZyOP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::622; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20622.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQJsl74Jnz3cK8
	for <linux-aspeed@lists.ozlabs.org>; Fri, 19 Jul 2024 15:59:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvM9aRCwB6IK/3WyEHmpBZ2TsR0ywXUAztNLYx0lD4zfXuWYMxANs435whLA1EYtFDtcOUbwrIUBNjAK1c0nAN2k15OdZCbOy/5YTRG1CHGI4OPE+KRl1L7YMLZ51eQkd5UDdzZky5ABqpNTydzT05kBw98SWVhDukAvPybAiMTmosFz5k4cUcpcJUJJHt8foeltXd4wHQXtM0LUsa8rBn1lBP5ZriDENlFAI3nyfaMfgFhCCWBV/GhuDn29qck/UnLMt3MjYEXdaYzhe0kNHR5DLGDHSGCVMDQCZw/NGfSpTu7n02iPy8Ruwxv3gbUShquIRFiwjziqkte8pJwvwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfglE2V8n8TQF8wA6TT/ltpHGJ+hI83lDbWK0kbOWHs=;
 b=K0VbEYzyjJ57zysFO9zqb/AB5C7JSRtE/82up3EttEQse7v2jYglazvdYi+/1L8sEdigVLhHll6pRQ6ry7qkQfxxSI0j1elu7hx7b/UFqk3QusfQm+6euSSo05P5VVJA6rOFyxEdXbjH6BcWgG3FUetpKCHCCJxSPkSHYfLt5N2x0JJxDg+Syr5pVe/NWhPbIPHNGvHEXxKuXb6pi6TG/bJcuuwl/soLnNXv42q0HXX+VOT4c9N0xvUFRnei/11UUlHjdFdTfGxsVvmkVys9xxcYNoftIeLhG+WEdpNg0P0ASXzpy3URGmss9/lTPJmr1ncsL7raZa2s9HsuEQKHUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qfglE2V8n8TQF8wA6TT/ltpHGJ+hI83lDbWK0kbOWHs=;
 b=rxmlZyOP04AGKiAiJFvDiXLaAwv5X2m9wB3HO4wHlqX9z1U+LZ1TQmBzZDCE0sTuV/D07CBfUNW3gCTvlvRA+BoskkdSdT9yDiBGjpWr0pjRT/8amTuuKAHjzhuvAWZx3Q1QUi/haW2VmyfBbkSyr6TZUOfvbuj51SyDouMfPO2G2Pw+SpD8bDFR0XUb93BtkBcJDCaVBuNjRhmYSg755kcjp9eqB2D8FMSdWUX9aWw5CNth7AllKOlOSWsaZo9wXMRAIMayTGT1Mq204yeLXl2a5gDQ0H7c+zqyTWDVQp7yC857LVXv/T8hX0gUgSgw9t1SfjeqoWDUIZMJfOVhag==
Received: from KL1PR01CA0075.apcprd01.prod.exchangelabs.com
 (2603:1096:820:2::15) by KL1PR04MB7611.apcprd04.prod.outlook.com
 (2603:1096:820:11c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 19 Jul
 2024 05:59:17 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:820:2:cafe::1d) by KL1PR01CA0075.outlook.office365.com
 (2603:1096:820:2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Fri, 19 Jul 2024 05:59:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Fri, 19 Jul 2024 05:59:16
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz
Subject: [PATCH v10 00/27] Add i2c-mux and eeprom devices for Meta Yosemite 4
Date: Fri, 19 Jul 2024 13:58:29 +0800
Message-Id: <20240719055859.4166887-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|KL1PR04MB7611:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 364a67e9-cf35-496c-5988-08dca7b7ec87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|7416014|34020700016|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?U3aZtKZs12FPZ3hVao0zm+kzSYq6QPJVagtViGgAbpN8lUS/p0DdyLwxkXm7?=
 =?us-ascii?Q?Ps3ahR/ZGO+9okIBCxecx2s+nXVvX6D0jvYKmbZO355BSxMtlSlI7svUIUDn?=
 =?us-ascii?Q?us2WLTQeFdq2NMnwfKhU55Ef4gq1JT7qmyG2Xy6JjHQ61IRQHmNZPzs3oOfw?=
 =?us-ascii?Q?5NZQGvAgWUAhdK/EZet6JA0xax1mMZp5q+07ejwCCyiFqgkG/ujoYf9bPQSY?=
 =?us-ascii?Q?4Nq9078qhZ6knq+f0rv8/cjzY0S9lbdNJqk+zkaD/7Hx+yrpTxu8yfTFm2y3?=
 =?us-ascii?Q?GbKaiSSNUvic2YYNPRtpZnAE9sL5j/0+RxPOQ/pxAPSVMC+Se9L5RA9YhJby?=
 =?us-ascii?Q?NV5hkbZwpO7z+yQ+c2+dgzPCti5/tdAwDhu+om4iNlF8bNZ5lUV+ywEjkQgd?=
 =?us-ascii?Q?4MDCnS+4Kfyg0lC51dpHxzVKwLpS8NJYmiU3PO30Q4f+pqx+Uy/YmzVFspjv?=
 =?us-ascii?Q?2Q1Y1iEhOxR91t6DYzNJlSUBbjqXpHLq7kF/ScM2pI4Oe2jqbTpYt1Fe9nIU?=
 =?us-ascii?Q?OnLqjL68Wiuw6qc334RdLj6B240J9vh1HSeFdT2eHQZRv6ZKvZS7rn4xMH7N?=
 =?us-ascii?Q?1rIOvgrrCv0xlcZRZsactnIQOy4YD4XA4gUm8uVPb1lMqD9jweQxyi93+IRm?=
 =?us-ascii?Q?g00Jsa4ClfnoL2W5qbYSHGlT5NAKtawagvWlFwyEu7NQtck9S3SOaepv74y7?=
 =?us-ascii?Q?70XV5T7PkKIYAa3erAuJb/yq9kAocfS6YsX8rpEaQA/A40xveYcLWEKd/jd3?=
 =?us-ascii?Q?F3nfUi6U9mbGdbuO5Aw061/uoIScA9F/BqVhCq/lLw/dk0dqGZC5Xo6mouav?=
 =?us-ascii?Q?F+TnQ10GFnYaQRikJ2rbVdNtOcI959GWyehiviB4VrbIjfpNVfilmkn+SmuE?=
 =?us-ascii?Q?N+CtnAnjpld3Chj4ABwtfFe+4fHziFKpW3wagrYZGgtVjs4U7CetN7/wbtl6?=
 =?us-ascii?Q?Q7sfu4Gg7+9Uifw+mkHB3RKaeX9de1kcQyNr8iBq8aq4H5xBuSb/uOlQ6SEC?=
 =?us-ascii?Q?knUAKoPCtit0erwOOv4TonKtSo3S6gtt0hFx/rGBg7gRmjj94XmBBGMH7E7T?=
 =?us-ascii?Q?S2lC1aw4AWJ1m7hDm6ADOR5QEPQCP1M81es51uz8f0Qc0kNMVHh2BQ215Sbg?=
 =?us-ascii?Q?sm8g6h9zR34Go/Nax432YIfJe02JBwIE/Ys/HnlMeABZphA9Kjzs+qjIdNEb?=
 =?us-ascii?Q?hoEOV/lVHHlwKEx+mTAi791i2Oa2z/GVWe1APHfwGZ67HSWgEbrfvu0G0iho?=
 =?us-ascii?Q?p3hs3kSjwANr0QAUx6vFe0mBcPEkDwMg/K9yu9pvmCc3dVIIwQANsm907hru?=
 =?us-ascii?Q?4uH7BousS0oWftRUsK8HMWvrpbaAVpnKO0yBgbn03MclLSr42mdEa/7x9Uop?=
 =?us-ascii?Q?LG/DfetwBB9tEkoszeZo+MRmxhv29w7Ci27/lYmIElho+CZ3+ZgPhkcGH9c1?=
 =?us-ascii?Q?AdxfdoY+BnT1Lq6YntybJyjDBZrbgUKj?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(34020700016)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 05:59:16.6571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 364a67e9-cf35-496c-5988-08dca7b7ec87
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB7611
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Changelog:
  - v10
    - adjust mgm cpld ioexp bus
    - add GPIOO7 name
    - remove mctp driver
  - v9
    - add XDP710 support
    - add RTQ6056 support
    - add MP5990 support
  - v8
    - add fan led config
  - v7
    - Revise pca9506 i2c address
  - v6
    - Revise i2c duty-cycle for meeting 400khz spec
  - v5
    - Support medusa board adc sensors
    - support NIC eeprom
  - v4
    - Re-format gpio linename
    - Revise i2c device node names
    - Split patches by logic changes
  - v3
    - Correct patch for revising gpio name
  - v2
    - Revise mx31790 fan tach config
    - Add mctp config for NIC
    - Support mux to cpld
    - Revise gpio name
  - v1
    - Add gpio and eeprom behind i2c-mux
    - Remove redundant idle-state setting for i2c-mux
    - Enable adc 15, wdt2,spi gpio for yosemite4 use
    - Revise quad mode to dual mode to avoid WP pin influnece the SPI
    - Revise power sensor adm1281 for yosemite4 schematic change
    - Add gpio pca9506 I/O expander for yosemite4 use
    - remove space for adm1272 compatible
    - enable interrupt setting for pca9555
    - add eeprom for yosemite4 medusa board/BSM use
    - remove temperature sensor for yosemite4 schematic change
    - add power sensor for power module reading
    - Revise adc128d818 adc mode for yosemite4 schematic change
    - Revise ina233 for yosemite4 schematic change
    - Remove idle state setting for yosemite4 NIC connection
    - Initialize bmc gpio state
    - Revise mx31790 fan tach config
    - Add mctp config for NIC
    - Support mux to cpld
    - Revise gpio name

Delphine CC Chiu (27):
  ARM: dts: aspeed: yosemite4: Revise i2c-mux devices
  ARM: dts: aspeed: yosemite4: Enable adc15
  ARM: dts: aspeed: yosemite4: Enable spi-gpio setting
  ARM: dts: aspeed: yosemite4: Enable watchdog2
  ARM: dts: aspeed: yosemite4: Revise quad mode to dual mode
  ARM: dts: aspeed: yosemite4: Revise power sensor adm1281 for schematic
    change
  ARM: dts: aspeed: yosemite4: Add gpio pca9506
  ARM: dts: aspeed: yosemite4: Remove space for adm1272 compatible
  ARM: dts: aspeed: yosemite4: Enable interrupt setting for pca9555
  ARM: dts: aspeed: yosemite4: Add power sensor for power module reading
  ARM: dts: aspeed: yosemite4: Add eeprom for yosemite4 use
  ARM: dts: aspeed: yosemite4: Remove temperature sensor for yosemite4
    schematic change
  ARM: dts: aspeed: yosemite4: Revise adc128d818 adc mode for yosemite4
    schematic change
  ARM: dts: aspeed: yosemite4: Revise ina233 config for yosemite4
    schematic change
  ARM: dts: aspeed: yosemite4: Remove idle state setting for yosemite4
    NIC connection
  ARM: dts: aspeed: yosemite4: Initialize bmc gpio state
  ARM: dts: aspeed: yosemite4: Revise mx31790 fan tach config
  ARM: dts: aspeed: yosemite4: add mctp config for NIC
  ARM: dts: aspeed: yosemite4: support mux to cpld
  ARM: dts: aspeed: yosemite4: support medusa board adc sensors
  ARM: dts: aspeed: yosemite4: support NIC eeprom
  ARM: dts: aspeed: yosemite4: Revise i2c duty-cycle
  ARM: dts: aspeed: yosemite4: add fan led config
  ARM: dts: aspeed: yosemite4: add XDP710
  ARM: dts: aspeed: yosemite4: add RTQ6056 support
  ARM: dts: aspeed: yosemite4: add MP5990 support
  ARM: dts: aspeed: yosemite4: Adjust ioexp bus and remove mctp driver

 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 1421 +++++++++++++++--
 1 file changed, 1311 insertions(+), 110 deletions(-)

-- 
2.25.1

