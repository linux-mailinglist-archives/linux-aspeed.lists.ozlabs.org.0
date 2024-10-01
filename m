Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE8998B6BA
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 10:21:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHrWR2PpFz2yPD
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 18:21:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::62e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727770896;
	cv=pass; b=Tdcz+1GERCvU79KLI/zpxlJEaSSCkQ9+yQg597V41ULoMkj+/dreu3C4rfh8yDbdfXSvz7wdqXRoUI9MmcBz4/HsaXFi97fuVq1gWM8YJm2k+Abc7NYXehJqsF+Re1af58B55bTyjEwEBb/XUgKX1bvl/WLuz/v7/WkGN6HCDw1bVFbsv2WZHJKsbXnGRV0tvfSpAq41/SjsvT08RJu3vMN6Royh/6RfJtvvbyL67Fg14Cw6t2CkEnLlJPIWWcTZiNnt/tKKN9SuaEv3T87F8m/L+MnlNUiHrXGQwS+smk3shdiKXUB8BwFDJgOsQT7ZqnFHSnsA5lnBNWj6UAWxbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727770896; c=relaxed/relaxed;
	bh=dPdMT/cRglR++k3gSQFwFnG/0KysAxJkHL+SgK6IDxM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HscjeHKX8I6DDoaV/AkdvHw3A3J/451Up/kGb6C6t3sEyVHulQgcClpYanV3mrVM7YnSDp1Qu0jiMRT9mi5AVIM8CSsrh+rrPaIp89P8LxX07vlUzkyF4X7E48i22C6t/iUZzrAkOLbrKGpp2pxRhdVY3DHosK3+oYQx753g2EXalkRr6tLFprz5bqWCHEIoU8J4drDb7eb+iB4T4Uo60vCeVwZ0lMKx+tZ7P8BAZcdOQRbQ1CtfoBLB9quew1t0i3TcjpvSKkOpRH9ZKEs1IdJEbZ6ryaA/LxB2lxQYIaXOwoN+ha4EL501FnJyxytVX4o+0dgHMeYMm3QCnFFsGQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=cv8l0MhO; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::62e; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=cv8l0MhO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::62e; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2062e.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHrWN2SsWz2yGM
	for <linux-aspeed@lists.ozlabs.org>; Tue,  1 Oct 2024 18:21:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EuV4uVxrlJZNHd/MrU3PZjjjp+THi77EAsPS00ksA4gDRndV8x5pmeXe0lojBLtzud4dLZDQkf+cVakzPs+HPuKlr/SUsFtZZE6/pnEdhq5ZnjKCB9jDm0ZYdq+Yf7QJxeXUBj5Go6z1gofP7pt5r5PgWkW1AV37FtUU/wnqL+QYy/BZeHJ9kc6vJ8uqi/2ivfcfX34uE6LP8FySpfEsdc4bTYxAgyKuSpO1vk+yTFksr6WjLh1G7F5WVxN1jQTEhncx1sBmuSsni+9X+k5ymgpr0ZXKhQh1ho7WnKDwYo59tyBL6e8QTdar6l16wzy381zTzenVRVRJp633xSqjRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPdMT/cRglR++k3gSQFwFnG/0KysAxJkHL+SgK6IDxM=;
 b=ZhqPdS4usvL4XiBtmGnMQdVeLnbXOd9bTcT8MlQI44MClTXVKjGwaTv5aj8YZptmzz3IGWJXkEuLIWXRYq3czOhxajUHBtxEMnGmLtnACDYZoerJ+QXJASTL3hjJDatZaTb9u9Xtc8KPIGV6Gk/ohsNPbXUKUFfCAdMQMY9s3nZSv0SO35SL9dfZSQqlA1uObwyQd4piiLeWUQBIe5oAOn+LLNnv/BajMOONgRF/F7t8tZysbWqsNJriOSGLFXbGvdEx1bNcSozlIwXJYqb+xRJ4U9Al2eFB3UryauA09uo+ZQBZbdbWsYpU0N74iDic7T6Txw0I661+8o5GCM/dPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPdMT/cRglR++k3gSQFwFnG/0KysAxJkHL+SgK6IDxM=;
 b=cv8l0MhOr8reVXtsqA+ZRB8c4r1iYNNFG0L4ve07iGKsBcSIV7GvFBmBM+BgjGGD3pQVRkklr5FZp5fltj+3IlkSe7WIegDibXACUWHQ8w55Y3fL8/1rUHZDcZ74Vb05imJyATE+xP+qgnY9ArJ5KS2DB7BdwKYrhShKGpSG76AKebajYBcTiicB49CFWQ25sfx7xVFmaJf9KA1030ijbQWhhxOPWuIbn16l4KpQC0dWe+6LRfUbWzl2J8j5wMcYSlQy/Gp+RrkeWfSbXDyzHPtkYrqHpmYLRoRA2mdkT3oib/4xp4ZNHwv1i0NpUN3jKou6yIyazkJoESpFQSoDsg==
