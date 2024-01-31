Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA22843956
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 09:42:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=LNQgzJAu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPwXZ38r9z3bsP
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 19:42:54 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=LNQgzJAu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::613; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20613.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::613])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPwX63xb6z3c3W
	for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Jan 2024 19:42:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YnTAmKCEbZq1SvhzavT+stCTjUBpm+yqlpPi3fP2Z/9rTAWsNM1EG1WyNlXium65fkuZpp8Rp5i3tkKDx2pQjqvpKam+hJ4lhc2YKIqJBE3yLu3BTH4DlBWpCCeHIIL3RcR9PzYpygznG+SFKkgB+72dMg7pAZ/mCP1IHyiAdgHD39CLZfXT0wL3zqGzXs4QWHA2yaxmub4YuYiAjZyRVwolbrIu72AYYDa8WrKk/ua5oOxtiPdx3XcEI3bpehK9g/2GUT5TD+blz0tPQFryWRCh+0/x9AMhi0AMY7uQ2PvIP3OFwM5QXqU8YjZUqj/oJdGeoG8hW2Sp+F8ElfvGDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IINSoxJIm5iybOOhBOWJpL9vfzS3qN3CTn+pgk7JS9w=;
 b=KAEYnI9X5Iprq6PjR47efeamplXRue3tcsj7XYkCKcZl9MB7HQqMXfMogpJNbObOBBDtTaSsMt0loKe/n2Ggl9ZR6vrP8g6kCk5w+BwqMejlPtLGEyH71C9Z5IBF4fjRGgaGyGQ57kTHp4Az6U5agCgTNUAQI6TWCHMjwd7iG0h7dh9Z1F9IaHYEiQK/N5g90XAfXh/rWO9ru8aXygOv2Apbyo9fxTNU5fte80Stnc7hDDcOHMQAB4MPbYGnz70vfI8TcxQpqLohQYIaICpVbAafrqKD/6cVChGfxJQq7S5W/XaEO06U+Vpy7IgwCT8wh1KEqUWJTcl9gP6yP1UFfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IINSoxJIm5iybOOhBOWJpL9vfzS3qN3CTn+pgk7JS9w=;
 b=LNQgzJAu8r2Ag8DmhYpNlpKe1RhOQvKr8swsnw4zXof4gFdzcLC8uznt077/SZ0qUz9v2953hxzWPBeC0B1f31vbMrFuJjbHkQusy6g3OB+mDuBqyb2WfH9NSRfw4Jyl7KQnT+Jo6RaNbRwISFBDjtScHyh7CqJkir0e6N4qFcCk1UOwk6qxNTAqzXGhRYQ96oOpzehGV2xhZRUs3NMMyERe3/k5+a0bXtBcLVjMKM06UVlJISqtPfStkFVMmT/oQQo+GPtdkFDC7Fv9rzY83VzNQmDFmX93hHtDqdL4mjja5et7rKJpxPvBjOmB+izwPhbltO6d211QMfXbFuwEQA==
Received: from SG2P153CA0025.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::12) by
 SEYPR04MB6553.apcprd04.prod.outlook.com (2603:1096:101:bb::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.23; Wed, 31 Jan 2024 08:42:11 +0000
Received: from HK2PEPF00006FB2.apcprd02.prod.outlook.com
 (2603:1096:4:c7:cafe::5e) by SG2P153CA0025.outlook.office365.com
 (2603:1096:4:c7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.8 via Frontend
 Transport; Wed, 31 Jan 2024 08:42:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB2.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server id 15.20.7228.16 via Frontend Transport; Wed, 31 Jan 2024 08:42:09
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v5 08/21] ARM: dts: aspeed: yosemite4: Remove space for adm1272 compatible
Date: Wed, 31 Jan 2024 16:41:19 +0800
Message-Id: <20240131084134.328307-9-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131084134.328307-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240131084134.328307-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB2:EE_|SEYPR04MB6553:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f6c1eab8-12a6-4a95-2849-08dc22388402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	HZt1uoIwOcOcEn6F5WLb0YKVswpyr5Sj/lZ9YsLnE5rPlqy6fUd9Xhzw6am4lZ4cnXvey3R4anlwiyr5IPfHUgXrexXOpqC3myORhDBrVFHygkXgb1DgpaHfbrJNsqHEN/qyWWQKdqz3RJ+Z5206ieojbkw2SuL147OPb14QBmqFWRDEviGRWRn0JPQoGwQmgpt0XCoPSpoKUwPEx5ExraGJRACny4lMh3eQx2ELBiQtXFKJ+cClzhnkYlT6lHy5p/y0X80LXeCucvCzbdKnd3NeFtRycVf0jQjVQkitTDt0G/lThP8oTXb86LLmLNoQisaXW4dknAjMrptYiZ4De0ovlE+oDzogm4wGzFOyTZ0L04VEbCb58sSPgKXgDXP87eU+138rCStXANAjCrdfzkTwVhvtwqiBaXwfkhfKeIter58UuZSM9GOCoRZ3F1cqqizJyNTjNBluhncqerUXNLHpiSq1Syx5Y15dC3QPwR3JxcApijFrzKMTtVHeZ0nxup3qOnj1EbiYAgWWIhZQZUSKabV6XmZWg28y//EMfXFnoSKWRfLmAqyde2KqaIoR/PA/hPXJt5z4J8G80ffC5Je8VsSDa67zM6xVRQvjSK0tsnnsYxvDovNv1cAjjwN5odSEuuOQOSBKCXkwnmf4ne38kzicf/Umx+jDOF5kROXRLJS+6m0l+RYyfC+Q65NtY2lkb0NRuyP3fqlwQJiiAw==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(136003)(346002)(39860400002)(376002)(230922051799003)(186009)(82310400011)(64100799003)(451199024)(1800799012)(46966006)(36840700001)(6506007)(2906002)(40480700001)(4744005)(70586007)(8676002)(316002)(6666004)(26005)(1076003)(956004)(2616005)(6512007)(86362001)(8936002)(4326008)(5660300002)(83380400001)(7416002)(70206006)(47076005)(36756003)(81166007)(356005)(36860700001)(6486002)(478600001)(336012)(110136005)(82740400003)(41300700001)(9316004)(36736006);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 08:42:09.6764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c1eab8-12a6-4a95-2849-08dc22388402
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB6553
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

Remove space for adm1272 compatible

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index b1775b5a6782..cbf385e72e57 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -821,12 +821,12 @@ imux29: i2c@1 {
 &i2c11 {
 	status = "okay";
 	power-sensor@10 {
-		compatible = "adi, adm1272";
+		compatible = "adi,adm1272";
 		reg = <0x10>;
 	};
 
 	power-sensor@12 {
-		compatible = "adi, adm1272";
+		compatible = "adi,adm1272";
 		reg = <0x12>;
 	};
 
-- 
2.25.1

