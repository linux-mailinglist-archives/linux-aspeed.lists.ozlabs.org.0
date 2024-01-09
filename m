Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD82827F45
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jan 2024 08:22:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=gGO01qDi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8Mp919jxz3c1C
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jan 2024 18:22:41 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=gGO01qDi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::602; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20602.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::602])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8MnF4CXqz3c3H
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Jan 2024 18:21:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nU5J6NiaJ2/sO1kP78hPzsAo9zYFCzNuD6sAmjQPvYnNMflGOL7KAE7A2ridPLa22BqmWJ92YM4MlpWDkNkCU/kEwBPsQyJkNoe59UoudeHROcptHFTg+t8O/w/KkxwBPxhA1mnw/sYw8YOWX1/6VocJF6l2LKBHgmN+Ctxoy6oa+QRxTvHRjtvcaKL1HRnmIRRq1RB9pKGM1GFuErHIWxWkvMAfSmGPKxN+OxY1YMxb1vGmzH+ms1QQlcGBlWcHC43NijzTY8PM/H5mOPOEXywoJ5xnsDmbx3XxuNekGbkfZSBCmTEA4FBF207xSv5+N71OLv6G6jMr6dVEg+pd3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLcFwW1tv4p2JWNn5RjVO0elk9Pwc8+X6o+/UN1v+Vc=;
 b=UoC6CLbAWM68ZE9lOxkZax3ot7K0Wux2DFhx1P13uEpBmVuseVEseaytM2ieb1WZ1pXddfKHtS3gqPFm7MMKmkHVrBO0lSH8WSmjNfkY8496PhHaPPUSdXDHvE7TWXCqLSL7wPNyJWD7yJJWv+uYvcnBlUUjRgVIXGd6e/9pco3ASi88a48acMQsmiWb/4AwZY5jQIs9M8clHmOttTrzGsA3cSjgVEc7GmXwEaR9l7yx+cuFJGS9DFUPDbrvadjCFiHgdcHSril5Bl3OnbQKb5KXpF3nMu3iKhzcFkERIvjBiE2vj2oxTO5kT0M0WdybMirhmM+eeMSRSvEK+/UhxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLcFwW1tv4p2JWNn5RjVO0elk9Pwc8+X6o+/UN1v+Vc=;
 b=gGO01qDi25dj/UUY0AYbMc4/iRU21cUK4p+gAbP4Bfxv5IhaeYIj9C0+tLLiNFvfDWxxhbDNamF4C2Q/w/JXGlsWh4LkvLbMZiuY7nVKHYwyQDrJpkR0sA40ptmL9KPuXoxxfczJCa1MG7W1VskD13AaCerqOI1S+0GL09ZR/Ti36SroBr73g3aIsDT4ruvFOF3D7ViUf5y3UQh9KAN7AZCVpZR7WH+jn6dU/lsp+WZiW52pcOn88QH+VjINcx7YXrWL0f2H/4Xw3w8f47kQyE7t6OZAeQ76LANulcjIt58xR+4YtCQ7Yd7KjvxNdN2vPy+OY7YWxQfj8FfY5/QMHg==
Received: from PUZP153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::14)
 by JH0PR04MB8212.apcprd04.prod.outlook.com (2603:1096:990:a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Tue, 9 Jan
 2024 07:21:35 +0000
Received: from HK3PEPF0000021E.apcprd03.prod.outlook.com
 (2603:1096:301:c2:cafe::59) by PUZP153CA0018.outlook.office365.com
 (2603:1096:301:c2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.6 via Frontend
 Transport; Tue, 9 Jan 2024 07:21:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021E.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server id 15.20.7181.13 via Frontend Transport; Tue, 9 Jan 2024 07:21:35
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v4 15/19] ARM: dts: aspeed: yosemite4: Remove idle state setting for yosemite4 NIC connection
Date: Tue,  9 Jan 2024 15:20:47 +0800
Message-Id: <20240109072053.3980855-16-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240109072053.3980855-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240109072053.3980855-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021E:EE_|JH0PR04MB8212:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 68d8aa7a-8302-43a3-2174-08dc10e39cc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	QJZNXd4QBFY/ukWTurN11DUZd0JJnpeQ7jYTUPen5JOrJzF8uTuJykWBx4g7iy+pHHlyfCzzvpowucUM9NZDIv165YLjqSh7BZIlC2yANTrrBzCFmPRP4t24WF0WadpyXssRmW0CX1AA/C6U9ieuAHWxaBb7rN0+LmykTHc21o41MNhc5R4fX9UggQrgL6cpGT7Iu//JWBoeQ+YzlFKWPTv5N3j8r/pEARbjC2q0EY09kO6gNn234/bHW4hoFjLb40tyZYjB+Kz+7nW+B9P7/1ShJjt/l+obaM0cXvEjbelzsIH+NtOuKr0yn1BmwBkCeKnnbgYugG+R8nFwYDxiMgqcegAISOdXv27LW9l30hYmVs/uxF/2zCHQlEd/kaM7BSnkHbjK8Dh/6VEssaHHdvsfgHc6b1pYroYF+zgDaEJ7mfSmvOVO2aa14j2oHqCEde/aAxv33nYqE7mJC9Ll+3gGoK2WN446pTwKZYIkFr5atwfKRf3+Pwtwl/8a7PckooGRSobujmUGaFI2c+Od7lvN+N6TVS6XX81P6YAef9CSwd/w8+CthisrQX0JzgwyMEvO7xh9eytikqD73oEhVCTWtEVlcCGrgG//1oC5xgEw/zZEkFftL9DZwvqjVKGHCXn7uJD1VteRIrgoLkcx5tQrJK5VbyhX5davkUa/Zw8UIOcBxu2HZO+VfJgUSV1NnLwue/KFDlC5u32KRqJ/tg==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(346002)(376002)(136003)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(82310400011)(1800799012)(46966006)(36840700001)(83380400001)(6506007)(6512007)(1076003)(26005)(336012)(956004)(2616005)(82740400003)(47076005)(36860700001)(4326008)(8676002)(8936002)(4744005)(7416002)(5660300002)(2906002)(6486002)(6666004)(478600001)(110136005)(36736006)(316002)(70206006)(70586007)(41300700001)(81166007)(356005)(9316004)(36756003)(86362001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 07:21:35.1325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d8aa7a-8302-43a3-2174-08dc10e39cc2
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021E.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB8212
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

Remove idle state setting for yosemite4 NIC connection

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index c61b46a0a262..6cfd9c231700 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1227,7 +1227,6 @@ mctp@10 {
 
 	i2c-mux@72 {
 		compatible = "nxp,pca9544";
-		i2c-mux-idle-disconnect;
 		reg = <0x72>;
 
 		imux24: i2c@0 {
-- 
2.25.1

