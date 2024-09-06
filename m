Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8CF96EA44
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 08:28:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0RB76yzwz3c5Z
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 16:28:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::610" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725604094;
	cv=pass; b=MYFmF1k3Qv+jc/H3ihEbEAuGIig9DCV8W4Ws2y/6Fm9JzamZXhD9ZaH1vKhWhFcgw4eY72PjjXNKLDNZ1XFkddGv9MPHzh9yKbo4iaho2DlxBpWgFJ6UEbNDJhQkMkVEsfKuZMh95tVKnehRrgtM0ImljbINab3AJu/PW2wZeXxWteCZhQkwKsM06LNQFBpPYlx0kNOB75q7lBkYjFaO29tLN/Lh0n+5WjOzFHV3O1ksE3mOCk+dwUW2LjNRcKwb21f6acJMPGoBlR4XAmVJ38BjqyXxsyMWtGHHGgMDY2SvvYVuxgyXapdfzdW9jsPXFpV04wnxBiyVPhZTGhKxtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725604094; c=relaxed/relaxed;
	bh=zQ8R9uD5dS2CYOtc4xvne6zIrhYDAk0BYpQGanDefRc=;
	h=ARC-Authentication-Results:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:Content-Type; b=ROVlcs9WUycWlRdFJxMOAmudWt8WPP1PSFvq+Tg4eAZuuZEUnC8kgRmHp3rH/wlHJZmeTQJ4yrbkXVwjYPQos9U4VERdnskQ12Y+k6o58EVFecsoh+QlZfDYzpb8a3ixXRy8iiNztFdhnVyeagX5sYGgBT3E36wVJe9Y30lhwn8t5ij2lWJ9gq+QaytXMuCX2N/Mf46naVXq+4kSlk0Hc1WASQCQTNhAxVc7f1f1aCq+0MXt4vrjt4e+xgjuZeMD44w49tadR3ESQCAyd+Tt6VjRJCpEG4vicU1I80v7uQHomjkoibWAETepNtM3X1UkX8qk0+IsHNB8rkd9m8mvow==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=WSZULuqG; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::610; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=WSZULuqG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::610; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20610.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0RB62rDqz3057
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2024 16:28:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBgAly2m47PXQgvUKxE7WDn+KdJxcfp7mCgBDJM2H6/VckOXoy05mqmeUNZ7sa8RBGI1wYVJRJNEP5W/VQ/2W0i3hQKyoW74PuZfukSTVOm5ps+Xz4M92N26ORt3PU/suMqZrqLl0fZtxqld5wm+kyUKhMPIjMSc99VMrQkzl9dydVCqRYy1/y8ZIQd2vRteAZM5bom+C6U4GG6XSoN7xXwhghgy3UQw6TFfEG0q/SA3TMBxBFao/a9w7UyXXLciemYQTe8SgMMUsFjD+MXR+uQ26692/7oDgNtXr6+DidBe2f4RfFZ9nwJj67HLVSXlgJmLFL5ntGQXyU8+Hh4lcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQ8R9uD5dS2CYOtc4xvne6zIrhYDAk0BYpQGanDefRc=;
 b=LKa7vzuV3GO0c2ftAmMZFOzvWeu3y107DKIN0TeFUt4iV0ZPsbQJXFJ7vpbzbtPMcmG2IMOS2tEzF6u/VCetO6OMKlcegr/5P8rCC3AT3eDCkdcNhhZnqkf7OZEQi25XSeIUN+IAXmKLhv7XmadDOY2F2WmoNJjCYJWmBjcIsqgZPW+GSEnkHJbE+QahySPWXtzaysuzFZJHsOcWY/dnpFHOzzyy9I7mD7McC33rZ9L/sRuN7BxzMq1hntmwTGgc2W/O0dEk8IqoIX59sBASPrtCTIkpUhH2pUl7n/guiC6L6L0p23xZBuA4ghNATbOl3ZqKdMwq5my5OtOLpZmyHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQ8R9uD5dS2CYOtc4xvne6zIrhYDAk0BYpQGanDefRc=;
 b=WSZULuqGydB+dwW2N9+q7/OStTLC/UpAQ0Y7uStadSZ5mOm/KaIMnPSBjTArp2giHXEAJK/rr6IPe/ZnPayGbkHKoTaNMA00bCqF+DjY+7MSjr7E2/4E8xRTEbXAkBCpKsFRZsmOrnCO4+SCsa66BNFYiMGuVWb0l14EZZ16BvgpYRSKhwJWAK1qmrJL5WIkTE/+x5xrYR4PGWqEi8UHMaFjGZB9KHaFlpqpZ6ayqutYp7jUqxNJDW/WEABNJNrEopo8LDjwUbeTm+2kYrxGZu02/1AmMdcLBBbljG6lx0++F8n+Mmv16DdsHI04/EU03uaVtt6rFoNOET0mYwrzqg==
