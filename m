Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EFE954570
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 11:25:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="::1" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=T/pHHirL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlc5x32Snz305m
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 19:25:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::61c" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=T/pHHirL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::61c; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wlc5n3Cr5z2yLg
	for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2024 19:25:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERdnPKoY5ha3MMGt5NiJoIe+fUqJPyEqSRRybXZ8uBZqYPpaHrc5LZ/I57EJcEkfB2Wo3FDO2TDH2ZSKZqazGNvoEohUoeSq9ItWWTZxn2KQEXACu2+1RDc27Q9QXo7jbNPPgy6viaIcbH2ZMAAh2xEFr2LhxWeSUb9JXnCtcRhNvuF21gjcPVUo1A+Y/mtJyg+gTekwamFJR/TP2qiqjNIAwYHM7Eo3SzAlkkY8Lor2aK4B9+aNNXmV5yCG1iTXNpoFVD8m7rs45+MWKlb7tax3QpZGOtxRmyCPLt4+aYKC5AWMb3cOJV9mfZaUgF9zICnwJdBK2/F2jpySII4Ssw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/d45MbZN7PlvorTo8tdG/2FvNfJPrapsYxhlyovN0R0=;
 b=FVohwfVfuHwTsPxOomHm/NX+fdbyTd7wUgHS0UP2TFqzJErdDdWj0Bl+jrq8EKOR0aqNNg9UYrQUK51DHnBwQnHLR/PZH6U3yNUzVHrW8b8Nza9eMvETyrh1BRr+/SEPAA61iKYgiTYg7vtcqR9w3i6XSmnLl4kxb2mvX4g02w/Sn/MPYD8g1hPEATuGH1089Yc3leGvOp+a0x+rLytsNen71fp1Cl6a3HaetkCKa6WghkvRYpUSBxwO4Gz8a/UnrOJlGFpjdD1xw7pUI50gxWB8mUDGuoc8Uk7RQ85FN+JeoXyG3t+82Q6YrpDizAAzUC2OgoKlIwdpbBJriSH2jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/d45MbZN7PlvorTo8tdG/2FvNfJPrapsYxhlyovN0R0=;
 b=T/pHHirL1Xo3pbXfKWqTYycc9XpxYGdY4dGpHnVZaAv91O2Hh2L/cV+r1ENV+nvDpygWyBEmLDCJzHvbVf7SlynK1q3St5wBoAX6inZmxx9HpolxmmBP2zlCiMxq0Zrk5PRTs7hXQI7X5t4PNQB7GOsu5xbXXH7Ez5Ua23vG4z2z3mQ9UhhZQ2hpiGEQ3xAVtM3wvraWEyWTk4boDullewOfBrlf4hJlfVt3Q6o0JPqFBwMjY44JWffJqw52t8jMgMYQEN50FoWmhcqYb8nNzuc3CRuWhu8ehCYaiD3+GGPB5/eN6CZf9txJcLmQdoQPL8diu+VlknbSQpV9bU5V4g==
