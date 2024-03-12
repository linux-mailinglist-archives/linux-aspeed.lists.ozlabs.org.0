Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B4E878E2F
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Mar 2024 06:34:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=ojGRT4bG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tv2Pm42dHz3dS8
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Mar 2024 16:34:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=ojGRT4bG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::3; helo=hk3pr03cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tv2Pf1Zqvz30fp
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Mar 2024 16:33:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HO5qLJlxrDF8pz/ytVyd6J9P6MdG1v4ghbS/rjuUaPBKGhoUylq2KJBPSkC+XDYVsU/F8IHLZJAiz5p3iaX7fuibC7ss0HdGTsT5YXbX/L1h3vuzqD476USXHQELIhADjVtDQ0suMegJUbnHDfU2aIjxoQy18y2FaRk3nbZhMpVUfJJKh+12/Osqy+jlnITzWj24yTK4dPs6lAXuX4fgz/Offzhcf80gd36SWU3I9XMo7lI01JnZ1VWdpIKizpPgAEoCVpfLvUp9/KJcPyEK3IDnxW6U0dRtgNitZW/vMHumhfDRgSlH7zxtXkXNm+sufZZRFptPR5gyPJ45JdIhsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guL8wObsV8082jc4UkIG1LKFBCUc+PZIML/Wht27R+8=;
 b=fpgLOXjH/QHxASR7g7CCyd9vwW20n+6DM58mWv+kGgqisE+6riUzanv2jwC52WLmNzKs1ujcQ5l5kIkYcxhcQ/5ku7hVuOQNVFaG3ne8iiWiA+tPB1DI1lqlwnBlUqNWm2nRy7DdZDvY6d364PFOClnPSjdAQ3Yrhx5j23z2s4HS/XHoH7WgdtrndTCtN0dX6LscIqmQIEGnqVOJGcniZyfmpFYSJfZJ+83Q/J9i35jqUFA/aY40IJjRk35ccXjo3qvBROez2eDZwcmM0+n3WdOYgih4Kv8q66OQARDGZkBWDqEMAEjmHqxoD6mMHRM2gdYOPQ7rJ/X18ojCZ1zDIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guL8wObsV8082jc4UkIG1LKFBCUc+PZIML/Wht27R+8=;
 b=ojGRT4bGQsko9z9lUvEpNjKDZmPyY+RlmZi5kkpNFvCzT4Fi8CyBPCLlPS4LJWTqa12awfdO8ubPPCAJ0KBNQUTyD80W5rgb9bG/kKzOkQa32UP+DeYyyeBm/VPmbgYML7uCjOS2taubfoY3WVYY4tRXxrq31pagJLt/Zd21Qr1dXBSCtPoRk+CWXRLABe6F20STa7gIhi17Yi/Tk3deeynmdATObKBBVmUEy0Qcx3DoeFQr/hTxFAZBr9697shEhWdj4YI8F1L3Ig9qF2hG9173I5btmCqePHrL8RPp14lBLGANA5XqjwVYDA44CeQlS03aDLPGSzTZRJ3+yOkt0Q==
Received: from SG2PR01CA0134.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::14) by SEZPR04MB6753.apcprd04.prod.outlook.com
 (2603:1096:101:ec::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.34; Tue, 12 Mar
 2024 05:33:26 +0000
Received: from SG1PEPF000082E5.apcprd02.prod.outlook.com
 (2603:1096:4:8f:cafe::ab) by SG2PR01CA0134.outlook.office365.com
 (2603:1096:4:8f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36 via Frontend
 Transport; Tue, 12 Mar 2024 05:33:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E5.mail.protection.outlook.com (10.167.240.8) with Microsoft
 SMTP Server id 15.20.7386.12 via Frontend Transport; Tue, 12 Mar 2024
 05:33:24 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz
Subject: [PATCH v1] ARM: dts: aspeed: yosemite4: Enable ipmb device for OCP debug card
Date: Tue, 12 Mar 2024 13:33:19 +0800
Message-Id: <20240312053320.380997-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E5:EE_|SEZPR04MB6753:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9854b0af-090a-4e18-750f-08dc4255f07b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	N88tr0N0oo1qenqFdF8SB6X3L48w06WXAlT7FsBFqJhNXTX2m04AOwdjd03Wh0JIT8aK0jbW12y7y6Ygrq6kw2bo4Pk3UxHqjZwmtsrKIuW1v8/lM7GgAgzk7XpjO5gmRRkKAtwxJ5QDKZlTaNw6roEwWsPc2gPowVWFhioCLhbid4A8dKQMqtvJrl7hhIoRgOL99T95jgOBJt2VMQ0KJkfPUm9z4MqUiRoslAtlyvHuCl/ODSuTWIerM7hD7N+1wrsJfYFXj3Eie9ioc/nxUtlHa9IvhPpz5vrqTGhAGqMN50dwYxEgy7D8ok22J3J2FdWgU0+e0rCrQQgRGyKVKiPdw/1x+aq4v4ZlaQwCsqT+DydjkysnW2LN9iXOGToSfo67lKRqsXXXFQmNnO+fAPjZ5dy1HYe7k0KRJujPLsRkbcv8jb/SM8+2sG4obz0W0m1ZEHB0U+Oby2G1ommGmb8Ip5wRDJIDQoJi4Qf9VcbfMzqNFdcVexDwMytrJCH2WvnA7v7FxSApn6kMKDGeFmSS0qV/XcxPxF/0G3smZlGAPFZN/kL2XsGg+GpncLzSK8Hat25xHcoCoBT+wuIhdBJWB9elumo+uY55TI6pOFgxeLP/zAHD0DJuHy3hMvgHYoG+yEERT6kemEW/2zq/QG2yvj3ZqRzBjkQxzlLj4TvodL1xMjVnYUYhzHMgjbhaUd4/8mD69xianeuDZG742LWQTn8qR6tGgwOvstyq7gMEqje4wXZLUzXj5Y/Ariao
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(7416005)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 05:33:24.7793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9854b0af-090a-4e18-750f-08dc4255f07b
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6753
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

Add OCP debug card devicetree config

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 64075cc41d92..b944ed2cf2f8 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -370,6 +370,13 @@ rtc@6f {
 &i2c13 {
 	status = "okay";
 	bus-frequency = <400000>;
+	multi-master;
+
+	ipmb@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
 };
 
 &i2c14 {
-- 
2.25.1