Received: from PS2PR02CA0088.apcprd02.prod.outlook.com (2603:1096:300:5c::28)
 by SEZPR04MB6093.apcprd04.prod.outlook.com (2603:1096:101:97::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 08:21:15 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:300:5c:cafe::1d) by PS2PR02CA0088.outlook.office365.com
 (2603:1096:300:5c::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Tue, 1 Oct 2024 08:21:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.8026.11 via Frontend Transport; Tue, 1 Oct 2024 08:21:15
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v2 08/10] ARM: dts: aspeed: yosemite4: Change the address of Fan IC on fan boards
Date: Tue,  1 Oct 2024 16:20:50 +0800
Message-Id: <20241001082053.3455836-9-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241001082053.3455836-1-Delphine_CC_Chiu@wiwynn.com>
References: <20241001082053.3455836-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|SEZPR04MB6093:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0a53df05-aec9-44ed-6e92-08dce1f204b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?S+cczkZyO/9K37ExZNv3Z1Ov9f2tnf3mNOQpZv4nNRrPCKKuyKI2pAFlzw7J?=
 =?us-ascii?Q?TtRTuwVNhw7stLwqgHD4ez68+Fh8OA6eS/e79qPD+unOyO+lJJ7QYr6PQXA/?=
 =?us-ascii?Q?yVx3jHu4lcwHRTmRigmtFeB127+Epymp2bf+6sG+R9PUaqlCKIznubFG/RQ1?=
 =?us-ascii?Q?iWagydGFYwGfYUo7McA8g3VDlY9CrwB93NFKj8BKKDtqBDFuNFrtDFGPpbYg?=
 =?us-ascii?Q?4AIx0Y6VBNGL4WYTeki/XttB2xxTbjpRTFvTc2RI2uFed7+oE/uauQj26GIE?=
 =?us-ascii?Q?LijBhLUC4RtYfKe/6UHh57H5oKCCbcRb2IMDNwy2ZqSj5owcIPs9uXP4U5Bv?=
 =?us-ascii?Q?tPXPt7ZMlxIqH7V/rNr0w8ZHbsAwCD6LInHjkiqyyj79OWdSwkCg110pTeT9?=
 =?us-ascii?Q?lyqCePMyckpv2CA/Z6JwCQbLfJXgbyKukmiUX7JbyzBalPwWpH8i5JaFkO6V?=
 =?us-ascii?Q?NrjrjQSmC4vpgrc427Q5MNZd+UF9WZRsqt+TthklWgBpL/1JRgHzle1D+t5d?=
 =?us-ascii?Q?8FmoZFiDTFMbLHHqnEVFlvGnCjGOglbCUg0ggSsXRR1Mlxi9MsBhRzivztr7?=
 =?us-ascii?Q?QvWid6LiM0FMkWZt0QsEGKu53V0ZAgqXayORbfC0rioRa2F3N4r7Nt16XvxC?=
 =?us-ascii?Q?zyZN3WGitkVwAxvqCRTo8wpcGruBwicDTNGjSfKS7pYnH1dL0u57wHb5pMRV?=
 =?us-ascii?Q?Kkks2Su7M5HW9tq0+15Al0+B/4S3eK1ioP/DdufK6tf6t6ZfBbLbK1ieMrQk?=
 =?us-ascii?Q?tpQU3XFNkWiGBTXeYoHC8ocmHjXxluOf11HKOWv93paJLulEAV5fLf2BpBA6?=
 =?us-ascii?Q?BgK1sIxdmC2GvMOApfvswLoF5+yU1OqwSDFD9xg0ZTmXxLpMRkwQuQ+n8Iza?=
 =?us-ascii?Q?8WD3lHd4QUUg5PHnzlX/tHcCtzuOkh6tOXUC7cvAQqwCXFg+UPYfzQv0CoHa?=
 =?us-ascii?Q?VnHr8EpbWRN0U5qj05py41MG4mZa4iLoVtYIgH5y/YF96OMjxSvXn5zu9u4g?=
 =?us-ascii?Q?nfbYm21qnRBdKGUTlku8RjJodilvt0oLqch7cVniwiPONnSNQ3YQAic2grGT?=
 =?us-ascii?Q?CKoYaoGxeWHZcga4rYj4iVWraKXWb5NsqpkKLDZiHBRA/hLWlruNtLkPs13O?=
 =?us-ascii?Q?OuU9+lqDqqMGYd5Z+47AfOK8TTDJX8Mk0UAL4x8nz1YnQVd9VFPGbgDVCRHz?=
 =?us-ascii?Q?HzoxZtrn84r+BfsqH7hwcveBnZdVR4CDhWpefMBBl8LjJV655NVtxdn7IVvc?=
 =?us-ascii?Q?am5c9WUAH5FpG54u6uxIeY2heLVmVW3LjZult2LSIFGKTWqhqiJnzEkw/cT0?=
 =?us-ascii?Q?3xjhEX/pYEOCPWFPdS9QRQdVZqQfgteBL0/3zWdFP7n4I4ftJ9D3mOmS7qCW?=
 =?us-ascii?Q?0mifPoZTdZ8boFkGec3ch8ZvbipwU5ipgU5lFi8nk3f38KqGB8fXNeYtWEmG?=
 =?us-ascii?Q?zO8qpgKPUsmTwDZdJudpO6GoHMc1CMsk?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 08:21:15.4561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a53df05-aec9-44ed-6e92-08dce1f204b2
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6093
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>

Change the address of Fan IC: Max31790 on fan boards according to
schematic.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 01ee455c41b0..6a1dccd23225 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1188,9 +1188,9 @@ gpio@22{
 				#gpio-cells = <2>;
 			};
 
-			pwm@23{
+			pwm@2f{
 				compatible = "maxim,max31790";
-				reg = <0x23>;
+				reg = <0x2f>;
 			};
 
 			adc@33 {
@@ -1236,9 +1236,9 @@ gpio@22{
 				#gpio-cells = <2>;
 			};
 
-			pwm@23{
+			pwm@2f{
 				compatible = "maxim,max31790";
-				reg = <0x23>;
+				reg = <0x2f>;
 			};
 
 			adc@33 {
-- 
2.25.1

