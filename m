Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E14897BA66
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Sep 2024 11:55:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7vCG2RMBz2yMk
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Sep 2024 19:55:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::628" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726653304;
	cv=pass; b=eyUAedK6P73YP7jLZyuGr+VGl2E7odrvTFYg2h45sFljWz5UpxHNmvntcUt0v9ldQDnZyah8A1MAhuRzAuaK3finbmWuxURosFAZk85wtTWWeyMhJi4tvGllEfOC4dcwjlMUvumi1isMk2aFeVpEcaRqqJZnlTRLt2GVrWQLRxwuUZDZtq+3LydkMU0TrP3fN+/INgW15yxgs4aOIjg3s29lGKd+qNZosrJGwI8V//h1D9yAH/uQ/z3rQ0w4GYADtkfPDkdGCPTKXnF/d9kFP7mlIaH/8YLvJuyt9FLFiFzyXqx8X8JlsJcAcPaoGXbqE0Cd9Rk198G4/BKPfoDa6A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726653304; c=relaxed/relaxed;
	bh=7m0wnkY79E+rq1Xji4rog/110+/dvCad1+WnaLGP72k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=asDRXrHGH6G+oAEU9PrRtocigE0rNYduDPHIJp+L+nsIb8jATDgqsg+CgZ9a69Lti4ItQ0Burp3tEbERk2iTJlR6UzXeqt98+18JokhBgDcW0P0/yJIEgQKL8U7OdVOSi3/JPy5WGnPy7r14qJR2gDbZp+obwVGh/7XKRBj+Eiw5gymAuif4Ftk+YvRxStbKSUVWUcIW2C5kVZhPvUQExno/JmGLZbPXBAd32sJDnDbqrFZMjoZHwHk4D+6G7uSfNJyUe9HjCqlroI2vC6C1qCuWR9b+3aK99+f/G41YJKjHQEB/JHEmUe5/KBMBWo2yFCG6sdMVxc0w3b6xAI2fIQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=gOeOXZ7A; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feae::628; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=gOeOXZ7A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::628; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X7vCD4tS3z2xPb
	for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Sep 2024 19:55:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfvt0J1SRxdffkaRx3cS2dXaDbZTRVNWwPsfVf8ttk/W39s5pG3x70vvyn68PR1EfPvKhTe0hH0CLLWik83iGLLVF1H11vPw8i3iDbvwPvuDTEi+LGhTHMhAMG55B2S+IyiHEf2BEhMA3QIInqGqJcAbJXRKtWmOnIVwWr9asW3cTU90Y2ke2zTCOoveTHJqznff3qRQtuL/a0+3HfyI1Yre23TUTElsFXrio6i8Ya7h0pWGaN1wSwnTTLSQLzYdBaR8WR/wOpRlvOej6a4eoQ/nazrIONex0fczQUHmNBRFW7+sUD0wGHVsIz7iH9cqvqJb6pQeZ8vzXThGYV4KFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7m0wnkY79E+rq1Xji4rog/110+/dvCad1+WnaLGP72k=;
 b=SXznKQ07FzhlqCYKYUb42oRPHkhga1VIFQvSLoCiiTEMEGtSfv8hRaYwegxGJ1VDq5jXOrlWzklylkzDCCsxVaAD4oqzrigw+LaQ0E5RyGqHN04jg4ywYaTSu1q1SnxUFNVfDtN+4ncnVe8C+wmlz76NgT6Y9OvGuG3e8hVcskw+JezNVqotQHUuhlde1kFMCi+EmvLxmjCWpDjIwoF/hYsJQif6KcQOjjlc1zMwJgBdrA5c/dIbiGEIv9Z5dLTLjuLtJlb7OZAE8B4FxXgr3AdVpznGpBQBSV5fquKaH1lqHnlnmrduyK78U5djIxNs9JLDRxLWQ494UCbciCiQhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7m0wnkY79E+rq1Xji4rog/110+/dvCad1+WnaLGP72k=;
 b=gOeOXZ7ANfNZblR+R6re/g+oHzziYZfqN9pJ1gRY50kOUXxc3842EFjcI+oC6+6TqV/7qol7PFrUnSJ8SlK0r89EdfVO3fLJnCbtAVoP6IICnxttWsA/AXawSPPWVyt8YOHPkdW0royaKDW0FT8b9zKcVnDbKU8+EvGlQWWjkRVSx0ahRDC+9hmHhlA1KDUUTig8xjrd8ee/ipn9KAO9KC8NW8w1Sjh55zrwipYIAxyZMiPeKUEvFtJXAHlf3NBjOLqpSbLHO+za8oCHj/ThMXL/MABzBIX5o1BT0XVYhwk7SGSqWJqPYogzikXsFr7TbZwru9Z46FqhkrCNICKo9g==
