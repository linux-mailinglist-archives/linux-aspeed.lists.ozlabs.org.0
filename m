Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id E4BCA8CCF3A
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 11:26:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Pa8/7Ha7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlN086CTXz3w24
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 19:19:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Pa8/7Ha7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::62d; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlMzr4wfLz3vYF
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 May 2024 19:18:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAgOMVjKP482Lq6vXi/CzBIDw2BqB/DZxJLIrsoq3RttMgoqnlvzcJxrrIwWBgDmmqyvsv53exkYEMGB6/8gmE9pc0/wlCEG4nTH/yGcH37XVjATuR2fm955A9C1eHBWHISMGR3t4keYuMFHNEqYoV6knk/qRRgUOapiM1SYDPPqjEjnhQtnXgP2PlzXkn5VMjXCh/P+1wTRnlkyAA8QnX8/UbgB791PaW9Wf/T9StJnqbh0fSN4+BHA8Mo/ZDiMvePp528bBjpFfXvAYWjeBlXD1Y6NTMZtI7YLpLXecXdBbVfssKkppUpuK/qEWeQ7ybMkZnaS6ooTQVb4VYYymA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+DlfI1otun1CAydzoG/8ZXnTLi77JYQ8A3Djz4rKnY=;
 b=Pox37cKGgnERH/N4JvLUZG7mn6LA5R2SWg+v42y8p9ged11hTrwHYe4L65aj3x/FNJOYm7sGvRBu2P1IrUGu6f+sT8tBCtzw8+OceI4rXNicntmsgenSioe3SqtlmTkPHlkoH/LKQFYUnNF+M08DhGj3Spnu2DSwZS7x8rVgHU2KGvy1OhlzqniuMn8iLo+7zuitMYYN6jHJDa+YvhdPRYHihlbGaxnwSIdEnvjTrL7BDVe/iu89exxEFizgEnRd4FG+j7xaOaH6Lxkg/GyMufPCIZ5hTXdkwfEYkcuCkieaoPn0A2NOdRrYu6nzpSCCntxOHqlGp5nO5x1n0OLBLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+DlfI1otun1CAydzoG/8ZXnTLi77JYQ8A3Djz4rKnY=;
 b=Pa8/7Ha7BfQx1CqKjZxL2Iu/oTjZcnsXi/T5jYiGkYUc9qvK3scph+1qGNKb9GGKi09Vv8L8NCWdCZe+FT8ckU5z37ffdRDxUI+NORdasCjzI5Ez/+UbGzuvsYqwkzB7LBNOH8hwkRB7qfEQ2ikZVNtFbxJMfxLeGxnXEB+G+IG/fhftUqNVeSrJ8Lch/u7dUGN41Kw5f9D1hL/k9Ec5G9hlwM5hEJh+dvFrQCTPCtKuQHuPh8WLyIyvHVsUOXrrx2fq/tZjgvveBVF7B9sDJBWz7y55LXOrpcajr9YNElnOOxrbosdxSBdJXm93WDXBnAgW+69pZUGXM60xpJsOlA==
