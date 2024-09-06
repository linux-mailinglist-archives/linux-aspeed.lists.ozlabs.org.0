Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A6596EA58
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 08:29:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0RC36Jnjz3cLg
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 16:29:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::60a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725604142;
	cv=pass; b=Dc19+a0HCI5fdcxo6SjU74ZwitosCEXGNPd5Px9lgV43JGU9jVYCUKw0qr53shjafANRfZGMzX2ZMphDz2lT5Ph3dPSC8l3S1aaGmBRalHaUHM57nuQf9aaf6EuFlm8YfK04Xc3vOkS/iO0D/yhhhkmMcKfK/Z6a7iSxk7AuplJLO/8QOHWzZMlG7dC/v9UZTzbDqcLf9QbZM2cuX6NFmrXV9n1J+TVl+rxBKOUB8TKKdbsVUdz5NCHK0C7g5WbQRTGRC2VMN/kaUBtkXrOLNqFk1Gz6Fx0q0pY33Ri9HdGHkHpdz3SfJlnDcW5nxiN7hzRBB2ZKc08OsbU2kxJg4g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725604142; c=relaxed/relaxed;
	bh=QU+JZ1MSglaWLSUKc8QjBu76ufZkEOMMNsu7ns+mPuQ=;
	h=ARC-Authentication-Results:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:Content-Type; b=Z0zeFspsGdvBrdGWce4PWTqeAAPkhkBuuP4koi8aWhJLOUbdJKRTuXUXeTnac+HN+t4R7szvOQKnjgEm7Utb7SErK73GVhy7oiV5g6w3TpDDUeynsDDZ8sw5ql1DeltuAGmsLGY+9xyHHhBThxWK//t/38yF1LcLEK5fkmVyNUPebH5jvWQX1PNdRRVHrsNxMplteRxHsOBCG/UyBuq8HSFflxFIAYfoBEvbXYNH4OO+jU/FHzQXv1nQqWTTWcKElDdwZe+iPZ+WokM9DAn1BEUwefHxPuZbhVTrbebROozO/nOiDiKU2O6wiIhGVdW3lrSWyBF8NWSlmpZDhVuSeg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=1AXAk4D+; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feae::60a; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=1AXAk4D+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::60a; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0RC209BFz304H
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2024 16:29:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmpbbz81fJeFfRTAWhPkVGFzoidIYZNnWwpRLa4edX6CBso6MQS6YmwUOaKAtPuQEby92Nmum9qkTsTlB2pano03bDM31DHokDe9d2tWGTRRhgEip1Evvlb8bsrl0Tn4D2XJXzWcMNHJB1chX3C5DsvWxPxYewUwVg9YoKCDXpV53eRP0T4ICpCrYZUvTWEZRiVTdYB5fPcoOsjzKKK64B3GucJUgrKWrcsZceYhE9jQQHr5N3jutNmFy8pBwf/gO3YyNTQAILDEtJJwoOm5MgWRvwRvg8HiW/bQBVhHFB982038cqOrkb5ZZsJoz64dihUFoNc0U2VocyxVFd67Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QU+JZ1MSglaWLSUKc8QjBu76ufZkEOMMNsu7ns+mPuQ=;
 b=UiWZ/15hkBNiXpjlB05BPqJFSxRuvjdjhKkEhAkINkHWmnBkrGmJ6YWFRVpIzap8ztIQdNcMqfMUpMpfqoBeo276hh4pmpG73RfvvBM0k1sGqSJhqSXZcLsqJPXhiQ4Ns1y8rDxb10CVaVof8N9Wq0h4eLXdCU3dUHN4vNJvQaxDwYWEslnRdQMWsF0b62aho/mwlmorylN9syDzyrA/RV9TRZnlpX0xTKxQsKLfY5Ln1zhnupXLPcIfHUfuk5tGMwqivf/DWnuzzSB1ySK/cBw+rnTXUzLW5AvjMwHLNNcj6VLCSl6bngQIYEJaZ3yoFczoBVj+OchpaSpjGbtIPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QU+JZ1MSglaWLSUKc8QjBu76ufZkEOMMNsu7ns+mPuQ=;
 b=1AXAk4D+NxJeEUpx/6JvnSZ3lULQs+k1x0jGa5sF0FZoLxLVCRV8s51WZyLGQNRQyVY1CFT//SBBiTr7/5n/NS+MceRtKCKJwy5kpOutSIPWINT1MeTy4QOpOWcfaeL0FvZsOqBWt94VzEymyqhVW1uGwDTkhZS+yWAkv9wAVafqPWU7Ga92FkQwNsSOGi+z4nIO7Rcb15+7h5CssNyvOIAd5pcESGr6zwDhITz1OxleU+KLXtrVprPNTVxWUpNoM1F7F8fGFCk7ivVgGTcgcuFQKsO+faS5ibIXtxe6ojlCOlB7xLCIFDVMmHbweM6B+OD6Hq3zwZ/yAK4DyL3ZVQ==
