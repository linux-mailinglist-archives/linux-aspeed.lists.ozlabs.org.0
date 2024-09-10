Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEBD9728FE
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 07:48:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2t6M13wbz2ywh
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 15:48:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725947304;
	cv=pass; b=SEQeooPK+XSv53Aqv+p0lDWST9nufrHF6gPMWKyifwNUYZmM+Ip3h3Tr76zu04SsuRIBBAjOWRQtPR0+Dga6AYM5Zeafvhbg5kZ0QwPtrHPUlnLw/Eax6EgMC07SMQEX/OxrOczvdMFrSnVjJfsIfP3MGE6TMeMC43Or3EBzZN6cLYbOCY2gT1i3BPT6JzmLyOv+dUaYd6Xo+WpY4hZAt0CwVMaVRrRCSyEaupxdmFCt0R6rBV504zwL1XKc20pOknhjzxORuxvP3bAdgfCHsax+liZUD5W9vNFTbgbW54WK+6RmbhmGsMomF09YvmIIOAWOne9kt0MCtUrIhdps1g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725947304; c=relaxed/relaxed;
	bh=8/XIy7eVuZj3SBMDgfGePU0xugPwcgrgy3mDvSWNc+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b6IpEyBef+JWpi2OVSXWtTaL+hbYSbjFdVZj+7lgZMfjSQLVcnSjeE8yW+tJXliM6ciDYmJIeO1B9kbV8pd2MFnEek7bReWugCAWZtCMJVMum6ivrGtIvnLcQ4kBimELVxFUFT6Vpb2B4fi+70sRQMI5aOigaCI8BSSmpRH/sqE3CPY4nhP/31LauPhvmKuXIlxu3pM7FXzw7V+CIJ/bKw0jS0tEURzkLTarmlXanAcOOjcRYnQLNSAYb2/SEmb6PWd9V7fVMhQ7AAAp+qXO+ot7FqDOspDwNrYBZbjcaJ2kpZBhnLrJ52Q+kjkOTm6w0GMnMDgvICF6cj4jrLydpg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=CN1I/H4W; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=CN1I/H4W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2t6J3pcCz2yL0
	for <linux-aspeed@lists.ozlabs.org>; Tue, 10 Sep 2024 15:48:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLZDecJU/8PFrTYV8I6rRaKS2MB06Z7u3yElNxK07As+Jp87vuCbA9kjqJCuolh/J24MMvWNkJGYdd5ZHwJbtyf1cdM1YNDdB6/GIHFD14u8kwBTDxBbqV+i0YAVruch/2YyoS8lUKua5Tn2CYlFgHh8llwa8wIsx1dSW75cS7vGelobIALsWEoO3zHnMPRyyY1AWF00QnNDzx8LSOoYBTEXPTbQFMBHa+knpNBCCn/gKWxYpqUXy//iRFOuuLTIPLD4YM6B4oYKlYY9KR7xzoNaGSDD1U98KhpV5yLy4hpO9WoDS/dTDmVBqz1VJ6ig8XCoq1mP0NU+58zQ5X/A8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/XIy7eVuZj3SBMDgfGePU0xugPwcgrgy3mDvSWNc+Y=;
 b=AgT54oemzdE/eGpUtH54NP7C0X2o12P3nkOs/Jbbyn0KtQuk6h3yOmVnAf1bBJOvJAkdn9kGw6V0kDXE9TzOAB99ft9EyvrIZ2ewb8l89mzFgvKldourVwTeyElBbr1pdERkcWKO1qgrh3wEOQwoT/5bwmq6ytA0NAOXSHvUJLXq+QU7TCN3BUGD9VJMiu6jjEUXmmGRUhMN2zvNPoKQmIcyMi2bo/0wGLaPK3j+butaiLpAEoYglgUnimGuwX+pusAB3j7EpWge3EXHsc6cUE81e5NSHztUfSY2MBFChIcqkjEYNahUx9rp0G0eae3DVzypfvRkg+QaqbDqzROjnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/XIy7eVuZj3SBMDgfGePU0xugPwcgrgy3mDvSWNc+Y=;
 b=CN1I/H4Ws+ugbJj97VQSXKEUyNQUFkYH374wc1zdA/STLbrKQaKtgAfubPeMU/cNTYJkCGZKmCrwJtcoh/vlB6bKu1cNPUFZWj8bR+TpEjFjzO8U7bliYHa+VzS2fD8BxJyUaes7KkY0FinJLnJumP/swFZrWI4zoQQbpMlrspoh1wSG7CHCkFkBFLsZUx6mmQlIJnWWCJ5/aSN/TS8PZOhMDr1q9dKRORdWLXM22LeorDjMiDH+hzeOTvas4RjpTv3zVEPKYR+SCTu+3Xgb6IUscoRb3EKqY2bXPYanB5UXAjkourAblY7pLi4I/ROC+f0J7nfC2HGMOtcj4zl42A==