Received: from PS2PR03CA0021.apcprd03.prod.outlook.com (2603:1096:300:5b::33)
 by SG2PR04MB5939.apcprd04.prod.outlook.com (2603:1096:4:1ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 09:18:29 +0000
Received: from HK3PEPF0000021E.apcprd03.prod.outlook.com
 (2603:1096:300:5b:cafe::1d) by PS2PR03CA0021.outlook.office365.com
 (2603:1096:300:5b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19 via Frontend
 Transport; Thu, 23 May 2024 09:18:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021E.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server id 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024 09:18:28
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v8 04/23] ARM: dts: aspeed: yosemite4: Enable watchdog2
Date: Thu, 23 May 2024 17:17:51 +0800
Message-Id: <20240523091812.2032933-5-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523091812.2032933-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240523091812.2032933-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021E:EE_|SG2PR04MB5939:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c5e0e109-6ef1-42cb-75cb-08dc7b094edd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|36860700004|376005|7416005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?gmSH2o4TIl6eChkf7W5inxWfZiMlktq1JbFCR6YbgcR1v6EXVBb2eXFqGX5o?=
 =?us-ascii?Q?mmKx5Yl7Ihhx5V9Y3UHFquKqlx53WF2ycx92xUL+L9jSMIW9zC6BiGukOFzd?=
 =?us-ascii?Q?6ljgZEv3DbCCEbvgpdOg/sDSfrh/PtFYDiLNhNsC6mN6S59bkSQuaCjY0Tbv?=
 =?us-ascii?Q?uUxwVj1HzJoF+2hTNGDLES+Yju7ABYpszyrAAOxaBWhFYZzyk3LvnNvzrhOZ?=
 =?us-ascii?Q?7FA4o9XskdZML9E6dDIbqJFdYsW7HRefRlbo/e7MRUhJOtQ9yCRCGw73zzmB?=
 =?us-ascii?Q?znvPOPTddmrYldIpY7DZAcX56VmK+Oox09bSCqfQntwLYCPsYUnxGL8P7GuZ?=
 =?us-ascii?Q?r4rR4z0K1rvEJsgiNpLlIEzEqJWEGylJxD9Oib3Zm7XZ4a6mkGH/tF+cu2X+?=
 =?us-ascii?Q?c0cjrsj9WQIRaIoC6RxTVcm9qwyQcwbNqLbAbG+lZ4oMDBRJiH+/goQdlVXP?=
 =?us-ascii?Q?6RvWZOVFubLhVFOgBqhejc+abw9BpEBn2qPqjO16OZk4WbuGzM6mcxZC0UJ2?=
 =?us-ascii?Q?th20dI0x8/QHkZvRZT+wGR2sdZ6RNHvv+NKfhdVIlE4nm+5LHpbCvnOI2xyM?=
 =?us-ascii?Q?vTMUwevWWg6RJCvB5amGc7ihZQauekS5eXMSOPvvivT/duRo7k4E2Epwsvw4?=
 =?us-ascii?Q?3AWzZcLivioU4hAGPuhDB7DE+OLrzl+Ntn8bOgQCEfHuGSNN1SABfLmxiw+O?=
 =?us-ascii?Q?bI3Pl6KtKj/5MTgHnY76j67R9BBZSh8/+19h6QtAQ2KiocAwAX/Mvg0upczS?=
 =?us-ascii?Q?zaLfIwvV9segeNB4rylP6UvgM099aJn068GSwocf70HZOrRE+f9kybLCgOC3?=
 =?us-ascii?Q?yN7Y1CsFsgGCbSnoPu7OIJT+8iwhWPaE3Drbi5GDtlKsda6oaby+MQsYG6Ki?=
 =?us-ascii?Q?+1IqUS5HHYrvMsR19JHACcYMd8m50QPQqaNdUr8PeD/96mZvtapJsPJupX03?=
 =?us-ascii?Q?XrQiAfh3z8jVDeICI4ADW/E+DCak25aj3zI92/u0utDlh+cK+28ul56M+ays?=
 =?us-ascii?Q?5tzX4OWOUedk6JkMu5z/zWCnMzMamnCVbExEqjpwsvD3i1uJTEgwwR5jH3ta?=
 =?us-ascii?Q?rFZszqk85IAAiHe9OpjD652Ub+832Cdrn7XRQhSImdHdQ5ypxIKhtpF3p+sQ?=
 =?us-ascii?Q?WXAqxvTQnEvLUJSaGSMlFqNwclHP317mdXoHCSi4cKhkCTBHL0DUQtYgw76j?=
 =?us-ascii?Q?qBFiUwkz6T8k84bYDVYphN/InlExdtANeITGvIXHs5l1oDf1790KOvRnuYGr?=
 =?us-ascii?Q?ffHy5lfWDpvBJ8hqsSRcYxkgKjRpE4vHF06ZT8ekQorS9NPpcgEc6Hcx5ZWR?=
 =?us-ascii?Q?rm5sIYZQGIqOoWyWrOeu88o7/Ek+nuSqVqNomVPoAUQG3eF3qA9xysSqrQ+D?=
 =?us-ascii?Q?icPYAv0=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(36860700004)(376005)(7416005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 09:18:28.5638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e0e109-6ef1-42cb-75cb-08dc7b094edd
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021E.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB5939
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

enable watchdog2 setting

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index effc2af636a4..b0643e8aefee 100644
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