Received: from SI2PR01CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::14) by PUZPR04MB6438.apcprd04.prod.outlook.com
 (2603:1096:301:fd::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Fri, 16 Aug
 2024 09:24:28 +0000
Received: from HK3PEPF0000021D.apcprd03.prod.outlook.com
 (2603:1096:4:193:cafe::5a) by SI2PR01CA0040.outlook.office365.com
 (2603:1096:4:193::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19 via Frontend
 Transport; Fri, 16 Aug 2024 09:24:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021D.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server id 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 09:24:27
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz
Subject: [PATCH v12 00/28] Add i2c-mux and eeprom devices for Meta Yosemite 4
Date: Fri, 16 Aug 2024 17:23:47 +0800
Message-Id: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021D:EE_|PUZPR04MB6438:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7d3c5133-ee6f-4943-3e82-08dcbdd539f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|1800799024|7416014|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?znYlumanW/+/EFq56CD4gmb/UjW8MQaCTHFm2/3hoKlCgu36PyrhiS3RGpBy?=
 =?us-ascii?Q?U7WEF2H12A3rdOZLwgYTD1T5TIvDAuU77A0gVJExeak5l8Cm9rWk/fH+nqwk?=
 =?us-ascii?Q?mYoHVfvVQNR8C/MuzrdePO0OxHFepWm9ZEmGtavgcJ4OKb04VQgtJ3F8pKlx?=
 =?us-ascii?Q?lL0pOxhUATxio6EfnE/3y7yBl8e40h9nahd4ysvFJcWv2dgCbamba5PCJ3gE?=
 =?us-ascii?Q?07y2OyEGk4dF7rFQVfTf38AAtfczX4dOixoMWth2cAFz3hUWWA7FCOG7DR8E?=
 =?us-ascii?Q?8Y8clJkpDq7xvbGVPBJsHVHIL2r1VGoEG870E7oIjPaQCzSJ5wJXs0czlDui?=
 =?us-ascii?Q?U8dW42Pvyz2TJSSQiVKUN7WTBT4bViU/CynM+36RbjgYK8fAfzTt+3KWuDiG?=
 =?us-ascii?Q?gRaAMkLniMoaO6Fbv/A28bB8RnIf7p2puO+MSpaqzkI+NnKyj6lQouWp2duM?=
 =?us-ascii?Q?iCyR1MjWK4j6qUdsAiKCyO/T+izjpWenj0l4kuaFV9Fu0Bx8OvidyUM8pk6Y?=
 =?us-ascii?Q?jg08unfnXMf9+2r8dwDdI8Xntzk4P+V9hnY880DwhMtDAIn/TrTsm5Jqq7PD?=
 =?us-ascii?Q?eY1naFdN4pFMv0VF5V/Go4s96VQZwI8CAXxXTRc5b9eoomkAeidONnINaer/?=
 =?us-ascii?Q?btgR9FdJluM69nw1D253P3nnG9EOCnPQGbDerU0nytFSJjhDM/O06Ha2z/BT?=
 =?us-ascii?Q?8GHqBCqqzR6ROaafFINTAK0AGr73E2u4zPAesauAIgltOfHpNt5lMWfkM79B?=
 =?us-ascii?Q?jMMmOZWR5PIzN7P/vgHe2PxQPNsNuEPJiVaB14O7bQGYfgaDwVH8as83+ONU?=
 =?us-ascii?Q?1YIfKBlNKxxtxc3Xsa1vmX7IivR4iAZ8FL9xRpb+7lgVjQOhK1Nb1JfYag6j?=
 =?us-ascii?Q?nadXabUpRNHFTSlBYJCRdDvHfMY6/ZJpKtrJhv21/x4wTqHIjSzz01FugNlC?=
 =?us-ascii?Q?gE8iI9kZdwgBZZJ+RN5pT2+uoAIw/Hc/I8kArkzlGJ+upzgPFZg2g2A4KJ2K?=
 =?us-ascii?Q?2yBCw02SQZcqzOuDDa7VzFmKXmHOBYgIIafBQa+mxCnlXS0w6kEU6KZAsCvJ?=
 =?us-ascii?Q?3T681oYf/U/AXCwyoJpO5ed9UJpfqIjly9XGd+typDk/cAzWg3SFZFicobgr?=
 =?us-ascii?Q?N8JwkYzhOi5guDGjNSszz0ZjFi9KJSvuLG/FpV7GWDeS/WyMTjWX/WRRDPj1?=
 =?us-ascii?Q?RSYaPyAUaMBKz/yRugKst9AT1PEYVy/HbCNnCUwWnMRkUKyQJ1pMA6snJ95+?=
 =?us-ascii?Q?05ZkrAPRygZMAeDcPMNk8xvv4kQJgXSsJnGlHgA6B0YBHqI40jYv8TRBVk6w?=
 =?us-ascii?Q?ex+LE20BoHOaTxKTJIvQMepvcPH5vItLrG85QdTyGj+h6cvTOgjpKHfw88PO?=
 =?us-ascii?Q?on5JXRi2AAPewDFc3TfG6VM3i7XuCTfrDEoHsK+qCLP2SH0/LtbPRtOddajh?=
 =?us-ascii?Q?z5CKRqFi+JCPk0JCt1ZdGrS8aa8GUfbo?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 09:24:27.5441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3c5133-ee6f-4943-3e82-08dcbdd539f2
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6438
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
  - v12
    - Fix GPIO linename typo and add missing GPIO pin initial state.
  - v11
    - Revise all GPIO line name with bottom line
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

Delphine CC Chiu (28):
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
  ARM: dts: aspeed: yosemite4: fix GPIO linename typo

 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 1749 ++++++++++++++++-
 1 file changed, 1653 insertions(+), 96 deletions(-)

-- 
2.25.1

