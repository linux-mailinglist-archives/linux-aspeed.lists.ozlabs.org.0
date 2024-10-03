Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4893798EA9E
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Oct 2024 09:43:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=rPiJscTn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XK3ZW25XRz2ytm
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Oct 2024 17:43:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727941409;
	cv=pass; b=bjCeNWelFMXPMgtBLYHsGPFlolxx54haL9bUxylDwa2yOcpOEJzkHlKcCDhmKzP+6+jtBPE2mkzPZgMIhojZuLEuPfJI8polLRPmkaDii3JYilmtM4+CHSURbWVpKCQbFMaJ6MDONXjmWPFWlmzpYi932wlx5XxuMK4uEDW+uCab4ULE1cRzyxh7gahXLHAyUD0yASPb0SNE2W6xqrZdpPRU6V3+cid380zx2Fqp0Mvq6tP8PXFlRMFEFaW1a/9Hzfb+wifVWIOh9rbOlkOQuSxE5Zq8Qt66m5KcUi2LoEVsOOKVfQUru6y3pI/NbJF9xt2HpdEa/tESxUy90zF4Uw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727941409; c=relaxed/relaxed;
	bh=GiBJ5q+bi/IjTKgy5bY8+hHYQMTUMoy9jFuZwzN6mzw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b+ir044voAbAMdHjmXDwucIa+LHoLXYPuAn3AYJaQZ8X1MotC5HqKDGicikFdXmmi3ihssfujlzukv+zjzfkmc6QVbkvpvWZLYq4j4fyiBPLVY5w5gyHVW/kgxm0Z/RhJ8FYqLM8TEko7mZAQJqJBmyx+aBh4y7XKHJp6TK0l8O1/62tdeYnL1he8qFQy/DaCHf7h80CcmXo91+cPa36iDR0e/w/DEVvZ3w0cKCkCQn/Qu350IKcPCoG9tqDbNl3BRjKbjSxSnsBDSlDPPO8HsxleX7OMrR+UOJDmclKpzaI1sw4n38ToPmJ0mDlrLaAaI9+q4B6jBudfhiVUsWXDg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=rPiJscTn; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=rPiJscTn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XK3ZT2KtMz2yVZ
	for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Oct 2024 17:43:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CU6hFIA/OclnNpG9aeiICxyBq5m+WktO4ZYzYQTlLRPwbgwenHmoyt41UdXjRBK5zVk416YRdJjmi/GzuvdUQ/mkK3pNE0OMqcw3A6+nr3Rb0WCsKu4haA7SnCzzIgjZR+v0jSka4ffU3fZVqZeYnZvLrHuFixwU0nubQYjlY5eNfHRaleUv8VLzPiiujK5ZpFSk/6rdhXq+ZsbgXZQuSxpDpW//BxfV3AdiMjpyJ2OUj4Y1yCFQroEJyc5yBjq2L3eneG/TGj3K7Wt8pIGmdxVdkpg4buFFmQOVYv7GC8rQi2VLWh12TgXEQ00tOvuYzl7GeB2mC/2vUUXa4aIMmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GiBJ5q+bi/IjTKgy5bY8+hHYQMTUMoy9jFuZwzN6mzw=;
 b=LEBO7LBqy4bmwv4Kn4GICMv6uYKz1D1BPp0r2oI8owkqMGWTzF3ExYVDQyi9Buq8z4wviXfbfI+dejvYirpwFQWgjduY8ddx31NcRov2jvIro0DSH4s6R8d+SjVVY9eL3pkhq8M9z9+8jK73H7WlLl3BsQIK5t7GRCMPJzcKfqG5epgEBi88ARyqyz9vj03PBSfjWJpVi5UCUgKKJ/0F+o5KndhAVhcN1VNP7Vgq/UEuYpMAYGgkvgBoNgXVU+ScjS/wn/w2iq40SAIjoKRvNeR7oTJ0DDSXeyllIAWxPc1bPO09Etcl2nI1VP+ZALPgr/bZDWT6jaEgBC9tWdAv2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiBJ5q+bi/IjTKgy5bY8+hHYQMTUMoy9jFuZwzN6mzw=;
 b=rPiJscTnGpm2e1h9ctUHln6X0zDmQhehz9/aT5s36nExx826EK0lD3pX1p3mqwZ4au9W7OHvSOpI84uqMK/32D5YX8pSbC0j4lFwXZIFRjqFWhYZkMEq+goxrDWNCd5kBu4P4og6clwqoKofYxwZza33RnCDyxCFgM6b5N4COyg5ialCCRvGoro6XhxFO83udXJVWx03QFLh9ifUo97ivSw3jcoWIVF+P5kZ7GOxLT0ap2WiM+skSRMHDFTi/dySBAPt3mgI/okMqKauhdF9pqudb2Rp4fa9vysgHb6L2PXBt+vK5/+rylTGBzoGKh9TFPhtDxxNrwfatjG/CUlngw==
