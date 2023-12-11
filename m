Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D33C80BF64
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 03:50:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=MsOU3bN8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpR7l3hnvz3bXv
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 13:50:43 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=MsOU3bN8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpR7W2Qf5z30YS
	for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 13:50:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5IgraK4TNnv9uz3LoXxuhUvDVbO03WR5wJi2rvKrgwNbfiprqt9sxghZkbTjGcWR6bJOHb+LL4ZbVK9DXIKGu2L5kF6c/GTlEDhzrCTi9wrTirEOxkjQeOIO3jyee3OCM34IJXUrjy9yCO7iDHq67RDyM5wSItoQYQbIr8cFfZMLW38B2PvfNiKMu8pab7rNFPOtGpOdphdheXOE78rcBwC5lnjPC5uY3Uk+YqP5qMGaosDOhb0d8mjG1q3hGyl22QE7Up/XB1WwnDPSwwjNNLuwEShWVWQmubluYltaCAxLINz+F6AJEdD1ij3FiSwYhAeYVOnjuEHHLu5/Om4ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsmK47O4uAWeM7dDfAnIa4yPQrzYmWUcPGa4gFr5YYk=;
 b=G4k7u3E6cHpgvi/LBziS51FW50Q4kmMHE4mFSY92vaIQXBQeVwDNeCknpV31hm7wq9uCbUam2j4//zkjtoXbIYB8ceqnQm+X6AQAfcOLeYmyi23mN96Kh3HUpgNxJ4zsS8BsFOS4P4O5CYdoJKPlZ/2+uOu7SQ0q0v/nf5/vmQNu2C3hoDevrEG8m3nzqJL7wkhM4H5tcGwNniaLxpc36AFPznt1zUud16hEfZQ6s69jm1adajEvswLkk7np2uTblSjePd/i3/agFh1omREO88XtieLCmX44/Mlwp6FVhSgeIcgn4Guof8RTLoCiaRQPXY/SSfU99MnBGD33TuEDOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsmK47O4uAWeM7dDfAnIa4yPQrzYmWUcPGa4gFr5YYk=;
 b=MsOU3bN8KxdfXn4bK5E2As5pkBZQKznyLd2Tmd0phw8qncFZMUQ2tiMLYCIM0yl+yyVZaTX/jh0+VvDLdL3NWHSotAEHsaYyjQNxs9UfVPgrMeRTkKiIReAQovpK8oiEpDL7V/3nO79/IW2+1OKVudn5kR6GenbnoNrKsHvE7fBnX9T6Wla18qbr8U3Yi4vmMVs9nQUbOolREXvuijzLIAJ6MvhRjI8tKcXfARwzY+GxtnfDJ0ucRdK92Mg5F9voD26hMvsAAjflZS+Bel/fD3Lq/gF1vaODT0/DT07hCVTHaw1L9Ji+UmNiSZXfynRrOBTrL2mRPJzq/3VxtKQnGQ==
Received: from SG2PR02CA0043.apcprd02.prod.outlook.com (2603:1096:3:18::31) by
 SEZPR04MB6234.apcprd04.prod.outlook.com (2603:1096:101:cc::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 02:50:07 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:3:18:cafe::ac) by SG2PR02CA0043.outlook.office365.com
 (2603:1096:3:18::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 02:50:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 02:50:05 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v2 04/14] ARM: dts: aspeed: yosemite4: Enable watchdog2
Date: Mon, 11 Dec 2023 10:49:35 +0800
Message-Id: <20231211024947.3990898-5-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211024947.3990898-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211024947.3990898-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|SEZPR04MB6234:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fce56365-fdd5-442e-0e95-08dbf9f3e1d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	5C+fKF6YNjYznRVSmXq89zmPoCoKoR8UP5b3iq1FMqYDUSqwgsCkJf+yBA8sbf6uGWY2rRnorxnNmzZ/WznKHFG8xHjqvdYOjc5/jN4E0Lj0YY988n1qgeFOk3WAhBKBzWzz31EKmU6+M20/hWcDI4xSWlYZ0ce5TH7g9hJuZZDBtyGKWO2i83M2WTtOrzZO1656/bVK4XPZkEJbAk1ElzwB7tLo15mbKbOmzPk9nqJmT9PKkLj2JIdp22rTXi9er+PTid2RjiRJ7Rj/lH5lKmA7VhQ1bdRmrINw9qSWGUD+6EN5UCLomu2GBAKh+mIAOZt9eFq6+5/sdZP3FzHXigkS4zzX1NIdANmBcWMsZ/676zFzBpPyT7NkPtFDykXnXXyFUpYHeXELG5CZxUwdmIuMeseVBlWN5dSL5W+mgtEOhNZk0JdVo94UaSGy7a1O3ZiPJg+m0xiX0LKoJ/DXRmKVPqPHF1SFWwnZTD7KB6TaIS2cL+YASizvwUD81X3HqA7lCPDMl+Aeu3vaXid7yG4KnR0gJGlGAu2uU0LaHslf3KLCZ6Q/cVFDoFy0D6a+sG+qRXtXNOJvBz9bQkEvwsNaPgn5/RwWmltKeRXoAuaAOLzbygjyJhoNYQtA2huzOa59ku4JuqUE9giAnBr1JGDoeXJlLB26Bx/hrUvtM5oZ1B+yu3U4zeQX6O8kxUYpv78G0nZFEX7rxEjRQI7Q3A==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39850400004)(396003)(376002)(346002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(82310400011)(36840700001)(46966006)(1076003)(26005)(956004)(2616005)(336012)(6506007)(6666004)(6512007)(36860700001)(47076005)(5660300002)(7416002)(41300700001)(2906002)(4744005)(4326008)(478600001)(9316004)(6486002)(8676002)(8936002)(70206006)(70586007)(110136005)(316002)(36736006)(82740400003)(81166007)(86362001)(356005)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 02:50:05.7962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fce56365-fdd5-442e-0e95-08dbf9f3e1d9
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6234
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
index 0449a7e36ff6..0e9095c83a59 100644
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

