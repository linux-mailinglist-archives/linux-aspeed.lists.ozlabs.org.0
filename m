Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC52628FEE
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Nov 2022 03:30:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NB9BH2F47z3cK5
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Nov 2022 13:29:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=hc9dDsk7;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=40.107.117.83; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=hc9dDsk7;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2083.outbound.protection.outlook.com [40.107.117.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7l7X4M3hz3bY8
	for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Nov 2022 14:49:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRjAtyu/mqemQLKkxU6cp+RPit6OLRTIBbDc6jnq7JOhEqXLmQJnxQJ/wplqOS4RFCSYpVXPotyhJMgPLy5WKHqA7EO38KMOgXGO8wkLwAbzarqOe1fRJWIPd1rFVLFXr2M3GBVG7VfBfAcYxokaOK1WuDf1JV4DVjRfcUYuaQ05w7cNe9UA5TNW5wJP28sSn1CEvXWJCpBH7M6PpBeogeQDnivFVeQOscIX2jZ7XOUHTsGIZNlU4Qk8YowHPPtfrB3zPZmcNU2EMxb/8Du/hoW1JWazOjrIHudPKc40iIOdRXylu3Deu5X3rgB+E4t4YwE49/inAblIsPlgy8DgJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbFOAF/z/H2cUHCmDyx1Pdcm9NeWSc3KGu/noURcKrU=;
 b=Zn138/Zb+0XfMl8U7loSwpGZ8Zj/T3HxBq7NZ/+UM6HwWvyOo5PtH8D9NwvF3pwuxHOmu0o7StRRgoZC/J7retLAbLLRUuwB97diHQu2RTYYFygjI63VeNRM18BtE/nQ9km3RHoc9CE+VYVdPg98fXIWxoU2ECCh/Gz1R6k99035o/4pQ1X5zy66RQqmtxlmphPbbKWjGZ0EQgH7UgHYh8Y/Fps6Q+8uXhVaYli0wOxw0nrS7wse0leJFt0ryXEaqv/m9L7ULTrpd33chKZ6IliE9Dfd1lHR0Vvy9hsc+jjZ2hyIoBbyyVt2ErOU4hfk6JJTzKjbxbb2bYpl3XCL8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbFOAF/z/H2cUHCmDyx1Pdcm9NeWSc3KGu/noURcKrU=;
 b=hc9dDsk7AxAXyek6+tGaYOYCFKLFOuuJBfNvLV8wuR598YRzcVY54MA1LMRrRP2Fb7GpKE3dl/FukZcFdSl8ve5ZynBP9basREvKGqySmSEVWQ2hm8spE+LY9VruPNseFnre32iIEn9OZGI5CGX/2Nf8tEDLt3MIi6zW6zcigVxvIwaspv/mzwvXf8De4NNareFy62Ql8r0pW37rY4OMJMSp/WSCZ2ksffY9UAXFjuCz34jejNGgp+Lx/OmUF5WN9y7v+VUZJJHcyivA/7zCM7+C7e8Dkl0dxDZR57164TAM01GCyAJcCV9hl0QnNVGA7YfDulZYs9vpFHk+VbYThQ==
Received: from TYCP286CA0054.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2b5::19)
 by PUZPR04MB6365.apcprd04.prod.outlook.com (2603:1096:301:ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Fri, 11 Nov
 2022 03:48:50 +0000
Received: from TYZAPC01FT041.eop-APC01.prod.protection.outlook.com
 (2603:1096:400:2b5:cafe::43) by TYCP286CA0054.outlook.office365.com
 (2603:1096:400:2b5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13 via Frontend
 Transport; Fri, 11 Nov 2022 03:48:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 TYZAPC01FT041.mail.protection.outlook.com (10.118.152.116) with Microsoft
 SMTP Server id 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022
 03:48:48 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To: patrick@stwcx.xyz
Subject: [PATCH v4 0/2] ARM: dts: Facebook Greatlakes platform
Date: Fri, 11 Nov 2022 11:48:24 +0800
Message-Id: <20221111034828.2377-1-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221007055346.3484180-1-Delphine_CC_Chiu@Wiwynn.com>
References: <20221007055346.3484180-1-Delphine_CC_Chiu@Wiwynn.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZAPC01FT041:EE_|PUZPR04MB6365:EE_
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dbd26e29-932d-405f-6421-08dac397a477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	dqjvnKjAYa5yCE8Qpuiagjw9x/U5qZrr4bhmZ3z9etOPiy83ePmfxaA8ZCABCh853mng5XczL/eE29opTPryNgt3isgHUZ/cBWn15m79EP4cITT+ARNKp6Cm7ir9kR3EwjotbQjjD+3waRQ+JdrJoG91zG+fJ3vV6F2GSXuzBMMjmv9keMZOfhFhokDX6ld9kTm/PKXq8fXVLzpxb7chzwtWkBWjbVPZbb9tY7ixQ99a+Bh46/ihMX8Z+a2XJJTx8D/7bVZq06Nif76mK5bflsbzpog7DakK/plPOk5Iv/3prFcVGJWJOEfyvNlU2IZAmJfMsxCXJg9DjeYIwXHll1b10LdUJmppPs4RCQw6+fbFEmKbk9FSAh0gLho7hs/DyvBY++NuHPKw4M6Ox0+yzYIgvqqos0xwiDcCf5lPlHSBF0dCdoLt3HEGiSN0mLGD4Rfyrshd4Cxl3vvv5nt+4kYVF6QHtFihoAkGf+zUpAK31jv7C3dSMxQXBEt4hSGLUKwze8h1CoM92dWQrNsoc0msNHCkxzOQ6oA0EYzjJBhqHX4u3SDiUjXyPXXJOphukURhJePTeC0WQDgoYoXbsZM0koGp8gAUcgkEs1DP59c9NWd4RCsFn432m6GkA3naZ7WrA3V+yr2XmDwlWa+jCzCFchGvqMWTtfwajxGeX33YsWQo5oOP4Nn7wY3m5PcUewSEEHU8mI8Vrgb01a66g889tV5xPt2ThUaRlenBINNh1gTVuTjvx0iRaiRRVEDw
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230022)(6069001)(4636009)(376002)(39860400002)(346002)(136003)(396003)(47680400002)(451199015)(46966006)(36840700001)(6486002)(36756003)(81166007)(82740400003)(356005)(956004)(40480700001)(4744005)(2906002)(9316004)(336012)(186003)(26005)(47076005)(6506007)(6666004)(6916009)(36860700001)(2616005)(4326008)(8676002)(82310400005)(6512007)(70586007)(478600001)(86362001)(7416002)(1076003)(36736006)(316002)(54906003)(70206006)(8936002)(5660300002)(36906005)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 03:48:48.7645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd26e29-932d-405f-6421-08dac397a477
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	TYZAPC01FT041.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6365
X-Mailman-Approved-At: Tue, 15 Nov 2022 13:27:49 +1100
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
Cc: devicetree@vger.kernel.org, Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, Arnd Bergmann <arnd@arndb.de>, garnermic@fb.com, linux-kernel@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add linux device tree entry related to
greatlakes specific devices connected to BMC SoC.

v4 - Resend as series
v3 - Add documentation of board compatible (bindings)
   - Add board compatible
   - Remove the bootargs
   - Revise the DTS node name
v2 - Add binding document
v1 - Initial draft

Delphine CC Chiu (2):
  dt-bindings: arm: aspeed: add Facebook Greatlakes board
  ARM: dts: aspeed: greatlakes: Add Facebook greatlakes (AST2600) BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../dts/aspeed-bmc-facebook-greatlakes.dts    | 241 ++++++++++++++++++
 3 files changed, 243 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts

-- 
2.17.1

