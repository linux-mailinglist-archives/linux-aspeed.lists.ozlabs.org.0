Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE4188BB0C
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Mar 2024 08:17:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=dEXlYBJ1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3h321s6nz3dSr
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Mar 2024 18:17:50 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=dEXlYBJ1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::625; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20625.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3h2r6KL7z2xKQ
	for <linux-aspeed@lists.ozlabs.org>; Tue, 26 Mar 2024 18:17:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYqQIeu7ae/U8eO5EJXw14pKsPjBXwlgNddOrXaCzJlpbzB7lrj+GZDnuSIKWBH+YKbSUE8TMBPAuBbMQciUpkgDdNwEj5ar/K5Jfkm/l+JlbMBnFC5OGAmd/XXgCnewGrgYZbpOzn+OdRjjTnMgm/MeUaXP5z+aZFT+yTdl6UIbfU2uboV11jNqo4exHggtQZZ6FsYPNXFj0q+hM6Ku/axdrOJYA2AJoQj8b6D34HCkqjFnebWKAAfDuIOFl3ZW4I6XXxt5+VLuIPZ7W8Y2FI5KaiUXad3g1T3YLagQO6S1EKznUJlUbYeGO0Ub/FOjlKn7F/vv6rBpeAvnnLBPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAHQfx/4wOeZpm05XcBAClVTtOvvBTSz38r0WxzNCZU=;
 b=lztg4+hRZXf7faTwPK2w5UzxltxvQq6BGoEneWwQPKp1O7fYNQYoSnpxdVkOVQOgwgYWZSTaE3YbCF1b2HZshRn6k6SsRaURmmu3w3poBU3QdO9ZJIrBPu4fxrj3ehjyDD6ZKFJuyrN3bGJG4ENC9IgvUHfdqU5fiE0ls+fPxLdm3mPF2O3p/9ctG6ERpV5VRaEYHzIeT7myKgOxZbtMtK3hbWFdH2f+FDwiKRTgMrowJH6xQJwxPBG8b3Va/JrJlSY+vddm2tStbhjuzo/KScsQsS3trKynEjz1ASWgJnhIJsWvnwE46jb/rJWWxlD38zvLLto1NH7o+btmhrZcEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAHQfx/4wOeZpm05XcBAClVTtOvvBTSz38r0WxzNCZU=;
 b=dEXlYBJ1G5CQJ5GuFMtct6b3S7sswHIHGEX8vzoCI1FVaOnDqTMFL/L56irdml/xOCG26/1gf7K5Pke7jAnnW1WCYTDx1r1q9sDL19ndf6j2h16XsCMpKU3NwSR9A0beScF7g+NVeANVhtGfpn7HIgk4Bb3LJ4Agmug3w83e5JCnCGuaZUi0MzJBzh9lUZW35u+y5d4NE050DJrBdOlFOYRJ24AZ/X9BrWVNVovMKYrhNFw5oBmFsjKFjJq2YCNztLFLDfZfh9uON1S6sRMMb567/CohWuKg7vYXsge911LNiHSOXdI82CDMftw0hVFZ7hks3tr/muMopTs2v8Sb+g==
Received: from SG2P153CA0035.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::22) by
 SEZPR04MB5754.apcprd04.prod.outlook.com (2603:1096:101:75::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.32; Tue, 26 Mar 2024 07:17:18 +0000
Received: from SG2PEPF000B66CA.apcprd03.prod.outlook.com
 (2603:1096:4:c7:cafe::f0) by SG2P153CA0035.outlook.office365.com
 (2603:1096:4:c7::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Tue, 26 Mar 2024 07:17:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CA.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server id 15.20.7409.10 via Frontend Transport; Tue, 26 Mar 2024
 07:17:16 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz
Subject: [PATCH v1] ARM: dts: aspeed: yosemite4: set bus13 frequency to 100k
Date: Tue, 26 Mar 2024 15:17:13 +0800
Message-Id: <20240326071713.2786206-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CA:EE_|SEZPR04MB5754:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a195ffdc-e2e9-4b8f-5c9d-08dc4d64c4ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	m7gh1kTIBnxtdLeEoGoHbD09X1PuVXTCpB+7J8mC2qFYCaKxj2L7mDriIfU4SLTQnLp28u645PP++TqYrJjHNfmwJvf0MdHvgDonUv0BCpQDoclCKaWfbsSSj8sCxvMbReEgac1Z1jTxTNXs5O1xCCq9c8tFaddgdObya6mnX0j6Y3SQzkkQyD/nFetERgYa8ycNlshXq8MPg2jQc1tJAebxiBqJQ6GpZqouZwaIJxfdm/6IZGtT/D3jSzps20l5P/nnmmKQgXYleXInpl9iSMUe6TwXFVFjmnS17IHMgcI6a/pnZLXGer5cctIXBXjAW0YYg6VaHFK0nHUlODfrsWyqABwUh9bSNKb6Wljr7z3NdaqzKkxC4pdqN7l8QLN6HqH8qVoghNDzxphleiNu/iPeZ1PSr4TJy3qGtR5gpqz6+9bxnkCKpxjcu6qls08MmU8woc3vcoyE7dYiBdwNxLM5ngeeLkjJM+oQky8VcfM/FamxwtueUJlkmZLTRi++ZV737lEeBjVYyBOBYyRuFZglVEfPV+bDrFBNQfFYitXETfu6fKXZtOayUayVs7ynogItiUKo2mIplFm+29yOQi+qU3Tj/fhkDArrd+a95KG5VLQlVdEsobNaVfg+UWYPG/ADJNpCS+tc3azKWeZnRuZjl53JdwzOigiNICBFlYOUuNUiIM/YiXq0fSV05Q13ztvM4XkZq7WzMmRE31QjqUrLaPYc228uS34Z5GB7yc9WDORUcFThj6/x+lyNlV4X
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(7416005)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 07:17:16.6663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a195ffdc-e2e9-4b8f-5c9d-08dc4d64c4ce
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CA.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB5754
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Since the ocp debug card only supports 100k, the bus is also set to 100k.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 64075cc41d92..98e58e3fea77 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -369,7 +369,7 @@ rtc@6f {
 
 &i2c13 {
 	status = "okay";
-	bus-frequency = <400000>;
+	bus-frequency = <100000>;
 };
 
 &i2c14 {
-- 
2.25.1