Received: from SI2PR02CA0002.apcprd02.prod.outlook.com (2603:1096:4:194::22)
 by SEZPR04MB8336.apcprd04.prod.outlook.com (2603:1096:101:24c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 07:43:04 +0000
Received: from SG1PEPF000082E5.apcprd02.prod.outlook.com
 (2603:1096:4:194:cafe::1e) by SI2PR02CA0002.outlook.office365.com
 (2603:1096:4:194::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Thu, 3 Oct 2024 07:43:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E5.mail.protection.outlook.com (10.167.240.8) with Microsoft
 SMTP Server id 15.20.7918.13 via Frontend Transport; Thu, 3 Oct 2024 07:43:03
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Subject: [PATCH v3 4/9] ARM: dts: aspeed: yosemite4: Add required properties for IOE on fan boards
Date: Thu,  3 Oct 2024 15:42:45 +0800
Message-Id: <20241003074251.3818101-5-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241003074251.3818101-1-Delphine_CC_Chiu@wiwynn.com>
References: <20241003074251.3818101-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E5:EE_|SEZPR04MB8336:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 246a350a-8958-4e68-45bd-08dce37f038e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|376014|36860700013|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?WesgE4TxySCx5UVvX22sSJneu/SDT8+lXD/8BU10uBFc5kE4CNgs7MB4tFt9?=
 =?us-ascii?Q?TAiKu15eStAvz+DZ4R1dTX6YxpXLPecUIzyNx4XUdub4v74DZMCTE/Xuawwt?=
 =?us-ascii?Q?My9G12iQg1sIurt1BfPmfEGmQe0d6QgfBmjpMlStWJ57NH0wUqBUZn69Iisq?=
 =?us-ascii?Q?d22gmuSmeCycAnGBwir7LyJ6lL/UNOIw8BMO751gwk/PdTPu4fMB/H4/JgsI?=
 =?us-ascii?Q?hZT9yMTZwgYYgZammm7WdVBpMQ4vmdFuo6Ok/lJNDqnUztylFqS0CyyCrTcL?=
 =?us-ascii?Q?8Sbjemx8xIivZ1F4P4+T2SkeHoyB5E4NBVGphNTBNYTf2kntjZMnb++sap3O?=
 =?us-ascii?Q?x4fgfxQWWnGJoYq3S2jGlSV9lcTNn6BL6GnwZ4/ASepS1R/BO1YqZVlxDRJe?=
 =?us-ascii?Q?gHKOVh++I+uBn/DIF775ARXrVCA7CnlBLfk6xCZAFdC9fh28vWE8BAX/xsN6?=
 =?us-ascii?Q?y3i92gPJtHYeNKG9MuZliiHjUiWRSufNtIjciDPu1bj54+/B+ZUzgP426IiO?=
 =?us-ascii?Q?wt3yfZ4CpSyd2mwGJyj9bgcXZQh4uosaoAsRsMbjUROqD1dE7lAOLppl7thE?=
 =?us-ascii?Q?JJJGzdsQBV5RJI7n7qI/ienVCGrzXnReWuCh3Z3MJKh5t2SySQ5Spu1qcP86?=
 =?us-ascii?Q?WSKae1g44ToQZl1/PCwQPs46Rc7ZeFU5hOwNvlBTj8zymF1f9l/nSrpT2Inc?=
 =?us-ascii?Q?xscefnnqT3pYL6oav4mYJoCW8IGm2iIk0m5bfy4bLl6fHYbgb48aLu227HSQ?=
 =?us-ascii?Q?f6f7BgKwvfP2XxQ7UaV3Dm24Iv589GnKvaX9j1KWLiYnsAois4Lr1JFFwdc1?=
 =?us-ascii?Q?rkBAxwBp1f9TfwZxiR4rm9EWoZtwXnv1QF+WhiIHqTcFnH4igWqpTEN4k5gi?=
 =?us-ascii?Q?zXlUYsd9Z/rwKK0yrBu0vG1UDrbbRh34F5W1KRrGo92ZC7KwhFlecz1LxA3m?=
 =?us-ascii?Q?6u+Oy8Zg6bQv0U0xLo8UuUS78mutcK0Zcby9vjsF1Ca3S6OdkpNZ5URjt9W4?=
 =?us-ascii?Q?Pz5kpAFLZEvjyoZ2lat5eh6O2gYHBvLjhV8fFiuVBXByiwvMBYC9MRva/dqE?=
 =?us-ascii?Q?rqW7+YO+HTPPKIWbEzAskTx5mvwpCSOkrBTkowuyBwifoUumyoTMuQo6TOd6?=
 =?us-ascii?Q?8NO0iBSIlXIQUoAqTTugvQK1Val8CZNaM2xsgl+JGb3wO4iZURBkb1UNhMx1?=
 =?us-ascii?Q?RP2uHn3UiYhQ3ieAQG1JDPXf1El4kip3OvdCx6impokBvB8f1UyhvlExevxG?=
 =?us-ascii?Q?sf3S3/I+LhBSxpaxL/x+plDDjAYHr64VT6FTnsRalzYMqJYn4WYCeGczvr83?=
 =?us-ascii?Q?091Wk+BAUCu8qC80yVqpM6pJB/SrwE8rh0UDxfpuKRxLSeZt8WbXFBZ7JbPz?=
 =?us-ascii?Q?CRHvVjFLCNpUEefuCdB3QfoHPiCI?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 07:43:03.2275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 246a350a-8958-4e68-45bd-08dce37f038e
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB8336
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>

Add the required properties for IO expander on fan boards.

Fixes: 2b8d94f4b4a4 ("ARM: dts: aspeed: yosemite4: add Facebook Yosemite 4 BMC")
Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 62fe4d513852..5a995d8c326a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1124,6 +1124,8 @@ pwm@20{
 			gpio@22{
 				compatible = "ti,tca6424";
 				reg = <0x22>;
+				gpio-controller;
+				#gpio-cells = <2>;
 			};
 
 			pwm@23{
@@ -1174,6 +1176,8 @@ pwm@20{
 			gpio@22{
 				compatible = "ti,tca6424";
 				reg = <0x22>;
+				gpio-controller;
+				#gpio-cells = <2>;
 			};
 
 			pwm@23{
-- 
2.25.1

