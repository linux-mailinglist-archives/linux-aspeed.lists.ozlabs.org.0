Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 502CC96EA36
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 08:27:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0R9X23jlz3bnq
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 16:27:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::610" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725604062;
	cv=pass; b=AunQSk47jyx+eEF6TdzY3TJY0bFB6klJTPzJwXbm3+Fxpikk0bT+NqcV8qXOKGRVhv0ZLq3wnRoaAoLwROegguIAWzKUyUSZ+ZCviLyIL9lLNbpekL1kE7CM+zCrqkQvG2xLs3OuGA5Y6USMnfrxtch287pRoFYqh66P2cB0C3U1uM9vjvWronGBuV86cEd8KrFEnwUaa9Cw+mzerJza6hdP4ZHYN1AW4ACTQ7BovOlFpn07YuqUOE83exyE3lFTyz+X3l2zb2L1CCG9CKhYXZZFOI7Q2hB1Rp/fzFiGbBGAFfBfozvov7UankEsJ1vLgA6ABBLgZxNcCAoG1bPDrg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725604062; c=relaxed/relaxed;
	bh=I2AzjfJFXFA/0WPUqtPxoFn2BZSzzb91uVzc8URhJAk=;
	h=ARC-Authentication-Results:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:Content-Type; b=MQCKb47IXx24GADz3Ihj8ShasRT6P8ltwcKA1qc1vLhn791xmHC0eZ2ErxNxFrYdmbgjA/nOOLSDlPhQiJ38OISuPLg1EkW5UHnASLt/s5uDgO7L6yGjyl8ajvOzY4zrC0BXiGAb7VH0SSQ8c2+TJDQ0Oep3bb0kEeRL8KA4JxuTpCsSREKEJlJeKbUwK09wVMT0QVBsLTNKl6Q7eSzrFoy46EPoLoZzmLujhZVvjiEwCWdrtVmyh7tQLcAncLi2KjIv2gnbUJozvSl/xvkHscgm0tLxX7W1Osz+KXgeAfBrP4eBZCdFd56ASTFCdX93p+20noMBpgv3d78GVSCQkQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=u1frSGK1; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::610; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=u1frSGK1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::610; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20610.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0R9V01Vgz3023
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2024 16:27:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAyrnyysd2R6sNDDnb67po+Z5YWj/Zt1fgWeUEcwpX8ZCcIYEH9/ZSH6nNND6Lf0lp5XBFl0BZ3jgS8koe0pfmmzZBNRNeGxWft8a6hIJfhWwAsQo7v3RgcwTSxTAuXKTt2jDMUJ4qMXCz+K5Y3T/gy11TdDrXhpOnAiDNt+KL+f7RzywZBe5mR8jYzsIb7pRkrUZJzomhxouq7JRFPvDN3NBxx8J11HfreeBr1pXMm6lWxvyfNhXgZVjUYEGrtVEJq5Y+laCpSEqvl2XpR72q6W5quuuP+f9F1w1vWyTJnloliHPsAFaIxCADmL7nwM5vG2wmbVh3OU/LjA/jAzbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2AzjfJFXFA/0WPUqtPxoFn2BZSzzb91uVzc8URhJAk=;
 b=N6BfQzQ2j8+QHX+aw5TzwsYeOeXzI4mucbVn+VYJdGXlUGYxiXkVDDMHpjxWv3lssfSgRxaUcFFFMNO9sSeQHt37hcpx6r4cUumqj7TAa06UHLdZ9STXcKY+K+Tf3+0Bqza+gIyrCxfHNN3wmIHXDSgM0Bbj0adl8Hu7TAhTQIkr58J3jPk7QH0iQ2mp4a3vfb3BHZAjhOrHkBJcHPGhV/cEUtv9Dkp/sMeotCjP0iiQmQd32qbTz6af54QVTgJyZVWFzLabixD/BvkWdVVceVOYoGMkVFLJ0J6G4JzKhcA/2TLVV8bpZCgIAJB3tgtPmWPZ8Y5Rv52KZv9cWNJdMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2AzjfJFXFA/0WPUqtPxoFn2BZSzzb91uVzc8URhJAk=;
 b=u1frSGK1oyyYlr4N8oLAVgVLfOVggs9p6UipXkGrsQRZrx830F2Y5OT3ZnbWiZUTEcLM8fY4cp4qQeLaaWM8peuyYUXDz08gd+0+uRG5g/LfjqjCzCj1T4k7z+xYeCcTv0j9M/ppjreGKuCaeCmNSYLdX4S4tJ3olTZdTtOsR86DxjodrT3CD0BgqjiUxrpJNz4yQ24s6i/+ic6qsRLwy5YnbUweZpGKfBOUahGDzcJP7Cr4lTTkj7l+fsxSRlPTEJR6nDh4nmtXP8TKviQ5rXgQ8/ARcMBTk0zW3yt48QoXwdRGCDqe8lYlK1gKr3hJXtQRozRh+OYRj+0jQIom0g==
