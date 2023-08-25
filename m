Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E8B788379
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 11:25:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=oYipo8fK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXF0t6b2zz3cBY
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 19:25:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=oYipo8fK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::601; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXF0k5wpXz304l
	for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Aug 2023 19:25:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RC5Yg1HaZ9XPGytjCWQqA9QcXtxTJBVzVziJwTLUA9Ax4ucKw/Qal51L+pkPA1FjxPpCHybhvNLeOJetsoOFMrwTagPQuk0FAym2hfmyPi6XQKOUjfCpIT1CJ+kmV3iuFP9t0xjxqgdOl7NIe38p+TJo4jJ5H7u5p2J2Vz4arA4eORROpBbzWj09XEm4CEpKLbZXPwwCPWbiniTvI4Q2jdZvRRMzFvAjKZ1AUZdrCaLIwdPoNElhdFbWGkyJgZv8O3xJVgRc7LjzfmtrhNi7itphxLitiCtrIVJkRCiJb2lMPVQgHDuyTX3MGmoP7GrbsTJWM37Ongg3uynN4Aul0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xH3IzbED46jcHIu8ANMo/JSmZFVL49rnfledr5HxCl4=;
 b=hC4VpSAF/uP8yo1KAyvYwIhiMLy9ou3+W12CbSqooOx0suZC75WWFadAarQx689HRAyVAP614j3KQ41IT9bfVBGRcYeAmOZ7BE2TE4KOfQtHHGnYTVSsY6JgTgq9AzvQtAVggwxwfb/NvB8KIlRDXUyZsrekcutY6RgUo9Rh/VkwJ5GnLOjJmuMG6hHePz/MKrBwcMH/XxDHtJmC2vkgbUMgom5SDoG/4QNoe2lggr/sXFvjAPtacKmTnBMFcbA1a0Jc2RGUJ53ykyvYR2uRwKtn69fHTcuDVSMfQaRyYqI6v3FbkbXBymBrYG07NF197NTyhIoZpK49pWj6zoDGaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xH3IzbED46jcHIu8ANMo/JSmZFVL49rnfledr5HxCl4=;
 b=oYipo8fKbGSEue1gt/adLL2eqDA5QDN7RfqEC/Ah66o2nnHc/krTlW/yAGqoBNJ9etWznvdEPRfRsW5LTnCR/l5ZyxvAz9sV9AuGlNe3M0UDiodpRoVWiR25cWMhxn0nLrYtxQzsrOQTSCkbVD8/3JYCZpw9iZ2g+qh05MeWDW8XqHTdk6EoD0+COguRNMroyRDZcQcbbw21PvOOT0ouLZZ5fjxa1MUDgU7QpPI59eEfplsbsoZAzYwy+8pZhPBjlXRYmNGBIxWNz4vtHZ1Ur+9SvANEiHM+TYPSvfhqgzWnQC7rxvP+2L9cduahOqOdorp+qDgcDlAp5yVj7v6LJg==
Received: from SGAP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::20) by
 PUZPR04MB6843.apcprd04.prod.outlook.com (2603:1096:301:107::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.29; Fri, 25 Aug 2023 09:24:43 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:b6:cafe::db) by SGAP274CA0008.outlook.office365.com
 (2603:1096:4:b6::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.30 via Frontend
 Transport; Fri, 25 Aug 2023 09:24:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server id 15.20.6699.15 via Frontend Transport; Fri, 25 Aug 2023
 09:24:41 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz
Subject: [PATCH v11 0/2] ARM: dts: Facebook Yosemite 4 platform
Date: Fri, 25 Aug 2023 17:24:35 +0800
Message-Id: <20230825092438.2082402-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|PUZPR04MB6843:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ea514e13-e4cc-4c08-47ec-08dba54d1cf0
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	/W3dNldsLINX7xGuIIAneXoLl5RSywErQ03AEMBDsCvNbe4hcFHkerSgpaoNEf9pebqAyJIgHzjQwO+kau88ew8yG6ooKepTFdypuL1ZXiFHFElvIgIQAoEOgH6lX2+urmBsVInDiFT8CYvO6H15Ebt7Em9oM3weu/RUFZ8j8QJc/ocbb6xSaQAoaXNPeFeHUrIYMD/YF9tR7h3ysWYVs4agcfy+qsirBbqLWWUNeTcEkxiqGiyzNYUxZh06ZCjMtdbMplOT4djWm9pPJQQEEa30aY9mRHLczSf0Lom9kg73Q4RqPyNFSfrHIfFLdXpISuPgicd7mURbpPLy2GQULs06KqHBZfodY+xF7kFPp32EAA6WAeCqwKcfRoRvZiokHwvy6zJFydBX5+uakU89MXZtiTmdwegR44pjL1dL5WZQaF8yUXMudl+O/w8ONsN8OHFHnfUzQNpZafQLDd5jpCyUj4rllxSR//TN9fBHH9nwCx3QcvXyuD3ynB9ABUYNWhpmj3Ez1YI5Ou1BETnflna7b94e/tfpIo9Sxahd9q+vrb/LrY2yXwa819NHwCqfRP5CUpdUMpP0hAuNtO45lJqTYyBAxU+xG7Rb5hx7ajrcMltXJ21MRu3dVNwMq9UdScMcHsPIsghswqHwdutbp7WbK+mZdSgD10Ui6zyo94ew4+PUFPCbTDo0Cgvqt8S7/JVzbyekSxRoNy9QazWvdA==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39860400002)(136003)(376002)(396003)(346002)(47680400002)(451199024)(82310400011)(1800799009)(186009)(36840700001)(46966006)(82740400003)(81166007)(356005)(8676002)(4326008)(8936002)(54906003)(41300700001)(6486002)(6506007)(6666004)(316002)(9316004)(36756003)(6916009)(36736006)(70586007)(70206006)(86362001)(6512007)(40480700001)(47076005)(26005)(478600001)(336012)(36860700001)(1076003)(83380400001)(7416002)(2906002)(2616005)(956004)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 09:24:41.3224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea514e13-e4cc-4c08-47ec-08dba54d1cf0
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6843
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
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 1083 +++++++++++++++++
 3 files changed, 1085 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts

-- 
2.25.1

