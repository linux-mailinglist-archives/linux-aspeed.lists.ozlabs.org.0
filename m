Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C4A96EA3D
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 08:28:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0R9t1Xr8z3c7q
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 16:28:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::60b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725604079;
	cv=pass; b=oZRcnqRV7PQRNXssbRZwuWRM7rRC33BqcMd9Cb9i4L0h1z8mtXug6gQ45PI9HPlYq/EVrcU/GDOffxGSxLVrDnfD5TFM+057yIgsQO2vTicepYyyAiKisxlFmq/E9YCdD2YmR/tzFQwHKbStjReaJHfd2U2YKH+E9AnyUcF03z6URhG35rXFdfuf3AGr6J4Djcf5u7ZZThJwBhKqW6uso1pDGjMxePiUvbfpyS+9HZFaaGLGT158RjIL1h/VYUIdrTbBo1RYxq6DcI2XS8R0C5/T4nb7/CLd6urFtb8MHN+brdMVx8xoRi26zNLiGNPOD4Tvsc3IngeWs4lv8LEcwg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725604079; c=relaxed/relaxed;
	bh=VIYwTFLr7k3/66Qq65omckRUKm3v7IIjsRhJzbIKUfk=;
	h=ARC-Authentication-Results:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:Content-Type; b=HKDwmRjvGrkrT/7ZvGQ3rIPelbCV2MJMXA7/9KFYaZ457KxaCZaDHCS3fUjDegox6lB9QAI+VDP75VbaGduwYstZe/0zu03jRYCxcGp1/frDKriY5+wfk06NVAD76tcAGMNowpIZoOlDVXwwrDziUvsHLAhU84YWr/gnP1T91CFAnXdekiq65+J474tG/czSVjopnQli2qFphLcEGtz7IjHchPbWjtYw3ySn9yA9aerLnbzdxP8mfxWW4Rx0O1AKNjFTWLQ2MbI98byjnTlCkjmLq8Faogga6s6UfPni0nqeiBGJ7XkU3Z8Us5VRcMPBoOfoQtaVcoaL/5QbXNmU7w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=GkDjWj8i; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::60b; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=GkDjWj8i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::60b; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0R9q0pbWz2xvF
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2024 16:27:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EyZrCisxjZ5rAtfcPkVjZm9yFZLw2Kb2llJgB73qOdFNHXS8Gz+Qt8Acnj8tn8ThpNhRp8uJiv3lVcc8byI9ueW50EBQm5lphEJ0fIIhD4V2od947kXB75H78JKdGYWgoOcg22BwTRfBScXwfYQ4fQV18Wi7reHZDH1b4IgNJSRZtHMQ+fbPjYWS1Ne21ENLj10o4QXaL64bZJXTEIHxyUGtLj5bQZv5eAkw5f0j7KGmQvWHHODlSIa6Nz9dMYnaGxCztyDql4F5cI1SzIc1suKAnmihe6tbth9hoJlIHlHimkoTaDtk5U3OgfZs/ymxrgivr/7bXMqhVI351VbyPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIYwTFLr7k3/66Qq65omckRUKm3v7IIjsRhJzbIKUfk=;
 b=bxAfpFHab28zA8jEMWENJQdytXMqRBGJ5oTCmvDg/JkZF+mrQmgaXVCLEq+PZ1QhiIElmuZoS+uIBhTMbTVt1zsXHAtPMxjARnEtdU5FPuIaYgktVPNsQp2BsyFwFYtdWjG0KbYQkIoSbkHCFtGjGOtwUC/0WzyoIdQKaPccVa4tddbV3c/hPCT3fEJ2eZUB7LJthMjAc3Y6emcZ+yqHEYaoz6Yh69bo+h25BAI8UtI7j0NmyztaMTbq/xqKdovc6DMhp/Q7jIDPZp8rdCopfYrZCsU3r/nPcCzNBrR33eW1t1bp1kJ2CWUAEHV8M0vmLrUy01jBfQSZF6bg493nwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIYwTFLr7k3/66Qq65omckRUKm3v7IIjsRhJzbIKUfk=;
 b=GkDjWj8ifDYOGcOVxRK4ZIqBIQ4oIK/YLhABfjACvo8Z0OiagVOYkbhqudG2bF+9fSzc0vYlOLdOvjd7kwkJq8pHwMHm53R/CbTgejxNp+EGqXNLnbCv7ATQ++4iTat8mIJEK4GIZjj6mI6XqQBUjCAj6B10GvZB7HDq/ulKfGVf2nCthybCATxAJnBuXzBcP65e80CXOUdS+OnEjnCYy5tM67aqm0/olZ19cnYtyVkC82kCW6m+KwS1seODF3oSSxtOeGb3fSTs5/9PBBNUDfWk0NI46yQoyjPTk7WnERrFWIs3uYfzLOUodBQKTZ3Gx0EQzxo3UopTHgLlSbj57w==