Received: from PU1PR01CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::36) by TYZPR04MB8255.apcprd04.prod.outlook.com
 (2603:1096:405:de::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 06:27:21 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::4f) by PU1PR01CA0024.outlook.office365.com
 (2603:1096:803:15::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:27:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:27:20
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v15 04/32] ARM: dts: aspeed: yosemite4: Enable watchdog2
Date: Fri,  6 Sep 2024 14:26:30 +0800
Message-Id: <20240906062701.37088-5-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|TYZPR04MB8255:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 708d0ff0-6a04-485b-073f-08dcce3cf678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|7416014|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?WqhAEVGhX5hhm5+9tqLwt6+WFm9M9opjcsKDpoe5ujitHfg1RcTJpqSroiF3?=
 =?us-ascii?Q?mJJ+o3fxxKWtWizuM2z0xPyGPspqKU6gGGFYuj7XPjwJDT6AFxj08WEFx7FA?=
 =?us-ascii?Q?tjQzyOKRd6AyPzUDnfMiMfBTzNeANzz2HPkGu4fgFpwALQCDEIBFHubUPrdf?=
 =?us-ascii?Q?YG6Q28Bp6+tHBZdQqQcdoN1TjG1Ip92+5HLNMHlShlHVfvytpenyChDfDfJX?=
 =?us-ascii?Q?m4XZjuaE8SWyROjut51+F1Noqx9oMbJtZ1lOdjuATxevqcCTX7NLM3OYBNN2?=
 =?us-ascii?Q?+AZ5Y41k7gEgniYeT29Vr2esjO6tJukHECCfRxsoK/AstobC9AnSS58lWXqc?=
 =?us-ascii?Q?uqgCZ+pvLh4/3wZgQjE7/svbbiXHJbZeEO4Sr4u5BO36JP6FpwiUTnx8xDwc?=
 =?us-ascii?Q?sK59BAgPwP6ti8uoZ7B0OCjBtBRYrOFHxLHbk/WyqcT8P+BgrR0Po2lyYHu0?=
 =?us-ascii?Q?7JnU2OaEowwx8A/0fYUyrXXkWlYTLEAv0pqo8/Yywdw7so+ww4UAUwExlJ1x?=
 =?us-ascii?Q?PztOJb6blYeZHyz7tLBy7LqRHBjEhKfjOgEMs9T8+q4k+hGjZlUcQFpyJQlf?=
 =?us-ascii?Q?4eQdSLN6Y4geyxvFVGo3WjxfHtVRHdDTDsyXdA0EJbh6RP+SJPpyOhBDM0C8?=
 =?us-ascii?Q?rhAF++e4j1B7Zq/wjfkDdcm46jP9XaIQYWB/mvZ7UnQ+DXrBXljvS/LYQBcR?=
 =?us-ascii?Q?ak3Nvw8FXtujkdQOUhLr/RA3QusARdESCnc/FzYk9+rHMqdYz71pfKRuHOnY?=
 =?us-ascii?Q?tkREYS1PApPjAP+SNqx0+lELFO5ZhvpJMmeCBis2bjmjxkcx/Og3FkDkB5w9?=
 =?us-ascii?Q?P9nXqXPsXghRFtQGorNeQBE+YOAWc9abkKXipPvf8GMa4cVXxub0CWB934W4?=
 =?us-ascii?Q?1h40l2pTq1AcvCDZNQd8aU9WqJRxbIwX/MINYB/knHC5l/CGdnm656WPo9zb?=
 =?us-ascii?Q?UXZWM6PGBdQTSomToSZqT8fy4gk0n6aTmSbwWLUgCT/bAcmHY0mBROBi5A3/?=
 =?us-ascii?Q?xWZRBs8ugXS7dT7j0PK7LAlyQHPG6NNZNnu9sW+OHMixd0TjwSl60VPkVHvv?=
 =?us-ascii?Q?j5J3r1peycgSDay4Vkb0BGpanIzfFByTxXgkx0ZJ/hgom7fGsEHTHdy/gxwm?=
 =?us-ascii?Q?jKYeuBYQyj5HHKum+/LOKTKLQcDLnKN7LCnVUAvz8V78QRz5qAPvpi7ay6Ej?=
 =?us-ascii?Q?MgVlfw3YrvOeceoOt0FqNJU1a6AMWtruQE8Z8XiF+O3eYWG27D86Vwx1UTsr?=
 =?us-ascii?Q?1r8xOL6TqXL/ttUdYEgP+Hi7pzhR+4RNCUfv7TCmI5ly7EvBvHI07dweYUkj?=
 =?us-ascii?Q?vySZvp4C4S/ZJQxa5ITLJIGcRWYRgGscNW+vHhFaB7AWQ7rGHQHyqRV/IDvV?=
 =?us-ascii?Q?OaD0yULhIgWnpj5MzYM4Yea1/W6mECjOkGJncYetfxIpCfxrGdx6I17ihfRq?=
 =?us-ascii?Q?hx95IUJz65udFG2sKthSydTi4YqvBLi4?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:27:20.5532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 708d0ff0-6a04-485b-073f-08dcce3cf678
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB8255
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

enable watchdog2 setting

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 575abdd530df..51b4e9ae13cc 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -120,6 +120,13 @@ &wdt1 {
 	aspeed,ext-pulse-duration = <256>;
 };
 
+&wdt2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst2_default>;
+	aspeed,reset-type = "system";
+};
+
 &mac2 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.25.1