Received: from SG2PR02CA0130.apcprd02.prod.outlook.com (2603:1096:4:188::8) by
 TYZPR04MB7179.apcprd04.prod.outlook.com (2603:1096:400:451::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 10 Sep
 2024 05:47:59 +0000
Received: from SG1PEPF000082E5.apcprd02.prod.outlook.com
 (2603:1096:4:188:cafe::97) by SG2PR02CA0130.outlook.office365.com
 (2603:1096:4:188::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Tue, 10 Sep 2024 05:47:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E5.mail.protection.outlook.com (10.167.240.8) with Microsoft
 SMTP Server id 15.20.7918.13 via Frontend Transport; Tue, 10 Sep 2024
 05:47:58 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v1 1/2] ARM: dts: aspeed: yosemite4: Revise to use adm1281 on Medusa board
Date: Tue, 10 Sep 2024 13:47:50 +0800
Message-Id: <20240910054751.2943217-2-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240910054751.2943217-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240910054751.2943217-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E5:EE_|TYZPR04MB7179:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1c6583dd-d057-49fc-a905-08dcd15c2050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?hGU/yN3V28y83Mrn8EmvvrsCCMgod9GDE4M7PbK5q+j/RQbPbnwvJnjjbS1M?=
 =?us-ascii?Q?rVDoVMQMZHkbFCuY3U+4ZACc/HdOG9EUcD6MUHC0QyGD88P9kQYO7aeZ5gSp?=
 =?us-ascii?Q?V/MOIH0bPNimDXnRwREJF/RSOcUc4r0bCIxz7r2dNJ6WhWV9fmvHXWG+iKbq?=
 =?us-ascii?Q?rjwHE984kOt2gGFMnKS8qN1vqEee11CRRzmZb5fslXWZg3lHntJkWt139uom?=
 =?us-ascii?Q?BMDL/zKxm9cZjR3fu17URgwDdJpGaF33zIwX6YGuePvm+YUmOK9XKnHWQfmV?=
 =?us-ascii?Q?RoS7BRNDz8nMKLkboWCegH9B8nBd4FT8aDn3kvlPhO6jC33au57GQ53Y9vwe?=
 =?us-ascii?Q?PxnnJJE9nGFD1XigAJtL16aX+KD2Wsh7dGdicYCCJ3yfWwNa+FCFvXClPByd?=
 =?us-ascii?Q?mw/qgXGIq1GF3rt7Aoy9lYXaWC45BK9TzZvzv087ElfsbN/3/D7E+wPgAKk/?=
 =?us-ascii?Q?G+Btoi6eAgtaz9pR0fwSUoN6d4eHAx8ThZKvO+M3vorCMnWJQptOiQ+KUku0?=
 =?us-ascii?Q?+906pHbQA0BNvYrhk3h4zUf7SescjLQSXrGjyd7i6snstyS5686AslypduLB?=
 =?us-ascii?Q?VnbyoLzsWNYbvzVV1G4t9A7/l8kEjvohAGzM3xq2V1hXt/RlirxP8vmTArXL?=
 =?us-ascii?Q?MjTDNTZ4ZSJt/FswoonVmA7JC3mPLvRu0vO3RC9V3fbrBOzwtQjyGPhYlJI9?=
 =?us-ascii?Q?TQsQsjERDY0Nfl05avESNeHxvmpOYmnOY3VYGpL2PsuwKmJQN0UkNOFd10Hh?=
 =?us-ascii?Q?gVOgvhfszST5BaZzVwKnfkEsledbAtOoZfm7+nAkgV+zMGS1QxpbwmrcqJZh?=
 =?us-ascii?Q?3T5p1375/4aiNOth/omwUoapMw8jHM6Mt3GJOha997HeXR5cBqAy4rgI/7N7?=
 =?us-ascii?Q?ujYvseEdm86BHHda1Nxz7PyzoMPpGStxi8fUXqrAzTx99gPzEktJ8yok8brw?=
 =?us-ascii?Q?v/Qcn7zAXzajXQ2pxx653cu91hj7fKl7xxPtjJ/oaa9Y4ltRiskAp8bduTre?=
 =?us-ascii?Q?YhssBnADO2l991QtVBASAghp/sEpGzG5xhb41ssitImVS1emIqYB2LMHUMAV?=
 =?us-ascii?Q?Y4mAYc3pqHaaZYEmeABIbpyERUiYryVvqy+oAmrU82ocx0yjDK+NPMcMcarr?=
 =?us-ascii?Q?qXdlIgIn+e+ybEpzzqmp5n85+lxf5vLpyQTwPR+HtwQGV6KhdEoq68Vh29Qp?=
 =?us-ascii?Q?+8mcM+8+y3+OhSO0C/fIeyD27nJ4EAQGRRglHpFZ0nSrKyffHIKMvhNLJA8N?=
 =?us-ascii?Q?+B6wgU92Ci2K0iuY2wec5wqu1wKsz3XMVCcRZcWYL2S2QVEjKDNVci35d3+V?=
 =?us-ascii?Q?voappWNn/87eYO5KNa4/EkeQguyWUiYg6SUQ1SgwEAEX9OJhRkWaXY9ih30N?=
 =?us-ascii?Q?2URodwLnt/jhluV9kJyp1sOvfxFxkqcT++4gW4T85Cdnn2PAiaQFBM99SlvR?=
 =?us-ascii?Q?P5tdXUYb1sOLeYqt5l8NwJEnftCJX2iu?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 05:47:58.1933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6583dd-d057-49fc-a905-08dcd15c2050
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7179
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

Revise to use adm1281 for HSC according to the hardware design change.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 98477792aa00..08d32e42286e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -130,8 +130,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -147,8 +148,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -164,8 +166,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -181,8 +184,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -198,8 +202,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -215,8 +220,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -232,8 +238,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -249,8 +256,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
-- 
2.25.1

