Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9940696EA56
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 08:29:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0RC04TPBz3cMg
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 16:29:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::607" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725604138;
	cv=pass; b=QGy1O0sszfOumMGfc8l8A0+JaIPZ99RNTB7m8CsIlMgriJDIM9KKMelkBEslN3UnFuxLB5rAlOKLNho/njEtmcFIQ+nJJor2sOoNLDM7lQ+4P/k0ODeo9AJqYuo1KQHBLnQF6rdFxQ/ZE2N6lMjTDsqcQJEky8FABRhDix/0BjIjMLScv+NdESPK/Nt6dUGf8JC1DEAD3I+GumgF3OmyAoChZRR9bRWgmNTp+yTOUxbWC+bCkkYVDbV7NH4P0iQ1c8D510L0PgTL2Crbx36lmne2igEPvCUi2YFugKxAEqU2IAayga2Sw4m+DjuDEbgzgKX1IsB+1Fd3MJh2/3fG9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725604138; c=relaxed/relaxed;
	bh=SQFQ2bKjxnUV6R0l0iLzwvLwa8mKW3x6TIVY3QTprt8=;
	h=ARC-Authentication-Results:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:Content-Type; b=IQDmv4P2qi+iQiCmat+Pzr8yS9UWWcsiKGeXSWtVUk6m+erUy3eQ/AvgOp2e41kgvc5wkDBmKHJjCpLTaCvmtj0qqmF49/LQFIwH6Pu6SCz4YA2gPct7LzqWbMfTpdIXqC9ov00iZCJh/dfe+ZfBAN1KDn9NE2YWS/G4WZAXCLVUq4pOfd3x83L7Zb2O8lMQJFAZpw0Hihq4q50NK28ObFM0AqYbt5r4fh7TwT8Sdzb3AHJL0AZ91ZIbMoXgP9NeNMV33Ay1acz3LM0YVGmyS+IEPG3nZnvOiNqCIm+cyEHe4h6WRnfptTKPyG1nSkLVXk6uYoFiMsfQ3xLMFKE98w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=p6l082NR; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::607; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=p6l082NR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::607; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20607.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0RBy2by1z3cN4
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2024 16:28:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWoMpZ+wEsrpBcQ3zYj/Vbl12yMvGJhV2epffm/MpCoGbVlQH96EV9MSL9bKb4wdrS6JW8d92C4hZmjM6RyQwM9E4WjkOzczw02IGifm1A48slDl72LJ/zLkTQDUf6Jo2WETxyLP+VgvjRPAJwk4dm1HT/Q15ovvlyvuP50SabVlyRdsyGRJ8+KtijoZHNETNcTDvK11ZP/W0sRVMTnO732x31bMZZ1j+axR/CpqCuK4GLajTLtfypeOw5zEj3y1opbfNxbDyYM2ccdytULcai7G/f7AJpI5QjE0LxBezk+hLcN/4cxgGXnai6UnlaOSu121EMnQ2cV9+M7eduoBuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQFQ2bKjxnUV6R0l0iLzwvLwa8mKW3x6TIVY3QTprt8=;
 b=UIffsHucGi60lBimN2Y2YhFkkK8+86LX+R917IAkdgQC3CNfu++rrGfxVZJZCrKS5vU3ggWFp3NAMKpbMnD6XmCTbYlO8SEAOYgPbnqBJKITY700fBNA4D7RUGUv+cy9gZJqXtqkoZg7MQJsuxYO3CDXn8sD/PKHULPwRHn+4XQzFr6sp3jCzMdvdtiy+Bm3dgwkpOzPPgvGdhG45OxkZLiGf4KeuH6EUAQcpBkBsLXCxXN+ncttIKnp6a/wk8jz3A/RGElXkI1Le50Ihj5uQnpPeOFYziAkNPw2831ewF+U9TTvk+qHc4yEvrY+Ipf9X98yMbHEDOGDf9AREMC87w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQFQ2bKjxnUV6R0l0iLzwvLwa8mKW3x6TIVY3QTprt8=;
 b=p6l082NRI3uv+gJW67CvV5Bhyre7QTpHLm1OGIsbVk9X9Ug0rdD/P5hJy+bvdyHTuBZwWifOrqlVLaWyncR7IgeC7WpCjJHsyXvxP6Tpz4mx0IkqtH9nHDKvhHgz/diargyfPqNYdAQSApxzzyAxlyRCKF1+p8TwH2kMQmKputeUJ451ncpJ7wl9yaIVrjJ/2R/Hnbro5oLOMsRtCJcGgzxc/T2ORiopV6vRBwfnlKSICByrV9C3xBT6oryv/HmSRuRi9jsN9KOWrqjK4nNh8ATflwoXr5UCWhyacaEE5q+xM+0Uxmr+Cli9DldVkOYguGzBmcsq0Hh7BBlp2ZpB+Q==