Received: from SG2PR01CA0130.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::34) by TYZPR04MB7280.apcprd04.prod.outlook.com
 (2603:1096:400:44f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 09:54:43 +0000
Received: from SG1PEPF000082E4.apcprd02.prod.outlook.com
 (2603:1096:4:40:cafe::42) by SG2PR01CA0130.outlook.office365.com
 (2603:1096:4:40::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.25 via Frontend
 Transport; Wed, 18 Sep 2024 09:54:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E4.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server id 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024
 09:54:41 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz
Subject: [PATCH v2 0/3] yosemite4: Add power module and ADC on Medusa Board
Date: Wed, 18 Sep 2024 17:54:33 +0800
Message-Id: <20240918095438.1345886-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E4:EE_|TYZPR04MB7280:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8cbc5783-0b12-4689-9890-08dcd7c7eb5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|36860700013|32650700017|82310400026|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?tP035RvE8f4zUI3U83Iom2TjQ+Aqnr4e9b6ZdxwAeggUkTaFbIhobEUOh7WV?=
 =?us-ascii?Q?hdIudR/EXh9enEImYaKYVDVMsMImqinto4LHdGQ1ZM/QU8i7WThv1o0WIOmj?=
 =?us-ascii?Q?aUgwm3lp2wNCTi8aGG9rwupjFif3vcW+2I7FpicjSeRAsM4zp90zVRyjkB7a?=
 =?us-ascii?Q?oJX3VSwV5WLfaCu7Pclpbx80RpkWhmm1kE842BVR8CAlIwtQEkPgssF9yb0h?=
 =?us-ascii?Q?PwoWi8jiFaq9rq2WL4aERts62ioGJ5so8V2LzGxGMZJHS+F1CZTvH2RdQPG6?=
 =?us-ascii?Q?cA6PyDhlSB+c85vcQvNDRpozPV/T9r0jxIdZx1hZ8IsR971EsC+64GbZib5P?=
 =?us-ascii?Q?s+2FauoY4+bKd4J8TBLjqi2u7g7+AaVDkLr8H5QfkSxt6eAT+jwbVRxvsP1d?=
 =?us-ascii?Q?ZPqju5DS7bRad1tIDPqu7lGOO17F0v/HpjROhqbK0OxIFsDrFvRngecabKjs?=
 =?us-ascii?Q?Cixr+P4Djj0JBARx3nGl6tNaiS04BkVPoJo2qYCerT7b9tYVFZ90w31B9Lby?=
 =?us-ascii?Q?5zUKehi/lKajKj0Ws+pLPN2L1dCDD0Jh97PhExsBNbmCMesoLLnE7ODE+Ktt?=
 =?us-ascii?Q?jkVSclTkGzDU3kJPHUlXy+43BOhGIEDqr286T8LBhs95QSm2L/XXUQr/CmDE?=
 =?us-ascii?Q?jykM5kENWlW1xmal8OOE4EnXCSjILGzb9Qly2AwQnlKyhO5BMlHR8yYfQC1X?=
 =?us-ascii?Q?xHlU86gPYfNHE+qplZE1um/DG3hmC4PGQWPwPBvpkD84RGVhiLZ/N072i6bs?=
 =?us-ascii?Q?aW+GECTYRRTc7qvwOWInrpHim+w7svX2agTqkn1uPjs4WXklbQnGf3WlU7+H?=
 =?us-ascii?Q?ge9K4xF9Dk/oEtPb8Kgc/5RBWMzZduVSk4u3C76i5OAoJwSjMmPQMvLAnX24?=
 =?us-ascii?Q?t6GfC4jmD2i2ZCDMf5JiKGWYQrmbwlN2Q07TqIid2uNpKxeHSvAF5tRuWJIb?=
 =?us-ascii?Q?81PG6xWhGQDDDn9u6jsmvsan5BTipAkgmydL6WNmOchXEp5Eq+xcRn6eBM/0?=
 =?us-ascii?Q?ouY4Cd0gDvNcVZw7aoVxV8e+wxlJ1bLtTZKywRvV0AlJCfYIkX874N5QMnW6?=
 =?us-ascii?Q?WyiUmbHb5KRC0vsHAMN0lvFQT1OBqxqP85jhzKIGVpTMxgR5xl0Pqj7YmGCp?=
 =?us-ascii?Q?5U+ys3C1mKwvz/OFheMaWLKbH/9VK6srx1Rt94B4iA/8QBzlOfho2AwvXw6B?=
 =?us-ascii?Q?yv221tFFqtYyEObG/FdX/uslM0DsnELQ2WnXzVfiqxPgPtPyWxTcx7dkdPv9?=
 =?us-ascii?Q?cgUeG1tmuOuf1v3Xr/KDcfEin6Gmo97sx4lGRrBq5Tn6jiy4/4QIzl+kLO5O?=
 =?us-ascii?Q?JcSHE22auonXl7TK7w8LzycfEg4JnUXawNRTpbcEjzPQEs/4EH2b6rIGj7CP?=
 =?us-ascii?Q?XVIqLsgTlmY9fiZzPDUk2yxpSE4ei63fVsNTXVEWljaePIOGsH2rzcQRWKdo?=
 =?us-ascii?Q?68ew+Ts9Bg+3atjymvc/n56WyZSNcVr4?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(376014)(36860700013)(32650700017)(82310400026)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 09:54:41.7167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cbc5783-0b12-4689-9890-08dcd7c7eb5d
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7280
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
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Peter Yin <peteryin.openbmc@gmail.com>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org, Noah Wang <noahwang.wang@outlook.com>, devicetree@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Changelog:
  - v2
    - Add pmbus compatible string in trivial-devices.
	- Add mp5023 compatible string in trivial-devices.
  - v1
    - Add power module and ADC on Medusa Board.

Ricky CX Wu (3):
  dt-bindings: trivial-devices: support pmbus compatible string
  dt-bindings: trivial-devices: support MPS MP5023
  ARM: dts: aspeed: yosemite4: Add power module and ADC on Medusa Board

 .../devicetree/bindings/trivial-devices.yaml  |  4 ++
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 45 ++++++++++++++++++-
 2 files changed, 47 insertions(+), 2 deletions(-)

-- 
2.25.1

