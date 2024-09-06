Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DAE96EA48
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 08:28:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0RBG1f8Qz3c66
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 16:28:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::615" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725604100;
	cv=pass; b=jNBAEzJ2F2iEfCvYanErtw0mIyR4N+FGMIRRkD6vLfYl69TrcEpmM6pqvRsC8vP4Ow0wlVdS45mHteA+o2/I95zfhy8WkwScLFXWqUDB18/g4tWXYv7c2X0UylYGVTKD/Qitj2Pbl/EOQfMJ2pUxQ96Op+JW66Zo4Dp51W0+br9XSj4EczoxpODl22/HuMc3R6DgLP+d/T0vG2nFeJsAx54BJkwxlZ14JUI7jx9UhPZqyEkSgm0ijKiixX7bWzb/FIkBqe1zVtlT2GlkUqXL5p/c1g2geDgjnaxIcOFuQ40sOXhwBBu4MtHgiWuowKcp5oyhJWo5Z5o1h8CjjR4MYg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725604100; c=relaxed/relaxed;
	bh=BZanMQdXX7mf9CZbizY6qTm7CHfPB7I8RHeI6+dlIZ4=;
	h=ARC-Authentication-Results:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:Content-Type; b=hwgjt+HXIOuxkL0Ps95kqb9ANI84LQ9OQc4DTL7LGwd/ZmnSiWUPExc8g3cpL5ktGsNr1x+BRIfFmEDpZG+Xl9UA+V7bSp6YczXE09BemiSn3skTSznorDRRwV1qdR789rUO2863UnWUgAHqOd/0v/Ep6U0mdxfU0ZgjH0XbD12PuOuFPBgCBqhMZZe8daxpI8cl4KfO5rhuIrxvmZ9G8u/irtzSeHWR8CyRZrq44ZnY6zFjz8nNcTQ3ha9B2OcIT/2NGO2+DSVb89UH9gmBEoPBNTkSxnI8k4Do9aTLmu1WCY6YW01YWYqxYSCv516fUl/I9RvA3mMABVp14slzkw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=qCxQcPVu; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::615; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=qCxQcPVu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::615; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20615.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0RBD1mF4z304H
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2024 16:28:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZS0Si9xsFhRzxL4nPlvXHzhdsWWrK4fBsTCuxH3gzEKyUwEx/cnQmcgmbh47iCMkR8R0r/QsixjSIzhhvGbkbiBLEV0pfRXscsa2iubGfCoNwrU1XMGWAOPwMi00OafxyIiXrG1SFnbvLjBx8EhoUCIvutA7Mz/Ct3NNEt19iZfJ3ONKGYTypDVWKTjRBVJ6L1alNe3lRLOkSsOUQmUr+3/aoO4u0hs7AJgQPHO0++iBEI713Tr8Rbsz1BdVy2Sl7p2/WvOxzZPYXBLuA1mF80DtV/MEgTqk8vfAvnpCjMZD2oryydbkCMtZb+QD/fw4AN8KWCWz2ti7GOFmjZ25w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZanMQdXX7mf9CZbizY6qTm7CHfPB7I8RHeI6+dlIZ4=;
 b=m4e8VPxCDA4mteG91vDFxB5RQfOsQKu5uoTyNxVCciApBXGerijSqKUa2vHy8Z2tnEsGwi9Yc3g8R+tXu+4NbcmQDxptdEfzfedWWgCV5oYXPO60RTY6PYPpL2lF4+xBZ6GVRxl12JyxTqsxIJ+ZxUJfoNl2q9Q1zZotW/L4X54dNzpGyEMnBS5pNA5dJRzUiaeHzwGnS6jphRdXl/vrwmsi83F4smTWGZUP7M1k201C4NpBday37VTNXoP1I2J3JKJUjLW9FjB8ZsTXBu2wvLOULOG4Y0XEusqt4hejH9r6Cj5Lu5WEmsmB4VSmQmQQYVfW0IgwI0Grl5Go1i4SMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZanMQdXX7mf9CZbizY6qTm7CHfPB7I8RHeI6+dlIZ4=;
 b=qCxQcPVu+c8xv+TCE8sy9j42yDpzZv1pIp20M/NQUHOkLCiL7qd0ohXMP1WMQwKzxvCUl40LILgUO6eLu0W7upgJUH5WO/jj2+2g96+ud4vYpj5EXinh10HZgC3ILz4xueJngU8rMVaVsTY5dSptVD4hfJTlQ6j/Qvwj0fgxvs3kPhWVWvQ3XVWOnGY9Qu8KwidluId7OEFjPEAJUhrCrJVMbvDwgIRfF7mUh6KhnTBdo/KGpmnktnBy3S7wIv2H5CC7VeeSjTt5OtIiB7CJBC5Yq6q7k0vrXJiKqRwXs4vLU+8HIu40sqnzGQ1AmKIrAA+vaXk+bqSOG24Y8E/0aQ==
