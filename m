Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A8B7770E0
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Aug 2023 09:01:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=r7Dedyxs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLyWb6sV7z2yTN
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Aug 2023 17:01:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=r7Dedyxs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::626; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20626.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::626])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLyWK5HJwz2yDh
	for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Aug 2023 17:01:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V87fNJQsSG1OYWYR4OFOx5tWQE2P4j4rtELNAzBy/d1lVKc51HiAyxWlWWXPChmzMCobBPn846Md8eAzx/dZDxvTJII9E96jM7zkmwXHQdz7VvYtJgXqHFCCi2rBVG3XH4/WlH1o+LQw5AXTZ4lFaYBrnvmr+/dTpkVLaXrZSZiZU/POes6w4HDi816nHy1qYjAJCJ/SrSPPpO6hTi7rQK74M+j4g3Tr/LYzVOtZr4Gxv3Zqj1E/pbLICyViUzEFt1ywbQOm9BtgA24P2f2ZOSnqPeyyHAn1DDyDxMg7p6XqF7p8WuauoJW7RzZTfpKi6jzrMgbZX5VGdHJ8JnkYrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgHhB2kLoKNBTemUKbgNJmhf58+RFof0G4IFpPmSkcI=;
 b=Es5dGoDAF+/CNpRvqybUyY1zS+cRlvIY84Lm0kShfBgOMPq5Kxsl5s0lidACYzGOQ0LIXaP5Wry777LP26FVhf3vI+IitFS4H4iww0WcHO3MJ8zwm0g0x387QrphxJjrlcg007Tc9l3l7PhXuCWQb4MJDU00LdmvGkp+FdnJEHF4KuMHXoPiYLDSueu4Sc9w0djZ22ow+Y/+G4uvwffPAcsWtSLYxNXdsZ/V41uO5IQUFGJZ625yRwnDI8LNVdeFfJqy+6ZZ2GShNgUqN97TMx6frKSa+ThGetdFyM1oH8/V2MNwGHs8go5d4DQ9p5gIPw+AlmJtZ/TgNDcT2HUAiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgHhB2kLoKNBTemUKbgNJmhf58+RFof0G4IFpPmSkcI=;
 b=r7DedyxsC0NtT9BPQVC2ukgRXHoPW8yrwxu3/nNqDpks/14gLpY5VO0la0/vrYxRIeIugDYoL4gydkF3b9lUawyz8B4Wgdm4uXGnBLkvWdy2TFn7gGtI2weBJK2sHOFcQC01/cw3xHdKQpaA4BBBlyP/t7UObwfDIXdtrTD9xY7a4F8HJEaS1HQrQ1oIb8GFbBPWytCyiSw8E+iARnAvxnEZOi8gUT7Ilwv2ySgfdpmhUXAM3lAs5NvPStLvPRg6WugkvX+pluGBtFXWuHMYg/NgGjXOz3SE5whnEbe2X/MPNfN9neX0nozNB+q3hTMMSkhkVG553v6zQoE+qMvhdw==
Received: from PSBPR02CA0012.apcprd02.prod.outlook.com (2603:1096:301::22) by
 TY0PR04MB6422.apcprd04.prod.outlook.com (2603:1096:400:27a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 07:00:35 +0000
Received: from HK2PEPF00006FB2.apcprd02.prod.outlook.com
 (2603:1096:301:0:cafe::f2) by PSBPR02CA0012.outlook.office365.com
 (2603:1096:301::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 07:00:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB2.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server id 15.20.6652.19 via Frontend Transport; Thu, 10 Aug 2023 07:00:34
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz
Subject: [PATCH v9 0/2] ARM: dts: Facebook Yosemite 4 platform
Date: Thu, 10 Aug 2023 15:00:28 +0800
Message-Id: <20230810070032.335161-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB2:EE_|TY0PR04MB6422:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c2ccfd60-778c-4345-28bf-08db996f7e93
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	GTJaN53PzUieN3DD7cpA1yFcuZbG/ouQwhlKfDdsH17yK7h3mxTUFIDS2SPJT3tjwk2bAMNWqJM1QrEQ5IpdCahXUMF1a4g0rfvNoK4poDVHertA3srxg+QHsr2zTEb/fTu9epFizShtmFTxK6KDpoRBmh12R/TUeKmouvjxmRBtTTSPJQjZx6g9kd02pjR35fMhIIMdV5CjDeDVgYQOvVi4CoXh23+ja21UPFoX16Ey0ngSD41E6nBGP29TB59QlFzyk4GE5CYJkm58NVEvWyQDXrGb1GVfsVnf4OMIaGM9XxWWo28PkffFErL/j4nzPNrNAWzYmU3eBvohUHey6Y5SFAPsPOGU3W3LZloA30F6CbDnNpX91TNqR+iTUVw4F9GKfLOwz8CVZ12YbjjwoRLi3kLIiA9kR/K1kPEuoJpG6G3pfq289qd1BVcZv390fkf9r1GwRShMGceSTFOakFzlPAF5BBiBiLhzFzhiJtmxfzweaQpl+f7rrcCdOCDleJ/tqgcbJ6bZj98/ZZfCxgdEskmR6Rt3/QpWz563s8zpBYi0jhQu9m86Bmoftq93+GQvrw5FprK6sMNjMNfHUJLKHURW6pCoHh+rj5+mGK243uzBsMsrY+xwNpTSZ0NifD1gS22DjUiWvLGDZzx7u3Gq/lzckXL18TFv8Uy/gPEg2Wcs4HGUwMyu33CoTVKzokWEOIFa77Qww5gBP8FUSA==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230028)(6069001)(4636009)(136003)(376002)(396003)(346002)(39860400002)(47680400002)(1800799006)(186006)(451199021)(82310400008)(36840700001)(46966006)(7416002)(70206006)(70586007)(41300700001)(6512007)(6486002)(36756003)(6666004)(6916009)(4326008)(5660300002)(36736006)(8676002)(8936002)(316002)(54906003)(478600001)(40480700001)(2906002)(36860700001)(82740400003)(356005)(81166007)(83380400001)(47076005)(9316004)(26005)(1076003)(2616005)(956004)(86362001)(6506007)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 07:00:34.4706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ccfd60-778c-4345-28bf-08db996f7e93
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB6422
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

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 624 ++++++++++++++++++
 3 files changed, 626 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts

-- 
2.25.1

