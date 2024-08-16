Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B1D95456F
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 11:25:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="::1" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=1OVy5Vbd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlc615L4yz30Hf
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 19:25:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=1OVy5Vbd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wlc5z4NB9z2ykc
	for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2024 19:25:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DpFV5vzCi5t49IS9vvtz+t+jedWZK/fZ2Vl6pYI7yamHT4a7sB7BR44Ntxte3jhKjzXhenyG/cttLeEjzajvLwn+He8XDfh/Btl8W1tXi+lXLnaeR5SQffcsk4CCt2GWjHB7SBj/g76IZG+RXuySI5xwICRF1dzt4esQ4SX3rkXWRNc71EMkYJPchgbwNXhcNdPjxGob+oOIvhJvW7Cdhsp4IdczuAwaEEC8Rrz2uAmnNOHkG+W1n0Ks7okBafGqifQiifTTo8uESXE5qTThlNNgdPixlnanOFEStkXEggzpApm/44OND20yAWe113VIDCEooootjB/ecFNL8BDEbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwPnCRRMIs7FMuQZx/G2KDCYulqMsDb1BS3wTt124H4=;
 b=KOS2qblcCQsgB4KwVsPxxE1en8Or8OdyRBKEQYaZx9Q/2uMYer1uTPU0pda9r7AV/zB+tkqLu0kgF9VsjGVQbPnYfsjn+L//uY6kfiYEgKEsY6gN4zNuR3Dq41BbiMsCgLzvkWLzTY1eeTn+uzS92OytRgu75BKvJ4l3V0MBpJnnSM9fDIXYpz5cot1M4Qy3Q3P76XM1UJfJu5nh79W0wJLtGqsHQ5GN5cwg7BbFq+Bu5TpbmDZeKZPCAVcXcWT6udwN+VtfT6ok9v8kCoLXi9KWxHm866RWO1O4Uvowx5VIfpl7nGUJot5zFB0UDuTUlgx9D3MXN89l+BS6cqNKFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwPnCRRMIs7FMuQZx/G2KDCYulqMsDb1BS3wTt124H4=;
 b=1OVy5Vbdf9XAEz8gfyyGSvOwBWNYqUtrvgOUF55coM0EGVy/6ikuNnXQ7QzMKh5YpowripT5HddLI/W9qMcFyLNoF5scR0Hgok8KRUpVLbQ113F4s/RRNHE+Xk8QJXMQ0U0/YfWKoflZuSrzYHafdoARqt3ctYPJGsF5J6O96cZx94BI6kayWItFFvUOCRWWP8LrVXxz8e4nOkpduU219KIXvkSdQ7HSGB41dIY2Mo3yIidjbI3TN1V4VblkhCZpkwdLu9ZelTcld1Fb4s09zKTID5ocqFxkVojkhNKOJmPIbeSILKPIdX5pp5Vn2BijHBMQyn/JOLJ9PDFT3kZrpg==