Received: from PU1PR01CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::27) by SEZPR04MB7354.apcprd04.prod.outlook.com
 (2603:1096:101:18d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 06:27:35 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::3a) by PU1PR01CA0015.outlook.office365.com
 (2603:1096:803:15::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:27:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:27:34
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v15 07/32] ARM: dts: aspeed: yosemite4: Add gpio pca9506
Date: Fri,  6 Sep 2024 14:26:33 +0800
Message-Id: <20240906062701.37088-8-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|SEZPR04MB7354:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 602128d4-70e6-47dc-2c21-08dcce3cfedc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|376014|1800799024|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?J8ibXEedvZ6wzzd03iRWhJvdLIl2DsuQlQc8oQalgDi3V05QN76pOOlEnj41?=
 =?us-ascii?Q?RBkZMmVk2O3kZ3UEXZFKahhzHSGbMn6I/Dx4MfUzq1HlPW9oQ6uIW7zQy1by?=
 =?us-ascii?Q?1O79662It4epahBMLMcfo2ov5tf0Czwi+GmTTdh0eVB/JP3cVn7ynkEKHD+S?=
 =?us-ascii?Q?gHNWQv4zkMMR3YKk9XT/O8pnQpf4JErWjI5RW//IrvfVnKQddzk9/um1enaU?=
 =?us-ascii?Q?nAsiYD1YWd95FVJfCYgTfSWNymmMQocOhuItadwVIfWSuFufGOLMbNFcJeNP?=
 =?us-ascii?Q?UhmQvMpRvRLSaxoYzwNgtqGWzLy8/kkCDV44nzym4lE6j2eiFMZc0OOEGw21?=
 =?us-ascii?Q?NRWV74Vv/a06oxVCmUXc1ClHUTUUsPriJ9W113/mdukmhBpaSSTM9DwKAzpb?=
 =?us-ascii?Q?OTtLhvd8XuRfXmYwzHQucVFO7tntmxjJo6tKcYaHM4GPZRDkfhcQev+IxlSG?=
 =?us-ascii?Q?x1/gT4IcJB2ylI37dVWr5f5lsNeNuPF/Rh5PleWMY71CccCCinVwRye0EdH2?=
 =?us-ascii?Q?psLL3Iqu7frGE6BODK5xzUMPW3V3MrNVgc7FHg2RUKx5QV3sywgCT/BBvX21?=
 =?us-ascii?Q?OhB6/rZDPH62mCCbQ9B+XyM5zeAv9rUWOuhuNe4SWOzCUI0/NDgeBAVxauGG?=
 =?us-ascii?Q?N4F+v7E79k3MSpHovwnUEv8YLzC+gK3mwomlz/95VdQrLCjbWaLzoAi5Wi9T?=
 =?us-ascii?Q?5O6TF8zzgm2FRmqMe+UdbG4uq3QF/0t9LXpEgxyemR/71eYT3vDHNa9adZCZ?=
 =?us-ascii?Q?lojkTGPjdRmKnpmNbhKxv8uMUEhPuEAWm5ITxmlFKefYhIuLiVK/5WKTvfOa?=
 =?us-ascii?Q?NF1azuoLAlJBpQ+YGN6K8Gc280nRrCwvfsEjq8TGa4kdhYwxERfShMXNUVG4?=
 =?us-ascii?Q?nbVhU9WRdUMGpwnwVackgppHj5MgbyQwtjPy0gIISWQT8ECc/Of7p7pVqR3H?=
 =?us-ascii?Q?g+/PMiiCPFNBIE6jBIslLICq9MwNpIRzkdBOfI0j0mxBWBeUri5BkV37/Qb+?=
 =?us-ascii?Q?75pGfMQ9gHuAQDB7Jm0bqu07NIcseNk7bNantjfuWJ3WOXrMjRGJoS/kfJbX?=
 =?us-ascii?Q?kwGa1/1+Jl+ymvky8gbLiQV2HhtYm+7skQjhqPE6dWlHTt9pg69aAzloNgbU?=
 =?us-ascii?Q?jWLMQ+O9ThHzdL/4TDEgpEm2pE3f/FixqDpW1W1djGbj53qsk3RsPu2vcyxx?=
 =?us-ascii?Q?j3ki1tif7XVlQlwSx2Wsxvyj2iyg5XIxhgBjUqTUZAbuaKmlQpPVbSjY9gXj?=
 =?us-ascii?Q?GNwmbdIiAeCVJUuCAjMT/ZoRSliMvPP/zRqtJaaBPPjPkUUrhjmbKu5Qvu1C?=
 =?us-ascii?Q?D8vvNhjy05JFDIbG1y6ADtm49DXRXyFLacLqdEC1SJx5DXe8Dq/B4Y7vfoOY?=
 =?us-ascii?Q?rFqYtd+AP8caGhgXaXlMJYpSSC9TGybSlFth7YbA1/8cG7/zIYdWx2sbBGPY?=
 =?us-ascii?Q?LMPLDvKWWLDrXGSlFGZ0T+32b+UOosQY?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:27:34.5844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 602128d4-70e6-47dc-2c21-08dcce3cfedc
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7354
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

