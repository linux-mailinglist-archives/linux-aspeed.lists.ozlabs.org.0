Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F121C939D95
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 11:25:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=LQ4uT2LT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSsFK6NQpz3f0P
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 19:25:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=LQ4uT2LT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::60e; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSsDd4v7vz3dSW
	for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Jul 2024 19:24:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHC4ifFYzUSn1GHgByqqIZCkqWn0kCWVbbNg01aAlB1JFHHnwEQ+Bz57lT2BkbNETT40AMYH9Z86mrt2LnEYMKlW7Y9dQ59Hz6lginldeWgoyRr0YA+Jj5SSjuGCazB4TCYM9N5xKKJiHAZ2vAsKGYLfMBQj/rPHe5qBL/IcmvPOpPEvQ4E1nfcdgCqFhHNI9OjFMPB0IJ8pSOR35C+nqf7cAXqIvezUrH8iF+zDWqraw8uN2OPlvqVTG4NMDiKA+TXMMNK0vME9YVY4PhFN3nakIgR6MOoW9Xw/hER4SiRJ4pwj/yGBZfYS2N4ZX/b5tOxBUrLarRxw2XgXR7hknA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKDiGhY0qi6Zhw5yz3X3KRvVupBpI62BiZwruuZTFwI=;
 b=dMPqSmBqwZdak77soUMa/BePImS2iRhtIUs57rgbTEEf8cdbB8KRckkVrsAYiyAatlkjXKTLwuKbN7F7oJt7/8L10Udd2vKSGXwkcfDtVt4EDb+GO5FLpUoZ1JE1XLMAM7oRBTy1/Gd0VCtlDoYCbbO7K/iDAjGQDgSyts4q4tMtcGEz+eePbxqWqxzPcjQGiznwif1TZlmtupzgkI5xX1xvDvOEtRFEIMoivdWKoIxGz88reCUeGE8mpdOoNn+ykw9tqSdLpmCca23e2aD7QL5X+WGrCAaLJ0WVAH3gqpprv+d9t2AJdYG8/RlJ/F/doEUtpRROaPOUoyzdvPeX1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKDiGhY0qi6Zhw5yz3X3KRvVupBpI62BiZwruuZTFwI=;
 b=LQ4uT2LTG3kCProoJDomePRNJTBy8s7F3R/xmQlJ8iHn8xt0iGTvWJeH3CGM4aZDScW8ZsIcB5RsHd61N7N+7CNZPtGrxuUzIEd133bA0cKEIQutIzJmGxKO9LaeKhWafR+qtJ6335+79bf4bWd6I1a3QlwYp82JW1M8sEJ/sIoxufS/AxCD5KRBfUtRw9MCyYW0+hiCMPCF56AuWFIgXdBPUqWYO2HnPlJWTsc0SjU57wNxcQVbL/rSGDmNZFLSHIh2Fat/Grj+Os0H+ZIOLZuiKGitcspvs2vtewMGrO/e1SDm0cSz+8yJCD2KmipSNpLhOxG8rupWxareQvV1pA==
