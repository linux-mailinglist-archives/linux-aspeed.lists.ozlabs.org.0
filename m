Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id D250D8CCE04
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 10:11:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=kBuDW5lX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlLLk6LZYz78w7
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 18:05:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=kBuDW5lX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlLLP2d8rz78lx
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 May 2024 18:04:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCqnOHvXpTwWWI9OTkb1Oiw0G7s7tYtOSelf/nOEqo1X/yxopH3VwSNL0+aO4zCKQSxBVr326WViXwVQRi1hjeTlkcp7o/98nuLOCgWzSdTf3kiLzwpRwBNFiWtG2AIxc/VEUkzNOvXsYTbrJNLk+dHxvPXdZH4vCslv6nKyfV8+JULfsm8Dk+ID94yVT5bkJqmSAcKQKze3WWXpxUSnx/nVAUJ90QqUu8RMjXUD3/4XchzD5AZaMs9pyIez8Iujwgk2q8odtxCTSELh1HUoVcPg+Uih+ZDEHFpgGq24JFO5Rj6IHaCyPVqRdTikzvKnBq2DWsoWqVwG9IXl3utjaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbK/2vsfBhS2GguN52/kCxQEVmWfjdwDuSA91VpJMzE=;
 b=C4IyP3mmdNc3mFrRdIK4HAtE09dRAegaMwNe7169xG8vPDfyrmEFQBkuto/DBqx3fcfO5423IUaHiufMaPwdcfGm0wHlQNRY7PX6+tIghLVJRsf86hrSbLQeX6s36z/oEblem9xp6Gk0dWhZj0ETdEQvDK0h4ilECVG3QalsZEPFNp9uDA/fXb+qtEZdFZMje2khxJvG6kxAsrwnyBivOMfHplocPOI/ULqVZTYRf3TlHWkZ3GoH1C7wRQK/J+tuoI9rzGmwXt6nyVnEAH+0LvWnhdHHp2e4+58K+MNUrJPWG9aufexGC0SMAxOrrTYqgpzAru11vVylT2Nud5B75w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbK/2vsfBhS2GguN52/kCxQEVmWfjdwDuSA91VpJMzE=;
 b=kBuDW5lXtqXdrxdeR8+TSqyThN/JImgsPrq4ItNdECim0bhEOz2n9ttWZwmWnqDRyms3Ne+aYgdpAwARiXTnFQWVlFoorcn/8wCc4t3QgiH5XfaC0/xN4wio9ay1ZD7CONm0mpgLHYY3+Aq+Dgd9UUqJ0i8ybAi0nQJZUmQXdsgO0e7jyKVu85MGlXAhAEpW+URD1X1VHLjrUvKk6evTEaFkcVHCtRXlLPLq9blQsaA///orymfBg+TgTfy5LA9hYA3yZoqe4/hTfpYSB1EvzfVhmersIjlwRHBAYO8Q8rI/7u1arOhzHaMuz6lWYa3Iac/a3z/t9zrQ4/ZUZAMebw==
Received: from SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19) by
 SEYPR04MB7672.apcprd04.prod.outlook.com (2603:1096:101:1de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 08:04:23 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:0:cafe::dc) by SG2PR04CA0157.outlook.office365.com
 (2603:1096:4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19 via Frontend
 Transport; Thu, 23 May 2024 08:04:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024
 08:04:21 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v8 09/23] ARM: dts: aspeed: yosemite4: Enable interrupt setting for pca9555