Received: from PU1PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::25) by TYZPR04MB7357.apcprd04.prod.outlook.com
 (2603:1096:405:1f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 06:27:59 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::88) by PU1PR01CA0013.outlook.office365.com
 (2603:1096:803:15::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:27:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:27:58
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v15 13/32] ARM: dts: aspeed: yosemite4: Revise adc128d818 adc mode for yosemite4 schematic change
Date: Fri,  6 Sep 2024 14:26:39 +0800
Message-Id: <20240906062701.37088-14-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|TYZPR04MB7357:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a8ea0af8-c0b5-482c-f44e-08dcce3d0d59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|7416014|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?YkQPfRKJHnVwBjlDiDZkHwV/bT+Q3zx9JBiQzspz5og7l25gSi4g4dp78wr+?=
 =?us-ascii?Q?YPylD2FkK+pbLE23IqXn5mCkVvfgrAfSIsZEemE8N431bLZHD04N/pWWCdZM?=
 =?us-ascii?Q?w3i2BLHSe/25doy/f4bwLJq12TgWwJUo3Nod6qsMsRjmJUi3s2i4MzvUuk7c?=
 =?us-ascii?Q?Fbmw3lLfrmKIvp+FCJSqd/Ix4YZRaiNHb+Y7o5L+HptHcxQ3z7mm/IEF/6IN?=
 =?us-ascii?Q?vdFOhhqXPHrjPxUmGZlEBJdl/vk2BdIUVSB8fxi9jDoSBY5wteIYNSkiEuAq?=
 =?us-ascii?Q?iNkm7F+RkPg5DpkYTZdXfx04Xfh0GqPyl7wNX++rihs5ozsPDd+oW2BKuuXe?=
 =?us-ascii?Q?J1yQ3zYqbCEzhMteGFXM41PEuaGmBHwAen92i5nD7zreDFQ52mKYM1p00jFU?=
 =?us-ascii?Q?ckCkFuQV/NKJn92PZ0deZBQ63tEVqfz7U27vSBi+N3V7G7RiNYXqFY+eirlq?=
 =?us-ascii?Q?Z+cfW6yTU0AFJmaQ5c8jmFKuhKe4J48CppOeQzHbcKiv0Zy04BTiBS350C/+?=
 =?us-ascii?Q?0qBF1q7I3GJamNrN+oHTejTsUGCjcE6Mvr4tMdB7lckSFQ7rbyqFKb7BG/+H?=
 =?us-ascii?Q?gzxVjM5nSbvHn4jrv2JdFbVfIpFyesR+gezPrs6KkWFuTM/SsE5yPP3Hu2CX?=
 =?us-ascii?Q?opQSr17FURCLyiycYpBmcW4pUuxOIlCY3B8hf3ABPx0KSNBIWspXvg9lRw6Z?=
 =?us-ascii?Q?+ZmnxfKNRVvxJkpQp3mqujxULCrYe6v6nj7uM9Hw4Wymeze/NJnAgV2/r15P?=
 =?us-ascii?Q?wiJLfk2vp8SeTv4MmEr5T0K2Wr1OIhRPpSXq0W+ROi9Zqa70N+L5KK9CpWTd?=
 =?us-ascii?Q?BiRCb4vZL4/jODq6QAjVYnaErIEs+gV0F0L4EsAUXYWHEIkZSeZcCZLEdjlU?=
 =?us-ascii?Q?i7AtsAJU5KG55+ePDat/BNKAoWh0+d4DSyKM8RtxKThCnL5S/8bQoVQ2nL60?=
 =?us-ascii?Q?q2K1hLK91GlWg2atDS3QML924kFjF/tUzux2YlfB0CqwByVk2PmgJzr3Dzfw?=
 =?us-ascii?Q?h5uWFCGwbKY4337F8ArMx4x2WsTFToIayPr+B0VICbtLAXwv+8Rk694J601N?=
 =?us-ascii?Q?8zW2C45Kf0WZOtZ5ES0yF5aJBJUG8ozWumh6vHbDJBU4zFZRmaPCmGT0/zB+?=
 =?us-ascii?Q?8ZgucVWNXyFAU7wow7Nt6Htnd3YqYSI/tg/ZXlVQEhUHAkl7O/pSaoY4x7x4?=
 =?us-ascii?Q?lEjMMATEu1liLdgn0G9/co8jdEh1WSwi2rjwzAwCSvSjOwQ0bMGkHqsnwm6C?=
 =?us-ascii?Q?x+nq5LwRUvlAAaYoXul1Oeho03kwuYt2O7hLlVCU9FOo3h73aPsonyn7h9fz?=
 =?us-ascii?Q?KABUo2enZwcP/Ad16e+KoFdJpGZgAhpwzE9D0efhdvJwRcacWCR2e1oiBEEE?=
 =?us-ascii?Q?oknlacc8CZmjuKCbfem2NJ+IQ3+dfblu+8nKNMa4SM+5UxLZJ6wvhK3Sw9cT?=
 =?us-ascii?Q?tXi53fm0qQ6AufcpFNMM2PJJC0xngT5q?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:27:58.9437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ea0af8-c0b5-482c-f44e-08dcce3d0d59
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7357
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-aspeed@lists.ozlabs.org, Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Revise adc128d818 adc mode for yosemite4 schematic change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 2c0c37b3ee5b..1765a0bb70d7 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1018,19 +1018,19 @@ &i2c14 {
 	adc@1d {
 		compatible = "ti,adc128d818";
 		reg = <0x1d>;
-		ti,mode = /bits/ 8 <2>;
+		ti,mode = /bits/ 8 <1>;
 	};
 
-	adc@35 {
+	adc@36 {
 		compatible = "ti,adc128d818";
-		reg = <0x35>;
-		ti,mode = /bits/ 8 <2>;
+		reg = <0x36>;
+		ti,mode = /bits/ 8 <1>;
 	};
 
 	adc@37 {
 		compatible = "ti,adc128d818";
 		reg = <0x37>;
-		ti,mode = /bits/ 8 <2>;
+		ti,mode = /bits/ 8 <1>;
 	};
 
 	power-sensor@40 {
-- 
2.25.1