Received: from PU1PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::25) by TYSPR04MB7276.apcprd04.prod.outlook.com
 (2603:1096:400:475::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 06:28:42 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::ed) by PU1PR01CA0013.outlook.office365.com
 (2603:1096:803:15::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:28:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:28:41
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v15 23/32] ARM: dts: aspeed: yosemite4: add fan led config
Date: Fri,  6 Sep 2024 14:26:49 +0800
Message-Id: <20240906062701.37088-24-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|TYSPR04MB7276:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b5062cf0-bcc4-4de6-87a7-08dcce3d26cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|82310400026|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?K2z3y+5U95syh/OEl0C5EGVQGxy9fdnCC5dZouotDAIH9tBVXkq1nJwgBSl7?=
 =?us-ascii?Q?hU1V31fIinKXFtn9jerGWhVjiJCL/wnmkyaPy7+9fq5/YQhQ8LBWZcw3Ayjg?=
 =?us-ascii?Q?k3bAtF8Vs3wfuCB/8FE+EXWtG8GX7FEu5HIed0xSv9ciXqKjDa3Jct/+SWKA?=
 =?us-ascii?Q?pLghP1PhEZHAvUXoQeegGxEsy5pqeIV77lGaKAC6xTOXFPzPqxtVFo5iazbA?=
 =?us-ascii?Q?v/PLtNIKxRNF/tZte896JS1JbQ3UJ9B3WHK9RWkh9rtG2ekFYbEr30T/pn61?=
 =?us-ascii?Q?QZzXu80IOxPzuZAZ2SzRVPnN7pZpgbZJgD1uCNpMAH/EfcqPzEQanj9qp6Fy?=
 =?us-ascii?Q?6e/OQAn2VO1QbyT1Rxyj5mZE7XG4QCkOcXnD8wv6AEcMpnJb9utrFDxvLXWR?=
 =?us-ascii?Q?kUj0TVVDOvFwVVGyOfPmoogpzRYSoNAv45N0dUYjJB1+ncxqvQgekTWHvroG?=
 =?us-ascii?Q?dPeAgt6HZxMnOLTYqmp/QckR7tctWl8ie6zC2On8S9Y/mdGTb+oj4wtD6jMb?=
 =?us-ascii?Q?OnpulMiScdnx72ZGlwRRnjv6WL7URUFajtp4fg5KlIdYYk6JtRlm+bb9nlpC?=
 =?us-ascii?Q?THpR3Vr/xtz5kro2DWsxspEcUayDfgiiRwJzhRe6GlQw3CzBewO3kToiPq+1?=
 =?us-ascii?Q?7VBbFNhSDKN1Rkm37WcjypNjPfKDtaq7fZu0EYiepuoyhE3hF683tpiq/sWs?=
 =?us-ascii?Q?HX0zxzVB3cBFm0sY+YtxolVTSP+JXBVFHhBbdskBRfT4D4YdV02onpdJ83KC?=
 =?us-ascii?Q?mb/A1N7nOd453Zqh9mZu6R0QleKFppJqNYN5EdYq3ENvDe29bcHizVVmvqj6?=
 =?us-ascii?Q?CXbD0zcMTY6Ifed/w2j0hhFNnRNR/kWiPlWqP5n43wECR3XzV6dUsInlMBvD?=
 =?us-ascii?Q?vuzYWdvQ0dom9nbD3a/Od8R5Qwwgs9OQTKcHeK2jgPHpSA6NJuNHxUMAhj+5?=
 =?us-ascii?Q?p5ksmEpOtSFDw0ehYLvHkc1eMXqust0x7Is+pED5SY4PusqMrJ6LndIBuwEA?=
 =?us-ascii?Q?DLARanaHb8bSBt/Ouj1uAlfOE17/MjM+c17UlUnt4IP676ltyE4Gy0O5QF9f?=
 =?us-ascii?Q?rmSwxPgsPU8FDKSP49IeFuJOAhrMd4JqQiL4dcPnztX1lBoKEAxqZ0L/zvBM?=
 =?us-ascii?Q?uWfEQ6QudN4qPS1TjfCpEt11xthGU9pjmn1lUjUVO+daFC4E8SzpvluaH68q?=
 =?us-ascii?Q?yfPXPTT1hWIg18qoMzuzRO8LfmUDZpgnNi51hr3WXTwRyDwiOYkVTpzJGJct?=
 =?us-ascii?Q?7wYydZPfmwcPJVtbv0zS1iO4uur7BqaFbiXaAXLdQYAOm7yzOjzVuCCaVh+c?=
 =?us-ascii?Q?4z6wr7XbRWb1M+ktxGAocowQguNG6FFYipJ4V1E7VQ4otzckg11e45hxxEh/?=
 =?us-ascii?Q?W4FW0PqhqMiOqpOA3mYjLWt/Pau+MCDVm6o3S/Xop3FKuaO7wHan6bXyPQXr?=
 =?us-ascii?Q?B181D1lHuzNVpDDE9e0elSqMr+hISxHo?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:28:41.6311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5062cf0-bcc4-4de6-87a7-08dcce3d26cb
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7276
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-aspeed@lists.ozlabs.org, Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Set fan led config in yosemite4 DTS.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 152 +++++++++++++++++-
 1 file changed, 150 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index c940d23c8a4b..2f4e9c5edd5a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -75,6 +75,154 @@ tpmdev@0 {
 			reg = <0>;
 		};
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		fan0_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio0 4 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan0_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio0 5 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan1_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio0 10 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan1_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio0 11 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan2_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio1 4 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan2_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio1 5 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan3_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio1 10 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan3_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio1 11 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan4_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio0 2 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan4_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio0 3 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan5_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio0 8 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan5_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio0 9 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan6_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio1 2 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan6_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio1 3 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan7_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio1 8 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan7_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio1 9 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan8_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio0 0 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan8_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio0 1 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan9_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio0 6 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan9_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio0 7 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan10_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio1 0 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan10_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio1 1 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan11_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&led_gpio1 6 GPIO_ACTIVE_HIGH>;
+		};
+
+		fan11_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&led_gpio1 7 GPIO_ACTIVE_HIGH>;
+		};
+	};
 };
 
 &uart1 {
@@ -1198,7 +1346,7 @@ eeprom@52 {
 				reg = <0x52>;
 			};
 
-			gpio@61 {
+			led_gpio0: gpio@61 {
 				compatible = "nxp,pca9552";
 				reg = <0x61>;
 				#address-cells = <1>;
@@ -1268,7 +1416,7 @@ eeprom@52 {
 				reg = <0x52>;
 			};
 
-			gpio@61 {
+			led_gpio1: gpio@61 {
 				compatible = "nxp,pca9552";
 				reg = <0x61>;
 				#address-cells = <1>;
-- 
2.25.1