Date: Thu, 23 May 2024 16:03:14 +0800
Message-Id: <20240523080330.1860074-10-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|SEYPR04MB7672:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2f44dedd-c255-4c4d-1756-08dc7afef4b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|1800799015|36860700004|7416005|82310400017|376005;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?zBn14G+6zPCyu7UpZvKa081SUoPSy9XEoKrLKeDnTUP+Gmq9gOd0RsyGJpO4?=
 =?us-ascii?Q?AFYtIq2QSswY4ye38/dEu/LTyuaWNwGK19w73ByFGuI+z2DIGNt7Hko8Zh/Q?=
 =?us-ascii?Q?eCph6faegqjtm8myn9FPVfGHTAG07QCH3PLRE9/vlSSy8SyQ1CIsuDdba4Sw?=
 =?us-ascii?Q?TRkTb65evq91uw3Ate26cMtbTnLGRdj+dmgxiKhCbCclRMVQAGlzZ4JXG/u2?=
 =?us-ascii?Q?CbpyD0oxqx6KafDEX/DNxWyQ/WIgZqQneMLMPSXDVFDjAsd/EK5AcppTjqF/?=
 =?us-ascii?Q?R62gUy42Pjz7gJ+jLfSfXxQnKxO6I7a8At6I1wemDTdP+yvWK7vogk5ssNat?=
 =?us-ascii?Q?KLh5CLcRVcEjMEPDX2N/GxyloHsEOXvecRv/pHtyd09AzRsG7b6OCHVjmWMw?=
 =?us-ascii?Q?3uXAkLBjBhKxJDWNVevIKyZJ5TfGIXAFbtUoqktzXDtA5Fr46GdO2YJtZ5ec?=
 =?us-ascii?Q?foSuRalpHJjtisRtzK13AscFOiDu5UIkO2O48f/ZrlncyvrZ4pHaBZrqiesr?=
 =?us-ascii?Q?87mKe1qS2lq9lvQUOWNINPCCqT9wCK+eJVf6HuNjQPFl1ozsG2CvT52iIuXf?=
 =?us-ascii?Q?31UWhAlOd/tpHLNb2LsaEsfvS7njJZdeISOAqtvxWenq4dAjdsp0zofb0VkP?=
 =?us-ascii?Q?uY+ZLDYTBkmWeuO0SxfLitpcS9LWSJlNgROlQj70gb0x16o3/zXFvi+g4wgP?=
 =?us-ascii?Q?zXTTfIYsV5aMeEV71Xj5a3l57l8V5pZYL7Ls/B+0/21GOpa3MqdZ7kAkdgEi?=
 =?us-ascii?Q?Tct6BoZ6Mfs6ZUK0q2sQc/dejxIN/vy6zaEqhWr68RHCsTNT/Fl0h6ORS69z?=
 =?us-ascii?Q?vok2PnCiBLcDps5TuNplOL6bIITf680sgxwKFIIb6cHFZfS0zoHR1EgCkZ8h?=
 =?us-ascii?Q?74l1xfmP5UY5ieB2U1j+AC2Ys1ScdAibXt/8OFdZ6F80uDyOPM/75lEeIZjh?=
 =?us-ascii?Q?dJtKEp0Og46Z3UTs0uWyEDe7oQzpwy3emWp11uwSho5MityLNgSaftnHHGyz?=
 =?us-ascii?Q?/qlrSqTaSM1ud7j++cRPbqulPTgwiwcBbwBTr4vGoBdL2grDZR8Q9RENgiQB?=
 =?us-ascii?Q?esuLKcCRlXNa3KED12qnGtdbY4bCxq5Pe72zqityUTMViUP1bRYzAqDjChdl?=
 =?us-ascii?Q?u4pwV5UxvAfPF5k++8AVK5tUsjfD0X9kJ3RkAbsWci3isL86tjKY8X5HZ8Hv?=
 =?us-ascii?Q?6g04bT/PlTRtBPdnqbrA3PPDBuqfOgFtPBcqUx+bNQKXPoNst6FLIA10uOkj?=
 =?us-ascii?Q?3xYbVQuVOkBdMnlGJFU0ZgZYnF7hpfXrOAahx45ckZf8Wx3367JxdOD/xtMO?=
 =?us-ascii?Q?S5Q9SR78WCj+LgLa7rFS5AlrbkhZMnuXWbXOGu9m8IlMVK7lpJ43pbnwY2jH?=
 =?us-ascii?Q?UIm2z0OBXSi/KmHPRkstoX7BNk16?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(7416005)(82310400017)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 08:04:21.9061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f44dedd-c255-4c4d-1756-08dc7afef4b6
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7672
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

