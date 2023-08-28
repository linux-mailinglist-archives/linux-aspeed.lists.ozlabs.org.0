Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC8378A613
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Aug 2023 08:52:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=zP9KfCfX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZ1Sy0LKLz3bWH
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Aug 2023 16:52:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=zP9KfCfX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:704b::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZ1Sm4Z2Tz2xrD
	for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Aug 2023 16:52:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJHCwirG3jtd7Ywe7Ic7JhmVBpvxky/V1x8nFvIAuls2VndjQPPnVTGAtcKVxVNgM43kmQ+cKISRXTJPfSESZ7iMp3a9tZ2tFG6SRlzRs/1zE9Bn3lcH+qOU7TGceTFQTwajk095QrOijWJmgHEwbyktv+emhFgM2L2Ft/M1AVpe/brzzPJykqIx/jZgEko9XBUzmOEbbh8C51WLc4+OzVg8ZZLDmMUKlXgzpvlWQxV4GWz9Adkktoz9qFRYFEu8MjwAzhIN7ifqJCMN9O7zJmw239VZ3ZR7qyuTqx1v/FRTeiKfXWwS0In2MmeXb+UMtst0RQhJ5HHN7NSQ/ISdhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lT9H1Xu7nr08EComw9v6/D98XAnzFs4jOb2AYH1HYHg=;
 b=b6VxwQHerj53Yyzlf3cvG7yNUOeqZgH3lYuzUrrmr8UG5vrEYqgvX0vei6qQYPnV5Ks/jYtw5You1MjxDwWciuBf099kBATMnL2jtKltD3Y68JcbU21zbRvLWOWioYDgfUXiQp9g0SKssTkQkuVjJ13dIlQyC1Nx3/VMDPcGUl+4KTmbH00oAlndSrHpjCS/Y/9dXUkL2HSjv7Rua6EuZvumbpel77xHmWojAzosPCD2gfWWmQVTYHSInMsasV4t8Z5jxeTBQFFMqYpWtmrcS8uM5A/obxv5dF4XvikXR0NXsxKeLDgvt9UNjxP8gwx/nfGmVT5023700l8+wqGMMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lT9H1Xu7nr08EComw9v6/D98XAnzFs4jOb2AYH1HYHg=;
 b=zP9KfCfXKwp2ilOy5snAlzvonjpj8096NiFbmrbH7NB7Wcjoa3t4f/B7RTW7JSmInt7t5Pw2ThBVQYNfuz4rpWTVfm4qlEMUBceVZmnPGneZ0CLMyaBSs43GQDXabncxBHdjVtQleuk6hIcWIFeQ7jyP/Bt3IvFH+LaW2rrGYqzJUQHE3wSV/L8NCN7hCyP95HXEdceJOjxeeuaw6jn/6xng9k3zbdsGiEmKRqdrYiwKGFZu0QRYVmHR4NtBVdrzRHN1C2XhFwC6d22s3PTubGcBrfb8eNokXVVpm+me73I48Ucf37yWXjI91cAFyPCKbZv55BMXdjbQN7q5Yyb1eg==
Received: from SG2P153CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::6) by
 TY0PR04MB6342.apcprd04.prod.outlook.com (2603:1096:400:329::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.34; Mon, 28 Aug 2023 06:51:42 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:4:c7:cafe::b5) by SG2P153CA0019.outlook.office365.com
 (2603:1096:4:c7::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.6 via Frontend
 Transport; Mon, 28 Aug 2023 06:51:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.6745.17 via Frontend Transport; Mon, 28 Aug 2023 06:51:40
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz
Subject: [PATCH v12 0/2] ARM: dts: Facebook Yosemite 4 platform
Date: Mon, 28 Aug 2023 14:51:34 +0800
Message-Id: <20230828065137.2332953-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|TY0PR04MB6342:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4ce7d551-c114-4adc-b52f-08dba7933b7d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	qvSCMCz3KWFXgy3rKkRL5kq6kDUnsVlHGyXfuqWJT4aZxaPGihfg0RTkoCEPsU6VIDwUQ4dhyFwrDFqLGJjuYrF/1r3PoKI7sx+q7CCuKFGy9SjPC8v8FBhjADmHMmxl1QEKQ8R8kVBJg686WSyhf41hUlxiB1axZ3rIi4V9zMnge5tN1Q/TcM+xNddUtKCpK/C+cgPry8LpPL3DWADYi1VwRqMy6nCZIiPK4SWiF7gceyVm1FuHB+NlaqpLB5pNsIZ+h/BI34to/CK7cYc/W3bZRsxm/mQyLQMUbAPIzmwQoczekqVJ0OZHAxWCl+IE0kSCBWinlZlwNH/doHCvRp5ZddTpyQ7lp7Ho7Os/K4cqmBjX2IAIToiVAJwRok+XXdn4P5s1iH5ip9jc5wzirBnuIrneiKzAOCgZ0sZeEWApFseF753YGVQ68GCak4S/pRP6R0iKYadwkCy2uK/4b8wXfMIVOLcWThUMqQc2KoaHwC4HW5jS0/tMDBvUEdPlIeHMLvi980mY/IG+PzkGMniMP9IUwy/Cl0DXyEbY0wwi9u06t1HK8eWxEIb3dshbzjSwHhM/rGyN4NgpTKw+m4c8CBvQ2OCwSgM7+6CJ/21CXnppWgWPmDhWZcwE2auyX06jnyHd/riytO4sNO1cKBOqvMv3gcMw8YXU0HglRW/vxoYIu0GNy07Z21XS/2zite7U4SbM9HSJfFHCIxxILg==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39850400004)(396003)(346002)(376002)(136003)(47680400002)(1800799009)(82310400011)(451199024)(186009)(46966006)(36840700001)(6506007)(6486002)(6666004)(5660300002)(70586007)(40480700001)(36756003)(81166007)(86362001)(356005)(82740400003)(36860700001)(47076005)(1076003)(41300700001)(336012)(26005)(83380400001)(478600001)(956004)(2906002)(9316004)(2616005)(8936002)(4326008)(8676002)(54906003)(7416002)(36736006)(6512007)(70206006)(316002)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 06:51:40.0994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce7d551-c114-4adc-b52f-08dba7933b7d
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB6342
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add linux device tree entry related to
Yosemite 4 specific devices connected to BMC SoC.

Changelog:
v12 - Add spi gpio config
v11 - Add imux configs for i2c-mux
    - Add gpio and eeprom devices
    - Remove temperature-sensor 11-004a and 11-004b
    - Change power-sensor ina230 to ina233
v10 - Change to 128MB flash layout from 64MB
 v9 - Remove mac2/mac3 duplicated setting about no-hw-checksum
 v8 - Add description of Yosemite 4
    - Remove unsupported ncsi config
    - Revise i2c-mux config
    - Correct power sensor i2c address
    - Restore i2c 11 bus-frequency to default
 v7 - Revise changelog format
 v6 - Change project name from yosemitev4 to yosemite4
 v5 - Revise rtc setting
    - Remove duplicated multi-master setting
 v4 - Resend with cover letter
 v3 - Revise the bootargs to stdout-path
    - Revise i2c devices
 v2 - Revise the DTS node name
 v1 - Add binding document

Delphine CC Chiu (2):
  dt-bindings: arm: aspeed: add Facebook Yosemite 4 board
  ARM: dts: aspeed: yosemite4: add Facebook Yosemite 4 BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 1102 +++++++++++++++++
 3 files changed, 1104 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts

-- 
2.25.1

