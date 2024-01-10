Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E28827F38
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jan 2024 08:22:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=UnBTLK9o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8MnX47K1z3bmq
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jan 2024 18:22:08 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=UnBTLK9o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8Mmy1cszz30gL
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Jan 2024 18:21:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amKfKM749mWDt+CjU3O8kEYCVbjNlR5wybV0xUx64cLS83TaLMn4Q3IMxYODPulTegvSPA9pt9WVKgvr5TkYt9u86xvVKpHLYE3bV8urh/KYL5QiSw4Im7921T94Wyf5KUvyOZQq7BoWAFgt8QMS2ZgGvFbx3lZVm8pVorsUKn2koT0uhZFt4vw8lzsz32emfd1JwdmhUZjpEuwBpswzR+5HIk/gzJZVX0QeWQ2nsao1yiuBX/G09q2t5ZFfQsS7BLm4DgVZd4GHxxGvYeir0QaRpLY/EXXcVyAvUh5XfUoNnJ2QBBXKfn2M5LcnL4kiSNGJt4shJt51UzkqqgrSOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IINSoxJIm5iybOOhBOWJpL9vfzS3qN3CTn+pgk7JS9w=;
 b=LCEUvzKkw4bpOY65KOY4bPcbOFhZGgNyEYXYtwZAPNRHdfekwxxfqWSC1qX0kxoLfpjnUHsAG51kbqSTATmEfCTRlrtLPj3bC68y8ueYo7YLlt07hPzESZHfRr5YV4aOfqBKvhxNj7HlYPiQP46qHEbBNYNaV9vLEYxgGgahZWJE8ekCuZJOWb9fhu+9RJa+E6YoIfBmd5YG/IiMnOO/mOi7beHTUzYj+ksEBFAWEUzALY5VPfuaxYPzYnPp4Ie6FcusdXeRfGf2IZtrZ3DZ88MrZCDJyTi6w/Kh5QT/VkbAGWBk0kUUqy0icsCohuMjnMphCfgc3GhalT2PMGIdOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IINSoxJIm5iybOOhBOWJpL9vfzS3qN3CTn+pgk7JS9w=;
 b=UnBTLK9oLafdxO0mrDRjSLUVM/hQd42ZYjx6Zzxn9WjC6Ghs0LbvkQQpSVnj6PMwzfriL8XrumYyKEsi13riBtbsK2TP3kl3DTbCcCSmFY3IV2OXd70e44CkxeTTprLHgIIBhCB4Qd0HlRB5L7ACDp4W5PcXSJXWb6HVENbNHI8UEMSP+4oReHHjpgb8sjhhH3NS0xmw97JniEKza/dfj60jeC0M1P15KcqcS96RJQR317ZffWLeMAxtUVTSuCPNsWOPjQ7N8ixzWYjAlh/T/obAcQxWWa3+M5HTXk9WtUltJkQl3u8ZiuAMluaL22kXDqQfLeVrocOsQ0W3FHuHAQ==
Received: from PUZP153CA0017.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::19)
 by SEZPR04MB7856.apcprd04.prod.outlook.com (2603:1096:101:228::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 07:21:17 +0000
Received: from HK3PEPF0000021E.apcprd03.prod.outlook.com
 (2603:1096:301:c2:cafe::26) by PUZP153CA0017.outlook.office365.com
 (2603:1096:301:c2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.6 via Frontend
 Transport; Tue, 9 Jan 2024 07:21:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021E.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server id 15.20.7181.13 via Frontend Transport; Tue, 9 Jan 2024 07:21:16
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v4 08/19] ARM: dts: aspeed: yosemite4: Remove space for adm1272 compatible
Date: Tue,  9 Jan 2024 15:20:40 +0800
Message-Id: <20240109072053.3980855-9-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240109072053.3980855-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240109072053.3980855-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021E:EE_|SEZPR04MB7856:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5b28386f-c925-4f95-fbcc-08dc10e391bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	wzCpxhIvAeAYvm17QcF+uU/yw/Dpkh1OEoJJ9HhKput3LHqkgWjbFt7HUZr3tBxJjpu+lbuWardhIlwpcH6UUge2VBfdWpqaexNQiBb7APYAGP0z0RLYpdpwt96cA6+G0wzCX2vHSWTFo9PKE5b5jPovXoK8e2jG4LhSbzo67ZTHlmibv/g6SZPC5e4GhmpDVXEUZJp/T9gYkL84ZrB/epN6IGzm/ISkvaYD3ATzsIWnXOZQcE430OQSU6ocnKRyd5FwctlzYIsb0C1eNGRO9V/vu4iME0d0WvfbSK9Gqh+p4L8eNM9Sz1mt4+LX8G4lozJ0bRcg9iCFePFhCVAae4aNIYpTvprdJLsY9BP5DK+lt1kP5XHYnVzklBog9h3KB+mSKzgdqWKeHDYDaHGENTXDHlOfk0WANXmr9+DE3Q8ox4KFEs8wwRUXzClKNDeHebTLEIE+m3iPitfl2Mif7ulpD4LpuTtJy7xD2rkON5zta7fpS8xeiO7TS10yp4qVy+Xy/BLeBormqFtuDFjPSIAHkKA3UEykN4l6Bu55CtkdDR4SgJ1LLYgpGWhOY172Jx8mjLbGTaxP9+MCfw84saoM1r679VjBxz7Hg9TRpd+13Bapb6K6UBkYflQ6/ri8x0A/IraVdYf8BLoudBZf3qDjTfWtTiMN1RJXQETRKWKSatYPVwuTSrrFRsnA8h4MO4cqPL1wBrAaMmUz16NaKQ==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(186009)(64100799003)(451199024)(82310400011)(1800799012)(46966006)(36840700001)(83380400001)(6506007)(6512007)(1076003)(26005)(336012)(956004)(2616005)(82740400003)(47076005)(36860700001)(5660300002)(8936002)(8676002)(4326008)(4744005)(7416002)(2906002)(6486002)(6666004)(478600001)(316002)(36736006)(110136005)(70206006)(70586007)(41300700001)(9316004)(81166007)(36756003)(356005)(86362001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 07:21:16.6479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b28386f-c925-4f95-fbcc-08dc10e391bf
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021E.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7856
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

