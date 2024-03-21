Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B26881B07
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 03:14:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=rpP5cYlm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0TYm6DYmz3vcM
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 13:14:52 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=rpP5cYlm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::61c; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0TXp1TYxz3vYH
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Mar 2024 13:14:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxgnMfxXGXjDat5IYoPgd5E1NLwxUsUxm1IVGhVqxLF4n0DblfxATUql+QrT7ZDvfRDnw7RJqyOlBzVFktusc2VQUy/2VKuowR/kb9JXAHZzhYae6720dZc6kZYorY7RNcHbbyhzFSxJVTCxagZuTyBqMHin1X4RqDESLPpx28K5L4iCHYUEo+fJHi6YYPzSseFHD0vX5+Poog2QNYQyie0Ceg1TV93SEPoJkxeV6cxjznELMMPcJMlKB8d+dzbw8q/quO+3Y9MtHzaXWdDCmbBbosNQ3NMxP/9xfOGiLSnwSG/Z8gfoFin4mqOVdps7IFZ0WDjswTT7mSl9Ay8+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6wbCZNYz8PSgbwkRuo0n/x8giBmR3OtNMKieVl27+I=;
 b=kzseLaczq/Vb9MMFhZNtfjoXptD9MCtzzrW4XeCFHWK2WD2nbFQXpcb0Q9jdpXYTJY3B/2zdJOGFTYA+rZRP3RjMQ3CPx38+WBD0NH7bGngysgof3DwBrCu/1oL7A5GS2TdIl/VeM5Xby8AX7zYl6JtY+Ytz0lJV4ENB+Ub0EbgHWxbCB/3dmyKvQpEQotFtN+DzhDcfkoWNqXioV1xI+HH27h6pil5gWIWMd79pHw4lPzvdQUs/koHK8OEFAc8ikrtOToDAt72HHtAjoTcRZXD5OkBD2hwfNFFp/AIeVvH5kL4PFWnnIQ3aQx/daTf11nFRYO7/HtfNeSVnSosTuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6wbCZNYz8PSgbwkRuo0n/x8giBmR3OtNMKieVl27+I=;
 b=rpP5cYlmFaWOcOkDSryHbdRcKQqe0uWGi4cHuXBwpLPlX+BuOsjkj0IxkCxjG7JbhdXhsFYr1R5OV0oZW4nBBpnXMI7Jk0lMAonsg+/I9TFFArI7vvg56KQQW8T+8WX/pWJTE2HoDilOGx+4zYEjraI6ncNOh2mtXZEEVVV1mSoSEyCluMahn4H7BFY3uR0ODtho/IjMd++PxHkE4Ob4qEYLwQJBVuUrEs8XhvWu12mmDlyu14lCLP5mfsceMzAw1tVWX8bh8h4RK6JwxVzsG1KRT5HoMbflKEP0Aj1VK7qivM2IXaQQkjgWedzbO5DVMvVwnN83GTEEg+nUCosTlw==
Received: from PU1PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::13) by TY0PR04MB5741.apcprd04.prod.outlook.com
 (2603:1096:400:21f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.30; Thu, 21 Mar
 2024 02:13:44 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:803:15:cafe::cd) by PU1PR01CA0001.outlook.office365.com
 (2603:1096:803:15::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Thu, 21 Mar 2024 02:13:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server id 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 02:13:44
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v7 22/22] ARM: dts: aspeed: yosemite4: Revise i2c duty-cycle
Date: Thu, 21 Mar 2024 10:12:34 +0800
Message-Id: <20240321021236.1823693-23-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|TY0PR04MB5741:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7930f744-6f85-4e81-35c2-08dc494c88f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	JanbFoDmNXynttnmgn3MZj6HrkG5Lere0pjOhDhH5k4l5QbNXmxC0PvSH6UkEy4HAMCG8qbiOsiLiWXWOMoOFXL9ZQOJj6VeGnZqPtmg3VA99xmqMu2x5m98Eobjp7yNCiYyhv5aA200TBDWdDOe0jmJ/jUNhAfySrGknVMXCGiF5/AujThGOKC974NwTuJINM+vu38+2P5FRw8IwB6j813vmidUny7KqOse1jHjiXCxw+o/3UX2q1hEtc4ZCJadzFFakfIhtONfsb017KdarNVA8gE47kJU0onoA9qVFLcSe8dv8AnSH8nEVPsce/cHPy3L52g6XCt4Q/pFY+GpPX+SfF4fb7SkuSH46RUA9K251ziIqWipgLLg44H3y+0ECNkBOQnqJfECn4HTtrYlUHQNReqwkOKwMhkm+uqDWlYjBD6SV9gWnJ4K0aTOWeTwu8OQvT7SeaeDQItfBvQKLqS+d1YTuTWYX2e+hhfeTtM9izRRjaiLuBlpJKUZQrPVjUtfAS5YVM3Jfm5P+EuxFVXi1dshFQeTsAFGKwUAzcMVMVX+Wzrcch0sH6emRo7eTVOoic/bfw3yLWYgRL34nHHlU7l4AYdoV6VnSHNWkJAMjbEhkTB/jF9CH3Rkb/NlO2FqgruK+Diqmxcv9WDTaY/DOUt19x4WlC4tc3ZPGXhgZ+27vC1RhQUgmwCQMCF+L2Yv1q8xC35yvhcqdGcleA3yleGl3iQhHtMZpIl5Mkr8uoYy5Rqe+SH/H0Oo3IaI
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 02:13:44.1824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7930f744-6f85-4e81-35c2-08dc494c88f7
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB5741
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Revise duty cycle SMB11 and SMB16 to high: 40%, low: 60%,
to meet 400kHz-i2c clock low time spec (> 1.3 us) from EE request

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index c7bba7d68ce1..3a4da189f2c3 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -761,6 +761,7 @@ eeprom@54 {
 &i2c10 {
 	status = "okay";
 	bus-frequency = <400000>;
+	i2c-clk-high-min-percent = <40>;
 	i2c-mux@74 {
 		compatible = "nxp,pca9544";
 		i2c-mux-idle-disconnect;
@@ -1306,6 +1307,7 @@ &i2c15 {
 	mctp-controller;
 	multi-master;
 	bus-frequency = <400000>;
+	i2c-clk-high-min-percent = <40>;
 
 	mctp@10 {
 		compatible = "mctp-i2c-controller";
-- 
2.25.1