Enable interrupt setting for pca9555

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 56 +++++++++++++++++--
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index ee11b3b8e81f..92733a8ecf0b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -832,30 +832,78 @@ power-sensor@12 {
 
 	gpio@20 {
 		compatible = "nxp,pca9555";
-		reg = <0x20>;
+		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
+		reg = <0x20>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <98 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+		"P48V-OCP-GPIO1","P48V-OCP-GPIO2",
+		"P48V-OCP-GPIO3","FAN-BOARD-0-REVISION-0-R",
+		"FAN-BOARD-0-REVISION-1-R","FAN-BOARD-1-REVISION-0-R",
+		"FAN-BOARD-1-REVISION-1-R","RST-MUX-R-N",
+		"RST-LED-CONTROL-FAN-BOARD-0-N","RST-LED-CONTROL-FAN-BOARD-1-N",
+		"RST-IOEXP-FAN-BOARD-0-N","RST-IOEXP-FAN-BOARD-1-N",
+		"PWRGD-LOAD-SWITCH-FAN-BOARD-0-R","PWRGD-LOAD-SWITCH-FAN-BOARD-1-R",
+		"","";
 	};
 
 	gpio@21 {
 		compatible = "nxp,pca9555";
-		reg = <0x21>;
+		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
+		reg = <0x21>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <98 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+		"HSC-OCP-SLOT-ODD-GPIO1","HSC-OCP-SLOT-ODD-GPIO2",
+		"HSC-OCP-SLOT-ODD-GPIO3","HSC-OCP-SLOT-EVEN-GPIO1",
+		"HSC-OCP-SLOT-EVEN-GPIO2","HSC-OCP-SLOT-EVEN-GPIO3",
+		"ADC-TYPE-0-R","ADC-TYPE-1-R",
+		"MEDUSA-BOARD-REV-0","MEDUSA-BOARD-REV-1",
+		"MEDUSA-BOARD-REV-2","MEDUSA-BOARD-TYPE",
+		"DELTA-MODULE-TYPE","P12V-HSC-TYPE",
+		"","";
 	};
 
 	gpio@22 {
 		compatible = "nxp,pca9555";
-		reg = <0x22>;
+		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
+		reg = <0x22>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <98 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+		"CARD-TYPE-SLOT1","CARD-TYPE-SLOT2",
+		"CARD-TYPE-SLOT3","CARD-TYPE-SLOT4",
+		"CARD-TYPE-SLOT5","CARD-TYPE-SLOT6",
+		"CARD-TYPE-SLOT7","CARD-TYPE-SLOT8",
+		"OC-P48V-HSC-0-N","FLT-P48V-HSC-0-N",
+		"OC-P48V-HSC-1-N","FLT-P48V-HSC-1-N",
+		"EN-P48V-AUX-0","EN-P48V-AUX-1",
+		"PWRGD-P12V-AUX-0","PWRGD-P12V-AUX-1";
 	};
 
 	gpio@23 {
 		compatible = "nxp,pca9555";
-		reg = <0x23>;
+		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
+		reg = <0x23>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <98 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+		"HSC1-ALERT1-R-N","HSC2-ALERT1-R-N",
+		"HSC3-ALERT1-R-N","HSC4-ALERT1-R-N",
+		"HSC5-ALERT1-R-N","HSC6-ALERT1-R-N",
+		"HSC7-ALERT1-R-N","HSC8-ALERT1-R-N",
+		"HSC1-ALERT2-R-N","HSC2-ALERT2-R-N",
+		"HSC3-ALERT2-R-N","HSC4-ALERT2-R-N",
+		"HSC5-ALERT2-R-N","HSC6-ALERT2-R-N",
+		"HSC7-ALERT2-R-N","HSC8-ALERT2-R-N";
 	};
 
 	temperature-sensor@48 {
-- 
2.25.1