Add gpio pca9506 I/O expander for yv4 use

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 252 ++++++++++++++++++
 1 file changed, 252 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 7b79fcd77c8c..f4d27f1ffdb8 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -175,6 +175,34 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@24 {
+		compatible = "nxp,pca9506";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	power-sensor@40 {
 		compatible = "adi,adm1281";
 		reg = <0x40>;
@@ -193,6 +221,34 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@24 {
+		compatible = "nxp,pca9506";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	power-sensor@40 {
 		compatible = "adi,adm1281";
 		reg = <0x40>;
@@ -211,6 +267,34 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@24 {
+		compatible = "nxp,pca9506";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	power-sensor@40 {
 		compatible = "adi,adm1281";
 		reg = <0x40>;
@@ -229,6 +313,34 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@24 {
+		compatible = "nxp,pca9506";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	power-sensor@40 {
 		compatible = "adi,adm1281";
 		reg = <0x40>;
@@ -247,6 +359,34 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@24 {
+		compatible = "nxp,pca9506";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	power-sensor@40 {
 		compatible = "adi,adm1281";
 		reg = <0x40>;
@@ -265,6 +405,34 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@24 {
+		compatible = "nxp,pca9506";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	power-sensor@40 {
 		compatible = "adi,adm1281";
 		reg = <0x40>;
@@ -283,6 +451,34 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@24 {
+		compatible = "nxp,pca9506";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	power-sensor@40 {
 		compatible = "adi,adm1281";
 		reg = <0x40>;
@@ -301,6 +497,34 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@24 {
+		compatible = "nxp,pca9506";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	power-sensor@40 {
 		compatible = "adi,adm1281";
 		reg = <0x40>;
@@ -690,6 +914,34 @@ ipmb@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 		i2c-protocol;
 	};
+
+	gpio@20 {
+		compatible = "nxp,pca9506";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
 };
 
 &i2c14 {
-- 
2.25.1

