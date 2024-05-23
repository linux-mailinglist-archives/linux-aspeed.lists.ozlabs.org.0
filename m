Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2FE8CCF2A
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 11:26:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=s/HwLb8G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlN0K3fjmz78hy
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 19:19:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=s/HwLb8G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c401::3; helo=sinpr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from SINPR02CU002.outbound.protection.outlook.com (mail-southeastasiaazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c401::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlMzs45vPz3vYF
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 May 2024 19:18:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDDFKEbk+UFzbzErbG959hrzafkIz8ebO/eSmeTxph5H/1RCWyOZl+K/wmlBUg7QS5qUDTOcw8ZrXyh49XW4nSYv1fp4Y0p3OEkczkEyzpPsL2t021vJq/JEbeZGmbpNH349GkGQTk5qB0Bo4RO0zj3LGWgD1lj1szQSe06ii/isOSDVgGTMyEB4ozA8HqccscSxaJXPfI0PPavTiCVIU098oerECFf1YayyCoMhalmdrQvjlo2DRXQPoK6DMhCPFs/h0IqDA86zyISi1e1HYWa6OLI3SguSxFSseULiAUZtBRrCYvlAf9VtdsN2GWc2TH3UPtPR62ttRYqhfoFE1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DIe7675LKkKmPyG6VqKrZMsMV8GiNtMS1alBZCvnz8=;
 b=oRUoWpMhT3SGtyw3xr34HFLlKGUJxVg+KZNoDSpjB2ZholzHrbL5roWDGoo3NLyUU60kERKYZqIg0uCvj1wFSeQdqlSe6vXp7Pk0h950rHCw01PAc09xigsuOB3GOjV9jdMgzo/yjG76Eymo66xxOcgrSKRbkEmZvYBfXrfw/F8H0BwxeOy51S3SVscjnhT5COK/zzC3HzwivxQBIeA3/GyToBocJwYeRh6AFeRyooDhNyShGS9q2t19zrqiVjSDO11Q91BNSZjYgYpewrsHZ/OCBZrlArpNPfgD9C82m5LZZL3li5iHaX2YudI0dC9Q/DswR94OaaVw2AVrTZXPDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DIe7675LKkKmPyG6VqKrZMsMV8GiNtMS1alBZCvnz8=;
 b=s/HwLb8Gq6dd3X1MGf5lTF1t5nYN9N78krQacfHCLdXQkT4IMh/YljIZSw1Q1+reiSigzvtT6hujb1pQVDoq8G6hYYXMYIAL4gXmihTGudW/RYtJWpcUCFuCvDMVxOqkgxvcDk6am4Mf70BdBb4Of0OhrsT6ZFekiC0C/697lm6PONmu7rs0KVpToEmiJ1KoG+7QQN6jha8PXMdDcjvc9EbNkwjjb601QCDBUTOYxDY0wMxq0IaTnG7+TJNQo2OL2SKJcqJdNHQ9/N5aHIXpRDq4Juw3PJcVFwh1I5+vCnK9zlwjkM/K4mY/smZzlhdS7vILBUVvtrSA+TuKxqUVzQ==
Received: from PS2PR03CA0007.apcprd03.prod.outlook.com (2603:1096:300:5b::19)
 by TYZPR04MB6907.apcprd04.prod.outlook.com (2603:1096:400:340::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Thu, 23 May
 2024 09:18:26 +0000
Received: from HK3PEPF0000021E.apcprd03.prod.outlook.com
 (2603:1096:300:5b:cafe::f6) by PS2PR03CA0007.outlook.office365.com
 (2603:1096:300:5b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.9 via Frontend
 Transport; Thu, 23 May 2024 09:18:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021E.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server id 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024 09:18:25
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v8 03/23] ARM: dts: aspeed: yosemite4: Enable spi-gpio setting
Date: Thu, 23 May 2024 17:17:50 +0800
Message-Id: <20240523091812.2032933-4-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523091812.2032933-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240523091812.2032933-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021E:EE_|TYZPR04MB6907:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f9bd7012-08a0-4a79-d997-08dc7b094d1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|376005|36860700004|82310400017|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?yOMdTzl/PpjRiIgc9UQrVk2OC7kZDioplVd3Zcr2db+637+K6UtBmoO6gql6?=
 =?us-ascii?Q?FNhkSJ4tLOkfLEcejus3c6siXGXeuj6VUDnXCdxQZJABydp5R18aHlc/aIZC?=
 =?us-ascii?Q?9DPQgWaKNvwuLe6Yj6HSlZqdFWgYV73J/TJNaAcVsfQr2iHIU+ApRrXjof55?=
 =?us-ascii?Q?qygI26jyvTygY4w+SfbhX8G9vkPbVZxqnrbqEF1wsM84NZm32fZzLM89WKrp?=
 =?us-ascii?Q?PSC7lKp/fbYNLZsjmpRR5p7Q6FgvvyHovxYGfGImFYn/jvaRJQqRl9v5SkRv?=
 =?us-ascii?Q?DWiiLuz2ESeijXEasuckHT/YwFxqIEu4FcPFxwf0Apvve9yWFUnD40rrNmrr?=
 =?us-ascii?Q?8fA2Uj8keMMoQ2CIDuS6uRF0mVLBJSAedDqruY/iABg4nlSyZqa27wJ9ozaI?=
 =?us-ascii?Q?H345tdkiSzGWz1FsXPTQw2otHcwt9bTCaV6bJaUSGahcQHyYwIqhOhdQwxfG?=
 =?us-ascii?Q?vt2aCxBbTsuo9kWzcGU7W+UfWMtGO1OURi25OykkbDSupmcRgu0XwwEZxuoy?=
 =?us-ascii?Q?QEltPr7bomSWaWDqQ1r3SoYw7fU87XU+YbyDKdYlz+Buy4JjU7WFrN+CJHPF?=
 =?us-ascii?Q?0RFhauqBc8TsT+uLbA+Eur6ZLKMsgXrBrYypVMta1qeLucVE2kVBptIUj1EL?=
 =?us-ascii?Q?lM4IUX5DVPUmxFTLQXiiWIzt3GXmSjBdtEihaP1/3tASQAnSQMF3vPEn7qmk?=
 =?us-ascii?Q?grZNr8l+TRSa4B8daSX+GoUqMkK15jmD8n+uFYsjVTM65FB116auwGKnpiFW?=
 =?us-ascii?Q?Axufk1+Q3caQ8WIPeL8D1jvCOJb8K/TNyt44peliBNizzvx5rWWwWpXo4oeU?=
 =?us-ascii?Q?yF9n7RnkuVJ1XYA8mCTSUlfgjYTT03bNxgoLUv/4ebAxFpvscYoU550T6VfV?=
 =?us-ascii?Q?maTh9fx1sqTOxCQsQdjSagA0CHj9WCvUQCOkeuls6ALHWWnn7Lwj8cf1S8Ix?=
 =?us-ascii?Q?g7nMMHsn/4WOCtzBL8kHHWDt3PMd4W8ydxVoRu/RM/5Wh6an0+rRD0wODskc?=
 =?us-ascii?Q?naA3VRQDAk66vhAFkcZ75m9pUe4k/Nyt2kRvSWR73T6hbe787C/Ryao4rbi+?=
 =?us-ascii?Q?OC37lt2brMI4r3oN+pDrz+6FIK/1SJKpNKtvuguUgTdMm8ExblEQk28JSTVE?=
 =?us-ascii?Q?/63uWb+bxJVAfyqk9zOnPOJVIGHc0cvI6vVrbXvGPa+uj5PkP+7+qkG6NTW9?=
 =?us-ascii?Q?HtCBswMzhOJJNl1bd2DcVu4h0qCCXP14qkwxhUmiVUHU4hupIkiMWmvSlzHx?=
 =?us-ascii?Q?zkeMkNDhZFIytd3Foe6kA9Fh71n+X9YeWU+W+kkd0pwfgrpmGiX1zzkmdnpH?=
 =?us-ascii?Q?nCAB7CXs11OOCcBvyGRA2zG2H+B6rKCYUqHYNARhYX+kgZEcpUGu95Xv9gjg?=
 =?us-ascii?Q?7GH/9Bw=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400017)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 09:18:25.5795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9bd7012-08a0-4a79-d997-08dc7b094d1a
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021E.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB6907
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

enable spi-gpio setting for spi flash

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index dd88be47d1c8..effc2af636a4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -53,6 +53,24 @@ iio-hwmon {
 				<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
 				<&adc1 0>, <&adc1 1>, <&adc1 7>;
 	};
+
+	spi_gpio: spi-gpio {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-sck = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
+		gpio-mosi = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
+		gpio-miso = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
+
+		tpmdev@0 {
+			compatible = "tcg,tpm_tis-spi";
+			spi-max-frequency = <33000000>;
+			reg = <0>;
+		};
+	};
 };
 
 &uart1 {
-- 
2.25.1

