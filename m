Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D3896EA2C
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 08:27:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0R9D0wxCz305v
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 16:27:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::617" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725604045;
	cv=pass; b=mgoMWPRnUjr3S6k3TKrbM2GjI6CAd1xzw+btl78VLr0ZodR7VD3uE0KJzgHfvLrtZe/XjJSb57CxABUNaP20XKYSZ2R35tnBQJdKdxb2D7uU0CwN8VokiPT3XHqHSOBP+pJXT/yiCbmYYkuXAbMi0oT0lwjGy0RHULERPfn2I6lCRu6Nu2pb8P1zcrVsBWYyL+IklNjXx1+TKbK4CwvxZox8Ow3K2QpMLeuDzzn2blVDqCCiJdl92zpY0WUrjgomWTHHXOO3hYR5K91WB8hZLd6lw+YTG6Zvv5/HaPoQsUyyozmcuN7t77ibqGCaaQIC9lEu+26Na9url0VYPKroHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725604045; c=relaxed/relaxed;
	bh=1xw0YvWMub6UyWojB9t4rgofjGPb6ltkk/JKaMUZ+3I=;
	h=ARC-Authentication-Results:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:MIME-Version:Content-Type; b=BXxf88zBvskB8btMbgKhG8J2Gd5dauErYeHGKnYQO9eRtAhr0WvXR4VqOMcE9A/FxdgAA+/eK0GRUqLe494Mj5bsbAk7CZOT9LQ7yHRlRTyhwxaKPdp3nuzNmyFpVJ/Rz479ZfXmdenFedBfvoOMI8bokqkqlo/CK3W/I1/+Eby6/Z81s3dbC5CiC5yroGjmAhkunnmSMKKYe1ZG9G3pGzL5T+iet+RbR2ZaoGRMf7/ztNeL1Y/xTPHxyP2JhcP+TON649EES2MECsUpTcu8JyIT1TctEnLdmK2oH9GR8/w8uCDDY9uRElgc7lyfSdtizIIzKLQwh8D7v6AloWBaCQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=r8aOEdS5; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feab::617; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=r8aOEdS5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::617; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20617.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0R995G4Bz3023
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2024 16:27:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkLa2u2ZEwkDtpwOdhq/JkJ1ScMUaaNc511MujLDvHoJyShwYsPCvq6X/vJtDTOaPPdH4elkcQjmwzN8+pgKBUL1WtkYFHB1jZCGF554gFVDZg4UfQfw8ztH2F1lRQ5MKq5nMDfgJ17UGRBtnPh98kBDHX6z5PzCe7X7GpuK9j312w488PgzTrivDbrlo4foVmYlCKDhK++xfykfBdk/wmP5ZQhTPtNTLFn500HNjz6p1BYx45dU1YZHNPpp0u12RNLtUM9NYnfxmbiZ6uv/W66VzieRpN6LER7A2RHTiv9nBY/7gFhEhNR5AYdRKxoErxUx0X5bWo5mHvmq03fTeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xw0YvWMub6UyWojB9t4rgofjGPb6ltkk/JKaMUZ+3I=;
 b=u5XnnHu7P672F82kZjihhWMTBKXeANmwKJbGLx08KDOAUss52Xl6qXXAI+slA7eGnGK16YV+WxuwRmRs4QlfXPjf/kNbUkdH/8ZGb94VAxAeIXoIPpbgQ9RAYxzXPj6oys7DtmsNNjHMUzRb1vRQvt8WJxUv74liJran1F7P0Zf1wsl69DRsvsM8ItpvJ17uSqe0+B0kDRHhS6cjnyBh++kNVY25WveKPiaqj2Cm9Q+f0VVVvycGqNDy/QMDX5ipqQSxjSb3qU7JFn/GQ5xsME2+zEs4y/Hlbzf7HHCSsye0yRVoCHw+iNybj7+eB1r9ALVLnuv/8GX/ezT66ZitWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xw0YvWMub6UyWojB9t4rgofjGPb6ltkk/JKaMUZ+3I=;
 b=r8aOEdS5o4nZ6LQ8tGwrWP8hx8zPto69SWGWgKKsPd3cv/cS4tD7DbtZcNu5Mbca1nw81mJQHe5krmghc+2z4tmC+WssPUAMpeHnmjCyW+6j5BzQ222QyZb/2uPo9jEhhYrwLL7P1uS/Q/KhXPII5fii9QXsCSjp6F+7EQqBRToatjKEuZ46sf//uggps2sLml0bYPIzd0M4hIDlv4E2pnKwEbJ9iLHO/CL7/1UDTOl0JjOJUO1tFU10CKAVMUCAnmlPsElk39SvtfIMgqP56CS0PTBQ34eDysNgey53SZ50XvwtWuiDE55/1SA9dHCdUPzkc42ajOIGjeZTuY7cxA==
