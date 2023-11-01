Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 077E47DDEEF
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Nov 2023 11:06:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Idwo3CFF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL2jS6QBZz3cQD
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Nov 2023 21:06:52 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Idwo3CFF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::607; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20607.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL2jC00QPz3bqW
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Nov 2023 21:06:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGgTAfBhT5ZvDYt9boV8SC5QLR1nTB5imqc/0X9Vgj72gHTaH2nqzyArWRto5WW+RosODDbeGUDv47Uj9KwpMBOYRKyrElD4RNgIfg6o0xehxONQtmZKTK6ovmYo5eTZynZb/mUnprUl+f7MqjDYXLXfEPuF6KT2jxk4k/BNxCW9lOYvo9aERKg3A6Lze8GLr+ji1IElkY/9v98gTEw1QIYp0kmm1BA3DX63KKBNZxyvZK8rfDsPhETqy/Kvz2yK7f4OnreFH8rwVOL1lgY17plzipVoMLRDEw98jSfikj6I9ksCPOQbboEm55JjoJr4GBkjnClG6FyQdq51+FZcFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/ObEuPvRMYrNY5HUJGE+LeMKxMiSngY3YxFSI9FQY8=;
 b=hr52CEg7n2GLOzYQH62Q08XWYZ0hJrvgf3Qu8JhLITRo5uLDGfKMc3YBuBKGIC4Z5ouMjyNARhjyiCvZNWqdvy01IhFn6qNWehwBYEpuG2UWgdEYnVdSm8staYmz74KGmC6FKzLSFBwSFOzakk3npZRh0ws7WVgUVxrclZnNeEN6yRJWRHAFfni2ZKlwu14zZnxqTf6v5VKn27R0pFekIGANQ/pqKjynfJ4Nji6PNNhpkQFZFyDEtMZiwnC7Nr7YsOK1pKJoW9e+XcxL9yJCdVTR7sbRvC73uQTZHYSScVX1BXZmLV5LExKp1NXsoh/mqs2fZUzM/1SQimLXOEGx0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/ObEuPvRMYrNY5HUJGE+LeMKxMiSngY3YxFSI9FQY8=;
 b=Idwo3CFFA5Bq0ophONsmsw9vyYIMisjJxKDs+rBwIGLy8NrlKC+0A275RdoRegcXegITRsFNFVlY12HTD+kaObIzwjcqgKx32aMS4RFhGbtbRlTfkjjJOHPWFN6KlJyvPrHBBm3kpSZEOZb6Mlhbx/vBN3T0oDLTBHchQ5J6OvN65hORms2VX7bv53QW5LTv+BrZ4Fq3n2y3gJ1xqwUfDNJePxJC63tbQOlCBH8fq/pVch2OSX3aBdeiHhJ2jPqqT7wlXMpO8MGzhKZr5laBcQtZzSkHQcWBdX4HCLetSg8/GVPuIq9+pHqmG8/PQppB0n5W/q1NatMBDo4Nghl0rQ==
Received: from PS2PR01CA0055.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::19) by TYZPR04MB4285.apcprd04.prod.outlook.com
 (2603:1096:400:2f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Wed, 1 Nov
 2023 10:06:12 +0000
Received: from HK3PEPF0000021C.apcprd03.prod.outlook.com
 (2603:1096:300:57:cafe::16) by PS2PR01CA0055.outlook.office365.com
 (2603:1096:300:57::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 10:06:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021C.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server id 15.20.6838.22 via Frontend Transport; Wed, 1 Nov 2023 10:06:10
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz
Subject: [PATCH v1 00/10] Add i2c-mux and eeprom devices for Meta Yosemite 4
Date: Wed,  1 Nov 2023 18:05:57 +0800
Message-Id: <20231101100609.2516844-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021C:EE_|TYZPR04MB4285:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7dae28db-e80f-4511-9703-08dbdac22cbc
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	SCH302Sy2opdFpE9GPPnkOiuif+ccwR0DLcs7rI+g3tEqWCC1C53137TzB3OUJRhIinSRdX/+OJHTzLgqb4FhyGcMzXrd+FRxKz/bdlOR7hIp/jBqbCUWai7DKkxwl7axChvS+5P1/12XmNZHAnlfNrpExbIYkI18LKfu7RuZeOYzzXcmTYnh0u5LdZUiPkpBFByG1nxCn4a2Zzf0noSCxPn6Ki+4wF9VPPAXf2YICqT15EvhRLmaypg6YfnMDezoC8Kf1zlUlagj/EynVQZ4FZm8b9Yi+i0gytpaUV1OoJZpAQlQa1xItcsHb/X2PHd1KYfCg4m0XzQevq26R47ap0TVMxfp+sKdvxse4x+alTrJTkRohoPrOkj6KXfGcy6MPfXdXSraCvowhdQYBjpu6DWkSXKREEisUp+5/GCZMPjS2NCKAGoOAnhxMpnh4RunQIAoNJ2TOIGne8SpzNVnJ9LnK7VurS/4GWXCxBiuTTA4i8GALzbnBo7xgDm1G9cQe05eGcVK3MrrEUFwApI58pVgNy3xqXUkLu/S+UuLeeOCMUpucdTZFu19dil42emXhngHLeO998y6o/ru6GOEf81aXtFCHT2OElFwcQjNGPNkX3ccBV/vCCRQJ6vmMs2lydrV3ztVgV2XTIlXw+zAhyppM5NvkblPdzMX3FReyi2U6c0j/OWJU4Tb9l/AF/EubbLKQIUDdELwwnTEH5EJg==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39850400004)(376002)(396003)(136003)(346002)(64100799003)(451199024)(82310400011)(186009)(1800799009)(46966006)(36840700001)(1076003)(26005)(6512007)(6506007)(478600001)(6666004)(4326008)(9316004)(36860700001)(336012)(7416002)(956004)(8936002)(83380400001)(47076005)(41300700001)(5660300002)(36736006)(70206006)(70586007)(6486002)(2616005)(8676002)(316002)(6916009)(54906003)(82740400003)(81166007)(356005)(36756003)(86362001)(40480700001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 10:06:10.9937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dae28db-e80f-4511-9703-08dbdac22cbc
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021C.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB4285
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Changelog:
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

Delphine CC Chiu (10):
  ARM: dts: aspeed: yosemite4: Revise i2c-mux devices
  ARM: dts: aspeed: yosemite4: Enable adc15
  ARM: dts: aspeed: yosemite4: Enable spi-gpio setting
  ARM: dts: aspeed: yosemite4: Enable watchdog2
  ARM: dts: aspeed: yosemite4: Revise quad mode to dual mode
  ARM: dts: aspeed: yosemite4: Revise power sensor adm1281 for schematic
    change
  ARM: dts: aspeed: yosemite4: Add gpio pca9506
  ARM: dts: aspeed: yosemite4: Revise i2c11 and i2c12 schematic change
  ARM: dts: aspeed: yosemite4: Revise i2c14 and i2c15 schematic change
  ARM: dts: aspeed: yosemite4: Initialize bmc gpio state

 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 1026 +++++++++++++++--
 1 file changed, 949 insertions(+), 77 deletions(-)

-- 
2.25.1