Received: from SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) by PUZPR04MB6486.apcprd04.prod.outlook.com
 (2603:1096:301:f6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Fri, 16 Aug
 2024 09:25:04 +0000
Received: from HK3PEPF0000021D.apcprd03.prod.outlook.com
 (2603:1096:4:193:cafe::9c) by SI2PR01CA0043.outlook.office365.com
 (2603:1096:4:193::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19 via Frontend
 Transport; Fri, 16 Aug 2024 09:25:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021D.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server id 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 09:25:03
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v12 08/28] ARM: dts: aspeed: yosemite4: Remove space for adm1272 compatible
Date: Fri, 16 Aug 2024 17:23:55 +0800
Message-Id: <20240816092417.3651434-9-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021D:EE_|PUZPR04MB6486:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fbfeed03-c118-4f70-8d83-08dcbdd54fac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?Kbegd5pLtv6mbHGvLCsKv+xOLpAxeSayY2xhggwbl3OC/0X0iYXI9WP0cZ+L?=
 =?us-ascii?Q?NsPmw3gSe8vUSMntZaLoUB6ulZr+G+ZiIdTlq3BE636z6C3BiPnTNd5Mn1A2?=
 =?us-ascii?Q?joHdf5F9R55XaYyT17mpUjSwwJm4N96yVMaTuP5IsB1wl4XmKVQAR4fF37+T?=
 =?us-ascii?Q?Y3JygFhFy4cj+AvvuRoucArYDXuJb1epCjwLM8MZ1OAHOuc1NKoXUZVTcyoA?=
 =?us-ascii?Q?rGpjeoYBdT4QfzrxM0bUGEJiLGtvZrvvqYTfdlP8vfiSE14uScgFOUUCPbYB?=
 =?us-ascii?Q?yQ+PrgXObqwH00qAVnKT99OQs9/bxGhv0ZbQF30CS777V3tm91ed4siISqTo?=
 =?us-ascii?Q?O13cQmkFwm4u9Gv3kebaArUOtuQEPOe7qbRZfP3vOcjzVSSh7i203/GuZXVM?=
 =?us-ascii?Q?YoayKV00UBKhbb4hP50n9deI8NJIYPpJe0aWuPeDSL5oQfdHr9Ln/M3UHUDh?=
 =?us-ascii?Q?3oMGsnI6y0/KyFqKumiiBgd6LA7UtW4rO10HCssV/O/NsCgGBpeup5IrqGGY?=
 =?us-ascii?Q?pHMhC3bW+r2p0aJti2hp4LvmrO5WdGBDmuTrlWB22JXNr+3GcTm+N4anlMge?=
 =?us-ascii?Q?qVFGAvCpBmCKgWWfU/DI+t+pNeTg7kUiv930Np04xkReH+B/T9v+lsWJ/hv4?=
 =?us-ascii?Q?INjH/HepDXIR0FC9vFxnS9MsUI2d3Y/2CYYvWfhAVg2tLVtO2IAQ5V79agCP?=
 =?us-ascii?Q?dUiQX0m+i2MrtdTxPVgjuDTRVMguAhUmGrF4MvTEN31EnkgjfXeOYwwieBXt?=
 =?us-ascii?Q?i7GqFbocGIWF1sauBukUN0uDlq8JIZOCZK5OCJC6bIpS2Lwy4/GxnHrLjlDK?=
 =?us-ascii?Q?7YLKq3CAnaBcqCVOf8hjJnBpARfowwQXYpJYI4c6LLyJlm4J22+/aXNKIDUL?=
 =?us-ascii?Q?tKXMipFbhpnImA7xe0cRIzWmWVMl+pa49pRyjeezeJoYdPtQEkCWdVS5ZHOD?=
 =?us-ascii?Q?W6/ZPCBS9fLW8QEVDcIsIxsQnW56JMxM2GJykei+EmjkSb1uuHiFyPImOKrG?=
 =?us-ascii?Q?WzUNjtodDtNNRN/Bkkn+S97LHqu25yUDKhUg0c/hUVzLuhVFAkcOFysB1t4w?=
 =?us-ascii?Q?WaYnMrNClxd5AB4PHKxwSH7bzjJJqYYi47wSasf9lYz8FDCPe4jhNIhJlG8i?=
 =?us-ascii?Q?efqTtQHvXiALIetTgsTbcDk5tuFgAICiJO/DaEfRkKrM294VS1OGE0yZqpoy?=
 =?us-ascii?Q?1AZ+yjldet4XupMq+uq37q8j/crrcK8XxKxBn7Fm+Vn0GGqwNmYagEkKQ8VL?=
 =?us-ascii?Q?r6358JahNlcyRsQ8Mki6fO/KBfxXVhLn0Zd7Nlk3pgOSMARkGdk2peKXbL+r?=
 =?us-ascii?Q?p8voRCDVGhF3FqiOXEQRWZQZcmuelbYYQQkLcTZ5xkXZeC6nlchMFduAAph8?=
 =?us-ascii?Q?HhQjh3/Vn/FOyXetvYNBXOMUK/qHsCgslymb12q/ijNk0qOzkQiW9+iNSv92?=
 =?us-ascii?Q?7jxtqBu9g7xdV1iglCkKJX3Bw+GBET0O?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 09:25:03.9972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbfeed03-c118-4f70-8d83-08dcbdd54fac
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6486
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
index f4d27f1ffdb8..b11951c2f71e 100644
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