Received: from PU1PR01CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::27) by KL1PR04MB7538.apcprd04.prod.outlook.com
 (2603:1096:820:11e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 06:27:03 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::6f) by PU1PR01CA0015.outlook.office365.com
 (2603:1096:803:15::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:27:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:27:02
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz
Subject: [PATCH v15 00/32] Add i2c-mux and eeprom devices for Meta Yosemite 4
Date: Fri,  6 Sep 2024 14:26:26 +0800
Message-Id: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|KL1PR04MB7538:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ef24246d-3961-4887-ae66-08dcce3cebd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?gUNFmHkTkwDQl6oLflTyQBSVEJg85y9gCaFLAPeGqaMXdSMAAJO8reGwkAg9?=
 =?us-ascii?Q?eI9fdivQDMgs5iaZbXQIvFTxKwunNw0laO7RWwUNU5STwP31pXzcmsUs+KlM?=
 =?us-ascii?Q?3Xxku3mclg7sjlWCpfrE+fHv1Vie0RgkRVPRuBd7MazU08mP/Y6J9krKWd5T?=
 =?us-ascii?Q?nWa14HqodmY1sFm3HPphNaRMeyeHyk5TNGOO8Zxjtls1UtB3yR0te7/zFemr?=
 =?us-ascii?Q?QvqVy4Ko/ar9HFbn0uL2TNddtRDqqEhS6HfZGG1eR1lCizCOCZmu7ZStBVG5?=
 =?us-ascii?Q?bHV3tl2Lsrf5J9Emg8KJJIUL3zrgc9vRvdcQw4BnpOks3+yGgFt1AjmQL6Hx?=
 =?us-ascii?Q?QklJZe5A3XwTnyWfVRMdh81xeHr/aHO5eAsoMYA9vYS5SFOIc8bvp2JAlrUR?=
 =?us-ascii?Q?afOfFJk7uUaT3/q26+ewdp7tmL8LaDAAQoFG460GNgBqseYee0RDAL0EvJg+?=
 =?us-ascii?Q?k9oNi8eGgqXoCveS8RINiGdbVirU1baRsN81Wd65awWQxk+MPuRr0U1bLz3c?=
 =?us-ascii?Q?AslDTPHyKLzVdGH0qsHvHHELJ73tOHXYC6pgGddhrPq0gkbEES1vQj1O+6s/?=
 =?us-ascii?Q?cgSlIiDIbCf6OVTa8DEbDM2HYpqbdZHPd2cjpvZAVmd3AFiHfbMTT4ahR0yB?=
 =?us-ascii?Q?z/+ISTI9KEJf1ZoxpPfzptL9WWQJxJciSgS2lXyRKoE2QTdUbbSQyDtJVbgz?=
 =?us-ascii?Q?wyViXtJ2P38mKG67guxXKw9QKmUubpbPruPvO3Eqyc5TaAQ9USs6RIBEfN+U?=
 =?us-ascii?Q?S7/Ti94SIYAaQk4cNUVgbZ+8PKtwhrsBZ9fTm/9U/fKFdYMoh7kwW+XXidXl?=
 =?us-ascii?Q?JqSQmtNHWZXCSHKZYHOY2eKc/9hFxgIcI8cdwLlQ+OyIKn0ilnbzp4bggSwy?=
 =?us-ascii?Q?zWsL8GbBzIfUmpq9E6kPX+deu5nha5zjYBCaNpE4edY35eetY1NNjYVnh3v3?=
 =?us-ascii?Q?NI2Z+RcnA5OjnOZkNCANtiAxE+f7qaYnfDT4z6gBovkcSkCxBz0ekgWQgX0W?=
 =?us-ascii?Q?h0PtMlAkatLhDKjYQtHidooWCXZZmqRb9xbRLgCTlZXH/YOGMKMXVbpiQf6C?=
 =?us-ascii?Q?Qw0FAi0NkovpvdVgIX1IKtSQXVZVOTg6qvAvYoPYN0Yr40gu5Hhi+O3YHx7/?=
 =?us-ascii?Q?aa0ws6sxRWr83lh6CmrbICAyFBnWrtRb3VrhDedqyQ3XBCL6sG6RAdWVte8K?=
 =?us-ascii?Q?UCwVvCFzpQaeVgiaqYIy7XbH+5gpCL2MFzgHJrbgSZr2EwMkd9lwF/+qyvqG?=
 =?us-ascii?Q?pbFELt/IPORRuWkX1beKavN7UorkfNRyrn0pRFS0Y2Cp+Zmu48LY/9GchFbV?=
 =?us-ascii?Q?fJhaMm61RxGhlKjUNZaNkDXQNTr+GtzKwlw6WzD1IbWa0p+V+vgZMBhVQElV?=
 =?us-ascii?Q?RuLikXd7sli9rG4iEjsbwxaUwlsohZlcvEIibwpkRMDysMSFpfQZRiqolilK?=
 =?us-ascii?Q?fN3rzPiZrRlcwgELtnScFbK/37e6TedY?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:27:02.6783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef24246d-3961-4887-ae66-08dcce3cebd7
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB7538
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Changelog:
  - v15
    - Add ISL28022 support
  - v14
    - Add SQ52205 support
    - Add GPIO I6 pin
  - v13
    - Add RTQ6056-support-on-bus-11 
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

Delphine CC Chiu (31):
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
  ARM: dts: aspeed: yosemite4: add SQ52205 support
  ARM: dts: aspeed: yosemite4: add GPIO I6
  ARM: dts: aspeed: yosemite4: add ISL28022 support on 11

Ian-I-Chien (1):
  ARM: dts: aspeed: yosemitet4: add RTQ6056 support on 11 (0x41).

 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 1753 ++++++++++++++++-
 1 file changed, 1657 insertions(+), 96 deletions(-)

-- 
2.25.1