Received: from PS1PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::35) by SEZPR04MB6825.apcprd04.prod.outlook.com
 (2603:1096:101:eb::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.7; Tue, 23 Jul
 2024 09:24:32 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:300:75:cafe::32) by PS1PR01CA0023.outlook.office365.com
 (2603:1096:300:75::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19 via Frontend
 Transport; Tue, 23 Jul 2024 09:24:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 09:24:31
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v11 20/27] ARM: dts: aspeed: yosemite4: support medusa board adc sensors
Date: Tue, 23 Jul 2024 17:23:01 +0800
Message-Id: <20240723092310.3565410-21-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|SEZPR04MB6825:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4fefe3e4-6e5e-49de-6bd8-08dcaaf94270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?zAl3FXKn4sBd7DG+DDKhGxv9V1KyFztINsh0NWsUZIK+L98MYiFFGhF/iRxq?=
 =?us-ascii?Q?Jg41X9b8TRj/y/0pjP+HdD5YB/U4G/Fx2DlNw6KOP59eZLfDI25qhdsozXA8?=
 =?us-ascii?Q?+9pMnKoJTqb+/kiw+OWmC+F0Gt1TCiQivn7brlUXtKS8IKYueZiyglfTo9iM?=
 =?us-ascii?Q?rZ9DT564PTV9rn6wDFSFXJ44VC4TT/ypcH3nbq9j39nXCWO+D2yc/8Zq/6Me?=
 =?us-ascii?Q?gDha2G58pkOE6wJzIcqkI/dZa7BVzncl4RZuX+Yg3b6bxEk5zUamL87gl5hO?=
 =?us-ascii?Q?r7rqioXX3WKix4i2bZCzl8iEWMwV9XYUTM0CytqG9Xdl37dk5waQxTCeEuA7?=
 =?us-ascii?Q?VWVMo/6yhLQq2a6RWzQD0Ad/KZ/c3uyJ8oHFK0kvEHBPfoGH9lxAxgRxajVX?=
 =?us-ascii?Q?8LHVgEQfyOCRh1XQeIUhY2SjJInNuGzZCWu5jrLze0rjotN3/n2HA1Dsw1WM?=
 =?us-ascii?Q?TJYbcAWC2OnSXyr3MsxQdQz3EclnzzLdSkcDqxWisbLWeveI67KQAZv8C/Kq?=
 =?us-ascii?Q?RTTUWJckdf45h+O2ox1oAIXS+qmTd8acGBqTp54WA5R7VpTvkPyFkAQvEHI7?=
 =?us-ascii?Q?vbpzOUEIYWxDqY/FwQXdRmLQgulrxQGBSeMAh/ZTPwuMHAuPVDvkwwln+nEk?=
 =?us-ascii?Q?ZeoySsSy+wGmYvb0wveKk9E2svkNTD48ZGdH31igMH3ThMxuQv5R7+o10QQ8?=
 =?us-ascii?Q?skOjQNXEbW8NEGAxwaYisM0w6gmo9vZLGK6T8s9wEvexKFINyexqqTaeev33?=
 =?us-ascii?Q?vph5usO05yyrMrIvX14oE6QAF0XWS0Me78DUjuj/oihyRfLquE7DdkNmwVPl?=
 =?us-ascii?Q?TjxxVI4DVi5VW4frxVGBOBlA5d3+gnrUZJJ8i3sjr5+AzBCF10aysm95TUfi?=
 =?us-ascii?Q?5Fin2c9SAfn/ed2e/pDVbi21i6Fa+INpTGa9S7XZlmEkT/99Y511x1rWUGVy?=
 =?us-ascii?Q?jyx2PO0DeYq6Q98DjqOqSvjMgcqrKQXiqlj/6xIdslzroAtanqfcZk159L6a?=
 =?us-ascii?Q?ELR6dVa559mhWKwzwpFgZk1mzHt91ziSJJYGogwO1ysn+x5tWJ2O1Dr8Q5jc?=
 =?us-ascii?Q?12p8UcgH9su7zkAoZk1+aHjTY0nifUnH9otAN8FVccidyrV63PKFNHRKG6mV?=
 =?us-ascii?Q?pc4vkI9f/jVgWtdWddy7luE1dvvyP+GBM/m9YdzsLmVyjpHzMbCa4/pNrzI4?=
 =?us-ascii?Q?aZDagw6czn9fPcDJo8NA2u/p2OOsMbHXi40WmtT6wk4i6n6CreiWJJyNBlG7?=
 =?us-ascii?Q?dYPtobTk6/W41XQGIMO4TnFhIeXSsaJMN9BcFtpgZy0+aZRCDjT6ua6K3Z3r?=
 =?us-ascii?Q?UC7oxlQJW7/Dx3vbQiLy0HITY3CFS0jclAIXYV51KN59wVQGYpVm5N3+cdwj?=
 =?us-ascii?Q?Yg/yJpbFC57xtEt5qsFUtie93AVeBqRewiD3iI4eyPPFxckoqSUiCurEZNKg?=
 =?us-ascii?Q?k5DyxECmXlxHM6FynjCw+jmN3KJuLyf0?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 09:24:31.5822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fefe3e4-6e5e-49de-6bd8-08dcaaf94270
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6825
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

Add ina233/ina28 support for medusa board adc sensors

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 98eeee49b082..49500db53a13 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -915,6 +915,19 @@ power-sensor@40 {
 		reg = <0x40>;
 	};
 
+	power-sensor@41 {
+			compatible = "ti,ina233";
+			resistor-calibration = /bits/ 16 <0x0a00>;
+			current-lsb= /bits/ 16 <0x0001>;
+			reg = <0x41>;
+	};
+
+	power-sensor@44 {
+			compatible = "ti,ina238";
+			shunt-resistor = <1000>;
+			reg = <0x44>;
+	};
+
 	temperature-sensor@48 {
 		compatible = "ti,tmp75";
 		reg = <0x48>;
-- 
2.25.1