Received: from PU1PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::14) by OS8PR04MB8356.apcprd04.prod.outlook.com
 (2603:1096:604:2b4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 06:28:38 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::9) by PU1PR01CA0002.outlook.office365.com
 (2603:1096:803:15::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:28:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:28:37
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v15 22/32] ARM: dts: aspeed: yosemite4: Revise i2c duty-cycle
Date: Fri,  6 Sep 2024 14:26:48 +0800
Message-Id: <20240906062701.37088-23-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|OS8PR04MB8356:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6367426b-d031-45a1-6958-08dcce3d2464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?tsaa6ScN06bqjF7XUUMbFf/ikulw+WVqy7o/eQVbDlvZI1g40M3MkFyUCbDK?=
 =?us-ascii?Q?qetvWGPHKGSlEcHaX+TL7ni1HQBE+T3cTrLp8sh5psSILcdkX7FJNQlOPPe3?=
 =?us-ascii?Q?ybgA8D/tszLMj8lTGyyQAMTEwvmb0fq245knLoAoLWZ7gURuCAxwV/WFBhzy?=
 =?us-ascii?Q?JEy+QyZozmBzQye82qXkXj8JFOvE1dUI0t+C3DOmchOToxOGqd27hfMjK0gZ?=
 =?us-ascii?Q?hIWttNgmNrnV9cMIC2n74OtGBpOCO+ridNMu1VJcpfi0vYluwQSduSQiht2B?=
 =?us-ascii?Q?OfkZ3R3oyzMOtsPDnIj3tweEeK9Iby38LwXFUxyRWv+oyeurA+g/qqvIW6dG?=
 =?us-ascii?Q?pmVwL+xBre8Av2jyhFxUe6h3v+4bzXUOWI8b4k4xRKih3UJgHent0wg4aLXn?=
 =?us-ascii?Q?UnitpZKY8srzKqHQ7FCAOtxzwqGPmMQ9faiXGadIUVsFrVbB5dfbHWNRFkmR?=
 =?us-ascii?Q?gh1mC45ULusschbn7W2nJ/HElqG74BcubRY5YWIZ+NbnzrjOla8GGw2k2bQa?=
 =?us-ascii?Q?MGdm9KRJeso2fDpR47DwYiE3PY/03baS0v/Kuea7FO8xIGSmYdqhcm0f3cS4?=
 =?us-ascii?Q?qhVTzAHHa+PGWCXZGMOxdQzmrY54JbviqlNETNVLtMJfVzBjqNMQz6hludGS?=
 =?us-ascii?Q?H4wArtA79PMva1bKNsVeaikWtiuDFFR2y2ZlFOkUP4g6+hgNqchOj3ekKZg+?=
 =?us-ascii?Q?s9S7rN6sCsuSpE002+t3Z34oTcJkBXpFmIEiaY1F7/nrHNMDZmVUXSj9mUvx?=
 =?us-ascii?Q?YqrH6ZDq9uRkovSpZek3Svo46CUz2k1dSCC7jpdZH6E9FAzCWqbXaRFTj40h?=
 =?us-ascii?Q?hEjddB6qNZC9Gv1gKy5+SqIrDuHIBSopI5BCMsbsprLXNvAfZ1cN2dc0NuIu?=
 =?us-ascii?Q?yQRKdpwUrL71RT3s7aXos04jq6X+k/RL8NcOQvLOjf7UvyjFegRKVu3Qfadz?=
 =?us-ascii?Q?Fo9E/DdjYG/XBWwXenimgoneD+QRiJX9KBUAYTB2KsNhy5skaL4paqyKyDX8?=
 =?us-ascii?Q?DWOTv2TEGJ1L8+eemv1Eac3uPkoBj+TFh6fb5CMnE5MEKGGK/hNM2XPqFhz8?=
 =?us-ascii?Q?eN2SCgOZNN59vkE3JmnIiQ49hR5nUDxhBmwpD1wbcdH7nIwOMOAYfviTAaum?=
 =?us-ascii?Q?gdqKoYSRrW+S47xKKLLP6K4e2mECYE0FsFqCah+3f1S+yC+5KjsEvl2VhInE?=
 =?us-ascii?Q?c//G9ujUL+p2Q7okLgH5phd9KatJ8t2qXMJBJkxtVDHW9/5bM/UYT2Dzm1D2?=
 =?us-ascii?Q?/PGFTgCsRIBZHSiD7i8rhcXkYPMUgglK6sCPNehHKvO0+VyjHHsCEcDKFJZz?=
 =?us-ascii?Q?4BZaf9PTrUhfej+YWpBQQiweKrcYIVF9QIKmon/BGNof+oHiUJDiuVUyaWPa?=
 =?us-ascii?Q?I+wwGWhKn7UxMp76/1v0jtskCRt8+5Uf1HQhZamWmEs2LTvY0SiWib2l22vE?=
 =?us-ascii?Q?3LeO3Pa44eADzWSPK7Lt+Tuh6MUZGVRQ?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:28:37.5842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6367426b-d031-45a1-6958-08dcce3d2464
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS8PR04MB8356
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

Revise duty cycle SMB11 and SMB16 to high: 40%, low: 60%,
to meet 400kHz-i2c clock low time spec (> 1.3 us) from EE request

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index c2994651e747..c940d23c8a4b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -761,6 +761,7 @@ eeprom@54 {
 &i2c10 {
 	status = "okay";
 	bus-frequency = <400000>;
+	i2c-clk-high-min-percent = <40>;
 	i2c-mux@74 {
 		compatible = "nxp,pca9544";
 		i2c-mux-idle-disconnect;
@@ -1314,6 +1315,7 @@ &i2c15 {
 	mctp-controller;
 	multi-master;
 	bus-frequency = <400000>;
+	i2c-clk-high-min-percent = <40>;
 
 	mctp@10 {
 		compatible = "mctp-i2c-controller";
-- 
2.25.1