Received: from PU1PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::18) by TYZPR04MB6786.apcprd04.prod.outlook.com
 (2603:1096:400:336::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 06:27:55 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::26) by PU1PR01CA0006.outlook.office365.com
 (2603:1096:803:15::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:27:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:27:54
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v15 12/32] ARM: dts: aspeed: yosemite4: Remove temperature sensor for yosemite4 schematic change
Date: Fri,  6 Sep 2024 14:26:38 +0800
Message-Id: <20240906062701.37088-13-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|TYZPR04MB6786:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 71b6c136-6481-45f8-fd2f-08dcce3d0af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?GC0aDshfGCjq9P/LK5iCpDHeGAXhMtUdU6dIfVussBVBZ6gB3QhUuhiWhQPi?=
 =?us-ascii?Q?S8nrHWs7aMPf0dCYVGUa+g2IjcZFR5EeuHs/4lD6r6jBbmHAqF+3qM6wabn7?=
 =?us-ascii?Q?rUANRCJV6w43qa1LvJu5K0pYVZk4GF2jJkL11Uje2FKqQnkpAF1XKud3Ukzy?=
 =?us-ascii?Q?7q2h5v7Ui2IMGXKDedyAWKlKT+BiGwVWH1OjNyH+6ucLmC9JT1Z/LqzI8OPf?=
 =?us-ascii?Q?ibZuwFthvb83eSDpkgITMxHPvcBGlt0EfLtcHzakqrtZWxscrHk8sCjrLUEH?=
 =?us-ascii?Q?WFDXL37/FAo4WCZqWBMOfLx75kcghPCyYofpyfclCz5iI3Oe1TPNXtDYV1j2?=
 =?us-ascii?Q?MVAKkwVgr0Zkl4kZI2v2O+aItCbRJD1XA3MebPaVqTkGx4qKZGY4R4q9GTww?=
 =?us-ascii?Q?PXRbwWENpp8yd0CCp6qQOs0gt6BZyCtRybbEKss3lfykMSpdfn854pg5Djjk?=
 =?us-ascii?Q?y81weeFzkf98Dcx5BnIBzZdYcVvjFV8axXsJTP4BguL2goT/aI8RHKuNNl2i?=
 =?us-ascii?Q?Dcbr7dy22t5OVH789wB6in/JjDJVt+vYATiXsA6AVHxhqtVZVcg4C2bLqIDb?=
 =?us-ascii?Q?bTSmHFm1pkRX9fABeXuQ9ZL+DUzJuo8sLcaD8+HlRxhpbicO3WgRPdz72dY6?=
 =?us-ascii?Q?kg8OeJsmxDbqMatY2OKqGpT5viRRZ54caSddfhk89IFGa6PBvE8tnXJUupmj?=
 =?us-ascii?Q?qy7cpQhZg7vKdCLvt70ADDsUmV3mVinuL2cuhVrVedcVlEO48hsb3O/0nE6L?=
 =?us-ascii?Q?v7vbPYYiopzY7tVoITJrvPGFGymSmg/r9+MCOBAbMjBae9XEuf82uoCbEJap?=
 =?us-ascii?Q?dt9gzRtcxJY/quLe6dawxSS8yXbCKp+TIzVL4ASbcZ5YqWjb0r1ODZyQRA1E?=
 =?us-ascii?Q?5UcPhgCJNvJLLTPzlh3wJuKvWU/8fsvCFtVdXPeCTO9CBqQLiyF5FP2PsXAP?=
 =?us-ascii?Q?t/ALEC5l4OR/ONK3h5VlYIJhHEJ4Vi/BlENaj3zlCOkc6ocOpw7qBHX8pNPf?=
 =?us-ascii?Q?ZGI9fLjhqtuv0ODHgpSqCs+TaCeaHhK1eM5FQWYbFnQ3Ig1ZErIiGk7luzvC?=
 =?us-ascii?Q?oGHsORnbpl6JRsHRKQGig2T4XtccZIdXlr5OaWK8q41Stn8fq6M4603UlGpP?=
 =?us-ascii?Q?MHMcnBlvTqGfXOK370NJydmmiPO1whMbAglhpBPJ+3aQykKrhFaKF7xE9kns?=
 =?us-ascii?Q?AxwgE2R9trWVpmcfzqWObfzXBSCpYVzqM5YYGvP9p/pxnjwgmLR9OPAwmYWz?=
 =?us-ascii?Q?WHbMIri+TNmnv4HoyhLI7aIzJuQvReIm8dxbaRwR8wCiQAWe+GgQv6QvQkiu?=
 =?us-ascii?Q?v3OPQ6fdbQcQB5mE0m/0ElajobNWhQMTdXe3KRxxKYfPk3TnPSk+oSG+544z?=
 =?us-ascii?Q?jo+bJ6z1MbdSBjCCvfOgE8lRzgJoETFnuZITrFBE9l+wxDV6XSR3nW2DC3DB?=
 =?us-ascii?Q?krZJf4xyRQG8GioSICclE2xYxhqfgHY/?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:27:54.8500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b6c136-6481-45f8-fd2f-08dcce3d0af9
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB6786
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

Remove temperature sensor for yosemite4 schematic change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index e83cb51ac19d..2c0c37b3ee5b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -921,16 +921,6 @@ temperature-sensor@49 {
 		reg = <0x49>;
 	};
 
-	temperature-sensor@4a {
-		compatible = "ti,tmp75";
-		reg = <0x4a>;
-	};
-
-	temperature-sensor@4b {
-		compatible = "ti,tmp75";
-		reg = <0x4b>;
-	};
-
 	eeprom@54 {
 		compatible = "atmel,24c128";
 		reg = <0x54>;
-- 
2.25.1

